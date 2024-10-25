Return-Path: <linux-arm-msm+bounces-35929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCD99B0C0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 19:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B2911F23B76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E0D15444E;
	Fri, 25 Oct 2024 17:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljImiyuC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D78614D6EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729878375; cv=none; b=jro/yzbk4f5KG9W8+MJSqqBbuJv+D/NHShd9CdAi9kiTgQsv1mdEr9TcP8UP6u9RRXgOfCxMbTEPXisbLAS0HsfUrYNBFYnuxzTSUmTzwTC2OMFg+LdvT/wnm7vRPn20QCmFe65ekFSlziJnZ8SKzFp2RH9b2kOIWUh9CzOiBkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729878375; c=relaxed/simple;
	bh=oIuIuspz76OCuYP6ZhuCIco1Uhz8q72qC71gvsc83xY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b3RjF7dVNLj5YTkW2QkklqYr3w7loW0L39dnZKgDc36sNcJhoZaHKff2Cfoc3C14rozNKuyRlwohzqG+2EMvuvl7s63KlC/FGR9F8GvE/O0RLonmtyFjT/6FJC685GcIubXanAEtcpu6F5pHfJokluWUMYExyVC+23oNvi85e5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljImiyuC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAoQ2m007039
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gp4O+oOSOissF91Pvneay/lgbVotgfOx/AKhK7rAXrg=; b=ljImiyuC/X0YEfWW
	pFPe7pES7hK57F+CBg7FmRM5K72bP+yG81uWphYP0gx29K5UB9ljCa0nACWMbidc
	LliPRMH5+/PtJjs8pT9UT5PRTHSpymjwXZNCRYPgrtSs6aDieLC6ovKmMXLmhU5J
	gcI9CoK1halYW5dhQPpcbWLMHa+VYu3vPKzebwV0LF92fpji3TaQhci3hNBlYNbs
	rF4lYvILDUqZOV0nd26POlt7PnyLXl73zOwyzLcZxE9dJY6UR0hndsaKh1RUCTuJ
	KIxO1A+8naMA3rnP4ATelU8q8RTW+U8ms4AAQ20FgHYfZ0nYe+6UTybbLv7v7sfk
	TrVnwg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g9x6hans-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:46:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbe993f230so7013916d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 10:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729878371; x=1730483171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gp4O+oOSOissF91Pvneay/lgbVotgfOx/AKhK7rAXrg=;
        b=wY43eVGlkcauphDFTnKj9uOalYxJB5x31pLC+kYu+SGaoQOZzJKui7dJV/mVrXAj5c
         oTbXR8d6idyKUuveoWoVqi6J3Da0qwR+MxhlnQah642XPqHH7j3mRtYjWhRDmXxOIsLF
         Ch3bms8Gxw17SpyacTqu3NHEDa8uUzPEs6mEtiSBXg+Dnkhdaf1dP7gmpVyPvuQFVMr/
         MByZO3Hn9vvemXZ4nIMvEwWj6u/SwU+KzdVU+8RphwFDklo+3vKEk0kf5DcAKdm3vpE9
         Kj7h8fmtvbh74rZ4yjvQEbPKKm0XmURzglrdt4ciMKGy+qn+yrN/RMGCmaXFeYQXly6b
         rhaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNUnRDhr9UFPfeljihTMlc6R3m6S4vShloaYVfEWvlqewgBWeUpuDOMxrPbk8Oh0K9hE1ufKJhwtG+ZRrD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3aSvEq5PE9lMOHGrJJN7mA2WxfeRCY8lNtAIt3x3sipyOwUJq
	QQPh4QzuXJ3T5EV6t0G16j9OPIRlCeW4jcjyD7tnM9Hktu/s3Kn8gHDtjYOH0APZ1Y8FYC0SCyG
	6Fc4nIlsyrzvGmJ1YavdSSdAntBck7WPFs4TOR4xc0s6t9u1p8T2IGZaFcxKW0qgY
X-Received: by 2002:ad4:5cee:0:b0:6cb:f3df:cb9 with SMTP id 6a1803df08f44-6d185837663mr1613606d6.9.1729878371383;
        Fri, 25 Oct 2024 10:46:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpDSpwMF/KD6STy7ZyXj15CbXpF87KjDotLoxTNXjlOrvboEQbQCx49/+xITyhMb+FVdgP2g==
X-Received: by 2002:ad4:5cee:0:b0:6cb:f3df:cb9 with SMTP id 6a1803df08f44-6d185837663mr1613396d6.9.1729878371019;
        Fri, 25 Oct 2024 10:46:11 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb63197d5sm833015a12.72.2024.10.25.10.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 10:46:09 -0700 (PDT)
Message-ID: <c81b26dc-1c52-42b6-ba68-95906b9c524c@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 19:46:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: Add LLCC support for QCS615
To: Song Xue <quic_songxue@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241011-add_llcc_dts_node_for_qcs615-v1-1-e7aa45244c36@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241011-add_llcc_dts_node_for_qcs615-v1-1-e7aa45244c36@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YbE8CBMgvTLAY3iQ71EfEfDDKrkyGpLz
X-Proofpoint-ORIG-GUID: YbE8CBMgvTLAY3iQ71EfEfDDKrkyGpLz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250135

On 11.10.2024 12:41 PM, Song Xue wrote:
> The QCS615 platform has LLCC(Last Level Cache Controller) as the system
> cache controller. It includes 1 LLCC instance and 1 LLCC broadcast
> interface.
> 
> Add LLCC node support for the QCS615 platform.
> 
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> ---
> This patch series depends on below patch series:
> https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/
> https://lore.kernel.org/linux-arm-msm/20241010-add_llcc_support_for_qcs615-v2-1-044432450a75@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index ac4c4c751da1fbb28865877555ba317677bc6bd2..b718a4d2270d64ed43c2eca078bfe52b78ff680c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -495,6 +495,14 @@ dc_noc: interconnect@9160000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		llcc: system-cache-controller@9200000 {
> +			compatible = "qcom,qcs615-llcc";
> +			reg = <0x0 0x9200000 0x0 0x50000>,
> +			      <0x0 0x9600000 0x0 0x50000>;

Please pad both addresses to 8 hex digits (e.g. 0x09200000)

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

