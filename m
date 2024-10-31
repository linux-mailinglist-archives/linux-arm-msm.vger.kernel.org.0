Return-Path: <linux-arm-msm+bounces-36606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C379B842F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 567D4282821
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1551CB521;
	Thu, 31 Oct 2024 20:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kv8LQkLo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0C61A2562
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405372; cv=none; b=A56+CtQS6soN7vTiEoeAirtQkckWiiHAdlT076BLuldaT8eVL6XyGwAPKR9igtLLebxjLiqic0O1Ekv+HyORG2YEWICqUnhTnNYvINHw1SWbm4hDn+Ha8JDnaaOkW022TT1P5CTkkRj4tRd6U4v5+ItmQLv8JseL6V770qKg/9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405372; c=relaxed/simple;
	bh=WdfzmdvRT7ZJcUGSjkVMQ4SLqD+YFgbQoldqkxD7JBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qh7LKRle57PmX3bsPLdlC6aYMMXGF3if/1GMrQwoYz1nb0q+k68RGqmrxRSPtDFB9dMiXjwofHG2xwBebigmZ0fZoTosG/7z0xafyQsD1HW8peFJlXeWgHdQUdn/LAaWIFefuyLjwVyqyyd3s6HMOUNeDAoOI8RSzC3gE0Ge1T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kv8LQkLo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VJEm1F004719
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sGczH8GGr0JmTYS/kWsyaeudWlmO9htY2Q69KxduKq0=; b=kv8LQkLoFjJ8xZrl
	om8ZYs7UMb0vENv0UU1APUuo87iEMnQFGTXax2LHAOD4xOgnKqfrOE0Oo6GUaXbl
	Mnwy54DBrieH4gQ5sMaYoIqeyisARVFa6P1zuJfEJpfviq6qdOBj5THe2y60l/6b
	Txgdn5qqnBEZxIslTHBNjrDCAmh21WEADKTh7gyToIuF+aggA40RL0kNYq380VS7
	xDW9nEY6LqmhXeqkKCqsrxk8XG18ZXoAdQXU8+UA6DspcidJgds4q25/CiYGSr/h
	Gky42+O+nKPlDFSjGMEnuGu8OEUODFBAmnZbqWoT8xgXPbBGx7XJ9X4bL9/hB69k
	Wno/AA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42m65p9yh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:09:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-460f924d8bcso1973781cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 13:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730405368; x=1731010168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGczH8GGr0JmTYS/kWsyaeudWlmO9htY2Q69KxduKq0=;
        b=hkHUW2+XlbxC7qL8jAQT3uyKGdmFgL+xdimjA54mKk3ewKEKe9ZRbwOTGBLbDlS3m5
         69qcDwvoVppyDJsOyPD/CHzPPb0KsSpMH9lc0UblDavoD5OzM8mDDGXLO6uapVm2Pq0r
         4mdJ1AGHUK0Mvsq/MR7lAwoovnBRghYAbXDfInsxz1XpsdOQ5YxGko563E1tMcX7JzoV
         CP3NM6ITLhm2yeJoVXndHaXj/1AU7xFU+s67obx2nA6TBw5zi9LgLANLmj/WgBTb1EsM
         /e9hZxySPwm8coiqopoAFR9pW3iazgmZvj6kPmXYYIjxvYoP+CXzSg5uAMEdjYjBzF48
         01Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWRuUUSv+HvS/rVyTAw0Hoj49L6b4AhVNjJfSqSoSOHz7Rk7Q7XemSxMtt2mQAZiYvl6BxsMfLVTNIfhYfW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53D0Lm/4pShhlW1oqXwsnzkXxl48Wq/Zp/sF0QXtF6bGOaZjf
	2At3vT389zLK9U+zXEJ0cMLmsdEJaXCUkgzQRBQAfDfcE6qe5zSlDGbamFA1XKwaYvANrNoGp/m
	NCQ2jitU/2YOQLzab6vNuj2ZvAIUpQNnAM0I4r4pQAfV75RVmDO1NzMC/TGEAKxmqNAc/5/TW
X-Received: by 2002:a05:622a:1892:b0:458:3297:806f with SMTP id d75a77b69052e-4613c1a1ed3mr143010051cf.10.1730405368155;
        Thu, 31 Oct 2024 13:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa1eTPRI3Ri0qspxBGjmk0aMURoXtsm0kF82iK8cLqr+JxpJdzEw3rKYXC8B3ozddmP/1TCA==
X-Received: by 2002:a05:622a:1892:b0:458:3297:806f with SMTP id d75a77b69052e-4613c1a1ed3mr143009831cf.10.1730405367677;
        Thu, 31 Oct 2024 13:09:27 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac74d485sm847824a12.19.2024.10.31.13.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:09:27 -0700 (PDT)
Message-ID: <c48f70c4-30ed-4df4-b2b3-826be77da799@oss.qualcomm.com>
Date: Thu, 31 Oct 2024 21:09:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: x1e80100-crd: add rtc offset to
 set rtc time
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20241015004945.3676-1-jonathan@marek.ca>
 <20241015004945.3676-5-jonathan@marek.ca>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241015004945.3676-5-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JD0b31idz_SKAlTUIrd9Ma8tvaraIUaF
X-Proofpoint-GUID: JD0b31idz_SKAlTUIrd9Ma8tvaraIUaF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=905 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310152

On 15.10.2024 2:47 AM, Jonathan Marek wrote:
> See commit e67b45582c5e for explanation.
> 
> Note: the 0xbc offset is arbitrary, it just needs to not be already in use.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 6dfc85eda3540..eb6b735c41453 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -1224,6 +1224,17 @@ edp_bl_en: edp-bl-en-state {
>  	};
>  };
>  
> +&pmk8550_rtc {
> +	nvmem-cells = <&rtc_offset>;
> +	nvmem-cell-names = "offset";
> +};
> +
> +&pmk8550_sdam_2 {
> +	rtc_offset: rtc-offset@bc {
> +		reg = <0xbc 0x4>;
> +	};
> +};

Setting random bits in SDAM is a very very very very bad idea

I'll try to get a good spot for the offset internally

Konrad

