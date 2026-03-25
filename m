Return-Path: <linux-arm-msm+bounces-99886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJRjM2QAxGlXvQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:33:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C02328172
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EAEF3309AD5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 15:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E023FA5D9;
	Wed, 25 Mar 2026 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXdOQg4y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xg5v990a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED8A3EC2EF
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451436; cv=none; b=pibMP8KEnbs0Zy9pWMtBz2fgSOW2zoudl7Q4hHveaBZGodlVWcW78adHk7YDIt+mA+bvk3fYY4DdoVomp7tt+bpUgmqPUV0K/rScEP7Jfdh5icOJGj9QEkePf1XIRY1ROiTa83y1ZsqONknw9gvpwueCtK+GO7l5c/sBdUeExUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451436; c=relaxed/simple;
	bh=ZxQippknm3j62I6Jp9U2pT0kpqpuo+x9nwZCCQAspsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6urecU730FVh9ZJVNp/obu4zIE3zAKhHu9Qg8JGIEFk0ckb9FvrmYi7/8EMzStw2J91APhhIx93RDLTYDoa+wcG0BFguOXuGlj8+5Z88e5/h4mKJOaGbSs3vw6Qg+A39ViD7JkksZ/EXvmCpzw0bvHupfrLlQyViUjh4GKI39M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXdOQg4y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xg5v990a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGVKb1895857
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xtE4+84n9r+ybTVsuVpzR5BgwB77paJIB/iP6lAPjeA=; b=jXdOQg4yOpBTwPC4
	bXol2Jm/1QTPgXiiIsuUowmRLL1+x/GVw8R+9S75/ormqR+rAm34O6a7PM67RlVb
	34m5/h1eWxQ+vhBfT4JZl6/57TdsZmRaERsFvhA8Z4uEC1dLEr4Ms2k8mK88tPsY
	fCw/PYGd6r0Q+r0iTQunb+VPk3QbAGpGAT0KTYWPMkDOgTaIQm9ykXEviTbkY/ng
	jZMymY3BKvhDiixMwxeGB9Hl7r9UbK5KVX4i63Cm+EZ2PbeTt3jBdL+yfhXyJ3iw
	C7ACxl04G5w4zlLLXKGPZBZbyrtDID0bpv8xky9FNAofV42/NAF1BjNDXxo8s3H4
	jlTgPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mjc42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:10:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b069bfa817so30162595ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774451432; x=1775056232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xtE4+84n9r+ybTVsuVpzR5BgwB77paJIB/iP6lAPjeA=;
        b=Xg5v990aTwKqZ3X3HwQ+6bGCzDNVzdY7E67aXqCDnogNKlokIEJJIrqDo5+pcZlnP4
         0rTkoPpquvvYw04X6As/s1/hQRxlBdn1anSfm95Yiln0GcoYQY6mCaUBL1TLlDyt2IF/
         glDMVUMLiptZ5HMpLpxxb323Hxs6CGPoDS4yDBYCyI18KLI5qyCV7vRBUD7PIJ3Rf0B+
         /jectyiSa6BN2+ZfyiqHQWau476Ghf9CFTi8xetFxGXQ+AD8qA0324gDcAfM/sXJqWz8
         GNsRJ5WgTaWb1GNBYaywgBi0fe5NVgro32cuWhe8lfyT75X7fz8nxn2FYZugbKYYzVHO
         HLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451432; x=1775056232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtE4+84n9r+ybTVsuVpzR5BgwB77paJIB/iP6lAPjeA=;
        b=WRyPx1Iwfo4A6JE/0qCJU7kKfCd97TAr44kAiEdT6GViThYqbbb7nHfk4w3hBIqUEw
         oVrNVGoELNxL8omJ+PpL0WB4TbzfrBsYcxa6WavSU17p71SNl/XfUFSmPPvN4h4pbzd2
         z/RXR2SrYvmjcD+fPOzDAQx6aiFBjMbgXmHkrpjBKm2g8XqQ/RThzK8BMdp5iQbCBkhw
         isicQ6qSvWx+qgZy7yXVU+jEynZzNDzlmIaaFKm7sMfVcEAQCSybOLvc2WsGVSWo9zZ8
         t39vJ0xQVs/9NhULqWwYi3ZUsitycp9+FDl0WZ75yRWhmbp1wNR6/PxZxsZ4tfvbTn+o
         kseA==
X-Forwarded-Encrypted: i=1; AJvYcCX28DwafCuAfuRO8RKzr4tPx3A2CZze+zouk++XV0t0am/vbqwNnOu9S0/lmoBhk547S1fgtnPx9fxBj1eX@vger.kernel.org
X-Gm-Message-State: AOJu0YzdSJ1d6tdfwIVySfpiD8AbXI9AX9FKee6Mlt+jloak7680vx0U
	k2sk30E/PAOVvcLGGImJweTJ8rTtQB9LfY42RiOpkKgRUMjGph1l/PYROF/R2vUp2NT5e9NOCzR
	Rrj4pNlMjrFdHn7N8Pkzj/HepJSg9gS9IoPzocQaFBW0KaZzSm6dZ+p3oIKfUy0uWc21o
X-Gm-Gg: ATEYQzyMxcyGEIXrLvcDlJd7RKS/nM3s9MSX/Ts+B9J2ceIMcE3/u5nzpQFi2aqyB56
	yXAnPTjOp9Z8MZEiwHDbme74cQ/zznCVFvwcDaDoYYgokQfWaJds58DAd8A8zqDw0754skNGooD
	P44EN5z1wKvlwA1hVtbMPz/RlNmoO9lpbize1/pDzvMSkBisdaJOjM6hy4hIuSAybhURWkIAx05
	Tcg/RTjQP1tKW1DLPSlmWjO0ldxztEyGyQyJYNyql3DQ8SgakTn7YXRAWPLVvKg/U8SPFkC+pZ3
	+mnvRp0GWLmN3wMoPluPiY15tbcrbn61gC6jSSf1ORllRQZ7n75sir9Ou3WQkii8/OAMJ7jw3wJ
	3AngjUnjaNLUbdPRoBt2ITI045ljKpXgtzDu/w9eeSmcTGKgLbpV/nQ==
X-Received: by 2002:a17:903:2a8d:b0:2b0:6e8f:8e73 with SMTP id d9443c01a7336-2b0b0b2d665mr46305045ad.44.1774451432467;
        Wed, 25 Mar 2026 08:10:32 -0700 (PDT)
X-Received: by 2002:a17:903:2a8d:b0:2b0:6e8f:8e73 with SMTP id d9443c01a7336-2b0b0b2d665mr46304635ad.44.1774451431825;
        Wed, 25 Mar 2026 08:10:31 -0700 (PDT)
Received: from [10.204.101.77] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7a9deesm1665755ad.28.2026.03.25.08.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:10:31 -0700 (PDT)
Message-ID: <bdae0b95-ee88-4398-8690-031803a85a92@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 20:40:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
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
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
 <hfuqu5uwjuh4ie55zwaqqbsflhf5yn55hnjva356nivoq46m2i@o5pkjnfrwycq>
 <62027e78-4b7a-4b94-a51a-13a9ae77b722@oss.qualcomm.com>
 <5otifv465c7duslmogb5uzaxrh2k3u2ayiylcd6dnz3kc7win5@kltv3fxhtso4>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <5otifv465c7duslmogb5uzaxrh2k3u2ayiylcd6dnz3kc7win5@kltv3fxhtso4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEwOSBTYWx0ZWRfX4kGDWQO0bQds
 YojHt5gV6kGVn11SbcwzOeRFGKjNSyWyY5TX/P8p1cAMT1/2sZ0/+gXlsw5JPqNK4rrhOxc3nf0
 3KM00dIjL4YYc8q/Rpw8v+0fJEE6DVl4v45P3im/HLCN5QJpFQTEc7y1z9LgRjrdhrnwrdupiIq
 AtFhaz6J471tLUQCbqTL8WFdWtvY7DbPhSTYTT9WK4Gsw//D9Nq/ggA+aErX3tscTFh5EvfazM5
 Y+H0ElV/MBqERrhGWM+Hmev76itPcp07d8Y5B0B3w6TvYAyMNSVX4GhVOUoblyA5Wzf1bwKdAqJ
 5q60HrqSurSBt0rGMREjyepDrTpempAUu5A06EN3OzYF2vDltJWc6voV28BrMDjPD6kpo6u9lGX
 atjOnvz+Lf5qlTUkpDtjMvYLvjQLXUbsIYKLK6iQ8Wjms83GgHM/naBG5dSNu1IsGx6x7kUJH6V
 jCdJMIQxMu2fSp/BepA==
X-Proofpoint-GUID: tU9Rb0MH-LorTsfhPqruzycrzSgd27qX
X-Proofpoint-ORIG-GUID: tU9Rb0MH-LorTsfhPqruzycrzSgd27qX
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3fae9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=puI59K64icZz00i_70MA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250109
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99886-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,0.30.132.128:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6C02328172
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 9:10 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 08:46:52PM +0530, Vikash Garodia wrote:
>>
>> On 3/13/2026 8:32 PM, Dmitry Baryshkov wrote:
>>> On Fri, Mar 13, 2026 at 06:49:35PM +0530, Vikash Garodia wrote:
>>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>>>> compared to previous generation, iris3x, it has,
>>>> - separate power domains for stream and pixel processing hardware blocks
>>>>     (bse and vpp).
>>>> - additional power domain for apv codec.
>>>> - power domains for individual pipes (VPPx).
>>>> - different clocks and reset lines.
>>>>
>>>> This patch depends on
>>>> https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
>>>>
>>>> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,kaanapali-iris.yaml        | 254 +++++++++++++++++++++
>>>>    include/dt-bindings/media/qcom,kaanapali-iris.h    |  18 ++
>>>>    2 files changed, 272 insertions(+)
>>>
>>>> +
>>>> +    video-codec@2000000 {
>>>> +        compatible = "qcom,kaanapali-iris";
>>>> +        reg = <0x02000000 0xf0000>;
>>>> +
>>>> +        clocks = <&gcc_video_axi0_clk>,
>>>> +                 <&video_cc_mvs0c_clk>,
>>>> +                 <&video_cc_mvs0_clk>,
>>>> +                 <&gcc_video_axi1_clk>,
>>>> +                 <&video_cc_mvs0c_freerun_clk>,
>>>> +                 <&video_cc_mvs0_freerun_clk>,
>>>> +                 <&video_cc_mvs0b_clk>,
>>>> +                 <&video_cc_mvs0_vpp0_clk>,
>>>> +                 <&video_cc_mvs0_vpp1_clk>,
>>>> +                 <&video_cc_mvs0a_clk>;
>>>> +        clock-names = "iface",
>>>> +                      "core",
>>>> +                      "vcodec0_core",
>>>> +                      "iface1",
>>>> +                      "core_freerun",
>>>> +                      "vcodec0_core_freerun",
>>>> +                      "vcodec_bse",
>>>> +                      "vcodec_vpp0",
>>>> +                      "vcodec_vpp1",
>>>> +                      "vcodec_apv";
>>>> +
>>>> +        dma-coherent;
>>>> +
>>>> +        interconnects = <&gem_noc_master_appss_proc &config_noc_slave_venus_cfg>,
>>>> +                        <&mmss_noc_master_video_mvp &mc_virt_slave_ebi1>;
>>>> +        interconnect-names = "cpu-cfg",
>>>> +                             "video-mem";
>>>> +
>>>> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>>> +
>>>> +        iommu-map = <IRIS_BITSTREAM &apps_smmu 0x1944 0x0 0x1>,
>>>> +                    <IRIS_NON_PIXEL &apps_smmu 0x1940 0x0 0x1>,
>>>> +                    <IRIS_NON_PIXEL &apps_smmu 0x1a20 0x0 0x1>,
>>>
>>> It think we still haven't settled on letting iommu-map to have several
>>> entries for a single function.
>>
>> I have described the hardware aspects in the discussion [1], if there is any
>> alternate way to handle this, we can discuss in the same discussion.
> 
> Yes. But how do you plan to merge this? You've split away the patches,
> they don't seem to be listed as dependencies, etc.
> 

1:1 mapping of function ID with stream ID is closing on the reviews. I 
will have to update this patch to represent it in 1:1 mapping.

Once done, this patch can be merged with the dependency marked in this 
patch i.e 
https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15

>>
>> [1] https://lore.kernel.org/all/21fda4d2-72e1-4e5b-aee0-a799886f53b7@oss.qualcomm.com/
> 

Regards,
Vikash

