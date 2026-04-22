Return-Path: <linux-arm-msm+bounces-104120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHQnBkjF6GmYQAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:55:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E49446470
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 54E933002D12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A8223B61B;
	Wed, 22 Apr 2026 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXwboDxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjmNf5UW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4A33CFF72
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861851; cv=pass; b=WByMv0ANxNr0IFdpW/BRMJQEt9FCls+mzsT7Cs5Cz6o64KNLDL7f7VosIEDjuyWv8z8vq+QtW5nxGJX0BOGO6nEWp+Q6cnYpr6raoRoUXvxn+CZdyNkmUNXDXZYTfjde1w0UiI1mexvbfW82c6/6ArqpJQkEvE15unb8UyXaISU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861851; c=relaxed/simple;
	bh=zTwKs5hGUdQlYQ2nFSA3gLBymZuCdqbUIAUQGsQZJag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPyvGczO2ap/1e2q9qKzx1UldNc0XN3dbYbG7R6zgP5pj7ucVNlwp0mwuz2DxGNS1PpkOtLo960Ld9gy0RfFfh8x4G/fs3NNjxZad4iwhtxSc+QvoeILg7ckBX+Tz71QFXNZznboMVqhf0yhZgSLJK7cnQQ3ZMxc5zqmne2zFb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IXwboDxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjmNf5UW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M98t522063469
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uc8MWdVbaDQYCYOCscGpYZjSPzPMKf/2mf0l+rt3kM4=; b=IXwboDxDZ2dHc0Gb
	MAJ7zD3Dz3DzocKleVS/AR4XMoVyTHwXZOc2Q8g2k5En8O1YzFjRtqDkO+KUbKDm
	TfBI1CHddl0FJn/M7/OFoppbVRv9vDbu8UC6iMxZcY8lCMlimPDLg2RlEAiHTWZl
	naevnTPTTZiFz1CHOn/EwJZbFPZm0hC1Mx0xntFmkJQQOEG+1bfPC36I1rgbBU9r
	SWZtECMbKJjDK/J8vUmXNDhtc1h+WEBwiBVarUTAUVZS3d3eygATC+tIp35y8MPZ
	ImFMsaIUDftiNSKoIoVYK/IycuMjxb+jf6BdpNOmNM863xq7w06YUjJtPANsXAbk
	ILoDpw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhke8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:44:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca29dcd69so134078926d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 05:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776861848; cv=none;
        d=google.com; s=arc-20240605;
        b=TtotElvyDgVahTO/Tj515z7tn2Vr+TAtrn/TZNor8MQzroRbcetmt4/H1xz5cr/Oui
         8CtLYURS5BRSHjIM7/SqhQ9rzS9RWcIAaRuWNqTPNsyhYTU49LFS8DxkgEVsphi7z7cm
         WM2z/siZeV+PCLvMABzw1Pm2jd0wcOGe8rJN5k/0Eoh3aBtKIHB7Wzh0gVNeu/NguIhx
         sU6sD/0HpQJBV0G0hpRtP+KXuEDliG9cyVuzvmIdjP06q190+f3GT9Qw0Or2rB9uJX3A
         5F8Ul1B53arJ0+y4rHf1wQv7Xpshdy8sKQqMhaTAffijE3DRM0RprNsNdsFS2lszsRpY
         tcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uc8MWdVbaDQYCYOCscGpYZjSPzPMKf/2mf0l+rt3kM4=;
        fh=gF2aQ3q02Sv6prtijHFIlTAbAwv8BfgvO1ziOQHQRWU=;
        b=SQIZR9bnOqqg3KMEb2aRh6NJg7HSGFhaqZagcuwCj43NPA2/5k+/XUvQtSz8Mx3iCB
         roPiQ8dJfBYjB3FsYLDrUzp65+w5qs2K/okQN+rQbIzPxGHo1o8zeqg0xKP3Uw7kQzle
         sNtMnmwk7qqg+qrukVIKWHDgxfcRvq/tciSJka+j082AtcGFd5RUebHqNVgvR8tjVTm4
         PrPOt56ZrKnhbNy8Z2lw7W4U8Js090yKlrb7Nv9eiUNoyn50duwK0XapKaAgwneP8vTx
         CTeHE+iJqxy5tpbkUsqpMD/v1Ld4Vt/4P4j+G3Hy6sZLCQEXCv0auk8XeU/eJHh2aKCT
         /o8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776861848; x=1777466648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc8MWdVbaDQYCYOCscGpYZjSPzPMKf/2mf0l+rt3kM4=;
        b=PjmNf5UWO7MeqJPdo+QKXJl1CXfzbNGO1ppLl5U8s6M27XPNokk6xNcbneehHjW/Zf
         oeBJoeSDrA+INO4a+z3GR5675/OMhE5762mSao3V39LuPjQ/bini1XI5idnfkN50htLe
         U6RlLdUpFAUuvKh/hrO+i5m1ABV1a9h/cre8NSYGw0bmyq8rdxRj0wEhon3u5/ldPq/Z
         2IzZTO061oif58lTOyYuG5kJeDCkkXYIGIzVmqdg+fWscUOOnEGEKtMgK+KNmlkdG20N
         CVFQ8NeUeRJp6r8ZzqWAf/mK/HIJdOBTE+dWSh93tUuGGgyeiBmx8Fp6wXkJS/fDTNRe
         /CwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776861848; x=1777466648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uc8MWdVbaDQYCYOCscGpYZjSPzPMKf/2mf0l+rt3kM4=;
        b=gVp48cuKIf0om6aeyUGTon30FRuFTVFXwIww9iB/4U9j+HE8gy0fP8aAhcpN6dcOSF
         uHEdI+E3d2flyycW/Ssor9WK010V2wkn/IiYC3l0hCi5rE808ZWC31UFlejn2zbfrdiK
         KpcivK09S1bN4E9aZdUZj6ABPg8jAFR2ZsuRBlv09NfKcIJVdc063YDQIt7Z4/tGBLtr
         zi+NuwtaE7l9mEeoe4ln6dXdQ5ZabUEmoPgChpHVybMVQvCToGn0xDesTpEniyZ/dS0M
         peDEiDHXNi7QSP8snSLF6HAbN/e4O5u4957x8oyLywGBLuC0HLoWMKlYvsxsq9PFHzYZ
         Vleg==
X-Gm-Message-State: AOJu0Yz+3XPQeQS/GiMdOh0k+fujquMiyxdu84/1VgWtSgipHe9Tgdji
	TQNBEdv/tEiXAEtD+AJl9iHZCiMxp7rqgu/xohHivNr0pzC/vK8aTSq1dJp8aH9Sa0TjjZQT24m
	mtAOPs3M2siPxh7FMIYDhvhOCzQNEy11/PVAWCN3opfoByaiv/2z52luU33O4MYSCiDBImwd9+f
	IKd/3Ke2eax883Kx+kB0LhTC1OIf8c7GlIbJZJL2t/KtPJYf+3GeY=
X-Gm-Gg: AeBDievh65LQBhw4yyBwfEpYedYqNmFQXBbICTW3PYDe8D2SC7miyMENODb6YH5H4b0
	1Et4MUhBG9G6xMBDL0ABVFZQz5jTp80yhuQYaqv/bpQq40yJ0Fjax2J+3MOZ6OaVr6YHlIzCVIL
	dSRQVR3/zC3nm6MzESmV0A9ZDV86LxZhGYfm/AKikkot9/ZN0b86hXPvY3TUbNt08+Z9ZlytAm1
	zYU+N6woSQn3JfEfjQ=
X-Received: by 2002:ad4:4ea8:0:b0:89c:806c:93 with SMTP id 6a1803df08f44-8b02818d80cmr355012146d6.30.1776861848402;
        Wed, 22 Apr 2026 05:44:08 -0700 (PDT)
X-Received: by 2002:ad4:4ea8:0:b0:89c:806c:93 with SMTP id 6a1803df08f44-8b02818d80cmr355011726d6.30.1776861847971;
 Wed, 22 Apr 2026 05:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
In-Reply-To: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 18:13:56 +0530
X-Gm-Features: AQROBzBixNp2sGtJh_9mcdHIvilb_304EKA6TCZzHNk5W7rGeKgHetBKMgZyk4g
Message-ID: <CAHz4bYubL1b1h4GecZWk4uvPittJ72OsVOLWvfmSGMFGpH2gtw@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] Enable secondary USB controller in host mode
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: n7yGtyFl2IiKnBsrWrpFoQJuDX3sU6ZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyMiBTYWx0ZWRfX5TEmNBYx44FR
 34ys0wzs/YwxzZ4aKK5IhtUNIQ1o7s4dY/NU+dKSWKKe7ScQyh+/ArVI8woIMOgEUkB/H2gDLEW
 p3czyzl178UTODWuvRBmLjvMldIh/ZULuyowpIfLOSg75ngXsZoFcjuoCHkZ+TKAjhvh6BeZRr8
 oYpfn1myihIqHlEqvoKpUzUR5OcxkMbqAVhr17un2NAPcIbgbFWedAUsWuJZ5EMW2wNYgOksW8M
 tVv3/aUkgS1+iPANT1JwtZoFyDS65pNxChG2uK1fqG9CtyuoPXFAqXZZYcevD58ID2UMLbiwACS
 tGuz35v4sr7K1DdJMZluRqsHrFcIl/YCIhdrstrM5yVM8AtM5JkqS4W6Eqtf6QjJ5uoBazXwMOr
 a3FXq3SAh9vxX5KdXSBfnD7n/fDJb28H8V5Z36IXsXGsN+U2OvF4clROwUB5hMpAMF+alFJzXbR
 fv1O4k+Naapxj9Qr1Uw==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e8c299 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RfbAcnND_3HjLPHxiFwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: n7yGtyFl2IiKnBsrWrpFoQJuDX3sU6ZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104120-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 11E49446470
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 4:31=E2=80=AFPM Swati Agarwal
<swati.agarwal@oss.qualcomm.com> wrote:
>
> Enable secondary USB controller in host mode.
>
> Changes in v8:
> Removed unsed nodes.
Hi,

Gentle Reminder for reviewing v8 version!!

Regards,
Swati
>
> Changes in v7:
> Split Driver and DT patch for USB1 controller and USB1 HUB support
>
> Changes in v6:
> - Removed vdd12-supply property status for all hubs.
> - Added connections between genesys hub, HD3 port controller and type-C
>   connector as follows.
>
> GL3590 USB     HD3SS3220 Type=E2=80=91C  USB TYPE=E2=80=91C
>    HUB         Port Controller   Connector
>
>
> HS HUB                           HS con
>
>  |------------------------------------|
>
> SS HUB          HD3-out          SBU con
>
>  |--------------------|
>
>                 HD3-in           SS con
>                 |---------------------|
>
> Changes in v5:
> Updated comment description in DT.
> Updated vdd-supply status for other hubs in bindings.
>
> Changes in v4:
> Updated power supply property for hub.
> Updated details for all 4 ports of hub.
>
> Changes in v3:
> Updated binding properties for genesys hub.
>
> Changes in v2:
> Add Genesys Logic GL3590 hub support.
> Rename hd3ss3220_ instance for primary port controller.
>
> Link to v7:
> https://lore.kernel.org/all/20260403100753.3477925-1-swati.agarwal@oss.qu=
alcomm.com/
>
> Link to v6:
> https://lore.kernel.org/all/20260318040644.3591478-1-swati.agarwal@oss.qu=
alcomm.com/
>
> Link to v5:
> https://lore.kernel.org/all/20260122092852.887624-1-swati.agarwal@oss.qua=
lcomm.com/
>
> Link to v4:
> https://lore.kernel.org/all/20260120103312.2174727-1-swati.agarwal@oss.qu=
alcomm.com/
>
> Link to v3:
> https://lore.kernel.org/all/20251220063537.3639535-1-swati.agarwal@oss.qu=
alcomm.com/
>
> Link to v2:
> https://lore.kernel.org/all/20251216120749.94007-1-swati.agarwal@oss.qual=
comm.com/
>
> Link to v1:
> https://lore.kernel.org/all/20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm=
.com/
>
> Swati Agarwal (2):
>   arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary
>     port controller
>   arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host
>     mode
>
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 176 +++++++++++++++++++++++-
>  1 file changed, 172 insertions(+), 4 deletions(-)
>
> --
> 2.34.1
>

