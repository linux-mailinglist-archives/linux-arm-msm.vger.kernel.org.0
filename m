Return-Path: <linux-arm-msm+bounces-102958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L2dNHDr3GkZYQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 15:11:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2583EC696
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 15:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 053423008523
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDE13CB2C7;
	Mon, 13 Apr 2026 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AoKfm4WH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeyWC02R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E784F3CAE93
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776085869; cv=none; b=p8d3NX+f6Lkl5U+AS8gogJUcKg5Q1Z8rRBhqkMj4c0HsZxWaYn7sESIA0AJVZbQgJgFygprHy6QwHGWdOozdJSpY2dKPXJo5aU8m5uD0p5dAPg0iRYI+0vtLh73xAM6eCkKfP6SZx3MNrPgf+ZA7KglUIYGE2v4fZjNK9YW4YSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776085869; c=relaxed/simple;
	bh=evUFdVyHsW2Im7jjoa/gFza/lMdE0CYcZcTm5CpWWog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjoafvWgA/OxuJVANb/RMC7qig14wRwfoZZUYsOvuL23mMUnKGOFr8XKPBTzHCi++pD2VHv7kxQb2xMRKtKknLdvnCriLmIH23H92TPSQUy8Lx+yDlBYg+xPzP07htIBHw9f8kCP5S+TzFMG4Ax3h2nf4ustIiaHzLTKux/eoY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoKfm4WH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeyWC02R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7940s479974
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 13:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eL2JulX7UUraZHdWoZm0yJ35
	QzbgHzWQBoCIvD75HHg=; b=AoKfm4WHLuTtcu+GytWlnh7dC5icj5ywgqMlzyBO
	GagqiMMX0BBNdiQH0UHlzQaI3x0Ooi5FESmkPswfHXZWz3liGhJBQ70+kkltXeb0
	6lbQy9+O9iCbMSa4XVKkhsSujOMyCWw0q7bLTnFMCe561B6GD22gPI2LT1rnqS3d
	D6706IF4NO2SOBHIJC56dbIbRuv8h9Bk9f8ShKYfc720UXCTeIU8Ke8OUAmL/Gah
	KTfSseyTS0XmKF43aaJK6+UPl2Nnlr1HFPixrjxBEOVWHvYK02Gg9/4CpjdllyvN
	msmm6sYicsbyYjKw6KYCN4hWQ4a7dWDcVov2Z/SMdbzCmA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dguuj9784-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 13:11:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so8612711eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 06:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776085867; x=1776690667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eL2JulX7UUraZHdWoZm0yJ35QzbgHzWQBoCIvD75HHg=;
        b=NeyWC02Rm7m7YcieNgbUXt1KBJWhnFksXJo48+Y6PxanNUGr6Th2c15sQykja3RSTQ
         erVyAfAVk2MpvM7u41f1dUY5tTRzb7YlaYaZ7JbTFMu5HbTHv19dLkTCJywI/G3vNPIX
         8thPBykwt+KuQdidZCv2yxisMJWAvxb2pOmtRtDh3xkSc/6GUgkxdbB523qAuTItpAK3
         YxyvudPw8+wfCbyr6zwLLLUSwBXehMtXNCNGMVHoos7MVZZOzUqw8FBi8Q9v6zvGp8Jx
         2n7cKa7zJUElNJyBkbNrY/jCYBG8u0yRimgl3B3gEhVFBDp5iDqBdPGlI9o4dh/uNaob
         h84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776085867; x=1776690667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eL2JulX7UUraZHdWoZm0yJ35QzbgHzWQBoCIvD75HHg=;
        b=kKnlXRtQeQjlKZVErLKtUkUNREQ73KbOX+rU2G6I44p6gLCLjKtLK0MbOtOtPUQ1ni
         9BhSksok6AtiSmGJy5t3+YW8AL8xJtMJzTLQvfntugg2MKohANv7fhWdTV1S5ps3oX3k
         tEbyT5MAmklH4bwi3zjWy6HRjmpz2qFqDfFxKPUkueIBkDIa3KbvPi95INPq8+S991Ak
         XzrZWC5XpDNxv69BOGWSDcr30t4hmlvGH+8JO0W8q7L0enYgfwVjPpL+WhstLIf47Yxy
         zii1iQIyfderMf1hMrlPoQotgHN8MFFLC2+eqSmxtA0K6E/Kk7xEom3Q3kQj9+38JQ/W
         acLg==
X-Forwarded-Encrypted: i=1; AFNElJ+1qxydJievAq+ovCtu8DihmsM83quarHSWjQJGq7DVxWM8eViVSuqgEG57fNt5Ok6v7P0es0qg4C6IouQs@vger.kernel.org
X-Gm-Message-State: AOJu0YxkcSp1n6+uAlLo9nrG12j6b8Jl2MNJLWc/qfnMNnTJVOmDRPZ9
	PFJJtvBucfbrwX7RYkBMeowyIVAWaz+bskU4SLrFq2Vdce8dAU1mSQv+HHp4E1KNLS9dwYZ9UY+
	zQLm/BHGRzDT4XcWvKt24wm1C6rPgHXd6CY8xcIczg+dh1X1qoO1Ppty1WVDkMf4ouLN5
X-Gm-Gg: AeBDiev1WPFReNo1CBSiSUUXUtgXpOnOk6gd3QHxeG15JWOpPzKnbKWIdmCXRVIPyND
	PQfccMyrZzm+5yRixKEjtTx7u4HSVNzqidmUsmRKoXMYnoK7zxgUVeSOwGaNbXDXqpB59LpnPRV
	AMfCutBG4iKBfI9MN0mCjS2Qzi1OcRLIOmdaumfFQec4n1RoW4tEGTcgEhsuw9o2V2uScfXiVVU
	tsvMFfjQk8JC+jmz66sC0y7xW2uOb3kofl4kp+8n2ZwqppuGGqL3V5F4srilveOaFIdQC5t035G
	GaaUOCmsnj5EPEn6qtXYGddG+1jcC4uf99u8quvfZY3TX6V3ssi7Ea9LqzxBdIg+Dy109w+F4Ep
	kkRahHeV0I9KWqQRi4iVm44LLgI6UrMdHypVKcVHwaSdKbrSUpJ1nqPLrhpIxJBtI
X-Received: by 2002:a05:7300:7495:b0:2ca:e4f2:31ff with SMTP id 5a478bee46e88-2d5873adf3emr8307094eec.6.1776085866531;
        Mon, 13 Apr 2026 06:11:06 -0700 (PDT)
X-Received: by 2002:a05:7300:7495:b0:2ca:e4f2:31ff with SMTP id 5a478bee46e88-2d5873adf3emr8307052eec.6.1776085865994;
        Mon, 13 Apr 2026 06:11:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2a4esm20589691eec.16.2026.04.13.06.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 06:11:05 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:10:59 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Message-ID: <adzrY4AijnKqXDrh@QCOM-aGQu4IUr3Y>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
 <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
 <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
 <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyNiBTYWx0ZWRfX0JHeu+sl5Hx+
 PHl6M7tkvzwDxOlm1ktd1ZH4c+l+pwOZVcAAqijMA911Q6MJFVPNBTWjiukHv1Sf0WBnMqsn58R
 5bwYruIdqE/up5ITKg4TAZr7+qfEc5Lp+mvwFGIVITnYx6/Azjp5I0mwO0PuW1f/zfe654T6//5
 rW2QtFW/aCkwU9Q+nlOSli1kRn1U8ERuWgbkLUI2QXlAmaMBFjjRJEaAk0R/ktAA+QjUbLCgTfp
 O0011rA6DXXQSFRim/Km18pHx39D1QjjhVTVC8Wm/dXxPeQBkV0DqY0j/JNqCI96eb5/JFeVns8
 QCSq3RSv/+Tj/PDPRAs76Qz+nHG1WRv7FeMJlUcHyWvb1pQUllKY8DkduYLDTNAxBMWRiBzd4Kt
 UFiEKvSRj4S1KRWWzDC2PLzezbeV5Bxna0wVIipVU4ECl2iYjptvvWHlOj9OiZ/lRvE6QDzz5jJ
 5zkqCwYPkajAaur5DIw==
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=69dceb6b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=nxruWQCVwtlmZxb2w5cA:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0jhUJx39_7SXepQVyR5fUTgrmP_ixF8n
X-Proofpoint-ORIG-GUID: 0jhUJx39_7SXepQVyR5fUTgrmP_ixF8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130126
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102958-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B2583EC696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 02:40:18PM +0200, Krzysztof Kozlowski wrote:
> >> Please organize your patchset correctly.
> > 
> > Are you asking for a big series that consists of all the new bindings
> > used by Nord DTS and DTS itself?  Unless this big series gets applied as
> > one-go, there are still chances that bindings get into a kernel release
> > without any users, e.g. subsystem maintainers pick up bindgins being
> > reviewed, but DTS requires more iterations and thus misses the release.
> 
> Please follow existing rules, communicated multiple times on the mailing
> list. Qualcomm also has internal guideline clarifying this.
> 
> Below are some upstream discussion clarifying this:
> https://lore.kernel.org/linux-samsung-soc/CADrjBPq_0nUYRABKpskRF_dhHu+4K=duPVZX==0pr+cjSL_caQ@mail.gmail.com/T/#m2d9130a1342ab201ab49670fa6c858ee3724c83c
> https://lore.kernel.org/all/49258645-d4d8-44a5-a4fc-b403c926a5d1@kernel.org/
> 
> And how to do it:
> https://lore.kernel.org/all/20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org/

That's what I'm trying to do, posting bindings in prior to DTS, so that
when posting DTS, either bindings is already merged or we can refer to
lore link of bindings.

I still need to understand you comment "Bindings come with the user".
Are you saying that bindings and DTS in different series should be posted
at the same time to show bindings has an user?

Shawn

