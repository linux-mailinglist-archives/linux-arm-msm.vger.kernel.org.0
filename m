Return-Path: <linux-arm-msm+bounces-62641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D866AE9DE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88E404A4FD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 12:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04682E1729;
	Thu, 26 Jun 2025 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZ9KGKBE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0710A2E11CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 12:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750942474; cv=none; b=b/Dc71OAQc7OJDERdB30KS3ixV5BDOHKeiWo0G6Aa+x7Qi8Fsp9S1qWVtraTpnD1zOFXQ2hNPA3/2khQee0HeOpWmU7iVMOxevqNwQANXRrtGDXDEEOKZwNAxPN2LZGhO9o5KJ6NSOTo1pUvUMzcl5jeZEvAD40pQ73qW1xQTA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750942474; c=relaxed/simple;
	bh=asdumluxlys5mpuCyqM+5LtmRLFjUYo4X/pjky7in7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCurHUuJf1CDjZkpVw2BBAvD7FjrGrzjK4+LCUgVyX6CJSBtyn77qFwgqlsLNsAF6m4OvaCkPQPM9Aaz8B4f7K0oG0bkeSACldOrEjxHnyTk37mKagvB4DAeDgPYWm+Z6ZYIzy6NTFLBFGAKO8C14IDkLnlBK1sfoeRp2IpsMcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZ9KGKBE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9lYKt014546
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 12:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3x6shSd/yrF34vsnt1iiXfA6
	5GCU1AJJcNwTtSBnT2Q=; b=bZ9KGKBEnFFtGiR31CkiHufZWZC58eaxbW20N4DF
	B9YElwL7IPI63Q7O9LelBe1Uit11W+diCIaE2aMzdaMe2z77KxVdevvDbhty/aPd
	Ft84E0co7UN1TAD69k13W7MvWF+5ZMUfhEsX03rorFY32TaYGbu+nG3qnmkohMWm
	HrqdfJix/VIPHbl85zdJK6d+zSv6vrViOSYBOaKgFr1R6QgRjlF+eK/Beh8DouKc
	R6ShdJb802EcI3rFkdzB9wdWor7rfNi4jFK+HPDWtDrO+ZbH9PExQ7RQyoKgCshn
	rPBrBEvqDmfTf190r14j7Ldgu755rGfff3ppSsvXrSR15w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgkbbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 12:54:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31366819969so861710a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 05:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750942464; x=1751547264;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3x6shSd/yrF34vsnt1iiXfA65GCU1AJJcNwTtSBnT2Q=;
        b=sVvNHKdQ7NUbGxEy0fabD+txQNLJIceqInhqJd50JgFFVmYANingVkEge8aZBblkUa
         mHEgrLuOYSokLlrXy4pN4IPY6+svLIWJULfDXQBYEttJSIXGjXL8EIKvGbLg/GF7Hxb1
         +NGYkPcuAMerDG9uoiJepHWBtM35swJlEXV9haEdff3sSzBj1SOKi8zQrx/0/8wWLNXC
         TOO7+Z+UqtZTt9zmw36BBOMfaEzAaEkUOHJRsF3R2gO8Xt2sm31ZbUYccRVfXXmsfzj0
         qiTGemFjWUUvTPmmnNXygW6Tmxz8o8MzllxfXycbR4xdUetoRZZF3uD1GbYOWduJuf1k
         N+kg==
X-Forwarded-Encrypted: i=1; AJvYcCX2NtabvzCNl2nagoXMq/EQMRKhpUguEIhc0oEqvxbwezBU1jpzuTfiwItJMFPxmyEtiwj0Bz/HO8Zz822O@vger.kernel.org
X-Gm-Message-State: AOJu0YxGW10FhLtZ3vBm/woBR5QGQzXRN3vDE3L+e0+UIhWmbjgrRoQX
	fpiV/2XJObIkIATVcjjwjBZTCz7CvtafDgRf0OyN9wN3rjHjx7gvVh2tnIJ6G1/dt+ZB1mrAdcR
	Axmqt5ems6U7TK6bMSbikmWN518UkNDe/W89vy98WWJYpyLGNg3WNbeiqHgIqv3Ma6yGruBOmWf
	807L7L+91FqCo3Rf6V0Vt1Ug3mgJRRedyhBHpD2iOktRU=
X-Gm-Gg: ASbGncsE92DmO965Wc+auyV6DmxY6ttfBktJ63/g8WyqUMa63J9tkDtOP5DkJIg3xy4
	dE9Evc0LdBYz2gaTVECfKalu1DyXz1OrGIFGTWOcchSE8OlM+APMHqFej75jPw1x3JqvWI1+V1A
	fDzk1uGqvOyJ5Hi30Znw==
X-Received: by 2002:a17:90b:4c4e:b0:30e:5c7f:5d26 with SMTP id 98e67ed59e1d1-31615961004mr5428802a91.24.1750942464348;
        Thu, 26 Jun 2025 05:54:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuAIj1aEqYNeOoxb9nP2pAN+XuVJjT0xlC2v4akSLt4zynbmjMB91F5msiUFqnswgOqwnZpMRyUbkvjb89yQU=
X-Received: by 2002:a17:90b:4c4e:b0:30e:5c7f:5d26 with SMTP id
 98e67ed59e1d1-31615961004mr5428759a91.24.1750942463905; Thu, 26 Jun 2025
 05:54:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-1-aacca9306cee@oss.qualcomm.com>
 <aF0bLtnABcGTi0wM@hovoldconsulting.com> <zw5u5c2itmpxq34d22y5wmtr32d4zsmjj5clf77ryeqs5jgd4v@t3wjfyj43yra>
 <aF1CX2uWZ_KaMDVR@hovoldconsulting.com>
In-Reply-To: <aF1CX2uWZ_KaMDVR@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 15:54:11 +0300
X-Gm-Features: Ac12FXxVTG1v8Nw68lgTtYQ3zkEFEeO_qii9xMXVu692vfF36NTvJZSjEsoMVSY
Message-ID: <CAO9ioeWwyxSgG9DNYpW-Z_SU_Scv+4sSBs8UeZnxFz+tOaESEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] efi: efivars: don't crash in efivar_set_variable{,_locked}
 in r/o case
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: bjTKMbIM0F6xgfc2EBWgddb4X3O1zsdO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEwOCBTYWx0ZWRfX9INV3TkQuogt
 rzo81gIBj07v5bpIzRAQ6kT4mCaFm69kkek3hcva8dIaSNGrO9ICLbWKBZn0zmrsZ43ortG8V08
 CaxXhGSQn1bfvLgybTYqdmG7hoiAqPa4FzDuqGyU6QekEvBAwtHXEK9arPIpDpOYefdte6HcdrC
 ToY41L7xtgD0K0B6CRqFxdRmAs4djaopiOnQ77IgLi5RE+DaB4icY2Avgo/Wjj/AANs+fnv9sZf
 WInRncTFNmTTRQTxf4vibuV2F1B6R9/Cgmm25A9Z/ulc79Kp3hnvSqwU5njhGFiZpSQ0gVa+cmL
 jv9Tm6hDpgVFlftfvJT6XZb142/CPj/IaQ6yEgAdKRkXiqFtBD/imB0EYK6YkoEE/e5lyrISSk9
 pSdFY/EBaBlU1QniWOMHO2psiKWgbrxfCDc5abfqw8RV1a4Jy0YfKtwOoIAL7XqixyIIYYfI
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685d4301 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=VwQbUJbxAAAA:8 a=9OOZl2ZXbS4rxasUFm0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: bjTKMbIM0F6xgfc2EBWgddb4X3O1zsdO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260108

On Thu, 26 Jun 2025 at 15:51, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Jun 26, 2025 at 02:03:44PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jun 26, 2025 at 12:04:30PM +0200, Johan Hovold wrote:
> > > On Wed, Jun 25, 2025 at 01:53:20AM +0300, Dmitry Baryshkov wrote:
> > > > If efivar implementation doesn't provide write support, then calling
> > > > efivar_set_variable() (e.g. when PM8xxx RTC driver tries to update the
> > > > RTC offset) will crash the system. Prevent that by checking that
> > > > set_variable callback is actually provided and fail with an
> > > > EFI_WRITE_PROTECTED if it is not.
> > > >
> > > > Fixes: 472831d4c4b2 ("efi: vars: Add thin wrapper around EFI get/set variable interface")
> > >
> > > I don't think a fixes tag is warranted here as it currently appears to
> > > be expected that the callers check if setvar is supported before calling
> > > this helper (e.g. by calling efivar_supports_writes() as efivarfs does).
> >
> > It is not documented as such. So, I think, we'd better not crash the
> > callers.
>
> You need to look at the backstory to determine that before jumping to
> conclusions (e.g. start by looking at f88814cc2578 ("efi/efivars: Expose
> RT service availability via efivars abstraction")).

_documented_. I'll update documentation for efivar_set_variable() in
the next iteration and add a check to the RTC driver. However I still
think that this patch is valid.

>
> > > So should perhaps be fixed in the RTC driver if we agree that supporting
> > > read-only offsets is indeed something we want.
> > >
> > > Are there any other current user that may possibly benefit from
> > > something like this?
> >
> > efi-pstore comes to my mind.
>
> No, that driver is also disabled when efivar_supports_writes() returns
> false.

Good.


-- 
With best wishes
Dmitry

