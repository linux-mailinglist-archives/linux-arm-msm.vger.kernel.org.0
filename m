Return-Path: <linux-arm-msm+bounces-46226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80810A1D496
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 11:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7FBD1881C12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFB71FDE18;
	Mon, 27 Jan 2025 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgfXBgRu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFB51FDA8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737974032; cv=none; b=CLwsNTxVUsnPBrBbTvmrH129Xdcl0iXCp9W+hcSOYn1kwv+xESWSI3eY8QQuEff7XDtIeQGy1erTGHAs2xIzH8IbBvkOhmzMUH2p/qOO7JXvtgMMadEHW4C+vo9YZQpfifXi9CG4UDXUo2mGk2Z3oTbWcvQkD0GETCuu0lmpOyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737974032; c=relaxed/simple;
	bh=/2jpubJ76LTJrMU6CNiePQvY30kXVSm/q0TgYoXBqjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pdT9OiOgU5Cio7JaHVCcwr0B/DQ++RuLpJ12fBRxcyRpHdh32xqu791zxSAM7d4DAQPTEsfvLr0tpBKkRHzNNwLRlrWu0nmyGiDat/+hVSy4/FrmSDGC0epLlpf2p8Ep05/cRNHNX8oWeP4mt0ZUqeqmfeI9uOfrbqyaOHkFGJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgfXBgRu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50QNJvm5025544
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XO2U/FigudNpheyHXoXOoPHFQtk40Wecm2MIHQ46a/o=; b=IgfXBgRuoBpyzHLm
	87T/vhiyRMqeaMA8yDAoh2daETixNkgOlovwRezDOvWS62leBJ6onvmyP8/2W2Vs
	yaPhQkqGsrP0OxTjrYJ97Bius2/8L/kiC+YlOfB5g+/F8fD4KsgPJKlgd1hN4URI
	wesiJdh/lGXLr8P+/20hVMv4Nogm3FANwqXW6TJ3uzJVyQDlO6f0rbDIItiUCSI+
	VOqOvWf+tiZsRKwysHBwobzu8bkC9JklHyePd9urGKC/u2hhPAl3UHLFi6Q/JPuI
	IoX2MRce2lT9eOU1Wqo6SYE498VlswjJeDMNGJQG8dhUXuOR995TqiEGMuRHaez9
	w4/bmA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dhu9hthg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:33:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46e4842dbd0so14155881cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 02:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974029; x=1738578829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XO2U/FigudNpheyHXoXOoPHFQtk40Wecm2MIHQ46a/o=;
        b=M1vxWwRpYWIF1yAZGncl15+aaDk4q66xylp33hSrlhg55WnxAXVV18sDDKKH21XALT
         zZ9knDxm9ZLiBFXabKSRoDUPoepIp1xWbi2UfOzhSsmR4FhktIdnOpfT6VaGX5/Diyy9
         5mcN0RzwzHrKFtsVcqa/wJalPKigV5g0HlbwHo8l23MSWoO84hoJ5a4SrO8SMj/IbouZ
         bZDyetosBADaiSdblaXBzTtA4z2OqB60kGOwPbOPBnV/48wCHKk3JpPyUzVx8tiY7tCM
         fCHTQEZnY4EjqFX1Hu+t1jGaCEEalxoxEUhDUEJKNxp+EcWfsLADGXFjWMXyo30i2Niv
         PWig==
X-Forwarded-Encrypted: i=1; AJvYcCVgxZ0PYLlNgx59ILXfwK1sJ870NJuEiDAj4zsbZVNEqCKL5L1gY7t5pGHtknF57q9zptkUM1pxMz7ibrDK@vger.kernel.org
X-Gm-Message-State: AOJu0YzmTnXLP22Kk3iZBmYcdqWm9KR3CiEx0kBwoYqMUYVzVX8CPpmN
	BZvyMiyH4HDxh/B4kr+tVte/yHmJMptq8VJnZg4Xj+BDhk5ML/5lpoqgB9lcHj7pZgQGc6UG3ZV
	i1q0sQy6cm8pKbZAe2xEH7jAd6TNv3tkzduY6lMP7EgkpZnCyR4+hq9+Z8/PExKFc
X-Gm-Gg: ASbGncs43ZS5K+Jbj14o4JX4Jt4cYxTNtQ41wzMBssMSeAMzmyPGA1a2gWfCQh22guM
	jYZT9R0+K20OTUEeBrC9O4MWrNYnJCdJlGjko9aYwiZ8gni0XTvH/G0oFF6MpOG3eV7nwNFPAZ2
	91iEGC9r0H6h9YiuppY74Kym/qCU8NSEtZdQwu/NLtmDXUzKy4ZcGHFT+XfGf96PhDR22mN4hVV
	NvTbTRmiWG28zWaD2Q3IAq5u83eTzBbT5VwNqp/xMoiAHtnGGNIqvoQfBfTbUtVUlSWrWYVUy+s
	/TJID82RiGyStBnMy6BQCeUPMop61bt8j01Gzjqj2z7P03ylbX2yJSSJ5vs=
X-Received: by 2002:a05:622a:1803:b0:464:af83:ba34 with SMTP id d75a77b69052e-46e12b66e5amr244210311cf.10.1737974028682;
        Mon, 27 Jan 2025 02:33:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESlsEC/uSt6b1mkLIn8XmnzDYv15ZT2kv/xQfb7JQbhSlZz5OYDm9Co0pS+uRxerAZbiUQAQ==
X-Received: by 2002:a05:622a:1803:b0:464:af83:ba34 with SMTP id d75a77b69052e-46e12b66e5amr244210171cf.10.1737974028369;
        Mon, 27 Jan 2025 02:33:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab67b28ad13sm513244266b.41.2025.01.27.02.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 02:33:47 -0800 (PST)
Message-ID: <e697cc99-e96b-4e84-8b70-23c5ef015a0d@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 11:33:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] arm64: dts: qcom: ipq9574: Reorder reg and
 reg-names
To: Varadarajan Narayanan <quic_varada@quicinc.com>, bhelgaas@google.com,
        lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, p.zabel@pengutronix.de,
        dmitry.baryshkov@linaro.org, quic_nsekar@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250122063411.3503097-1-quic_varada@quicinc.com>
 <20250122063411.3503097-5-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250122063411.3503097-5-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mgl8GoNxljBZ63UDmSjf8rt5uyeyZC5E
X-Proofpoint-ORIG-GUID: mgl8GoNxljBZ63UDmSjf8rt5uyeyZC5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 mlxlogscore=997 suspectscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501270084

On 22.01.2025 7:34 AM, Varadarajan Narayanan wrote:
> The 'reg' & 'reg-names' constraints used in the bindings and dtsi
> are different resulting in dt_bindings_check errors. Re-order
> them to address following errors.
> 
> 	arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@20000000: reg-names:0: 'parf' was expected
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 52 +++++++++++++++++----------
>  1 file changed, 34 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 942290028972..d27c55c7f6e4 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -876,12 +876,16 @@ frame@b128000 {
>  
>  		pcie1: pcie@10000000 {
>  			compatible = "qcom,pcie-ipq9574";
> -			reg =  <0x10000000 0xf1d>,
> -			       <0x10000f20 0xa8>,
> -			       <0x10001000 0x1000>,
> -			       <0x000f8000 0x4000>,
> -			       <0x10100000 0x1000>;
> -			reg-names = "dbi", "elbi", "atu", "parf", "config";
> +			reg = <0x000f8000 0x4000>,
> +			      <0x10000000 0xf1d>,
> +			      <0x10000f20 0xa8>,
> +			      <0x10001000 0x1000>,
> +			      <0x10100000 0x1000>;

The unit address (the one after '@' in the node definition) is supposed to
match the first 'reg' entry. So you need to update that and reorder the
nodes accordingly.

Krzysztof, is this acceptable to pick up given the reg entries are being
shuffled around?

Konrad

