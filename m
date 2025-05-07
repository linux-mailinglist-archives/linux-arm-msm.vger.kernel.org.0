Return-Path: <linux-arm-msm+bounces-57119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A30AAD9FD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F6724C30B9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A3D1B85F8;
	Wed,  7 May 2025 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nHC3M9pu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657BE213E81
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 08:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605966; cv=none; b=QzjIxfsCHRIRNyBCmFp/2gGsv74Bg/UWcZpDMDGCpy68N/WkrC2OAdKFn6hG7KfkPXBADP6h937K+C5U50XYHJrJqMMIbhLIWQjn5/SJfgGoevnMMHLXCsMdGBMxnCOoGB72i+1EzjR0CdN7S0tef5fAtcgPofyXHYW7c3jmi4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605966; c=relaxed/simple;
	bh=Qs1xtwlmZfTdjuWjeZKgY5RsY0l4uekIhHnSOvkO0Aw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gGH4N+D84H8YRr2hHF4Ddo19N+HNXv8CeIoS+n4EbQKkywpSY7F2XnF0X11hY2sTRV2g4aWWzv72/lKgowQrLOTQ6DDSJrJypwBJh1Hh4d05I//rMRYjFM7DaFTJhv7kdLDMTUuJYVDeDnP958gZuqEib+72tzs/FmHZPmBK2Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nHC3M9pu; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac34257295dso382425066b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746605963; x=1747210763; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Zdo3sQ6HkJht2f5nXLXDOh1pSVHvyEfnBXICzp6Ti8=;
        b=nHC3M9puraDIz09c0Dw8/BYnuYKUWzzt0ZpgNk0LHXQeub2f/DaAaCmUm+DaStwJu8
         A3gzjs/SZr/GkJkP+l/5Wp8QmhJKSBngaUpyXEI4KZbDe+DRg/f8/4y233uxD9fIif76
         zoAqXDWPoZOgzBQ9JJVVFm5FJy+gcI14ab84a89dd+QExwCUKB7VNroIjJT9wMwt2QiG
         7CxmDBWA+q0YiH/AYhirU6qCnSS8hRBJASEpehgquGGdE3pSQCIK5stviM4QxCmBovTf
         DY1eT11PyTiBhrhD4z+YIuwRaIzMtspUF5kHfpN9ol8MfTKHVKsEU+C0FzBgRqawek3b
         2w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746605963; x=1747210763;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Zdo3sQ6HkJht2f5nXLXDOh1pSVHvyEfnBXICzp6Ti8=;
        b=rPKvPOQprxFIMWCSgmf4EgKqUVyx08y6hfeI+fxhVxzvXsBxYrWMQ9wfASeW59lwcK
         8ix6K6tylQUgyEzNmsQMpeYT3KX1Yz7aIihRoVrM0ZNSQC/WmNzonyrklYM81L1gcWTe
         J76WD2KayB/qzpVVn1iLTp0Hj08vqkzxL/WEhzpZXo4ffEcERrfQ8wfz88sHajQAIAuj
         v6pBpff+2gEqo4DV5qUJyzTB24k8os6o3eztEQNjGNnb5OQwhMctN3g6J13HC+efmE5m
         rvAldRYpOD80Tq/NYUSb24LYHdP7bBBsYUH6D6K8EsSllqF8ksCTHISfj7ZMMoLkLR3w
         oOsw==
X-Gm-Message-State: AOJu0YzgmoyWp27JIIyuCC8J4CGR4nLcd30hPtsPZhjds37mpqfvxDJ+
	Gqf8/797XpXVjk0om7bjjxd9L4EPOKCwam5A3YtMV+fHsMQxkB2EZZq7R23Z1cY=
X-Gm-Gg: ASbGncvw+lCGGp1aF/qQaGXSK0ZQH3rpzc5WCnnPEnL57hY510QNAH2SPTrjR/4zEQB
	BWpxRqwT/HA4HZaPnh52WZ9dXdhgUKHsEkNxpJkYa9YlI/feAzZWYNlvsrBkAWjhYIyed5EZvk3
	L6Rd8FWbBILW/x4SskAXqcOwBiCeH5PnTHqM/xNIqG20ODGNd1T+9cYfQpTEZE9iU376LSc/q2O
	bh3khz4pm0iyM+oKqoR6/xbbDbtupveBCJBJZeVJwgM5p9Q6fBscOCxJypH6OlRGN87HuUGKqaR
	KmlQNuvHrT8JIppqAVHgHj44TqOmde9FXjU8XunMXaj/XFOVAe13gQK7DS55gBObOOH8aHDM7wA
	Vu3P3Dx08gg==
X-Google-Smtp-Source: AGHT+IF6eYn3NMUcju73PprGzrvWTDoqzQBMmrsTtNwnfeQYTz03kGFQZmK9f3nJezyms/oYhCgDdA==
X-Received: by 2002:a17:906:dc8b:b0:ac3:b12c:b1f2 with SMTP id a640c23a62f3a-ad1e8bf70damr211096566b.35.1746605962591;
        Wed, 07 May 2025 01:19:22 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0202sm863207066b.93.2025.05.07.01.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 01:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 10:19:21 +0200
Message-Id: <D9PS51XVRKLP.1AHMCRH9CZFWU@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro
 Core Clock freq
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Ziqi Chen" <quic_ziqichen@quicinc.com>, <quic_cang@quicinc.com>,
 <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
 <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
 <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
 <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
 <neil.armstrong@linaro.org>, <konrad.dybcio@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
 <20250507074415.2451940-3-quic_ziqichen@quicinc.com>
In-Reply-To: <20250507074415.2451940-3-quic_ziqichen@quicinc.com>

Hi Ziqi,

On Wed May 7, 2025 at 9:44 AM CEST, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
>
> On some platforms, the devfreq OPP freq may be different than the unipro
> core clock freq. Implement ufs_qcom_opp_freq_to_clk_freq() and use it to
> find the unipro core clk freq.
>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 81 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 71 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 7f10926100a5..804c8ccd8d03 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -122,7 +122,9 @@ static const struct {
>  };
> =20
>  static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host)=
;
> -static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long=
 freq);
> +static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba, =
unsigned long freq,
> +												   char *name);
> +static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale=
_up, unsigned long freq);
> =20
>  static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_d=
ev *rcd)
>  {
> @@ -656,7 +658,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hb=
a *hba,
>  			return -EINVAL;
>  		}
> =20
> -		err =3D ufs_qcom_set_core_clk_ctrl(hba, ULONG_MAX);
> +		err =3D ufs_qcom_set_core_clk_ctrl(hba, true, ULONG_MAX);
>  		if (err)
>  			dev_err(hba->dev, "cfg core clk ctrl failed\n");
>  		/*
> @@ -1414,29 +1416,46 @@ static int ufs_qcom_set_clk_40ns_cycles(struct uf=
s_hba *hba,
>  	return ufshcd_dme_set(hba, UIC_ARG_MIB(PA_VS_CORE_CLK_40NS_CYCLES), reg=
);
>  }
> =20
> -static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long=
 freq)
> +static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale=
_up, unsigned long freq)
>  {
>  	struct ufs_qcom_host *host =3D ufshcd_get_variant(hba);
>  	struct list_head *head =3D &hba->clk_list_head;
>  	struct ufs_clk_info *clki;
>  	u32 cycles_in_1us =3D 0;
>  	u32 core_clk_ctrl_reg;
> +	unsigned long clk_freq;
>  	int err;
> =20
> +	if (hba->use_pm_opp) {
> +		clk_freq =3D ufs_qcom_opp_freq_to_clk_freq(hba, freq, "core_clk_unipro=
");
> +		if (clk_freq) {
> +			cycles_in_1us =3D ceil(clk_freq, HZ_PER_MHZ);
> +			goto set_core_clk_ctrl;
> +		}
> +	}
> +
>  	list_for_each_entry(clki, head, list) {
>  		if (!IS_ERR_OR_NULL(clki->clk) &&
>  		    !strcmp(clki->name, "core_clk_unipro")) {
> -			if (!clki->max_freq)
> +			if (!clki->max_freq) {
>  				cycles_in_1us =3D 150; /* default for backwards compatibility */
> -			else if (freq =3D=3D ULONG_MAX)
> +				break;
> +			}
> +
> +			if (freq =3D=3D ULONG_MAX) {
>  				cycles_in_1us =3D ceil(clki->max_freq, HZ_PER_MHZ);
> -			else
> -				cycles_in_1us =3D ceil(freq, HZ_PER_MHZ);
> +				break;
> +			}
> =20
> +			if (is_scale_up)
> +				cycles_in_1us =3D ceil(clki->max_freq, HZ_PER_MHZ);
> +			else
> +				cycles_in_1us =3D ceil(clk_get_rate(clki->clk), HZ_PER_MHZ);
>  			break;
>  		}
>  	}
> =20
> +set_core_clk_ctrl:
>  	err =3D ufshcd_dme_get(hba,
>  			    UIC_ARG_MIB(DME_VS_CORE_CLK_CTRL),
>  			    &core_clk_ctrl_reg);
> @@ -1479,7 +1498,7 @@ static int ufs_qcom_clk_scale_up_pre_change(struct =
ufs_hba *hba, unsigned long f
>  		return ret;
>  	}
>  	/* set unipro core clock attributes and clear clock divider */
> -	return ufs_qcom_set_core_clk_ctrl(hba, freq);
> +	return ufs_qcom_set_core_clk_ctrl(hba, true, freq);
>  }
> =20
>  static int ufs_qcom_clk_scale_up_post_change(struct ufs_hba *hba)
> @@ -1511,7 +1530,7 @@ static int ufs_qcom_clk_scale_down_pre_change(struc=
t ufs_hba *hba)
>  static int ufs_qcom_clk_scale_down_post_change(struct ufs_hba *hba, unsi=
gned long freq)
>  {
>  	/* set unipro core clock attributes and clear clock divider */
> -	return ufs_qcom_set_core_clk_ctrl(hba, freq);
> +	return ufs_qcom_set_core_clk_ctrl(hba, false, freq);
>  }
> =20
>  static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
> @@ -2081,11 +2100,53 @@ static int ufs_qcom_config_esi(struct ufs_hba *hb=
a)
>  	return ret;
>  }
> =20
> +static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba,
> +												   unsigned long freq, char *name)
> +{
> +	struct ufs_clk_info *clki;
> +	struct dev_pm_opp *opp;
> +	unsigned long clk_freq;
> +	int idx =3D 0;
> +	bool found =3D false;
> +
> +	opp =3D dev_pm_opp_find_freq_exact_indexed(hba->dev, freq, 0, true);
> +	if (IS_ERR(opp)) {
> +		dev_err(hba->dev, "Failed to find OPP for exact frequency %lu\n", freq=
);

I'm hitting this print on bootup:

[    0.512515] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for exact freq=
uency 18446744073709551615
[    0.512571] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for exact freq=
uency 18446744073709551615

Doesn't look like it's intended? The number is (2^64 - 1)

Regards
Luca

> +		return 0;
> +	}
> +
> +	list_for_each_entry(clki, &hba->clk_list_head, list) {
> +		if (!strcmp(clki->name, name)) {
> +			found =3D true;
> +			break;
> +		}
> +
> +		idx++;
> +	}
> +
> +	if (!found) {
> +		dev_err(hba->dev, "Failed to find clock '%s' in clk list\n", name);
> +		dev_pm_opp_put(opp);
> +		return 0;
> +	}
> +
> +	clk_freq =3D dev_pm_opp_get_freq_indexed(opp, idx);
> +
> +	dev_pm_opp_put(opp);
> +
> +	return clk_freq;
> +}
> +
>  static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned lon=
g freq)
>  {
>  	u32 gear =3D 0;
> +	unsigned long unipro_freq;
> +
> +	if (!hba->use_pm_opp)
> +		return gear;
> =20
> -	switch (freq) {
> +	unipro_freq =3D ufs_qcom_opp_freq_to_clk_freq(hba, freq, "core_clk_unip=
ro");
> +	switch (unipro_freq) {
>  	case 403000000:
>  		gear =3D UFS_HS_G5;
>  		break;


