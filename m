Return-Path: <linux-arm-msm+bounces-114252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OtrWLqG2OmrCEggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:38:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9686B8C6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:38:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hBFwZWrJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H4F84NmZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114252-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114252-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AC943073250
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA1C313545;
	Tue, 23 Jun 2026 16:36:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515ED30F816
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:36:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782232580; cv=none; b=ummNIvK+C3z52heRZvlRHQeKx8zH20sjeIKR/fxT/RYyAhQ9Pci2p3fTc7xIllLeF4laRnOYmbx6n/gFiOvBzroFOP3fMPz6+baezHz22fmloGCIvJZkac9mlKOIByMZQkaTECAhmwie1xFeU6fyl6Mtbvj0jl84I2d8oVQ121k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782232580; c=relaxed/simple;
	bh=4SwdgIE+bd78iV3bxadhFE/SU6oy8jw4xjm+8xIaN84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I204XZmkqtpjSR1YSsqM6Xtd2viGyEE4M0K3a5l65XhLMsoi2+DyUhGNjYvsThMvWSi286mYEjMwYeBzb0MNfJJ7gQiqp2r0r49vvX6OEbFzpvEmKAuZM1Dtvh6IeqSxXSNpiKGWYklcsEBX1AXJsfMPgr5tFgK/GvasNbXubKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBFwZWrJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4F84NmZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYkDT113506
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xA0Pw5Ltim7xa7TG+yFu6in4RZDMahQ0O7HSJsSCKNo=; b=hBFwZWrJs9byP+c6
	hYYxGCrOpcZvXsOg28ZB6vszdjmOpDg5xjYrgaWLAB2QRTDOU08+5R/jYG5PW4FS
	oxjsRSNDoQUVy12asRr0bOypqvLuU6vrk6G47EpAVfFk8HLlyP686H+77ABbEEYA
	CcxHT/jCVFeID3l5ZwEIzPeOxzdL8PlqaFaPe+NsskCv+8g5VF+O3L0wumSlg+dE
	KtVB6yhhIIBls4mTfu2atPJbChIapUxE/rqVXgMsopdhWqe6SclBORTCeYvs1uyJ
	MLDiUDeHXl8Rn/zAi6anLruZIogLZQUt//ltG0ncMJjjmUWxg347N1RjLaDIdZdy
	xIcNVA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvtjkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:36:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8dc4536d42cso350736d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782232578; x=1782837378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xA0Pw5Ltim7xa7TG+yFu6in4RZDMahQ0O7HSJsSCKNo=;
        b=H4F84NmZzRsp2Q+3uqRHyozBqqEtyhqM9WZLv4j5mWQ+lh7Myy8YR8grTVcZyKvS1K
         ZeuE/kjIIP4dgp4PDmxFfp6HxwpcD5IjXZ5NkLtpY1z/gSvRT2nkjdprSrAlRTZQNZYd
         aeSGcFfgzPYmLC6aHpWk7LkqgBI5qCBIfFohD4AFIfe+koO9VdGkb7tQvwi1HLA9Eh1O
         NUSCzPZbMu6R2Lx9o/FWLX7vu5XtV0kHlhovh83IFuPdIGk8JxkYfJ8qQEtBlbHPLygc
         FNdLeXxoH3BvJVG1Xs7B4mLCMP8i5C6v1l4zHsmWHTRA5nGxLLy6GOs5rzmY+Rdzvkzv
         SOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782232578; x=1782837378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xA0Pw5Ltim7xa7TG+yFu6in4RZDMahQ0O7HSJsSCKNo=;
        b=CPHCb+A3MEIb0i1wogCxmJPDsp95NvTadFvlZsejRMd5b5Fittlangl/1ac4M2ni4v
         MC28z5qtoiLuQUhLnkZoxBBUNZnTIeSGSr8omLcv7JrC2nCoiDkj92Sf9wa2mHsyOOhw
         SwITqZ4+W28wDvujOKCdHWrdY5e9cZIzm9atNbZwtH74D917hn0GTq3/G/7Rt1vkGxQ4
         OdsYi6C6YwSF478JZswpgDAUGVD0AV+arxxCuasZHGe3JrCFMpFfL5QxSvqXobR2g/mx
         aj8wccUswLTr0v5hTZmLWD1rvZ9QYKLV9QDjEo35WaKJiHZiMGM/zlcKc/2xaDbzRbus
         OLSw==
X-Forwarded-Encrypted: i=1; AFNElJ9CgcvHOSsK0SXidif4ebaB1h9Qw5CAqKFKOROo4IMyKzHnFj7n7dNuXS63DWjbYuJyPY1lO/kHK06Ify8d@vger.kernel.org
X-Gm-Message-State: AOJu0YxVMw7yAFt1MjS7rp0ZVT1FSzhAIRyM1Ip6Xg9AUnkWF+ccmECK
	EzmwhjtjS912pWTuuBYGNqw3hXqR6XuTRXDzFQUrI+Y8MU1GrpZY1bLFGb9eVW8J6lhCHrPI+yH
	0PQgFJdNFRKkB19NbOlqyKY/Oa9W8lXYbJKGH+BDSXwZTXJTI5kcj3wcxy9IUQ06OZ1f5
X-Gm-Gg: AfdE7cniFQl2iYF0N1QApq0ud5Zf1kxAMw8nNlo71vH6ZuzUNZBPHgfaqAf9C3HdK42
	DJ0gizXF5i568TcrHimdw0c5GuFCnXkbvb+b6kNdfQh3OOi/NTme7SgNQNVEAEGsyUlem81bCz5
	gdnW+JqhKnCqjigzL4D2Ck7Dm0pBcjgXt1QjThCYjfDqMN7trvcMp4tgByBNGg/JQUmkWGV/Pt9
	dJabpKXpUO6QFU512elvUeHxMEhWz8XFhoFSFv9PySq0pLv1AiDdi3CBGyWqVkZEyawaaj5S4tl
	Se6MmmEvsX6InThtDQLHw0Q5vLuzi/+0GiZmq/vL1trTZgRQFD0NV38/63rY/yoB/HGhAA0eltJ
	kPpSng67uHdSJ2ESsv3+bJTJEuraL0kThbOw=
X-Received: by 2002:a05:620a:6781:b0:926:e8e6:3c28 with SMTP id af79cd13be357-926e8e65d56mr123258285a.7.1782232572829;
        Tue, 23 Jun 2026 09:36:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6781:b0:926:e8e6:3c28 with SMTP id af79cd13be357-926e8e65d56mr123255785a.7.1782232572407;
        Tue, 23 Jun 2026 09:36:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69555c45sm943642e87.36.2026.06.23.09.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:36:11 -0700 (PDT)
Message-ID: <45794082-0c86-416c-a2b1-76ab4f20d82d@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:36:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] iommu/qcom: Enable clocks before hardware access in
 qcom_iommu_ctx_probe()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-8-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3ab602 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Yd-jd7UEqWDYs8h9-TIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzNiBTYWx0ZWRfXys3TWmPs41sT
 JwEcygsKQstgNb2I50FoDTV4AeHQ84nsaHdvgXcKdFatiANCxnG9Uai9TZ8mPp4zDjaH9feLL5r
 ST8+dwRfImatALo2zr4VejZtSW+96Hw=
X-Proofpoint-ORIG-GUID: IIn6RXCCCY0qZKSovbIPwajr2XherICp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzNiBTYWx0ZWRfX0AAqH+s1cjvr
 p8KPLYFNxdUKyqrP1UNuIS7VmESVtbS3DcN0BwfD2S96uNujn+8sy5ZfYaONrgcVv5YNC5c1AXY
 sfxBydA6lOxDAanKK4jtdCaLdBWVKzxaj8sbzzAnYYyEKPxG0B2IrZVH42EdiTDNkAkwsCGyj1e
 qmP78MoEe2q6ii0aa0rkybHlNjH/+dwPAKawTGUdgYaIC0X8f1HB1tFVrS+EASwyuqExM3sQKuK
 mbWhCALDO1/qXubPBny81TCLMlsUH021kApWMaDG6ePEM1JVonjHfQSQYHFyFLC0tIkx7ua0WsE
 rFEF7z5XjBJ1QqBpSNLDv8xFP0pBcTqIsa9E85GPWcKl+enie/zxwoJEZZqGGPGRlSbSX2vUxSJ
 r+pM0R7o/ysrEIwkCMKfOvd7aUNeSmN3XIhffVUqqDLjH2n7atlYXqgu5ZBW3e5h7OtC6j4KmOX
 lPHq6clYX7AC04NfoVw==
X-Proofpoint-GUID: IIn6RXCCCY0qZKSovbIPwajr2XherICp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114252-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A9686B8C6A

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> qcom_iommu_ctx_probe() reads and writes the CB_FSR register to clear any
> stale IRQ left by the bootloader. This happens during
> devm_of_platform_populate() which is called from the parent device's
> probe before any pm_runtime_get(). The parent's clocks (iface, bus, tbu)
> are therefore not guaranteed to be on, making the register access
> unreliable on rebind or after a suspend cycle.
> 
> Use pm_runtime_resume_and_get() on the parent device to ensure clocks
> are enabled before the register access, and release the reference
> immediately after.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

