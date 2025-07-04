Return-Path: <linux-arm-msm+bounces-63725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A070FAF97E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D26A6E33E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9629F2F8C46;
	Fri,  4 Jul 2025 16:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kg4ejyYX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0DD2F8C33
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645748; cv=none; b=CDxWyI8pXtJl5GqAes2PeHJYF4E9IKwtmOh7d3m9ZShb2vjP94GdTRCzPjovusmaM1FTWXzdDw8Ohurd72U1p0WT+XEtEjEhzmw/AFzJtf5JLAhMc4eojHMMdfEz5Dxan5aYMtB4vD7DbMSr++l6CXxg3cA6LRt607rtFzcFaGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645748; c=relaxed/simple;
	bh=eIe46n/3wbfumHZuR1RvX3w+bb3YTQ59+X5R2dn0ZCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Zb4nqJhCXDdJiU1q7w0+GphnYA623psz4rUbshHUQ1IBrDy7hsxR2kcVCz2X5oAtDk9eKJK9K/5IAXW+HeljemL2oLPXv/dQPxfCpeZ+KUVqcFGGdFH9zl372itvNk5yLGidvWXAHVJHSadZYhUu54IZB83KYnVMxxsdDnqsDRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kg4ejyYX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564EtPZr000438
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 16:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Zfi5koi+JzSrlUxe/eB/uH03edlTdfD1c33jiELZQ+U=; b=Kg
	4ejyYXLxRSq+6ufHA/RnFR2EvNTmeOFpfThLgsUOQyj5YSSAM4Uy2QQAcFf/Xd+s
	VNjucGys5m7xdaqImxsxOtowaKDPpL1tTIo87C7AzwXa/Mn0brlQQ15OMULRzSDq
	qqrt8DS27YChhY7m396qWrV+K6skUhAJayxey97hJ+JnebFFUaAaK3tgxGD9gGaF
	x1yfAeN/nS/ySQc7KBDmqFWe/w1+tS6KDBSJUoDJjNdoUAKur6XZM4FRBEk+OFEV
	5eEvsHk4pUJ25KxvlRDF3GPZm4M3jvdndkHcNoISbpn+hQJnGUJL4nDPcaoXKb+g
	Y06fU3wD6ovcezZLFdvw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmm9c7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 16:15:42 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-40c65ffbc47so346429b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 09:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645741; x=1752250541;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zfi5koi+JzSrlUxe/eB/uH03edlTdfD1c33jiELZQ+U=;
        b=nqvrm8HkUXxsHE0vwKYsJUDRQcmzzGFMAFjvwekvlaUE6QembzCJ5Ehmk3V8qao+sJ
         vRxbURU5FOBQo7kBQicWWapfz8G+sg41ZKNb8J2afLPBblXvjZhFxZ03oS7aDq6kg+JJ
         t76IlIKh/rJbG6JG+mkwxYY+sHuiJR0Mi62avEitVthUTqHNxT7eD/lf98siROzUmA8g
         bAZupJA+/UuROCMkpJ5ldz41jHqSGz2pMLqKUO1HOxudK8j/P82Eu/eoWS7PcqG7OBtb
         htS1ELi+EKQWifHBiN9FXOAWHAJllWH5LRojAIfLL5gyCl53crcMpa9TvNXVft0r8QfH
         9D4A==
X-Forwarded-Encrypted: i=1; AJvYcCUQOXc6y11KefPn47xKeXP9G4DZFfYFGdKzgHVwKalOY7Y6DyfrClqNtfDKsbZCmiHKkaGz3YuVarK09z0Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4x1vP5pOU8pukebL1nPa8/LbugRw1PgemtsSvax64jPT7N6ay
	28jcUWdj56bXU1/d5eKWybmiJ6OOhVKRanlBvvlWGjvkdmpQ1rUx3tQtrnsarbCw2971HmZ6PST
	/uRNJilWPul5a1uUGN5Aca02xxzHJntZ1pop7oUYyAuz2wSocbSdyra6J2HzqqMEaPgtdL+MPQr
	GDAFM/r6z5nL5VWocLoy5VSIXA4sq/cvNdauKjf4n9UUg=
X-Gm-Gg: ASbGncsB7k2sKF7RnthblmrqDBP0PZp8xeHu40cSddHkffReK8UtcP40aoQeuYcboIi
	GgGmgilh+HvKV1wupakbaVyHjQPC5xz8KHJ+xmijeVDAhLQnkcGscoqLBGGCxQGBdYiH5tYbUhp
	ALIs9Yl4KTOWNdGXesfIrwdjfbDKQVk/cY21U=
X-Received: by 2002:a05:6808:1b25:b0:408:fb4c:859f with SMTP id 5614622812f47-40d0448d56emr2508448b6e.38.1751645741254;
        Fri, 04 Jul 2025 09:15:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx8txNhErOqqsLdUspkv5bdmjMfqA/P1vHiKj8V0z+kg77onhz0wanDNjFgM0iHk4KRHQariXUOFXbvY26ScA=
X-Received: by 2002:a05:6808:1b25:b0:408:fb4c:859f with SMTP id
 5614622812f47-40d0448d56emr2508426b6e.38.1751645740816; Fri, 04 Jul 2025
 09:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com> <20250704161100.k27itcxbiprtr3a4@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250704161100.k27itcxbiprtr3a4@kamilkon-DESK.igk.intel.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 09:15:30 -0700
X-Gm-Features: Ac12FXyCNIFU3lZRjCOSHzDv4xJuykkPHJVK8EjFjchAv8f7DUIddJbTKOaGCHo
Message-ID: <CACSVV02N+nY7ZdnAMBn7dLsdJx3kXySfnp2dEJpMKr-u6ZeraQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 0/9] msm: recovery and mapping updates
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>, igt-dev@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6867fe2e cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=QyXUC8HyAAAA:8 a=k485oyZX0DvZ86tFK4YA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: W3vGg_OAJjhcmbArGoNeRzKKujX1RfkX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyMyBTYWx0ZWRfX8M2JcQdVuj7U
 b1F+qUpqE1d70GvdkgFb91Wd4WnyOdKCmYvYIDm8I1XkrMletCebXZrmwE8NhRM1kiHhbEznu6+
 kmDKtcBQ/OdFcxUVkYNh2sQwWW8xWLCxjJH/ueNmemvk3l/AL1SRzp3EcxIbI/u+uKoE8mFjkFY
 RP6ez+Va379UQd9hPZFJqOuFX0d4w0YSYPV7CbiZidP0gc3gyGeGWkVf7d6PALMAcCAx64VD2qA
 vrNNfY6kQNs8ex19QKIXyEsbXOAFV2H617vWeM1GKvE2BZQYdLjLzonGBxqFk3rjiw9Esgty/DA
 lOi8JJ1vRNg9VPN8SCg2wsINWPosaAhK/HBYePei8bkfZmGncKQ8/qY14MyRq6bk46Sz+HLsJDf
 pUnUjR6BbSrchSTBQRFp6fdS/HS2S19lRjqNz/L5Qm4wbuaZZ5URHIRw3XGTi63eoALv5vli
X-Proofpoint-GUID: W3vGg_OAJjhcmbArGoNeRzKKujX1RfkX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040123

On Fri, Jul 4, 2025 at 9:11=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2025-07-02 at 12:02:40 -0700, Rob Clark wrote:
> > Mostly updates to address flakes, and updates related to newer kernels.
> > Plus a few additional sub-tests.
>
> Thank you, I merged it.

Thanks, I'll send a patch to uprev igt in drm/ci

BR,
-R


> Regards,
> Kamil
>
> >
> > Rob Clark (9):
> >   tests/msm/msm_mapping: Fix memory leak
> >   tests/msm/msm_recovery: Wait for devcore
> >   tests/msm/msm_recovery: add iova-fault-stress test
> >   tests/msm/msm_mapping: update for sparse
> >   tests/msm/msm_mapping: Handle BO names with spaces
> >   tests/msm/msm_mapping: Add additional subtests
> >   tests/msm/msm_mapping: Wait for devcore
> >   tests/msm/msm_mapping: Handle larger gmem file size
> >   tests/msm/msm_mapping: Add wait for stall-on-fault to re-arm
> >
> >  tests/msm/msm_mapping.c  | 93 +++++++++++++++++++++++++++++++++++-----
> >  tests/msm/msm_recovery.c | 38 +++++++++++-----
> >  2 files changed, 110 insertions(+), 21 deletions(-)
> >
> > --
> > 2.50.0
> >

