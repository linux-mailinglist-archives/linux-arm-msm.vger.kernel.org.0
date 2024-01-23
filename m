Return-Path: <linux-arm-msm+bounces-7975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A058A839238
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 16:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB978B28F44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 15:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0535FDD6;
	Tue, 23 Jan 2024 15:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VXINKWz/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A2E5FDC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706022672; cv=none; b=A/YMIWH99vEJO5oeDL1J/DMSyFs0VcojjDPeJLuQ/PR05QBNwQQGpVUc1hFXrr3cEGwlsfjkk0xhlWicUhihQqbIrodzG5gilffCyza6qJTtaWCj+E1cj69ChriAKutWO+2N6YqvvBEEkQn7ck65yYb0bbxFaLb5IP3x8BP/SvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706022672; c=relaxed/simple;
	bh=PPm9boZjwBn6Xzyt0g83ZrbCoWDaQwNE36cwpign/kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wf3li3wxSMTeOyaAiY4XA8W1ja3NE4/pQ8bY1p0DjExrKkuIYU52UW+ecUFp3aew19YZ+Z6g/zGhODwicS1WvxbVGt+nBbzKPLQ4BTFmprsEJW5icnUMoCGK8SmF79zv7NtoGciIiggqMvYtNU24p6XH6O6TEqTrCRjPN3elAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VXINKWz/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6dd7b525cd6so478214b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 07:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706022670; x=1706627470; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4TDMZtp4Rk/MyqeG91tpztAQaCoeOy1ImodF5oM5/C8=;
        b=VXINKWz/RqJyQsbef7Qhp0b/TaaiZaU9h32F8bwFGfE2hx378WqsEsgdYNZg5X3LJO
         n9ttFF0Bf9X9lBSRyO29FUcTtL9X6l9XA1MR2KMnPFta9wCESIMkOGyX9HlovJNP8S2I
         fKaRsVbWuF/e5WPKhJL6pyM9XhrmwzRM8n2iWBhEbuX7oDubPOSpqPtvmMDODcYqtn4H
         KfkK8imYEsvwpj7qAR97meraLk2jPWpzaGE6QUI5pBE9eaObSCU+7UCNkV46+e+EaF87
         xXKGVYnyPn1m1mzu1GP7j3KRDuESiwm+RabSJ8Iv74d8hc/p+Bz+axJF00AqRKRQS8HE
         HE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706022670; x=1706627470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4TDMZtp4Rk/MyqeG91tpztAQaCoeOy1ImodF5oM5/C8=;
        b=biweB/RyJvkuN3TAoG7EtDxfvyKfSOG1bhn2YP1faJ3tAlh1Wo0Vspc8m1w99x7EJM
         DpXGFBvXfrkzl0JW8nS9gYHiovq+mAUXTEA4afasQJ4eYEuD1GDMjE+kSjdyJ/6WKIiU
         TK5p29cuEKF8pnhh59g6Fe/OPjkI6ZKeM8b1ZwsS1E6mwyYcm8hRrRsi/dpKKa2TwI4D
         hTOBqovHPq1n5/c7L7vAyLnYEkPcQuDqSiW/aHCKdmeQcBetRLCOmDZ68cmlz2z188Gs
         V1fL4f4f54IK1nkYVYFF/B9YOX41uf80J6hLostJRsQAoFchtoPvqprEy20BMEYWs6zc
         IbiA==
X-Gm-Message-State: AOJu0Yzk74TrI/uph46ewMJEiHSvhRexfDBiZOix3kVU2zGqtBGMTTAb
	RyiWTVrH+bzb1CFLy9CdaRsUwXsmDfjqSishK7dpN0CxTw9t5jsQcPZwVi0SSA==
X-Google-Smtp-Source: AGHT+IEOKhrSQ2AAiD6B4preFnkzitZWz56/vBVAw7INI+RAQyhQg8QHxAEyl6Hrgx0FmHXbiPe34Q==
X-Received: by 2002:a62:5e06:0:b0:6d9:eb24:4c5f with SMTP id s6-20020a625e06000000b006d9eb244c5fmr2890544pfb.37.1706022670014;
        Tue, 23 Jan 2024 07:11:10 -0800 (PST)
Received: from thinkpad ([117.217.189.109])
        by smtp.gmail.com with ESMTPSA id y22-20020a62b516000000b006dbd2405882sm6021527pfe.148.2024.01.23.07.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 07:11:09 -0800 (PST)
Date: Tue, 23 Jan 2024 20:41:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Eric Chanudet <echanude@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: avoid re-init quirk when gears match
Message-ID: <20240123151102.GE19029@thinkpad>
References: <20240119185537.3091366-11-echanude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240119185537.3091366-11-echanude@redhat.com>

On Fri, Jan 19, 2024 at 01:55:47PM -0500, Eric Chanudet wrote:
> On sa8775p-ride, probing the hba will go through the
> UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH path although the power info
> are same during the second init.
> 
> If the host is at least v4, ufs_qcom_get_hs_gear() picked the highest
> supported gear when setting the host_params. After the negotiation, if
> the host and device are on the same gear, it is the highest gear
> supported between the two. Skip the re-init to save some time.
> 
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
> 
> "trace_event=ufs:ufshcd_init" reports the time spent where the re-init
> quirk is performed. On sa8775p-ride:
> Baseline:
>   0.355879: ufshcd_init: 1d84000.ufs: took 103377 usecs, dev_state: UFS_ACTIVE_PWR_MODE, link_state: UIC_LINK_ACTIVE_STATE, err 0
> With this patch:
>   0.297676: ufshcd_init: 1d84000.ufs: took 43553 usecs, dev_state: UFS_ACTIVE_PWR_MODE, link_state: UIC_LINK_ACTIVE_STATE, err 0
> 
>  drivers/ufs/host/ufs-qcom.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 39eef470f8fa..f9f161340e78 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -738,8 +738,12 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  		 * the second init can program the optimal PHY settings. This allows one to start
>  		 * the first init with either the minimum or the maximum support gear.
>  		 */
> -		if (hba->ufshcd_state == UFSHCD_STATE_RESET)
> +		if (hba->ufshcd_state == UFSHCD_STATE_RESET) {
> +			if (host->hw_ver.major >= 0x4 &&

You can get rid of this check as I said in the reply.

> +			    host_params->hs_tx_gear == dev_req_params->gear_tx)

How about?

			/*
			 * Skip REINIT if the negotiated gear matches with the
			 * initial phy_gear. Otherwise, update the phy_gear to
			 * program the optimal gear setting during REINIT.
			 */
			if (host->phy_gear == dev_req_params->gear_tx)
				hba->quirks &= ~UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
			else
				host->phy_gear = dev_req_params->gear_tx;

- Mani

> +				hba->quirks &= ~UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
>  			host->phy_gear = dev_req_params->gear_tx;
> +		}
>  
>  		/* enable the device ref clock before changing to HS mode */
>  		if (!ufshcd_is_hs_mode(&hba->pwr_info) &&
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

