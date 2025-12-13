Return-Path: <linux-arm-msm+bounces-85135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0175ACBA456
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 05:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADA4E308F228
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 04:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009FA12CDBE;
	Sat, 13 Dec 2025 04:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzveGwpq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBRpaKt2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB50C8F0
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 04:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765598503; cv=none; b=htyd90WVZlrbOZseEve96B2JwyOzC1EPG3xWIzm0y7MHXVZeJOZzScOi/f6CeA6bi397ula7i55ZhJdy15UBGIMPtF3QLG5ootReHWmFObiL/FlJK5Inlp5eo3itsesPWAC35wX1Oj/J/gFshS5ciVCfi6m+e9x9NCqM0fPkl94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765598503; c=relaxed/simple;
	bh=vwiZYPfOQvunfhjxyDYYfW8jvyT3qy1mEalXZqzJyQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXPqct2V2aR0vzSc9aBy1TdGZhK424KF7ys5c2lp64u7K2F1ZvNX1zjVAtOP+xdM/U7NvgBQYKLJ6t+dh7TksQNJVjZwTdggag6uCgjVbjORLpLXhfS8VJeFnZI7/eqEng+feTP+X9UlbQmwO+A4ncJdjblS0IULzlo1SDtJpRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzveGwpq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBRpaKt2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD2oG6j2001484
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 04:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LcNVAJsLGQf24kG2wRpel78O
	cIah1cBrBEulv8MZ6Y8=; b=YzveGwpqsxyZMxL+MIWY6mbtC40VeRt42mhWiAQK
	Wu3ASXaVCOZC3omld1a4BoNsJpoLKcf5ITq5he34sUjdHCV8z+UMjOA60oLrMayi
	bnDw3cv6Lu6Fjc9j1/hbTRsAvYsIOlRh60eelyqPF79E8scE0puEOXlqRD6WrsEI
	Xwg26V3QxPAsawjRI9VOuL0mz2bCP19fJtGXHwE1yjqz0F+KUqspWNLKzW68Q9+y
	VSIezrJMUXYXMcwkIYfOuWtaIJUZ29xf0kki072Cr5pZHpkbBx3W61XydXQibkJp
	Du8agDyyiaVewnsRAMtMhJluIcjCXEPD7lZPDjRzEVDvyA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b04r8udvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 04:01:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee16731ceaso36237241cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 20:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765598500; x=1766203300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LcNVAJsLGQf24kG2wRpel78OcIah1cBrBEulv8MZ6Y8=;
        b=LBRpaKt2IXx+7cHx+8dZNwNuPr6Vb9wFOSZfav3cCq48YF2x9gImmDly+Tugwem6Rl
         nTy/2JsCbj11nqz4cMqp2jd0jiNVaJ+zNG7rrhPeNHyEL/8Y02cxPE599qcwKE9ULcT1
         G4jFpezTQTiEq+sDew/xIfzesErjRaYnygLlcErZI5nGetV9nYkfDNWFAxdMVPVJue5V
         lznFt/ia8pVsiQTH2xUiIdkaABtxAlGp7OQsrFlz36bnzfKWVmQLrtyu/CKVNvGvQEuE
         mlpyLG8unu5wDCYkSOARkTD2ZC/mj9BGrQBCidf9FusR2mlGTaOmFC3OBpUk3gxgyLxB
         lXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765598500; x=1766203300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcNVAJsLGQf24kG2wRpel78OcIah1cBrBEulv8MZ6Y8=;
        b=ko70sfbH+0yhqNS4qVU100s/6IQ6qslMhgMsIRx+DHT5fcUiw+QRF2de7LPROXdh7d
         h28IwYWER7HfP0IYJ4SbRIS36aY8gjXOD/SmVeYUaUdpMUeAJCdqjswbDA7nh66UhlIe
         rtX5XT+0ZGCjthn/6lwd37aD20+gEvhEDdcN9gp67crTcOOlVQLXsYYKDHkWeUCfHJLD
         2QJE+7nc0WqDTqlHVG6zKGSsRMF3r3LlzaY5cLuOM25XSJxVRE+TPQN5SSHhe+e4SxKu
         7f6PGRkXosS1V1FhIQtf03GS6JchJ0TGBLoHpk880X8rCEYAzEKlQtYQMzdGa8CHBelI
         5bJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgkRuEMhOYYWxz3DmJO9AOxiT4y+npvj0KZk2yBJ8xZqVrqv0CZ0tY6YkNjMvRqyORwHjvCO98HGQnDo9s@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8z3UmChiceO4eLWfAI7p8It259frCQcbWWBEe3kIdLS6h3rjQ
	1zqhi7xd6BQ6VPcE39soqbIPxoy2+tlxXDfs+M4upGwYGtaNk55oe3OdnEg4G3hpOd3r8LdTq6x
	zQQZ9L7ROGkiCXdOT3FP5dWzDRxhkuuTGihG8W7+NqXXGH7mkgDT+A9N9zx3+KIoKry70
X-Gm-Gg: AY/fxX5VrlQ7WjeQSGgTQeu+99A4KhRa6+AvN86th/qB15viFAAE6iX2vfBUnf6TH4U
	YYc4x9PNL4enqkuKjPWlpctF3h8rvoqcksj6rQqHrGgPaOC0oouuEKSzOBLXb6hYyGVQ2A+yPPJ
	QGmLNAeb7D1tF9bPMPwyQTZY+L6r/3mFsqx/itnPr8t7ibb89jHK6FK8rUKw+8kMesWM2AHux/O
	ra38vybCJUPLLtnS3yK7V04pCLzogPI5UKQOS2GGtmXZ9wOA1RDXpgrJBXzfkZu8ujy1hoU0mD3
	w5kgo4YXPDuX3TY3kop7fdJi5cN5FCKt8SJYX9cyelzn4AAQD7erBVkcs/E6tx3uv5/yDntksw7
	aj5hofRyfRYXoMa7xSpoSehSAIZJ9A60d5oUzV+BQgN6i3n7An1fkTj6QRbDDjVTd+LNFCpsHnO
	MmGasN089w78SN7GQffv0Hqdo=
X-Received: by 2002:a05:622a:41c5:b0:4f1:e2a4:db39 with SMTP id d75a77b69052e-4f1e2a4e0ecmr999771cf.4.1765598500314;
        Fri, 12 Dec 2025 20:01:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB6fsoDzbxK5AIYGHnnqvCIiJWXQuSf+BANSN6Bb11p3TUXgUWgwzIVGKz2HvArPjz2uurUQ==
X-Received: by 2002:a05:622a:41c5:b0:4f1:e2a4:db39 with SMTP id d75a77b69052e-4f1e2a4e0ecmr999371cf.4.1765598499798;
        Fri, 12 Dec 2025 20:01:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f3eeecsm2643794e87.30.2025.12.12.20.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 20:01:39 -0800 (PST)
Date: Sat, 13 Dec 2025 06:01:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: rcg2, msm/dsi: Fix hangs caused by
 register writes while clocks are off
Message-ID: <aeefcr2yynlgnkiocv5eeqs4heaym6bts55z5iziqkysdzzqnt@oz2yau4nqwq7>
References: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
 <20251213-stability-discussion-v1-2-b25df8453526@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213-stability-discussion-v1-2-b25df8453526@ixit.cz>
X-Authority-Analysis: v=2.4 cv=e/ULiKp/ c=1 sm=1 tr=0 ts=693ce525 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sfOm8-O8AAAA:8 a=P0BQ7NvINjiI-4SoFKYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: I9m72KS7WY9BG-sbwFbYyfkPDBSMZNM-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAzMCBTYWx0ZWRfXzVqW4rGY/9Yw
 AvbyUAJ5VdBuwLMj7RTHliS489iXizk7mRY4rRw9+gEc0WD2owdRPH0aNXvWXerdOoCuz4KFZ/m
 CzGv+2eBc4NB7nWmkYOAE5KmYEGXQZl/NmePzLpo/2+5HdYJ8xflo1fnAD8UKuXXVdoawGJI2T6
 d56wjyZe7SyqBnUIoYmU0TkuzC+KFxa0EGseQGyoPqW8sa8Uu8r2wUfAmC692pfNaXrxDomFLY3
 PR5c1zuc1k67lhlbp/IeoG/Sh9wUhs5NonI7Td7hIHWW40+6lx4ZBYfB/nZK9LxuN0OLdP8rrfd
 PJzwefmw2VTSEWhXARglxd+VQVXimbtc1bq1YjXQP2Ko/LhUhUVCn8zojpTsXbAX4JwndCD1Bcl
 aI8klCrDVywnTH4OG+s+vD7PnIYSbA==
X-Proofpoint-GUID: I9m72KS7WY9BG-sbwFbYyfkPDBSMZNM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512130030

On Sat, Dec 13, 2025 at 12:08:17AM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> This patch fixes system hangs that occur when RCG2 and DSI code paths
> perform register accesses while the associated clocks or power domains
> are disabled.

In general this should not be happening. Do you have a description of
the corresponding code path?

> 
> For the Qualcomm RCG2 clock driver, updating M/N/D registers while the
> clock is gated can cause the hardware to lock up. Avoid toggling the
> update bit when the clock is disabled and instead write the configuration
> directly.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/clk/qcom/clk-rcg2.c        | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 13 +++++++++++++
>  2 files changed, 31 insertions(+)

This needs to be split into two patches.

> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index e18cb8807d735..a18d2b9319670 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1182,6 +1182,24 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
>  		f.m = frac->num;
>  		f.n = frac->den;
>  
> +		/*
> +		 * If clock is disabled, update the M, N and D registers and
> +		 * don't hit the update bit.
> +		 */
> +		if (!clk_hw_is_enabled(hw)) {
> +			int ret;
> +
> +			ret = regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &cfg);
> +			if (ret)
> +				return ret;
> +
> +			ret = __clk_rcg2_configure(rcg, &f, &cfg);
> +			if (ret)
> +				return ret;
> +
> +			return regmap_write(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), cfg);
> +		}
> +
>  		return clk_rcg2_configure(rcg, &f);
>  	}
>  	return -EINVAL;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e0de545d40775..374ed966e960b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -762,6 +762,12 @@ dsi_get_cmd_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
>  
>  static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
>  {
> +	/* Check if we're already powered off before writing registers */
> +	if (!msm_host->power_on) {
> +		pr_info("DSI CTRL: Skipping register write - host already powered off\n");

It definitely should be dev_something. Probably dev_warn().

> +		return;
> +	}
> +
>  	dsi_write(msm_host, REG_DSI_CTRL, 0);
>  }
>  
> @@ -2489,6 +2495,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> +	int ret;
> +

Extra empty line

>  
>  	mutex_lock(&msm_host->dev_mutex);
>  	if (!msm_host->power_on) {
> @@ -2496,6 +2504,11 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>  		goto unlock_ret;
>  	}
>  
> +	/* Ensure clocks are enabled before register access */

And this looks like yet another fix, prompting for a separate commmit.

> +	ret = pm_runtime_get_sync(&msm_host->pdev->dev);
> +	if (ret < 0)
> +		pm_runtime_put_noidle(&msm_host->pdev->dev);

pm_runtime_resume_and_get()

Also, where is a corresponding put() ? We are leaking the runtime PM
counter otherwise.

> +
>  	dsi_ctrl_disable(msm_host);
>  
>  	pinctrl_pm_select_sleep_state(&msm_host->pdev->dev);
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

