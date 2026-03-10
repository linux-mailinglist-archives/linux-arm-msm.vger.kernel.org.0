Return-Path: <linux-arm-msm+bounces-96637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iExQOiIgsGm3gAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:44:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9F250ACC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EBE3340346B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EA83D092F;
	Tue, 10 Mar 2026 12:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VN/a2bJ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGB5tstc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7D53D0921
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145886; cv=none; b=cjXbuMnm7/BwVB582u/r0pzPtHHSGMosxs1DeeQWiZ9tocQuzgUPcrHb3MZO8ulCKqqeJQFqjQnlDJKNEECYgEG/eIczi9SUcp6CR/euVarqzJLLm/Gn0Ixk/7hRo69TQd+2dhjFBSifEESu8mLH1Wt/dMDVN2HmxmYlhef41v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145886; c=relaxed/simple;
	bh=O0qrn9d7S7AyHe7vYAv9x2SN2/8h4evFQLk0vYAxM3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WOR0e8xcHPwXN1ZmpppgXHyoO14Qa+mQGh0eyc8EHnPqdkfy+PhSfvmbh47hqx/2JoCLUar83/l20c83pv1QtA+EvGWCXmiqdDkg7rU8j12dBMqYRb/oVvbwOtnMSsz8g+dYqR594c1NxDdce8+KS+vWncZAwprhCB+2GBxkGhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VN/a2bJ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGB5tstc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A95Mil246496
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0qrn9d7S7AyHe7vYAv9x2SN2/8h4evFQLk0vYAxM3o=; b=VN/a2bJ6DYYQcqX3
	59lsCwHRPJvJduE9vg2qITYSlGUyJrTYg5SSIaoNYGxriVz3VAYjjHhaKmNeq1UF
	kdkbg4mFOHIAFbpEndafQx95gBRGwKOfBBFyptEj1ZH8P25rUg2XvdmYThLJ9pzA
	5C8znk3FOIt4qSDjEMQBrA7pXzVDPyeye9QNsr5AXKAFN8aYyFR9JykcFPqX4KfP
	rCtCj+r2SFC6WUM87snXcBw/3mha/M1XkEEaUx33eeAHNCNmdL3ztXOtxPYiDQHe
	rCeZmHMBfe7YfGSi/CmQixGYut6GzNztdtrMQ+MX9v4TQ0UUySaei9Ehn+TRol9B
	DifKbg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8802fbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:31:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so1393688137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145883; x=1773750683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0qrn9d7S7AyHe7vYAv9x2SN2/8h4evFQLk0vYAxM3o=;
        b=RGB5tstc1rOMqkN1372r1qJ5jFJn4vH+6lKR8Ow0TGAMoiJicFjraQfoZqU2GocUZL
         0obTPnW9MbyJdSVYJQVtiJGgEC4Am4FgKxg0hRNciRFY6BbF4JFtDRp5aF1bvbwcjs6E
         TY5aI5VnVvCg0Avc1ug1krW13pX3ZxYywCzthD0yqhcEA8Fr3KmT5SGgngoIbIiSLjqu
         zwLuF6lCpalJVbumqSbq1VwrKhDSYPjtC6iwfZsjMZMoyU1uy3CZg3hB/Xq0/dh3+nIM
         4/PVLqNYk9+pCtK6dO98EDC+1ADKTCmJbNAFXkvXa5ndDxMXWuuLXvcizIN5iacAoQrD
         FlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145883; x=1773750683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0qrn9d7S7AyHe7vYAv9x2SN2/8h4evFQLk0vYAxM3o=;
        b=i0gH0GyTLonURkI+tXuGSjPvm+Z1uCQhiXqmCjH6y5rkrdC4IoLYbt3JopOXYGeYIK
         TtQMLAxw8zoa5JiIqKO0tzN1gJNOetGTqYA10C+EQPx2KBz0gZg8OSE4bLAh+pspK4hF
         lHXuz5CHrTLpylbBK/fJomrKYjPp9R71hqhYUWyl5IDQF96Nd5JEOXs9FCHNC/SH9s/Q
         55Bi7sjGDzGuC/KpgQyy0pbPPtONui25FiRgg4/LIVTXeklXCaaT5v9uC73NzR+cpZx2
         JYQuIsV8/h/lnkAS5ZGrTgnbr4bumlAVsJeB/XnMWR3ZezrM3bHYqw3Q8X9As8yBMNXB
         0kaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU66dTAUmeAzr06d5q/q4XsH9OPMIMT+bA0jFwaDjGZOaMOYrq7JbvaIEu0/Ws7E+UW6l168lhjLNJjfobo@vger.kernel.org
X-Gm-Message-State: AOJu0YzbV7/OM9DYuaBXy4YoQlOKeMtDuJqnRsOZbhgRmeCUeqyR22a8
	fH2C44hACUkDNRyYXkHj91lSs8CDegkt+EWzGczVQBjdm3yMMYy350rAe/dlwYd+7654RyE4Ddf
	gA09qrWpwhfTjyDMqvhH0jDElLd+4HEQej6Hcnqj5I+be0eHXPiiNKdNh5Ne8GTpAorkk
X-Gm-Gg: ATEYQzxufarX9HoJCJ+I7A/2qRpzXYTgJiZeuSkxcOubpdnR/2JKVqRlqOTtNvVBOgG
	6zYZ+3pPHsgpjswECIGnzPSp00um8272OnTThtMlWYbKsqut9/ZMdgoai2wAwXNBDzONDEArt/f
	zRNSxMZejCPGsmyKk+xaUtvh8+EgQ0TaXZCiKKwjoUQccB70/WYKPUf2S2U8IrtcuCPHnXgILoi
	b1SHpsXNwQqBuzeUdhw2ZdPUiwRdO8m4chIetgEpbby2c268ZgAydqWHggszHpN3eZyK51eDXFz
	5KDmYL19tMrs/Wwc2d5b7uStv9lhwLsW+lyUC1ybkldreruXlJFwVo9YSY6v+VowMbZJfL8nzCc
	IxifPLGAvjeznEpy+YDNX06M1Hul4AxK3MjSemuqKQUYUzYTGFsZ2hrMfWx2psezQTykwAqrm4D
	ZYBDM=
X-Received: by 2002:a05:6102:3583:b0:5ff:c5c8:273c with SMTP id ada2fe7eead31-5ffe612e395mr2608860137.4.1773145883583;
        Tue, 10 Mar 2026 05:31:23 -0700 (PDT)
X-Received: by 2002:a05:6102:3583:b0:5ff:c5c8:273c with SMTP id ada2fe7eead31-5ffe612e395mr2608858137.4.1773145883123;
        Tue, 10 Mar 2026 05:31:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef483f3sm462706466b.9.2026.03.10.05.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:31:22 -0700 (PDT)
Message-ID: <8d327f02-b2c1-431f-8a18-bba99e396223@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:31:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add Redmi Go
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-5-436f1f4b7399@mainlining.org>
 <07b552b4-ecdb-4877-8b45-fcaa6792aee4@oss.qualcomm.com>
 <390f4c8b89f3465924d6ef95bccccc6a@mainlining.org>
 <46a3f0ff1a5c20e8bd4a4c1efb16960d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46a3f0ff1a5c20e8bd4a4c1efb16960d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwOCBTYWx0ZWRfX+m5+gXrun2+O
 VSrCK38aqM2ZiOx6H/Dbvhj2jpxBeaWOGCWLhpeADDk2ESxe+uWoE2++TF20Wrvlbqyg+WCp3YU
 3zRRONL7KAH3Kb/wDwh6h5TptJ3Rqw+aGZNOwDUHSVjnaRSHzcFNDH6f46ExAR8ZPhqivJh1Yzb
 1mR6mDMgIZmenL+xOYdTlgZts+ATREwHubXIX7x9+XWvn0zMoELLvQxTUik3la1Kqmwueuj37Fo
 tViCvWVyf9y5hOHqWKv98k9gh9hByCLj0XWIYtQjK0VA3YW4bVhriiwVJicuyReRiuM4qdbjyMt
 L/CZf5Baj2+z9UOW4TN6VjRj6hN2p8TKzXAMlGWb40X/ytFWPFZA6jHrhGrtgQ0UWCKi6+Z3jlO
 /GCuiavj31i3YWbsG+OmwwlImVWqW7Y2/LZZBEKf6gasoYuwnSOqUOtS5adyC+2/5YS4ShzXcCk
 B8CJ+lT5+mREXq194Iw==
X-Proofpoint-GUID: kXaAZS3WotQm7sXCk0LmQwOwR_XNFBue
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69b00f1c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bAtGagR5AAAA:20 a=OuZLqq7tAAAA:8 a=2cL_a-esRp1aGMuMyq0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: kXaAZS3WotQm7sXCk0LmQwOwR_XNFBue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100108
X-Rspamd-Queue-Id: 42D9F250ACC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96637-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mainlining.org:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 10:36 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-03-09 22:19, barnabas.czeman@mainlining.org wrote:
>> On 2026-03-09 13:53, Konrad Dybcio wrote:
>>> On 3/5/26 6:28 PM, Barnabás Czémán wrote:
>>>> Redmi Go (tiare) is like Redmi 5A with small differences like charging,
>>>> fuel gauge and different speaker codec.
>>>>
>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/Makefile                 |  1 +
>>>>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts | 27 +++++++++++++++++++++++
>>>>  2 files changed, 28 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>>> index 20e161e843ed..a74598cf0b47 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -83,6 +83,7 @@ dtb-$(CONFIG_ARCH_QCOM)    += msm8916-wingtech-wt88047.dtb
>>>>  dtb-$(CONFIG_ARCH_QCOM)    += msm8916-yiming-uz801v3.dtb
>>>>  dtb-$(CONFIG_ARCH_QCOM)    += msm8917-xiaomi-riva.dtb
>>>>  dtb-$(CONFIG_ARCH_QCOM)    += msm8917-xiaomi-rolex.dtb
>>>> +dtb-$(CONFIG_ARCH_QCOM)    += msm8917-xiaomi-tiare.dtb
>>>>  dtb-$(CONFIG_ARCH_QCOM)    += msm8929-wingtech-wt82918hd.dtb
>>>>  dtb-$(CONFIG_ARCH_QCOM)    += msm8937-xiaomi-land.dtb
>>>>  dtb-$(CONFIG_ARCH_QCOM)    += msm8939-asus-z00t.dtb
>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
>>>> new file mode 100644
>>>> index 000000000000..c3a74530c34c
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
>>>> @@ -0,0 +1,27 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2026, Barnabas Czeman
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +
>>>> +#include "msm8917-xiaomi-riva-common.dtsi"
>>>> +
>>>> +/ {
>>>> +    model = "Xiaomi Redmi Go (tiare)";
>>>> +    compatible = "xiaomi,tiare", "qcom,msm8917";
>>>> +
>>>> +    qcom,board-id = <0x1000b 1>;
>>>
>>> Could you please double-check this? Riva and Rolex seem to have
>>> properly different values there, but this one mimics one of the
>>> values for Rolex.
>> riva value is depends from the bootloader, Oreo bootloader using same value
>> like rolex and tiare, 2nd entry in the board-id is not used so i should remove it.
>> Here is some more context:
>> https://github.com/msm8916-mainline/lk2nd/blob/main/lk2nd/device/dts/msm8952/msm8917-xiaomi-riva.dts
>> https://github.com/msm8916-mainline/lk2nd/blob/main/lk2nd/device/dts/msm8952/msm8917-xiaomi-common.dts
>>
> I have find out this qcom,board-id = <0x1000b 1>, <0x1000b 2>; works with both bootloader version
> on riva but if i set only one of them, the bootloader version will be limited.

These properties exist for the sole reason of making the bootloader
happy, so if there's nuance, let's not try being too smart and just
stick with what works

Konrad

