Return-Path: <linux-arm-msm+bounces-41808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 364449EF86A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F01B189BEC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D6F2248A4;
	Thu, 12 Dec 2024 17:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPyxdVlU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA36A223C62
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734024884; cv=none; b=Uol9AcB5tR7luuyVdLK9wu7qE88CvdBjX2eAfTt3O9hZlPUYM/TVmfOpLcVh+NOQJ5EBK6+89d/JFl52fv89KXkx1vIkl5Mi13yutJPQH3RVOz6pQKAFhkJ2chB88Ga1Rq14svZ41AdCA5qslOsyLAAEqD2jK2Ub1pXC4p+i5xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734024884; c=relaxed/simple;
	bh=1ApeRTFz6odk1XghaSyjjzbGUVxHPQM6AiMitJnG81A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ReIjRBIC86hAO8wx3o5ntb3eglOu1mi+cuWS74WPwnS1pvwRtDr58hj50HyPyN8kjjQO9xIBnECktsflk/U1fsWG0NEJUzbXq0JJAkXLl8ZgHYlMSxR7ZAScu2/P+YVZ88zmUuvY7gAH+bBhi835SyR+f7ZxBWFXTLyVsO/aBTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPyxdVlU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGvbRu029911
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ix2yViUlfOnI3Jp/l53HkxumLGnFyx45XHeGOYs+gnQ=; b=IPyxdVlUvNmHefHg
	axdYOSCzpKgyMhouH/3h37eg41lkiQzZvQ5iRHIeKEJuS622s10rueZLzMicai40
	Nbl19dXid2zJvKhCdgz+RC2my79fZr/zRnxr1VIIucoPAWYJFEUyyLqxQqmyudca
	6YE0VyGJiaLIm8FghYyrrBR6fy2t2D31PA2aVUHgIjZ2+kudqTPR86+U6QUGArAD
	aHdUDR7coTOIwzUZ/eYyLkylAP1tuVxCW6zk1kZ7mepaFG42UbL4FO8MU/3GTizg
	wUR9lEnI8igp21U3wSw0ilgTt4lviQIzttnuhhw/2y3C4VQoNb8MmWKEEFjVrul/
	isGFsA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xurqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:34:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4679af4d6b7so1860711cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 09:34:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734024880; x=1734629680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ix2yViUlfOnI3Jp/l53HkxumLGnFyx45XHeGOYs+gnQ=;
        b=IxKgp7oz5PEFyzS29FRb+cqEFe/R/0YRzrxAzcZvyviH5XaJx/E/XoL9Y5JNWKxIlf
         Azc5wcU3trAQtri23Y2cNWE7VjqUnmVNRnafd4XClUaETOm1QGaCWq/rNiZesKEyw6yw
         xo1owMWQ7rcN32rHTNv38mozwu+OS7UVtqZDxQec9pAYvK5B04m4Pj7GqHusz3/YgDuk
         S75WAGAxbgDm5tHeNPlmxmAi+j1SVDWU15ciUbGUHvBwsvS6ZmzzJZwyeLlHQUW/gQ8L
         gBrAUVo5990eEV4t1HWciVBdeMlBpcn24GLOKKkaiIBrQfEwWtY9MWQFE9IWD2ndIrWz
         AZ8A==
X-Forwarded-Encrypted: i=1; AJvYcCUkXwO3HPDL1sLnyLP25XrBH/NrVqkQlrff445s6sCUlWA8FPZuAaxLUiIRlnOGNDEUes8x/AyTBUFDFnhH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9u41JBpwOPiWGntTiEXlZdA3bzMLZ3q04CyL+Ur9Knpis5Au5
	+wLt6PtZbGigJFyVH9DSOnIBbyEB57TqjXShbfzrECnyGE0eDruPzfKPe6E8K5l+164UrDJSpoz
	8xtip6IiMBf+udtElP4/uG3JO5iGos29vUnGUd3DCtPmZgn7Exy/UqSsZ63AoCOOM
X-Gm-Gg: ASbGncsJbo4vadSgNqZyaSdr9Y9+cnLUDZVPlCk7lkilgn6pKj3WYkYWui3LFBi2ZSt
	rteuIcucqOYiM7HMaiSsMlLDyHnA95gbCU9TZH1wArucz8rfKaQ5RH/HSsJcNdxiLo8d5x47SPa
	XMTFGhWIdgl2hnt2OaW5zdeXEgUEo6WXKsqa9kxV+sY+e2W+6zrSog5R2vXkXde7QprSxwQrt7T
	qFDgi/94OOr24u5kgIxIHCeIbZx0iIxrEBlIRAhETpXCfMIlH8TMCwxm9gJeFt7NyHXV/3FTIei
	KEb/Og4zzSlNM9nObBdNnwBT8RE3xN51c61t9g==
X-Received: by 2002:a05:622a:60d:b0:460:3a41:a9e5 with SMTP id d75a77b69052e-467a16dd1cdmr7790831cf.13.1734024879996;
        Thu, 12 Dec 2024 09:34:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFljHM2Bl24f+BNJ4dG+QO5z/PRp3ZrX7hNKu4Z2XRUq2UO2aq8AUxd+Qp7DJXsYZxCRcCYIw==
X-Received: by 2002:a05:622a:60d:b0:460:3a41:a9e5 with SMTP id d75a77b69052e-467a16dd1cdmr7790611cf.13.1734024879612;
        Thu, 12 Dec 2024 09:34:39 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67d63f867sm679690666b.133.2024.12.12.09.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 09:34:39 -0800 (PST)
Message-ID: <f2964623-63e9-44cd-b328-d502b5fddcd2@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 18:34:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: x1e80100: Describe the SDHC
 controllers
To: Abel Vesa <abel.vesa@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241212-x1e80100-qcp-sdhc-v4-0-a74c48ee68a3@linaro.org>
 <20241212-x1e80100-qcp-sdhc-v4-1-a74c48ee68a3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212-x1e80100-qcp-sdhc-v4-1-a74c48ee68a3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1RG6H_ag4Bm3Xgy33B-mU-IOMw_oQBJy
X-Proofpoint-GUID: 1RG6H_ag4Bm3Xgy33B-mU-IOMw_oQBJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120126

On 12.12.2024 5:50 PM, Abel Vesa wrote:
> The X Elite platform features two SDHC v5 controllers.
> 
> Describe the controllers along with the pin configuration in TLMM
> for the SDC2, since they are hardwired and cannot be muxed to any
> other function. The SDC4 pin configuration can be muxed to different
> functions, so leave those to board specific dts.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 142 +++++++++++++++++++++++++++++++++
>  1 file changed, 142 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..1584df66ea915230995f0cf662cde813f4ae02a1 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4094,6 +4094,108 @@ lpass_lpicx_noc: interconnect@7430000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		sdhc_2: mmc@8804000 {
> +			compatible = "qcom,x1e80100-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0 0x08804000 0 0x1000>;
> +
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> +				 <&gcc GCC_SDCC2_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface", "core", "xo";
> +			iommus = <&apps_smmu 0x520 0>;
> +			qcom,dll-config = <0x0007642c>;
> +			qcom,ddr-config = <0x80040868>;
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&sdhc2_opp_table>;
> +
> +			interconnects = <&aggre2_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;

The comment regarding ICC defines from v3 still stands

the rest of the patch looks good

Konrad

