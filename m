Return-Path: <linux-arm-msm+bounces-86492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E129CDB84B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E86B3009840
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57B230FC1A;
	Wed, 24 Dec 2025 06:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZkE7jdAm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i111uWLW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506452EBDC0
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766558158; cv=none; b=PD0C9bq/Wwumu+wzcJTtR81HsoLgVY0Dju4Vk0dsKWDoM1QwdaEepdeYUshiEi42fJtY21tfzhw+SR4qeYVUSlXTmWdO8Q0Bu9mjVSBu+32Lok4hJkLOTCVlGABR49S/8Rhy8Rt3Rut7hMAFobDx1+DgasnI4s9287oKeFGHGDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766558158; c=relaxed/simple;
	bh=E4gp7upDRj4Xmw5xJPOoW94BwiilJRRb9XAkEOhHw60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JscLqe4SM8Qgzn5br9u2eZduUyo/NV+sFfsfxi4KjyFsZYUQLPiuv83Hjozp1n10dvX8AVDnvsCyOSH4qPd82zWNIrSyNQ7XL2WEt/vIRDCiieL+29RDcbRvGi6rMaPw6ia45pYedbzB3nls0blRMGfF9RmHyvVud2i/c265CiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZkE7jdAm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i111uWLW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNJCr6U1056217
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O/ai+EcQhmuEEaMU3xpLlQek
	lMb0G3yAwRXrO+mFiyg=; b=ZkE7jdAmY4rEwCd9pzj0kuDronNBYGzAuHLUSVeS
	te3102OnEGM7QfKZQbKStnV7KJSnj9/zP8U20G5OxaIlYrSpKTZZXkA409zTj2pp
	gNGvbEbwcsfQ0dvI/VV1wopJD88u0JPHE73ejZAJsGH0y06+8f6DCHrMjkHpM/RS
	1N+Fz7n4mBF2olhq2iNArLp7kMKh4eEhuBhe0DcLu2nqBcqfHwYRRiPpii7CftTW
	kCWfYB2d4JDbp/GauUvtz2PwkbDNs7PIXcQiMK3Si038zqFTIo1IYTEbMHvHKUVY
	ECxfA3TnY2A4x6iLXr0b8je75rfWLFLssVjJnJNTBMs8Bg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v1jvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:35:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4ab58098eso124977261cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766558155; x=1767162955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O/ai+EcQhmuEEaMU3xpLlQeklMb0G3yAwRXrO+mFiyg=;
        b=i111uWLWUO3Q2HLYHtreJsy9NCah0UKEUx92jVBCzQMbI9fwPZBHVW3nkQJFKpfVXL
         WAgx27G9uaoNqlXUcnNmzastkshXc0Jeu/gDfPRs8hqF3b2qb8WSZvYLFt1NTh6UQKYQ
         uo9ICsrIMBvGtAk0RC1qSZBtLGY6qVROAbI1dx8rF5UrgOUo4clJ5zfWt/dDZ15ddK9G
         DAusYMWyl8+NnofZv776RT3IncPlOgl1nlYcpbPcoRClqogCoqLptMASxu/eqzkBU6dp
         VytgIsa5DMcFdHBMhAPPZStY6PdkkrqnTnfSYRdQ2+8d9vRBcypy04Aj8/Qb8gQppU1A
         NgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766558155; x=1767162955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/ai+EcQhmuEEaMU3xpLlQeklMb0G3yAwRXrO+mFiyg=;
        b=g2HtcpEmykQZ1rqVLHufROlFlXK3n0f6TU35stkouIMMrbUKS8CIKUVmlhHIUQqJ+U
         va7w9q/KexcFTdc50TCgdLWD6qfJsyqs39MfBti/n8nL280Ei1cd7kBxdiBfUckxtIpC
         Bn9r1yAv7OUlXB6ZtAJTpabEX29im+GJ8dryQAbfPX/sbQCFP5/j0ndZOjCdejPwcEnT
         4w/Pzfn7fInEXW0suGi+GgSgRYiHVWjT6wSpvVdVnQBlCE5JMcwGKkHSf5/g1Er0z9zO
         QAXK/yqim7E5VfZpbxvHXRC5lc3J9PfiZEX5kmfxKTsJ4hDiIJNtIPHGT7Q829riMXv/
         Ez8w==
X-Forwarded-Encrypted: i=1; AJvYcCUvMILogmKszsEaSCmc1LkuncYUx/SioJwW/BNbDSxvS8eKYpVcfoHZlzuF6DcyDlqLnutE/aTHAL9X8Dgg@vger.kernel.org
X-Gm-Message-State: AOJu0YxZGKaDeZw6oAGUnkus2MQxygDZHGODJ9O1fvY9WkJaGM81ZdGM
	WJKGB5TXVxakyNJ9nDOrjT8/vspIdP0HKy3es2H9w4MkIHqsLZBMJnB8DKA+L3A7t0MeR7w86x8
	5+lhtV+zofbHDc8ulx6cQyuPx/Ws5g0AYP/MO2M0C6eX+++9+BZ0n32ufcRL70N8o/MxE
X-Gm-Gg: AY/fxX6T6q1fXWcJHUCRzoxvrEI7T0iasA6gfR9/f4YclmKIQwmjIry+8gGQU9kOcWl
	K4EiuaDHX0Zgqw9kgKN9ygrXq+egwkpAWZ4RGV+HQgqYJ4rWDo6aG3ZSaAhBes2YyryzKGBVlth
	ioHc0Ld3C2yQGJgNfqYoTBOQjly0Cab9/4q3daXIRBfyhYGvC3+BCWQCRMNzg/1hqCa/RhC6n37
	H7M6xX/UdkV0XBAKRkWZN3Gg0Hec8+0m1qmtT7S5bPXRvlmF+iugqeQ/nwt1JBe9gDFuU1rNaIj
	PVpaVQucei/XCCVdCJEzDKcWLwHVKwjzpLJceGmpkPGFBWWKXiJUBsP9ANquaJz5HwdluVU4jXg
	iIouxAWauXSPSaNuPMGM8X7tttLYzYdsu7ygGnVY6FX6DmDHJO3oNVo9kMumZyZ3Q7W3SEHBQfT
	w+4d+FafGdpSq8xjqgRw8qAr4=
X-Received: by 2002:a05:622a:189e:b0:4f1:c76b:d003 with SMTP id d75a77b69052e-4f4abdca7bamr248300861cf.78.1766558155392;
        Tue, 23 Dec 2025 22:35:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpI/rBZcdIhw1TBccG58XQ7KCp9DIvIyshdUz5Zd7gDt37SyXo77uS5l9pViKqGvVhj3r+sg==
X-Received: by 2002:a05:622a:189e:b0:4f1:c76b:d003 with SMTP id d75a77b69052e-4f4abdca7bamr248300721cf.78.1766558154912;
        Tue, 23 Dec 2025 22:35:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812264bf90sm38755151fa.35.2025.12.23.22.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:35:54 -0800 (PST)
Date: Wed, 24 Dec 2025 08:35:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/disp/dpu: add merge3d support for sc7280
Message-ID: <5ucbip23c23z5cpoevo5uxifl5de7mfipjfkhblyiw2vbxv3j5@h464opwvswrd>
References: <20251124-merge3d-sc7280-v1-1-798d94211626@oss.qualcomm.com>
 <nw6oxqdeoeckcqk4lycxyujh2uk63vjdzdpaddddkjb257xldx@eh36fawnt2an>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nw6oxqdeoeckcqk4lycxyujh2uk63vjdzdpaddddkjb257xldx@eh36fawnt2an>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1NSBTYWx0ZWRfX9BOE7/yPGEdt
 Ka/fJiZ8vCEwkIzGon9n2oP1FlbFZ0+ieqA/bCGh6uetkrLRfqsn6t5CXBKwrjqJ8KwKZA9XLks
 XDeUNcVUzTi7sWgKTI64gP+89ORJ2V76KpT/Ozf39UAwmfvo8EDp55ue5lCiDKfctImHdQ5XeJc
 iAfbp5q6yJ+rPRCHA9f28XuCLQ4DKJ0stSJxCWokrnW1ECjs3kPky71vwwNY9UbY8ZSYitzEkAD
 jtiv54IrMcGwj0ZlshuGzZvQEoSGbjZvdlF8QywGt2yska004p1Sjn/J0rekL7MY3HIak2GFiMr
 jCHkOrAi5WMJ1eUgKhyVzS9xKghcdJLGE8i8UVxyeck+KDTxHh8XLr2OW1yQt2eZBs/y7lAe/uI
 xJO5oI3UE/cOkvIIgU3NOVffEKXpCq5V0+jGG2f6srtwwfH1Jsd/jAxAo8MNxVxhX5sk47gvJ7U
 PwPMpqqcdRIPkJFV+Aw==
X-Proofpoint-ORIG-GUID: dYHgLFuPjaouPcPkXBksDUqTZbaLSGAt
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694b89cc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qRJANdtSRza86Q3VVk0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: dYHgLFuPjaouPcPkXBksDUqTZbaLSGAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240055

On Wed, Nov 26, 2025 at 02:32:41AM +0200, Dmitry Baryshkov wrote:
> On Mon, Nov 24, 2025 at 07:57:01PM +0530, Mahadevan P wrote:
> > Add support for the merge3d block on sc7280 which will allow
> > merge of streams coming from two layer mixers routed to single
> > non DSC interface. This change helps to support larger buffer
> > width which exceeds max_linewidth of 2400.
> 
> Please see Documentation/process/submitting-patches.rst.
> 
> First describe the issue that you observe, then describe steps required
> for solving it.
> 
> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> 
> The patch LGTM.

Mahadevan, you got review comments about a month ago. Any updates?

-- 
With best wishes
Dmitry

