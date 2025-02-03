Return-Path: <linux-arm-msm+bounces-46756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E728A25B4F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B495165567
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9022205ADF;
	Mon,  3 Feb 2025 13:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gzG7lLqO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A2F205AA7
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590618; cv=none; b=Ypdw2N7hYUm4MzmQ/hdKwAC8y/V/hcE4mzqPaZF6HvqOL53y3qb8Rroh9Q9YdawFA/voHFaKNBlxlPVya6HL1IO6SZs96B+svUTgxV3YEmBB0MarrCR6Ss0Q0hiRQaAr10D1GFLw76jLrN41b0GiZ2EeWOLf/b0ToJ2x+Y1HnlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590618; c=relaxed/simple;
	bh=Tt9vBDTFmYZuSOqXACKt/0t7ZIw9rhZJNXLHRo6BQ0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0TCV+/PCSgubjBfl32mg9KQxCojX/VgSNuZRbTluXkFuJ3hRZz+DhFVZnAy9QuK02QfTGcDEbKHZ/JofNEp39+MSpKZMB1iQWan91UzgNcpDf+kNGR6vd3hTL0VnQKM+WxgQK/gBIxHyop0d80hBtjbc9G+42Y1ETjuDZBvTnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gzG7lLqO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513Bqkn1001668
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Feb 2025 13:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nqxiWCIT/Tin2k7dnyFvGCB27cd0ePrjkyaWPJDOOK8=; b=gzG7lLqOW/iDn/Tp
	LSm0/gU06ruPg3G1dOPopwi/0hClR66txX0RGSYlLYMe4Un4QTYLO49YUb0QDF5E
	qkNEIEEcIZnULW7QfJkLNwqB5yN1FFP4KCG8kmi6BUMGKnzv+2gH61AE1+fgNOfU
	7u8EAsMb9IlIhH6x04G7S2IiaG2H6LPH6SoGLgvi5IFJtsZv5lFe+xua+hkmPEX/
	DSdtwu7esh7g8v7xIRbrmnjRzUNahHzo0PEGW2K6WENujxEJKKtDARZlvmF89NG2
	MT/Y5+IRcWhrTlJQ36kdYee/5roEAQP2jn23Xja3HgB3PGFPRVZ9QUxAR2cW0onL
	cUzo4w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jwag8amh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 13:50:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6e132c31eso20907785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 05:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590613; x=1739195413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqxiWCIT/Tin2k7dnyFvGCB27cd0ePrjkyaWPJDOOK8=;
        b=VlShvkqZXCdJ6jqGKF6L/WUbl+qISXgJxpaU4/WFWe6BHVL+8Hm5ioqjpuSnqDTWlI
         t2fxoZjXu5VwujURhaacj2HrZK0u3DZ+XioMaM9q7uZ7LcrK6N+dJL4aOwvwSn70E+ZU
         X/8hrOkAggmGI+S/46FBIvl+Payv9bGIC0caK2iIbNPLYiu1RBgL+/I8fpFnejDa5N8c
         OWztVEcn/e8XLB8vsWcO7M5dA+5mBXc/HALInIdmEaJTpEw5QcubEyFANOQj2njGFNVo
         W1hraFejppIQTI/4VmsmJxSHLpK56Ekblx75P5mzyDzZhxMdylSnjjEi6SWSZLmNmHJU
         tDvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy/Y/476V8ab+etP/p+sfHcnkAWacuvuvrux+2YMgei0bykNjxUJf+YTGvYr2EzJeO8+EMSAM9VI1twK4k@vger.kernel.org
X-Gm-Message-State: AOJu0YwD4A4LY9Qt/1kuAPW+8MiGmhLrjrDkGLPoSU7QNJii38odAcGC
	+eOUhz0KOsPNiVY0q66l4BofXHh0oZ3OrfSlHpC3YVZSgqa+GkhF6qfBSSoAsoZaRP9lkmO+foQ
	FPc8PjKX94+bUuJU7wu+B1lTBfOEvTfTJLtAimu+3LCQx/+pSbt9+Z/l+yeI5+Vpq
X-Gm-Gg: ASbGncvrvO/g51aJR3lfVL0RLz41dVq+jGVuoXtQPnjbm/Eeem4FQLv+2kiMlsxbKpR
	K+3nrNvagU8ZWjO6jcoCFGLNe9r8Qk+ZBTXMpv+XV793QdKMZksp248FuH/ke+X8GuZjCj7i30W
	u1woHFJy38Dl5ThRJoEMksZyKR9t/3HVoLiR/KHOgFCCrbQEdYYzMhV5cTxpyDmuNfGDg8tvqCN
	bOCXwHlTbwaW/tJa/a57JsHirU5xBsJSb1qd7JePODKSo0h+2hqUy4i1XW8DJJkCrGm8/QsQwvO
	J6Qj9hbb2GC7DmPdTD6wtJPx7kXlC5ysiP0PT7EScOtf46yS5JzP6nNnycs=
X-Received: by 2002:a05:620a:40ce:b0:7a9:a632:48ad with SMTP id af79cd13be357-7bffcd8f975mr937810985a.11.1738590612876;
        Mon, 03 Feb 2025 05:50:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFojunUVhTwHgzodyssJiBoApke2JKM/2E3BIMLMBQGie53Ao5Kal4SPfr3pBEYVHL6tCtiYA==
X-Received: by 2002:a05:620a:40ce:b0:7a9:a632:48ad with SMTP id af79cd13be357-7bffcd8f975mr937809085a.11.1738590612564;
        Mon, 03 Feb 2025 05:50:12 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7ffasm755714966b.7.2025.02.03.05.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:50:12 -0800 (PST)
Message-ID: <d5e1e6ae-b773-4ec8-a66b-2e1830827164@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:50:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: qcm2290: fix (some) of QUP
 interconnects
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
 <20250202-rb1-bt-v3-4-6797a4467ced@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250202-rb1-bt-v3-4-6797a4467ced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zSw_lj8_mWzEaHfSw_2gTawIp-MmJ4Eo
X-Proofpoint-GUID: zSw_lj8_mWzEaHfSw_2gTawIp-MmJ4Eo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030102

On 2.02.2025 1:16 PM, Dmitry Baryshkov wrote:
> While adding interconnect support for the QCM2290 platform some of them
> got the c&p error, rogue MASTER_APPSS_PROC for the config_noc
> interconnect. Turn that into SLAVE_QUP_0 as expected.
> 
> Fixes: 5b970ff0193d ("arm64: dts: qcom: qcm2290: Hook up interconnects")
> Reported-by: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index f0746123e594d5ce5cc314c956eaca11556a9211..6e3e57dd02612f3568f07f1e198028413f463c69 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -1073,7 +1073,7 @@ spi0: spi@4a80000 {
>  				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
>  						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
> -						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
> +						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;

Still incorrect, this should be &qup_virt SLAVE_QUP_CORE_0

Konrad

