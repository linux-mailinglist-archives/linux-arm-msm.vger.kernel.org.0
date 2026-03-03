Return-Path: <linux-arm-msm+bounces-95188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EYiAxgmp2k3fAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 19:19:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7EA1F529A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 19:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E61D308FC5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 18:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D72D3E51C4;
	Tue,  3 Mar 2026 18:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owZThwJh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E0fQo2i9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598DF3CB2FA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 18:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772561635; cv=none; b=ciXAaWp9HDQf+GOFR/dM/tJisYPVo1i4TgYt/M7JUjDE65EU5HERW9HXPtWdCGhvWBFPQH4paYWTZpRHkoVSoTECQyStQBMEnlfjupTw2uXn7dknzFBsLYcL/sf64Yj6BhZ296g0CRnUQTAOzUoyTSjTl7Wbt7s/PA8UfXbQ1BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772561635; c=relaxed/simple;
	bh=RcXwqXfS7Q5UFVrsfUc/MKGMCy848BRRPAW+m1ka48E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHe860OZOqcPHwzlei3/MHc2pTCj35yOS9hCpPyVI59yXuZJfqmW6VRkF7oZsy8kEXGUn6HS+ygiTcCN6CJvogZtSBk464TWxSNTYqGqtaymD/ehXFAccXoN00RdQQ1qu7dVCc6krL9ddFaYQDIjaddF6KV22bSSxKeRK/vQRZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owZThwJh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E0fQo2i9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0MkJ3238365
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 18:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3Uqm7HnmfbRYpPRyjqAGfV/78GMbwg16ye8LCZyPMk=; b=owZThwJh90AMnzRV
	paDO7cq59E1QOE3ULFAyQheUv2KstgXkYWoyfoFOaENT6WsPcGmwVGp1I1S8jWeK
	hkPkWWycWG1XDk8vQtLqDG+JrpBhi9k2oaN03YTIvNwbsdUnal8jrVTIuO0sPdCI
	PRz7TiFTFluTlq2oJXHa0R0LR8JiG5kRvO6/tScNlnJi81ae+yNmc8k7I7ZNscXi
	2QL6F1rG/oN+KTDgjWMtz3YKNdkXYkjhWesZEQUoXJy0Ar/HPXWepg78FMEcC2JT
	xnVWkgGiHB/mygYn9Bm/cFWupgTiCJDqJOksBBmOCUyFbajJh7dkXEGsinjRy46p
	t+W3fQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu9q63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 18:13:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35641c14663so6110651a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772561630; x=1773166430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u3Uqm7HnmfbRYpPRyjqAGfV/78GMbwg16ye8LCZyPMk=;
        b=E0fQo2i9GkpyHtS4xGyKGs1gaKlqDLewQvs+9RnrviGB+tY1l3fWl3eFPzXiy9iCgK
         BlhpSvVn57AbbkLPgteCUKNFhVtzK9AYE3OxIXZ5wS6KQnrNX5uxvTUUmsS7akbo+Ild
         cDDPflj4M+8lOVE7a1XJXTrv5PcOgfLijkNlGrglGtJF8y9iiXIbFaxbdOanNpYeaEp9
         +vD+otUSSm+bplsh0hz0Wx/sE0lXD7r+1HcFQJD1QztRdw2Ljg842aK6SVDX+O7L04we
         NysbjNvsBdRANEX6ifeGs2Dvm8PPnZWqf6thsjxi5eM3iMeMN0tnaOZMaa744fzwy8B/
         U6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772561630; x=1773166430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3Uqm7HnmfbRYpPRyjqAGfV/78GMbwg16ye8LCZyPMk=;
        b=S8kwTMavOX10M0llT0Cit0QDT0oC/eqlteW01DLgP1Ev4+CwbR7yDpTJfKTvY7GBFN
         ePBsov/38fNaAmW7xYtxKhJTu/YcCeZ/efWVbqPDQSB5co1t4mwW2EP2UF8ItprueFTI
         LSBhH8gUm54Ww+dpvzkneXklzfOuqLDxTLyze+EIFbglJKnn763aHgOOWDb+aG0tPeBg
         41WqLdXV37lj0T99+GvYIeoDKGVpuJNnMluSHFj/kH6FtHhVQ8non+ZBPuBaZxk6TJgT
         Yh12dAb1ekgdvqzhcMVX4zSAnD1HyKHgqRafZ+8GQm6PA/lwsTEMqQMufFMC7k8V+SFA
         yCNA==
X-Forwarded-Encrypted: i=1; AJvYcCUen1zgxK15uw0/PwmnlehXusY3vmDffWC+pcuR7CfOoNOWbGqXlyGKcfMoGwDGjBLjEV2PAwMQml6vwywg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/p1crhJFgz+th+afOi+/MOQiLvySOmQC45UxNc3UarV9DMEAq
	xZicPFLD6OMwrim0YQTZl/XGOfRCM4emE9NO6GcaZiYtUdYzqbGiyDWWXv4kOSJ61BiUzNLpUlK
	wxzBJwI1oR3YDB6T8li0Bckz9bLQOLnWvVq3WtRl9aYdVQYLlBSwsFOf1HemtZEYnZD3f
X-Gm-Gg: ATEYQzyAzzppe/HP3XR1hC7J27NLcdCHRenawGzLkvEDkyJHas9400virfcXAFZpeu9
	HwAgyLPhtlmHxjvt5SUXB9hz79tf7jXbIBhZwNu/MdMBZ11OjztdSHKmOjUTMxioD5W7sTeyCpR
	j/EvtGcUmkksKy7BXlbh3tQ6Qdy/sKaEpbHI1pPsxVU262yTRvC+phwWd497ReMoz5zKt98ZtvP
	J8L8jpmQ7qKuMUo3Gp0DRZNBnCMmFWTU5X81MWD4hlPSXxczXlnv5kfZ9LDVpuUvfT5h7pnYl5b
	LIsHJpw+8C3UbmeHt5CfgXtvj7Eh1/Nu7F1w9zTCSMOOLr676CLKJhS0RELBYhPWOc21T8Ek37E
	V12H/HRvC2tL46aUalUtVVtIwfNtfeupcDUkpKUiXTWMPu4ohRcowYF4=
X-Received: by 2002:a17:90b:1f8c:b0:359:7c55:c160 with SMTP id 98e67ed59e1d1-3597c55c28emr10322569a91.13.1772561630186;
        Tue, 03 Mar 2026 10:13:50 -0800 (PST)
X-Received: by 2002:a17:90b:1f8c:b0:359:7c55:c160 with SMTP id 98e67ed59e1d1-3597c55c28emr10322519a91.13.1772561629667;
        Tue, 03 Mar 2026 10:13:49 -0800 (PST)
Received: from [192.168.0.172] ([49.205.248.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599ca38be9sm2030588a91.4.2026.03.03.10.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 10:13:49 -0800 (PST)
Message-ID: <635cc998-d530-42eb-95cf-99b0d5baab68@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 23:43:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
 <nen35eqhwbikt7jlpxn22hvur33chxibrbmzd6awo425i3mujf@f2cbncxpcatc>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <nen35eqhwbikt7jlpxn22hvur33chxibrbmzd6awo425i3mujf@f2cbncxpcatc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P3WWFKcplDxXuIckw4eSKsPv9k1xJfKR
X-Proofpoint-ORIG-GUID: P3WWFKcplDxXuIckw4eSKsPv9k1xJfKR
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a724df cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=KPiuay1jFzAquJblYynD6w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=yfRxjFk6VvuiwaCZe6sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE0NiBTYWx0ZWRfX7pR+mzMLArnn
 +hUmlyWHj/yYgHcpn9HrRnAV6aVHbPiJSKAdkgv/BiwCk1FoSPhxSldrs4c3nJlcWyTvrYSzY2J
 fa/GrMzduBuuOdgtbrkCHEdWtD93nFBx+xkuQ8GFIkOd8geNli6xu8BkBepVQIbsHo1fgc9zmV4
 eJx7Ro0r0L9YzxjD4g1VzTEOUTrmvNvuIapsL8VycKSeF2cxmghsjeoNRHJQCDW3k6fUa9eDXDe
 LG7Lzy6gdYygxWfWXW5R/n2y41VwnqOxKEuI08SSoYthy0+hkhEcxkKNjVDXA8GT/9rKMb4XpwY
 8Pc05y/JG6wzqtyWZOE2B1lcrK4+NBJIxe3llHY6Nm0o09rCKAALva3Qw0eDU8FGzVLogs4szfj
 0BaN0JEfZfFXNzR8n6GY6Jqlxn7IF30ZsR96gERkXA7Tygf8ozsfB0d6yJtBUlKs5EiNLdSmDcR
 QFrEAqqFP5x7A90B26g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030146
X-Rspamd-Queue-Id: 8F7EA1F529A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95188-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/28/2026 1:22 AM, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 07:41:17PM +0530, Vikash Garodia wrote:
>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>> compared to previous generation, iris3x, it has,
>> - separate power domains for stream and pixel processing hardware blocks
>>    (bse and vpp).
>> - additional power domain for apv codec.
>> - power domains for individual pipes (VPPx).
>> - different clocks and reset lines.
>>
>> iommu-map include all the different stream-ids which can be possibly
>> generated by vpu4 hardware as below,
>> bitstream stream from vcodec
>> non-pixel stream from vcodec
>> non-pixel stream from tensilica
>> pixel stream from vcodec
>> secure bitstream stream from vcodec
>> secure non-pixel stream from vcodec
>> secure non-pixel stream from tensilica
>> secure pixel stream from vcodec
>> firmware stream from tensilica (might be handled by the TZ / hyp)
>>
>> This patch is depend on the below dt-schema patch.
>> Link: https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,kaanapali-iris.yaml        | 261 +++++++++++++++++++++
>>   include/dt-bindings/media/qcom,iris.h              |  18 ++
>>   2 files changed, 279 insertions(+)
>>
>> +
>> +  iommu-map:
>> +    description: |
>> +        - bitstream stream from vcodec
>> +        - non-pixel stream from vcodec
>> +        - non-pixel stream from tensilica
>> +        - pixel stream from vcodec
>> +        - secure bitstream stream from vcodec
>> +        - secure non-pixel stream from vcodec
>> +        - secure non-pixel stream from tensilica
>> +        - secure pixel stream from vcodec
>> +        # firmware might be handled by the TZ / hyp
>> +        - firmware stream from tensilica
> 
> Why are you providing description as a list rather than describing each
> item separately? Then you wouldn't need maxItems.
> 

rewrote them as below and dropped maxItems. Please review.

iommu-map:
     $ref: /schemas/types.yaml#/definitions/uint32-matrix
     items:
       - description: bitstream stream from vcodec
         items:
           - description: Function ID
           - description: Phandle to IOMMU
           - description: IOMMU stream ID base
           - description: IOMMU stream ID mask
           - description: Number of stream IDs
       - description: non-pixel stream from vcodec
       - description: non-pixel stream from tensilica
       - description: pixel stream from vcodec
       - description: secure bitstream stream from vcodec
       - description: secure non-pixel stream from vcodec
       - description: secure non-pixel stream from tensilica
       - description: secure pixel stream from vcodec
       # firmware might be handled by the TZ / hyp
       - description: firmware stream from tensilica
     minItems: 8

>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +    items:
>> +      $ref: '#/definitions/iommu-types'
>> +      minItems: 5
>> +    minItems: 8
>> +    maxItems: 9
>> +
> 

Regards,
Vikash

