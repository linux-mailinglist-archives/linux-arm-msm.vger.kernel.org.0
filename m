Return-Path: <linux-arm-msm+bounces-43762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF49FF164
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 20:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53FF4162296
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 19:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7184C189BBB;
	Tue, 31 Dec 2024 19:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWIVDW9u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A9E17332C;
	Tue, 31 Dec 2024 19:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735671635; cv=none; b=qtzdg69Uj95IVCwa5WUsI/3AiZx0M7Bq2juZFp6otdl1cYs4kOCQiARBguwrrxNfmCSGQE96qhJtcnMXFbXg4ICnEvrqshBWvOEDHyO0yoFwyDq9xIC+J20IQ55KwFVTj0Ya5iUvYFSNi++ukFF3JZuvOFBE2LPxo9bZcMGgzX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735671635; c=relaxed/simple;
	bh=0nE/j53OBn8iBsTCBKt6p3gzVmIyjRyGlsRGj3tLVgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENN9I/w/qYRQqgvGk7KU8ynWH9pu8Y+6ToACCtEuJFhiYQOAjsCAwqJCVBPC9ORyo3ypJimHuFPt1L/AqRaAZgUD/b3zJHZtexE6qSL0FKd7iOv32Sd6YngKDNIqAKJjCZ2OHwS0zJkU5ix7Pc+gl7l1PDujIjckfAXvggRou18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWIVDW9u; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735671634; x=1767207634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0nE/j53OBn8iBsTCBKt6p3gzVmIyjRyGlsRGj3tLVgE=;
  b=SWIVDW9uLCgIqzavKUWJHhCJh9r8SHLYofRb3owjyfKBB/lIX1i31jjC
   jdcurb8Oee4+GtMxqkz+Ty0L3krvx2MXrk6WV26h0gXHHbkBT2NcNIwRD
   4+GbamFiJkWBjrYFChydAt1XUo12ynX8m/W4cQ8vkzSN7Si7LyFQUo1d+
   R0lidoWNTfhwsZ6a627kHWPqWYSQ8Xe9UMGbepcMCvltDEC+vDVIk0t5w
   HNy1sJAwUQyd5/u3PxQSin3Q0cOlF2rMkcGUpgIIQCgvLZkCbpWwrzyfg
   zUAnRE2n+Gz7/Vnw2cH4usoOz+Syg3ko04IoABWnB6rRcOxMzYCKzOBBz
   Q==;
X-CSE-ConnectionGUID: sIzAnkf6SlKAHMXC1veFMw==
X-CSE-MsgGUID: 6gRbjlbVTzaLIwsyHGaS1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35834300"
X-IronPort-AV: E=Sophos;i="6.12,280,1728975600"; 
   d="scan'208";a="35834300"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 11:00:33 -0800
X-CSE-ConnectionGUID: heSDK/mlRTWeSbjhyAFL4g==
X-CSE-MsgGUID: z1hr/tTzSBaLx+2oSkzmlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106113795"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Dec 2024 11:00:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tShTe-0007Nz-2t;
	Tue, 31 Dec 2024 19:00:26 +0000
Date: Wed, 1 Jan 2025 02:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sricharan R <quic_srichara@quicinc.com>, jassisinghbrar@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, manivannan.sadhasivam@linaro.org,
	dmitry.baryshkov@linaro.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V2 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
Message-ID: <202501010110.6sHxF8ne-lkp@intel.com>
References: <20241231054900.2144961-3-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231054900.2144961-3-quic_srichara@quicinc.com>

Hi Sricharan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sricharan-R/dt-bindings-mailbox-Document-qcom-tmel-qmp/20241231-135219
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241231054900.2144961-3-quic_srichara%40quicinc.com
patch subject: [PATCH V2 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250101/202501010110.6sHxF8ne-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501010110.6sHxF8ne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501010110.6sHxF8ne-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from drivers/mailbox/qcom-tmel-qmp.c:10:
   drivers/mailbox/qcom-tmel-qmp.c: In function 'qmp_send_data':
>> drivers/mailbox/qcom-tmel-qmp.c:312:36: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     312 |                 dev_err(mdev->dev, "Unsupported packet size %lu\n", pkt->iov_len);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:312:17: note: in expansion of macro 'dev_err'
     312 |                 dev_err(mdev->dev, "Unsupported packet size %lu\n", pkt->iov_len);
         |                 ^~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:312:63: note: format string is defined here
     312 |                 dev_err(mdev->dev, "Unsupported packet size %lu\n", pkt->iov_len);
         |                                                             ~~^
         |                                                               |
         |                                                               long unsigned int
         |                                                             %u
   In file included from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from drivers/mailbox/qcom-tmel-qmp.c:7:
   drivers/mailbox/qcom-tmel-qmp.c: In function 'tmel_process_request':
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:544:9: note: in expansion of macro 'printk'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:544:16: note: in expansion of macro 'KERN_ERR'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/mailbox/qcom-tmel-qmp.c:709:17: note: in expansion of macro 'pr_err'
     709 |                 pr_err("Invalid pkt.size received size: %lu, expected: %zu\n",
         |                 ^~~~~~
   drivers/mailbox/qcom-tmel-qmp.c: In function 'tmel_qmp_send_work':
>> drivers/mailbox/qcom-tmel-qmp.c:834:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     834 |         int ret;
         |             ^~~
--
>> drivers/mailbox/qcom-tmel-qmp.c:152: warning: Function parameter or struct member 'qwork' not described in 'qmp_device'
>> drivers/mailbox/qcom-tmel-qmp.c:152: warning: Function parameter or struct member 'data' not described in 'qmp_device'
>> drivers/mailbox/qcom-tmel-qmp.c:152: warning: Function parameter or struct member 'ch_in_use' not described in 'qmp_device'
>> drivers/mailbox/qcom-tmel-qmp.c:303: warning: Function parameter or struct member 'mdev' not described in 'qmp_send_data'
>> drivers/mailbox/qcom-tmel-qmp.c:303: warning: Excess function parameter 'chan' description in 'qmp_send_data'
>> drivers/mailbox/qcom-tmel-qmp.c:393: warning: Function parameter or struct member 'mdev' not described in 'qmp_recv_data'
>> drivers/mailbox/qcom-tmel-qmp.c:393: warning: Excess function parameter 'mbox' description in 'qmp_recv_data'
>> drivers/mailbox/qcom-tmel-qmp.c:437: warning: Function parameter or struct member 'mdev' not described in 'qmp_rx'
>> drivers/mailbox/qcom-tmel-qmp.c:437: warning: Excess function parameter 'mbox' description in 'qmp_rx'


vim +312 drivers/mailbox/qcom-tmel-qmp.c

   101	
   102	/**
   103	 * struct qmp_device - local information for managing a single mailbox
   104	 * @dev:	    The device that corresponds to this mailbox
   105	 * @ctrl:	    The mbox controller for this mailbox
   106	 * @mcore_desc:	    Local core (APSS) mailbox descriptor
   107	 * @ucore_desc:	    Remote core (TME-L) mailbox descriptor
   108	 * @mcore:	    Local core (APSS) channel descriptor
   109	 * @ucore:	    Remote core (TME-L) channel descriptor
   110	 * @rx_pkt:	    Buffer to pass to client, holds received data from mailbox
   111	 * @tx_pkt:	    Buffer from client, holds data to send on mailbox
   112	 * @mbox_client:    Mailbox client for the IPC interrupt
   113	 * @mbox_chan:	    Mailbox client chan for the IPC interrupt
   114	 * @local_state:    Current state of mailbox protocol
   115	 * @state_lock:	    Serialize mailbox state changes
   116	 * @tx_lock:	    Serialize access for writes to mailbox
   117	 * @link_complete:  Use to block until link negotiation with remote proc
   118	 * @ch_complete:    Use to block until the channel is fully opened
   119	 * @dwork:	    Delayed work to detect timed out tx
   120	 * @tx_sent:	    True if tx is sent and remote proc has not sent ack
   121	 */
   122	struct qmp_device {
   123		struct device *dev;
   124		struct mbox_controller ctrl;
   125		struct qmp_work qwork;
   126	
   127		void __iomem *mcore_desc;
   128		void __iomem *ucore_desc;
   129		union channel_desc mcore;
   130		union channel_desc ucore;
   131	
   132		struct kvec rx_pkt;
   133		struct kvec tx_pkt;
   134	
   135		struct mbox_client mbox_client;
   136		struct mbox_chan *mbox_chan;
   137	
   138		enum qmp_local_state local_state;
   139	
   140		/* Lock for QMP link state changes */
   141		struct mutex state_lock;
   142		/* Lock to serialize access to mailbox */
   143		spinlock_t tx_lock;
   144	
   145		struct completion link_complete;
   146		struct completion ch_complete;
   147		struct delayed_work dwork;
   148		void *data;
   149	
   150		bool tx_sent;
   151		bool ch_in_use;
 > 152	};
   153	
   154	struct tmel_msg_param_type_buf_in {
   155		u32 buf;
   156		u32 buf_len;
   157	};
   158	
   159	struct tmel_secboot_sec_auth_req {
   160		u32 sw_id;
   161		struct tmel_msg_param_type_buf_in elf_buf;
   162		struct tmel_msg_param_type_buf_in region_list;
   163		u32 relocate;
   164	} __packed;
   165	
   166	struct tmel_secboot_sec_auth_resp {
   167		u32 first_seg_addr;
   168		u32 first_seg_len;
   169		u32 entry_addr;
   170		u32 extended_error;
   171		u32 status;
   172	} __packed;
   173	
   174	struct tmel_secboot_sec_auth {
   175		struct tmel_secboot_sec_auth_req req;
   176		struct tmel_secboot_sec_auth_resp resp;
   177	} __packed;
   178	
   179	struct tmel_secboot_teardown_req {
   180		u32 sw_id;
   181		u32 secondary_sw_id;
   182	} __packed;
   183	
   184	struct tmel_secboot_teardown_resp {
   185		u32 status;
   186	} __packed;
   187	
   188	struct tmel_secboot_teardown {
   189		struct tmel_secboot_teardown_req req;
   190		struct tmel_secboot_teardown_resp resp;
   191	} __packed;
   192	
   193	struct tmel {
   194		struct device *dev;
   195		struct qmp_device *mdev;
   196		struct kvec pkt;
   197		/* To serialize incoming tmel request */
   198		struct mutex lock;
   199		struct tmel_ipc_pkt *ipc_pkt;
   200		dma_addr_t sram_dma_addr;
   201		wait_queue_head_t waitq;
   202		bool rx_done;
   203	};
   204	
   205	static struct tmel *tmeldev;
   206	
   207	/**
   208	 * qmp_send_irq() - send an irq to a remote entity as an event signal.
   209	 * @mdev:       Which remote entity that should receive the irq.
   210	 */
   211	static void qmp_send_irq(struct qmp_device *mdev)
   212	{
   213		/* Update the mcore val to mcore register */
   214		iowrite32(mdev->mcore.val, mdev->mcore_desc);
   215		/* Ensure desc update is visible before IPC */
   216		wmb();
   217	
   218		dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
   219			mdev->mcore.val, mdev->ucore.val);
   220	
   221		mbox_send_message(mdev->mbox_chan, NULL);
   222		mbox_client_txdone(mdev->mbox_chan, 0);
   223	}
   224	
   225	/**
   226	 * qmp_notify_timeout() - Notify client of tx timeout with -ETIME
   227	 * @work:		  Structure for work that was scheduled.
   228	 */
   229	static void qmp_notify_timeout(struct work_struct *work)
   230	{
   231		struct delayed_work *dwork = to_delayed_work(work);
   232		struct qmp_device *mdev = container_of(dwork, struct qmp_device, dwork);
   233		struct mbox_chan *chan = &mdev->ctrl.chans[0];
   234		int err = -ETIME;
   235		unsigned long flags;
   236	
   237		spin_lock_irqsave(&mdev->tx_lock, flags);
   238		if (!mdev->tx_sent) {
   239			spin_unlock_irqrestore(&mdev->tx_lock, flags);
   240			return;
   241		}
   242		mdev->tx_sent = false;
   243		spin_unlock_irqrestore(&mdev->tx_lock, flags);
   244		dev_dbg(mdev->dev, "%s: TX timeout", __func__);
   245		mbox_chan_txdone(chan, err);
   246	}
   247	
   248	static inline void qmp_schedule_tx_timeout(struct qmp_device *mdev)
   249	{
   250		schedule_delayed_work(&mdev->dwork, msecs_to_jiffies(QMP_TOUT_MS));
   251	}
   252	
   253	/**
   254	 * tmel_qmp_startup() - Start qmp mailbox channel for communication. Waits for
   255	 *		       remote subsystem to open channel if link is not
   256	 *		       initated or until timeout.
   257	 * @chan:	       mailbox channel that is being opened.
   258	 *
   259	 * Return: 0 on succes or standard Linux error code.
   260	 */
   261	static int tmel_qmp_startup(struct mbox_chan *chan)
   262	{
   263		struct qmp_device *mdev = chan->con_priv;
   264		int ret;
   265	
   266		if (!mdev)
   267			return -EINVAL;
   268	
   269		ret = wait_for_completion_timeout(&mdev->link_complete,
   270						  msecs_to_jiffies(QMP_TOUT_MS));
   271		if (!ret)
   272			return -EAGAIN;
   273	
   274		mutex_lock(&mdev->state_lock);
   275		if (mdev->local_state == LINK_CONNECTED) {
   276			QMP_MCORE_CH_VAR_SET(mdev, ch_state);
   277			mdev->local_state = LOCAL_CONNECTING;
   278			dev_dbg(mdev->dev, "link complete, local connecting");
   279			qmp_send_irq(mdev);
   280		}
   281		mutex_unlock(&mdev->state_lock);
   282	
   283		ret = wait_for_completion_timeout(&mdev->ch_complete,
   284						  msecs_to_jiffies(QMP_TOUT_MS));
   285		if (!ret)
   286			return -ETIME;
   287	
   288		return 0;
   289	}
   290	
   291	/**
   292	 * qmp_send_data() - Copy the data to the channel's mailbox and notify
   293	 *		     remote subsystem of new data. This function will
   294	 *		     return an error if the previous message sent has
   295	 *		     not been read. Cannot Sleep.
   296	 * @chan:	mailbox channel that data is to be sent over.
   297	 * @data:	Data to be sent to remote processor, should be in the format of
   298	 *		a kvec.
   299	 *
   300	 * Return: 0 on succes or standard Linux error code.
   301	 */
   302	static int qmp_send_data(struct qmp_device *mdev, void *data)
 > 303	{
   304		struct kvec *pkt = (struct kvec *)data;
   305		void __iomem *addr;
   306		unsigned long flags;
   307	
   308		if (!mdev || !data || !completion_done(&mdev->ch_complete))
   309			return -EINVAL;
   310	
   311		if (pkt->iov_len > QMP_MAX_PKT_SIZE) {
 > 312			dev_err(mdev->dev, "Unsupported packet size %lu\n", pkt->iov_len);
   313			return -EINVAL;
   314		}
   315	
   316		spin_lock_irqsave(&mdev->tx_lock, flags);
   317		if (mdev->tx_sent) {
   318			spin_unlock_irqrestore(&mdev->tx_lock, flags);
   319			return -EAGAIN;
   320		}
   321	
   322		dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
   323			mdev->mcore.val, mdev->ucore.val);
   324	
   325		addr = mdev->mcore_desc + QMP_CTRL_DATA_SIZE;
   326		memcpy_toio(addr, pkt->iov_base, pkt->iov_len);
   327	
   328		mdev->mcore.bits.frag_size = pkt->iov_len;
   329		mdev->mcore.bits.rem_frag_count = 0;
   330	
   331		dev_dbg(mdev->dev, "Copied buffer to mbox, sz: %d",
   332			mdev->mcore.bits.frag_size);
   333	
   334		mdev->tx_sent = true;
   335		QMP_MCORE_CH_VAR_TOGGLE(mdev, tx);
   336		qmp_send_irq(mdev);
   337		qmp_schedule_tx_timeout(mdev);
   338		spin_unlock_irqrestore(&mdev->tx_lock, flags);
   339	
   340		return 0;
   341	}
   342	
   343	/**
   344	 * tmel_qmp_shutdown() - Disconnect this mailbox channel so the client does not
   345	 *			 receive anymore data and can reliquish control
   346	 *			 of the channel.
   347	 * @chan:		 mailbox channel to be shutdown.
   348	 */
   349	static void tmel_qmp_shutdown(struct mbox_chan *chan)
   350	{
   351		struct qmp_device *mdev = chan->con_priv;
   352	
   353		mutex_lock(&mdev->state_lock);
   354		if (mdev->local_state != LINK_DISCONNECTED) {
   355			mdev->local_state = LOCAL_DISCONNECTING;
   356			QMP_MCORE_CH_VAR_CLR(mdev, ch_state);
   357			qmp_send_irq(mdev);
   358		}
   359		mutex_unlock(&mdev->state_lock);
   360	}
   361	
   362	static void tmel_receive_message(void *message)
   363	{
   364		struct tmel *tdev = tmeldev;
   365		struct kvec *pkt = NULL;
   366	
   367		if (!message) {
   368			pr_err("spurious message received\n");
   369			goto tmel_receive_end;
   370		}
   371	
   372		if (tdev->rx_done) {
   373			pr_err("tmel response pending\n");
   374			goto tmel_receive_end;
   375		}
   376	
   377		pkt = (struct kvec *)message;
   378		tdev->pkt.iov_len = pkt->iov_len;
   379		tdev->pkt.iov_base = pkt->iov_base;
   380		tdev->rx_done = true;
   381	
   382	tmel_receive_end:
   383		wake_up_interruptible(&tdev->waitq);
   384	}
   385	
   386	/**
   387	 * qmp_recv_data() -	received notification that data is available in the
   388	 *			mailbox. Copy data from mailbox and pass to client.
   389	 * @mbox:		mailbox device that received the notification.
   390	 * @mbox_of:		offset of mailbox after QMP Control data.
   391	 */
   392	static void qmp_recv_data(struct qmp_device *mdev, u32 mbox_of)
 > 393	{
   394		void __iomem *addr;
   395		struct kvec *pkt;
   396	
   397		addr = mdev->ucore_desc + mbox_of;
   398		pkt = &mdev->rx_pkt;
   399		pkt->iov_len = mdev->ucore.bits.frag_size;
   400	
   401		memcpy_fromio(pkt->iov_base, addr, pkt->iov_len);
   402		QMP_MCORE_CH_ACK_UPDATE(mdev, tx);
   403		dev_dbg(mdev->dev, "%s: Send RX data to TMEL Client", __func__);
   404		tmel_receive_message(pkt);
   405	
   406		QMP_MCORE_CH_VAR_TOGGLE(mdev, rx_done);
   407		qmp_send_irq(mdev);
   408	}
   409	
   410	/**
   411	 * clr_mcore_ch_state() - Clear the mcore state of a mailbox.
   412	 * @mdev:	mailbox device to be initialized.
   413	 */
   414	static void clr_mcore_ch_state(struct qmp_device *mdev)
   415	{
   416		QMP_MCORE_CH_VAR_CLR(mdev, ch_state);
   417		QMP_MCORE_CH_VAR_ACK_CLR(mdev, ch_state);
   418	
   419		QMP_MCORE_CH_VAR_CLR(mdev, tx);
   420		QMP_MCORE_CH_VAR_ACK_CLR(mdev, tx);
   421	
   422		QMP_MCORE_CH_VAR_CLR(mdev, rx_done);
   423		QMP_MCORE_CH_VAR_ACK_CLR(mdev, rx_done);
   424	
   425		QMP_MCORE_CH_VAR_CLR(mdev, read_int);
   426		QMP_MCORE_CH_VAR_ACK_CLR(mdev, read_int);
   427	
   428		mdev->mcore.bits.frag_size = 0;
   429		mdev->mcore.bits.rem_frag_count = 0;
   430	}
   431	
   432	/**
   433	 * qmp_rx() - Handle incoming messages from remote processor.
   434	 * @mbox:	mailbox device that received notification.
   435	 */
   436	static void qmp_rx(struct qmp_device *mdev)
 > 437	{
   438		unsigned long flags;
   439	
   440		/* read remote_desc from mailbox register */
   441		mdev->ucore.val = ioread32(mdev->ucore_desc);
   442	
   443		dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
   444			mdev->mcore.val, mdev->ucore.val);
   445	
   446		mutex_lock(&mdev->state_lock);
   447	
   448		/* Check if remote link down */
   449		if (mdev->local_state >= LINK_CONNECTED &&
   450		    !QMP_UCORE_CH_VAR_GET(mdev, link_state)) {
   451			mdev->local_state = LINK_NEGOTIATION;
   452			QMP_MCORE_CH_ACK_UPDATE(mdev, link_state);
   453			qmp_send_irq(mdev);
   454			mutex_unlock(&mdev->state_lock);
   455			return;
   456		}
   457	
   458		switch (mdev->local_state) {
   459		case LINK_DISCONNECTED:
   460			QMP_MCORE_CH_VAR_SET(mdev, link_state);
   461			mdev->local_state = LINK_NEGOTIATION;
   462			mdev->rx_pkt.iov_base = kzalloc(QMP_MAX_PKT_SIZE,
   463							GFP_KERNEL);
   464	
   465			if (!mdev->rx_pkt.iov_base) {
   466				dev_err(mdev->dev, "rx pkt alloc failed");
   467				break;
   468			}
   469			dev_dbg(mdev->dev, "Set to link negotiation");
   470			qmp_send_irq(mdev);
   471	
   472			break;
   473		case LINK_NEGOTIATION:
   474			if (!QMP_MCORE_CH_VAR_GET(mdev, link_state) ||
   475			    !QMP_UCORE_CH_VAR_GET(mdev, link_state)) {
   476				dev_err(mdev->dev, "rx irq:link down state\n");
   477				break;
   478			}
   479	
   480			clr_mcore_ch_state(mdev);
   481			QMP_MCORE_CH_ACK_UPDATE(mdev, link_state);
   482			mdev->local_state = LINK_CONNECTED;
   483			complete_all(&mdev->link_complete);
   484			dev_dbg(mdev->dev, "Set to link connected");
   485	
   486			break;
   487		case LINK_CONNECTED:
   488			/* No need to handle until local opens */
   489			break;
   490		case LOCAL_CONNECTING:
   491			/* Ack to remote ch_state change */
   492			QMP_MCORE_CH_ACK_UPDATE(mdev, ch_state);
   493	
   494			mdev->local_state = CHANNEL_CONNECTED;
   495			complete_all(&mdev->ch_complete);
   496			dev_dbg(mdev->dev, "Set to channel connected");
   497			qmp_send_irq(mdev);
   498			break;
   499		case CHANNEL_CONNECTED:
   500			/* Check for remote channel down */
   501			if (!QMP_UCORE_CH_VAR_GET(mdev, ch_state)) {
   502				mdev->local_state = LOCAL_CONNECTING;
   503				QMP_MCORE_CH_ACK_UPDATE(mdev, ch_state);
   504				dev_dbg(mdev->dev, "Remote Disconnect");
   505				qmp_send_irq(mdev);
   506			}
   507	
   508			spin_lock_irqsave(&mdev->tx_lock, flags);
   509			/* Check TX done */
   510			if (mdev->tx_sent &&
   511			    QMP_UCORE_CH_VAR_TOGGLED_CHECK(mdev, rx_done)) {
   512				/* Ack to remote */
   513				QMP_MCORE_CH_ACK_UPDATE(mdev, rx_done);
   514				mdev->tx_sent = false;
   515				cancel_delayed_work(&mdev->dwork);
   516				dev_dbg(mdev->dev, "TX flag cleared");
   517			}
   518			spin_unlock_irqrestore(&mdev->tx_lock, flags);
   519	
   520			/* Check if remote is Transmitting */
   521			if (!QMP_UCORE_CH_VAR_TOGGLED_CHECK(mdev, tx))
   522				break;
   523			if (mdev->ucore.bits.frag_size == 0 ||
   524			    mdev->ucore.bits.frag_size > QMP_MAX_PKT_SIZE) {
   525				dev_err(mdev->dev, "Rx frag size error %d\n",
   526					mdev->ucore.bits.frag_size);
   527				break;
   528			}
   529	
   530			qmp_recv_data(mdev, QMP_CTRL_DATA_SIZE);
   531			break;
   532		case LOCAL_DISCONNECTING:
   533			if (!QMP_MCORE_CH_VAR_GET(mdev, ch_state)) {
   534				clr_mcore_ch_state(mdev);
   535				mdev->local_state = LINK_CONNECTED;
   536				dev_dbg(mdev->dev, "Channel closed");
   537				reinit_completion(&mdev->ch_complete);
   538			}
   539	
   540			break;
   541		default:
   542			dev_err(mdev->dev, "Local Channel State corrupted\n");
   543		}
   544		mutex_unlock(&mdev->state_lock);
   545	}
   546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

