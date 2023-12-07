Return-Path: <linux-arm-msm+bounces-3610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DF4808035
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 06:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F4492818F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 05:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6236110A2D;
	Thu,  7 Dec 2023 05:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JqWxNk/8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4930D5E
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 21:32:05 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ce4d4c5ea2so227837b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 21:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701927125; x=1702531925; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NnvGGl844Mt88/eDFjnKsRhrcFq+x0ulAemxO2S+bfU=;
        b=JqWxNk/8LBdyyfAMc3QDFfDiE6mnBtHIQ1ohAfisVnnZy4nO/iuUF49OJavBGd5887
         oIyYKmVqZTexFEPlsdFRhkiQ70VJnqCDTUKHARv/KbP8S4ecAMQXd8WBTGEhh1Eg0WFL
         ow6/qOFR9PT1TX7pRWjGwY1egeCAH5fPfKJDzMtOJAcjc8RL/SKpUClG6CLrcIZcHeb9
         PEZf3TNONWu1sDy+qLFM98j7aZ1dJ6L+pif+E3+JGSENF8ll2/Etnh6tL8udKEgRc3uL
         QxQDaW3+5olmdHxp3pZZeULzRuCQC5wr49CT+iWMHoiEwHiyIv8nECLw9nnkY7Cnld7c
         MlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701927125; x=1702531925;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnvGGl844Mt88/eDFjnKsRhrcFq+x0ulAemxO2S+bfU=;
        b=DyUlFr0G5wd/KIbaAiEhOvrb59c+XVTwKcvDGNK803/Jc++kTlTEY4WGsajHVya12f
         QqZmWn6ipZwfn76a8iLISCbO7hqEEptFevPlowh0qdUpcXExZMzES1h9qg1zP6Mq81Tj
         WzpPgtw6ci7gdBns8LmkiE7FR8Jc/bi1V4zqZ54lpl3kaiYgv9hoB6yWrCTuLMlShMIy
         1pNAbPMTaLyoIhrMtxQgYpc79810Iw5azrihSEdads+Nyrjg6xLa6l8zv6Xx0Wfj9LIr
         uZsqa0EvZwa2KORIxK0g0xzoiYUhVxDNGP5p5iXpnjkFsLXw/VqfS+2MRYY0qZ18RkwH
         UhQg==
X-Gm-Message-State: AOJu0YwbmWEe+iCRPNJ5HjrVUWaOtTpFFuw/+MXfWq0wvOaTk71LvCY0
	TD1NG/WYSl3IW6qB1qbUGg2a
X-Google-Smtp-Source: AGHT+IH6OaEgUEGq8ikcE2Z92TNqQ+21Ktn5NHM/RrKbtopBSOAZZ3yFsq/Flh5tRCPQL4wEiSO+OQ==
X-Received: by 2002:a05:6a20:3d8e:b0:18d:2748:ea22 with SMTP id s14-20020a056a203d8e00b0018d2748ea22mr1917241pzi.17.1701927125136;
        Wed, 06 Dec 2023 21:32:05 -0800 (PST)
Received: from thinkpad ([117.248.6.133])
        by smtp.gmail.com with ESMTPSA id y16-20020a17090322d000b001d1c96a0c63sm378626plg.274.2023.12.06.21.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 21:32:04 -0800 (PST)
Date: Thu, 7 Dec 2023 11:01:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com
Subject: Re: [PATCH 11/13] scsi: ufs: qcom: Remove unused ufs_qcom_hosts
 struct array
Message-ID: <20231207053159.GC2932@thinkpad>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
 <20231201151417.65500-12-manivannan.sadhasivam@linaro.org>
 <sqdgnfedt5j3epypmsvb7lv6gvmjrymtuieji3yhqsfvniiodl@f3aj73mlshxy>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sqdgnfedt5j3epypmsvb7lv6gvmjrymtuieji3yhqsfvniiodl@f3aj73mlshxy>

On Wed, Dec 06, 2023 at 12:54:43PM -0600, Andrew Halaney wrote:
> On Fri, Dec 01, 2023 at 08:44:15PM +0530, Manivannan Sadhasivam wrote:
> > ufs_qcom_hosts array is assigned, but not used anywhere. So let's remove
> > it.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/ufs/host/ufs-qcom.c | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > index a86f6620abc8..824c006be093 100644
> > --- a/drivers/ufs/host/ufs-qcom.c
> > +++ b/drivers/ufs/host/ufs-qcom.c
> > @@ -90,8 +90,6 @@ static const struct __ufs_qcom_bw_table {
> >  	[MODE_MAX][0][0]		    = { 7643136,	307200 },
> >  };
> >  
> > -static struct ufs_qcom_host *ufs_qcom_hosts[MAX_UFS_QCOM_HOSTS];
> > -
> 
> I think we can get rid of MAX_UFS_QCOM_HOSTS as well with this change in
> place?
> 

Yes, thanks for spotting.

- Mani

> >  static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
> >  static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up);
> >  
> > @@ -1192,9 +1190,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
> >  
> >  	ufs_qcom_setup_clocks(hba, true, POST_CHANGE);
> >  
> > -	if (hba->dev->id < MAX_UFS_QCOM_HOSTS)
> > -		ufs_qcom_hosts[hba->dev->id] = host;
> > -
> >  	ufs_qcom_get_default_testbus_cfg(host);
> >  	err = ufs_qcom_testbus_config(host);
> >  	if (err)
> > -- 
> > 2.25.1
> > 
> > 
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

