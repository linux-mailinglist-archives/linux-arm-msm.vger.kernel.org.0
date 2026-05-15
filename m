Return-Path: <linux-arm-msm+bounces-107974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLzGDM2bB2r/9wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 00:18:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CECE1558B92
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 00:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A7043007C87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 22:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C073F5BC1;
	Fri, 15 May 2026 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enQl/oxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yv2ieQZb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0C83EDE4E
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 22:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883369; cv=none; b=kZjkVwabQl6Vd1KPZBOV2QM00xbCFPq/ciCmM/fV2K6L3wsvu5vcbYCDhqc0NVexbp1xCWsCOulfeahk2pqRqJJppHLHe4EUwOikwiObzWsw2vSd/X9nNaudVWO0qw8JxFQMVywdJoKnLL9ElfIPK9uChIL8sHiB4W1RWPPqlVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883369; c=relaxed/simple;
	bh=GGi5FP1TfaEYJKQ7ggUUrDXlF/3PIJtQncMwz7QMfto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TitzxkDGjJJWJOmeuYYI6er7w+PC8f0FvFngjNUcWigua4ACJdDXoHm6gJoNkhqmhCj3xIo+0ZHrHmMoV6H0/9w1G4+iUOrT5E5DxFBmvrfvWSNompYNYcOMJ9D6lKK97ykXcL5BkreMsw1wkrTKQrCKFPgsepGli3OMrM5A5OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enQl/oxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yv2ieQZb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FJebJs1733059
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 22:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6gFmG52451iCRGkhhhcMmCq+yZXn0FSxt2aFKyqf4k=; b=enQl/oxkGo4EUY1C
	0nmObNylCTCi+UVv7Git6oE8B7q8Bt1uKHiilYmDewZ8qqnxSX6AK/PKoKpOLIm1
	0aWmlBr6qJ1zvln6zk64GhcuzLUmoTAHHN/xfsc+4BTUxqsBnaGC2gYKHVPlTKyZ
	x5CG8V/PoH6TiqHonXu+3gMcp6HhDy4GETZblyihZn+z5k5pfcuot0+O9mFVesey
	q4kxw/021aWB2iYk0ygL7qx0AWtv/qXYJbNO6tbzOooKCEfxaQUXryof/9EYjPgV
	yNF7vOe0ErUh4Sdj4zyegucA3XumsC0oM6di4BXlncDVa4h9UK5uPFTNIulzHPOB
	kKZNCQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e67ac8xmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 22:16:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36629e48023so180604a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 15:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778883366; x=1779488166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6gFmG52451iCRGkhhhcMmCq+yZXn0FSxt2aFKyqf4k=;
        b=Yv2ieQZbzqSZOCu/kZu8O3+8BxHj0cp5tYLmGOD7Z8s3HpWfUVfo3AhqH6IE1c7ElN
         4X9SGpyRwUPfzGQcudOU/2qOoF6LjTzGxJ5Uv1P9+Qq2uSEK3zV4EvHbUMj0Jy/YxSFO
         /0N3Co/xU3NoFeSOzx0SNV2LDF3bYQO9i9JaWtF599TLM/k8bkJkAr12eh5LGc9nGBPR
         Ynvi1CwkkF3jph+ufl+/CixG+o/TQZUmGKQPLAwYSvJ/8kh83ZVJmxalZt4ZjliYfMV2
         zI3tWFoGDo1KujZRAuF4BNF8dbtuY7vKHSVeE9GPpmMbRjy8Em4PrYJmDcdf7Jre2H9T
         Ek6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883366; x=1779488166;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6gFmG52451iCRGkhhhcMmCq+yZXn0FSxt2aFKyqf4k=;
        b=CUoGG87kzDzjR9g84e32g4wpUXJwMZh2ZOoqZRVZR0vKXXs7pLkmo+BWkhO7RNeT39
         1DHzB3JSB6E7nBpPYBu1c97yHuLeYO/6mczkIalMM8M6zM1giCF0b0E0VGyVc+UuYAoV
         nEW0BEDi72ArE4OdJUpQ6XletVSy1C0nMJ4GHivMrYWql70ySOQcXyKR0HREJpGCZNyw
         I3hQfz05uBBOUzj5BzKtjSx4L2p3pk1ilJap0+W3YUIiErSOMQPecLVVWM4nTNKagLL5
         nhICMtS5A7nRh2j953pRPwpgcmYsI0z3Mrh+tK35mOtFxmAXmn8J2l+xOPl1wNSe3xNj
         Euzw==
X-Forwarded-Encrypted: i=1; AFNElJ8YSHamL17Yt+oirsWtBWBVMIRuUvlcRPPZd5hHtb6lEqgIHNlVLjqgYyAMK0ZaAu0xdUdrW+/MPhZHK4nx@vger.kernel.org
X-Gm-Message-State: AOJu0YyfZ9mrzO5rn85JB9BLtiluk2ilh2BQ2rHdi7TYAXBd5yMwgCTi
	Hdzz7oMxOMxUpCpWAiQBBErmyJsf4tcMPiXgla2zlRiauQoMipHxXIjPZFI4JxokyrtnaO9E9Vd
	movbZZFfctiKY8rdLP/oB+DMMFPmEO26NhDD3L7nHpA6PRDQGTS0lQIemYO8azKsZZSPR
X-Gm-Gg: Acq92OGCbkb/gIuDCgsrB46Jl5d2tyfNxUGHVH7D5E8CZDKKFi7WtyCljWZ7vgbHCQo
	IGcTK2nsyd87GWeIyYlL3PJ67MupWWZVUCKKCKPH5sMXc0qTn6TVEjz++lnSwFy+gHs3ZySVdd2
	WjSWXv4pHUQaehUTF7wnhDDxN2zCceO3OzeTKvar1rkmCdd2lpjp8Q9t9RatlgtMQMtu2PO+wX/
	FP7++uk88C6CHZDW1/zx0Xar6TMn8J/YlvI23LIXc6FR7R+gF473yo6/y02Yk0exU/V2nccPRNY
	WfUQirmW90ZHMCb57g7B57LEolPb6xAC0+tp63D9Y4mQ/Ip6AnCQzjW2MvfSouhgcAOryMGe2cy
	f0NvYlLdvNv46d+6z1E5rLxddS7UVpcIMFG09a341JRmCApbgnL0uiA==
X-Received: by 2002:a17:90b:134e:b0:368:5367:d681 with SMTP id 98e67ed59e1d1-369519c348cmr5767565a91.10.1778883366305;
        Fri, 15 May 2026 15:16:06 -0700 (PDT)
X-Received: by 2002:a17:90b:134e:b0:368:5367:d681 with SMTP id 98e67ed59e1d1-369519c348cmr5767533a91.10.1778883365800;
        Fri, 15 May 2026 15:16:05 -0700 (PDT)
Received: from [192.168.1.3] ([182.60.13.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb11683fsm6304190a12.26.2026.05.15.15.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 15:16:05 -0700 (PDT)
Message-ID: <f946b661-ee69-4502-9745-247940c54653@oss.qualcomm.com>
Date: Sat, 16 May 2026 03:45:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
 <20260513-glymur-gpu-dt-v4-2-f83832c3bc9a@oss.qualcomm.com>
 <20260514-pearl-mamba-of-inquire-e4888f@quoll>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260514-pearl-mamba-of-inquire-e4888f@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iWhXaKtZVTqNoSoQpkw_xj6y-EAt-1kt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIyMyBTYWx0ZWRfXwhtrxMFGGPCd
 1YHKrRAcU9M/AltvhGycC3YfHICxX1SNHq8L1tnkElZ48pAS0pQ1uYT34RomNLNT+SySt1VP35a
 SykpkyEsbS2yAcRL2/NBEUYBFGAB9QJhUeF31meFbNvJJ0ho0e9i9xeVGQqPj7wKi/dWlp8ydSz
 OeucizpnUdPDmsGexCfGo1Ptdo5xrfTzFNVdfjgJ4gHT9+UnBECsY7UtjqisFwR8T0Mo2cTxieo
 fb6wqoAgx+Q+clEdeO9hcAkqCMM6BZLxOwipYtdXey44oF1VWuJNbqBiv6R05ZXI7V3E4m/ljmZ
 2bAQpgB7xUHXibjDhUHeC5Bv6IYSLusN8lqPJVVJXaHxTwOIh5o/FvB9GCKPdhVB92ihTRTDhp2
 6Pz4z5zekE5VKeT6vVahD0RZFqLFGcvPARHsPwfFuAbp0b6h1yHVK15hM8eXcQkiTqeGzLEZfqS
 SlAlfqvrB0CW4y5Kfgw==
X-Authority-Analysis: v=2.4 cv=SuWgLvO0 c=1 sm=1 tr=0 ts=6a079b26 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ba8plz+5YpscmDk5DVa2Cg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CuuWk3emYSqqoFdssNoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: iWhXaKtZVTqNoSoQpkw_xj6y-EAt-1kt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150223
X-Rspamd-Queue-Id: CECE1558B92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107974-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/2026 3:43 PM, Krzysztof Kozlowski wrote:
> On Wed, May 13, 2026 at 12:51:19AM +0530, Akhil P Oommen wrote:
>> Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
>> It features a new slice architecture with 4 slices, significantly higher
>> bandwidth throughput compared to mobile counterparts, raytracing support,
>> and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
>> other improvements. Update the dt bindings documentation to describe this
>> GPU.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
> 
> Someone needs to start applying Adreno GPU patches...
> https://lore.kernel.org/all/20260301142033.88851-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> 
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> index 04b2328903ca..e67cd708dda2 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> @@ -411,6 +411,22 @@ allOf:
>>          - clocks
>>          - clock-names
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-44070001
>> +    then:
>> +      properties:
>> +        reg:
>> +          minItems: 2
>> +          maxItems: 2
>> +
>> +        reg-names:
>> +          items:
>> +            - const: kgsl_3d0_reg_memory
>> +            - const: cx_mem
> 
> Are you sure there is no cx_dbgc? If not, then just minItems+maxItems
> like for 'reg:'.

I merged cx_dbgc region into the kgsl_3d0_reg_memory region for A8xx
series. It was getting in the way of covering the entire GPU MMIO in DT
without overlaps.

We don't prefer overlapping regions even if it is within a single
device, right?

-Akhil.

> 
> Best regards,
> Krzysztof
> 


