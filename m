Return-Path: <linux-arm-msm+bounces-59264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D00AC2A47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 21:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9448E542412
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865A229B776;
	Fri, 23 May 2025 19:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6OzVMMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D7229B231
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 19:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027654; cv=none; b=quZ8iNOpfcqgNjVuFLscldEC9/po9PurmsHN5LCilRte6kVtHXOIkiVw1xrLN6UKtJRndI1NKg+NvBR7UU7lXNAoby3cHuzTo+Y2ckjfWhZbUmHRf9Ablr0ScZfURUCv4p33xm7Y2C7KsrBWGelJYJld5uwBtJ3l+foOBJtxNvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027654; c=relaxed/simple;
	bh=NJY4gnaLqh/2PIZVTRhxEeGz5B8sCMlGdIW35U2vmsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjFZSxE9MsE0FsiSJV3kkW9lVDZ1mE5y4bI7WoByaPDfVAR+UJcLmuK/aT9aiP2J8ugNSsaoPmLq4KyKDAuJbo07/D0yDwFzwJoV6DmocMIH3nnN3jWAZJH4I+lY5LPKWrajK5S+g+v919+jRNUcYaA1Wy0y2Y+Tj09x896jTwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6OzVMMC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NGOCgA019528
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 19:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VI//RR7juJWGD286Mdk8S/XWLwI1d3+sqd+3hZdpgp4=; b=Z6OzVMMCh1rGW/i5
	d7WZnpPw+Vmv+1YdSEB/u45k3pg1ikPUAQ2dR3G3NZnnHSpGEPamLpf/Gc3YVTSd
	gdiu6699W3GfEFfMAxYnWBevoIYS1fxgr6ogoZSMoh5c7GDu1ImVqADL5p9NoNY1
	2EKQCtK2vAZEmmo8SGYy/FTCWDwQdoesYKIgbGnC8wnwjDSpXsLP0gaOZfC1AZcy
	XFtZV4N+seqM/59W7y2UbWBNBpMVj8gFyoIti2RQidgBXfI/Rob0rQ+KgksAGwZp
	UwJjWAD2QJeQQXQ0as1obmNUcIBZD3w25wTFPI2orvBHH4LpRIGqmDiSEo5c+xPO
	R0j1Gg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf52x68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 19:14:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476a4a83106so224511cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 12:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027650; x=1748632450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VI//RR7juJWGD286Mdk8S/XWLwI1d3+sqd+3hZdpgp4=;
        b=AAIi1cx+KbTD6u15GjAP+WXheiV70G3yftwkJsPhZ5Y6m+xS2xpRM+BJx3c7PSE5XY
         +rMIRSh50MZCR6hXaL67qQzNp9NLpzRxsqQGAflDPgJygTZcYuwlSiZa2XThdzYM0s+J
         9VWytJTdvuKYMzDSLqBdR9cdHfL6QoEfe5eVTl7H23++vqmKyo+8xFOjMBpWmdAznF46
         ylYO+y7w1/reuVtsI1Jqf/+JvBYx/NSCS8srqtCTnWjff5omMayQ20+tjgKaAou7BdOn
         XHHjjv/3hZII8WI8NzHbhlObgyGkZdLlB4OEs572GONEUljtJR1/tkVCm7sTyI808dBy
         lIkw==
X-Gm-Message-State: AOJu0Yy3eOBmF7EqMxtMuIt3kT/XrA7wM7c+gldwj+RXFhsd+qSRAn/3
	nhXN6tGGm1b7/nWsN7VMxYKgr9sSMdCjvjYUeA/tegS1BINT3NEgzCk1I99MCHqBmngduSR4JSd
	1V6teyEXYCH78/Qx7XuaDAsk57v3G8mgS7fgbDG/zbfA+TRYANmXW465akuYPa8C1Of+q
X-Gm-Gg: ASbGncvuAEqu5md1XjJHWC82lcZPGi+/BrWrWZuccjZuA2/bN4GNE9G2eQohSZlt6Sf
	aoP1ZqwpbRDt/070gypNXIx+UfI6OQ64MOzaYJ454WH1F0VaCc930E8litYadOz7ibEKau27h0F
	GkjeI1iujzHgwdi2F3PE2xEGEHhCfXbtmf0LoRmIevZdtaJEmsf/J7fgcLIX2yIRsCApHQ4du3f
	c/Cui64+G7vQ05Gvlg5GgPli0jv33f+8P3n6NFQdk8FLTQa+3/bnxPXEwPg3ua3Q1KE0t6yScnP
	ZiUx2v6N/cL+mOrmmWijOtP1cFxR9yhZCqQWhX3Ei0A6NSpKYVupBY28oAqHjrEGpw==
X-Received: by 2002:a05:6214:5095:b0:6f8:e1d8:fa9d with SMTP id 6a1803df08f44-6fa9d324303mr3561526d6.7.1748027650246;
        Fri, 23 May 2025 12:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4YJNIMGoREgu+QKQuFwjxJdFPg04USqYp/clsfNZvtlC5H/HL6A5EzRZCUWIQa0RIPUkW2A==
X-Received: by 2002:a05:6214:5095:b0:6f8:e1d8:fa9d with SMTP id 6a1803df08f44-6fa9d324303mr3561376d6.7.1748027649844;
        Fri, 23 May 2025 12:14:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06eac2sm1296261866b.63.2025.05.23.12.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 12:14:08 -0700 (PDT)
Message-ID: <555e8dcd-6f1d-4ef6-8a1b-78c53a39a327@oss.qualcomm.com>
Date: Fri, 23 May 2025 21:14:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add crypto nodes
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250523-ipq5018-crypto-v1-1-0818047d8a18@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250523-ipq5018-crypto-v1-1-0818047d8a18@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EEdeEkyGnvfbswyyQ0kgT7zpV-kwmZVA
X-Proofpoint-ORIG-GUID: EEdeEkyGnvfbswyyQ0kgT7zpV-kwmZVA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE3NSBTYWx0ZWRfX301irD3g0JY6
 BqaEtFYiRc0H5q32jBIcPDeBkLTrQY70xkZW4rGivs18RgsrCNutDEy+ubT0c7osA870l1O5dqz
 T87UKzfG5izqdh6iWky3eqhgqX6TexS3CybDJGAwEecnhKFPfjSkvM5Iks6xR0B0emavEIyfr66
 G8bFh/rK81skPJy46rElmLUvO1NjvmnqX1kuzV7lXfOzifH6/9aQZUjdthRMNVdNPS8Tu+KJvVz
 MfUYtQlwWgQ34KNtNYD+nPVCEZyV2Eqptmi6c7wwa8QqAFCWJ6YWPcOeqvutotT4lWv1FE8z4q+
 Blx6W15fw9+b5rZMP8eUrHtayfQwxyc4NMBjoGIfOkDHWwaQN5QmeqmujlB6B3K1TtUCegvScr1
 g+N2CeYzzOUWhmu76jSy3pAZa2A9zwA8yr2Af/Wb1Ps41krY2Py5HHq6/JpKwFOr5Kj5blUe
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=6830c903 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=APJUAXjnw3rPWsM6C6AA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=893 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230175

On 5/23/25 2:30 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> IPQ5018 uses Qualcom QCE crypto engine v5.1 which is already supported.
> So let's add the dts nodes for its DMA and QCE itself.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 130360014c5e14c778e348d37e601f60325b0b14..09ed9c34c1c6129174143ae770f8542dbf61128b 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -182,6 +182,36 @@ pcie0_phy: phy@86000 {
>  			status = "disabled";
>  		};
>  
> +		cryptobam: dma-controller@704000 {
> +			compatible = "qcom,bam-v1.7.0";

1.7.4

with that:


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

