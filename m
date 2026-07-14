Return-Path: <linux-arm-msm+bounces-119033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 20FsIgo0Vmps1QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:05:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1438D754D5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:05:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=beAKbhFJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FTc19aeS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119033-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119033-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3BC93022D97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5E2466B6A;
	Tue, 14 Jul 2026 13:04:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1624D466B48
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:04:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034270; cv=pass; b=J2lzj+esRrv6Fj1Oq9q4jtvM40F+qPDqmCQICDDprp+q1PZOJBIUqia/TSmKNlwfzbofCiyRgBB9w4x7NzWGOtFb6emXyzJc4jbIthSzRNfLCpv0TJEDQmbGXbGR5ltZ7hxUAEpK2dzThYrmE/WK0eiOUVziEGsdWgZLPSyKvBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034270; c=relaxed/simple;
	bh=/luk3Ez7jcbTKy8KcXNVXhgf0NBYtT6aBzAKJn4R7Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mR5GBVXubIzgp3qhj0f65ZCykC0IrQqLUq74bJt+PlTy970Ru5QqzfOM2va+M9P94602wrWaCVHAZ0gHk8q0mSmHJdNTnm4/SlGoJqR6KQz4cwFbqPAe7KfUp5CVvrs8w5hT0B3o7G7waxdNRmzhosG62ppb+ha/ksMlgZlijc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=beAKbhFJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTc19aeS; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBmnV7473944
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SzwHNQnrs5veaInk/Dsd5ZII47C1meWIcG3m36x+/ow=; b=beAKbhFJR6EXnpP3
	7yRIirxVRv+NhTKXlGHiMhq6/PSIDeJ8UhY7We4cwIkIEUIsf8Dd+kfA7xY07kwr
	iIjkSYwOFMABd3f9/hiDRfrkbMTIOfsYqnvKOWsN8IcU3uaNK1o9SkT5QS13q2bZ
	yHwhkclZPOxZVPWo+3SBxP2HpDEMMKMVCm+c0LGrl28HHLITow2JfkK5V9pa7EED
	dPTfZMZ8TRD30ix5iNoeWi21VpcdZc1qCxmZXi1GodPK7zfk5TeCXaGhV5q8e//u
	sfyqNoCKa//ZPhTJuqyTPovARmDRAb7RcHB54saxQUIi2m9x41uxZTaE5INQZPXB
	bUJwdQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq0a05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:04:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8b0a08d2so55741981cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034266; cv=none;
        d=google.com; s=arc-20260327;
        b=RSgggkzYmpkWY2EweAEZoNYni37lqy3LxcarrTVDc8CTZ3M/VnOvTtQoYSohZrpkHk
         xQxXBEcKR/OK1uEfYHQpClrHLdyi2rmQl5AWuyDyYbiV0URBdHsimdYiWawquPTGV39d
         4igugyQeXNzTpAClqACTLVJwEYc5M851ibkkmatj6PBzNIfg8+Wkbl+tXgYuXlKyRAJG
         6vLZn9OoV9jfTOmDnk5phMrXzqTauJLlT1poeY8JQz1bqvTCChSdc0ixZzN/OjM12EDI
         EhEA0h13KYKJ1Tz8YhidrqO93MfcZFuXzeblYtHEWsJtoClFGYPzmlzCVqRDRRESbFQv
         6FqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SzwHNQnrs5veaInk/Dsd5ZII47C1meWIcG3m36x+/ow=;
        fh=pGR3R96SHegxM4UBA/QkFr0ARvZrcOS542CPtGqotP4=;
        b=UKX038rLloKOq/rTcbfBJlMqJqYmEwbpKcOpDtsyHmjoEHa7pHgU+KyJVuWJ7/RCmz
         XCJZzjsRykf8l8xCf3psB1fh29BMwoLJKkoajnCyoIjZmA2ZJieIhMmCRntIdPfy0Qxk
         3cgrPppbbO5pit+VXOE55d3EFs8x+x0WPwI3rLrLHkxThbyQAq8ct95i7Ru4Avvz/H6G
         yHG5XsUtNQh3XLo9p1SaIvpGZRX/gDYERTvisJXHSMWRWJFs7nxIJfx74KctOPeV0hIl
         7bU689R/V0It0ZOli4GUmO59FG28SDBm1RiAdMdHaVZAjZB5RWWAS0ZguXd5EM1Xdl4l
         05dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034266; x=1784639066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SzwHNQnrs5veaInk/Dsd5ZII47C1meWIcG3m36x+/ow=;
        b=FTc19aeSqh+cwi+b0KxmwvAok2IxXuZ1NwYvHUmRUlAb1yKsrs2q3Xk55k8wrwwIOw
         WzTwpqJejpgPQ20E+eWvlS6/Por8Jh3UL2hzz75XBGXBOwa3dth2pZR5zYyrflXFma4L
         FZR8A+aDabNpPsJXGq38APg66kvychT4f4PsRlJjxgX8KNhu/PTN3tL8RTxVsowYfvis
         4Wc8ql76jpGrYVLsjeR9ZYp+JBHoO4gVaCN6hIn3nVxTVkd7jHpQEUs0YpHz2ElQoS51
         LJ399HqQtXl4f97OCpw0P1v16Ajbnth5WZRo9PI+194t7ih9aevwupByqfou3XUGqLVh
         CDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034266; x=1784639066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzwHNQnrs5veaInk/Dsd5ZII47C1meWIcG3m36x+/ow=;
        b=lSKgnBS2Tj9HWrOz+Xhuuf5bPSm5yqUUXRVVMXXHlhhNfqmGWfRiM32jHvOY+0ZWXG
         ZVdqy6apc2Iab3aq2z3qbfFTPnawrDoH27wDo8juiEs1FWnOnJ6Ybco2pV1h9jcGc2W0
         qoK3cIjyXBpCyyvGoUs5apk829D4Es3Bf7s+mEZnViEnB2WWzyj0iGzAYKiy/HGDQRNq
         NCWfoNKxS16VAb054HJP/3ImP61G/kDSbYIlcqvtaMDrY0NMtFRXItjwkCO2E4wH+O32
         JsqtKYKJ4NvSMy/0PnnGozKZ/WbXFUAeoU7yWRThsVNReyK6+msLXVfUOx+lufVoap1h
         UR9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq9qmJPWtT+obfkjPNHojxKEAIf6wgPDGTmqXGk2E1+0tfvMbC3hhHpvcOrikVjMCYG2Y9HeqjWHD78QPah@vger.kernel.org
X-Gm-Message-State: AOJu0YzPr8G417mRD5ZkWRmAx69XA+SQ1p9ZSbmdl2LJEnVfeaqdJl66
	1LWrXV2+uycfPpjskY11K+q/qf2Vp0eEl6s1w1s9UIip8OhBzqjvSoZfZmgPiMSnOsGUsD1+rW6
	+kphVSFr8fGqEmk+aoO3EbS/LCUXKXXfIrDAwMD4CQMQUs1JBbOtHee2rhIoLUG09oSlnJk4Q8C
	eryJtoCKNCAkk9SPSs+qyDlTSrEpLhxaOh031eekEuXMs=
X-Gm-Gg: AfdE7cl9QzCW2xXY+YwknUHIJZHYrrIN7WM3vmFJqveeBA+FM19R1wIW5Y8lVWbTWmb
	tVdTH/8h7pDlkrNFOMDg738+WtEyGIS1GzvzW47NVyHCWddRRkWfTqoovPxk9vz2Qst6cKS7zih
	VeOzETYzoT2EFBm9HvmAn7q9MT9pefGt8nYq0LoypIqYnr1vbkeppJ9MJ23/wiY0V/fV2g
X-Received: by 2002:ac8:7dc1:0:b0:51d:deb9:b0a3 with SMTP id d75a77b69052e-51e3c39c40fmr32444991cf.84.1784034265956;
        Tue, 14 Jul 2026 06:04:25 -0700 (PDT)
X-Received: by 2002:ac8:7dc1:0:b0:51d:deb9:b0a3 with SMTP id
 d75a77b69052e-51e3c39c40fmr32444371cf.84.1784034265302; Tue, 14 Jul 2026
 06:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231215-topic-mpm_dt-v1-0-c6636fc75ce3@linaro.org>
 <CGME20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55@eucas1p1.samsung.com>
 <20231215-topic-mpm_dt-v1-3-c6636fc75ce3@linaro.org> <dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
In-Reply-To: <dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:04:14 +0200
X-Gm-Features: AUfX_mxeevLMvSUnq3-LCE2rrh-wxPKfOm-OSszla6lQd2M8YC-0UB9URvbQZGo
Message-ID: <CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm2290: Hook up MPM
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a5633db cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=hD80L64hAAAA:8 a=KKAkSRfTAAAA:8
 a=izklIh3Dp5d2CKdXTi0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: g_TcTGAVRMTN5vRQOhqJgp4h71mpc0av
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfX2DytDPkGFWjA
 UIDZ9vj/pSpY+vRksNfjE7F/rwMHFrdOJoWNX6jbbByGMXFdMcRIfpzu92ACoxjOpPA62QfMN9w
 sf+tr18rQaq/m1K2EIF3pUrKeqEA/id/eL1p/CgerbvzVLge/8jtqWEwU5sbXS44lPlR+ivvoWC
 nIEaaGfrXzsnJIHsTHIiRFdXtT2Y+HA8GvLbtPBggmmtunbHgqdxlNAPJvatIeULpWLWsAqdKj6
 LVyNumUvl1eMsxwHiE9ZL4MI+D1KKgRyFv7VN6ffFMx/c7s9/1z2M1iy8dOkc+XOjAcQzS0kL1l
 aq3IWb6vddwHyf+tBCNVSRsyVIVRRVPKQNOF70jZuLvUG7sOwDFLQ5R5HE8PcK9D34n/yZPEu6s
 RGJpfyAjBhBpXmmnal67Thh5r3RJDfoKnWsT7aidSXrr/fZjjyjqZux5riFrxzXZVQ0udur/Ila
 EnlybWg4dAEMWOH3xhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfXxgUDFB4x0E3Y
 WWKXHzOzfjIBj3yv14E9i92nFo2e4OjBwYe8r2PdW/O/mjRnu1o3eIoqe2PEL7ZP+jp8sDothWf
 TFh9yK5Os7Zwprh3P31cJ4m3Ip0ZrcM=
X-Proofpoint-ORIG-GUID: g_TcTGAVRMTN5vRQOhqJgp4h71mpc0av
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119033-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:konradybcio@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:robh+dt@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:konrad.dybcio@somainline.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ulf.hansson@linaro.org,m:linux-pm@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1438D754D5D

On Thu, Jul 9, 2026 at 1:41=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 15.12.2023 01:01, Konrad Dybcio wrote:
> > Wire up MPM and the interrupts it provides.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 42 +++++++++++++++++++++++++++=
++------
> >  1 file changed, 35 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dt=
s/qcom/qcm2290.dtsi
> > index ce04d0acdede..0911fb08ed63 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > @@ -199,6 +199,7 @@ CPU_PD3: power-domain-cpu3 {
> >
> >               CLUSTER_PD: power-domain-cpu-cluster {
> >                       #power-domain-cells =3D <0>;
> > +                     power-domains =3D <&mpm>;
> >                       domain-idle-states =3D <&CLUSTER_SLEEP>;
> >               };
> >       };
>
>
> This patch landed long time ago in mainline as commit e3f6a6994041
> ("arm64: dts: qcom: qcm2290: Hook up MPM").

Without detailed HW expertise (still learning about the UnoQ), it
looks to me that the HW may have been modelled upside down.

The power-domain-cpu-cluster should probably *not* be the consumer of
the mpm, but rather the opposite. This is how qcom,rpmh-rsc works, for
example.

>
> Recently I've added Arduino UnoQ board
> (arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts) to my test farm
> and found that this patch is responsible for the "Invalid wait context"
> warning [1] observed during boot of the recent kernels when
> CONFIG_PROVE_RAW_LOCK_NESTING is set (which is implicitly true when
> CONFIG_PROVE_LOCKING is set since commit d8fccd9ca5f90). This shows
> a real problem if one wants to run RT-enabled kernel.
>
> This is because the above chunk adds the "mpm" as a parent power domain
> to the "cluster_pd" (in current arch/arm64/boot/dts/qcom/agatti.dtsi).
> "cluster_pd" is initialized as "GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMA=
IN"
> (see psci_pd_init in drivers/cpuidle/cpuidle-psci-domain.c, which use
> raw_spinlock_t based locking), while the "mpm" power domain only as
> "GENPD_FLAG_IRQ_SAFE" (see qcom_mpm_probe in drivers/irqchip/irq-qcom-mpm=
.c,
> which use spinlock_t locking).
>
> I've check and there is no easy way to make the "mpm" power domain
> GENPD_FLAG_CPU_DOMAIN compatible. drivers/irqchip/irq-qcom-mpm.c driver
> uses mbox API, which internally uses spinlock_t based locking. Then
> there is a drivers/mailbox/qcom-apcs-ipc-mailbox.c driver and even
> more dependencies: mmio regmap, clocks and probably more (I've didn't
> check further).

Yep, this wont work.

>
> The question is how to solve this issue? Is this dependency really
> required? Would it work if the "mpm" power domain is set as always
> on and genpd framework extended to support such case without
> triggering lockdep warning (it already has support for irq-safe
> device in non-irq-safe power domain)?
>

I think the whole thing just "works" if we make the mpm a consumer of
the cluster-pd instead, which probably also is the right way to model
the HW.

For "last man activities" (before the cluster-pd turns off), the mpm
driver may register genpd on/off notifiers with
dev_pm_genpd_add_notifier(), similar to drivers/soc/qcom/rpmh-rsc.c.

[...]

Kind regards
Uffe

