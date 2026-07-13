Return-Path: <linux-arm-msm+bounces-118681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oqkHNCWjVGpuogMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:34:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E49B6748C08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:34:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A1uWktGd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QbJXNsJp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118681-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118681-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81DB83000B86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D2F3AA4F7;
	Mon, 13 Jul 2026 08:21:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED9F3ACEE0
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:21:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930887; cv=none; b=P8CTZMPbqqP3yKVnRPG+Ku/9djS6Vy6vzpArhVlUvGQpAG+Dl1UiNyd2h7/gfr6GfalYomn3oyQhh3zNkiGP4ef7iMWlNQTNWpV6w4Zu0crdhR2IIRRUwFiWVAtveWP0LrO8fV3ByvR4vtLURQNAusv0fYx1yf0Y73AmaeRzg7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930887; c=relaxed/simple;
	bh=TnQKSM8MZA26ziuAwsidIQP/IBfrhCtujf4X8iIuakY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mddIFLk74yvC/l29UAs+aFsxzE32raAKbe9xXso9ubCsMowmrv5FfvpTlQ9W+a8Vm1+4/LRYtuSi8HOH4Gnknqe8pjTkjx3SleKT27AUbdV3IxQ0FGTgaxID2XkZWXe3Ws1RYnBYGnccbWwY5yVxwGZKodIInwZDpaK5t4voHMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1uWktGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbJXNsJp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NxAr390909
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgHCt0baVbDw76HI7bLRH910zw1IT9kEwqe9LOXn8jk=; b=A1uWktGdfKXCBprB
	02A8Ld+CVwDevHMURyhGwIg9bzLWDJGu8njDO+R473ofuo01WbSF077GLOwXOBRl
	gjFEgYSLnGYUWAzXPaDX/WE7pbAitefMGiihtihfnWrXS83bjKJJ7rfXxq0d2izc
	hWETrNqFGtCz4Fd2dH/09umjwLtNkb6ZxYUEkHhG8mY0U3HoMwwEFX+MhfwwaTB8
	5MylOl1qFXBWNiibKUcnZktLHI+0gOaiLf9KJGaNcnwr8dabc07LpUkYmZDwPtuc
	HQpNNhlo6tnU/Dsa3iMWeE+CIWCdEPfHlqn89N5lMwVAI+7PGINx6M9Nu4NqOeJn
	jJPCJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gn1qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:21:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso29329051cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 01:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930882; x=1784535682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgHCt0baVbDw76HI7bLRH910zw1IT9kEwqe9LOXn8jk=;
        b=QbJXNsJpyhOLuM9m7eWRgYQTAi1xFFDHbMQFNMjPZP9FXiBsTjbPtsprvSHDkL3C32
         W3faEy3bfRdPxq1/critJ/iz5aPzeMUerx6EFjVFGeIymKuiQIKGiFW31JqOuxWItgcp
         FWqvH4nDz/v45geDsQq0x1mJesqZCmfs3MwX8QWnZeJzPI0F8rw90zlEVW8Hv2mHuRzl
         8sjKXKCNEpNpma+O8+rla/RiSCNW7P4vnGGlJjyO+3IxWR+MCDHgfsrNY7Gsi58ugM/e
         1zB9gXw3TDhWvRkGDaTu6O+Rkt72iHGhGwfbZH9VMBBGzUQg40ESk+82RPrZ2TB49qMO
         VT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930882; x=1784535682;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgHCt0baVbDw76HI7bLRH910zw1IT9kEwqe9LOXn8jk=;
        b=EeUOJ7zmCoWi7jVm4tJLwwGO6UUelQW1QBEfJ3uxu8HTfHyzJm2O/T0xC9ot6oIuco
         LhDFoftZga4bMUzV5vIbD3EynAMIAaygcg1xnSKvFm5TC/Gpd0bMHpDJXzT7uIE3bQre
         pKmcVQ4z15hJzPEF4+WpPT60lPNZ/apHuB9wXCN5mfYURVeOZhgNDxJ6c1zNinIzaAJ1
         wdzMGGKGocFjk00gUSSkdtCDbrTN3/KVsU77sZhE9H7HcTMA6JD/7Un4WfMm6VOsk1Wt
         I3VDkzhGgWWbNiOx/Q3mF+xsR1H5bs+A2EjcrjzRS5jArwY7eXHJiCFILzOFcy48Bkqv
         1LxA==
X-Forwarded-Encrypted: i=1; AHgh+Rrw+B2vcFfdulD+3jD74B0RBrONGH38O08MY+rtSyx+yaFVI+44Sz1u1BQlACl2RFSBSH6HW9yGBY2JUqBb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+uqojYMp4IE501FeeVpW5TRLgw0zBLIF3m6CEBI2BdVip8UwO
	ApGqzAHKGXq0H/yj/hiPk+Nst0OjhNIJpmygnJ/dn8qXlbAJN53AXc38HGsQ/PHgcQOLpSFzTXY
	3BlVP63K7c55k841FRLAjni8X3LjKLkJZMSnG4cLuZ8cpeDZV5UgXROkrpJnwJ8w3zLho
X-Gm-Gg: AfdE7cm8B8eJCSoFNLnKm3IKgaFKABXyXQ6fMt9jc57Qdr9Vq1Ygu/yRJ4KA42GbjeF
	8QR1sFlRaRkMzNPEF87/vpXZAYERwowjrvLVJD+/v4Bx4eYPphCFckj0xRBsFZAgWcqoiCJCr7T
	lNuJgNrC1YO32Rf7zCpybek4iqBgFiN6i48Ip2uujekpyPJGHIcRESh8IXEDq+VdAzGcrJ2ANES
	9oMbVSUf9VWIL3Mr41Q3m1BOcLDuMMVt+V7fiwD0LeKsG9YaTdz8i5LW6fxu9RhIYaLqUGN4OTY
	Yqgc/pCYNkn9jWVjWOz2gY5ZDSo7XC41CaZB5XuLul0g3qqoZPZgRiwBjapeJ7Co0TfHDNjSxtU
	LOqojtMuRy+bGn35k4yegDkRR3kZh9S78jXom33FFK/o=
X-Received: by 2002:ac8:5d08:0:b0:51c:217d:d772 with SMTP id d75a77b69052e-51cbf0be5d9mr84321371cf.19.1783930882394;
        Mon, 13 Jul 2026 01:21:22 -0700 (PDT)
X-Received: by 2002:ac8:5d08:0:b0:51c:217d:d772 with SMTP id d75a77b69052e-51cbf0be5d9mr84321051cf.19.1783930881843;
        Mon, 13 Jul 2026 01:21:21 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69ac41d7ceesm7586462a12.23.2026.07.13.01.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:21:21 -0700 (PDT)
Message-ID: <6de0a8e6-591f-4526-b5c2-431711dde1db@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:21:19 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
 <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a54a003 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=ka1dcg31Si149idUFP4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2lBH4rvHqS5JCYHDIaSuDvkV9e_Sj3AM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NiBTYWx0ZWRfXwugghVo7pqwF
 VxpKlDK8883gyY2kA/QZxQ6kS2VlTdCJ6h/sY0mFUgRyEgvxwbjrGjHcg3C7H+H5wWKfZUZwSNH
 aYrXbnBI8GSYiLm1TVL841f/Sfnetwh28R60/GVoJ8exQGa6vn1ucMyNd92+dLZplJXErdVj0tO
 MEgqia8QWpGdw96M+UC6FGJx7j0ATOAosPeR0HwVrYv4+HGAlWaBmgaSBgL4M203RcTcJ484Ygm
 +W0dDPbynp1hBOCVPWm/f7QXj/4v2ALAQcOgmo3SEI2GR8mUJd6bAQg3WOPQup/RoS+CqDN8W4E
 hmof/1jb1Cq++DhD2XhTNhbCKmV5VnUArid5WSxB42JF1uVZbkeaElLvylWR/iz8asd7QOCXZf8
 mdBM4wtlqH9q72zaI0/E3ck5P/GNLK8e/fK22kWkSv4i9TNJoY4noYXTPC0AonVAG7pzDHtcWyo
 QEjG6lIJ/QPgzfDpeug==
X-Proofpoint-GUID: 2lBH4rvHqS5JCYHDIaSuDvkV9e_Sj3AM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NiBTYWx0ZWRfX5oXzpdOau/xh
 qyvhYCvfSR9JfDpu1XnM07SNUYwOa+nQMc3dUR14RkXpgLQa1gIVbnUdm0Quq/p3qXeIRuZJUpE
 JcK0zziLvurUZlGDmaCYDs+44CaRZ5o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118681-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E49B6748C08

On 7/6/2026 3:09 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Use devm_of_platform_populate() so that child nodes declared under the
>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>> platform devices. This is required now that CAMSS is modelled as a
>> simple-bus and ISP blocks such as OPE are described as child nodes.
> 
> I do not understand this rationale. How is this required now? Are
> existing DTS broken and do not work? Then this needs to be explained.
> 
> Best regards,
> Krzysztof

You are correct. Existing DTS are not broken. This patch is dropped
in v5. JPEG is modelled as a standalone peer node, not a child of
camss.

Best regards,
Atanas


