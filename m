Return-Path: <linux-arm-msm+bounces-109673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEgUA0tVFGp2MgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:57:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8E35CB68F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93D53300D961
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFBE30C17D;
	Mon, 25 May 2026 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJrVBNGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nkh0G4b8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BA3212564
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779717447; cv=none; b=oxXyiXbLH9eL49DTyV+s07tBrLuris9xXxPZQcFbv0wg6T6aujYOyglFwLEnYckMcQwOZbq34e381ZeNCL+EPiwgExVj0ho8N9Sd3cZSQvE17RDWmrejo/zQlyTzoIy85Zd78s6oz/RXfSk6K2yI+QcD6OAUovGolxIUU7Clikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779717447; c=relaxed/simple;
	bh=ULoE+8zvbjsOuy0ZREHWAwS+PUKadWFHLcTSEr6ofH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhnQB5grw38vSdUouQMuN0zegsk4PkDHs4GmTFLq+VzWZ/wP9HWPxcMtKERY9ySIoZCGGiVX/wr0uugobqCob+wZIoE8xLTkVqLZedGAAw2jJ1MLjhuPemiCbjTazKkO0WaRnr/C9PEomaFBC1kvrnzrCqVip/vq9AXzx2a+STI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJrVBNGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nkh0G4b8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PBPjtF3263696
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KIjppU7tpPql8YjmItwFuxQF55bJ2eaCplY4WbpqW+Y=; b=QJrVBNGBR0Ppfdp2
	hdcOGj20Fgyr9lsx6ewZJXwZP3evi+Kn5q//E9JJx/BvLFt7kLFp+Qb9VF/HGmYl
	mL1f+i6yO5MGx1momOKQQ6jPo0zKyKlPrvkkhukuJYak8m7kSTCielO6JZr2/8bV
	CT+lA1U4e4tKZf8mYKDQJni519TZA+mm9r+HsWxefKbi0uQ0x1Wz/aiXvuV6EpWf
	2DC9Cj2PbLHs5Rq0szw00BHhNv+xkU5RSLQOJs+WmIa73m02yeC5vMcy3ZBtZSFw
	w9SGWmoCTFLGXy80LrNgwlU+eVoCAbEJcKr7Jv43P8lg/pGTw8JLl/hHb4U/8mjO
	VYvV1w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs0gtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:57:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9fe2d6793so213401335ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779717444; x=1780322244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KIjppU7tpPql8YjmItwFuxQF55bJ2eaCplY4WbpqW+Y=;
        b=Nkh0G4b8bMtB6kgbciwCrbU7D5RBM0wOrwhL/Mnh/5wsjrAtwuZ7tCQ7BT5L8E03rJ
         nayz/SXCKA2b1DshqnBtKMfMBiIde9M47st7VlCl4CbbLnLYaVAHZFRmxP0BlI6TTV9F
         Ceizha6FubaBXyLUZDk6qNloll40lcQYIEEL6q5/U5cBkAFxcWD1huDa9hFjqhN54kVX
         b/cnv+/I0kdmG73iHSOTJGQlO/Pcm5yQ6PXb0F6d2qPfl9TgV74kpG+FuC5Df4XHnmio
         j8LpJu9XfTRPkNxifi8gIk4YJs1e+mMXIfU5I4ofRYPYOP1xf02zUjbxLvrKGD1lcr+V
         z7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779717444; x=1780322244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIjppU7tpPql8YjmItwFuxQF55bJ2eaCplY4WbpqW+Y=;
        b=l59NyGAdbuNEZCxgCnEnPq3x8qzf1bcrPXaQmNxK2RA8FEOVwwpK31oeu1HSYVJ6G4
         +szAFKLABUcSniCTmvlhfbxBqV22foWskvol06frP1OeBwNfoeqbSlePOaH+TpIZQYjs
         MUoYKnwEVzSXZjpR+c6j77qqlDNzPyUAzRcpkXL0TaEy+0E8HAxpeAl8hw89FSJy2wi7
         k6Y8I16zQDYmsiXQM77eDjvJQ9c478fDKcrbTLDLVlluCOL9pZzZ/bSetIhBSLGe3aW5
         bBaQgwhVHDz8Go5TpCtRCPs8ttfSvA6pJAh4gtRNdO6w3rah0m0vPF90SdR/U4RAr9Ky
         tkJg==
X-Forwarded-Encrypted: i=1; AFNElJ962z4ijionHIbZ5vDIt8qEvnUBj7AHYLzFzEiIPjQx0nS9rAfxsE+paOtCy/mppaX7Lijni4C+QNYk+AdA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfp6WIo+Ltm156Erb9dr66PxCHdrDIkWStnAnhc15hUsOQ+Nop
	rs8gmUeNzcrHYEq9IXjtbeme4/Zvqw6wnl+OJQpXkI8soobbCsceQfOIhmuSJZRjJijIsy/gNdr
	QLZLcCklexSQCS0Ppz5Q5WDrYaM+HRaLR3nnHo9Gf2GY3z1Avqdxr/etR/8W6+CwdO8Rl
X-Gm-Gg: Acq92OGneVuuYd+UVWGmLqqbhquZHOcB2B49dgWVb7xQ/PcA790XPr9YMiO3cDxAihb
	vBRyaYSl9tI7xVMC4vGz54vL3yVMCmlwQZSX73TZLRZaA30woxycSQQtuXGy5ELrAfsVWosLzfV
	Bfjmswo6rMTUX962Hob5msY47K98D5My2A9osFYOb9uGyUDtenYRM0J1xF6WjvRQSkF/ceyFruR
	UC+FfWN7dX06tq0VM1IqnBlUeYG4L0O+mPQbUX6omouWVQyYWR0BH/4t+a614ZkN3W6m3LEW9Jr
	QYqSrti136Tc5g7vi9hKPUUwfL0bearo1/Y3OGlmU15nb5wpcprltKSUFFlRedItFMX+5yJOGGr
	WiEYDH4BNGH2rK3cRQ0EDHdj0DTmWan5xIcWZqaV/Dj1TfRbGjJr2YJ70sOFzLtREA+RgvncqvJ
	bCdW5N/3dyJMbnaEBUzWjLYbJurxM+U45V6PYKeUuYIAh0Odw=
X-Received: by 2002:a17:902:c951:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2beb06fc2c0mr175845935ad.22.1779717443906;
        Mon, 25 May 2026 06:57:23 -0700 (PDT)
X-Received: by 2002:a17:902:c951:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2beb06fc2c0mr175845575ad.22.1779717443399;
        Mon, 25 May 2026 06:57:23 -0700 (PDT)
Received: from [10.79.138.73] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm124815515ad.6.2026.05.25.06.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:57:23 -0700 (PDT)
Message-ID: <ef361240-b302-42c8-abb6-b4129b4e05bb@oss.qualcomm.com>
Date: Mon, 25 May 2026 19:27:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
References: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
 <03996c07-f9f3-4586-96ae-075927da2577@kernel.org>
 <83c78333-4db9-4943-b90f-164981bb68d8@oss.qualcomm.com>
 <hc3bkodsdzq3to4aaax7vaeahhlrisk3iytuaxu46bjm37p75w@4e7c4a3gh3lb>
 <05c377ab-33ef-44e7-8708-575647de088e@oss.qualcomm.com>
 <c07d2798-95e4-4e50-9385-7adfc5791e3b@kernel.org>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <c07d2798-95e4-4e50-9385-7adfc5791e3b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a145544 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9xvNNVmrUaz2OP-DQ1sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 7kM8njhp27vnuHn41u4TVrWEYSaEJMPB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE0MyBTYWx0ZWRfX5HOR2SUnqLyr
 N8GvfnvjTvQmq46VYW0CyAPogpPVgpXpxhT3fQ6oozS3I5B7jh+D9RiR9ToRcG861YmSDPyTohg
 YKYXQnyWXkdRGCI7tVmdTywvMSvnX4KQja6marIt1rJRqpkUw2DpxJcRVKCqRstkrmYduirEqAF
 d/fkqMyOrgL0HDOC+RWFQ0P27ooHGYRfYUj7kObmh49/sUeG5Ydmwy2vFZXMpTE4tofS+LqXli6
 hUyJ5S3zVDE3AY7N3CyL3qXNDVckVyWj/ZJ4mP6tNoGuJegED6Mg+OwkoqHihl9nhcz6WFpmdwh
 qBMwMZMy7MKs3WdK2MQbvT3TmzfgtCtchOGyEBT9pK0njhaBSPFCMigCBQ196QTYrNh4hgM33IM
 zqSa5XSdIxvhPBWizEMAa5fhSTvJQB9VA+mHhEDrQznTp4etK+s8RLWMrII5f2TN93QNF/WJ41Y
 i4XjCjWsevArVKeAUAA==
X-Proofpoint-ORIG-GUID: 7kM8njhp27vnuHn41u4TVrWEYSaEJMPB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250143
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109673-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F8E35CB68F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/24/2026 11:53 PM, Krzysztof Kozlowski wrote:
> On 15/05/2026 11:14, Pankaj Patil wrote:
>> On 3/29/2026 4:27 PM, Dmitry Baryshkov wrote:
>>> On Fri, Mar 27, 2026 at 06:16:59PM +0530, Gopikrishna Garmidi wrote:
>>>>
>>>>
>>>> On 3/26/2026 7:55 PM, Krzysztof Kozlowski wrote:
>>>>> On 26/03/2026 15:21, Gopikrishna Garmidi wrote:
>>>>>> The display, peripherals (touchpad/touchscreen/keypad), usb and their
>>>>>> dependent device nodes are common to both Glymur and Mahua CRDs,
>>>>>> so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
>>>>>> reuse.
>>>>>>
>>>>>
>>>>> Same questions as for earlier tries (why this has to be repeated?), e.g.
>>>>> x1-crd: Please describe here what is the actual common hardware. In
>>>>> terms of physical hardware, not what you want to share.
>>>>>
>>>>
>>>> Hi krzysztof,
>>>>
>>>> Thanks for the review,
>>>>
>>>> Will update the commit message in the next re-spin.
>>>
>>> Before you respin, you can actually respond to the question. Do Glymur
>>> and Mahua CRD actually share those devices (in case of USB that would
>>> mean having the same baseboard with different SoCs being wired) or is it
>>> just "oh, this looks similar enough, let's create a common file".
>>>
>>
>> Hello,
>> Yes we've verified across glymur crd and mahua crd schematics, the regulator supply
>> and data lines are common across both targets for the nodes in the patch
> 
> That's not an answer to the question. Or rather you just confirmed -
> they are similar, so let's create a common file.
> 
> That's not a valid reason. Don't create common parts just because a few
> nodes are the same.

Hi Krzysztof,

Thanks for getting back.

Just to clarify — this patch does not introduce the common board
file, that was already done in an earlier patch:
https://lore.kernel.org/all/20260318124100.212992-4
gopikrishna.garmidi@oss.qualcomm.com/

We clearly describe the physical differences between Glymur and Mahua in 
that series and a consensus was reached.

We have re-verified both the Glymur CRD and Mahua CRD schematics
and also physically verified on both devices. The differences
between the two boards are limited to what was already described
in the patch above.

This patch simply moves the remaining common nodes into that
already-accepted shared file.

Happy to update the commit message if you have specific
suggestions on what needs to be changed and we will address it
in v3, or if you feel a separate Mahua board file is the right
approach we can go that route too — just let us know.

Thanks,
Gopikrishna

