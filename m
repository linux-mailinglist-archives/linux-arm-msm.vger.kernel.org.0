Return-Path: <linux-arm-msm+bounces-60882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E36AD45BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 00:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9007189A6D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 22:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB102868B5;
	Tue, 10 Jun 2025 22:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PmLD9O9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED44623BCF8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593635; cv=none; b=JxzDXkgIN9Z7gkesvB8MBHT2UEDAhMRVwEYPqYWY0O2gBub0aFwpoK0W6HNkbQj5WQ58fGGnPbxqI58s+3vhWWvhlWKw8LRRYDKSbtfakV/8dYo9Cc37dGcY5F7qwwNQmmka2O0cFbmHvLsQtihyN6rWuLrk819R8wox75f8v08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593635; c=relaxed/simple;
	bh=5cPrOngH34ZskjJ0Ie0Pe6BjzQfwk5fPbKe3h+bKupE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDh8gzqzTY05RWl0spNF6pTLx9S7ATC5zOteALr53r4R5FnKcc6OW7UA92FimWBmM/gzjjgMH+kttkAlpvAb+NoNvkKh0ad2/0ltWEQ5xqZijtbrn7Q4q/BvOfdyX49Ukf82JQtpPnC4b8NDlMliGOvQ8PLveDFHhaVkod2uufQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PmLD9O9L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPoDt016716
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Om5CnCqBrphXA78M8+yvq9Gl
	bcxxbkcFH/cFOjrYlio=; b=PmLD9O9L8IonovYOqFTMd5qXv6tHnFtJyIECGbO6
	13U3KoU7TCkmdKWICdAk7nrZ4Z8L1zssLa2wCjOJNNqfDjJA/p0yXen+kJFAu1Yl
	BFJPEz8gWndej4RGxMFEpX83tRuMc62VbWfZTEZEsQZYZIh7cN4ZP7Xh/GJ1qI6u
	Ayh/6Gr0QH40DbRsWpVdEaFDF3d6ZieBtTPoz/CDSkWdkj2g/1TUToBFUBxowsYF
	8d7b74SRWRyGoToE7qT/0BwF3VGLAJqhAiVt3rwixIcCxEajJABasE1h/+zV2Bwe
	kEtwKrrsF1hk2V4Jn+N7I+klosSUJZ52A9Acy0xAsn8QOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnajkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:13:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d399070cecso360772185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 15:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593628; x=1750198428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Om5CnCqBrphXA78M8+yvq9GlbcxxbkcFH/cFOjrYlio=;
        b=srB3DfSsgm8gUsv6yjeulW1CoMpGIv03PYL2hHBHlg+Mr3PcM8/IUCxVEBSzH14+j6
         7dy51sYRzDqeWdm+L5Vqtjvp7t+hsy4Uy5MuhKwqJ+lb8Scv87Scykr0odXC2GbCeN8P
         AD+FG07PZ612H74s/QfZnWcULMFWInTcDHRAbPdsicbCaoEz989hk6u3wOGwN1woZlKt
         Wu3VQCbTEh+ARIyUnqeOc3RfR5okekf8f3ltF6gDbXCygNmLYYfY80VKUt6N8Bz2Dc+x
         qxLM0uiO37rlIc5c4m4JkDQm7hAH86NY4pbbATq2c8JubRP7kA80PqsZxfpsyq0IGNW/
         abng==
X-Forwarded-Encrypted: i=1; AJvYcCW40bDtJlqjzDV5vcXEsQe0DfcFhPSbScS0KfSeS93+nm5NJRtWYzgtWdurDYsG5YGu8mXN0epqgTZ+8nkK@vger.kernel.org
X-Gm-Message-State: AOJu0YzcxuJ6MAYSmBNRHq/gtmM5vw0ZNjAm0jmZ+j4zCjd2wDN+Z/QK
	KYRnAv6z+E6UAB2qb7hgDJcfer1zqpTvLV+ONAQ1RHDtSLzldiy/I5EugX5sixwWT+tpuVt41WH
	hiBKagMN+OunIG0iraKCtvCHt1DpcZ+0P33mY/Ofma5K7n7J6qV/tLn/9YKbnkufGJEh1
X-Gm-Gg: ASbGnctMLveGGSijurwt0s5M6YwPKLNA89QxA1sHgxTzP0iNmuhyB2y4E7jdQDftROg
	0B7X8remC88nGz0lzTFw5sAd/K+GQR2i9uW972I3XygiKAepLISPV6n5ga2seZqcMgxpZm23l8s
	DeR2k4OKi4nuVs2f5fU/gs6+/0gXFlQwcelwi+YnRiF/VWR+5txC3YeZrxfrqwzphPoI72nRhxB
	DwJU7+5ZoSDbjLcqQJxWZ7iSdwrqN5PvYRwJIb+amHz20elR9CUn3ZP5u7hmVf6InkW0PeY41mn
	XxE0QrhQZYgAxbL1+48In86oi7gbJaxb+VpgvDx7MU0IgtsCLYYfvWtbzdTnym2Eti4bpy23rmd
	a/CFtS6171VWuNq1W7AzJrXEsSZMpfk+lGQw=
X-Received: by 2002:a05:620a:1a0a:b0:7ce:c604:3f53 with SMTP id af79cd13be357-7d3a880db31mr144759385a.24.1749593628048;
        Tue, 10 Jun 2025 15:13:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkR/rgawQIqItRoAtofycgRlFovtJqLTPqRUHHzSmcmfKvyj/WssHDU5FcyI0gN/rfAVoU/Q==
X-Received: by 2002:a05:620a:1a0a:b0:7ce:c604:3f53 with SMTP id af79cd13be357-7d3a880db31mr144756885a.24.1749593627635;
        Tue, 10 Jun 2025 15:13:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722268sm1701751e87.112.2025.06.10.15.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:13:46 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:13:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 3/4] drm/panel: Add driver for DJN HX83112B LCD panel
Message-ID: <jjfmloif6l2pljlcbo42cdxykynrl2j77n7glq7q4ka6n2bhyd@57t24neodjxn>
References: <20250610-fp3-display-v3-0-e7e7561812e1@lucaweiss.eu>
 <20250610-fp3-display-v3-3-e7e7561812e1@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-fp3-display-v3-3-e7e7561812e1@lucaweiss.eu>
X-Proofpoint-ORIG-GUID: LgKcbiqrv770rPhA00tfqq0Y8jTyASY-
X-Proofpoint-GUID: LgKcbiqrv770rPhA00tfqq0Y8jTyASY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4MyBTYWx0ZWRfX3ZSO56nUaoEq
 KUbU4/yv9CHk0mwNLPAHH3ZgaQMx/JWoWMisiDVcw4NuOku9DoOm2Pi+BkaxLMn4WZk2jntuOmA
 q0sJsDcISSOM2Rul/7SK5QKxEzvQJ5KWvlZw9ciO+N8RcOi31/1cp5+kAx4aV93fmg1b4HQP7D7
 +QTScfKwjfRTSRscVtsHsFNwkr33p4MPhLIB0/9xC7ox0WPlaCksogCYVenq1C3mOygayqlKjRs
 RbAI/t+kvMFc883K/y8dtb/5zV8ALVTgl2h9PI+cjfpyoL3S08zi8CTGn6NUcMU4PLTTd2ZJi5B
 FiR89AY4JS0W085GPQWK+05PdqS3DZh+YfOdg9Ei8yDe9svMI49aTsbOtW1KeBH9LnsqOj8S6R6
 35GmWqSEQxYrw62q19ioSiTC4TT1CJDEfveqzlCAuXyclzMsQ2tIyNiKZbGUrJngM0bm86Lr
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=6848ae21 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=dlmhaOwlAAAA:8 a=0UYVBa6PcIZdzih26zYA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100183

On Tue, Jun 10, 2025 at 09:09:21PM +0200, Luca Weiss wrote:
> Add support for the 2160x1080 LCD panel from DJN (98-03057-6598B-I)
> bundled with a HX83112B driver IC, as found on the Fairphone 3
> smartphone.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/gpu/drm/panel/Kconfig                |  10 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-himax-hx83112b.c | 430 +++++++++++++++++++++++++++
>  3 files changed, 441 insertions(+)

> +static int hx83112b_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct hx83112b_panel *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ret = devm_regulator_bulk_get_const(dev,
> +					    ARRAY_SIZE(hx83112b_supplies),
> +					    hx83112b_supplies,
> +					    &ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +			  MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_LPM;
> +
> +	drm_panel_init(&ctx->panel, dev, &hx83112b_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);

Please switch to devm_drm_panel_alloc(). LGTM otherwise.

> +	ctx->panel.prepare_prev_first = true;
> +
> +	ctx->panel.backlight = hx83112b_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		drm_panel_remove(&ctx->panel);
> +		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +	}
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry

