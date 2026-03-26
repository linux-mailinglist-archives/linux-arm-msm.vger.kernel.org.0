Return-Path: <linux-arm-msm+bounces-100109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLNkGTUjxWmC7AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 13:14:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F763350E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 13:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FD383078A17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068C43B9DA2;
	Thu, 26 Mar 2026 12:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CS5Cf4ZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cu/VAH7V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210AF3F7899
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774526826; cv=none; b=dnXDOgo+an+v8EFImk73TC8e9W1vLADqP85la1CrAtWQ5GB6M+Eq3lTGII/igk1abYR7hqkP00F6mRuKCrJRcWlUy7PkkEHVoe3GthPr8cqKshGPvwpzPCQD4yOy+IYDhg1HFK2Col/wnoSlkBZV/XAWy4GSA4CY0SqsgDFifPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774526826; c=relaxed/simple;
	bh=VGmkSRhf8QPXnE2EoJZ/NS89R0xqWBWWZdZZHt2XNvA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jFBTVUjqO4wMEXL1IZJ7LPjDB4neztMjPyHlTYLjg4Rm9p1yB4IjNXEtgNI7pSbRx0UImQ2b+C1PhlHZDk2b/cksjb5LztvP7tYoFWwiFPB7ivH0X9VYUXnv/mtu4DHYC4vO5hqBr84B6AAvgV0e2qshBoctaXowqQgX9YTU/8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CS5Cf4ZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cu/VAH7V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8RtTG3957917
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 12:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDhl88bVqyu17xGfeK+lPA3g2oinqiNwhpJk9qPpcJg=; b=CS5Cf4ZQl7JNnLDM
	y17ZXm3Jha3AxHkbB2RhqX5xrhGsNn3MmB7ZLDDoYk/Q9wFnYY4pZPel50pRNWeB
	g0uMxT66bmeWOvruEPFxg7NEXsDbnz7zwbfYhuvLnEut7YCWjs4nCE9AFDEVrAFj
	DGfbmU1i6TGlvIsSug/T/nTEWhHpLXtLB0lkhjrpRBLqZVyppGFRkS9mqI8P+Moi
	F6OYXNH5iKLx5O9rJ313Bx0VOB068IffHnO3Ckesk40HdXSJVTZdZftYEfwykvSM
	uoDgGD6USX17X/yj9Vz7FnG/PTcCz0fXxJnIb+YpVp2wic0MpCkY80LEn2mitPP2
	IuEAWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjaj2r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 12:07:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso16361771cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774526822; x=1775131622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XDhl88bVqyu17xGfeK+lPA3g2oinqiNwhpJk9qPpcJg=;
        b=cu/VAH7VEszfH+MyJXXqyMxBZe6gZwFvC1cbcaWH02dGICS0zHahBbYL9liY6kFu0l
         j+z5oJTisXBTpMHehj3f6qWlrR6hay2LQfEmpdU4m28XJ2HATArM+u43/IjpaazRsT1E
         DgNZd5fXT42j59UJZF/PKiEYQ2+y4W1X4U37wmAKt6VwlG5558Z0GfEegc1R10Gjg2UI
         C2M84Jdmi4uQVJC28t9F+2HiB3QoQGEjP1XbN+4OqlY7Sf/AGQWry6i9/5HnUlycftf0
         uFH54L2bX+LpkuDZmD7Drg0pJ4lyq5F9wcv9+Y1uSM9SNzeWQPo3GSxf+XJjVyq4Fidz
         S3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774526822; x=1775131622;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDhl88bVqyu17xGfeK+lPA3g2oinqiNwhpJk9qPpcJg=;
        b=XH3T2JKSu/xQQDyB77yfPqk99ZV32Os43gGYa5l/ZaT6+RG9W/ok5i8vqycayXsjsP
         lunpkHrNjxQI6oIhim3v9VIurDy+nvUU03PVCc2eJrQGC4QDLscWvkWrhBFVqI3WsLIJ
         GKe5H7bGewOi1NT0SZynPpEqnQRiBsLcyAztUqVa9qhNC09VhQTWqydWB0lGXA3Vfx48
         P/cBKOuHXIMqHmBVxoMY8EFdIfn20GoE3C0wtOGVwu6Za4cZERKtlSTV1SFWlTHDTW2E
         s/nL9xxfu115r6bOGE7IUK5MeCQeFmbv/wC8YzxfLLnYDjF8zBwz3VWr9YBTXG89DaJ0
         a1NA==
X-Forwarded-Encrypted: i=1; AJvYcCWsefrkrUu5EyLcxMo/vorD2nwryghhLGg1q4+TKt+NbPwepJZPI1VMPHqB6JPOWTIirsKOhB/LJg7H8NWO@vger.kernel.org
X-Gm-Message-State: AOJu0YyBOJxKMMy5cA+GtUSGFPMdtD+C4NuZ1DotWk0eO3XmsEmIXgQo
	0tdmC5Tqj+EhLG6rvQlDisahduIkdD1aeJftTx80h7u8pwCteDqIRz6XVYqgwI/klzM6W2g/pbh
	SMCn6sfvHQfVCmQYoJ+dcvroVyDvlDCzjGqPkdg9Lhb62AHicOP9OFJJCV1wlykrVs+u6
X-Gm-Gg: ATEYQzw3itZkEvLJyL55SHhyvmt543nY2lVgqbOp84zQUJAF2Q0pqL7VJ0Z2Fjehuu/
	OJIO1HtHpKpZeQLi8/YHFJvPZAnA5Jpf/Ok3WcDSlP+MFALt+InzDUdgr+eWBTA1zRqxftSWWfv
	xHcNnbD+60pW5LOxJPV1eMuxcguGTSvkoj1M6Jzp3gxvK10J7wCt/p3ygDUJs3pJca/yEPWoqIP
	8YsLGOZ5CcSgVHK/ItAJCnObH46GJAt1u/VOCgn4qjCi1BTi0sDVranU5bzoj58Ym61MrNsKamS
	+oU1JhYvh4t0mRtxLDoBroUdjlkrVGdgUKZeSsYSrzI58jjkyehvs/082z4cjwQ2FEiOytZHbdb
	O+wYrcqDK4d+ecXP33sss1pvEC+m60x8CJnYQHXeU1G8r9TPHx5wkAbNouoDA8TBIOgB+/jaHz7
	4ImovH8rqcNFn3YSPi4ApspCf9BkbCv2VGQD+svJyrIk7RHNfv3JNuM+Ukz2Y8SQ5gBVOakXXzT
	86eqys1e7uoMLA3
X-Received: by 2002:a05:622a:492:b0:50b:3ff3:f489 with SMTP id d75a77b69052e-50b80e36161mr94928401cf.34.1774526821982;
        Thu, 26 Mar 2026 05:07:01 -0700 (PDT)
X-Received: by 2002:a05:622a:492:b0:50b:3ff3:f489 with SMTP id d75a77b69052e-50b80e36161mr94927811cf.34.1774526821403;
        Thu, 26 Mar 2026 05:07:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef851sm109201466b.45.2026.03.26.05.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 05:07:00 -0700 (PDT)
Message-ID: <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 13:06:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
Content-Language: en-US, nl
In-Reply-To: <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cFzC91B58uY8PGoxaolOEEkK7nVHCLqE
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c52166 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=RCPHVYlSrOQLcUI7fhoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: cFzC91B58uY8PGoxaolOEEkK7nVHCLqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4NCBTYWx0ZWRfXyoN/9kEJAi7C
 ZH8Q+TausFapZd6zPrZ6zdlg8WKFGLcryGGm/uRjbUtPPZMekzni5Cd2phAh8mmJpTeFAPcWtlx
 pBd5eaCLA3JGhl/QppWYWGoRncU3ksZ9ZB/HFmRJ/rWK9wCvqT6/Iyok5wLMEoNBONAH4vWp88E
 W0K2/dl+1GZVxvbVe9AvFiPb1OLucIcwmcAXe5lI7boElvYyBtxcXpjD7NGb0OZK0HeT87gOBey
 Gceds9rh3XX5NQ/7zMLM1sLt/iI5kl+tR+kp3Vzs8Y/7Ew13OW+/zN6k0xCFkz9lD/jxsYSuMOD
 tgddB0IHTrFVtRBn1MIK83BBfH/oLB3Nt68yfeqXvGpzJqSW/z3LqTU3PP1MMHTQBJzxmHSLZm4
 6I8q35ZlyJ3fFXqYfpJrDIPR27/JiZTBHDb8wfgmQ9Djt1eEEOyFDQRQbJ8RmGe+oX8mFOV9i6L
 i8L2ZTrPU69ZDTEKpaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100109-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57F763350E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On 24-Mar-26 22:27, Dmitry Baryshkov wrote:
> On Tue, Mar 24, 2026 at 11:00:21AM +0000, Bryan O'Donoghue wrote:
>> On 23/03/2026 15:31, Loic Poulain wrote:

<snip>

>>> As far as I understand, CDM could also be implemented in a generic way
>>> within CAMSS, since other CAMSS blocks make use of CDM as well.
>>> This is something we should discuss further.
>> My concern is even conservatively if each module adds another 10 ? writes by
>> the time we get to denoising, sharpening, lens shade correction, those
>> writes could easily look more like 100.
>>
>> What user-space should submit is well documented data-structures which then
>> get translated into CDM buffers by the OPE and IFE for the various bits of
>> the pipeline.
> 
> I hope here you have accent on the well-documented (ideally some kind of
> the vendor-independent ABI).

The plan is to use the new extensible generic v4l2 ISP parameters
API for this:

https://docs.kernel.org/6.19/driver-api/media/v4l2-isp.html

What this does is basically divide the parameter buffer (which
is just a mmap-able bunch of bytes) into variable sized packets/
blocks with each block having a small header, with a type field.

And then we can have say CCMv1 type for the CCM on the OPE and
if with some future hardware the format of the CCM (say different
fixpoint format) ever changes we can simply define a new CCMv2
and then the parameter buffer can be filled with different
versions of different parameter blocks depending on the hw.

And on the kernel side there are helpers to parse this, you
simply pass a list of the types the current hw supports
+ per type data-callback functions.

And then your CCMv1 or CCMv2 helper will get called with
the matching parameter-data.

So this way we can easily add new hw support without needing
to change the existing API, we can simply extend the list
of parameter types as needed.

Regards,

Hans


