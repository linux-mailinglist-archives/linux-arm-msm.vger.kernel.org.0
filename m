Return-Path: <linux-arm-msm+bounces-69403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDFCB28602
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 20:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C2D756751D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 18:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54276317714;
	Fri, 15 Aug 2025 18:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cd65K9yK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD3B25525F;
	Fri, 15 Aug 2025 18:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755283791; cv=none; b=X6vbgGrkaXRltZqicRdNlkWlnwh5oERbHaLigDnBxdAPSuhQUr1/43kAht8lnw3xQbtSugx1tx+J6S8ho5CKqL0yJmJ3h4u4ztWaPsnR3474Njvlx/kXRAq3V8tnGlyl7kYYFk8FafmdiQYVpTJlEmE2ftYOuyOAGtafTgs8XCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755283791; c=relaxed/simple;
	bh=V2D9SEStB+O0nYlKe5bPvHOxW0NSGxEZHl28JMyA/aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIrYRfumeBbS5VT5GgOATGVdjInpW3BZYKh84mOjZqBTx1+1lzWHvENkYNI2RgiRfQumvL4p01lxWM+UEuGmFTOrETUUTenf2gdr4HbHG37psDnvwBkwk9IO5CTijvbNR4AQZA9zqHaelODJg5oJd70Oi8/EuNnppt5oS1srU2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cd65K9yK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755283788; x=1786819788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V2D9SEStB+O0nYlKe5bPvHOxW0NSGxEZHl28JMyA/aE=;
  b=Cd65K9yKk1LqWllm5j63dd1XQLRAvA9Sjf4AIGZTik8C8XyGGIY+OQIB
   R6m9tne+Wnf63AOXvmAxPJarXIXHQy5sN+vCynkaU3pzj6P9+ClPQDBSX
   Mwdt1QLmjgNaQVjoKGX1ZOyiBI37AmCyay91U60+4cVTllxBeFeEB9fEe
   O51hc6sc3SKRAjU7AxADH1TRKzFiCmF1BI/sj0wBTgQXENnIRYvpehUx5
   X4u407hN4fvJYyScOkaRj92U8HIFEqq8+jjxeKtvu9xkJdD0C37bFnkSt
   y6MW4DWj9XkML9ErK3W6BbhhNNOJbTGDVoUcki7aPsDXDY5HSt5EA94nA
   g==;
X-CSE-ConnectionGUID: e57CkGJQRtqv6dcG6hAA6w==
X-CSE-MsgGUID: jF7NYw/eRXKAJdxhuJWd1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68210793"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68210793"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 11:49:48 -0700
X-CSE-ConnectionGUID: uj+7DBv+R0+LlDNHHBSuGg==
X-CSE-MsgGUID: 7CaBW75cR1+v6NCJlxhKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166290714"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Aug 2025 11:49:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umzUS-000CFa-2D;
	Fri, 15 Aug 2025 18:49:31 +0000
Date: Sat, 16 Aug 2025 02:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>, linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_bt@quicinc.com,
	Shuai Zhang <quic_shuaz@quicinc.com>
Subject: Re: [PATCH v4 1/4] driver: bluetooth: hci_qca: fix ssr fail when
 BT_EN is pulled up by hw
Message-ID: <202508160256.bnZz7iPY-lkp@intel.com>
References: <20250814124704.2531811-2-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814124704.2531811-2-quic_shuaz@quicinc.com>

Hi Shuai,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on bluetooth/master linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Zhang/driver-bluetooth-hci_qca-fix-ssr-fail-when-BT_EN-is-pulled-up-by-hw/20250814-205127
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20250814124704.2531811-2-quic_shuaz%40quicinc.com
patch subject: [PATCH v4 1/4] driver: bluetooth: hci_qca: fix ssr fail when BT_EN is pulled up by hw
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20250816/202508160256.bnZz7iPY-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160256.bnZz7iPY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160256.bnZz7iPY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:23,
                    from drivers/bluetooth/hci_qca.c:18:
   drivers/bluetooth/hci_qca.c: In function 'qca_hw_error':
>> drivers/bluetooth/hci_qca.c:1664:60: error: 'struct hci_dev' has no member named 'quirks'
    1664 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                            ^~
   include/linux/bitops.h:44:44: note: in definition of macro 'bitop'
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   drivers/bluetooth/hci_qca.c:1664:14: note: in expansion of macro 'test_bit'
    1664 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |              ^~~~~~~~
>> drivers/bluetooth/hci_qca.c:1664:60: error: 'struct hci_dev' has no member named 'quirks'
    1664 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                            ^~
   include/linux/bitops.h:45:23: note: in definition of macro 'bitop'
      45 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   drivers/bluetooth/hci_qca.c:1664:14: note: in expansion of macro 'test_bit'
    1664 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |              ^~~~~~~~
>> drivers/bluetooth/hci_qca.c:1664:60: error: 'struct hci_dev' has no member named 'quirks'
    1664 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                            ^~
   include/linux/bitops.h:46:57: note: in definition of macro 'bitop'
      46 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   drivers/bluetooth/hci_qca.c:1664:14: note: in expansion of macro 'test_bit'
    1664 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |              ^~~~~~~~
>> drivers/bluetooth/hci_qca.c:1664:60: error: 'struct hci_dev' has no member named 'quirks'
    1664 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                            ^~
   include/linux/bitops.h:47:24: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   drivers/bluetooth/hci_qca.c:1664:14: note: in expansion of macro 'test_bit'
    1664 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |              ^~~~~~~~
>> drivers/bluetooth/hci_qca.c:1664:60: error: 'struct hci_dev' has no member named 'quirks'
    1664 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                            ^~
   include/linux/bitops.h:47:39: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   drivers/bluetooth/hci_qca.c:1664:14: note: in expansion of macro 'test_bit'
    1664 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |              ^~~~~~~~


vim +1664 drivers/bluetooth/hci_qca.c

  1609	
  1610	static void qca_hw_error(struct hci_dev *hdev, u8 code)
  1611	{
  1612		struct hci_uart *hu = hci_get_drvdata(hdev);
  1613		struct qca_data *qca = hu->priv;
  1614	
  1615		set_bit(QCA_SSR_TRIGGERED, &qca->flags);
  1616		set_bit(QCA_HW_ERROR_EVENT, &qca->flags);
  1617		bt_dev_info(hdev, "mem_dump_status: %d", qca->memdump_state);
  1618	
  1619		if (qca->memdump_state == QCA_MEMDUMP_IDLE) {
  1620			/* If hardware error event received for other than QCA
  1621			 * soc memory dump event, then we need to crash the SOC
  1622			 * and wait here for 8 seconds to get the dump packets.
  1623			 * This will block main thread to be on hold until we
  1624			 * collect dump.
  1625			 */
  1626			set_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
  1627			qca_send_crashbuffer(hu);
  1628			qca_wait_for_dump_collection(hdev);
  1629		} else if (qca->memdump_state == QCA_MEMDUMP_COLLECTING) {
  1630			/* Let us wait here until memory dump collected or
  1631			 * memory dump timer expired.
  1632			 */
  1633			bt_dev_info(hdev, "waiting for dump to complete");
  1634			qca_wait_for_dump_collection(hdev);
  1635		}
  1636	
  1637		mutex_lock(&qca->hci_memdump_lock);
  1638		if (qca->memdump_state != QCA_MEMDUMP_COLLECTED) {
  1639			bt_dev_err(hu->hdev, "clearing allocated memory due to memdump timeout");
  1640			hci_devcd_abort(hu->hdev);
  1641			if (qca->qca_memdump) {
  1642				kfree(qca->qca_memdump);
  1643				qca->qca_memdump = NULL;
  1644			}
  1645			qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
  1646			cancel_delayed_work(&qca->ctrl_memdump_timeout);
  1647		}
  1648		mutex_unlock(&qca->hci_memdump_lock);
  1649	
  1650		if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT ||
  1651		    qca->memdump_state == QCA_MEMDUMP_COLLECTED) {
  1652			cancel_work_sync(&qca->ctrl_memdump_evt);
  1653			skb_queue_purge(&qca->rx_memdump_q);
  1654		}
  1655	
  1656		/*
  1657		 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
  1658		 * hardware and always stays high, driver cannot control the bt_en pin.
  1659		 * As a result, during SSR(SubSystem Restart), QCA_SSR_TRIGGERED and
  1660		 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
  1661		 * command timeout.
  1662		 * Add an msleep delay to ensure controller completes the SSR process.
  1663		 */
> 1664		if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
  1665			clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
  1666			clear_bit(QCA_IBS_DISABLED, &qca->flags);
  1667			msleep(50);
  1668		}
  1669	
  1670		clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
  1671	}
  1672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

