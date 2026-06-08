Return-Path: <linux-arm-msm+bounces-111674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M+LgMKFTJmqYUwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:31:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C5572652D2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:31:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SQlEaXTc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iQYWfS9B;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111674-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111674-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EDB87300252E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 05:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD65379C24;
	Mon,  8 Jun 2026 05:31:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723753793A8
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 05:31:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780896667; cv=none; b=OO5sywoWcJrMVLfmmBKA9cjoZW9G+FC/NRfQxZD8OpdGPuQ1YFkAs+t9GKYABpq8hnrUHrp1HjvMiASdj/QVO7canwVwxAD0atnVH3UuuwzbUzbwZPY+bItLWtDgMSNeo3AwAR8ecqZE+KnDfIPOr5TzcipaXaGwMQDc/mrAxSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780896667; c=relaxed/simple;
	bh=qTx+DHtWre/vWRqrd4nb+kTk0I/WA3gYh9rVEZ8lRMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTVDy/k+2zuGLDiVnRmNqg+t5896oYecpAQsJ5WB2HPZJQl3M4USXRNuS3uKFFJKn7EvTr4TeOx7BTpX3WXdtf+WGZtQLl5PKu8zygtHHBARJcUqawJNd61ZjitiiMK7ZzWmJUKWfswPx8KkiLuMQdl1i7296axN46sAi36N5rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQlEaXTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQYWfS9B; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EVMP1575014
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 05:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hi15Xm8d7G0ExlIDhiqsbLHBGa3znaUw7XkKqHIeAEw=; b=SQlEaXTc2HTwUtKl
	vP6UjSZZiZ+KL94k8tWgc4R7n/XHQkay/RttbnXeazEA0guDyjMTBAy1uYo8xSST
	t5B6ig7rpZqMbcURmD2VdCoEpCCK12OS15fJo/hMf815er7dl7o5MMYAt/lDvqXC
	QZdsOyrhVgt5uE947omn+btpmZkXpEHuCGLL2IQOCCu5q0IS/9dhWuwTZa58sIE4
	KhPTpInViGAYiZq34qIPqyRe5BerWVAR0eoVRjFRBX314tLZ0Mg3i3oOAhgYhi37
	S4154se3lJV+B5mY/8TQJD2Ys2UfWE3yIgHPotvaTXkA+NmZvfS3fwXC5+DXyLjO
	VvNQsw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cxf3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:31:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51758177935so30878161cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 22:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780896662; x=1781501462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hi15Xm8d7G0ExlIDhiqsbLHBGa3znaUw7XkKqHIeAEw=;
        b=iQYWfS9BeSuLd0qjI5xHtZzWKW08Z6w11KqP5fvmP7CZJjtsKR76dX2WiP3HL9uBkU
         zZfNiEGkgJglB8qQVe1RkHUsUEuJT5mI7gN3uAkGEs8Qk4o9sWSGd71mQMHenZygfxrD
         wwnaojlm6ZqRWdTBPBlXkJL8D5faYrhjCZJ2VZXo2mXcLb4x8xgWEeE7Vild12HDoe4p
         SwH+Pn6lSZIoBjFVaMCTJ1+Yrplof6QF8D6k0a85JvkcxvTyvk8d38NHuIuuTkV2S2Nh
         HqhY3W0PpMHoCnXOXR8hZUN06YYXurdWUfJjxhxYtAK08vpWSfn5kz5IdC0Zco3FtDSX
         tpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780896662; x=1781501462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hi15Xm8d7G0ExlIDhiqsbLHBGa3znaUw7XkKqHIeAEw=;
        b=KjaUkXaDRdGhrSaf8oYx0t2f7MxRdjK4gesxBA+EJXPHpLYqXmT4WWcCO1e1vOB7eQ
         Ozwe+wnIn3TuojgbwnUnDTa6s3pZAbHa/2SG9HUdEADlgUyqPvtuqHuW/LY7qfF67i82
         cv7zm6/OuWSG4ztKgP05J839bXYZZPWqrdkz22M5NBF3VT6T5myCaEYCb6TG/dKUAhFv
         ZJEER3zmEcCo+xcxup8aF2PxZvNxGVoelSr0Q+1OVXaq3repZlEUuHIhhG21C2sZXk7B
         fH/1HMwaFcQa91w9/WPhUXAhvkCSDKJ64j+62O+44plwv1mlMmAoWHtbxoAcunivqyZP
         YvyA==
X-Forwarded-Encrypted: i=1; AFNElJ+CWFDZZ9q2GFbZOkEwazPnsnN7NGff6ajaxXufGmDUEoUUZGbLFAI0nHs8urkccBElpaJrQw2TfkxUk0kf@vger.kernel.org
X-Gm-Message-State: AOJu0YxGo4GSuwlOlx2Fm0IVcZMFe3NRX3dTwyV5fbBdAwAHhm09+VXL
	cIkXp6OmEPuTfEtPmK6jeQrRq+qKlm/Z7ONPbJzy70PwP1hrdxlVLdOwF4r3DzY03Uec0ouK19e
	5ZYZZEVCsjHsfkanWXeKNycCWvPjljsSmrsOAk0pCMvdT9JT07Qr42QBl63LTraPXv9/i
X-Gm-Gg: Acq92OF1A0dXXhI6SBaNi40icqqdDkvnE/0aRTCTGKVVKF2k6ve2AMJrAW0NEXvVLgp
	wxCRTWZ5xjmotxjn0y0BXvi2cwGC4QfmKxXYpGObuEJA9ltr9BOw6jOqpXy46D+Amb6pQHZ6RD3
	yc9a48ub5hhGOyDKfQ5RFGq1W/iZRPsVUMsPjeSWh1FPWN9A6lIj7TO2uWFEkK5/df/J49kSwQx
	E5py+vVSE5q4W3vJs43MdmE1jY0Kpbon2Ov58Q+qOhlBGQreUQbUbCMWk5kqsTzyqxqNJv8/VS6
	yJjFvyy5HzgSATf7ljJPqGP4QU3ViNEOWYAHgre7QJERNllVZJw49v3urxInkl7ePoqrJKbRDLu
	VAYj7SDspdToWGGQmMYcpjnK3fNlhqmFpnMa9Hs7D03KBRyybINtjwwnlc8dTIFsOCw==
X-Received: by 2002:a05:622a:98d:b0:516:ef49:f6f5 with SMTP id d75a77b69052e-51795c5306emr207093341cf.39.1780896662659;
        Sun, 07 Jun 2026 22:31:02 -0700 (PDT)
X-Received: by 2002:a05:622a:98d:b0:516:ef49:f6f5 with SMTP id d75a77b69052e-51795c5306emr207092961cf.39.1780896662245;
        Sun, 07 Jun 2026 22:31:02 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.90])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851d7bsm6551413a12.14.2026.06.07.22.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:31:00 -0700 (PDT)
Message-ID: <75755586-0cc6-4dce-a1e2-726b33623eab@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:00:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/12] media: iris: Add support for glymur platform
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0NyBTYWx0ZWRfXxVw83qx/gbx1
 RmMoWHnKqQw4w2xhpnj5ppeEWJC6zH74w44fB88zoUwlqdYjNkX7hZv7i2tH5lBUofHFFCmSLlg
 tJC4A+lKGlw3ZkipbGR9W/BJ0F3v1jMZRrbzCgyCEj0JWNHfQXEms9mqdoDl0W5K1xH3DeRpnjO
 T9mG3fnXMIjGm3acPngnNsMr2+0cU+MkiJkhFYwnZGj+E2GLMRTGggxmp0Rkokc3S6dDX5DSN5f
 ILebwvxdUEXQXqjSblQ5hm37Ir9G4+M7sSi2N3US5n3MQh4vT30zYdrnm6YI3QfArN9YjztINXL
 iBeALbK1G+4n/Sqe5uMX2HqyHZzpTqcs6CDrCJi8lab2wxAVwMaKTc16C4rVC0KLfzrRZMkNkSQ
 X6sGD/o2/088zgIWeO1naoyaN0uaCh8eoL7YRwEDrs/GVHGezq93RiqIV8PEjoGAfct425k8g1I
 k8AiSN/nenUNtQDTeoQ==
X-Proofpoint-ORIG-GUID: Fc61bxwjUrZlI4owrmB2ZtTWgCoOxVxi
X-Proofpoint-GUID: Fc61bxwjUrZlI4owrmB2ZtTWgCoOxVxi
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a265397 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=LkejVvrHZj9QS69ASjwr7Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=kk5GEcIQhxhgB6gqvmQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111674-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: C5572652D2D


On 6/3/2026 7:48 PM, Vishnu Reddy wrote:
> Glymur is a new generation video codec that supports dual hardware cores
> along with additional power domains and clocks.
> 
> This series adds platform specific support in the iris driver to handle
> the extra cores, power domains, and clock requirements introduced by
> glymur. Add support for firmware loading through context bank firmware
> device.
> 

<snip>

> 
> Vikash Garodia (2):
>        media: iris: Add iris vpu bus support
>        iommu: Add iris-vpu-bus to iommu_buses
> 

Bryan,

AFAIU, if media maintainer can review and ack these patches, then we can 
check with iommu maintainers to pick these ?

Regards,
Vikash


