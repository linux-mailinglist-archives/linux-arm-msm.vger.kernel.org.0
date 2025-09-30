Return-Path: <linux-arm-msm+bounces-75616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A228ABAE610
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 20:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13FF41886348
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 18:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEEB2777E0;
	Tue, 30 Sep 2025 18:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTirnR1U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9701C68F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 18:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759258592; cv=none; b=d9pUUIqHKP5IER/qCyqtjhuMDEASZe0Zf+EqQfSA01RAs0lApjuOoajx9TtfdEniHLqaIncXvfFZ+sPXUALMkqxK2PcnGcXRRkL0Kbm+koEEHivtWizHbrGHRd3UROQ7uNJI3b9s2IAu2oCojpWRghNn8Z+UIRZEMZyJK5N+zcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759258592; c=relaxed/simple;
	bh=PXtwsRcd1qYqDjPebUu6RRAgyQt+A86WEtDc3H9/ElY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gr1JrhwLpG3C1hkobe7UHfI7cquJsqU/ECBzGNd4gKgw115MJvLdBC3yKjxiC23o3cbezIY8ScTCsL1MTClAk+RtYQasQ+AOw2lPhGuMeDQAZEDj9omxNowpIEa+pdvjeQbvtNElmgml4UP4qyTN5C4tliWyV6Yw5DrixI94I3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTirnR1U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC72OQ026871
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 18:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V/OMvPsmXCvICDYI+aDy61hj
	qbzRWVVGIUnKyYVKzhY=; b=oTirnR1UkTKN58dV8P9Jap/U+OeRj/e/lysnnON8
	3SYP8Lou9EM1WsG7Lw00xyGHA6qvYqjgH0q9rL9mtg5uvFlkCHskkhBGQbA5IhZv
	piCfpgKIo/Be6Vcp9VMymKqKY4etJeBfCSBPZpV2iFUjpMBkQPxBT9xhQQ70kpZW
	l47QLoNbT4D/DR0O1YR3HUFevRB9hWB30ixAN6bNRY6rKPCdXhVPMgfUzUFNWsGm
	XQpLFJmXpoNYMF2xrp2rfzQa54ADdkC63TlQOQY3X5PZW6BsQqEUEKeTFlURgGR4
	dwjcPRJtRs8NZ+pAmXSj3dd5NA9678BU2YVX6P3SSp3YaQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf3qa4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 18:56:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e1f265b8b5so45897971cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 11:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759258589; x=1759863389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/OMvPsmXCvICDYI+aDy61hjqbzRWVVGIUnKyYVKzhY=;
        b=DWjb06OJOSLteeKWh0eslhp1seKi1ppETbTKocrQ/OJ6TD+Uo5Oj/cFv7UsZEtk/tj
         hAEsYA7PEn7nM4Gq43BnGSYcd/4uoyl9/E8ICpv8aHat3s1fd+EEMS/Ir69gsoTFEd4d
         rKZ9b3qMrH4V5lj1sCJCw1jjUjzfiXrYJxxZviEPyy2IxmKrfgmlvlxoS8LTDTtXV7fi
         4/bUW5ScNKC8/qVUTcUAh0QwEINNgbx7bEAAzaCYxNyCmTavC9tk8odBlGULcd9GpxOK
         jinejdAmpzpDa9WjJQvcfT4+8pmtLnrW+W+GrYnqigAcRZt9XzvM3+lMUyreVCQsDRMR
         eb6w==
X-Forwarded-Encrypted: i=1; AJvYcCWJ6tSwfzJ6he99WomXB7ed5rxU3aaBO563e2SOaVl4UrVG7uyzkBIepBr3qC6MEFjLi0lUmTebHX0NvA4i@vger.kernel.org
X-Gm-Message-State: AOJu0YxiUKw5h+FfPVneOE3mVItkmdM5jWSJVJSFsXyTGOxw0Ywdc1Uw
	WrVIz3vPHhnC6XJ/WVWnv5gJXDXgnNnlVQOehNNOv7B2yIrIlI3JMpFWhTHuVYRkbW0XoVTe0Ov
	WYhPbfEMrECstEzd40zlO7Jan22GLtLJWQJVvDptAWeZ2kkQBSx8fA+jv/sPdna29cR5o
X-Gm-Gg: ASbGnctMVPxYrQCmgIXM5jhtMA60O4YKyKxUNfizOVQZbmM3nHtoXVtq1U7rlGwJwUM
	UzAT4Qr8nrdBy7UnIcQFWs7LQI3L5ZePbpr6b5/dhfcfp7Xy4ZfWWaqXgBuVp4kOOEjVCDgYZq+
	ZwoAAtPpKYrAKvEdEx1qJih/3nQfl9YvQOf4YkArYXI2I8aaYIOF5irJphwSg+80C/lWNcNeDq9
	uZ+t3n9453dZkg4ijCxJv6wTcAU8ezEaOdL/oLEhhyiJ2jKod9s/fNS3u5tLW7623azKVPfrVb7
	9yVbJBMn6qyLjLPtubpJEQ+MjpHIiHJ12saHFjtlAlMLdS4Zj6iR/eVCXoK/pkNeGGU/DvIJIBz
	qZu4gJI7olPICwxlUPNszsbVjfkdIIK+iq0/6NR3BK0IWwSdOPmNnlR0Img==
X-Received: by 2002:ac8:5a49:0:b0:4b7:a8a1:3f2b with SMTP id d75a77b69052e-4e41e825e31mr9552171cf.64.1759258589045;
        Tue, 30 Sep 2025 11:56:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtCiYt7FMAzWgeneawmAeX/wzn69Dw7nDlfMUDs8bcGjbCrdSrmalKVFRpAjd5R/gcKR6Agw==
X-Received: by 2002:ac8:5a49:0:b0:4b7:a8a1:3f2b with SMTP id d75a77b69052e-4e41e825e31mr9551721cf.64.1759258588450;
        Tue, 30 Sep 2025 11:56:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-586a064a22bsm2621293e87.59.2025.09.30.11.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 11:56:27 -0700 (PDT)
Date: Tue, 30 Sep 2025 21:56:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Xilin Wu <sophon@radxa.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
Message-ID: <uozgwot7yuwmaiwmqoo6ickblpqe52tnj44tnxcorygqxwou52@hksvktgq5zp7>
References: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
 <20250930-topic-x1e80100-hdmi-v4-2-86a14e8a34ac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-topic-x1e80100-hdmi-v4-2-86a14e8a34ac@linaro.org>
X-Proofpoint-ORIG-GUID: 3LlwJ0992L329rOw66Yg4pIWx_ie0T9S
X-Proofpoint-GUID: 3LlwJ0992L329rOw66Yg4pIWx_ie0T9S
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dc27de cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=jDN6A-fuz-j-nsQmgYgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfXzgJnTJDnNXKS
 Q5m3C/0/2b6CidMfofHVV0NrtWJqLLZjUtFFbbMyKwagUAgOS7u2MPMtXtTW1CuQAVe4GjpZIq+
 3+a87nh185WtfZKF6YcssML8fL9K9u7tTTiFWEhzSwRYFw3477rHrx3Hks4d5F2KUWvYaydXhtT
 Q5VQcYx/cLykjzqjZQSklJAwajt+6m/XnMCOyEZnfbcX8CQMbrCBgbMy0ziG9SKeYFdGedluVFt
 cT36mq2CN+UpgXQRvP57qan0uzbLi0WLrwosIik9q1JLm3WfNl7fwQfCHkFTEqdsV73AhF47m+T
 XzwkXGCP6NejgFiwz4yS22Bw4GPMdO9zT7SS5QHGtqOsm7+T6+QawhhYTpPFT+SsfzbuXqFN9b2
 xpN7WdJhKTk2LHGE5fvVbTy5bKmtUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

On Tue, Sep 30, 2025 at 09:39:48AM +0200, Neil Armstrong wrote:
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 2 DP + 2 USB3
> - 4 DP
> - 2 USB3
> 
> Get the lanes mapping from DT and stop registering the USB-C
> muxes in favor of a static mode and orientation detemined
> by the lanes mapping.
> 
> This allows supporting boards with direct connection of USB3 and
> DisplayPort lanes to the QMP Combo PHY lanes, not using the
> USB-C Altmode feature.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 145 ++++++++++++++++++++++++++++--
>  1 file changed, 137 insertions(+), 8 deletions(-)
> 
> @@ -4167,9 +4269,41 @@ static int qmp_combo_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_node_put;
>  
> -	ret = qmp_combo_typec_register(qmp);
> -	if (ret)
> -		goto err_node_put;
> +	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
> +
> +	if (of_find_property(dev->of_node, "mode-switch", NULL) ||
> +	    of_find_property(dev->of_node, "orientation-switch", NULL)) {
> +		ret = qmp_combo_typec_register(qmp);
> +		if (ret)
> +			goto err_node_put;
> +	} else {
> +		enum typec_orientation dp_orientation = TYPEC_ORIENTATION_NONE;
> +		enum typec_orientation usb3_orientation = TYPEC_ORIENTATION_NONE;
> +
> +		ret = qmp_combo_get_dt_dp_orientation(dev, &dp_orientation);
> +		if (ret)
> +			goto err_node_put;
> +
> +		ret = qmp_combo_get_dt_usb3_orientation(dev, &usb3_orientation);
> +		if (ret)
> +			goto err_node_put;
> +
> +		if (dp_orientation == TYPEC_ORIENTATION_NONE &&
> +		    usb3_orientation != TYPEC_ORIENTATION_NONE) {
> +			qmp->qmpphy_mode = QMPPHY_MODE_USB3_ONLY;
> +			qmp->orientation = usb3_orientation;
> +		} else if (usb3_orientation == TYPEC_ORIENTATION_NONE &&
> +			 dp_orientation != TYPEC_ORIENTATION_NONE) {
> +			qmp->qmpphy_mode = QMPPHY_MODE_DP_ONLY;
> +			qmp->orientation = dp_orientation;
> +		} else if (dp_orientation != TYPEC_ORIENTATION_NONE &&
> +			 dp_orientation == usb3_orientation) {
> +			qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
> +			qmp->orientation = dp_orientation;
> +		} else {
> +			dev_warn(dev, "unable to determine orientation & mode from data-lanes");
> +		}
> +	}
>  
>  	ret = drm_aux_bridge_register(dev);
>  	if (ret)
> @@ -4189,11 +4323,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_node_put;
>  
> -	/*
> -	 * The hw default is USB3_ONLY, but USB3+DP mode lets us more easily
> -	 * check both sub-blocks' init tables for blunders at probe time.
> -	 */
> -	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;

SHouldn't this still be a default in the 'normal' USB-C case?

>  
>  	qmp->usb_phy = devm_phy_create(dev, usb_np, &qmp_combo_usb_phy_ops);
>  	if (IS_ERR(qmp->usb_phy)) {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

