Return-Path: <linux-arm-msm+bounces-42842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A503D9F8604
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AEDD16BCF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1331C5F30;
	Thu, 19 Dec 2024 20:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1yi4B9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769CF1C5CCE
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734640617; cv=none; b=TtWZ+Igy4iicsqTvvh3lx4FDsyO9cmkqyMhpKvQSuTimng9twbhYURi0R9lK0PhJhAgL5zEvoGAppXyfzsLXGh1FZdJ0E8zWTRAkg7EQq0E70GIrnH40G/jUC0pACg3VKJu/Ijid5mbrrAU3G4Y5cw/vY4kesp7Z6suYMNlKnfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734640617; c=relaxed/simple;
	bh=PKmV12KmIaIne4Yp9ni3s/DThfu+7FkzDjmXAOjYKa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dV30FdM9FcnLQn7012T8asojNl688F1TyXcd9wl78cbQbSYV3e7Woxa5WRxuGPC/7HsFLUS4uu5sr5CBatA3sEHu0OmNW0yPbgRFy91JGA9zTCBWFs6wXvhXurByQRedM8xbi5Os2ncbGqsPLlM9P3587p4/njQgfmF22O8JB3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1yi4B9A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJBkNtb017892
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rbLPj5k+mWqJD2ZbJjIgJjHFkUEA4luzmueKH21YY8g=; b=e1yi4B9A1ccQ5oCI
	JYIUwhbZvtoAmplJxCcCM/f92vZw1L0RHE7stPqhzaM4Kv3ffhaxMot+OZ+COp/o
	F/fKdgKH2dVzOPIrIM9/ChrBtBsl85S0KpPhtJhwq06iQBzcZpq9GYPYObWtqFPO
	J51hs5RpB2tueyr/tZwQA1De33iPWhtSoezayxlk8DsHzwNrMrFwrXMdKIFckeV5
	dbqFgtoYr5Ee8Yc5TlPDjSSXL8ZXZTBmzv9iflQG6F3/LUFbNvnzZRaTXf3zLDBj
	vafkLK13GZBomkrlXFncct97H/N3WDETo/n7CFvvqYh6pbSTYyS2B7DQ38s1CyAv
	zCgA+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mjw81bwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:36:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46792962c90so1898391cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 12:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734640613; x=1735245413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbLPj5k+mWqJD2ZbJjIgJjHFkUEA4luzmueKH21YY8g=;
        b=FYWf6EN/L8Q9++mAnhayCIJhkruJq9TtnjYY7Y5UMQHzstK6QHP1UQMVpHpGTmMU2y
         e5Uj9WFqY3duDmGLaPRWmKOYO244KPKxD/+HM1KmZ6xhV9isynyVSJiF+tMKwZljqW7r
         9IhYadL5rMpoARU0haGF0N5oGpQX4bWTguEER0O2LcV+V7X1BAeEjuRQNIex+Sc66rxw
         RReRwQ+I5WtTn0z4vOhCs55IL70fS6eDhcSzG3fRJmIsglPtgbsRtwocQdKxXuhMkMgG
         IvvnydtFF60uPCnWoAqdZ5BAb8EeBfZldD2Eg54MrAeB/y8Uu/yLQxWlWr4sRivZwNrw
         CqKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzd1KH2AbhpWnPVhNgjX4kCKwSGZQA81CDmQ0bIQ6X3XTWLSnS6W4Jov+dpyavoSz9Q8kOhBCScdOF7b3c@vger.kernel.org
X-Gm-Message-State: AOJu0YzQd1HoivFfHl/DTVZecDFjRAqutcOap0zO2MClMZRmyPZrtKzL
	hHmEXDplXEN4dkvIyutBAhSIXBO4JulBp9GMxJvUsuoOjKqcmoozG/v6hj+A/kEY1BEoo0ByncN
	81fnZgm2CZMEGl6nA5c2d2jukVeI3lgZJDRZiiqARvohICq43R+iidP6+nk3gvdYh
X-Gm-Gg: ASbGncuUrRbmsQHSYJS/iFRl7Kcijs9yHNH9vge6JnU7X9i8hl+4oFIfmBoTCJ4T9yt
	60UHNEqgfgT78aqotcyYSS0/4qF/VpszIkgygw5IJIEZU1ppEQgESVDe6U8E5jshT3K3gqhIKXQ
	rMPovozKClKpXucArcpJUtPNt2sA17h/Z4yD4rD1a8H2G1se4ko8TZq/p50jKy1MS2PjgMWkIPI
	01jopRsr/o+aM8DFDOFS0xPKbf1OIooppOpUvAtO0taarBO3eoq9cmkhw9YozOH7Z4cjwKBQH/B
	+6iJGUcqgYsxaVDSceVril7ShMK4s4Ks2WY=
X-Received: by 2002:a05:622a:7:b0:458:2619:457e with SMTP id d75a77b69052e-46a4a9709b8mr2535131cf.10.1734640613502;
        Thu, 19 Dec 2024 12:36:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDTEtCDQCMvHYR8I3DxMlrpc6duYjEQ6rOxFM+v836//HR/Xl5QsrRv0X4F0BqVXUKzXselw==
X-Received: by 2002:a05:622a:7:b0:458:2619:457e with SMTP id d75a77b69052e-46a4a9709b8mr2535001cf.10.1734640613131;
        Thu, 19 Dec 2024 12:36:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830b00sm101119766b.16.2024.12.19.12.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 12:36:52 -0800 (PST)
Message-ID: <ca0ecc07-fd45-4116-9927-8eb3e737505f@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 21:36:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: ipq5424: add spi0 node
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20241217091308.3253897-1-quic_mmanikan@quicinc.com>
 <20241217091308.3253897-4-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217091308.3253897-4-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6eP-F4pDqe1xNL8DA7WUhs7NTkyLjEid
X-Proofpoint-ORIG-GUID: 6eP-F4pDqe1xNL8DA7WUhs7NTkyLjEid
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=964
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190163

On 17.12.2024 10:13 AM, Manikanta Mylavarapu wrote:
> Add SPI0 node for IPQ5424 SoC.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V2:
> 	- No change
> 
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 5e219f900412..b4d736cd8610 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -201,6 +201,17 @@ uart1: serial@1a84000 {
>  				clock-names = "se";
>  				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
>  			};
> +
> +			spi0: spi@1a90000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x01a90000 0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_SPI0_CLK>;

This register base suggests SPI4 for both the name and clock

The existing UART1 similarly should be UART0

Konrad

