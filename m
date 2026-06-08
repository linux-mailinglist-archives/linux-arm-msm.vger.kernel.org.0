Return-Path: <linux-arm-msm+bounces-111768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6aucL3OIJmoZYQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:16:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E2B6547E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:16:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jTlG9WNl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="NP/aKx+f";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111768-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111768-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87C12309D13E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA3E3B27E2;
	Mon,  8 Jun 2026 09:05:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01610365A14
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:05:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909554; cv=none; b=ladu0BkiQ3dQt7rddBXDtG6INFOMbRJskLHm4JA1o1VjtuBYo7VC28aqthg/cOiYNsi2gcZBfHWfL9HMX4oC5fc9AJDsCzgfeFULUSLPz/8mr/qW/WsE+EusJloECxOAfcd2DIF63rSTb7qhaFUFb8yHHIP031F35G6DEb0cehI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909554; c=relaxed/simple;
	bh=OQYFlo/wvw+97rYQB/1SMQpN/6mX0nd5l7DZmNGPrec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppdYFIc+so5r2sTfeHZj1xBWVHfIxtLWiNQB0eVuanDsU5m5GPFikf7t4BNTdnQ2czt3eLZkeIvGesog2GO7M9XCihshDMG1ssRe9OVkRn1S6Mx3Bh9ij9vTfaOIUXjB+KT4Pu8mDSLeJYfz1GW3lZfld+dgLezP2sQKJXveivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTlG9WNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NP/aKx+f; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65890s5J3164190
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sSSvva9xyhbhw+Xk4pnwYk8T29hV+yUkpgxYP1wpWEs=; b=jTlG9WNl7JLKg+Fy
	bUqRmnmhWFVi5PBAz47hJ81GdasdN2AbDuyOZZ9MDe85ZPVC0tbD6zTMx56S02p/
	TaAKmX4lTtgPpc/l5F9IKBJFGMU8anCwQfEL23qQRKNwE92pNriR+YICD7uh1uvN
	w/37ks/smnTCDgJSQMIdRJtoLGMoRKt7mBSXpW7Vd2ApRx03m5gd/nDj5EQ9YyOu
	/ZcrIUJU1QlDLyM0tEZ/VCtApj1lfrdgOsI23+X6659790WiahjornmxuqfwekP7
	LD6rpidN7ZXcRDrm28E1zdwCssmV0ZXM/92a1KButn5ylOjFBTtoj5oTLY+pyTz1
	hU7BWg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0g0ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:05:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176891d0a9so10797831cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780909551; x=1781514351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSSvva9xyhbhw+Xk4pnwYk8T29hV+yUkpgxYP1wpWEs=;
        b=NP/aKx+fjHXVWagWmKSXzZWcDwVoxrasXmaEBbvWdr6GK3cgvwJvnTrkz9ppt82XQ1
         uzCBXEOEqeDY/wGflX63/ExhNb0TW7kZZblHilDlWiM7nUcLI4IJN8k1z6ylnERTz/OP
         H/DNbNo+Z6g+0xxR4RoIo3BRzWn/USnznB2N5yMngTxeLs7fZfX6S1oNen4Oa14Voyos
         RL/0vZKBvyUf235qLw5HJqfrWH+xA7cDiDYXe9o+Oe9P87pdPhrIe767nDFuU9znNMvP
         EB2E8awzH9a03HAXcw3SANyrVIOQRmIsCDfdaqYjY/j0RoufnnuhlTuR4guqLuVFfwZt
         Cyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909551; x=1781514351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSSvva9xyhbhw+Xk4pnwYk8T29hV+yUkpgxYP1wpWEs=;
        b=Sc/zQdVbyjv9TBHQ/Ko/8INZ0jnbYrLggq3g4OAwkkMx/m/cDjBZflXGIVuoohYsUT
         OF5zWEv5UapNK8MWb3c+dsEfZETRWh/sNqaHx53s8wM2I7LAt+6GjcyuB13jZFj/cHvs
         4XnKuHBJWVD2S30aSr6UzM1UzeaoZq6qt6VLGCPncndEa4WVXZc7pmtjaZBciaBoC7bN
         TLlVYSMwq96uGjkPOQk+A0cFB+bCdxUaWdFRdF+r92DLdqbtLwQ0O8vNcfnzsHXScQTK
         PxQHvkb8rTXVmc97Bma6W7Ce8VIKtrrln/RDl5iMqNXNKBr8Qx92Q+q9KnZkNolbe1Wz
         vsGA==
X-Forwarded-Encrypted: i=1; AFNElJ+v/TjjFD7nUs8A+G6ska2CShFPkVM82sYLGqtxTeMAw+/bV3HeNF0AF+ctgfFMpU63NgsPWK+D5Ot9wM6c@vger.kernel.org
X-Gm-Message-State: AOJu0YzevdkM8EfT5/ALeMV87Dfk703Uw5cdjDImlDFZx241cMkh2elI
	1k8u7u7Q2Pc46+tAaLyGUCjM8jUidukpgyb2lbH1ejich+Ihp3smOmn07oKRW8X9rI0ayzeIofK
	i+/tzdjYYN4DmfJHQ8q9DXjJFYPaHfj7gD9PtTy0o5gAmJ/a0SXFL3s/3usW6KV79fyHZ
X-Gm-Gg: Acq92OHrNYvwBggrbXOa3iH/5KPZDBHICWfq2bSISd1tbnlI2M377kgZKDNGIFSY3Z9
	6qM2zY7HTadE3CquhAhQ+vCLkIfmD5Uho4YfpbIc7m/3VLF2kAUXVtHDV22mc4qMdudVsZe1hAR
	bHEr7wIxNKZNDTnKq7odjPe8czfiL1wR0gP0DxPRnwCY67sQie7QTDcq9VwziU7iKFnIZWKgZtT
	PQkz8csDFLIxfKo+1gBW4+av/sV/7nQL0J7Cnyn3FbnwXZ/EOtXjjRhmBLA8xHa4N4SIlIeG9CX
	xxG+7iTmo4McoOEphzYSHMREe+88f0sxF9tQZ6bxtdlrmbFPwE+qOatXZE3YJjecnJ/tUDeML9C
	MK5ESx758eKIDP1/pijqNykTQ+L3yJk3bdpPeZj4+u7SgM9YnnI4r7vJJ
X-Received: by 2002:a05:620a:6084:b0:915:7c1a:138c with SMTP id af79cd13be357-915a9d5fd58mr1326855085a.4.1780909551187;
        Mon, 08 Jun 2026 02:05:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:915:7c1a:138c with SMTP id af79cd13be357-915a9d5fd58mr1326851785a.4.1780909550709;
        Mon, 08 Jun 2026 02:05:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf41f05041esm427079066b.62.2026.06.08.02.05.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:05:49 -0700 (PDT)
Message-ID: <f9be384e-9ab6-4201-a737-4be331c180d3@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:05:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Glymur-based Lenovo Yoga Slim
 7x Gen11
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-3-57c70c23d0d6@oss.qualcomm.com>
 <6d2ca392-148a-4539-92b8-05bdab1d07e3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6d2ca392-148a-4539-92b8-05bdab1d07e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MyBTYWx0ZWRfXzlBMfdlF60TP
 XlZ4DnMDVMTpPotuJ26WvdNwyZGAZipLtb8gwafBSWV3tQEUkHLP2fmwiF8dlKBZcT5c5NE/61x
 bFxh+WnnVE+3wqFMlTWG7WA9p6B0b6eGz23zzcmuzMW8LLGPiPszePSzGdYDYuqX5FChqEm7qaE
 IMeOM9qtzOwW1GJcPCHpVIFPwTdt8guxXN3S18w6Vo9wlP1TQyJCEGtSHa+T7CiR0+gB/TFEZj7
 6Pxr5fMRIbHlwZkiwbKQg1B474KJAP+njlgFSHfU9lTp70K5ZP09Rpkvn+yT+/D72u7Efjj3dVb
 SanIe2iqfzpr11saMkk5MAnpXl/KfYEU85yQE6BR0/ERXe/Lttooov05NGAWSq3DWcAzLKXtuzJ
 TISLjR3KeZRG+AIZSDt1F7GmnHaZPpJr/C8aRdcSphLgclHPLWEZLmwOYR8EWE5/3huUYhM+8mn
 CSKv7/QoxMhqd9qelHg==
X-Proofpoint-ORIG-GUID: jElOJgO8gEJ_RwL8ZG74v6DdpYMK0LSF
X-Proofpoint-GUID: jElOJgO8gEJ_RwL8ZG74v6DdpYMK0LSF
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a2685ef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kKXrk63Xix4RLwVNwpMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111768-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,chromium.org];
	FORGED_RECIPIENTS(0.00)[m:gopikrishna.garmidi@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dianders@chromium.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19E2B6547E6

On 6/4/26 11:59 AM, Gopikrishna Garmidi wrote:
> 
> 
> On 6/4/2026 1:36 PM, Konrad Dybcio wrote:
>> Introduce a device tree for the Glymur-based Lenovo Yoga Slim 7x Gen11
>> laptop. It's fairly similar to the reference design, although there are
>> a couple of major differences, including a different EC.

[...]

>> +&pmh0101_gpios {
>> +    key_vol_up_default: key-vol-up-default-state {
>> +        pins = "gpio6";
>> +        function = "normal";
>> +        output-disable;
>> +        bias-pull-up;
>> +    };
>> +};
> The &pmh0101_gpios node is extended twice here. Please merge both
> pinctrl states into a single block, similar to the fix already sent
> for glymur-crd.dtsi [1].

Thanks! I'll just skip it here, as there's probably a RESIN input
on the debug connector, but it's not soldered (we didn't use it) so
it doesn't really make sense to poke at it unless someone really wants
to go the extra mile

> 
> While at it, could you also take a look at [1]? It addresses the
> same issue in glymur-crd.dtsi and has been awaiting review.
> 
> [1] https://lore.kernel.org/all/20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com/

I was under the impression I've already done that, but rb'd it now.

Konrad

