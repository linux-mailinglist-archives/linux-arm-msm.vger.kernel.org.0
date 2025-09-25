Return-Path: <linux-arm-msm+bounces-75180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56033BA1310
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EFB917202B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5037431BCB4;
	Thu, 25 Sep 2025 19:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSZjTMmu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D4E286D6D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828700; cv=none; b=LDWXyV81fpnmRCn2LH+Mj8GJsOZwvoARNvHFR2tTxiAW/SN6t/SN57TAWPX0JWtBbWYthDW9YHtcrEg7kof2Iv0bfAZfFtXLuIISA05QHbqPwwizd2X5ByxThAvGnIAeDMXLlQ1B4a8FpeKlyT90TFUy9/quVzD+NM2kO6V1+Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828700; c=relaxed/simple;
	bh=ixD4JAeSZTT+cKIC7yfTKECAN5O4rsWfV2NLw5qppKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGg/kOjus/dSec5kawr3JxgrlZOG+1dN3xt+Ct0HAD7nV3pAS3sHOPQaO+lOThuaC/VGdxhRUp+wcwG48aQW9b1PVnSdVWAUcZQyzXXOW+EuX4HrgKZWlo2RJ1eLx0u2ZqIyTXPD3gKD4rc3vxOZBbRCV9ceevmN6qFzA3OvAPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSZjTMmu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQYbM005417
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xN2zeve8MKIwluD+p5R+V0hgYRPi/KXOcVTKAzLg/4s=; b=iSZjTMmumnhjkPd5
	idAoiZHRPTjI2FP0FOQ52Z+3uS6MgotKPSeJyOGdAP2yM6uNAs2rTOKEi1Bv4v7K
	JCRnkRuegx1kKEul6YCLMgIOyaWcZS12eIAyVpBTnzaQGx/OwuVK72JRvwLXeLME
	k66Nd3Iv+m596//tSsmMEFgSdmnjvpojgoTd3EW+usDAkmk6hsaylR0L8KpoeP8O
	JC91/Hx+ZtVZMjZBxQJOHHV4hi6HrwmgTSD/GoxrQp09WIUqsa3WQWHjLf9d7Fus
	QQ2vYY7bQN9vVb2SHPbkOcSgRsv/yTL+BpO6VOFrOvnnuN1fjhP8Y8hTBJxtB+Z2
	qos38w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u052u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:31:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so1313119a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758828695; x=1759433495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xN2zeve8MKIwluD+p5R+V0hgYRPi/KXOcVTKAzLg/4s=;
        b=eD1bHUtmOt/+1EOAdNiUW6HTUYbz+tG1/5+XF7SDgqG8YFDPtLk8C76omFHkipLP/X
         1yX7ZW1UDqrsgCD9p12q1iFgmsOAkKO68ZflJMl/MGv4aOzl1cahIGbijzBPp1F0FXHX
         ioJjD4sefkL/hdGSFaNFeFGHDdQ6QTDrmz0igbwpSi0i01J/2iq3H/kFJrAmLy8gtcKQ
         FFadxblfesc8qHi8tlYUfkmMy30Mj37jskNmZDA7qA8iHd0cG9orjLP9uTbRYQBUmR1a
         G8ttYoyYjkxbwTEOg0NJP/4ynpjILZhBHmQbcpI9PhhaNj9hrA08Zc7XwvSz1GudKz/S
         3u8A==
X-Forwarded-Encrypted: i=1; AJvYcCUqueCPAg0HMHwickUOy39I9Agner5D6amRa267DV2Srw7OXf4duHAVOoA5Ux/DV3mSB1x1i+NMWjaTUbQo@vger.kernel.org
X-Gm-Message-State: AOJu0YybkzG6FLdHiWDuuph5rCYEN8SU3aBAmTBoblJk/hrkdFZoNbTM
	o3bbRKW3n55wukbMF+kjE4oQwwjf2d64Me88yFW0XXvXbM2ehPzpYRCPQ96x6cNdVQ9gmON8DIV
	TlYugkQ1rrW+C5mHvkCauwLsc6QUtzvrTITX5e4ttUjCVuxdHG+O76QPdDvBdiIIJrU/aU2V/Je
	ZQ
X-Gm-Gg: ASbGncvcUmM5LGLAL1gn3uXmaITvmPZOira5w+GOUhCcDxMMprEIcMu46SUPHBogrnn
	9nW+ZF8DO15I3RoM+WXYApWF9wzcjuEHq/vpZjSBEQ7e3C6oOQ1W3s7XcAgyHsemkVFupzp2lj2
	3ZtLK8sRMyEGVyAzxbe79VHUjGQNN1/n500JyZqAg7qvf3f7zCX/JY0iqntgUYgYw5rP9NRo0fL
	LFXCzF6kk6sZ4YmqGMO7mGVkEMSkhOPL8D5RFa1pMzyhTHmHR1mPmb/xmh5i+O38ikRMlO8NBIN
	zwLrsk0LRRxDA/rYz8/6E96l6On6QbjsP9ClzWY0IY2mo9zzS6vuSGmnhouPsin/DuV5TiCur8w
	=
X-Received: by 2002:a17:90b:5109:b0:32b:baaa:21b0 with SMTP id 98e67ed59e1d1-3342a2498b0mr5055287a91.6.1758828695564;
        Thu, 25 Sep 2025 12:31:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcihAr9QeDqmHNipkjhQZA1yhGxUL+6BzxOO9aN0JoSkA8hWKZHTY3tt89U22izY99lHd9JQ==
X-Received: by 2002:a17:90b:5109:b0:32b:baaa:21b0 with SMTP id 98e67ed59e1d1-3342a2498b0mr5055254a91.6.1758828695141;
        Thu, 25 Sep 2025 12:31:35 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be3a010sm6552860a91.28.2025.09.25.12.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 12:31:34 -0700 (PDT)
Message-ID: <522d7244-0003-a42e-9be0-1d353df8d5bd@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 01:01:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z3-W8ND89AkbXBFrq4YpryQdjM5A0brK
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d59899 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=AkZwv1uTgJSVxlfcUQlFCg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gEfo2CItAAAA:8 a=eVofJsru2PQPkhUZkREA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXy7/ef/C3Yq8n
 wqt4fducGfItyIeCNXvu7O5MvRVFvw2EgStTAZXZDUwaehnW7LBJdFztKyumL50FBqixK3EPzGG
 U7aK5bt4P0Mz/syuPDYZysNrwJ3/WBNJ/7Gr8fyS5gOQJy9J3+mQUrApjWaMrj2h/phnmWiIGQK
 ycaBVzz89bARr2PJSrEMOLDLfjq8YglTkq92tTg23VN63Imstq7YYjq7lrApyPE7xXp/tb5d2yP
 3cPxvoLMB3dll811UW4D8i7WakA1evucymp0lWczqPU76s9qVmEviWPgHvIww04oKxHxrZFxqo4
 jGAWHKpemgk+ev1yvvT/xJRrsMrXb9xQWjHr+7DtNm+cSuttDUkgf6VLaf835zfJZWi+nXVK4ur
 Vs5FcBo8AKzezuhvDL9teBAhdlNAag==
X-Proofpoint-ORIG-GUID: z3-W8ND89AkbXBFrq4YpryQdjM5A0brK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171


On 9/26/2025 12:55 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>> compared to previous generation, iris3x, it has,
>> - separate power domains for stream and pixel processing hardware blocks
>>   (bse and vpp).
>> - additional power domain for apv codec.
>> - power domains for individual pipes (VPPx).
>> - different clocks and reset lines.
>>
>> There are variants of this hardware, where only a single VPP pipe would
>> be functional (VPP0), and APV may not be present. In such case, the
>> hardware can be enabled without those 2 related power doamins, and
>> corresponding clocks. This explains the min entries for power domains
>> and clocks.
>> Iommus include all the different stream-ids which can be possibly
>> generated by vpu4 video hardware in both secure and non secure
>> execution mode.
>>
>> This patch depends on following patches
>> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
>> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
>>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>  .../bindings/media/qcom,kaanapali-iris.yaml        | 236 +++++++++++++++++++++
>>  1 file changed, 236 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f3528d514fe29771227bee5f156962fedb1ea9cd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
>> @@ -0,0 +1,236 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm kaanapali iris video encode and decode accelerators
>> +
>> +maintainers:
>> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> +
>> +description:
>> +  The iris video processing unit is a video encode and decode accelerator
>> +  present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kaanapali-iris
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    minItems: 5
>> +    maxItems: 7
> 
> You are sending bindings for a single device on a single platform. How
> comes that it has min != max?

I was planning to reuse this binding for the variant SOCs of kaanapali/vpu4. If
we do not have min interface, then for those variants, we have to either have
separate bindings or add if/else conditions(?). Introducing min now can make it
easily usable for upcoming vpu4 variants.

> 
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: venus
>> +      - const: vcodec0
>> +      - const: vpp0
>> +      - const: vpp1
>> +      - const: apv
>> +      - const: mxc
>> +      - const: mmcx
>> +
>> +  clocks:
>> +    minItems: 8
>> +    maxItems: 10
> 
> And here.

Same case here.
> 
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: core
>> +      - const: vcodec0_core
>> +      - const: iface1
>> +      - const: core_freerun
>> +      - const: vcodec0_core_freerun
>> +      - const: vcodec_bse
>> +      - const: vcodec_vpp0
>> +      - const: vcodec_vpp1
>> +      - const: vcodec_apv
>> +
> 

