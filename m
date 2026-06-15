Return-Path: <linux-arm-msm+bounces-113188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QfA1K/wGMGodMAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:06:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F31C3686EDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:06:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NAopAMyq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Vz1ZedY4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113188-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113188-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07E873023E1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE253F4DD2;
	Mon, 15 Jun 2026 14:06:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6290C3F54C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:06:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532410; cv=pass; b=jdCbXsKmJZdKytLryVj6TVHAc4/t+TZ5/awvUkemUnkA0GFZFT6UytUDEOcpQ6QaRbfoFXJCoTScEBt7exHEXb6mSETYL0Rsg7+Yb+kpB/Bx4dacKLUXE8U7RQ7xsgvKz4lKZoGYMl21NAsbs5tA6flPZBE8BBsWbjdInGZQJMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532410; c=relaxed/simple;
	bh=8mnu1b//x6MbL4l4Q/DwqLbKuYvGzUIUeTEEC+ZG/+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ViACcSb9HPHOJsxJ4U2rPEuJsz4jCQgtINAjeUQnajbgk2fAzNLOhiNxxcrbJvBgfsugtQKAby6l86zOb9mYaZyZLFRRzta7jjAh2b6fknth83Y1f71SbkNjb1YoaRKarXhDQFuy4NmFOOCej45rK8nbummhTZ9+8G5qYsvN5H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAopAMyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vz1ZedY4; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCaxO7384846
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CtAagYp3jdJuBGRK4I9xSk0WcG3zU047OSNI8ovVPTM=; b=NAopAMyqD6A9UzdC
	jKnHMCHqy+twvcfWx8oGsq80EyBoXVupG+xLD0Th3IUT0QaIXw5LJY1rKpByEj5w
	mHuiw3L/xkiRNkFs/2iz2Ofs76lfdGJodJJZLELTsUDutAQH5mLBTZWZrvivn73z
	nhwndYYHP7S/icyOdLHcifj0q1WfrG6YiztnI0R6062R9SG2ac62D+pinUfsKN4i
	z8buksGqTun1hEmQhY569AyRghIimg9rIYtlQm3klekMUlPmk5P65SpU9Ag04Xmw
	Tc6zGWb54jVpix/uXyhKryFgKac4EAifbLd+q3Qp3BaX7VHH40pbYt7jP3fj9u+b
	VT031g==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf110d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:06:48 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69e859a8d5eso4924793eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781532407; cv=none;
        d=google.com; s=arc-20240605;
        b=SftWSGa+uIwwYBqhWviQBM6vIgf6ikmFGqSVbV2R04EZ82gTgdA6zeVcqP7O6Oi5eE
         GhsgYL1qaj9yogBQHEs423EU5dUfBf96XXFWLPGkeVxFjBHGx74ALf7/MVFZLHb4PdLw
         dSzYPkJFf2i8aEnPCeOOTX3G/2C7jaLmibHuA9NolW3AM61c4cFF2U+pIJGR2FHjNZFc
         UVsLs8JXrGgVHrppevdMAKrFIqSA0Y/MM3Ah3CwQvvmma7NAM7sAkrSEqgkrvdDgJdIl
         AKKypvjksXi2cKZ7+VsXu9G+5M+YrrvPkhydcjpeRAktx+09Vw/Ec2/vgD32ykwebwiI
         htAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CtAagYp3jdJuBGRK4I9xSk0WcG3zU047OSNI8ovVPTM=;
        fh=2hRSHbc2A4YXcjiuuIP5aMk7oYu6Z0eRA5Wx0S83wK4=;
        b=On4Nb8TCghCPJ3KfB8kxYcv8RTKGiMyL1SgfmZMslAnEf7aO8+r+GXQrCOHzi1Jz6g
         qdUohMLFyyUiQarj6i/Xu+wk+X2/lTE7PRSdHzQXk6tUh0ElYLVVO/44hGcmj5nFd0+U
         s8ps35dBm4j+LvYUOPSx5ZICggbL9GUGK3uyCQ2d2XZPc4UXsEs2Up8ZQKQqG+KiVSzn
         x2dshHU3mN4EgFksAcgFlD0Izj3YV8euW81JxM5M0ONHLiDl0dZ2U60K7r+MeFLoEytK
         h4ws21yZgz64FAFfqtqzBGUiktR4A0ms1F4R3ZUb91t6+v2D0mXyeBKWsCruy3YXVWrZ
         fPPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781532407; x=1782137207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtAagYp3jdJuBGRK4I9xSk0WcG3zU047OSNI8ovVPTM=;
        b=Vz1ZedY43YDIZdseWTMdQWXAkSpXyv41cRBf61cF1iRPuiYbpif5jLtTgDTz8G6/u8
         n5RBkx/lJuFHXR6c332UjV1Dc31U9NlXd2QEbaYA9voPtmED4vCjiv94i6X5FPbDne9o
         qoEeVqem1gBKPQv9LSDj15By/IeyfI5A4yT5WzCd2OYPQcPDOXsnMH8BNGASdi8hV4ca
         Myli4add+XRb5D9qO9GSqmumsctKlKh8FY0IIZp4+eVoYxcav2ahSknd+XkcVoZKp6k4
         Mg9QNVxnKJj1ZfHfRfWZMFPYGUKx/UDlX2nMosRhho2DU9r6BwJ3uNBVURHkbKhhswTq
         wHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532407; x=1782137207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CtAagYp3jdJuBGRK4I9xSk0WcG3zU047OSNI8ovVPTM=;
        b=U+5uiyLqqGzrVmznsmHkz7Qz9Bwsj/lnFuSc2vKQUVi+P3XzCeJ2LOPDc+G0A/LfV5
         cb4cs/xme//ZG/n0Vv1tTQWqMgQA6N/BY645YSyK6suIPRacqr/iS1pCVX/gjhj0rJHe
         ssFooYnib4492nclv0Zm5cMyD/Mh23ZQD8VC8RnRHq2Q/RgED0lrho2qVOnB3mkysprz
         AUDKoxYD2Uo8OXH1sMg7IqgT3sHLP2oLscJSiBlIqMcmrqKNkQEM/1gphpM7WM3VLaY5
         NNyzj25mElVCvMfeou8QGVa/SI97+StzMysUCt+r7IXV8g2B/4jfNv5c68h70C/l2IqL
         IA5g==
X-Forwarded-Encrypted: i=1; AFNElJ8bFz5REQpztFhuj3QaP6Jbtd0Ikc/kBVsLF7m7gKfYfTOWBklWUxR8uteL7mVh/T+4ZlhJADXArV8eu3F5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw1spodo+skrknEROOGmYAOKguY2PH4P8fgfyrJ80s/uCb9mIV
	2u3ou4J0tbUrUbl4bI4LUoywGS50SVj0jXBoInKRdsTvh3I7vFZ7oFPXiJlw5xZ8UxNG1MPw4Py
	GWSNGJsBvRmw+eFw1LCoVmzniuq196aVnrXdnE7ySTVy+EPw3BhtY8OaHDwa78OvWCVf9lh8XK2
	lkX3IFMCC8s81AieXmoekCBMTb7f5NuFZm7ZV8tMzuZuI=
X-Gm-Gg: Acq92OEyfMfZ+smUddMLW7v77X2oRQIN/rzu+p3r+w1Dpv0BQ6ioqy7QzsWNC5ZHJuQ
	fk63F4lu7pyPQuwyu+5Y/glAKp7ixcrGx0j5m9aBrHnC4vQbHic8qREYnXZPufuf5xBbjzp6dgo
	hidX994/PTnlHAr1Hn5/jFo+lRMaO1C+CmANq9/7RsQ+0rIB7Jauq00T8lErWsnjkZJ0su6IlUf
	4BxlH6mIx3Rec/X0wi2vSI3vVNUXM+ModqRRu/WVcvxx00pzEEdXlaGE8Lf+V+1Ah3FR1mz+X+3
	Q5SD6xxtjQeF9tmTzVW+eM5emj8dWAL6v91087E7HfjdxNPy
X-Received: by 2002:a05:6820:a02:b0:69e:158c:8998 with SMTP id 006d021491bc7-69edc74ba26mr8704358eaf.38.1781532407196;
        Mon, 15 Jun 2026 07:06:47 -0700 (PDT)
X-Received: by 2002:a05:6820:a02:b0:69e:158c:8998 with SMTP id
 006d021491bc7-69edc74ba26mr8704315eaf.38.1781532406716; Mon, 15 Jun 2026
 07:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
 <CAFEp6-2-n1L8rLv9zV142D_Q7io1G1ZuFgLHowsf8sObQt6iLw@mail.gmail.com>
 <aivBcGQgeKGW45Is@lpieralisi> <9a2f95e1-f01e-4956-9e84-23f0a5f26298@oss.qualcomm.com>
In-Reply-To: <9a2f95e1-f01e-4956-9e84-23f0a5f26298@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:06:35 +0200
X-Gm-Features: AVVi8Cf8pitrTp7zxl57WdsyeqAZVFnmJNxiFVDQF8HHco4mBWZB6R14se962UM
Message-ID: <CAFEp6-3dC3mzYdB6imB9evgdK68fZjDER5uJ4mEC7a1F_SEGsA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add psci_sys_reset2 reboot modes for Qualcomm boards
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xin Liu <xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a3006f8 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8K5-RUECaDmC9v1tkEsA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: OGugE1NYTMab1Ho27uWU3SUuIolsGDJq
X-Proofpoint-ORIG-GUID: OGugE1NYTMab1Ho27uWU3SUuIolsGDJq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE0OCBTYWx0ZWRfXwcjoGynYPnP4
 S/tE/Wt15bxNG76AFBqSLhdkM9518TncSICGQpmUtXOFlt4dpzWf3XsjsYqsjfw4OhUUZZdAlGe
 oUaonV5h/gxA7jdLKWWsGr4e+kyueJM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE0OCBTYWx0ZWRfXyeIMgC1GvKmc
 mlji2bPaVbM4h6vLEEg8sA2cTJMZVViYM/WB8vD96goxnueUAIW94LuTIwUfcXCdGvaMr38L2bY
 pQMlkQWw1exfPk36Y4DBd4k772DNkknBcfX2HLM1xRMmqjlvCrayIotPBszKClWcWkDv5JlrtCa
 1EEQFbi6DbwJj4Vvk/eP4NBq/HOo4WLwwV/5AsBJ/zRej1jSSgE7/HdfDB0g20xG6xB6gfGzkXs
 y7PDK/mpv14UwhgAmVAoJfrWToAlsgOoJb2+01F7tpIFuZoMnwlMwbGnoBsr1ENM1RfzDlvroup
 sFIujCmdpLkOcEVqrzecOUpuYDrx5mhtt/NR1AAvOIbI+iZyGWVuvnr2zyR5N0qB70eBEa2Scn8
 p4APNvZ/n80KavsBJaGVLR5IY+lGax11x8yYUAgn7ck1GnTgBHb9u6w6g/13DGlcKPsRzrUyYTv
 W+Oyc775MGl+RaHB6iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113188-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shivendra.pratap@oss.qualcomm.com,m:lpieralisi@kernel.org,m:anurag.pateriya@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xin.liu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F31C3686EDE

On Mon, Jun 15, 2026 at 3:09=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
>
>
> On 12-06-2026 13:51, Lorenzo Pieralisi wrote:
> > On Wed, Jun 10, 2026 at 02:57:19PM +0200, Loic Poulain wrote:
> >> Hi Anurag,
> >>
> >> On Fri, May 29, 2026 at 4:29=E2=80=AFPM Anurag Pateriya
> >> <anurag.pateriya@oss.qualcomm.com> wrote:
> >>>
> >>> Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and
> >>> kaanapali based boards.
> >>
> >> I would like to highlight that when Linux/EFI is enabled, which is a
> >> common config, efi_reboot is used as the primary reboot path (see
> >> machine_restart).
>
> Yes but, only if EFI RESET RUNTIME service is enabled by UEFI.
>
> efi_reboot(...) {
> ..
>           if (!efi_rt_services_supported(EFI_RT_SUPPORTED_RESET_SYSTEM))
>                    return;
> ..
>
> >> As a result, the PSCI reboot hook is not invoked in
> >> this scenario, assuming Qualcomm firmware provides EFI runtime
> >> services.
>
> Currently EFI RUNTIME RESET service is not enabled on these firmware.

Okay, if the EFI/firmware does not expose it or ignores the reset
call, the PSCI hook will still be reached successfully. Thanks for the
clarification.


>
> >> As a follow-up, it would therefore be beneficial to also
> >> improve the EFI path to support such custom mode(s)...
>
> Yes, and potentially linux should also have some control, if it wants to
> go via efi reset path or the PSCI reset path.
>
> thanks,
> Shivendra
>
> >
> > I have not checked but we should probably put in a place a way for user
> > space to check that PSCI is _not_ the reboot method that will be
> > used, lest it would be allowed to send commands to the kernel that
> > would be duly ignored.
> >
> > Need to go through the whole thing again before commenting any further.
> >
> > Thanks,
> > Lorenzo
> >
> >> Regards,
> >> Loic
> >>
> >>
> >>
> >>>
> >>> These DT patches depend on PSCI SYSTEM_RESET2 support introduced in:
> >>> https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-re=
boots-v22-0-28a5bde07483@oss.qualcomm.com/
> >>>
> >>> To: Bjorn Andersson <andersson@kernel.org>
> >>> To: Konrad Dybcio <konradybcio@kernel.org>
> >>> To: Rob Herring <robh@kernel.org>
> >>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> >>> To: Conor Dooley <conor+dt@kernel.org>
> >>> Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> >>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> >>> Cc: linux-arm-msm@vger.kernel.org
> >>> Cc: devicetree@vger.kernel.org
> >>> Cc: linux-kernel@vger.kernel.org
> >>>
> >>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> >>> ---
> >>> Changes in v2:
> >>> - Fixed subject lines.
> >>> - Link to v1: https://lore.kernel.org/r/20260529-psci_sys_reset-dt-ch=
anges-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com
> >>>
> >>> ---
> >>> Anurag Pateriya (1):
> >>>        arm64: dts: qcom: sm8750: add reboot-mode support
> >>>
> >>> Xin Liu (1):
> >>>        arm64: dts: qcom: kaanapali: add reboot-mode support
> >>>
> >>>   arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
> >>>   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
> >>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
> >>>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts    | 7 +++++++
> >>>   arch/arm64/boot/dts/qcom/sm8750-qrd.dts    | 7 +++++++
> >>>   arch/arm64/boot/dts/qcom/sm8750.dtsi       | 2 +-
> >>>   6 files changed, 30 insertions(+), 2 deletions(-)
> >>> ---
> >>> base-commit: 6ee02bbf328be8a8586487e3af73b65a906cce58
> >>> change-id: 20260529-psci_sys_reset-dt-changes-for-pakala-a09fc0e2a8a8
> >>>
> >>> Best regards,
> >>> --
> >>> Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> >>>
> >>>
>

