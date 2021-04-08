Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E958358D72
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 21:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbhDHTZE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 15:25:04 -0400
Received: from mga17.intel.com ([192.55.52.151]:36374 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231420AbhDHTZE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 15:25:04 -0400
IronPort-SDR: JcHtPyCNKfd7Npybhgn8D7PvXVVl/48kQke5TIb4Jo3n2t2vQmBdgCG0F+WrfUK1JaKE1T0jH1
 6r89i6+WOfOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="173699605"
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; 
   d="gz'50?scan'50,208,50";a="173699605"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 12:24:52 -0700
IronPort-SDR: ryexkp6X0ihFnro/iQMxbfdQLl8LI7DIVQ8aMAQhCCZs2xk+6YJMb0g3dZ5nfyULXETjZA0YJN
 LSa1mbPSMdVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; 
   d="gz'50?scan'50,208,50";a="530713711"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Apr 2021 12:24:49 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lUaGm-000FYe-Os; Thu, 08 Apr 2021 19:24:48 +0000
Date:   Fri, 9 Apr 2021 03:24:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     kbuild-all@lists.01.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, bbhatt@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2] bus: mhi: core: Fix shadow declarations
Message-ID: <202104090321.MBQ5jts8-lkp@intel.com>
References: <20210408133134.6548-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <20210408133134.6548-1-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Manivannan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.12-rc6 next-20210408]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Manivannan-Sadhasivam/bus-mhi-core-Fix-shadow-declarations/20210408-213242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 454859c552da78b0f587205d308401922b56863e
config: um-randconfig-c024-20210408 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cocci warnings: (new ones prefixed by >>)
>> drivers/bus/mhi/core/main.c:599:2-19: ERROR: nested lock+irqsave that reuses flags from line 521.

vim +599 drivers/bus/mhi/core/main.c

1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  496  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  497  static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  498  			    struct mhi_tre *event,
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  499  			    struct mhi_chan *mhi_chan)
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  500  {
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  501  	struct mhi_ring *buf_ring, *tre_ring;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  502  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  503  	struct mhi_result result;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  504  	unsigned long flags = 0;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  505  	u32 ev_code;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  506  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  507  	ev_code = MHI_TRE_GET_EV_CODE(event);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  508  	buf_ring = &mhi_chan->buf_ring;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  509  	tre_ring = &mhi_chan->tre_ring;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  510  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  511  	result.transaction_status = (ev_code == MHI_EV_CC_OVERFLOW) ?
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  512  		-EOVERFLOW : 0;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  513  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  514  	/*
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  515  	 * If it's a DB Event then we need to grab the lock
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  516  	 * with preemption disabled and as a write because we
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  517  	 * have to update db register and there are chances that
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  518  	 * another thread could be doing the same.
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  519  	 */
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  520  	if (ev_code >= MHI_EV_CC_OOB)
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20 @521  		write_lock_irqsave(&mhi_chan->lock, flags);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  522  	else
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  523  		read_lock_bh(&mhi_chan->lock);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  524  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  525  	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  526  		goto end_process_tx_event;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  527  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  528  	switch (ev_code) {
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  529  	case MHI_EV_CC_OVERFLOW:
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  530  	case MHI_EV_CC_EOB:
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  531  	case MHI_EV_CC_EOT:
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  532  	{
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  533  		dma_addr_t ptr = MHI_TRE_GET_EV_PTR(event);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  534  		struct mhi_tre *local_rp, *ev_tre;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  535  		void *dev_rp;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  536  		struct mhi_buf_info *buf_info;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  537  		u16 xfer_len;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  538  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  539  		/* Get the TRB this event points to */
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  540  		ev_tre = mhi_to_virtual(tre_ring, ptr);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  541  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  542  		dev_rp = ev_tre + 1;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  543  		if (dev_rp >= (tre_ring->base + tre_ring->len))
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  544  			dev_rp = tre_ring->base;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  545  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  546  		result.dir = mhi_chan->dir;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  547  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  548  		local_rp = tre_ring->rp;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  549  		while (local_rp != dev_rp) {
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  550  			buf_info = buf_ring->rp;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  551  			/* If it's the last TRE, get length from the event */
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  552  			if (local_rp == ev_tre)
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  553  				xfer_len = MHI_TRE_GET_EV_LEN(event);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  554  			else
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  555  				xfer_len = buf_info->len;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  556  
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  557  			/* Unmap if it's not pre-mapped by client */
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  558  			if (likely(!buf_info->pre_mapped))
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  559  				mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  560  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  561  			result.buf_addr = buf_info->cb_buf;
ee75cedf82d832 Hemant Kumar          2020-05-21  562  
ee75cedf82d832 Hemant Kumar          2020-05-21  563  			/* truncate to buf len if xfer_len is larger */
ee75cedf82d832 Hemant Kumar          2020-05-21  564  			result.bytes_xferd =
ee75cedf82d832 Hemant Kumar          2020-05-21  565  				min_t(u16, xfer_len, buf_info->len);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  566  			mhi_del_ring_element(mhi_cntrl, buf_ring);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  567  			mhi_del_ring_element(mhi_cntrl, tre_ring);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  568  			local_rp = tre_ring->rp;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  569  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  570  			/* notify client */
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  571  			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  572  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  573  			if (mhi_chan->dir == DMA_TO_DEVICE)
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  574  				atomic_dec(&mhi_cntrl->pending_pkts);
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  575  
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  576  			/*
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  577  			 * Recycle the buffer if buffer is pre-allocated,
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  578  			 * if there is an error, not much we can do apart
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  579  			 * from dropping the packet
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  580  			 */
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  581  			if (mhi_chan->pre_alloc) {
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  582  				if (mhi_queue_buf(mhi_chan->mhi_dev,
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  583  						  mhi_chan->dir,
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  584  						  buf_info->cb_buf,
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  585  						  buf_info->len, MHI_EOT)) {
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  586  					dev_err(dev,
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  587  						"Error recycling buffer for chan:%d\n",
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  588  						mhi_chan->chan);
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  589  					kfree(buf_info->cb_buf);
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  590  				}
189ff97cca53e3 Manivannan Sadhasivam 2020-02-20  591  			}
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  592  		}
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  593  		break;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  594  	} /* CC_EOT */
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  595  	case MHI_EV_CC_OOB:
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  596  	case MHI_EV_CC_DB_MODE:
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  597  	{
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  598  		mhi_chan->db_cfg.db_mode = 1;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20 @599  		read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  600  		if (tre_ring->wp != tre_ring->rp &&
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  601  		    MHI_DB_ACCESS_VALID(mhi_cntrl)) {
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  602  			mhi_ring_chan_db(mhi_cntrl, mhi_chan);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  603  		}
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  604  		read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  605  		break;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  606  	}
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  607  	case MHI_EV_CC_BAD_TRE:
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  608  	default:
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  609  		dev_err(dev, "Unknown event 0x%x\n", ev_code);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  610  		break;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  611  	} /* switch(MHI_EV_READ_CODE(EV_TRB_CODE,event)) */
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  612  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  613  end_process_tx_event:
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  614  	if (ev_code >= MHI_EV_CC_OOB)
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  615  		write_unlock_irqrestore(&mhi_chan->lock, flags);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  616  	else
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  617  		read_unlock_bh(&mhi_chan->lock);
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  618  
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  619  	return 0;
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  620  }
1d3173a3bae703 Manivannan Sadhasivam 2020-02-20  621  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--4Ckj6UjgE2iN1+kY
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--4Ckj6UjgE2iN1+kY--
