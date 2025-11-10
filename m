Return-Path: <linux-arm-msm+bounces-80894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CABC44BA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 02:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD3E24E67A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 01:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9492221D92;
	Mon, 10 Nov 2025 01:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bM0mKyU6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ItAAtIhA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267C921D3F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 01:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762738191; cv=none; b=D1Awm8uOVbdOo0tcb2l5QuPBgQMb94tApkRI1L+jvPu8Dsmhb0KErhljgiriyiIdRfajAGt6EwLGMmn2mEPd2vGMv4DmQxCMIWToApo24VGP0CfCLMty4bE0aySEVvAs6Qzon10A/tHtsvvKvNljUB1zYTLRXxyGS4WtnZjQMcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762738191; c=relaxed/simple;
	bh=2NZzeLexcBBGUyZzml9soZ/Jeo3S3S8JioTiz76iY+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c2LpWAuJOQykKHMPfhmcxFARjxEdP4YG/GHhNsnyHxVEkzAHixSc50kcSjbUaAz9fX4X+7O6KizSVOLxWNmsClj47ok+vY+bcxRe1Ml1XiqjoqztttfQEf1DdEmWnxmZgKXGDlVqXaGBS/91si2e6rigPVSLurmKWK45pKTFpsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bM0mKyU6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ItAAtIhA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA0XBGY1808874
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 01:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvQPOUskdjWPrB4UtpqZJVcpnC9hm6QOIT/T8aJTbnM=; b=bM0mKyU6Z/3L9xQy
	vBJM0QCch4B1nhqDc5Sm+teT0SV5j0X54eda9BFhrlQFjdVzyoY7E7TEX1CzFo0E
	rKVwFtLjAC7ta6Gi62J2m8unBIw89FWqEbM2MZv+XORblBHW+CeOjlykiKL8kS6n
	xpxdukS0KQXdeXmE7b8a3bm3IM8hS2wg6ipoi3v1XC4UZnmU6UB1mayTww24u6jz
	0P3PDht63XhXWyy2kcczsNbQ581u5Jhfclz85OuN3pU1Ob1Yv+/rgmiAfq6LHL2Y
	8PJF4B+iZuxCfY1eV/dHV0t/dfJ81PgIk1w8g5JgeYdtpab9hFVS4kCs6s+RdJxE
	wR1w3A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1g2nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 01:29:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3407734d98bso3163753a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 17:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762738188; x=1763342988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mvQPOUskdjWPrB4UtpqZJVcpnC9hm6QOIT/T8aJTbnM=;
        b=ItAAtIhAAESrKHnS2Rq54HmUUwj4z5TRluvYRoC2DwBKX9fby+FTQwm0er1lm8ULd4
         IuGj9T178BZ9BS9Rsu/4QTdtgtWaXKxSCKhxdA/x2+BmODZstNi9ozUgyWT6RxPkkBMT
         wTeNtrYD7PSszpFy6cK//lv3NKa8yyoC+ytwYqpPPPrUlibGwsRhZG0sJR+jxajHuJcC
         QWudY6QlgBvC+r47MJ0zOkCcclF6GClmVoE3c+R/ra6bJvw38blXwivgJ/XxXJo+Dxo6
         4cl+USt+C9dJB7Xe+1CmREQw/31KLHPIrJCuqska5Ff4F6EP7qepjTSGIRwQtedpUXUJ
         VnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762738188; x=1763342988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvQPOUskdjWPrB4UtpqZJVcpnC9hm6QOIT/T8aJTbnM=;
        b=q80SxOKEctOOlSxui0n9NfQMTmCHOUxcx2G59Shpkm7PGNaPkmRNTZP6KXDR/mtf77
         7YuK3jDckutNgwakajQxeWeCjuZA/6BBRSNSxxoe45jADuX3IsM7A+DCbfOQiucLGK8K
         gJMQ1iEOyfEAzLDmxuN3RMUBNrD6mr0SNlPTZMwEuCB9jTD24MEpSBkGD1x1UxLEi8RP
         wq5oSlNNMLJ3dyw9Jp0gm3uyCGAG4BjyCjPoJ/3ilw5C2nKBhONKX6UjTC1ghZMC6Hun
         6nKYj4PPua2Ec4gHn8hn70MFG2GGd1aQg4vU0kfofHreN9ljSI0pMzuib5C0/9YhUOdg
         h2nQ==
X-Gm-Message-State: AOJu0YxdJ4ncXOdslu5ADj1+qLZqY1CiBXjirTZB3iWCgyTKYlGMNIi2
	4kazI94AofbxijVUnW+/r6IC1e/9MLmmU+gZ1XBtLmKFEEfeviC2QpibuS7PYodk5x0hZxLlKts
	sJBwURVZGQ1FJBv6QG5SK1xs1+NQO5VR3wpz5jE03mAmws8btmYF95Riy4LOzXAo/P43M
X-Gm-Gg: ASbGncu7n+hMyTs14LQeTE8iDVxGKTGAyWKp1GJ4x97/vv7pzvP8+jO/cxqXRSVdtNN
	rKWpjkOVi++0415TvtLIN00NRbHR5LXUvNbeEiydgZgNJUtUODi6kUY2E6wwWBgLOLsrtquGxIH
	Q4mHyG0aBqABvLXb2Ufbmm3Mymrzfq0YPtz6SoT8Eb1XZQm19teOPveZP4NVRpW9XIiB8sG1rCG
	GGdbfnBOJF18DVPHeq0oNuJOwsWgOlnGjYRQOHxtbjq2OL9RPfOSI5R8smgRRo99VBk2FR+pimI
	CKcwuI+V2mT6No0hXkJT8T5qd+bNNeL+KbjUfZ9Syn/ixra96hAQscHOlDtSbB1W7PzZXUv9UkG
	WUJIWJe75dKwjwuCd98yCVU4B885ls5Va3iirR6aOktHkQ5EVjgYF3eTGSxtgpedp
X-Received: by 2002:a17:90a:e7ca:b0:33d:a0fd:257b with SMTP id 98e67ed59e1d1-3436cd0bd68mr8856904a91.36.1762738188461;
        Sun, 09 Nov 2025 17:29:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/zpXBoEI0qZfIbWB/NFb7Wa9KJd0FMTt/M01D8g42vf/KLbZfvlDMgxiy/2OU7k021aGKxw==
X-Received: by 2002:a17:90a:e7ca:b0:33d:a0fd:257b with SMTP id 98e67ed59e1d1-3436cd0bd68mr8856887a91.36.1762738187957;
        Sun, 09 Nov 2025 17:29:47 -0800 (PST)
Received: from [10.133.33.229] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3436c3d7dddsm5695497a91.7.2025.11.09.17.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 17:29:47 -0800 (PST)
Message-ID: <b80a5bda-e0fd-4471-9aea-bf3b39ec64e6@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 09:29:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: add CTCU device for monaco
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
 <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDAxMSBTYWx0ZWRfX7e6tHHZ026f2
 2/cwRJZk47ABiXwpjMGeKgyyfvUhcEsRtG18Ew/2eDhNwi8BhFjAKY2TtcIzBh6Zo7UkdZdZNy5
 lferzSBm6og1HQwMiF5H9FxbcFNaQp2PT7OwlWH6OBqQTHTeu3Lr2gL9dHZPXcRBT+QIu64VY47
 DumBC6HLNKL408TNvwwlfB5xfGu3fDEo1/hJDFU1Tpaoz8VzlfUvBmOxdlxPoLkpPW53TRAuYp7
 N1uCog6ooruJmX/U/Ki/0ts86Z6sQYcmt5a0dj0e1y3n5ncBTfivtDjUidZP9wM4A8lh9Z0wu8D
 FqtORQhQ7QuvD/nJwQkj5oWhUndmOLppE6wbIpldy7RQWUT1CFmd28WqLZOpO74Fcn2du8+cK8i
 kS2nlvyG7FNpIPS7CtCIUp38SWgtng==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=6911400d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=51A4gIhVuH9znBGuUk4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: y1n-XBroGnbcTUBJvntX8uGBJ5PFCakz
X-Proofpoint-GUID: y1n-XBroGnbcTUBJvntX8uGBJ5PFCakz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_10,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100011



On 11/3/2025 3:06 PM, Jie Gan wrote:
> The CTCU device for monaco shares the same configurations as SA8775p. Add
> a fallback to enable the CTCU for monaco to utilize the compitable of the
> SA8775p.
> 

Gentle reminder. Not sure do we have a change to apply this patch?

Thanks,
Jie


> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index c969c16c21ef..460f38ddbd73 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -26,8 +26,13 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - qcom,sa8775p-ctcu
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-ctcu
> +          - const: qcom,sa8775p-ctcu
> +      - enum:
> +          - qcom,sa8775p-ctcu
>   
>     reg:
>       maxItems: 1
> 


