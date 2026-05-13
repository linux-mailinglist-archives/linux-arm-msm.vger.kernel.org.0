Return-Path: <linux-arm-msm+bounces-107448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOsZD3XNBGrMPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:13:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46369539B73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 281D0309F072
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4ED63B6C03;
	Wed, 13 May 2026 18:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbX6Gx6n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="emlMBMX3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187BE3AEB2B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698602; cv=none; b=i/xcN5p3D+mH+Usl/4JtMJwd+ZTRJDz6FSvvi2UxkMR/S0HrUdUhQOuZu5KHlA14393Xk+RkWEtT7/5RZV8reNu3wVnFDNS8PilwnYN9UYlvy8T8oZAA/ltRFMaH4YChxPaJOT1h5MG7uUmsO+1DDVkwHLY8hP5z/ncTs6t5TSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698602; c=relaxed/simple;
	bh=eMaxSssrKXUgRzUyVQt+S4DMHw1WIfhBoG+u9IXyTH4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=i9W7eh7uTHSmzrlIfZFMMHnFk9ADblTU4yvU5PaNs6Txi/1LQwW/1Ymcm0ftWlUL02BRr9Omf2jiaDLV6ArpqUWhXIKs5qFxJuR+7GHDC122OXbuXgviCZPmfe7kMnzAqXeAKy359ud9KLlJcVvKwozQO2J1mCYmOnlugLJrcAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbX6Gx6n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=emlMBMX3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAxBd2524404
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmVE04cdLbc/FMe/QPBHI2itToGW2Cie+k5fJeV+/zM=; b=KbX6Gx6nu+6oQDtA
	xDpcwi2Ff9kzcz/ugu9TGI9MPdfFCseOoa0iimBOnOnBNdDDadu7n+7LmhqpRRbR
	TZstSP0maQ76ss4V9H79SXzJlXkFIb1s74/iO2rvmpinZYm74lwE83egUnRjU+xD
	km35ucMcbUmA8dxolc1brOxT+I3AS8uPzjzj6+LgpUVwts/j5BoT9sSiKnsF66Al
	cNf5LVQ0Vg0Sbmif3Hiaq23ZUgrlMe4yp8KPSJpel6BBVAEqdN+DqgsPseS1NNrx
	BWc1ZOb1apjHFI6z2WzisMvFRNKVkkrBg4Uep36Z4TMepPykr8Mn6n/mm/FZC9Xc
	Z3qKtw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjgqb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:56:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c827ee34adbso2246563a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698598; x=1779303398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rmVE04cdLbc/FMe/QPBHI2itToGW2Cie+k5fJeV+/zM=;
        b=emlMBMX31eAc5b95OheHkks6BrzCd1MsLjWUN5TneRu1H7TLMGp004pkpxwND/JkG8
         LhQd3rP8nZR/bTM5+A3TliUCciZwpMjVvd4JA8Te92r+IvIeNoTokYldZSnbOKaArdwZ
         oi7yofBHAfmyCzkXpoKSZblq+AmMxE5kFovZwKXRdRkzxvXjnJWV49zXCexMkk4XDZH1
         kglN67GVfNn2s6tjQryz9mX5CY/Mds2LwoNjJT82XQm0MOS4jSGyZwR4Sxkkn2o3Mpfo
         Us5rnc1ELEPOC9RIJcK1Db6C+aY+Q07oyinPmsjT4GqQWnY5wNX77kx7/cys+9wxhEzD
         qhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698598; x=1779303398;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rmVE04cdLbc/FMe/QPBHI2itToGW2Cie+k5fJeV+/zM=;
        b=J7zk/xYwSN6dMib1/qq7VrYsmOftKeRRfbkRHwuctBuZcq4CbsUV3Zit2NqAjLCit0
         Ejja2ZOezOlzhpFSQ0xCzLmWsUYJ1eKQZIoFGchAbemVt9rS3FeW6ZPleQGQl787FBAK
         ZIgyFHwhk7ib09Ejt3iG+3hlqcsL7hfenHFfdgq14izoubnYp9PVoE//QvHyaJkq2wfV
         S653c0+o/ZS3/5ziIr/rlmDgnkCauuZn5QAKR6b7/RKZJrgq+osaleSk+nqBRqUf5nU9
         6ytjqtjbQHdzaFLo5MQtPoTI+EfZDvHc4H/BMca+J98JkvmOueg08bu/6vtf/vI9o9KV
         UmOA==
X-Forwarded-Encrypted: i=1; AFNElJ9lug3Hmg8uOIJC8ssr0vJzUYqdIfeLgjwJZugryYYFKiC+LMtUawLixkLaRAIfkaBu1VBmE/fuAA2KeG+G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7cZUDZ8/bk5kpznlIHMjpNMDJX3qKgxkH1/yIGelbuN3z3vo0
	hhLIvHJCgld7L5rQYRH2Jq8ATlxwfNxgnJxNNWB5EEm4fDNhmyElnuWnSMRc2tLazNpfrAzDyn3
	BO1V8et8q0xDmYPP5f8PAPhyRSmbPNg+HCmF+ZD3Bsp7CspKF8C3hDAmhjB9PBijQ/U8u
X-Gm-Gg: Acq92OHrM2Kn0msvOkiZ6uLN4KbcYnNO9LBNVrFBFwgu0HMWe/8m204UN4bA8+K+mXP
	YVdvACTIIyReR76nhfvbMQjZXxFuEFXTuonsSC5nFswnTseS3M6AYk52/DeT/nQTbgSuS2ltXpp
	9JG1DbAXlUvNSM39oEf24gbMD/LFJIthyFPeDk6Zz/GTugk87feBHMz0B1n9iy7+q9mweUZ4DPR
	7Fj3/AwdNpG0HMdyEaH56WAB/ZXprhw92B8ODrRmh5R3GRjutf5Cl39F9IDzXRh8HOzJs4DsALo
	ks6bFg2d3GV8yx+JapVpTHcrKDZ7/CFc3bPSS4s5G1+QHnE4xLmi+Wb5E84t26icTDpKHguQjqh
	vklYdqHSp2i0hNnNmrUvarGHN9MaIsaTWmoVTKeyAsr5QUJsPeCrQgOwar8nZUzg=
X-Received: by 2002:a05:6a00:1802:b0:835:4447:69d8 with SMTP id d2e1a72fcca58-83f04290545mr4615023b3a.30.1778698597889;
        Wed, 13 May 2026 11:56:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:1802:b0:835:4447:69d8 with SMTP id d2e1a72fcca58-83f04290545mr4614981b3a.30.1778698597342;
        Wed, 13 May 2026 11:56:37 -0700 (PDT)
Received: from [192.168.0.17] ([49.205.251.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664712sm273021b3a.12.2026.05.13.11.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:56:36 -0700 (PDT)
Message-ID: <4fa0d2b0-7e66-5841-d4e9-9a3f4ab00576@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:26:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 13/14] arm64: dts: qcom: glymur: Add iris video node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-13-7fbb340c5dbd@oss.qualcomm.com>
 <b36tyrznuwwjiya4lt2ajqbyopnonvubedpofasmzknwjd2mrs@eenc4epvbokm>
 <34962003-c54c-a64a-2846-8f741fec5802@oss.qualcomm.com>
 <gc7adzf63sa4g7hsnwwoylv7ddmp2bpfa556gj7r3brzsry2x3@dmmdwsfwbcat>
Content-Language: en-US
In-Reply-To: <gc7adzf63sa4g7hsnwwoylv7ddmp2bpfa556gj7r3brzsry2x3@dmmdwsfwbcat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 462GRDiwzSi0ArbhamB7jnqYMWXv0JFa
X-Proofpoint-ORIG-GUID: 462GRDiwzSi0ArbhamB7jnqYMWXv0JFa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NyBTYWx0ZWRfX1dTAyj2QpFxH
 oeOtXt9pLSTY6VP1NVuHkzF2yT8faqG5bZtihWJqtK0jB1l33Qq+jaWTM1yQ6mFbL4iSoWF4Ryk
 B8Z1y1vJmNc9DRi5gRzMW6PNhGF5sMVRNTWArJhX0xgQFmuu5QKiRd3CphN9RnTHdaNfqlfTz/p
 kA/sD8ZqBgjZxgI9v4BwttkE9TFyC2BR8QTrLrHiPR3dnxNrpBDf8aut+tEZ1TrdxjsWMgX9poL
 y6vOJP90ZzhnO4U5/EXIRpZLRdLL2sKu6szcjpS3zd7wVzgIMn8Lz7AHKlnQeSu6PiHizesP2m4
 iE/E4WTY8IM50xngRwVd/UQjilh9vazOnDPLyf4ZVfbgJZXAYANvzaxiccIj70XVQjrS3saPYeM
 /057crBKyMj8ch8DpzYpYBSwmOwzACiZjHJmqnERKxcjmC2OeUXXblq2QBNND6mg+hlcLhDRWgy
 huaZiqFkxcQRyAFUWRw==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04c967 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=UdqKVphAFhxg2bWZaUV5ew==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D9aC6Ywv3CxFFyY1MIYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130187
X-Rspamd-Queue-Id: 46369539B73
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107448-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,a400000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,aa00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/13/2026 7:25 PM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 10:26:49PM +0530, Vishnu Reddy wrote:
>> On 5/9/2026 12:57 AM, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:30:02AM +0530, Vishnu Reddy wrote:
>>>> Add iris video codec to glymur SoC, which comes with significantly
>>>> different powering up sequence than previous platforms, thus different
>>>> clocks and resets.
>>>>
>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 118 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> index f23cf81ddb77..c47443174f97 100644
>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> @@ -13,6 +13,7 @@
>>>>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>>>> +#include <dt-bindings/media/qcom,glymur-iris.h>
>>>>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>>>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>>> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>>>>  			status = "disabled";
>>>>  		};
>>>>  
>>>> +		iris: video-codec@aa00000 {
>>>> +			compatible = "qcom,glymur-iris";
>>>> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
>>>> +
>>>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS0_CLK>,
>>>> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
>>>> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS1_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
>>>> +			clock-names = "iface",
>>>> +				      "core",
>>>> +				      "vcodec0_core",
>>>> +				      "iface1",
>>> I first wrote the comment regarding resets. But the clocks seem to have
>>> the same pattern. It's not just "iface1" clock. It's the clock for one
>>> of the cores. And there is another clock for another core. Please make
>>> that nicely named.
>> In v1, I used iface_ctrl to reflect the clock purpose, but received the
>> feedback [1] to align with the iface1 naming convention used on earlier
>> platforms.
>>
>> [1] https://lore.kernel.org/all/20260414-lush-reindeer-of-storm-bbe918@quoll/
> I'd also dislike the iface_ctrl, it doesn't say anything.
>
> I'd suggest having vcodec0_iface / vcodec1_iface for vcodecs and just
> iface for the core AXI clock.

These changes would also need to be reflected in the DT binding document. The
current names are carried over from earlier platform targets as legacy names,
and in v1 Krzysztof suggested [1] using an earlier series as a base and building
on top of it — so I followed the same approach.
[1] https://lore.kernel.org/all/20260414-lush-reindeer-of-storm-bbe918@quoll/

Krzysztof, do you have any input on renaming these names?

>>>> +				      "core_freerun",
>>>> +				      "vcodec0_core_freerun",
>>>> +				      "iface2",
>>>> +				      "vcodec1_core",
>>>> +				      "vcodec1_core_freerun";
>>>> +
>>>> +			dma-coherent;
>>>> +
>>>> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>>>> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>> +			interconnect-names = "cpu-cfg",
>>>> +					     "video-mem";
>>>> +
>>>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>>> +
>>>> +			iommus = <&apps_smmu 0x1940 0x0>,
>>>> +				 <&apps_smmu 0x1943 0x0>,
>>>> +				 <&apps_smmu 0x1944 0x0>,
>>>> +				 <&apps_smmu 0x19e0 0x0>;
>>>> +
>>>> +			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
>>>> +
>>>> +			memory-region = <&video_mem>;
>>>> +
>>>> +			operating-points-v2 = <&iris_opp_table>;
>>>> +
>>>> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>>>> +					<&videocc VIDEO_CC_MVS0_GDSC>,
>>>> +					<&rpmhpd RPMHPD_MXC>,
>>>> +					<&rpmhpd RPMHPD_MMCX>,
>>>> +					<&videocc VIDEO_CC_MVS1_GDSC>;
>>>> +			power-domain-names = "venus",
>>>> +					     "vcodec0",
>>>> +					     "mxc",
>>>> +					     "mmcx",
>>>> +					     "vcodec1";
>>>> +
>>>> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>>>> +				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
>>>> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
>>>> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
>>>> +				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
>>>> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
>>>> +			reset-names = "bus0",
>>>> +				      "bus1",
>>> The names of the resets suggest that there is single "common" reset and
>>> then one reset per each core.
>> Two resets for controller and two resets for each per vcodec core.
> The same, vcodec0_bus, vcodec1_bus, please.
>
>>>> +				      "core",
>>>> +				      "vcodec0_core",
>>>> +				      "bus2",
>>>> +				      "vcodec1_core";
>>> Are there two codecs? Or are there two cores? Your naming suggests the
>>> former case.
>> Two vcodec cores.
>>
>>>> +
>>>> +			/*
>>>> +			 * IRIS firmware is signed by vendors, only
>>>> +			 * enable on boards where the proper signed firmware
>>>> +			 * is available.
>>>> +			 */
>>>> +			status = "disabled";
>>>> +
>>>> +			iris_opp_table: opp-table {
>>>> +				compatible = "operating-points-v2";
>>>> +
>>>> +				opp-240000000 {
>>>> +					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs>,
>>>> +							<&rpmhpd_opp_low_svs>;
>>>> +				};
>>>> +
>>>> +				opp-338000000 {
>>>> +					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs>,
>>>> +							<&rpmhpd_opp_svs>;
>>>> +				};
>>>> +
>>>> +				opp-366000000 {
>>>> +					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>>> +							<&rpmhpd_opp_svs_l1>;
>>>> +				};
>>>> +
>>>> +				opp-444000000 {
>>>> +					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>>> +							<&rpmhpd_opp_nom>;
>>>> +				};
>>>> +
>>>> +				opp-533333334 {
>>>> +					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>>> +							<&rpmhpd_opp_turbo>;
>>>> +				};
>>>> +
>>>> +				opp-655000000 {
>>>> +					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
>>>> +					required-opps = <&rpmhpd_opp_nom>,
>>>> +							<&rpmhpd_opp_turbo_l1>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>>  		mdss: display-subsystem@ae00000 {
>>>>  			compatible = "qcom,glymur-mdss";
>>>>  			reg = <0x0 0x0ae00000 0x0 0x1000>;
>>>>
>>>> -- 
>>>> 2.34.1
>>>>

