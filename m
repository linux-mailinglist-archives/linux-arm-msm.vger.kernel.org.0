Return-Path: <linux-arm-msm+bounces-97541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Gt5B3UrtGkEigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:21:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA2285D4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 319F53113F13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C873A6B95;
	Fri, 13 Mar 2026 15:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GC8FSReq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6QxsaZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B5139656C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415026; cv=none; b=E/mdyoaENVFjYznPoYQh7zu8ACEQSyVxNiJLHmBIV09x+JLM3HkIgevza+jx2EUJn6pOAsnIyq4eedRU0y6LJZgCPrB1yG77ufHjzobKKuAeil4mBBbieDtJtMIf8VQSpBum9scbhN5wt3HmRBnWWY/tz4qijwd5xHbGLt+UbkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415026; c=relaxed/simple;
	bh=DUcBuDzR8Vt3nmScARMkm9CX8EQAoi9nu6O26gVJJkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unNpzZSBrImw3eWTMAgqLXyUw2A7+EpIT1R8Humsx0anqTakdT0KaISlVIyaTn85at3cv6DVP8qYD6KyQ2V+YKwZe3BxiFGb//A1s2zeQUWFQoX3jGR6Wxy0VMuDrcY/veesCS2ShL+q9w2nU9gPgEWFfICIxuYSneaaoxW4v8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GC8FSReq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6QxsaZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9TqHL1499093
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v3eFun+R7DEVcMmqGCgOvog+ta9UM0shehTjUam8d9o=; b=GC8FSReqDP4KXEVA
	kT3T4Jm95n6NHAPATSvGU2N3ykZH2lgZ67lLED6+Kr7x1uLvwNDhy43IfHutxHBj
	TIpAM2/ufzxc6RPbMK0X7NZu4uFz6rtgXSXGHqxm0jEGMMb7BvpZQ09XRUc3K9dF
	PfnRuWu3FGvrt9iD4SCawjNnQvPY7I4dazEhTub17g15pyoWI+wB8toIcxmWdLY6
	s3L0A676DvMNI8gJf85B3wCQiiyxFhNg4uj74+jHe78BJ+mm66qQAE51LW6Hsg4P
	2HorpL4g17CafVhlS5p+CuX6/6X2iID6ZIKN61NKGdGPgLKFrUwav9+HXftEetXZ
	WvqBOQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hh52u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:17:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so1763467a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773415023; x=1774019823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v3eFun+R7DEVcMmqGCgOvog+ta9UM0shehTjUam8d9o=;
        b=c6QxsaZGUVTSQdtY8+O/zqCaD3is7jwCOzy2pYmQS6i3FJoQHBaqRqEUaWx8xdd6iU
         /+WWo5FUr11yykjV4uh6usW8yj0wEMKHVviyDJW9Id+z/A/iem3UNNu2gzUjW4sjt98b
         6t7ZMOglGixoZKvd3hRPHF8CVZvNTMrXmBqNlEH+zaw/77dnELsUwZVIC+M/76DG0ieT
         xMuLjv2qaX5A3Z2Q628aXFMKkPvGsF2HkJKOHhGFmEfLh7PGZGQZisCKkenpARAc1mOM
         +4K6m1IZb/W/7lHaldD3Eh1+y/L+pAoAF3xTto/yYkGpbTgBy7hvR9RJtYu1X8ob2DW6
         MevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415023; x=1774019823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3eFun+R7DEVcMmqGCgOvog+ta9UM0shehTjUam8d9o=;
        b=m0R894TK8j1jnnnmAD/3912FldSuCRxkTtcYu3VNlPbgcBEB0RCiX7iUBB5fh/Itpd
         TcKWnm+31djSidXYIsE6igBC2iNb861r4OIDsn0deTxMIgW1J9oHueuMNsi7BtH4dtgU
         s8ypZD6zV94B/6zFGOTzhRicTw6rYQB/ZfPP1phEGVjNqPBOTD2ff5yo5Y8jC5hBxt2f
         Iz3478V1O/MWDXwCSNfxlIOTKNLgb4un/BPE1X3hl6InEalBLnvCly+QGWS6HQwZsjIW
         ycba9CsEfQxgiQkwV2gSKGBCvRclV2rEz267HUapoeCoK1w6QnQT2CwWEd0CmrbrOkzK
         emUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfvOV7UyZQ9NNMjWNtWD8EJsvXihWxwqAjJrToD8xiQo3u2KTIg6WnU8ZN/3V99/sE6QoDCpYO/TWYybVT@vger.kernel.org
X-Gm-Message-State: AOJu0YyUR0EuxiUl4oLW8dN9fEFsGPe5ZpJxYfdf/wmQFoUO1mV8AgIE
	h6tQjZNqpmoZJVrA0e1OSeqPdK/MlJN0Pb5udrdQ4CBTInO2ZlGhL3BJQYN+EXd+p/zvJQKjK0A
	fYhASO7uK9XiKV8eFx/LMdW0N5ekNoZ3QdhR+NSaxC+pGJBtBR+V0ww73wIAO7a2MmZdX
X-Gm-Gg: ATEYQzzujP6kfv/NZUmYD/JWzvSAX6cU5QAJ+r6RRpGI+heRcpOqelpGDNboHkvYXRB
	Q4nLLFlfTAB1sZmKSfbsTWmamzLJOVv3SWxDYimY6ntzCvqg14KfPDvC6O8PT0X0PfjCMdOio3T
	9XfjhZK40EOtoCZvJojYFgbw8DtI1OQBP2tchAZ8F9unm2TUDBKvkNyEpAtCyYhSgRNokkEcAE8
	AWStzQwKVQK70ZWtNAHAwzkGACqFWHCI9TJaoyMG5hD21pR+kmsUPI8meYyVk8zVVzH5/EI2hm6
	2v82tkmtLx3tRz8GjKiNgDxmPP0k0hlO/zPCLNTdvtggnymrCCxvj/mIeZXmegyvx0qD2QgwBFy
	JnvorupExtSMgc2wd2zjXV5aCdOlER4+VCO+dJc7Iz50XY59Iw2R75Lot
X-Received: by 2002:a05:6a21:4cca:b0:398:71f2:59d5 with SMTP id adf61e73a8af0-398ecce998dmr3321268637.42.1773415022664;
        Fri, 13 Mar 2026 08:17:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cca:b0:398:71f2:59d5 with SMTP id adf61e73a8af0-398ecce998dmr3321202637.42.1773415022008;
        Fri, 13 Mar 2026 08:17:02 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.254.220])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebaa4338sm2047210a12.15.2026.03.13.08.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 08:17:00 -0700 (PDT)
Message-ID: <62027e78-4b7a-4b94-a51a-13a9ae77b722@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 20:46:52 +0530
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
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <hfuqu5uwjuh4ie55zwaqqbsflhf5yn55hnjva356nivoq46m2i@o5pkjnfrwycq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b42a6f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=EbT04XG53EGSLiegdi54Hw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=H73U6gjSJfwdDiR_EpgA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: MQHpikroDsSki7aeEAceTrvH6tqfIs3A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyMSBTYWx0ZWRfX3saM7g6dMaox
 K5nFVEZtr+dkGSGYWcLgHrqmO5JbzjekvYuJNMFZK9CitgjGq3+KaaoN2DP7JZWQHmHlKqyzWTa
 99Si+OMA+9Zh3UTQM0Ifr3tO7tQ5Rfdiuu2zijHRC0fYETh+qUiK9I3mKcngebef/dqZVdaH4Er
 ARn05K7ktpALJZvCyeoBc2jHLzS2hB+lWu0C0ZMtcP7MZlY7k9fw/ZD5Bt+1UQtm/rPvPv0YOPL
 c+Z6i1XNaZIU1V6E1BHrDf67Umva3i1pxupXbzVa90HV+cbBunLusLw2QNj4Uzsg4Z0YiMx75iP
 hhfzT0sBGsQNBwUD+xpDVl0Xz7fbgcnHAHBr0HnIijr2MM0Xj/W9ly/tNB3dqVgO1JMwL9NFPhk
 VajgZHGDBE+uE7T4d/dtFtjejsgixcp2vgSbl7Y/znHIpP+xE/u+DFyOIoBXK8iWO1j7bXzKLID
 j37QXTwjBR/nJGV/DWQ==
X-Proofpoint-GUID: MQHpikroDsSki7aeEAceTrvH6tqfIs3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130121
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97541-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.30.132.128:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85AA2285D4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 8:32 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 06:49:35PM +0530, Vikash Garodia wrote:
>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>> compared to previous generation, iris3x, it has,
>> - separate power domains for stream and pixel processing hardware blocks
>>    (bse and vpp).
>> - additional power domain for apv codec.
>> - power domains for individual pipes (VPPx).
>> - different clocks and reset lines.
>>
>> This patch depends on
>> https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
>>
>> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,kaanapali-iris.yaml        | 254 +++++++++++++++++++++
>>   include/dt-bindings/media/qcom,kaanapali-iris.h    |  18 ++
>>   2 files changed, 272 insertions(+)
> 
>> +
>> +    video-codec@2000000 {
>> +        compatible = "qcom,kaanapali-iris";
>> +        reg = <0x02000000 0xf0000>;
>> +
>> +        clocks = <&gcc_video_axi0_clk>,
>> +                 <&video_cc_mvs0c_clk>,
>> +                 <&video_cc_mvs0_clk>,
>> +                 <&gcc_video_axi1_clk>,
>> +                 <&video_cc_mvs0c_freerun_clk>,
>> +                 <&video_cc_mvs0_freerun_clk>,
>> +                 <&video_cc_mvs0b_clk>,
>> +                 <&video_cc_mvs0_vpp0_clk>,
>> +                 <&video_cc_mvs0_vpp1_clk>,
>> +                 <&video_cc_mvs0a_clk>;
>> +        clock-names = "iface",
>> +                      "core",
>> +                      "vcodec0_core",
>> +                      "iface1",
>> +                      "core_freerun",
>> +                      "vcodec0_core_freerun",
>> +                      "vcodec_bse",
>> +                      "vcodec_vpp0",
>> +                      "vcodec_vpp1",
>> +                      "vcodec_apv";
>> +
>> +        dma-coherent;
>> +
>> +        interconnects = <&gem_noc_master_appss_proc &config_noc_slave_venus_cfg>,
>> +                        <&mmss_noc_master_video_mvp &mc_virt_slave_ebi1>;
>> +        interconnect-names = "cpu-cfg",
>> +                             "video-mem";
>> +
>> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +        iommu-map = <IRIS_BITSTREAM &apps_smmu 0x1944 0x0 0x1>,
>> +                    <IRIS_NON_PIXEL &apps_smmu 0x1940 0x0 0x1>,
>> +                    <IRIS_NON_PIXEL &apps_smmu 0x1a20 0x0 0x1>,
> 
> It think we still haven't settled on letting iommu-map to have several
> entries for a single function.

I have described the hardware aspects in the discussion [1], if there is 
any alternate way to handle this, we can discuss in the same discussion.

[1] 
https://lore.kernel.org/all/21fda4d2-72e1-4e5b-aee0-a799886f53b7@oss.qualcomm.com/

> 
>> +                    <IRIS_PIXEL &apps_smmu 0x1943 0x0 0x1>,
>> +                    <IRIS_SECURE_BITSTREAM &apps_smmu 0x1946 0x0 0x1>,
>> +                    <IRIS_SECURE_NON_PIXEL &apps_smmu 0x1941 0x0 0x1>,
>> +                    <IRIS_SECURE_NON_PIXEL &apps_smmu 0x1a21 0x0 0x1>,
>> +                    <IRIS_SECURE_PIXEL &apps_smmu 0x1945 0x0 0x1>,
>> +                    <IRIS_FIRMWARE &apps_smmu 0x1a22 0x0 0x1>;
>> +
>> +        memory-region = <&video_mem>;
>> +
>> +        operating-points-v2 = <&iris_opp_table>;
>> +
>> +        power-domains = <&video_cc_mvs0c_gdsc>,
>> +                        <&video_cc_mvs0_gdsc>,
>> +                        <&rpmhpd RPMHPD_MXC>,
>> +                        <&rpmhpd RPMHPD_MMCX>,
>> +                        <&video_cc_mvs0_vpp0_gdsc>,
>> +                        <&video_cc_mvs0_vpp1_gdsc>,
>> +                        <&video_cc_mvs0a_gdsc>;
>> +        power-domain-names = "venus",
>> +                             "vcodec0",
>> +                             "mxc",
>> +                             "mmcx",
>> +                             "vpp0",
>> +                             "vpp1",
>> +                             "apv";
>> +
>> +        resets = <&gcc_video_axi0_clk_ares>,
>> +                 <&gcc_video_axi1_clk_ares>,
>> +                 <&video_cc_mvs0c_freerun_clk_ares>,
>> +                 <&video_cc_mvs0_freerun_clk_ares>;
>> +        reset-names = "bus0",
>> +                      "bus1",
>> +                      "core",
>> +                      "vcodec0_core";
>> +
>> +        iris_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-240000000 {
>> +                opp-hz = /bits/ 64 <240000000 240000000 240000000 360000000>;
>> +                required-opps = <&rpmhpd_opp_low_svs_d1>,
>> +                                <&rpmhpd_opp_low_svs_d1>;
> 
> It's a DT and not the schema question, but please cross-check the OPP
> points here. If I understand Taniya correctly, we should be using
> corners from the PLL type rather than from the video_cc clock plan (they
> differ for some reason). Downstream videocc driver also should have
> correct rail corners for the PLLs.
> 
>> +            };
>> +
> 


