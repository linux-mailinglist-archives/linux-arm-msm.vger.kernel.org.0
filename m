Return-Path: <linux-arm-msm+bounces-81926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E6CC5FAE9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 01:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 092E93BA332
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 00:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1CF2F5B;
	Sat, 15 Nov 2025 00:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATeRIamP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtBMBGvq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF73E3208
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 00:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763165371; cv=none; b=lrtqYJThs9RluXEA5GX7adH1K8Z+8UD8n0pYgCAsPVaJ5PgGjSnb606madOiyd1YceRdD+qEoPnQIntmI6KPsDfwjKSvsT+EXHlJ/SMt9xOY+SDPUeRUcF3pIimSPrrUSnNxVjFe7K9C4Nu+pVGCN80YL1s1j1ey+Jufys8d0ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763165371; c=relaxed/simple;
	bh=qGMme8u8wX8pGfAq93SN47rRB3hlWOacyKSDU6WEoEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5owN3qu0bRPJgvossuEKv2Xe1YTnG671VJJFiX/SfEUfVK6gNh54DsSqNJTVj2KgWt/e84M8EWFhWHQtB4tx/xlKlWG/pite9r984MbsoQX4CZRzI5Q7ycSdTf6T+b80u0Z3l7pxdResnUBGX15Z5TyIuPtspDcLiCHj1lAnjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATeRIamP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtBMBGvq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEL52ME637779
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 00:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gOgdIilgQ+nfRmYrWcdIS21m
	8eXNtlIyO1doFbjh13A=; b=ATeRIamPfyxIrCw1BKTUKL9WLZB9gLHQEvkj2Jq/
	/y9RFmy2GiAlw9frZjFMVR+SKc7m26geR+jstquk1rXwu9Z7/RQwhQ1gxmNarE19
	+IVcpVnHTsuG8Y4ykhMH6YeL65hVtllkEKNzd6Saa4ItFEaoRvFk651UtALLN1EB
	k23MCAIZSc0eJ03FSbr4e+THsgdIhTt60xUsk9tdpyFvDZBujuqsJk3JCeyrYeyQ
	gahj5jSnnbXAcFOb0vf2oG66S66wpXkw8rkYT8A4flAl4Qubzl5GAU/nZsu8tVr+
	uzMogE1m4tPKtlJJyUo6ymNyJmAIUeodvfcXsew6A9bowg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aec1dgah9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 00:09:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956f09f382so22725335ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 16:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763165367; x=1763770167; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gOgdIilgQ+nfRmYrWcdIS21m8eXNtlIyO1doFbjh13A=;
        b=OtBMBGvqM/Yfxl4s6AjkRFhOYGbo4UGHbpSD7/iGOSiwqI932ZiA3TU6wkA/A2aZvJ
         HetthH9JIDaVCirwwJrruYXH1ZlPktJmrj+U1GImV3wa3b+wBEorewLd8GmpmbkE+YP9
         nBnd68Kh/wsJXc4P6yhS1ZTId7cd13R9HQZAFbXRonb9KkIzol/Ee/gNYYmpBdPdlL0b
         hxQc8pEWYZOSitufmH40W/eMyOMsq0YWzVoVQIgt4K/3wT52K7R9z3Otri3rorZG0paJ
         uXID529y8YQALzMUIyPVbgQBIyNqD+u8978sOdYQb9FBr3s5aHNNtKEvTsiI3lhDZeT5
         brOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763165367; x=1763770167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOgdIilgQ+nfRmYrWcdIS21m8eXNtlIyO1doFbjh13A=;
        b=EmYqvF+7lXVBbYs2kCwrYS+ghYLkLMjPkgXRj2YeYmHcWcDNCmmtC/HLeC0BCSDU/i
         JW7OQX8ZNvApVIhawIKRnX9K6pVf2twolguhLbanuCeDRLXdsaiUpeetR+5zxccI4rxV
         nXGVKGbXMf8KnzfPwwPnokOdQ+SIX7LLAl7WvpVQQTxn5vv7el/pPLCJ9SkUkDQBB5Q1
         sVNFgEV17ZdK0/b2XI+RE+NlZRji7kRTrb9WnmFYqTOrBxdRH8+uKavtgYFq/Gu5t8cE
         dEAas4RKoONMTsuJPjyz3FAfLxyg+kXlFQUC1vTg09DpdpwmWza33sALZJ27dnRzMtDJ
         ZGSg==
X-Forwarded-Encrypted: i=1; AJvYcCUbbSykI9gB3MZde0FViHRDdsIbmWsu55AlSrFggMrpXamcZp7U17rev1iu7AtilaugZ1FukfVetxr56Vqv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx44rakDpWrk0Vmg8YLlSHrraS9PYJV8P5Rzma5Cp3uJL3OD3a7
	DhUww6Wga3p5WC1T7ojUHOpAb1hQEZUcGlPcfZoXO0uuYXZIrADc8TdYMy3yS/A5C9ksJ3z7qha
	mSxDCLZljW3lqMM7RAPkXS4E6IYM3yLgjxAVdCy3QzjzjbE6Vrov/QPkpErciuUMenMcOkPDRL4
	BlpIh9D9DOir+AKPHQ0lHXkRL1raBQnxtCK5rt5m+a2iQ=
X-Gm-Gg: ASbGncsSjdtYAY544JKiaMrEwHTN1iQK/x2c6baLyrBkipH30j9jYqrhsPmt1HpJSGh
	5mHWaiSLUc+C41FD2/fnd31JTlC8lQReCQRWOERzC+Q+lns7GzfUW/+qvXDC2BQnz6shwe5v7dd
	aocVBmRHN2BcqmmjNS+Zk3vAz88x3cQLk2StmLyZQDVgHMLEdauf6ue+cptnY2uk+i0W02w7OZi
	GGebKEdijA44Q8=
X-Received: by 2002:a17:902:e80a:b0:266:57f7:25f5 with SMTP id d9443c01a7336-2985a4ccc61mr111947445ad.7.1763165367418;
        Fri, 14 Nov 2025 16:09:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERwjP64XzxGXqvqAWgezsPlvLeFT/ysTVFkaeqpGhW5zC2uwvYDq9eVbUobF4wmdU8sw4YCi/rbwUMPvccWTw=
X-Received: by 2002:a17:902:e80a:b0:266:57f7:25f5 with SMTP id
 d9443c01a7336-2985a4ccc61mr111947135ad.7.1763165366941; Fri, 14 Nov 2025
 16:09:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
 <20251111-db820c-pro-v1-2-6eece16c5c23@oss.qualcomm.com> <02a9d6eb-e480-431b-bd4c-a35cee170516@oss.qualcomm.com>
 <wf4h2lwyvgswtv4bgdfidj4vpvykwhu2gri4crvvtd644hf6nr@cnpqi5bmpvm5> <f4fbc949-415b-489e-b333-4c846d3ce8c7@oss.qualcomm.com>
In-Reply-To: <f4fbc949-415b-489e-b333-4c846d3ce8c7@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 15 Nov 2025 02:09:15 +0200
X-Gm-Features: AWmQ_bk9mnQo5Kc7evvML015uZK31NGNbAxtLZZH8kNPuTp0BpdfmxEUuYc37Ik
Message-ID: <CAO9ioeWpOArPm3M5hjR5PMbu4rkV1HHxQOZjOe5LwTKK7xMWJg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add apq8096sg-db820c, AP8096SG
 variant of DB820c
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=cc3fb3DM c=1 sm=1 tr=0 ts=6917c4b8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u3Kf3rDHAAAA:8 a=EUspDBNiAAAA:8
 a=w3SvXLNNHMlynSQcp30A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=EGheP1PGFffiXWuNiQ4X:22
X-Proofpoint-GUID: sxvD1a6u_4d8ashKl9AQnN9pD9bAK-Si
X-Proofpoint-ORIG-GUID: sxvD1a6u_4d8ashKl9AQnN9pD9bAK-Si
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE5NyBTYWx0ZWRfX9p8PkZRLS2ks
 rCowSsVwXEShyaaSMyJr2kwfH21tUcV2bX28fgalazP6Awi8Q7CPRGBxsOCuSbBy/exn8PXQAIM
 lDAJ9uszmdnEamqSFMGXhqK8aAWyfxRrfLU6WBp2Tn6K5AWmxTRT8HFyf9g16CPlvauxIhfwVfp
 /f7NXreAqQSHP7eHF+PYGR/3RWgS+Px1u+hYNwexW98ylksZsvwepoKuUbzEdqcDsfXUeWFXbxI
 SJprQi04dqLFMWTL56jf4s+2sAt1wdAvf5e0TngIbHLqmF+bZTeoW435yTC1yl5Cn6BFmt5c10M
 kiR0ptpAYJQjsi82IadDsGpco6RBGk1/PDlwmRW7KryQiGeLxzNfHm2IIM0r6I15u08WG/VNQEs
 opxMo9AWEGGk66lsINpbriibDWLGUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140197

On Fri, 14 Nov 2025 at 23:31, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/13/25 9:32 PM, Dmitry Baryshkov wrote:
> > On Wed, Nov 12, 2025 at 10:44:49AM +0100, Konrad Dybcio wrote:
> >> On 11/11/25 5:02 PM, Dmitry Baryshkov wrote:
> >>> There has been a (rare) varint of Dragonboard 820c, utilizing Pro
> >>> version of the SoC, with the major difference being CPU and GPU clock
> >>> tables. Add a DT file representing this version of the board.
> >>
> >> So is the conclusion that both flavors were used?
> >
> > Yes. I have had a production unit with a non-SG flavour. Bjorn's lab
> > has a standard one too. All units in Collabora lab are Pro ones.
>
> Pro doesn't necessarily have to == SG, this seems to be sort of

My understanding was that APQ8096SG is modem-less MSM8996Pro.

> a "MSM8996Pro" and "QCM8996Pro" situation.

> I'm hoping that speedbin
> fuse values don't have different meanings for mobilePro and SG

At least downstream doesn't have separate bins for APQ versions.

>
> >> This product brief
> >>
> >> https://cdn.lantronix.com/wp-content/uploads/pdf/Open-Q_820_Development_Kit_Quick_Start_Guide.pdf
> >
> > This is a totally different board.
>
> Oh right sorry
>
> Konrad



-- 
With best wishes
Dmitry

