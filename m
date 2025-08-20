Return-Path: <linux-arm-msm+bounces-69960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BEEB2DB5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BCE95E57FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8422D372A;
	Wed, 20 Aug 2025 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBV4uVez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A441FCF41
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690159; cv=none; b=ighhYdhPhbjC/DVgpcG9LMbXQTFJOd6GEFQ/Weg09egLljTGlBw9uzLqW59HGgDLWkxmDXvTJ8BlCu8B8FKlvx3wrMU5kNpceLfR3T4y7cBGDnShVgf6tKW/jffN3hlqhVbk/LvCIv1KsvpqK8HlQzo+Zto48bcMzhTc4/wPaEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690159; c=relaxed/simple;
	bh=PtKHpsrTifXLk3xjLElF4bM7glMduRMJdMnig3m6Rrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZJ78BS94Lbi07ZZO4liScXkVfcbdXjdYn7yLrM52nv9kMcjBQSSj7gWSyh1RH9ZGj4LDfUmiLCavQc2Jdyel7jexMEjnGoWPdRUySFMxKIqCXdLxXG1OvmEgQLkt8DUEwxTMt3yE8WinXN8uztt346atoKQ/BwvMFcORWwsR0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBV4uVez; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9tRUG005785
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T7wGxRO/zr/otAECRnr8/RO0
	TjvVmZ88mWP10yv2gTA=; b=LBV4uVezw1JLJrSRHige1NF7Zz+1fBIqafhTbK/N
	8BHx+dI0kk9mxg2PCYPcWfywL1ZRq2lNTW+MBuWKpwkZGyo742bY6yPOviAxrNxV
	qaisDlWVRXFuuImbnSPWNrcAC6a/PgEWudVD6hUQxqJblw0Fyz7bACuyX3F8NXz4
	lDPdPJzKgRXCxaqipfJ5EblBr8HgGZHAw2g6TWqg5Lr010Tek9ftSxYlpGcpDIS6
	ax0fvtSg/GG/ueN14K4N8BKtiMWaanbbNWnIfKYXtoV6eg33tMpZN0LisZisBay2
	onfof01xAxCK55wvbTTHnepZEBPolEevzsHIDMuozdvSmA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52chj1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:42:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a94f3bbdbso132024556d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755690155; x=1756294955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7wGxRO/zr/otAECRnr8/RO0TjvVmZ88mWP10yv2gTA=;
        b=oVH3u2duH1foGrv+ea3Fa1pGh8GaQhDyhfn4E9YrQ5lfLg1twEeR3BNCNkx6rDJh6Y
         YDl/8oNlOi1bWXPIi3ap6cDWPuS7HpUoAdQ6LimEDs0UsOvwDCGkYuzVjwKM4+pN+zig
         nyHli0use2eVvGDpdza/NzLOzSrBNERpG4OnR11n/7k2VMi6PBraxwI21kxvxMIJEKhE
         6ttA4aa3ewHvT6ZzO0vaNgrXbJAAYMB0KAE2ZaPclRBtj7K49078Kj+dWDi6HQogA7VS
         xFx2samO5dCllfRJgkflouUL02IF9GEV/SmuhbywaYMgYInDaKuK+N33uQsnKIh0dVI5
         UA2g==
X-Forwarded-Encrypted: i=1; AJvYcCXUEv5HOWbC42Le//XWi/mQhBoVxyJ00TahyzsUXuC3/bJio91tUyAYLjvJe8m4v58hlQpyaWdcaS35lZ5N@vger.kernel.org
X-Gm-Message-State: AOJu0YyCAXoigvCM3/58LtLTXYpjeQrAs1ZuHoHVOm2pDWcHqtqUQizs
	iRR5KF2gQGOaHhozg6DeZbcYSPM3ZNRf7Z3rmSa4G/T55V7oURjayIewUGz9UnWWhsMyk24YMBj
	i56+5BY7UYjFxJ/mVYhf4adfjT9URd8ty0BIkDkHvWY+6VnxXsxQmvO00IuwjMd0xgfn2
X-Gm-Gg: ASbGncu7WgX8XuX1oTFgahK1QU5/YC0Mr51mz9s8r4yiUghQ+d3xgedS8aLn30bnLlJ
	I4QKGwSaJza52sMUqusWLSgMf0SEpABln44F//D+9cTZ/RHs/qN/yPu3vZlFjenoggrwNN6CVF0
	byxQvIiafocJDk7HfYM9/vxRVnLbNXwRv2WCOXdZ7rZOW4UiL9y9xq8DylzyGe7eHOWyNCtxdG0
	UVDOhmFVntJOJX3b3JIHFEvB3eG2DZCS5I+cBypPMBcslqighAbv0CKCy0BtchXVgnlxvIo3L0f
	VKiWI4lUpbT6+UcE9WNL+1xS0YUe7eadFYMGU/ih4Vgkdm2GN2MMc26M6J+jt8oMI9mU83GbtmS
	BuwddcnAa3inYnY3w9wn4VbgxxujbrgTyQC6oxU76C0xNxLvQnmwD
X-Received: by 2002:a05:6214:5013:b0:70b:b18b:799e with SMTP id 6a1803df08f44-70d7711d842mr21451846d6.35.1755690154744;
        Wed, 20 Aug 2025 04:42:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqvJOideGl/005mWHcWma4BYe+8BY81PBbre7k8yk+HdS2FrnKStdSSCMsolK/tNiWFENdNg==
X-Received: by 2002:a05:6214:5013:b0:70b:b18b:799e with SMTP id 6a1803df08f44-70d7711d842mr21451386d6.35.1755690154108;
        Wed, 20 Aug 2025 04:42:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cc97csm2566219e87.80.2025.08.20.04.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 04:42:33 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:42:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 11/14] phy: qcom: qmp-usbc: Finalize USB/DP switchable
 PHY support
Message-ID: <jjsijdmh4hdbgd2boebtrmzvblvhz2hnl7mtv5ga76ine2fnsb@i72dz3r4lbjp>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-11-a43bd25ec39c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-11-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-GUID: enztWG1EJE6hwE1fjvZT_WF_EXeEjk5c
X-Proofpoint-ORIG-GUID: enztWG1EJE6hwE1fjvZT_WF_EXeEjk5c
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a5b4ac cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=wWkF1u56cBY0eVE_x6kA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyWgeFdLgZ0H3
 tPdNn1SNiMi5Lik3f/fUlXWosUmHCGdo3OCgeGLb7UDoNrFGOOd8aZ2kmSu9nrgr4eVqFn+kSFC
 +NGQYb5JeyjndoTRv9srYQazjxfvEVv2/8KAm5PxsJ5DEwHYCTuKTUJnbijRt+lpDePXcCnD5xc
 qQxZWP4Bd99Dk2KyEJP4Id9mQKEBSlTO8sgLsdrfnTFRaBiijmVv7c+YAQVteAfZfeCyhvnnA/+
 suoGV/+d3lEzRAkYLIojOFfF7x1UGOjpVvJXJ1TuWKk8si4GPPN4rRdwQk5tLaRipDFtvec5fQ5
 CgrAEl+LfLxP6vomIkaunMj3EL0yivV+VFEFiEkvGg/tl6NXZ4iaTPMO/l2Qz8YZFDgBcm83J+D
 xQndud7ACCrEve5e1O8Ye1qAKHqeXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:34:53PM +0800, Xiangxu Yin wrote:
> Complete USB/DP switchable PHY integration by adding DP clock
> registration, aux bridge setup, and DT parsing. Implement clock
> provider logic for USB and DP branches, and extend PHY translation
> to support both USB and DP instances.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 331 ++++++++++++++++++++++++++++---
>  1 file changed, 299 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index 821398653bef23e1915d9d3a3a2950b0bfbefb9a..74b9f75c8864efe270f394bfbfd748793dada1f5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -995,6 +995,11 @@ static int qmp_usbc_usb_power_on(struct phy *phy)
>  	qmp_configure(qmp->dev, qmp->serdes, cfg->serdes_tbl,
>  		      cfg->serdes_tbl_num);
>  
> +	if (IS_ERR(qmp->pipe_clk)) {
> +		return dev_err_probe(qmp->dev, PTR_ERR(qmp->pipe_clk),
> +				     "pipe clock not defined\n");
> +	}

No, this should not be allowed.

> +
>  	ret = clk_prepare_enable(qmp->pipe_clk);
>  	if (ret) {
>  		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
> @@ -1365,11 +1370,13 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_prepare_enable(qmp->pipe_clk);
> -	if (ret) {
> -		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
> -		clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> -		return ret;
> +	if (!IS_ERR(qmp->pipe_clk)) {

Similarly.

> +		ret = clk_prepare_enable(qmp->pipe_clk);
> +		if (ret) {
> +			dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
> +			clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> +			return ret;
> +		}
>  	}
>  
>  	qmp_usbc_disable_autonomous_mode(qmp);
> @@ -1422,9 +1429,23 @@ static int qmp_usbc_clk_init(struct qmp_usbc *qmp)
>  	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
>  }
>  
> -static void phy_clk_release_provider(void *res)
> +static struct clk_hw *qmp_usbc_clks_hw_get(struct of_phandle_args *clkspec, void *data)
>  {
> -	of_clk_del_provider(res);
> +	struct qmp_usbc *qmp = data;
> +
> +	if (clkspec->args_count == 0)
> +		return &qmp->pipe_clk_fixed.hw;
> +
> +	switch (clkspec->args[0]) {
> +	case QMP_USB43DP_USB3_PIPE_CLK:
> +		return &qmp->pipe_clk_fixed.hw;
> +	case QMP_USB43DP_DP_LINK_CLK:
> +		return &qmp->dp_link_hw;
> +	case QMP_USB43DP_DP_VCO_DIV_CLK:
> +		return &qmp->dp_pixel_hw;
> +	}
> +
> +	return ERR_PTR(-EINVAL);
>  }
>  
>  /*
> @@ -1453,8 +1474,11 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
>  
>  	ret = of_property_read_string(np, "clock-output-names", &init.name);
>  	if (ret) {
> -		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
> -		return ret;
> +		char name[64];
> +
> +		/* Clock name is not mandatory. */
> +		snprintf(name, sizeof(name), "%s::pipe_clk", dev_name(qmp->dev));
> +		init.name = name;
>  	}
>  
>  	init.ops = &clk_fixed_rate_ops;
> @@ -1463,19 +1487,7 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
>  	fixed->fixed_rate = 125000000;
>  	fixed->hw.init = &init;
>  
> -	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
> -	if (ret)
> -		return ret;
> -
> -	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * Roll a devm action because the clock provider is the child node, but
> -	 * the child node is not actually a device.
> -	 */
> -	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
> +	return devm_clk_hw_register(qmp->dev, &fixed->hw);
>  }
>  
>  #if IS_ENABLED(CONFIG_TYPEC)
> @@ -1660,6 +1672,235 @@ static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
>  	return 0;
>  }
>  
> +static int qmp_usbc_parse_usb3dp_dt(struct qmp_usbc *qmp)
> +{
> +	struct platform_device *pdev = to_platform_device(qmp->dev);
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	const struct qmp_usbc_offsets *offs = cfg->offsets;
> +	struct device *dev = qmp->dev;
> +	void __iomem *base;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	qmp->dp_serdes = base + offs->dp_serdes;
> +	qmp->dp_tx = base + offs->dp_txa;
> +	qmp->dp_tx2 = base + offs->dp_txb;
> +	qmp->dp_dp_phy = base + offs->dp_dp_phy;

Squash this into qmp_usbc_parse_dt(). Set these fields if
dp_serdes != 0.

> +	qmp->serdes = base + offs->serdes;
> +	qmp->pcs = base + offs->pcs;
> +	if (offs->pcs_misc)
> +		qmp->pcs_misc = base + offs->pcs_misc;
> +	qmp->tx = base + offs->tx;
> +	qmp->rx = base + offs->rx;
> +
> +	qmp->tx2 = base + offs->tx2;
> +	qmp->rx2 = base + offs->rx2;
> +
> +	ret = qmp_usbc_clk_init(qmp);
> +	if (ret)
> +		return ret;
> +
> +	qmp->pipe_clk = devm_clk_get(dev, "pipe");
> +	if (IS_ERR(qmp->pipe_clk)) {
> +		/* usb3dp allow no pipe clk define */
> +		if (cfg->type == QMP_PHY_USBC_USB3_ONLY)
> +			return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
> +						"failed to get pipe clock\n");
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Display Port PLL driver block diagram for branch clocks
> + *
> + *              +------------------------------+
> + *              |         DP_VCO_CLK           |
> + *              |                              |
> + *              |    +-------------------+     |
> + *              |    |   (DP PLL/VCO)    |     |
> + *              |    +---------+---------+     |
> + *              |              v               |
> + *              |   +----------+-----------+   |
> + *              |   | hsclk_divsel_clk_src |   |
> + *              |   +----------+-----------+   |
> + *              +------------------------------+
> + *                              |
> + *          +---------<---------v------------>----------+
> + *          |                                           |
> + * +--------v----------------+                          |
> + * |    dp_phy_pll_link_clk  |                          |
> + * |     link_clk            |                          |
> + * +--------+----------------+                          |
> + *          |                                           |
> + *          |                                           |
> + *          v                                           v
> + * Input to DISPCC block                                |
> + * for link clk, crypto clk                             |
> + * and interface clock                                  |
> + *                                                      |
> + *                                                      |
> + *      +--------<------------+-----------------+---<---+
> + *      |                     |                 |
> + * +----v---------+  +--------v-----+  +--------v------+
> + * | vco_divided  |  | vco_divided  |  | vco_divided   |
> + * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
> + * |              |  |              |  |               |
> + * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
> + * +-------+------+  +-----+--------+  +--------+------+
> + *         |                 |                  |
> + *         v---->----------v-------------<------v
> + *                         |
> + *              +----------+-----------------+
> + *              |   dp_phy_pll_vco_div_clk   |
> + *              +---------+------------------+
> + *                        |
> + *                        v
> + *              Input to DISPCC block
> + *              for DP pixel clock
> + *
> + */
> +static int qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	switch (req->rate) {
> +	case 1620000000UL / 2:
> +	case 2700000000UL / 2:
> +	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static unsigned long qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	const struct qmp_usbc *qmp;
> +	const struct phy_configure_opts_dp *dp_opts;
> +
> +	qmp = container_of(hw, struct qmp_usbc, dp_pixel_hw);
> +
> +	dp_opts = &qmp->dp_opts;
> +
> +	switch (dp_opts->link_rate) {
> +	case 1620:
> +		return 1620000000UL / 2;
> +	case 2700:
> +		return 2700000000UL / 2;
> +	case 5400:
> +		return 5400000000UL / 4;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct clk_ops qmp_dp_pixel_clk_ops = {
> +	.determine_rate	= qmp_dp_pixel_clk_determine_rate,
> +	.recalc_rate	= qmp_dp_pixel_clk_recalc_rate,
> +};
> +
> +static int qmp_dp_link_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	switch (req->rate) {
> +	case 162000000:
> +	case 270000000:
> +	case 540000000:
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static unsigned long qmp_dp_link_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	const struct qmp_usbc *qmp;
> +	const struct phy_configure_opts_dp *dp_opts;
> +
> +	qmp = container_of(hw, struct qmp_usbc, dp_link_hw);
> +	dp_opts = &qmp->dp_opts;
> +
> +	switch (dp_opts->link_rate) {
> +	case 1620:
> +	case 2700:
> +	case 5400:
> +		return dp_opts->link_rate * 100000;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct clk_ops qmp_dp_link_clk_ops = {
> +	.determine_rate	= qmp_dp_link_clk_determine_rate,
> +	.recalc_rate	= qmp_dp_link_clk_recalc_rate,
> +};
> +
> +static int phy_dp_clks_register(struct qmp_usbc *qmp, struct device_node *np)
> +{
> +	struct clk_init_data init = { };
> +	char name[64];
> +	int ret;
> +
> +	snprintf(name, sizeof(name), "%s::link_clk", dev_name(qmp->dev));
> +	init.ops = &qmp_dp_link_clk_ops;
> +	init.name = name;
> +	qmp->dp_link_hw.init = &init;
> +	ret = devm_clk_hw_register(qmp->dev, &qmp->dp_link_hw);
> +	if (ret < 0) {
> +		dev_err(qmp->dev, "link clk reg fail ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	snprintf(name, sizeof(name), "%s::vco_div_clk", dev_name(qmp->dev));
> +	init.ops = &qmp_dp_pixel_clk_ops;
> +	init.name = name;
> +	qmp->dp_pixel_hw.init = &init;
> +	ret = devm_clk_hw_register(qmp->dev, &qmp->dp_pixel_hw);
> +	if (ret) {
> +		dev_err(qmp->dev, "pxl clk reg fail ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
> +{
> +	int ret;
> +
> +	if (!IS_ERR(qmp->pipe_clk)) {
> +		ret = phy_pipe_clk_register(qmp, np);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {

if dp_serdes != 0

> +		ret = phy_dp_clks_register(qmp, np);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);
> +}
> +
> +static struct phy *qmp_usbc_phy_xlate(struct device *dev, const struct of_phandle_args *args)
> +{
> +	struct qmp_usbc *qmp = dev_get_drvdata(dev);
> +
> +	if (args->args_count == 0)
> +		return qmp->usb_phy;
> +
> +	switch (args->args[0]) {
> +	case QMP_USB43DP_USB3_PHY:
> +		return qmp->usb_phy;
> +	case QMP_USB43DP_DP_PHY:
> +		return qmp->dp_phy;
> +	}
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
>  static int qmp_usbc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1703,16 +1944,32 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	/* Check for legacy binding with child node. */
> -	np = of_get_child_by_name(dev->of_node, "phy");
> -	if (np) {
> -		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
> -	} else {
> +	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {

Should not be necessary.

>  		np = of_node_get(dev->of_node);
> -		ret = qmp_usbc_parse_usb_dt(qmp);
> +
> +		ret = qmp_usbc_parse_usb3dp_dt(qmp);
> +		if (ret) {
> +			dev_err(qmp->dev, "parse DP dt fail ret=%d\n", ret);
> +			goto err_node_put;
> +		}
> +
> +		ret = drm_aux_bridge_register(dev);
> +		if (ret) {
> +			dev_err(qmp->dev, "aux bridge reg fail ret=%d\n", ret);
> +			goto err_node_put;
> +		}
> +	} else {
> +		/* Check for legacy binding with child node. */
> +		np = of_get_child_by_name(dev->of_node, "phy");
> +		if (np) {
> +			ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
> +		} else {
> +			np = of_node_get(dev->of_node);
> +			ret = qmp_usbc_parse_usb_dt(qmp);
> +		}
> +		if (ret)
> +			goto err_node_put;
>  	}
> -	if (ret)
> -		goto err_node_put;
>  
>  	pm_runtime_set_active(dev);
>  	ret = devm_pm_runtime_enable(dev);
> @@ -1724,7 +1981,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  	 */
>  	pm_runtime_forbid(dev);
>  
> -	ret = phy_pipe_clk_register(qmp, np);
> +	ret = qmp_usbc_register_clocks(qmp, np);
>  	if (ret)
>  		goto err_node_put;
>  
> @@ -1737,9 +1994,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  
>  	phy_set_drvdata(qmp->usb_phy, qmp);
>  
> +	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {

if dp_serdes != 0

> +		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
> +		if (IS_ERR(qmp->dp_phy)) {
> +			ret = PTR_ERR(qmp->dp_phy);
> +			dev_err(dev, "failed to create PHY: %d\n", ret);
> +			goto err_node_put;
> +		}
> +		phy_set_drvdata(qmp->dp_phy, qmp);
> +	}
> +
>  	of_node_put(np);
>  
> -	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
>  
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

