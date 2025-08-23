Return-Path: <linux-arm-msm+bounces-70472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02520B32830
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 12:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA21EAA4CE7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 10:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF00242D7A;
	Sat, 23 Aug 2025 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LqjGcKMF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B423BCE2;
	Sat, 23 Aug 2025 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755944461; cv=none; b=NB8qZEbuK+HE34IhbUyxxgF17cqq1vmeZBewQMh17tCqCrpnRUlmmA2laZOCn3HHYYmxOVwifdinKRrmobG3+pG8hdORlJdrHzlkCeIh/Tv336xnpfxkLI2sSu4H0XpdLbyCFkWcQPc/PHXqy/RmoketJtfFCTZ4vlEJ6s7TXtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755944461; c=relaxed/simple;
	bh=LQ4AAU4YwamuUbEKelxXl8ERxFFvlMTb1YOhXFwln/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXrTYnOm1IycssF4Iv8WxIZzlqIBi23rUEVD3breNk9EYO6AG46eZkpVJUiNYKMg6Mt7ic+lCCd2uEiIXBd8PFg+t5OzJbecm1hbR7MhSu2JvLEoUYOgbYCIvur1u4fdg7yfr4dd6MVp3Jbsh8isIVpupShwyEg/jzpSE8prh1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LqjGcKMF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755944459; x=1787480459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LQ4AAU4YwamuUbEKelxXl8ERxFFvlMTb1YOhXFwln/s=;
  b=LqjGcKMFuHXSsB9U+05ukdgKMzphgcKxB5clG4lZw91LR5gcaQ3YmXgE
   8gW3AFUoilexxGiOXQQxwq7KDdntxFhmsZgU0oXNCozQLzm3g6j8cwLIL
   ePU6J4Pr1dj4eOjczlFN0h0JRPy6d4j4scx3bbqxmxjaPyMnxER4pZc/z
   /4wWul98cRUD/fLdi2SsqCxeVBM7Vi71Zzj5SFi5NkPZnb8rR3KeLEIkB
   G9mxdh3loJ6NDl3lBcGK2KFyAC4uaUIlGcRy4g3OnIJc4MgAZSPVPvRyH
   QdA8e2eBJwBkxVjree+w1eUsk4uVyRjPOgWRHMS5EzOKZHZfTMdlVM28R
   A==;
X-CSE-ConnectionGUID: QFTycmJiTAupzr5ZIqUuWw==
X-CSE-MsgGUID: C770GAHxQW68pGxWSRKjXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58160295"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58160295"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 03:20:58 -0700
X-CSE-ConnectionGUID: uqPKdRxDREKunnAKKh80Nw==
X-CSE-MsgGUID: TQG27snNS4+msiYN+wUoNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169090353"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Aug 2025 03:20:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uplMk-000MFb-1f;
	Sat, 23 Aug 2025 10:20:54 +0000
Date: Sat, 23 Aug 2025 18:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>, linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_bt@quicinc.com,
	Shuai Zhang <quic_shuaz@quicinc.com>
Subject: Re: [PATCH v5] Fix SSR(SubSystem Restart) fail when BT_EN is pulled
 up by hw
Message-ID: <202508231806.zApKGtbH-lkp@intel.com>
References: <20250820120641.1622351-1-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820120641.1622351-1-quic_shuaz@quicinc.com>

Hi Shuai,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on bluetooth/master linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Zhang/Fix-SSR-SubSystem-Restart-fail-when-BT_EN-is-pulled-up-by-hw/20250820-200925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20250820120641.1622351-1-quic_shuaz%40quicinc.com
patch subject: [PATCH v5] Fix SSR(SubSystem Restart) fail when BT_EN is pulled up by hw
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250823/202508231806.zApKGtbH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231806.zApKGtbH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231806.zApKGtbH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bluetooth/hci_qca.c:1669:55: error: no member named 'quirks' in 'struct hci_dev'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                        ~~~~  ^
>> drivers/bluetooth/hci_qca.c:1669:55: error: no member named 'quirks' in 'struct hci_dev'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                        ~~~~  ^
>> drivers/bluetooth/hci_qca.c:1669:55: error: no member named 'quirks' in 'struct hci_dev'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                        ~~~~  ^
>> drivers/bluetooth/hci_qca.c:1669:55: error: no member named 'quirks' in 'struct hci_dev'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                        ~~~~  ^
>> drivers/bluetooth/hci_qca.c:1669:55: error: no member named 'quirks' in 'struct hci_dev'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                        ~~~~  ^
   5 errors generated.


vim +1669 drivers/bluetooth/hci_qca.c

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
  1663		 *
  1664		 * Host will not download the firmware after SSR, controller to remain
  1665		 * in the IBS_WAKE state, and the host needs to synchronize with it
  1666		 *
  1667		 * Since the bluetooth chip has been reset, clear the memdump state.
  1668		 */
> 1669		if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
  1670			/*
  1671			 * When the SSR (Sub-System Restart) duration exceeds 2 seconds,
  1672			 * it triggers host tx_idle_delay, which sets host TX state
  1673			 * to sleep. Reset tx_idle_timer after SSR to prevent
  1674			 * host enter TX IBS_Sloeep mode.
  1675			 */
  1676			mod_timer(&qca->tx_idle_timer, jiffies +
  1677					  msecs_to_jiffies(qca->tx_idle_delay));
  1678			msleep(50);
  1679	
  1680			clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
  1681			clear_bit(QCA_IBS_DISABLED, &qca->flags);
  1682	
  1683			qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
  1684			qca->memdump_state = QCA_MEMDUMP_IDLE;
  1685		}
  1686	
  1687		clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
  1688	}
  1689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

