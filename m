Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEC831F5F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 09:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhBSIiv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 03:38:51 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:37900 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhBSIif (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 03:38:35 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11J8ZhxA048999;
        Fri, 19 Feb 2021 08:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=mNYArt076huHzUgcx+TlL9FknwatDxtfQD9Ku0EZ2k8=;
 b=VYsYPM8WSJgEyuMWtqTuX/rVcz4X6H6DA62W1ID7KwC/WtV57DgXJgyW8BGbD5/FBRqB
 vV0gOa6kUUJR4ZQGPT4ASLi5d4WKImmxnJcUNfwN1n/jAWge3S7LCVypTOsMheGQHS79
 Mgp15Hya6mc2mP13RTidac/AR3C58Jt03Pzad6A1LrfUe8ElK0QKd+8UTgvbCoFJK/Wo
 cIaIaRhvDGVHsoSh6dyq1k+Zv2CYgafibx/yiJTyJTqwKXVUoFLQNuedax0DqCbVZGm4
 1P0ohHia0aRtJUnu9im2ykjgt5E/mOGUW/H6U+ctnVHuUiJhxeNfQIHd0lkVldYg5QyV ZQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 36p66r8nvj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Feb 2021 08:37:38 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11J8aVFT125527;
        Fri, 19 Feb 2021 08:37:37 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 36prbrw2ax-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Feb 2021 08:37:37 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11J8bZPO005559;
        Fri, 19 Feb 2021 08:37:35 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 19 Feb 2021 00:37:33 -0800
Date:   Fri, 19 Feb 2021 11:37:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Jeffrey Hugo <jhugo@codeaurora.org>,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH] mhi_bus: core: Wait for ready state after reset
Message-ID: <20210219083723.GT2087@kadam>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0k24IdCjZr+ZpLJG"
Content-Disposition: inline
In-Reply-To: <1613508745-32324-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190066
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190066
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--0k24IdCjZr+ZpLJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jeffrey,

url:    https://github.com/0day-ci/linux/commits/Jeffrey-Hugo/mhi_bus-core-Wait-for-ready-state-after-reset/20210217-045558
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f40ddce88593482919761f74910f42f4b84c004b
config: i386-randconfig-m021-20210215 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/bus/mhi/core/pm.c:501 mhi_pm_disable_transition() error: uninitialized symbol 'cur_state'.

vim +/cur_state +501 drivers/bus/mhi/core/pm.c

a03c7a86e12721 Bhaumik Bhatt         2020-11-09  449  static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  450  {
a03c7a86e12721 Bhaumik Bhatt         2020-11-09  451  	enum mhi_pm_state cur_state;
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^

a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  452  	struct mhi_event *mhi_event;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  453  	struct mhi_cmd_ctxt *cmd_ctxt;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  454  	struct mhi_cmd *mhi_cmd;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  455  	struct mhi_event_ctxt *er_ctxt;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  456  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  457  	int ret, i;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  458  
a03c7a86e12721 Bhaumik Bhatt         2020-11-09  459  	dev_dbg(dev, "Processing disable transition with PM state: %s\n",
a03c7a86e12721 Bhaumik Bhatt         2020-11-09  460  		to_mhi_pm_state_str(mhi_cntrl->pm_state));
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  461  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  462  	mutex_lock(&mhi_cntrl->pm_mutex);
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  463  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  464  	/* Trigger MHI RESET so that the device will not access host memory */
a03c7a86e12721 Bhaumik Bhatt         2020-11-09  465  	if (!MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
a9148d0d4715fb Jeffrey Hugo          2021-02-16  466  		u32 in_reset = -1, ready = 0;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  467  		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  468  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  469  		dev_dbg(dev, "Triggering MHI Reset in device\n");
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  470  		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  471  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  472  		/* Wait for the reset bit to be cleared by the device */
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  473  		ret = wait_event_timeout(mhi_cntrl->state_event,
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  474  					 mhi_read_reg_field(mhi_cntrl,
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  475  							    mhi_cntrl->regs,
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  476  							    MHICTRL,
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  477  							    MHICTRL_RESET_MASK,
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  478  							    MHICTRL_RESET_SHIFT,
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  479  							    &in_reset) ||
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  480  					!in_reset, timeout);
556bbb442bbb44 Bhaumik Bhatt         2020-11-09  481  		if (!ret || in_reset)
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  482  			dev_err(dev, "Device failed to exit MHI Reset state\n");
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  483  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  484  		/*
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  485  		 * Device will clear BHI_INTVEC as a part of RESET processing,
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  486  		 * hence re-program it
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  487  		 */
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  488  		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
a9148d0d4715fb Jeffrey Hugo          2021-02-16  489  
a9148d0d4715fb Jeffrey Hugo          2021-02-16  490  		if (!MHI_IN_PBL(mhi_get_exec_env(mhi_cntrl))) {
a9148d0d4715fb Jeffrey Hugo          2021-02-16  491  			/* wait for ready to be set */
a9148d0d4715fb Jeffrey Hugo          2021-02-16  492  			ret = wait_event_timeout(mhi_cntrl->state_event,
a9148d0d4715fb Jeffrey Hugo          2021-02-16  493  						 mhi_read_reg_field(mhi_cntrl,
a9148d0d4715fb Jeffrey Hugo          2021-02-16  494  							mhi_cntrl->regs,
a9148d0d4715fb Jeffrey Hugo          2021-02-16  495  							MHISTATUS,
a9148d0d4715fb Jeffrey Hugo          2021-02-16  496  							MHISTATUS_READY_MASK,
a9148d0d4715fb Jeffrey Hugo          2021-02-16  497  							MHISTATUS_READY_SHIFT,
a9148d0d4715fb Jeffrey Hugo          2021-02-16  498  							&ready)
a9148d0d4715fb Jeffrey Hugo          2021-02-16  499  						 || ready, timeout);
a9148d0d4715fb Jeffrey Hugo          2021-02-16  500  			if ((!ret || !ready) &&
a9148d0d4715fb Jeffrey Hugo          2021-02-16 @501  			    cur_state == MHI_PM_SYS_ERR_PROCESS) {
                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"cur_state" is not initialized until later.

a9148d0d4715fb Jeffrey Hugo          2021-02-16  502  				dev_err(dev,
a9148d0d4715fb Jeffrey Hugo          2021-02-16  503  					"Device failed to enter READY state\n");
a9148d0d4715fb Jeffrey Hugo          2021-02-16  504  				mutex_unlock(&mhi_cntrl->pm_mutex);
a9148d0d4715fb Jeffrey Hugo          2021-02-16  505  				return;
a9148d0d4715fb Jeffrey Hugo          2021-02-16  506  			}
a9148d0d4715fb Jeffrey Hugo          2021-02-16  507  		}
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  508  	}
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  509  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  510  	dev_dbg(dev,
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  511  		 "Waiting for all pending event ring processing to complete\n");
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  512  	mhi_event = mhi_cntrl->mhi_event;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  513  	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  514  		if (mhi_event->offload_ev)
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  515  			continue;
6cc1716102b554 Bhaumik Bhatt         2020-11-09  516  		free_irq(mhi_cntrl->irq[mhi_event->irq], mhi_event);
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  517  		tasklet_kill(&mhi_event->task);
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  518  	}
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  519  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  520  	/* Release lock and wait for all pending threads to complete */
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  521  	mutex_unlock(&mhi_cntrl->pm_mutex);
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  522  	dev_dbg(dev, "Waiting for all pending threads to complete\n");
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  523  	wake_up_all(&mhi_cntrl->state_event);
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  524  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  525  	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
10ea8bcda5ae54 Loic Poulain          2020-11-25  526  	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  527  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  528  	mutex_lock(&mhi_cntrl->pm_mutex);
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  529  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  530  	WARN_ON(atomic_read(&mhi_cntrl->dev_wake));
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  531  	WARN_ON(atomic_read(&mhi_cntrl->pending_pkts));
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  532  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  533  	/* Reset the ev rings and cmd rings */
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  534  	dev_dbg(dev, "Resetting EV CTXT and CMD CTXT\n");
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  535  	mhi_cmd = mhi_cntrl->mhi_cmd;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  536  	cmd_ctxt = mhi_cntrl->mhi_ctxt->cmd_ctxt;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  537  	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++, cmd_ctxt++) {
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  538  		struct mhi_ring *ring = &mhi_cmd->ring;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  539  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  540  		ring->rp = ring->base;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  541  		ring->wp = ring->base;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  542  		cmd_ctxt->rp = cmd_ctxt->rbase;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  543  		cmd_ctxt->wp = cmd_ctxt->rbase;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  544  	}
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  545  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  546  	mhi_event = mhi_cntrl->mhi_event;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  547  	er_ctxt = mhi_cntrl->mhi_ctxt->er_ctxt;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  548  	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, er_ctxt++,
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  549  		     mhi_event++) {
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  550  		struct mhi_ring *ring = &mhi_event->ring;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  551  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  552  		/* Skip offload events */
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  553  		if (mhi_event->offload_ev)
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  554  			continue;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  555  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  556  		ring->rp = ring->base;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  557  		ring->wp = ring->base;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  558  		er_ctxt->rp = er_ctxt->rbase;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  559  		er_ctxt->wp = er_ctxt->rbase;
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  560  	}
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  561  
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  562  	/* Move to disable state */
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  563  	write_lock_irq(&mhi_cntrl->pm_lock);
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  564  	cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_DISABLE);
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  565  	write_unlock_irq(&mhi_cntrl->pm_lock);
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  566  	if (unlikely(cur_state != MHI_PM_DISABLE))
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  567  		dev_err(dev, "Error moving from PM state: %s to: %s\n",
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  568  			to_mhi_pm_state_str(cur_state),
a6e2e3522f2914 Manivannan Sadhasivam 2020-02-20  569  			to_mhi_pm_state_str(MHI_PM_DISABLE));
556bbb442bbb44 Bhaumik Bhatt         2020-11-09  570  
556bbb442bbb44 Bhaumik Bhatt         2020-11-09  571  	dev_dbg(dev, "Exiting with PM state: %s, MHI state: %s\n",
556bbb442bbb44 Bhaumik Bhatt         2020-11-09  572  		to_mhi_pm_state_str(mhi_cntrl->pm_state),
556bbb442bbb44 Bhaumik Bhatt         2020-11-09  573  		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
556bbb442bbb44 Bhaumik Bhatt         2020-11-09  574  
556bbb442bbb44 Bhaumik Bhatt         2020-11-09  575  	mutex_unlock(&mhi_cntrl->pm_mutex);
556bbb442bbb44 Bhaumik Bhatt         2020-11-09  576  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--0k24IdCjZr+ZpLJG
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--0k24IdCjZr+ZpLJG--
