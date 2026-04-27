Return-Path: <linux-arm-msm+bounces-104752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KyoEU5872lKBwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:10:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3730474EE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE6CF306C7F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D21322A2E;
	Mon, 27 Apr 2026 15:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gb938pxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ecid/csx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C4A322DAF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 15:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302283; cv=none; b=EBcfhPGWvy4iZehUiK9z5Qbiv0J7QPe6SN5qZbk/oby+iTXi+zDV6inVL5xHfZ4Dw+H0YtYfyL4tvZ3Evyw0ZmHzrgJq0tsiVvz+RPCj/A30Vk/AgIxmnKEqDkJOWWviYoLtcz9ZAQ7VrERuZCEH5Ck4eFcjnOH6WXd8PChQq0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302283; c=relaxed/simple;
	bh=CminYBQxC/Tnq1I+ccvUO34jiNCE2lmXe7vUwoemivw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7Ef4PUeDj88tbLc4d0oQ3jZ2kz5I7R8LI0/u5/tihdx43lHPn67/+XQkZ3GcNnZJAlAJ/RL8bKFThTW3FE/BNMNKUsHoAS0TLK9Xlbmj7fAhP/ZYSd7xDgkoZnDl9CAcH4lR4assNlzUpxyUrgjoH6kcIwA1UX6rX8KefixQ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gb938pxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ecid/csx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RB74H11237232
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 15:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1yuiHJInWiG/Li3+crKA+5BjpM+44e0DojtKyELy8yQ=; b=gb938pxTEhCjkpJL
	9Ot3Gl9Z5qs9BZCtrmZ/bGl0lyCD8xY+MxxXF4G/RORFkU49ShqYfpbGUGeBYPFF
	rlyxPZb/pT9Dc7AJTBfWczI7F+mS8RcZIhNicrbiwH4SzUf4ugk+cAlqI62bHjlG
	CUAzWK7uJPFdKj4WnlNyPRjcdwrcoI5SHLhypfPKGBw3rdbybyNCpAPQMujW3VgA
	7y3HzT++lA/MaorleuQlnZRyzk0PL+mj7ae30mJfmwyTmj5XCL8bzEgZ8r0G5vPc
	7w6E5CVyEOURJlNREBZHDu8cUI/Kv9R7mYgvrCqIm96aGupaBNO4EiZ5EG9oyVKt
	q7J4hA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4guu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 15:04:40 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-42fafa8ae9eso498909fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 08:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777302280; x=1777907080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1yuiHJInWiG/Li3+crKA+5BjpM+44e0DojtKyELy8yQ=;
        b=ecid/csxytH5KiisV+uwy3IPCwDjshs5+XshQL7RKVEBza5SHao6vtanxHqKZzQwCl
         kKxUp7PnuSOL00g+HkGBSrMTeI2T0CyGjHYhmRwUssrSvgKzSHONpS/EngGx/I0532Kb
         +7ks1D8HVDab7IFKZzH0T2e/yRLU1Qk23SR51gzLHo7KKm4c8VgLscR07NIPUyrBjJ27
         FUUSauEj6+g++yZWTaP8ZhE+Pjmd7aMHtp1wrTJ9yEl40K/jGgTxCj6tU9MMOxBI1QjB
         WVor0Uk8VgrzUJZMcntZzc7QM07DTlV5aj+IxWOwibkz/nBp3E24yuVQoQ2iApqaA2Yo
         Al9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302280; x=1777907080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yuiHJInWiG/Li3+crKA+5BjpM+44e0DojtKyELy8yQ=;
        b=esXL7uTv+Rfbp6iELmj8tfDWOcjzsBon2QxFtvg95r1M0HFBNF6qWgT5HvDWVKvx3J
         Fcaoh5Cbwx0mnNvIclqCq/2GBAJUCyPXzFqQKzUcGYGA+EzqW2UG516jMpDk9quDQ3ql
         AR6H+ug+EmhzbCGZWJlImVtXhFa9LQbwbQdnelSpa1qrm33hsbP9Pf8h0qDm9Acl0WXi
         w80Zv+Yrf0DX677YgGjVEKBD1bAnt6FhIz6xp8wxXSLHIX1JXhbJImWdO57aVuB/yqfB
         EU8+HEOm6keIOac4gJE7ghUg8JhuHRAr2VeYVUO8PF7n3HBs0BLwFNSBAjAY+EPraT1I
         lLgA==
X-Gm-Message-State: AOJu0Yz6zP/3j/nBf7crapSeCGQCVeeAKXF+obmrG6dbOTy9M19cZ6FC
	YFBWCVA2m3GiBTB+UhA4IvTZyMACadeHy8btb9uWQtS6CTMR1KiLuxv1nU+0Oog20JKrQQFwGp0
	z/LXPl+k1C/D39VJsIKRt9li62Ew6dqgbyil4n474OGdgod02/KSHz2DFHhHlR4IU4EzMcjvZ9U
	5w
X-Gm-Gg: AeBDies/DaL9NL412kcNiEWkNnOUSqZ4MCV7n+amNIUJNa+p1wA88vOEF0sd1JLO8f3
	wl7KYBldk2esv+JHE9KEcC/mz4A0lHbVSZ2TqYIyNs153VbcV2U2S+8btBoJvdW+KVZuxjk8A9w
	Dl6Zv2IzeWBA3jpsahsGPCmmVUWJluLMTSSuxiDybnNWsWxCgVx8kWw8w62qBWwua+n/QBA2OcN
	42hYLnjpkgMOL5g+rLx2TGPN/4SeBuJJZZ37TPUzOB0dBi4NGvNvzyZ6zDbwBBBTQp/BCHhvBEO
	4cYb/FXLuD1f/aeIaRfRH41Yh4FGf6B+p13UuGCSibtjWQoMqx6KbY3bq/aZwHswMEQQBzfNC9M
	y60UthCkc0temGAMwr/wfvWUoqVOWswIFkJVINRxq0UD2PsIAmp/BVjV6DEhOI7epDNp0+1g3T4
	3xMtXEXO95ET+qHg==
X-Received: by 2002:a05:6870:c20d:b0:430:11f:eea1 with SMTP id 586e51a60fabf-430012019dfmr5442740fac.1.1777302279764;
        Mon, 27 Apr 2026 08:04:39 -0700 (PDT)
X-Received: by 2002:a05:6870:c20d:b0:430:11f:eea1 with SMTP id 586e51a60fabf-430012019dfmr5442673fac.1.1777302279084;
        Mon, 27 Apr 2026 08:04:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d455ddsm7175365a12.18.2026.04.27.08.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 08:04:37 -0700 (PDT)
Message-ID: <f537f19b-5d6e-4aaa-827b-fca3b8a44177@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 17:04:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: add
 LPASS CPU audio variant
To: Val Packett <val@packett.cool>, Xilin Wu <sophon@radxa.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-12-14aca49dde3d@radxa.com>
 <29a7dd01-7513-4fe5-8546-d57757b3b2d0@oss.qualcomm.com>
 <88B7BBB9133FBAD1+ccb025ea-4999-4701-bb18-c57a42cabe2f@radxa.com>
 <2f830f17-4bc5-4ebd-a66b-8068a14a871a@oss.qualcomm.com>
 <c3b833d8-2e8a-4418-9043-6cd04d9901e1@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c3b833d8-2e8a-4418-9043-6cd04d9901e1@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -ZOlUcmxfSrqD7vd5li-d6xSxC7U9g5a
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69ef7b08 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=rs9IiGjxfO60RFTHbSYA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: -ZOlUcmxfSrqD7vd5li-d6xSxC7U9g5a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1OSBTYWx0ZWRfX8OvjvaBR6M2o
 HURzGBxsCOJhOhm9CyQ9WHx6t2rRenOeIBQwYx6Whu2XXvm9cd4p3uaKLuSrrDrgRQzdCkS0gmw
 HO8QzNX5b7dONdtqkMI+6PTFlHn0Kfy2SM7Ojr4hdcecMtaLKIxdLVdDhftmGqBthe6Zg0YZubf
 DWvhYFeBCNxxKUX92Ne9CMCuj3hJf3Cnv3oK0Bd++5/H0EyB/Zb4Qm33idlDS8nypn7D0JYW7FZ
 eCA/KsS3giBDTYfUXeplw9MVavpYPMvb0ZchM1BS8W100Q94PU3uoZ3eCdH2Gw5ukvor4Sk5M/Y
 QD5G1XFv6yqFpPpw6zSsUco1RIxAq0S+GyVz7Cb0ANV9Gowvsj+sbnmrVclHN46xejNqdZ/dwxZ
 hOojc2Huw/EipFJwp99ip6D0FTU1g02JqTeGcjEgZit7I/Zo0p65ORy7mtx3ZkQLSsygV3mPizo
 SXgG1bf4hk0ypaTYnqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270159
X-Rspamd-Queue-Id: A3730474EE6
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-104752-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[packett.cool,radxa.com,kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/24/26 9:07 PM, Val Packett wrote:
> 
> On 4/24/26 9:28 AM, Konrad Dybcio wrote:
>> On 4/8/26 11:47 AM, Xilin Wu wrote:
>>> On 4/8/2026 5:06 PM, Konrad Dybcio wrote:
>>>> On 4/7/26 5:20 PM, Xilin Wu wrote:
>>>>> Add a qcs6490-radxa-dragon-q6a-lpass-cpu.dts variant for debugging and
>>>>> bring-up of the host-controlled LPASS audio path on the Radxa Dragon
>>>>> Q6A.
>>>>>
>>>>> This variant enables the LPASS blocks and codec macros needed by the
>>>>> lpass-cpu driver, wires WCD9380 playback/capture and DisplayPort audio
>>>>> to the LPASS CDC DMA and DP interfaces, and disables remoteproc_adsp so
>>>>> that the audio hardware is owned directly by Linux.
>>>>>
>>>>> This DTB is an optional configuration for systems booted with the kernel
>>>>> running at EL2, where direct CPU access to the LPASS hardware is
>>>>> available. It is useful for users who need low-latency and fully
>>>>> controllable audio.
>>>> I believe on Chrome platforms it was done this way because at some point
>>>> it was determined that they would specifically like not to use the DSP.
>>>>
>>>> I think this is more of a hack than anything else.. but at the end of the
>>>> commit message you mention low latency - is the impact actually measurable?
>>>>
>>> Some of our users also specifically prefer not to use the DSP [1] :)
>>>
>>> Based on their testing, the AudioReach/ADSP path imposes a minimum scheduling interval of 10 ms, which is much higher than the 0.67 ms they can get on a Raspberry Pi 5 with direct I2S/DMA.
>> We passed on this feedback.
>>
>>> Since the lpass-cpu setup works properly, I would not consider this a hack.
>> Well yeah it works, but I was really hoping it would be made
>> unnecessary and available for removal sooner or later..
>>
>> But since there's a genuine usecase, perhaps not.
> 
> lpass-cpu is also great from a "I don't want my pure libre operating system to touch dirty proprietary binary blobs" perspective, but you can definitely argue that that's not a genuine use case :)

That's a genuine usecase, but probably not realistic (in the 'actually
zero closed blobs' sense) today, if you want to have a featureful and
stable system

Konrad

