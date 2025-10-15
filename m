Return-Path: <linux-arm-msm+bounces-77282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04813BDC52C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 05:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F252B3BBC81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 03:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DE3278157;
	Wed, 15 Oct 2025 03:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZAg+JuE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF461A9F93
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760498476; cv=none; b=K1cX9sVlF/rfhio2tS60cp5Mx60O4yH3YV+uLzOb2QlkYonmpMRCDZIAsW2BZIqdtMKNZGsuPFXOu7/O6xLkllHLuQ8iiwCHcmn+p4K3ZEqdXr5b9EY3gumSveq5jUj4s0mVCJRrrCg80y3QNBtlOYaO710mNok7tQf1O9bRI0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760498476; c=relaxed/simple;
	bh=M2p1ZN+5Xjl1QG9++mRp4SlbLr6IXjEbwxJhvs6kBUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHupv5Y5mPL8NewbmeOP+IaLcwcc3LJmYmdOPTwge3fEHzUY2pksMshRNkZ6qKkn9p1pTJdOL3SvHeTkkhQeSbMoihS6+EyGcdE69Q32ChhfoPFFLzJE6ukuEPBzlD2sJriQPLw7U4IcWQLUy/Ykg+hBPII0HCfuBx7ENi677WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZAg+JuE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sEPt014785
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PAzWDXrNmyO6DLAmky6NWm+cn7OHuxBHBUdw9FN3WzA=; b=iZAg+JuEcr31i5do
	QZZcybSGCQjR9XdhRu+l/PC8hL53X9fW+O0imR5gPqPSAFyGAs0K7uFdSWNyEkgZ
	VPxgbY9mHacJRPRPkRHpO4Ww4pLsM0AkFWELMoOZBZQzup+1a80kksYnUMomvt8A
	jbyVv3bYwCFtQIr1pn0QhhBct77+I+aGnWAuJcSM4x011kfEUyu7GiU32BWYV+sN
	ChATyZ99FYzKjHEJONVeBoDuhDEoMP5/ovXW5gyeSqB7SgCQbLeF8U0FTC4OF+Ju
	2jMc6YfdUzFo/mToNeL83nevcUCNnUBw3Xb6kxQwZuot3bsre25AkYm8EmB38d+0
	QoiynQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj2whg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:21:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-272ed8c106eso61747805ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 20:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760498472; x=1761103272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAzWDXrNmyO6DLAmky6NWm+cn7OHuxBHBUdw9FN3WzA=;
        b=Gs07gkPSxhlxrsOKF/45yf/C7TAy3vsfCtA4vToo6N8FJqMmTPXBWeCjzJFKXJ7gpU
         OhbZnJC6xA3xxSBOI3AzJK0XI9RI3DPy5w/UuX9wACNbo0VhFfFb/V8RVAiRL3iM4UiK
         KN1vy8V7tY28jjLmyHaVTX4z1y+K0CrQOZSTZ016VMDgjJSNTaMCtWGdfO9iVzHYbnV/
         1YrvybhuQmIfpsPelIjAZWSmfrpFKarZ81tnhrJpKMx9XDTPkQH364iHQ8Bblg4FAFav
         AJRZ8M7CWjK3qeZPqGkwUj44XNhBywZUjEVIV4KqimxJmRSkNrfvJPROTgNPu92EaNWp
         BbSA==
X-Forwarded-Encrypted: i=1; AJvYcCV3d2Wv5ZPFpp2pkggT1H9azYetofWh+FknMo/1+i3VlrkjI16JmQc07CFNzsufY2A9hE9pjolDJ/RvAB6/@vger.kernel.org
X-Gm-Message-State: AOJu0YwsnixuNX4Z2oK/oa0St11ausPPpgomx2z7so4BpA/PDqQdMONU
	2YNNqDdc09dV98GzyrNpxvbltyvXQ/3hqumgxo342SR24XEj7khcxNjbFd1xsB6zalN1B6HK8c6
	yucYqwUB8LzEs/yJ0ovI3YUZwhqI50efJre60O2INT0ZBSxX0B8crJ5bw8wE4IYm9c+t3
X-Gm-Gg: ASbGncuC0LdpLHMfy5L0fkQOIaLRM0sryIs9UnHBLLo9OCdIcu9pYcKjv3vTKKEJQFs
	SFuUDW1IB0Dwa+oosJUcdw9rbiWkMU5gKAxSYsArmVVuGHPHbl90neMKYFx+ANH6FSrANdl9VMl
	e/aG0CunZZZyKrYFeE8BDmGGA79ruKQyEb0RRWBAafMxchIlrg3/8aWiD+zB2WT9ZXCByjeBl+w
	YpTa4Y/RYWzryxZA6nbnRDvwndO5n17KcM59KQWQmqnEFTa8rYaUITUIfCvbomO+Tu4SpbBJDGr
	tminOf/mUMZwGge6nlahVZccgx8lmNj0VRh1SNCaPXmk1PCK0EM6hSQNJ7JXP8oNa+7BKwnyXP1
	a4aCW8TkFKBqWqSF3anlHR27iHLEqviWNaqsibwxgtL0T7AQJtcmCAErJ0IX4GQlwFeRwNQ==
X-Received: by 2002:a17:903:2a87:b0:269:aba0:f0a7 with SMTP id d9443c01a7336-29027212f47mr365377105ad.2.1760498472008;
        Tue, 14 Oct 2025 20:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdNWBjKeLeNUS4h2lLtfgUKsI8vFvc2mvlgVV7+FZSuN0cdYp1EPr8L0atoBEmT9D3LRygxg==
X-Received: by 2002:a17:903:2a87:b0:269:aba0:f0a7 with SMTP id d9443c01a7336-29027212f47mr365376635ad.2.1760498471529;
        Tue, 14 Oct 2025 20:21:11 -0700 (PDT)
Received: from [10.133.33.56] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cbadsm179489675ad.33.2025.10.14.20.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 20:21:11 -0700 (PDT)
Message-ID: <a7be3a42-bd4f-46dc-b6de-2b0c0320cb0d@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 11:21:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: media: camss: Add qcom,kaanapali-camss
 binding
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <20250924-knp-cam-v1-2-b72d6deea054@oss.qualcomm.com>
 <CAFEp6-1o11B9o3HjdJY-xQhDXquOTknXo0JeW=HfpTxXcEaK3g@mail.gmail.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1o11B9o3HjdJY-xQhDXquOTknXo0JeW=HfpTxXcEaK3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX22cBGJc3Nsr5
 2YR8H2kYpUlGx6q2dGWf8SqQif5n4Nqh6Ihq6iFo0Tv0LV5uN4uElXd+kbsZvTSWueG6pPrRhzt
 fgsT71C0uYlIAc97Vrc+gZzGbYYdmr1msg/6KB33/d/Epe/jdq8Cz/6lLF4ZmKhptQd5TEj24BI
 iIznhuFst2KiIjjyYve6swFq5BK38NXtUkwlhpXbFtZLuDwN+EZi1raBMtmDSPcLO0H29VR82a8
 z0OzH5Q6fBBvGbxIvnM+27OtKuvt1YAdKCmTAuqqdSnMIT43rohN3sFvShwOLF1Fp/r+xFZJhn9
 EzUPbFQ+Tt2yZg7P9N7ifGiK4T4kQVA3tAST9e8lMmVpdt2InWDfEgunqucKz6r56u/LPqBU6Fm
 j29lYobF3zGWNy4DMMDnPVY2nVyfpw==
X-Proofpoint-ORIG-GUID: XW8oJk72QSTQqkQgU5EMZQn7sQ2SqG2N
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ef1329 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ww7spySswV7EKFqp46gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: XW8oJk72QSTQqkQgU5EMZQn7sQ2SqG2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On 10/7/2025 4:04 AM, Loic Poulain wrote:

> Hi folks,
>
> On Thu, Sep 25, 2025 at 2:03 AM Jingyi Wang
> <jingyi.wang@oss.qualcomm.com> wrote:
>> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> Add bindings for qcom,kaanapali-camss in order to support the camera
>> subsystem for Kaanapali.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,kaanapali-camss.yaml       | 494 +++++++++++++++++++++
>>   1 file changed, 494 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> new file mode 100644
>> index 000000000000..ed0fe6774700
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> @@ -0,0 +1,494 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> +
>> +description:
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kaanapali-camss
>> +
>> +  reg:
>> +    maxItems: 16
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
> Wouldn't it make sense to simplify this and have different camss nodes
> for the 'main' and 'lite' paths?
>
> [...]
No such plan till now. Other series may take this into consideration.

