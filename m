Return-Path: <linux-arm-msm+bounces-113181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A5anGZr4L2qTKgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:05:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA3A686843
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:05:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JKdSA7Q3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XH9KuUtu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113181-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113181-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E700E3009F6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 13:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA913ED13B;
	Mon, 15 Jun 2026 13:05:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3481C5F39
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 13:05:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528724; cv=none; b=Df1kRrlC/ksrBWdrUP6ppzJUa6oTTPSiY8Iic49p4Xare9cFRTsJOcaw0fG0YQVVE4NmnFfR/zM2PfC6jL3N0warBLZAoIZMYSsCNIpwgq/KigZcUwF1APp8srLUHIpI/WjIy8ZLoNjVQZS+Tc4tWav14ZM3t1dC6hmT+bAdnb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528724; c=relaxed/simple;
	bh=XgesQe3JXa8zucmBrwvVS95U6qk/57Y4QGV8/8eiicY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJ0JEcQCWCgLgfUvGH4oUH4qiWTFDLiStZpsp4oooc+aJ9u8aK0BuO/aAXoF/JWTXJ1tqhmuLsFk6+B+P85qTwdbVGB0XLwIl07ude75Sf6es49+M9gqbeJ5WQTwh53+vJ6Zwlmrl98KL4t5A66E1uYpnC6q76yrvXqmpXMAMbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKdSA7Q3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XH9KuUtu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZJ4i023515
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 13:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gj2eBCwiJFOuabZ6OES/P0JXow+PfXd+VcRW89Z/+NU=; b=JKdSA7Q3tVUfzqtk
	KRiLAy/d5zD8oTrOFuQQh8xMCkOccAK7vCjxpsRSqIkMgI4QSnB8wSwiksH3e4KH
	dTlNvI8dAcfwWpTkG3ug1d6za2XbrTRW9R8nNCQSqBjWXaQ2LEAx073FY6PODdNu
	mhFHnmznVBAN21z5BJHRV8azbvuFBcGuyTiYtbwKeHSo68f6pvorb46ODnB+Wkl/
	vu/5dlxHXtLGu1410zKyUd9u4HNiUlyll21GnnR2PfbfVNB/6w+azPmaVSfXqCbW
	scwMn5QvgCzj4Vw/hxLeuWiwC7gWv+i3EnnriPoHEeHqpzg1j5KZPGI6soPGX456
	Snf0KA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0gs3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 13:05:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso3997916a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781528722; x=1782133522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gj2eBCwiJFOuabZ6OES/P0JXow+PfXd+VcRW89Z/+NU=;
        b=XH9KuUtu8gT3endCBcZa0FrNUTpzhjukh7xEli0UZ4/TpohOs8cWS79VbRceDtrLwi
         kQQXqvwgwrceZW/oUpRKThfPU0XSKlIAJwAALj6UiFUIMv6tctblKOyiGM3X9/he5GIi
         wIPIu5/tFL5Gi9QsVv970+ZbLRXa1roYfnFIvDS7ZjGwtgl7gIzusACR6VErWrI56Hhz
         4gY1a1HHeXq0KRml+fRRPu0IH12sA6qw9antaAqBJjMM++RqKYHKlSkvQ8SqYRh2T0uO
         ZqgknTbE5pyXEPbIcQy5789pxekQx6SuXxLHvxav03R55FijzwIHZ0JFwlKGu96ptdN+
         bUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528722; x=1782133522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gj2eBCwiJFOuabZ6OES/P0JXow+PfXd+VcRW89Z/+NU=;
        b=XdECfd/WTGBwSaQMOJ5lTgprMWm5GtY9yND4ZQRB/F6iJix4URbAjK7xM0CVxWc77D
         kla0HntuZ02zcyZftFBFXXM1fa31RAA88qoYkNYb51/Rd5SUHbPsI/Cw31pM/CfjDW/7
         /aR+EX3lHJygo6EZaxkS9YGrPtrrFhZ4UZgp8P5czPIi4lo2R7ISYZdoYaGChRFoIOam
         rHYEvjZF/Wlf/J2QwoxchqQNyRc041kwWSAPkMDbjrKivUK7PVIn42y2sphwkEXdw0ei
         JPiCC0G3W3rlEuGu43nXrvutfLZLFiVxj/W9TiCSYcoqQ8tQbhShbewmd3X9Bbq+fiUK
         GmEg==
X-Forwarded-Encrypted: i=1; AFNElJ+nNItMLo2Z2nqXx029RRfnl3yYRKkfB0m2/pILOQ5Rs2vrJJzVgYOvVhM1Tyrumjn72cfPxs/mIYyXRwXm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1tbGRvfh/vSYrqN7+pGOD0BjOPIuAOnB1wwev5aiNiGRX+GKI
	aeF8ZzRLtCfkrngXWLdiuhCXcoyQmeqV/LPCEfOLzUka69qvKVlxsEr4MEKBfa+koCLeGplcoB4
	0px4BhD6eJXPKFEIi61a7J4bjCp97fMF3fCR1vayy5SilJToJh7gWxE3bKdsyzml4B2O+
X-Gm-Gg: Acq92OFlJmT1axwbAJSqTRfyr7oU6Vy9DvmlbVq8vezEMw5YgH2ryJq7RfVH2T4+QJF
	rearhC0gIdQVzV0huJvHLwiqxyfL2Fu/gjTkvLn4QVvn/vLA374sTGPCp8H4J57R2BFHHmr80KO
	olc+E0MkTrUQjRdTN/aBNU9gpTKZ6Nc/IUq2FB79AW4NgXG/Y9nJMvpIL1kJBQtBqWpbYkIODtj
	88GQJCQVNG6ov2P308RLdSPuKQCOPyV9K/gLyNjhjp7VWwZ3WumSZ/pU59nP5D3EZVIulQkPrRg
	S/eOT8kVDibM3X0XL1Gu8fQLm16ZVLAfGUGV9gazzi3SgC7En9p6hM0RA+OEZ2oqdA/dt7cjaMh
	nYhDN5L0ZJbMn2sk1JgHMAdmx/GaHSZSmni7dpLRife4Bkw0OxQhrwFrp9Zqx
X-Received: by 2002:a17:903:2acb:b0:2c6:8eeb:a7c5 with SMTP id d9443c01a7336-2c68eeba895mr38750145ad.34.1781528722567;
        Mon, 15 Jun 2026 06:05:22 -0700 (PDT)
X-Received: by 2002:a17:903:2acb:b0:2c6:8eeb:a7c5 with SMTP id d9443c01a7336-2c68eeba895mr38749605ad.34.1781528722078;
        Mon, 15 Jun 2026 06:05:22 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4332694fdsm91735835ad.69.2026.06.15.06.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 06:05:21 -0700 (PDT)
Message-ID: <a94a6676-8ae9-43ea-a4c2-7e3de92b20e7@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:35:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] soundwire: qcom: add EE-aware register layout and
 cpu selection
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608175345.3118060-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <0030e12e-96b7-4a22-a3b4-1b42bd32f39e@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <0030e12e-96b7-4a22-a3b4-1b42bd32f39e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzOCBTYWx0ZWRfXzbw8Nrz96Eft
 8XdCcMh8Sh+Wjiy3m/SuOb2eNkVx9bAmM8ssTfdqG5lRDZ1l3BC3R//O6SQg4oJMBxmFjDjojx5
 /9+7QV9NIJAtSpN2X8rkuMWmiYEoMb8=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a2ff893 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=p_cByEH9xlcipoJQ59cA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzOCBTYWx0ZWRfXxDteygVVYGsc
 W78Eo4KYaSyiodywOLwObIhoocOs815XPtbRt+5TFvMJl8Qmj9VJD1FyFAkE/9lEUDqYluL96iy
 xnHcNmLRFuziTLh9YONN0SJSseQlS42Rzrau4RODIXWtSD0x1aWzZLjVfWLISxJUU3iBkvCa8/v
 ZfsbkNb5ARqKELGuKOS9zkhlZCVzMvsQxvRTOEaAAESHOrusPsuII4vZyN6HPXhynTyIVKgJRx3
 LEirnO+Qmyowo4ELyKPLY18/hVVGexC4fRVwBOkl9qIlBbdDbyXIqfMTG24jYj1c70oQFAX1oqr
 1hRK3UZmINX6puqukCKIEwPwvdZ3jwpxIOvwvQVIi47rkAv76BI5a3G2NcaQ5YepuWhcov4qYio
 I1SH6GcS1SdGWp8kPjA1tqvRL6u725eTo6kiQhGwgChOqD6nN/BN96bs4sI//K2Fl5MYTRrgvPO
 S750QgNkvoXEizpQwrA==
X-Proofpoint-GUID: PBvbyFPjskiC3DnOTN9FfjU08gijdK89
X-Proofpoint-ORIG-GUID: PBvbyFPjskiC3DnOTN9FfjU08gijdK89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113181-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:quic_srivasam@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[oss.qualcomm.com:server fail,qualcomm.com:server fail,vger.kernel.org:server fail];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[vger.kernel.org:server fail,oss.qualcomm.com:server fail,qualcomm.com:server fail];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c09:e001:a7::12fc:5321:server fail];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AA3A686843



On 6/9/2026 1:18 AM, Krzysztof Kozlowski wrote:
> On 08/06/2026 19:53, Mohammad Rafi Shaik wrote:
>> Some Qualcomm SoundWire masters expose interrupt, FIFO and status
>> registers in EE-specific register windows on v2.0 and newer hardware.
>>
>> Add support for selecting the SoundWire execution environment from DT
>> and use it to program the correct register window for the active EE.
>> The driver now reads the EE value from the new
> 
> No, it does not. "now" means before the commit, you are making the
> changes - see submitting patches.
>

Sorry for the confusion. I will update the commit description properly 
in the next revision.

>> qcom,swr-master-ee-val property, with qcom,ee as a fallback for
>> backward compatibility.
> 
> And where did you document qcom,ee and why do you need fallback in the
> first place? For downstream DTS? We do not support anything from
> downstream here.

Regarding the qcom,swr-master-ee-val property and the mention of qcom,ee 
as a fallback: that was a mistake in the description. There is no 
fallback being added, so it is not appropriate to mention it here. I 
will correct this in the next version.

Thanks & regards
Rafi.

> 


> Best regards,
> Krzysztof


