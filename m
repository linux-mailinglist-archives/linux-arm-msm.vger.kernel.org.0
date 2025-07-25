Return-Path: <linux-arm-msm+bounces-66665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E35ABB11AD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 11:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C682E1C219C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 09:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2082D3225;
	Fri, 25 Jul 2025 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0AgewKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF802D29DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753435865; cv=none; b=RZsC9mV0mgPkY7XXVIBPnhjQL/BoHu+if1knouTDIxCdFDKcdY6BYvrrKi9oPB2/zrm3peZsIztoL4DjHaTeMpHfV2YNptKZleJy3P9FJQSCkVsIfonjNBwNUXFI+WRAB2WJvDHAZLTSuwbJRlZTLyrtZTY/6Sry/jGbVFRKXU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753435865; c=relaxed/simple;
	bh=nUHw6qP239Oq8jyKrq+quvMkdXJhaA8f0RlXWhVYRvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Or0NhUPnOm5I1LVCKlLRY4t8MCMiEqO8hzVlmyvxWH1K3xZwV56ec/YOCFHg83jdnX7VhEo/2W2Q785CuCJnOTeyqjT2XfLWnxgwMA+LDq2VwMYjOJAT03Yx6G/NsLEU+N+wAZpEqugGunZFTRLZhU4kQL+cwJT2y8GTH6RPYf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0AgewKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P89G8S009747
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHICGwDwDl8daLhetFxgvsPtxOilAqYGnlpMT/3FILM=; b=H0AgewKNMaOsW8EU
	f62QnRdnuAMqJkLNTgd73eMxoIxelTBzL/moR+Xlwlx7jqG2DmfoV0xu/YRgdZlB
	xjV9TT2nKmIbjxQATJhS+BIeiFTG5vIA03BIWcbpbBGzfFltb0IR/rRhLfAtDeRp
	yeurOMn+YsbaQwf5K4mjwMG/wUExUPmXs+udOFOY/qTko0jTHZ65VCxPNYa4iN/G
	BiNliyjDAnj3cAD38IzoXaFCZV5OcalSlh8toeYKFqyNMJmeyBeNaJ7mKg2iTo3b
	BE/W8zYo8dhDtnMyHKfyg9/+nbf4yr4J8Z3r+KlJ6+tb//C+uJb2Tylf7ctol42n
	MLmBbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48465907eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:31:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e33e133f42so53496485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 02:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753435861; x=1754040661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UHICGwDwDl8daLhetFxgvsPtxOilAqYGnlpMT/3FILM=;
        b=Ln5bKupl4e+44fKzcIXLYD51Cdpns8gHO5S8cOoZ39Ua9gg2gFKd4pgvJO7+6/wwsd
         P19qH/aeq8HnnokrfxWyxNUj1Q1a15/a2S/6Gf/1gfak79RDceT9HcOkoGZtCVk0P9rz
         bf+b6oM75ADxbM9H/ljipFiGHVdDInZCnoy3BUaDb4IZEIJfELH8y/u7PACnDmZm2Zyc
         9b2oi6EMdkOqPEqwAcdEkXFih4lRCU3zqbo9MaFZl0ok3C3HTHtaYWET2oZGY3DsDF7D
         +tfMK+WLjsVxSPEqLNgwKRZ5EsS3xkvwAXU8W5yNITqPpGdCIWsZd9OxM7a3uDlUTgML
         bWYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVguZqR3jCUH0Od2ZQ3Uorv1vGuuz3EQ9QD8Mq2wmCntl3Pil5hhBSed8eZc1Xstdk3WkJFoQsBhVB9a4D5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh+xMi1Bhti6SDB1VKvHT0h5TKvl3S9pV3pdEvY9rX4/ftKq86
	Jfj8Kj442Qwshfwth/xtEw9NweOcczMVqUmic+02ny5a5QNU9exxjSgVAEIIQIdKJSiMWGVEnsN
	uipN9DXyonAD3P0RygLJpAJh4zmOpg7HUmPg2C5r3Aeb/qwhOAOMhafBXaz0KGt40KbF0
X-Gm-Gg: ASbGncuZDH3AUgdVFrOWXkwckuwo6i+db6Bo/9gG47gAcRoEMQtSXUXwLoza5JQFYKo
	nfYIWv8adDHrBoWzU2J+Lk2XdKxBo3j3tD9otEJkM/Gl0M1O7TfS/iU+K0fxgG+CGaK1iyuF4Ah
	wX3rJhA+HTfU2vE8ZTNrIt2Jbujz1sKNM9VdbGl9CpZY23ROKZ7NNokdmm7pcUGCEbCFZrA0WtN
	cDzsKTqqofXGZCBB44BNuoMTJmXeETZJ4n9ZSAo7H0B83W/a6Xg/BerN33ftqfYvbuLCy1ryJQx
	XMvgBoYxU9AnhD0C3sRyoPZVNudE0RQ9JBCSXMr+2gkO4xXJDr83+/CexBSNsAPYg/jG4Ppyr3X
	yzNTJfAbPm/N/B41d1w==
X-Received: by 2002:a05:620a:472b:b0:7e3:49b9:d06a with SMTP id af79cd13be357-7e63bfa59f0mr48178785a.9.1753435861388;
        Fri, 25 Jul 2025 02:31:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2nBHxoBD5pfk+D4HZkaX/oRldqRoW3uOXw1dgDzm0zFAJsz26a1olh1gz5zMUTAt4W1if2w==
X-Received: by 2002:a05:620a:472b:b0:7e3:49b9:d06a with SMTP id af79cd13be357-7e63bfa59f0mr48176885a.9.1753435860738;
        Fri, 25 Jul 2025 02:31:00 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cd650basm240182766b.58.2025.07.25.02.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:31:00 -0700 (PDT)
Message-ID: <54b617c1-bd1b-4244-b75d-57eaaa2c083d@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 11:30:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
 <20250723-topic-8750_gpucc-v2-1-56c93b84c390@oss.qualcomm.com>
 <20250724-blazing-therapeutic-python-1e96ca@kuoka>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724-blazing-therapeutic-python-1e96ca@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OczczSgqgYS-OcDk2bEnnRboUo64BsMC
X-Proofpoint-GUID: OczczSgqgYS-OcDk2bEnnRboUo64BsMC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4MCBTYWx0ZWRfX+v7X6jzlWBnn
 CujHrqaZ0xdJTcQoqRgz25zcHZjIOx28MBGey1rYV8BzkhbQtD6yIs//+RPXsJbGpiZRSCGd38X
 Xz2449Y+COUSUSjNBlAAiT5zgGZtBaJCqcRWWYtj9HLzOH/XE9pCnCRSXejCRxlEmlRWSJNgNh/
 mpYVkrkKgEVEBGcdZ/XOFg3xiFbC/sIzYfh4cLrj2UCZ9PQzASywV4Zkw7GO1e+XOrMKS17c6dd
 o+NNdq6xg5qECbg8M3x4m+EdaZHJoA5XGCzEyy/LIdU7+gHikbHTMP+KiObjdhRG1Hr7Fn2Me5T
 1ZbljGEOLfmoh+sa8WW9ELexJrMxY9rj05dhfobYltbe5y/op4pLm0XStHP1RbaWqcc98gcfYxD
 QC70+R56PmMRwud3h0cLCjQEFecPGi5CjLOctsBUsyE1MPD8iR+ix5SYWmXdixFTje9PuGn+
X-Authority-Analysis: v=2.4 cv=Vo8jA/2n c=1 sm=1 tr=0 ts=68834ed6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZXpw8kv6nMavt5JzddgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250080

On 7/24/25 10:18 AM, Krzysztof Kozlowski wrote:
> On Wed, Jul 23, 2025 at 10:38:48PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The SM8750 features a "traditional" GPU_CC block, much of which is
>> controlled through the GMU microcontroller. Additionally, there's
>> an separate GX_CC block, where the GX GDSC is moved.
>>
>> Add bindings to accommodate for that.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  5 ++
>>  .../bindings/clock/qcom,sm8750-gxcc.yaml           | 61 ++++++++++++++++++++++
>>  include/dt-bindings/clock/qcom,sm8750-gpucc.h      | 53 +++++++++++++++++++
>>  3 files changed, 119 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
>> index 02968632fb3af34d6b3983a6a24aa742db1d59b1..d1b3557ab344b071d16dba4d5c6a267b7ab70573 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
>> @@ -20,6 +20,7 @@ description: |
>>      include/dt-bindings/clock/qcom,sm8550-gpucc.h
>>      include/dt-bindings/reset/qcom,sm8450-gpucc.h
>>      include/dt-bindings/reset/qcom,sm8650-gpucc.h
>> +    include/dt-bindings/reset/qcom,sm8750-gpucc.h
>>      include/dt-bindings/reset/qcom,x1e80100-gpucc.h
>>  
>>  properties:
>> @@ -31,6 +32,7 @@ properties:
>>        - qcom,sm8475-gpucc
>>        - qcom,sm8550-gpucc
>>        - qcom,sm8650-gpucc
>> +      - qcom,sm8750-gpucc
>>        - qcom,x1e80100-gpucc
>>        - qcom,x1p42100-gpucc
>>  
>> @@ -40,6 +42,9 @@ properties:
>>        - description: GPLL0 main branch source
>>        - description: GPLL0 div branch source
>>  
>> +  power-domains:
>> +    maxItems: 1
> 
> This should be a different binding or you need to restrict other
> variants here.

Actually looks like this is the same case as the recent videocc changes
(15 year old technical debt catching up to us..)

I'll send a mass-fixup for this.

Some platforms require 2 and some require 3 entries here. Do I have to
restrict them very specifically, or can I do:

power-domains:
  description:
    Power domains required for the clock controller to operate
  minItems: 2
  items:
    - description: CX power domain
    - description: MX power domain
    - description: MXC power domain

?

Konrad

