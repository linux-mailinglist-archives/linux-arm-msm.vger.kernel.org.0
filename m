Return-Path: <linux-arm-msm+bounces-59936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D45AC97F3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 01:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB7A34E4F0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 23:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4DC28C2C8;
	Fri, 30 May 2025 23:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0BnDPAQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E528B51E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748646270; cv=none; b=uv408LxCJU90ZTmAAZEQy4jNLz1lRlHUaiOyOfcd9MCxRbuYLbfiX4DC1e/6CMIocEs5Odew8Ci2U9KwJoK2ZdiKO0ZKTZExJMAJzpHfIMdYArPpwyFcfeGGwz39d/N6XJSHUuT+bPQAHcp22O22oMsp5EB9xjKxiZqICCL9sPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748646270; c=relaxed/simple;
	bh=byiZoh49SLANJUmSAfCqkOwCaNc9lAE28TTBexKKF/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLt7N52gyVPzQ2CJrrOklCt3OFqMq4E4RHEM+/xlrL3P4DZGRH3MmMCmVFbgt0edUudO+YEaQ8MeO90Fh/JDT0fIuqF2NwqcgxinesBEnHW4/jAoAoIfTD+5KQI7z2+ltvjPPHEiqHHMw6XbK+kSbUElYozvfi8+YnpF0nOIMPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0BnDPAQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UKj3Da008039
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 23:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dkCBS/+sevFscPkQYrCdD9qA2ujLMqx9Mjn5PoGA0mk=; b=V0BnDPAQ1cZA5vMx
	wrO+uwAWz8KFlXnstE/uufBrXfFTgi9pMy5ti7STYQH8q8NfAlgSoJywzRQ6RcaA
	6L4TJWa4Uz403dM51XNkHzP/9ei2iIwgXqq+mOW85fAgEex2hgHJ8sNILvHTUBtx
	QMmPQvrIfUhawDrBFMPX2VL8X4HSZYJ6jM24pYyOVnxGGOnTewosFWMUTitVV0hm
	KmSkZ/UPg4Xm8SkaQ6cc3gS7/f80g+dpbgrj3rRQ2grar1cbok/T3eBRMT7e4Nov
	M6dcZIyQItB+TI3kB95iWFi5BpBHlRQOo4mvsDGr9r4aZtKEZ+qjdWdfclyqhQkp
	lNnSrA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whufb46t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 23:04:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a43228ba19so7238191cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 16:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748646267; x=1749251067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkCBS/+sevFscPkQYrCdD9qA2ujLMqx9Mjn5PoGA0mk=;
        b=ILXjeWYk/JdCY6OkdZ/M3G6AyAcZu1cuHoGq8kD7ZAaDw3cVWBf9uDeHFdRsvM4J8I
         djBjvfV962/QsdVRBHnQYz4klTkxEPe9z29DyRgd4wFCj6iPB7M1Rk4lFqxn/wq8b7zA
         spKofsSxQ9tulbEkpCVIAhZyH2+UFcI5ODE2RWfE4JLFUY/8U1dPFniUQLEPrN4s3/1Y
         t48e5MGZOwje+w2323lywU1+Revb5VM7JGuP2X9Y4+CZ+jhmmwy8qRwI2ma92854YHm/
         N2lNvYPuwQ5n0v/Eo907mJJz9kMMRQKeJMXyxLWF63Ee9IKEe1xNLdBwkGC+VZhefQXR
         18sw==
X-Forwarded-Encrypted: i=1; AJvYcCWEDGqPr2nNcHjztnaYxK0jBiXL/B3fqrUI+rwDaYGJ/nkYArURK/mq8dH9zZSoZoiwlAVcaumVN+NwUYO5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfh7f4AqYGrcvSgqWmtjXIS36yaqBVL5qRjAwUtSdXll1Ejqcz
	ygc4KbKjVCAjiERGuMsw1hmIwG41CMOvoly5k+AsbjF8qnZn3qxhp9pIjRW6jFP5MOpX4gMkEet
	PQGBhRMZGetfJnUv9Y26r3S++6J1EaajXPVzigHjIQkELvkwHQJURNsWvpGnFDv++6mF1
X-Gm-Gg: ASbGnct3zRGaYN2RB2+LfoJ1ZkzYazEu4s4LirFY6cM0MKtJNCMnC2qV1cPF5d6Xo3d
	EdNw5tmk78HBhxkEZzcc1VgzaKg8lLG6QNQ0JOIB03tf7hFm6HfWvyEzTO1FkowL8JRRZzBAmkW
	XSpHdDni/iadgDx4ylKUT1jAquSNYMc4HJQ2Ym9eYgsG0pjTU4UoI9biShkgcEhMOMlaLII00Lf
	1tKVtwxFQm/lVRJD940Wdq/0g24YkRXGqqgkil4jxchsI4OOvwInz1uxBagRarU1eCtak5+YNiK
	id0gJVPNvUau/eIuX9ysANc6JIWvnapLatSXQXcJjwDMH1BbqTqL05ApOFwDmqxATA==
X-Received: by 2002:ac8:5786:0:b0:4a4:3cad:6378 with SMTP id d75a77b69052e-4a442fd5b4dmr24293991cf.4.1748646266906;
        Fri, 30 May 2025 16:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwEI1tzi2R7YfDu7oYyeYqxX/g+u3B+J1JeZ+9bSeOHb3HGbzLToYdbggmXX+xwNflLNapVg==
X-Received: by 2002:ac8:5786:0:b0:4a4:3cad:6378 with SMTP id d75a77b69052e-4a442fd5b4dmr24293841cf.4.1748646266428;
        Fri, 30 May 2025 16:04:26 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm399104366b.37.2025.05.30.16.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 16:04:25 -0700 (PDT)
Message-ID: <ee3caba9-deff-462e-8117-f375882aaccf@oss.qualcomm.com>
Date: Sat, 31 May 2025 01:04:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: gcc-ipq5018: fix GE PHY reset
To: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
 <20250528-ipq5018-ge-phy-v2-1-dd063674c71c@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250528-ipq5018-ge-phy-v2-1-dd063674c71c@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=683a397c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=rZqdB0JiAKPJAkIg25gA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 3-KnKRjb-J6wcQ92XS6Ga2WMSy9B4xUp
X-Proofpoint-GUID: 3-KnKRjb-J6wcQ92XS6Ga2WMSy9B4xUp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIwNyBTYWx0ZWRfX/6SoeGafTrmq
 IhqocOKt+uVEQhYiCCnL46Ieg+sUoj7zXbTCfDiNFjaRDI3dbQeGbi2gHd0yTLXULXQFkb0n8ar
 c7dQfGKBYhd1jMXyQbY1Q1WJs3MnXTPRFxGUMkD7G3BYxF5AJMx5iVOAiLDml6x3ND556H0IKzI
 T22xEi9s/zWKB0ULL1dPydxxJDPx1XbHxKM7mUsdQ0456TWhxrv9TsgdyFsaK8w0MIqbfrU6mc/
 nNqBBEQqkUrYsW0V8pTQQ0wiGPu1I/YHIC5yHa5WHgLlVZaECPAPYf/H/perTBN1L/DlKQqkVM5
 E1sXJ6yKf52sZxYeY11+J72xmcOW26SkZnyN0cxywvyxVxe+h2Rx6+s3vP1r3IQLiu6lx4Q2pcc
 3nCWhyyPMpB3S2eHwCcn1mauqtLfVYquSfW3AGx7xqWhgGAbpUDFjGShAUe3MoMhoqVLZktH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300207

On 5/28/25 4:45 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The MISC reset is supposed to trigger a resets across the MDC, DSP, and
> RX & TX clocks of the IPQ5018 internal GE PHY. So let's set the bitmask
> of the reset definition accordingly in the GCC as per the downstream
> driver.
> 
> Link: https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/00743c3e82fa87cba4460e7a2ba32f473a9ce932
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
> index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..02d6f08f389f24eccc961b9a4271288c6b635bbc 100644
> --- a/drivers/clk/qcom/gcc-ipq5018.c
> +++ b/drivers/clk/qcom/gcc-ipq5018.c
> @@ -3660,7 +3660,7 @@ static const struct qcom_reset_map gcc_ipq5018_resets[] = {
>  	[GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
>  	[GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
>  	[GCC_WCSSAON_RESET] = { 0x59010, 0},
> -	[GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
> +	[GCC_GEPHY_MISC_ARES] = { 0x56004, .bitmask = 0xf },

in case you send a v3:

0xf -> GENMASK(3, 0)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

