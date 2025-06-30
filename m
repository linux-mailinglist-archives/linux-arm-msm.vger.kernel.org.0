Return-Path: <linux-arm-msm+bounces-63099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB50AEE52D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 19:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F3E7189DBE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 17:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323CC292B34;
	Mon, 30 Jun 2025 17:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gJuUZCKu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955028D831
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 17:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751302966; cv=none; b=F0WajHua7p27BRe31i8yW1n1Ob7FUKCguwWl1LJVxCZDQtMkmn2iN3kB13NuAmLdSocbxwJkmlSGBTpAryo+h1DPzKyfcNqJEgW/cTvh1cyowgojibayMn0hXMSO1dJO8NsTP6xCJzu8EQ8403vRiPa5mSW8w/o15THkqYTFskQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751302966; c=relaxed/simple;
	bh=CMyeBEGlwNr4oxYgGYdega85FHznmb5nkXVY1F10Aq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Fp2/W+YENXg//ReqSRVAdvO7Q/QBIxeuf5OT9cpJGFIeZwwlvK1LcD+Ll6gq3SuK58ShJRdnLea6cPwg1TJjsMhiImR56Gw8PqOi4OuZbCE92w1KgiA5GcUPBynTL5gM+p2nOcGp9AIJPLLjLBi2k8+QNuYWIL4oEGs7zstz/jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gJuUZCKu; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-736f9e352cbso1354149a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 10:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751302962; x=1751907762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s80AY0V8zsRFOqrfnCdCBKawBPLCK4PdIEA9ulbHOXw=;
        b=gJuUZCKuNRZ2if+XIbC4rfPondOj+yCxFIVhCeBaCYaJMRSkxAFlFAopac5905Obin
         snPgQoRLHI/YYojWVai88m80NehM0WfxIljeETGg8z7aNVmMr9lRmIpcYufjMXser1Hk
         owtQjsCRrrJpYHbi+xuKDt/fTHJeeQjXRCxDlv7LiaGeE95Film/fAczFQ+QvN9N81SY
         tG6etcacMGxntv8KX3qXXKiVwdAP5tv79kh/6yiBNBZ0HajBizZz7jg+xxi3XB+Wmnhj
         ZnOlkA/4aOf0/bFrAgAQb5Xn3l4IE69vqQ6N3ELkvudz4D+ABh7uYUWx4dSqe7Uq8WbZ
         2mvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302962; x=1751907762;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s80AY0V8zsRFOqrfnCdCBKawBPLCK4PdIEA9ulbHOXw=;
        b=bWkdF4iKMkEiIMyhKYC/7aFJc1CBhvb/vCJbC3qb0eXvDdigeitzFVNDPf8c0zJ6EN
         x90nwAZ7CVm316xhJZ5HTbZtH4U5qv5+NjwU//UkLn+UhFE/KJ3fhXWviSdJ0oVqjtsf
         zOUnoz3DxA7xwK19SR8Y4JK0zHX5M7WeH+2Cf2v3qOnvvRrnX4igSff14hw2OM7WLck5
         wueanLTTVJH8mntm4Z0o+0x6QrfzidmFlHKYKWv1z6gXlaNaABVN7XpO3gwK4K5D9Yma
         jN9sUC/aG1KA3A/f+zSnGNTumZK9l2G6+nGPIdpurJcmRdGhZydwqql9HNQisleSuIF5
         lQZg==
X-Forwarded-Encrypted: i=1; AJvYcCXcvW/KfIQ8fri4uvQlCrnXFD2srxK1MtWi37eW5YTHAkAKx1L2vANo955j3wogoQNkITa35sTFx00puRnf@vger.kernel.org
X-Gm-Message-State: AOJu0YwjclVCiZhXbuDSpWUHJCV19sgBollTbOy+RL9gXJX0q6l/yzQB
	BW0r+3sUNrWDg2I8dSrWQxxDj9o3WEdBE9Z+NMlY1BwY7ZsX2suXlf6efWA1/IlKP88=
X-Gm-Gg: ASbGnctYRSHSXEbndi/Vx27vAxTVScc21nsMCoXzXAZebWrTd/IrYGF1a1S1tnKBSo0
	q8pWyjra5/Tist8YRVo5yORin6fUkzjf7YQI6v3rVaj/yQgpJ6bFF7CbtWm7SdlAJmnigGMqMuS
	6EeELI8ksHvEStWNUI8qGmtj2XQpKrHWBgwXMbXjfI+xF1umdHl4st9jy9H0SpqIxkgLn9gRTC+
	NOr58iGtfl8uLsW3AbAN5lVIFdywL9rMbpydrzmDaNQ1ur28EOF6KnvATH/LyAShr5yL6553GBW
	V98dPkC2PTOjpjLLxV/3u57YvVgxoL6oBZBKSa8qU2RUjHiTqT9bjmU7Qfjd1l4RLDxj
X-Google-Smtp-Source: AGHT+IErtMNluGJqLpQ6IvXLyXXU3xsWHi+RjVcEzBvYxTHuw8Xp0gigRtrByUhZ29F0th2SUN1x/Q==
X-Received: by 2002:a05:6830:3494:b0:73b:267c:497b with SMTP id 46e09a7af769-73b267c4bf2mr3846280a34.16.1751302961369;
        Mon, 30 Jun 2025 10:02:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb122bb7sm1735479a34.60.2025.06.30.10.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 10:02:40 -0700 (PDT)
Date: Mon, 30 Jun 2025 20:02:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, quic_satyap@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Subject: Re: [PATCH v2] soc: qcom: llcc: Add per slice counter and common
 llcc slice descriptor
Message-ID: <b8ce895f-0c7a-4b69-a2ce-27e41af96fb9@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-llcc_refcount-v2-1-d05ec8169734@oss.qualcomm.com>

Hi Unnathi,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Unnathi-Chalicheemala/soc-qcom-llcc-Add-per-slice-counter-and-common-llcc-slice-descriptor/20250627-060459
base:   f02769e7f272d6f42b9767f066c5a99afd2338f3
patch link:    https://lore.kernel.org/r/20250626-llcc_refcount-v2-1-d05ec8169734%40oss.qualcomm.com
patch subject: [PATCH v2] soc: qcom: llcc: Add per slice counter and common llcc slice descriptor
config: um-randconfig-r071-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301401.m1NkXwJf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506301401.m1NkXwJf-lkp@intel.com/

smatch warnings:
drivers/soc/qcom/llcc-qcom.c:3859 llcc_slice_getd() warn: passing zero to 'ERR_CAST'

vim +/ERR_CAST +3859 drivers/soc/qcom/llcc-qcom.c

a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3853  struct llcc_slice_desc *llcc_slice_getd(u32 uid)
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3854  {
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3855  	const struct llcc_slice_config *cfg;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3856  	u32 sz, count;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3857  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3858  	if (IS_ERR(drv_data) || !drv_data)

Why are we adding a NULL check here?  So far as I can see, this
can only be NULL in probe() between the failed allocation and
the error handling.  Can actually reach this function during that
stage of the probe()?

Also it feels like it's not done consistenly at all.  Why does
llcc_update_act_ctrl() not check for NULL?

Right now we're returning:
1) -EPROBE_DEFER if probe hasn't been called
2) NULL if it hasn't succeeded and we hit a (very narrow) race window
3) or -EPROBE_DEFER if probe() has failed.

If we really hit a NULL here then we should probably return
-EPROBE_DEFER and not ERR_CAST(NULL).  It needs to be documented.
Btw, I've written a blog about how NULL and error pointers are
supposed to work when you use a mix or error pointers and NULL.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

regards,
dan carpenter

72d1cd033154f5 drivers/soc/qcom/llcc-slice.c Jordan Crouse         2018-12-11 @3859  		return ERR_CAST(drv_data);
72d1cd033154f5 drivers/soc/qcom/llcc-slice.c Jordan Crouse         2018-12-11  3860  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3861  	if (IS_ERR_OR_NULL(drv_data->desc) || !drv_data->cfg)
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3862  		return ERR_PTR(-ENODEV);
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3863  
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3864  	cfg = drv_data->cfg;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3865  	sz = drv_data->cfg_size;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3866  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3867  	for (count = 0; count < sz; count++, cfg++)
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3868  		if (cfg->usecase_id == uid)
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3869  			break;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3870  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3871  	if (count == sz)
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3872  		return ERR_PTR(-ENODEV);
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3873  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3874  	return &drv_data->desc[count];
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3875  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


