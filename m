Return-Path: <linux-arm-msm+bounces-104601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LLNIuXy7mmL1gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:23:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB74746D33D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B4E73009B03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 05:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33AA2777FC;
	Mon, 27 Apr 2026 05:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpFZxH69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgiTiEN5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F84B25EF9C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777267381; cv=pass; b=e15SyaqDtyO4dK0YQqnWwNx0DnEIW4l9vUUuTlU1NoYDvr+zxIINnfhyfKuU0OFO6owhHvdJ+YbzQmWXMBYdUD2Rr7nqnua8GlgaRT7cyvcLH3RxcaSGF+ZKIkMiVe0NMCUP4QZ3Wes3z4XA/XE+WI51lVwJOYacf2RahaPoiB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777267381; c=relaxed/simple;
	bh=FCCIzEAxvmMIo9XQqcf5NAacPB9XVAuaixKmKxe7xhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYAJ8c2S+z2Uxgn8cZZ/d5FC1FvNvUkA2btWRx7FUD1/cMt2MlooLGqMKWzWZ3b//VCEyQqvDdXhuqwy1mvYPCeKebG88ElYRv9kld3xGSTeytwZkSlGW+uNjte3Kk1kIJoaZVNAMAdpXndoffAfGAi7Yw+TMbd6Oq3JyWpf7tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpFZxH69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgiTiEN5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R2jMZv2883779
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vfxgt144tRHjc7efN91/NQP+i+9F05EIrGQz84i14qo=; b=GpFZxH69ZdDJHPlU
	wfClCRDjGTr/ge4KTTjujRowDON/UIgk9NOvRsfeqmhTy17U96gWD9DRZ4L98Y9I
	UWfdqxWJUXJzgXiTJbz8cAAdZoevti5h0cjtJdbtBI4ZtIRoXabw/n/bGP6v3KX0
	X8FprSS6NmHt5ppMEv2jDCR6A0F0tWxv6zCuRg7ZlKeqFHVa+lJSTbvQkcwall03
	ldV6iwys2pmEFydBukjMpMXezp0INqB3JK9W6cWb6mPgUkr5mq+W6ke9/fx5JK1k
	cLLkRX3tFt5xBCI6fifisAaJeijD69GLzvq6NzkAYJcVVjaLWLrUByBc40tKJvH4
	7Z8kOw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya00d20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:22:59 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7a45cf7ff24so157574987b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 22:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777267379; cv=none;
        d=google.com; s=arc-20240605;
        b=NZYqENFNCV3kBUEuipF9+CNa9qcBpiFXfMyOGvNte2jqZyfMTQI/RN8BTdwU87DW/T
         prSLlYq2GUY+O1jRa1PtSzMwp2yalWWeFSQqANDFOEOce4ZD9C/hL78XWiTogTlEkHa/
         0UqXPihLzt84+1iPD2AKkbwNp8gScGcGbLR4JUGobZEtA5IXuhUVaW8iUhDByRgMGrhY
         HDD7fwhbR0z4lfusVk5PBcnI0rToKt54drP3gLqoGd9BlivH9j+Yp7kTHRgDzAT7DScq
         OwnzYZlb4tyhz+8pfRRB7GK8rpWV0ctuq9GquvatW0KDR1jJnLUgfyhc91NhkgRFOuI/
         7vcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vfxgt144tRHjc7efN91/NQP+i+9F05EIrGQz84i14qo=;
        fh=L2Z6zLb81VfxTFstFTparP6BTUospyGDPvL3CzHyQCA=;
        b=Mp5maIM5IdQN7YWegtXxvTfBy5bAeLWDjfRWP48yGIu/q9Hiyj1KbrAEyudXF7W6OT
         aoqctYcZZ66Ie1Swnn9usy/Hws7iTB9sn/CybIY0kmlIon30Bi+UG4dtv9KdWT8qTL5N
         Q0YGN62TC5M7kXx8PBNlfoIxlZhXWeNew7vjPb3/kCn6csuKlhoue55+Vl+aJt0qW9gd
         qOzvvLV9P3/YzIr4+nvQSQSbsEvo2ULzqzna5DGmxRNn/07ZxG4W6qtZce3BTV1UqKvp
         QpEYaDjb2+817zZnImqv+fcmORou/6w2MHl6BE9T2Pirhe5t0tvqktoxy1EmhSm1rFGj
         7vJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777267379; x=1777872179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfxgt144tRHjc7efN91/NQP+i+9F05EIrGQz84i14qo=;
        b=VgiTiEN51OEDyPQPQwRxsrps7u4pBNTQqAuWxryBYu7oaA0iv9IKWA0e5M/b1FjZz8
         tbp69O7aeviNPe0h1iWSGJTxIMjoERzFvw/KXUDAmKaH/nWHLilze1M4lj7GyaGecwsA
         J563+qiALxX+Qi0fOz9LMqZSGbFtdJXvNdQPh+8sgyqlPhAbL5576WlYJuXX592QtjMI
         INpW1KRUYhr5Yn3/pwLUgEc6TVsJ92d3kyDtjjw/oHW5mv6zbczRk7Fwg2ndDQ9qlLuU
         DcOXVLDnzposTOUSH2PuZJ8YWyn4GbHEEuezBoJ6bURnn0DH1937fpAjEkT8sY1B61if
         ZRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777267379; x=1777872179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vfxgt144tRHjc7efN91/NQP+i+9F05EIrGQz84i14qo=;
        b=RWi2KZHS1i31F0mVVkvfzOPuDtMNc4wRczeHlN4PAi9GePYz0OO7b3tgr0EOlRkHZH
         KW+aex7DzRINEjFFeaRox3VpQAaszmhL7Z2H9WECErOS6Q0VMXFIsdRaOHgO5DT7Tky5
         bOHyHok9owlaDnzI0Y1DCtM/dX6a9SQr4Lz+UH3BRHV3KAWhG5QNG3bFxzlvCNl+IQ3i
         0Yt84Cqzjh+V0SNf1m+xLwA+LSPtcBfW76g3u+HhTtiIuvTU211+rI2+tv+dR8YNIl+W
         addfsT0qJezy7YotV3oXa81BcMd+7eVgq8fsz1wZzOWWNBwrf2fMcLVIlsGtltGU/7/Z
         BwkA==
X-Forwarded-Encrypted: i=1; AFNElJ9iEbrgyJC/Za/Ol74pR4NaQZhRrYT0xmYEed9hgOxOWVDy1SgP77V/jlTv1HEcN8ZvzlMPtGL1gGM2ZFKG@vger.kernel.org
X-Gm-Message-State: AOJu0YxgF3QywCk7wm4exTMzGeB85oM7WBIMwOWB3BENogYGm0qd0zg0
	raHYs1r5Vhsh6ov4cAPZSHdIo783Y7EhRehHCZgUufpi9F7vM1L9gFXXaq4eBiHbS4wuEWCIbws
	lpw6Nt80bafi7D+2li3fse0IDuwN2BaHlFl5wV8ShvPeGs0+flTJ9XkTv3PoWWDVyCOQTdHVXS3
	uSGI/o+k0OI8SVWjDzRMC3qrKmzWb7fITPqad4HFYLhs0=
X-Gm-Gg: AeBDievEqHQDbdcl2anZi2eLvXEDRY9kz0QW9latyoPlcLYxNlIIUSsKdJihXhzbpAW
	4gKtdGI34hRV+F65ci4se2BtxTXSSWZOGu6WE5+p5kAIveaJNb5BYfi+fmqoP0DyQZ7DTmPnol+
	0qjtzXFzH7MSli3tvxVh6m2AUDzRq5rSQD7RPM7JX3c+LEuK5rrhOLR7eWJvJ/AGMOsum37wH4+
	hseevej4t3PfLa47A==
X-Received: by 2002:a05:690c:f06:b0:7ba:e1dc:1b3f with SMTP id 00721157ae682-7bae1dc26a7mr342619447b3.25.1777267378692;
        Sun, 26 Apr 2026 22:22:58 -0700 (PDT)
X-Received: by 2002:a05:690c:f06:b0:7ba:e1dc:1b3f with SMTP id
 00721157ae682-7bae1dc26a7mr342619207b3.25.1777267378258; Sun, 26 Apr 2026
 22:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425031712.3800662-1-qian.zhang@oss.qualcomm.com> <ymi3o5tdtcojobsgeqn7mlelcr23bchuhi4jvh6fp6obi4siu6@7h2idqhhrolk>
In-Reply-To: <ymi3o5tdtcojobsgeqn7mlelcr23bchuhi4jvh6fp6obi4siu6@7h2idqhhrolk>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 13:22:22 +0800
X-Gm-Features: AVHnY4JgWEICSa-1BSwnoNXvSB-C1earMtMJzrPD4lG6tfkz6xMeZmSnO9yQWNI
Message-ID: <CALC2J1MVXkEQ3kK0m9bnaqXr8vM=fiVy8BZiFX+p9o3T_-DRHg@mail.gmail.com>
Subject: Re: [PATCH v0] arm64: dts: qcom: Add fixed regulators for WLAN supplies
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        hongcheng.zhang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: HSllB0355giLRiLCkmF8zjDczn7ypRLr
X-Proofpoint-ORIG-GUID: HSllB0355giLRiLCkmF8zjDczn7ypRLr
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69eef2b3 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=ogS9yFO0HJCNPYsXxisA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA1NCBTYWx0ZWRfX/JPTWd71MiY7
 Iq835vkCh9xSJR7WJ0/2QYMrSln5NKo6sQrNtgtmAt2EWHrz67C4T4oNuIjORdlewkNBjRaJHg8
 MTUIXfsM6O7HdJOfajjYwQhs5kJqp5xr5XmtOdbBcnQcGyJr7+4I/S/HX4IAkGEKGK9OdW7oLIA
 xAmINtcNoUclaOEBt8NogDL8PQF2zBv487vM4XrSVX4aahLIqdvbSLH7kRped15HBkb5tbUOR8/
 yNPgady4ou0L6zIKFyfcF0uD0vgwr4peZPfFenKuUrr+gCm6JtFnJGvJhaWVRNEGRbVr2E2MtBv
 xCKTsMHdLaoYYBp2sILMTqCTImMH9rh4Q3jm7Y57YMrkXPndt+8L+y4+FkBaTRaXdiFo0BoFPPt
 o/+NLsHdy+EM54Ie00EUshcWJ15ubBEipn2zi6fJ7bbFV5GPFirt1RbBjSYuYg7EK4j4y7TxvDc
 1eyop/naGhySWR950Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270054
X-Rspamd-Queue-Id: EB74746D33D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104601-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,oss.qualcomm.com:dkim]

On Sat, Apr 25, 2026 at 10:14=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Apr 25, 2026 at 11:17:12AM +0800, Qian Zhang wrote:
> > Add GPIO-controlled fixed regulators providing WLAN 3.3V and 1.8V
> > power rails for the Arduino VENTUNO Q board. The regulators are
> > enabled at boot to support WLAN initialization.
>
> Tell us something, how is the WiFi wired and powered up? Is there a
> correspoding BT, which isn't mentioned here?
>

GPIO56 is used for wlan_en, and GPIO54 is used for wlan_rf_kill.
BT-related GPIO configurations will be submitted in a separate patch.

> >
> > Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> > ---
> >  .../boot/dts/qcom/monaco-arduino-monza.dts    | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
>
> --
> With best wishes
> Dmitry

