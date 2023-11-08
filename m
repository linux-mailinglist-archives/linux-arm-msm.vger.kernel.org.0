Return-Path: <linux-arm-msm+bounces-147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 972577E5077
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 07:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C22581C20998
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 06:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3962CA8;
	Wed,  8 Nov 2023 06:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cITdGJlP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C0853A6
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 06:48:46 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0046B8F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 22:48:45 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-53dd3f169d8so10831379a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 22:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699426124; x=1700030924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jb2O/lBBk955CKNe/gEpV8g9kuAg3iF6vieIJ3Ps/0o=;
        b=cITdGJlPC/wrO5VALa7URsvLV6hQnlCrzaBc5G0GlCew/J7yka8D4gBz53yOpTWawY
         B+ZaNSFmFPkOO+SNzHresywUB/LKDJd2gumbQivQoip3FD06AKrBzeXniFq/B2YHQMvo
         xsZ4i2tPoFYoWxjX9DsUcq8vrOSrmvxYxnZ7jV8u/37KjEVZ8IgvWFhhEvZgGr7Oa1aG
         ONTMZAMR425vd8PEpRmLqiic8qoh5uVOElyveXWAJevJfJruF96VhmFagyOq+FbUHjU+
         zcqcs3VRlAEZSTd2y/1H7tuSIv/ubBTCabqzTroJkWjAulamGsu6kKwfbPeZPELEtdFd
         J5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699426124; x=1700030924;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jb2O/lBBk955CKNe/gEpV8g9kuAg3iF6vieIJ3Ps/0o=;
        b=OvxV2w7iFifl+uWWA0zBq/fJvH9BD45IRzEWjOBLIbYNV5DDmqHP/dJ5M+9J/WHsJ3
         IH20UfsJfi5244CqMhFJ1f6H7RHDb9EuTPNOhAqorrN1Mz7YbxvlUEp8j7R3yDJJZa9a
         aOUt3aFaZ5mWtp6qvXLFxMsl2NNK1Smm2kHVQwZEwvNmjv3BVQGIg63+WG6WGoToX9jO
         HKVNfH7CK5kgSbveDY6XtgFLnPRWWDR1gDnWVIml1Tm2LswY5GTwb1DRuIYvHLzKiejP
         wPd0EqFI5Ja09MX/XxEcgqa4sBuGtYkX1AkRIwNVBIHayy3fJJYVoGMxQNMNh1xI2Ubm
         xT7w==
X-Gm-Message-State: AOJu0Yyrb1m5/tzmfxZv6mtvPOUmdKpBNiYsnghSAbzGphQ6fYlWE23n
	zKAgc8MPgowqOYphpeM6NXRA9A==
X-Google-Smtp-Source: AGHT+IHaXbdMnQkxeSuF6krmzXyFXkV0AOojjJ7bqHnUMTGc1KreBH+zRVv3VtilSbX9ZkVZYkTbNQ==
X-Received: by 2002:a50:c352:0:b0:53e:782f:cfa6 with SMTP id q18-20020a50c352000000b0053e782fcfa6mr575642edb.37.1699426124137;
        Tue, 07 Nov 2023 22:48:44 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v19-20020a50d093000000b005434095b179sm6326163edd.92.2023.11.07.22.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 22:48:43 -0800 (PST)
Date: Wed, 8 Nov 2023 09:48:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Qiang Yu <quic_qianyu@quicinc.com>,
	mani@kernel.org, quic_jhugo@quicinc.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, quic_mrana@quicinc.com,
	Qiang Yu <quic_qianyu@quicinc.com>
Subject: Re: [PATCH v3 3/4] bus: mhi: host: Avoid processing buffer and event
 of a disable channel
Message-ID: <12ceff53-bbd0-4e12-9597-f6a4bfd0f87f@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1699341365-47737-4-git-send-email-quic_qianyu@quicinc.com>

Hi Qiang,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiang-Yu/bus-mhi-host-Add-spinlock-to-protect-WP-access-when-queueing-TREs/20231107-151918
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
patch link:    https://lore.kernel.org/r/1699341365-47737-4-git-send-email-quic_qianyu%40quicinc.com
patch subject: [PATCH v3 3/4] bus: mhi: host: Avoid processing buffer and event of a disable channel
config: x86_64-randconfig-161-20231107 (https://download.01.org/0day-ci/archive/20231108/202311080155.MiyREgoQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311080155.MiyREgoQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202311080155.MiyREgoQ-lkp@intel.com/

smatch warnings:
drivers/bus/mhi/host/main.c:1257 mhi_gen_tre() warn: inconsistent returns '&mhi_chan->lock'.

vim +1257 drivers/bus/mhi/host/main.c

189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1204  int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1205  			struct mhi_buf_info *info, enum mhi_flags flags)
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1206  {
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1207  	struct mhi_ring *buf_ring, *tre_ring;
84f5f31f110e5e drivers/bus/mhi/host/main.c Manivannan Sadhasivam 2022-03-01  1208  	struct mhi_ring_element *mhi_tre;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1209  	struct mhi_buf_info *buf_info;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1210  	int eot, eob, chain, bei;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1211  	int ret;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1212  
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1213  	/* Protect accesses for reading and incrementing WP */
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1214  	write_lock_bh(&mhi_chan->lock);
6025cde6ecb13c drivers/bus/mhi/host/main.c Qiang Yu              2023-11-07  1215  	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
6025cde6ecb13c drivers/bus/mhi/host/main.c Qiang Yu              2023-11-07  1216  		return -EINVAL;

This looks like two people submitted patches on the same day?
We should unlock before returning?

da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1217  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1218  	buf_ring = &mhi_chan->buf_ring;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1219  	tre_ring = &mhi_chan->tre_ring;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1220  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1221  	buf_info = buf_ring->wp;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1222  	WARN_ON(buf_info->used);
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1223  	buf_info->pre_mapped = info->pre_mapped;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1224  	if (info->pre_mapped)
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1225  		buf_info->p_addr = info->p_addr;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1226  	else
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1227  		buf_info->v_addr = info->v_addr;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1228  	buf_info->cb_buf = info->cb_buf;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1229  	buf_info->wp = tre_ring->wp;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1230  	buf_info->dir = mhi_chan->dir;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1231  	buf_info->len = info->len;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1232  
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1233  	if (!info->pre_mapped) {
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1234  		ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1235  		if (ret) {
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1236  			write_unlock_bh(&mhi_chan->lock);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1237  			return ret;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1238  		}
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1239  	}
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1240  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1241  	eob = !!(flags & MHI_EOB);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1242  	eot = !!(flags & MHI_EOT);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1243  	chain = !!(flags & MHI_CHAIN);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1244  	bei = !!(mhi_chan->intmod);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1245  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1246  	mhi_tre = tre_ring->wp;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1247  	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1248  	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(info->len);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1249  	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, eot, eob, chain);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1250  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1251  	/* increment WP */
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1252  	mhi_add_ring_element(mhi_cntrl, tre_ring);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1253  	mhi_add_ring_element(mhi_cntrl, buf_ring);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1254  
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1255  	write_unlock_bh(&mhi_chan->lock);
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1256  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20 @1257  	return 0;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1258  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


