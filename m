Return-Path: <linux-arm-msm+bounces-99338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JmcF1VnwWliSwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:16:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D032F7D6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EEF8730F5E5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78BF3BC693;
	Mon, 23 Mar 2026 15:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWMRkVy9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFR1Qk5H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D136F3BC67E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279916; cv=pass; b=F1zvnU6vEyg+GQN19z/2XDs/945t0attU19QYLfvCBAnhVzMOIAOu6ollqjyYH01dEJyjg3jgXXyvDYroG4iP2Mg0wRD2WFqpPBXmx/dPBobGFe6pxBq604UJBMgwtYrhqnXskBnzRgUu6jHa5BJhc/1c65xmmzX2yu7OrC4Kj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279916; c=relaxed/simple;
	bh=hA3vFGi0xhdHolQ7KYohzpQJLeGFeYhby3JWJQkk+8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KP05CpZqYq/dI+pf6rYrIDX+pjHsC4+thFNWp27TXn3eTL/LlkXnPPQgiseu2JNRM4o+XG6ZEFGVKXBTMDctSFt2rhBmTHBDwaXMlqpn9ObXtcQxArxOTtgZLMaXvqmQHOLyP18V8a5kSj4fcwk44vIKjQgeQBnMpcIalThwckw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWMRkVy9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFR1Qk5H; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGWQm600276
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zooEQK8t/2ouQC6EjzFMFIoTYfHyS+lgB7201z+qAFo=; b=PWMRkVy9FKnDbcGG
	UhJu3lRdkmzlkfUjxOBYRcNn4TkHR4r+b8X9lZjv5stnabdPq+ftpBX7pfQlxOAJ
	aYgvaFSvFLb50xCM6xIrl52XHPLXrBXu+GZCTk5K3ff78RydAYoRCPgkC3FN5akE
	RyFhoxXhSYBtS+jYEnfobCbk2NTCASe1xBs0Co/N0raiGlkakk+cij3bgqBT4B7r
	/eKpl/slj2ALQ3RHr8Vxf4MqtKFPLmqSwKHibhlo3Eno7mZr7leCKvGfYkcjGfG/
	2CG+MZNBIquXJec8MS3i6HuHyY/5gPfMf2sCYHuLIHCsBEDWrw4jLpLE2IEYnO6S
	n4gPig==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkrtmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:31:53 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d74be44ccdso40540490a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774279913; cv=none;
        d=google.com; s=arc-20240605;
        b=JW0s4ZqMQCkOJ2192Ith7Cnf5WNDMmCDWWrwXokoXhpjPdf96GqTKVwQ903srSdZ2C
         bJY9JOIniHY7W9U7Xv52M/ZXrYoOlzLOk3Ya7gfI/ywzepNYPR9Kv61cg5bY5PzAZQxn
         AiyWefsAuDXPzOhP9GwHNTBajNprx65DzjVVa7D1SoqK3TzdcC4oYl2i9g9zxm0iXn9O
         mTI2dTCoQQvPKM1YgfBI4djFyoxI/hNcktOs5z3ryRIqQpbHluq3zBSNFZHPPytvIX8s
         I3Aa7288uZj4c/Ivuk5ijDBx1di9HmiejVliEsZySXisLyHQgo/X5kIZqMuvVoKHaBq6
         3Fug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zooEQK8t/2ouQC6EjzFMFIoTYfHyS+lgB7201z+qAFo=;
        fh=Z8orAbPczFWjlqa5RP4MtSt6ENs2iNlg/Tevlh1jaXc=;
        b=AzQQ8UTj/mGBgfeWPuov4tpq2DSIae8X0A6VUXWXUU9Fddbg/jxNZGGlg0PM/9wTEA
         L9EYIeHrCX5XAFU4nVLO/FXJAMu8ztO0D2lr2CClds95DrAYN8s7xb0KpdLN8rinBi2l
         DL0gaW0s6FYjcuRqsPRIW8vFlVH2TgFNJv7GLI7cVoNQy+5lhJr+QF5unIlFOBaSvG/y
         KrYdXDmHDfRaIfSgL9jEPODvyfs7M0fWsGx03mL4+J9afpLB0hnZZW5VpNslSjhtck9x
         XgvwhoxCJ9u2GKlUaIMNkEomoi5H2CS8VHDCET+KHCCNXNqBLkN9vVbwGsAPkbwQMF9r
         BW6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279913; x=1774884713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zooEQK8t/2ouQC6EjzFMFIoTYfHyS+lgB7201z+qAFo=;
        b=MFR1Qk5HS0zhLPGH+Sh16TWHmGL06yvKlVNjyp7BQ76O4A3TLAPDcOp5JeGt2xSmmZ
         Elxm0m6KDhYlVe8Mq4WeDTPkknLeO4tVqBo7aeUVWwjP7ahNmGdKloSuDz4+FOILs46P
         RZ+14VrzVfzLydGPkT4p7Xamt2eynHs7E1mt19F1zE+OFx9bi+sPhQxR+INugsHd3OpP
         vG86Y1w7I3VMdZ4/5MbJocNQpWmV76ocFfaz2n6oDCKVHHB4iIMQlCKQopcccobgmHV8
         hYHRYxNrYWWwjV57BU7czYAd9Q7zPiN0gXwX9hFGecuFLCYpGZErYpxv+QaW7vB6MIPU
         6joQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279913; x=1774884713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zooEQK8t/2ouQC6EjzFMFIoTYfHyS+lgB7201z+qAFo=;
        b=ksP+2h3gnZasU8vGRVkMaIZ2Nh/tOxVKyhkGHLMjJA4u2RL4eEMufLupks4W0xdSSy
         6INPMq4dr0We5aRHtzVhZLoOsl1EQtdFA7yXoVsCjFYUVITzFAav67zk/TfFlM5cMTNZ
         amFqmOCTgHssg6vbQXQNOWQizJsnzJ0VJZFzfZAkgNojuYX/k/jHSr/bw1ZgTeNsJ4kd
         cVAyiSfdoYsU0w8JFq62U7RzvLxDx25Mt3/8kfxwASPZW6nvkkEohonVplZMoVTMxQRA
         JpLoBZ4TmewY4ZSM2YOixGDDFS6ZW/FkDlnt2Fb74xz1wRezK36nm6ODcfZMWLhSIAGm
         O+sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXynkr++diniZ6C13h707Yov8U+7V9pejIXKUdoVFri6sJO2p9bh68jeqdGVRxNyo97jCnHjvMwWMlHk26D@vger.kernel.org
X-Gm-Message-State: AOJu0YxEBouumQEIx3GVoSyRJ0tGajlF/XaHgE7SkIxK1XZNIWKS4j1x
	WSNbf5IJk0tmvxuX10zwfhkAaJO5vsKgnjPYN+5K75a+eokjAahBn4JP7Iuysbq0KEkKHakulwv
	TZT1ne6XprGGMfXL7mt7UPCXVV+OCMGNA7HS81RnjxrVxYjZ9OrxvyEKWe0njnhO2L6WJFWpXUO
	49vCPROlBnPbsfIrUOVGdx8I5wYnb4Bw284FhroUASAMk=
X-Gm-Gg: ATEYQzwwifRaFo31XsgibTDuWD8STAABE3k24ExekW7cEcWJzvYnW8EplhSu5dnSJKf
	YEBXEVMMsS8mUC3NiT2X2gnqpBawA7tssNNI8CACKMqpVXvuyermNMjHOSQZ0/esR2bTC28gKxV
	7h1GJ7qIDBRlDYxNx1XGxuteeGhB03/EeBckaPHbAYLmUOhlF1leodBHC+O9mR/Z69arlMWcIbL
	FZtS/QH93xiZsgIQAqfMmU3iHmV38t2R7Vcw8o=
X-Received: by 2002:a05:6820:982:b0:67d:e6fa:4461 with SMTP id 006d021491bc7-67de6fa4742mr4279326eaf.0.1774279913024;
        Mon, 23 Mar 2026 08:31:53 -0700 (PDT)
X-Received: by 2002:a05:6820:982:b0:67d:e6fa:4461 with SMTP id
 006d021491bc7-67de6fa4742mr4279284eaf.0.1774279912472; Mon, 23 Mar 2026
 08:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com> <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
In-Reply-To: <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:31:41 +0100
X-Gm-Features: AaiRm53xzoHHwgMOWwk6NTn-iPorq4CFeRRF7Y74-Fb_mjblKqErrqYsG34Xjy0
Message-ID: <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMCBTYWx0ZWRfX5TjtJ6ByaThc
 9qFedR1SJCm1W9tjttDyqNWxEQGlE7uj1WB2MW8661qhxCF/IaiL2/pfLaK1a5/cHubog823j5L
 Rb4oyFVRCESRDf+NeeNDHia6dnw4SFP8KYFDC3vbppdei2G5Sr0fnq5627pUmZd5RyJAGu8cy4l
 b4d03/ZsJ6zN7wJHQWzDm143BX6mo8k7+zdIcgVS3ZW7E7YJqJ+BZonhGuerELqVHJve0C2vs/d
 hU+MX9EMd06YPkw0QF0Td4pq0tXZPtD75/eXj5xtZ+HQRLNpq389f9JH4I6uOF3wSihJbh0kfGB
 IYimh/2xH5nis56sbIKGX00wgGfs6sJ3rcOBnyW4KX5Ha4h078DLihN12xkJi0RnGGUiRpvWjTB
 EHjWelDIFJGKvnNpP4GVYCTd84OcsGNdHYCLfUI3vpbz5bMs7UoljzHL9xXXKCRnbDlcN66ex0S
 mzNTozTT5tUpVaKVT9Q==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c15ce9 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=y-P54spXN9flPJXOXx8A:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: TUF5TUmsXHikeNt84KGibBlnuY3AEfpI
X-Proofpoint-ORIG-GUID: TUF5TUmsXHikeNt84KGibBlnuY3AEfpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99338-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 00D032F7D6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Mon, Mar 23, 2026 at 2:43=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 23/03/2026 12:58, Loic Poulain wrote:
> > Provide a initial implementation for the Qualcomm Offline Processing
> > Engine (OPE). OPE is a memory-to-memory hardware block designed for
> > image processing on a source frame. Typically, the input frame
> > originates from the SoC CSI capture path, though not limited to.
> >
> > The hardware architecture consists of Fetch Engines and Write Engines,
> > connected through intermediate pipeline modules:
> >     [FETCH ENGINES] =3D> [Pipeline Modules] =3D> [WRITE ENGINES]
> >
> > Current Configuration:
> >      Fetch Engine: One fetch engine is used for Bayer frame input.
> >      Write Engines: Two display write engines for Y and UV planes outpu=
t.
> >
> > Enabled Pipeline Modules:
> >     CLC_WB: White balance (channel gain configuration)
> >     CLC_DEMO: Demosaic (Bayer to RGB conversion)
> >     CLC_CHROMA_ENHAN: RGB to YUV conversion
> >     CLC_DOWNSCALE*: Downscaling for UV and Y planes
> >
> > Default configuration values are based on public standards such as BT.6=
01.
> >
> > Processing Model:
> > OPE processes frames in stripes of up to 336 pixels. Therefore, frames =
must
> > be split into stripes for processing. Each stripe is configured after t=
he
> > previous one has been acquired (double buffered registers). To minimize
> > inter-stripe latency, stripe configurations are generated ahead of time=
.
>
> A yavata command set showing usage would be appreciated.

AFAIK, yavta does not (yet) support M2M devices, but I can probably
use an other tool.

>
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/camss/Makefile    |    4 +
> >   drivers/media/platform/qcom/camss/camss-ope.c | 2058 ++++++++++++++++=
+
> >   2 files changed, 2062 insertions(+)
> >   create mode 100644 drivers/media/platform/qcom/camss/camss-ope.c
> >
> > diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media=
/platform/qcom/camss/Makefile
> > index 5e349b491513..67f261ae0855 100644
> > --- a/drivers/media/platform/qcom/camss/Makefile
> > +++ b/drivers/media/platform/qcom/camss/Makefile
> > @@ -29,3 +29,7 @@ qcom-camss-objs +=3D \
> >               camss-format.o \
> >
> >   obj-$(CONFIG_VIDEO_QCOM_CAMSS) +=3D qcom-camss.o
> > +
> > +qcom-camss-ope-objs +=3D camss-ope.o
> > +
> > +obj-$(CONFIG_VIDEO_QCOM_CAMSS) +=3D qcom-camss-ope.o
>
> Needs a Kconfig entry.

ack.

> > +
> > +#define OPE_RESET_TIMEOUT_MS 100
> > +
> > +/* Expected framerate for power scaling */
> > +#define DEFAULT_FRAMERATE 60
> > +
> > +/* Downscaler helpers */
> > +#define Q21(v) (((uint64_t)(v)) << 21)
> > +#define DS_Q21(n, d) ((uint32_t)(((uint64_t)(n) << 21) / (d)))
>
> u64 and u32 here.

ok.

> > +
> > +static inline char *print_fourcc(u32 fmt)
> > +{
> > +     static char code[5];
> > +
> > +     code[0] =3D (unsigned char)(fmt & 0xff);
> > +     code[1] =3D (unsigned char)((fmt >> 8) & 0xff);
> > +     code[2] =3D (unsigned char)((fmt >> 16) & 0xff);
> > +     code[3] =3D (unsigned char)((fmt >> 24) & 0xff);
> > +     code[4] =3D '\0';
> > +
> > +     return code;
> > +}
>
> This is a bug

Indeed, I will use %p4cc as you recommended in a similar series.

> > +
> > +static void ope_prog_bayer2rgb(struct ope_dev *ope)
> > +{
> > +     /* Fixed Settings */
> > +     ope_write_pp(ope, 0x860, 0x4001);
> > +     ope_write_pp(ope, 0x868, 128);
> > +     ope_write_pp(ope, 0x86c, 128 << 20);
> > +     ope_write_pp(ope, 0x870, 102);
>
> What are the magic numbers about ? Please define bit-fields and offsets.

There are some registers I can't disclose today, which have to be
configured with working values,
Similarly to some sensor configuration in media/i2c.

> Parameters passed in from user-space/libcamera and then translated to
> registers etc.

The above fixed settings will not be part of the initial parameters.

>
> > +}
> > +
> > +static void ope_prog_wb(struct ope_dev *ope)
> > +{
> > +     /* Default white balance config */
> > +     u32 g_gain =3D OPE_WB(1, 1);
> > +     u32 b_gain =3D OPE_WB(3, 2);
> > +     u32 r_gain =3D OPE_WB(3, 2);
> > +
> > +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(0), g_gain);
> > +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(1), b_gain);
> > +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(2), r_gain);
> > +
> > +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_MODULE_CFG, OPE_PP_CLC_WB_GA=
IN_MODULE_CFG_EN);
> > +}
>
> Fixed gains will have to come from real data.

These gains will indeed need to be configurable, most likely via ISP
parameters, here, they have been adjusted based on colorbar test
pattern from imx219 sensors but also tested with real capture.

>
> > +
> > +static void ope_prog_stripe(struct ope_ctx *ctx, struct ope_stripe *st=
ripe)
> > +{
> > +     struct ope_dev *ope =3D ctx->ope;
> > +     int i;
> > +
> > +     dev_dbg(ope->dev, "Context %p - Programming S%u\n", ctx, ope_stri=
pe_index(ctx, stripe));
> > +
> > +     /* Fetch Engine */
> > +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_UNPACK_CFG_0, stripe->src.f=
ormat);
> > +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_BUFFER_SIZE,
> > +                  (stripe->src.width << 16) + stripe->src.height);
> > +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_ADDR_IMAGE, stripe->src.add=
r);
> > +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_STRIDE, stripe->src.stri=
de);
> > +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CCIF_META_DATA,
> > +                  FIELD_PREP(OPE_BUS_RD_CLIENT_0_CCIF_MD_PIX_PATTERN, =
stripe->src.pattern));
> > +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CORE_CFG, OPE_BUS_RD_CLIENT=
_0_CORE_CFG_EN);
> > +
> > +     /* Write Engines */
> > +     for (i =3D 0; i < OPE_WR_CLIENT_MAX; i++) {
> > +             if (!stripe->dst[i].enabled) {
> > +                     ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i), 0);
> > +                     continue;
> > +             }
> > +
> > +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_ADDR_IMAGE(i), stripe=
->dst[i].addr);
> > +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_0(i),
> > +                          (stripe->dst[i].height << 16) + stripe->dst[=
i].width);
> > +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_1(i), strip=
e->dst[i].x_init);
> > +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_2(i), strip=
e->dst[i].stride);
> > +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_PACKER_CFG(i), stripe=
->dst[i].format);
> > +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i),
> > +                          OPE_BUS_WR_CLIENT_CFG_EN + OPE_BUS_WR_CLIENT=
_CFG_AUTORECOVER);
> > +     }
> > +
> > +     /* Downscalers */
> > +     for (i =3D 0; i < OPE_DS_MAX; i++) {
> > +             struct ope_dsc_config *dsc =3D &stripe->dsc[i];
> > +             u32 base =3D ope_ds_base[i];
> > +             u32 cfg =3D 0;
> > +
> > +             if (dsc->input_width !=3D dsc->output_width) {
> > +                     dsc->phase_step_h |=3D DS_RESOLUTION(dsc->input_w=
idth,
> > +                                                        dsc->output_wi=
dth) << 30;
> > +                     cfg |=3D OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_H_SCALE_E=
N;
> > +             }
> > +
> > +             if (dsc->input_height !=3D dsc->output_height) {
> > +                     dsc->phase_step_v |=3D DS_RESOLUTION(dsc->input_h=
eight,
> > +                                                        dsc->output_he=
ight) << 30;
> > +                     cfg |=3D OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_V_SCALE_E=
N;
> > +             }
> > +
> > +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_CFG(base), c=
fg);
> > +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_IMAGE_SIZE_C=
FG(base),
> > +                          ((dsc->input_width - 1) << 16) + dsc->input_=
height - 1);
> > +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_H_CFG(bas=
e), dsc->phase_step_h);
> > +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_V_CFG(bas=
e), dsc->phase_step_v);
> > +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_CFG(base),
> > +                          cfg ? OPE_PP_CLC_DOWNSCALE_MN_CFG_EN : 0);
> > +     }
> > +}
>
> So - this is where the CDM should be used - so that you don't have to do
> all of these MMIO writes inside of your ISR.

Indeed, and that also the reason stripes are computed ahead of time,
so that they can be further 'queued' in a CDM.

>
> Is that and additional step after the RFC ?

The current implementation (without CDM) already provides good results
and performance, so CDM can be viewed as a future enhancement.
As far as I understand, CDM could also be implemented in a generic way
within CAMSS, since other CAMSS blocks make use of CDM as well.
This is something we should discuss further.

>
> > +
> > +/*
> > + * mem2mem callbacks
> > + */
> > +static void ope_device_run(void *priv)
> > +{
> > +     struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +     struct ope_ctx *ctx =3D priv;
> > +     struct ope_dev *ope =3D ctx->ope;
> > +     dma_addr_t src, dst;
> > +
> > +     dev_dbg(ope->dev, "Start context %p", ctx);
> > +
> > +     src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > +     if (!src_buf)
> > +             return;
> > +
> > +     dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > +     if (!dst_buf)
> > +             return;
> > +
> > +     src =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> > +     dst =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> > +
> > +     /* Generate stripes from full frame */
> > +     ope_gen_stripes(ctx, src, dst);
> > +
> > +     if (priv !=3D ope->context) {
> > +             /* If context changed, reprogram the submodules */
> > +             ope_prog_wb(ope);
> > +             ope_prog_bayer2rgb(ope);
> > +             ope_prog_rgb2yuv(ope);
> > +             ope->context =3D priv;
> > +     }
> > +
> > +     /* Program the first stripe */
> > +     ope_prog_stripe(ctx, &ctx->stripe[0]);
> > +
> > +     /* Go! */
> > +     ope_start(ope);
> > +}
> > +
> > +static void ope_job_done(struct ope_ctx *ctx, enum vb2_buffer_state vb=
state)
> > +{
> > +     struct vb2_v4l2_buffer *src, *dst;
> > +
> > +     if (!ctx)
> > +             return;
> > +
> > +     src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > +     dst =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > +
> > +     if (dst && src)
> > +             dst->vb2_buf.timestamp =3D src->vb2_buf.timestamp;
> > +
> > +     if (src)
> > +             v4l2_m2m_buf_done(src, vbstate);
> > +     if (dst)
> > +             v4l2_m2m_buf_done(dst, vbstate);
> > +
> > +     v4l2_m2m_job_finish(ctx->ope->m2m_dev, ctx->fh.m2m_ctx);
> > +}
> > +
> > +static void ope_buf_done(struct ope_ctx *ctx)
> > +{
> > +     struct ope_stripe *stripe =3D ope_current_stripe(ctx);
> > +
> > +     if (!ctx)
> > +             return;
> > +
> > +     dev_dbg(ctx->ope->dev, "Context %p Stripe %u done\n",
> > +             ctx,  ope_stripe_index(ctx, stripe));
> > +
> > +     if (ope_stripe_is_last(stripe)) {
> > +             ctx->current_stripe =3D 0;
> > +             ope_job_done(ctx, VB2_BUF_STATE_DONE);
> > +     } else {
> > +             ctx->current_stripe++;
> > +             ope_start(ctx->ope);
> > +     }
> > +}
> > +
> > +static void ope_job_abort(void *priv)
> > +{
> > +     struct ope_ctx *ctx =3D priv;
> > +
> > +     /* reset to abort */
> > +     ope_write(ctx->ope, OPE_TOP_RESET_CMD, OPE_TOP_RESET_CMD_SW);
> > +}
>
> Shoudln't this wait for ope_job_done() ?

No, according to v4l2-mem2mem.h:
Informs the driver that it has to abort the currently
running transaction as soon as possible
[...]
This function does not have to (and will usually not) wait
until the device enters a state when it can be stopped.

> > +static irqreturn_t ope_irq(int irq, void *dev_id)
> > +{
> > +     struct ope_dev *ope =3D dev_id;
> > +     struct ope_ctx *ctx =3D ope->m2m_dev ? v4l2_m2m_get_curr_priv(ope=
->m2m_dev) : NULL;
>
> You have a mutex for this pointer but it doesn't seem to be in-use here
>
> Should this be a threadded IRQ with reference to that mutex then ?

We currently rely on the mem2mem framework to manage context
concurrency, and in particular to ensure that a context cannot be
released while an ope_job_done callback is still pending. This avoids
blocking on the global OPE mutex, which may be held for unrelated
operations such as creating another context.
However, there may still be unsafe paths, so an additional per-context
lock might be worth introducing.

> > +static int ope_enum_frameintervals(struct file *file, void *fh,
> > +                                struct v4l2_frmivalenum *fival)
> > +{
> > +     fival->type =3D V4L2_FRMIVAL_TYPE_STEPWISE;
> > +     fival->stepwise.min.numerator =3D 1;
> > +     fival->stepwise.min.denominator =3D 120;
> > +     fival->stepwise.max.numerator =3D 1;
> > +     fival->stepwise.max.denominator =3D 1;
> > +     fival->stepwise.step.numerator =3D 1;
> > +     fival->stepwise.step.denominator =3D 1;
>
> fival->index should return -EINVAL for index > 0
>
> should also valid width and height and pixel format

Thanks, I will add that.

>
> > +     return 0;
> > +}
> > +
> > +static int ope_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     return -EINVAL;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops ope_ctrl_ops =3D {
> > +     .s_ctrl =3D ope_s_ctrl,
> > +};
>
> Eh - I think you can drop this ..

Indeed.

>
[...]

