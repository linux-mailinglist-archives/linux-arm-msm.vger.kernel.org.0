Return-Path: <linux-arm-msm+bounces-71463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 471FAB3F0FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 00:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAA1E1A87DC8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 22:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716BE284689;
	Mon,  1 Sep 2025 22:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0shQsl3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F89223DF0;
	Mon,  1 Sep 2025 22:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756765464; cv=none; b=pzwpFfWXvhyYHQXMVExneIYNJoa5P2oT1e3AfGDORHjF0M7pakPDDGJuthwn3XPcgcUJOziFNwihu8Uj7EPIGB+Q3h/gmBOQwF3uozkvGsL1qe0DzVTb3iMbvcH/Ux61nzM0R0mud0erok3yrHInSHwuBMW/MsMODOIAfOTuzzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756765464; c=relaxed/simple;
	bh=CskA38wb5TYBMTOWHKn53pBQvrb2Cqr8nEqyhWL8n4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTLn5se+XC8qHrqDvANXbG23L00/+iKF6WWicpRaoiSS9+syBiDQ+yXwgDyg+wryxPKeGCkttHAl70P6POm/99+G4rb/WXYt5fFNzYq1Imk1CXjn/FtP158YiGrxavZ8DZ9s1al9mX3h9sL+F/xaC186z8B5nFSYpW3RWbRbX9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0shQsl3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756765463; x=1788301463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CskA38wb5TYBMTOWHKn53pBQvrb2Cqr8nEqyhWL8n4g=;
  b=Q0shQsl3IwPBaFu+j3FE7P6O3IcfmQCFZQcxwFLH1ujCVy0ZQxRAUr2F
   d1z9DURlmCN5Hnlnv/52AuZrE0c9XNdb2t8wZn1Y/0ODQ9dynAudX8Jl3
   8eAMl+xEAPDx7+ptgRTvN7v9LIA7g1Yub7+Y4PiRos2jIi1gLDi3LVcRu
   Vd9Uci952OcbGKwZJ2RKSZQ9MgEeNmzXgtBhiHXk5lm06Lf+d5cKCboKm
   rvZgvmIebHjI1lmcFHZ+eUyij0kyqz8X20VPGfUYedK7iJ9YeJK50ZLH9
   aGifeJjfdZFtXvZIKDKSZcXk3Kwqa0v1s3FNXQKxut5cNMldkPiWRsawq
   Q==;
X-CSE-ConnectionGUID: FVhjejy6R+WfCiOAHadMtw==
X-CSE-MsgGUID: 72Tfb4Q9QamuLrD5Sn81YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="61658590"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="61658590"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 15:24:22 -0700
X-CSE-ConnectionGUID: /xEQ8/f7TUWFmYMfhjrGyQ==
X-CSE-MsgGUID: Iw9JlJZiTq2aEIhcNBW5QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170376345"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2025 15:24:19 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utCwe-00019b-0t;
	Mon, 01 Sep 2025 22:24:13 +0000
Date: Tue, 2 Sep 2025 06:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>, dmitry.baryshkov@oss.qualcomm.com,
	marcel@holtmann.org, luiz.dentz@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-bluetooth@vger.kernel.org,
	stable@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com,
	Shuai Zhang <quic_shuaz@quicinc.com>
Subject: Re: [PATCH v8] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail
 when BT_EN is pulled up by hw
Message-ID: <202509020557.cSBn6IwZ-lkp@intel.com>
References: <20250822123605.757306-1-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822123605.757306-1-quic_shuaz@quicinc.com>

Hi Shuai,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on bluetooth-next/master linus/master v6.17-rc4 next-20250901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Zhang/Bluetooth-hci_qca-Fix-SSR-SubSystem-Restart-fail-when-BT_EN-is-pulled-up-by-hw/20250822-203836
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20250822123605.757306-1-quic_shuaz%40quicinc.com
patch subject: [PATCH v8] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250902/202509020557.cSBn6IwZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020557.cSBn6IwZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020557.cSBn6IwZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:23,
                    from drivers/bluetooth/hci_qca.c:18:
   drivers/bluetooth/hci_qca.c: In function 'qca_hw_error':
>> drivers/bluetooth/hci_qca.c:1669:60: error: 'struct hci_dev' has no member named 'quirks'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                            ^~
   include/linux/bitops.h:44:44: note: in definition of macro 'bitop'
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   drivers/bluetooth/hci_qca.c:1669:14: note: in expansion of macro 'test_bit'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |              ^~~~~~~~
>> drivers/bluetooth/hci_qca.c:1669:60: error: 'struct hci_dev' has no member named 'quirks'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                            ^~
   include/linux/bitops.h:45:23: note: in definition of macro 'bitop'
      45 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   drivers/bluetooth/hci_qca.c:1669:14: note: in expansion of macro 'test_bit'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |              ^~~~~~~~
>> drivers/bluetooth/hci_qca.c:1669:60: error: 'struct hci_dev' has no member named 'quirks'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                            ^~
   include/linux/bitops.h:46:57: note: in definition of macro 'bitop'
      46 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   drivers/bluetooth/hci_qca.c:1669:14: note: in expansion of macro 'test_bit'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |              ^~~~~~~~
>> drivers/bluetooth/hci_qca.c:1669:60: error: 'struct hci_dev' has no member named 'quirks'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                            ^~
   include/linux/bitops.h:47:24: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   drivers/bluetooth/hci_qca.c:1669:14: note: in expansion of macro 'test_bit'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |              ^~~~~~~~
>> drivers/bluetooth/hci_qca.c:1669:60: error: 'struct hci_dev' has no member named 'quirks'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |                                                            ^~
   include/linux/bitops.h:47:39: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   drivers/bluetooth/hci_qca.c:1669:14: note: in expansion of macro 'test_bit'
    1669 |         if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
         |              ^~~~~~~~


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
  1659		 * As a result, during SSR (SubSystem Restart), QCA_SSR_TRIGGERED and
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
  1671			 * When the SSR (SubSystem Restart) duration exceeds 2 seconds,
  1672			 * it triggers host tx_idle_delay, which sets host TX state
  1673			 * to sleep. Reset tx_idle_timer after SSR to prevent
  1674			 * host enter TX IBS_Sleep mode.
  1675			 */
  1676			mod_timer(&qca->tx_idle_timer, jiffies +
  1677					  msecs_to_jiffies(qca->tx_idle_delay));
  1678	
  1679			/* Controller reset completion time is 50ms */
  1680			msleep(50);
  1681	
  1682			clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
  1683			clear_bit(QCA_IBS_DISABLED, &qca->flags);
  1684	
  1685			qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
  1686			qca->memdump_state = QCA_MEMDUMP_IDLE;
  1687		}
  1688	
  1689		clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
  1690	}
  1691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

