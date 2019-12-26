Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDAF12AFC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 00:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfLZXdW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 18:33:22 -0500
Received: from mga17.intel.com ([192.55.52.151]:9568 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725909AbfLZXdW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 18:33:22 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Dec 2019 15:33:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,360,1571727600"; 
   d="scan'208";a="268949214"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Dec 2019 15:33:20 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1ikcd5-000AUr-UM; Fri, 27 Dec 2019 07:33:19 +0800
Date:   Fri, 27 Dec 2019 07:33:12 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     kbuild-all@lists.01.org, marcel@holtmann.org,
        johan.hedberg@gmail.com, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rocky Liao <rjliao@codeaurora.org>
Subject: Re: [PATCH v1 4/4] Bluetooth: hci_qca: Add HCI command timeout
 handling
Message-ID: <201912270755.L7a9SOof%lkp@intel.com>
References: <20191225060317.5258-4-rjliao@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191225060317.5258-4-rjliao@codeaurora.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on linux/master linus/master v5.5-rc3 next-20191220]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Rocky-Liao/Bluetooth-hci_qca-Add-QCA-Rome-power-off-support-to-the-qca_power_off/20191226-050217
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-129-g341daf20-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/bluetooth/hci_qca.c:1504:9: sparse: sparse: no member 'cmd_timeout_cnt' in struct qca_data
   drivers/bluetooth/hci_qca.c:1506:16: sparse: sparse: no member 'cmd_timeout_cnt' in struct qca_data
>> drivers/bluetooth/hci_qca.c:1346:35: sparse: sparse: incorrect type in assignment (incompatible argument 1 (different base types))
>> drivers/bluetooth/hci_qca.c:1346:35: sparse:    expected void ( *cmd_timeout )( ... )
>> drivers/bluetooth/hci_qca.c:1346:35: sparse:    got void ( * )( ... )
   drivers/bluetooth/hci_qca.c:1347:20: sparse: sparse: no member 'cmd_timeout_cnt' in struct qca_data

vim +1346 drivers/bluetooth/hci_qca.c

  1264	
  1265	static int qca_setup(struct hci_uart *hu)
  1266	{
  1267		struct hci_dev *hdev = hu->hdev;
  1268		struct qca_data *qca = hu->priv;
  1269		struct qca_serdev *qcadev;
  1270		unsigned int speed, qca_baudrate = QCA_BAUDRATE_115200;
  1271		unsigned int init_retry_count = 0;
  1272		enum qca_btsoc_type soc_type = qca_soc_type(hu);
  1273		const char *firmware_name = qca_get_firmware_name(hu);
  1274		int ret;
  1275		int soc_ver = 0;
  1276	
  1277		ret = qca_check_speeds(hu);
  1278		if (ret)
  1279			return ret;
  1280	
  1281		/* Patch downloading has to be done without IBS mode */
  1282		clear_bit(QCA_IBS_ENABLED, &qca->flags);
  1283	
  1284		/* Enable controller to do both LE scan and BR/EDR inquiry
  1285		 * simultaneously.
  1286		 */
  1287		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
  1288	
  1289	retry:
  1290		if (qca_is_wcn399x(soc_type)) {
  1291			bt_dev_info(hdev, "setting up wcn3990");
  1292	
  1293			/* Enable NON_PERSISTENT_SETUP QUIRK to ensure to execute
  1294			 * setup for every hci up.
  1295			 */
  1296			set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
  1297			set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
  1298			hu->hdev->shutdown = qca_power_off;
  1299			ret = qca_wcn3990_init(hu);
  1300			if (ret)
  1301				return ret;
  1302	
  1303			ret = qca_read_soc_version(hdev, &soc_ver, soc_type);
  1304			if (ret)
  1305				return ret;
  1306		} else {
  1307			bt_dev_info(hdev, "ROME setup");
  1308			if (hu->serdev) {
  1309				/* Enable NON_PERSISTENT_SETUP QUIRK to ensure to
  1310				 * execute setup for every hci up.
  1311				 */
  1312				set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
  1313				hu->hdev->shutdown = qca_power_off;
  1314				qcadev = serdev_device_get_drvdata(hu->serdev);
  1315				gpiod_set_value_cansleep(qcadev->bt_en, 1);
  1316				/* Controller needs time to bootup. */
  1317				msleep(150);
  1318			}
  1319			qca_set_speed(hu, QCA_INIT_SPEED);
  1320		}
  1321	
  1322		/* Setup user speed if needed */
  1323		speed = qca_get_speed(hu, QCA_OPER_SPEED);
  1324		if (speed) {
  1325			ret = qca_set_speed(hu, QCA_OPER_SPEED);
  1326			if (ret)
  1327				return ret;
  1328	
  1329			qca_baudrate = qca_get_baudrate_value(speed);
  1330		}
  1331	
  1332		if (!qca_is_wcn399x(soc_type)) {
  1333			/* Get QCA version information */
  1334			ret = qca_read_soc_version(hdev, &soc_ver, soc_type);
  1335			if (ret)
  1336				return ret;
  1337		}
  1338	
  1339		bt_dev_info(hdev, "QCA controller version 0x%08x", soc_ver);
  1340		/* Setup patch / NVM configurations */
  1341		ret = qca_uart_setup(hdev, qca_baudrate, soc_type, soc_ver,
  1342				firmware_name);
  1343		if (!ret) {
  1344			set_bit(QCA_IBS_ENABLED, &qca->flags);
  1345			qca_debugfs_init(hdev);
> 1346			hdev->cmd_timeout = qca_cmd_timeout;
  1347			qca->cmd_timeout_cnt = 0;
  1348		} else if (ret == -ENOENT) {
  1349			/* No patch/nvm-config found, run with original fw/config */
  1350			ret = 0;
  1351		} else if (ret == -EAGAIN) {
  1352			/*
  1353			 * Userspace firmware loader will return -EAGAIN in case no
  1354			 * patch/nvm-config is found, so run with original fw/config.
  1355			 */
  1356			ret = 0;
  1357		} else {
  1358			if (init_retry_count < QCA_MAX_INIT_RETRY_COUNT) {
  1359				qca_power_off(hdev);
  1360				if (hu->serdev) {
  1361					serdev_device_close(hu->serdev);
  1362					ret = serdev_device_open(hu->serdev);
  1363					if (ret) {
  1364						bt_dev_err(hu->hdev, "open port fail");
  1365						return ret;
  1366					}
  1367				}
  1368				init_retry_count++;
  1369				goto retry;
  1370			}
  1371		}
  1372	
  1373		/* Setup bdaddr */
  1374		if (qca_is_wcn399x(soc_type))
  1375			hu->hdev->set_bdaddr = qca_set_bdaddr;
  1376		else
  1377			hu->hdev->set_bdaddr = qca_set_bdaddr_rome;
  1378	
  1379		return ret;
  1380	}
  1381	
  1382	static const struct hci_uart_proto qca_proto = {
  1383		.id		= HCI_UART_QCA,
  1384		.name		= "QCA",
  1385		.manufacturer	= 29,
  1386		.init_speed	= 115200,
  1387		.oper_speed	= 3000000,
  1388		.open		= qca_open,
  1389		.close		= qca_close,
  1390		.flush		= qca_flush,
  1391		.setup		= qca_setup,
  1392		.recv		= qca_recv,
  1393		.enqueue	= qca_enqueue,
  1394		.dequeue	= qca_dequeue,
  1395	};
  1396	
  1397	static const struct qca_vreg_data qca_soc_data_wcn3990 = {
  1398		.soc_type = QCA_WCN3990,
  1399		.vregs = (struct qca_vreg []) {
  1400			{ "vddio", 15000  },
  1401			{ "vddxo", 80000  },
  1402			{ "vddrf", 300000 },
  1403			{ "vddch0", 450000 },
  1404		},
  1405		.num_vregs = 4,
  1406	};
  1407	
  1408	static const struct qca_vreg_data qca_soc_data_wcn3991 = {
  1409		.soc_type = QCA_WCN3991,
  1410		.vregs = (struct qca_vreg []) {
  1411			{ "vddio", 15000  },
  1412			{ "vddxo", 80000  },
  1413			{ "vddrf", 300000 },
  1414			{ "vddch0", 450000 },
  1415		},
  1416		.num_vregs = 4,
  1417	};
  1418	
  1419	static const struct qca_vreg_data qca_soc_data_wcn3998 = {
  1420		.soc_type = QCA_WCN3998,
  1421		.vregs = (struct qca_vreg []) {
  1422			{ "vddio", 10000  },
  1423			{ "vddxo", 80000  },
  1424			{ "vddrf", 300000 },
  1425			{ "vddch0", 450000 },
  1426		},
  1427		.num_vregs = 4,
  1428	};
  1429	
  1430	static void qca_power_shutdown(struct hci_uart *hu)
  1431	{
  1432		struct qca_serdev *qcadev;
  1433		struct qca_data *qca = hu->priv;
  1434		unsigned long flags;
  1435	
  1436		qcadev = serdev_device_get_drvdata(hu->serdev);
  1437	
  1438		/* From this point we go into power off state. But serial port is
  1439		 * still open, stop queueing the IBS data and flush all the buffered
  1440		 * data in skb's.
  1441		 */
  1442		spin_lock_irqsave(&qca->hci_ibs_lock, flags);
  1443		clear_bit(QCA_IBS_ENABLED, &qca->flags);
  1444		qca_flush(hu);
  1445		spin_unlock_irqrestore(&qca->hci_ibs_lock, flags);
  1446	
  1447		host_set_baudrate(hu, 2400);
  1448		qca_send_power_pulse(hu, false);
  1449		qca_regulator_disable(qcadev);
  1450	}
  1451	
  1452	static int qca_power_off(struct hci_dev *hdev)
  1453	{
  1454		struct hci_uart *hu = hci_get_drvdata(hdev);
  1455		struct qca_serdev *qcadev;
  1456		enum qca_btsoc_type soc_type = qca_soc_type(hu);
  1457	
  1458		if (qca_is_wcn399x(soc_type)) {
  1459			/* Perform pre shutdown command */
  1460			qca_send_pre_shutdown_cmd(hdev);
  1461	
  1462			usleep_range(8000, 10000);
  1463	
  1464			qca_power_shutdown(hu);
  1465		} else {
  1466			if (hu->serdev) {
  1467				qcadev = serdev_device_get_drvdata(hu->serdev);
  1468	
  1469				gpiod_set_value_cansleep(qcadev->bt_en, 0);
  1470	
  1471				usleep_range(8000, 10000);
  1472			}
  1473		}
  1474	
  1475		return 0;
  1476	}
  1477	
  1478	static int qca_send_btsoc_dump_cmd(struct hci_uart *hu)
  1479	{
  1480		int err = 0;
  1481		struct sk_buff *skb = NULL;
  1482		struct qca_data *qca = hu->priv;
  1483	
  1484		BT_DBG("hu %p sending btsoc dump command", hu);
  1485	
  1486		skb = bt_skb_alloc(1, GFP_ATOMIC);
  1487		if (!skb) {
  1488			BT_ERR("Failed to allocate memory for qca dump command");
  1489			return -ENOMEM;
  1490		}
  1491	
  1492		skb_put_u8(skb, QCA_BTSOC_DUMP_CMD);
  1493	
  1494		skb_queue_tail(&qca->txq, skb);
  1495	
  1496		return err;
  1497	}
  1498	
  1499	
  1500	static void qca_cmd_timeout(struct hci_uart *hu)
  1501	{
  1502		struct qca_data *qca = hu->priv;
  1503	
> 1504		BT_ERR("hu %p hci cmd timeout count=0x%x", hu, ++qca->cmd_timeout_cnt);
  1505	
  1506		if (qca->cmd_timeout_cnt >= QCA_MAX_CMD_TIMEOUT_COUNT)
  1507			qca_send_btsoc_dump_cmd(hu);
  1508	}
  1509	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
