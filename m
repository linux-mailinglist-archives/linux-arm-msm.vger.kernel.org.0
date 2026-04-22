Return-Path: <linux-arm-msm+bounces-104127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAOvJ2HQ6GklQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:42:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0CD446DFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19B1130057A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3C8246783;
	Wed, 22 Apr 2026 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bu7KSuGY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmBdICTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5050626980F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864991; cv=pass; b=Rrfk76CDpBAGgnQNH/Gsln1JYiEkdbI/C6kNme6fMBtMt5qRw0UdfS1kR3ZGb60JqfDdjmW7sfHGLRD1WXzos6x+SyVTraeejOIkus2L7oydnXjqgM6ryRXEG11R7R8Ua268vbNDThL6TeQDLcSQ4kYolT7lfDbDCWQrSR7XSaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864991; c=relaxed/simple;
	bh=DW6Pb/0MwBlZ2vfOk4h67wtFTEicoYLHmE0Xchy77uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrIfNWla20QKNzXWghyPuj38lPuY6Yw0HsML64F+PJEIsFuStkylXin6I0MWAWeWvmcv2dKTHq+lye2sFH+4Bjk3KJb4+cN0I2iZ7ak91x/2sYKourYmkdtJiQEN3CSPtS8SO2eWFIYAdwKWRVODPxdYGS5o01hFOGvgyufKJGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bu7KSuGY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmBdICTr; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAlC3i2123519
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=g9nefJHLcFDzgFYMQF2xfJqqHCRUAKm/oWLJR0bSSUU=; b=bu
	7KSuGYhMoV2C8gojbjrBV6e/xch/wN/o+rlqGsvc8t5BMIIbGcwaTz11aZyOf9nW
	l42ECE69Q5KaoDbwgboZkZx38WBRV4GVjkTMs9a5njGMfHiKKYCxBs+GLQL0f4W2
	IxvfoepR5GeCSSRrvg9MrUcDJNyRaI3n79Rxi+odfY7NzStx2UQpCXN4Q0w/pF3s
	tVIYgHBV/0o7JSZ1Vy6hXvOE8aBWTP52cTXQJObbRJkB28QDqej38tukB+JbOWdX
	DEN2qI1jcez1uMzj+knW3OUw5KUz5jFHaP7Jl7VGy70imXKog69smqReOn4+hU0S
	0c7O0gRaZtuZGGpZOxbw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfuk4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:36:27 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4718a1723a5so7770494b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776864987; cv=none;
        d=google.com; s=arc-20240605;
        b=E/eQGxiOuu2RIlK82pTFo2k0xqiisxo7KCED7/g2jwFbCXeE1ujQtaue18bunAn5M2
         7jJPa8m3OcJI93tZjS5gtzd5dpKNJeLzIifRDMeJ0/ENxm+y3KGcgqNYYI6AlnmtGsum
         lyI8AgI14Xb+NHD2ZcXysSj9KNJfrKU/8yl025Q5AK1pJtqu2/auCS9w+f7u+wFO+niQ
         UUJoMGvBwoRYV9K4cM3sgewpQ6mBTBjJQBRv1ZPtV9jM82irrpQ+24m6AXcV1ofs+Fxm
         XrPg3BFO+b5Qmy0PbzjGHX3n3cS8Q2muQxpMUvNMeNjTxf9bvJd3u61Wm56974lfQdmf
         kGew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=g9nefJHLcFDzgFYMQF2xfJqqHCRUAKm/oWLJR0bSSUU=;
        fh=2h3HzKokUgqeET6UcyKQaQkF8RrS0hmfpyPUhpt6muY=;
        b=P/f0/OZYAUU+8Hywehwh/xLxMDWwyjITsni40idFevFR94GHTgjGjfSvJgmhYfl7di
         02xVCW0J8H1JjMhiP+aqmmIKRhSPbP64XKtCdeQS7jsm+B/1tWR3BKzoTLGg5XWbm2ol
         1ffRATViq21TfiTHjQEJloMxU0P1V6O6H93ZG+vzmHwyD8kvGtLWvZkzfwZzM3hg64cb
         dCIAi9UnDLfI/D08JADJzWQv6F8TXJWB9Gshj1ixezwN4Xi2npCPaUkGekoqdYd/QSZ6
         UxOUnCME7KrlibBI+5HuZF+P9g5FpfkNSw2s3Na00nn4/dMc6W3AFh0Cb190QGYjl1SG
         cxQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776864987; x=1777469787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g9nefJHLcFDzgFYMQF2xfJqqHCRUAKm/oWLJR0bSSUU=;
        b=dmBdICTrNY9ORxQ85J6yEbeR/0A9ff1pCtv+qjtg3Lb3E4JmlHYGaw4LeEpLIC9F1w
         FBPc3Ijyz6GS+vrxApChrGNLgAJgneqXZ0Vc8Wq8ev6XAjxgU+04e/EfrCdmwcq7HShO
         rYP2xfCqJ5rsi7lh3izSfOlbdeOyfcOHhxCDijYDsnjgZBWywZKVHn9uuWBKp9YQpYs1
         uXz/8ySR5nsJ0jZQKpDS/Is1vvFwfAe+Fd9KF2j3yVZShQkyZj8s/h50MPdc7wzmWycO
         jsxYE4H3YXYvTeCGtOrVzm0YXgw2ivwCm+V0GEPOhJmFzOI5+cb1xYHDRTITLKaSJW4z
         bAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864987; x=1777469787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9nefJHLcFDzgFYMQF2xfJqqHCRUAKm/oWLJR0bSSUU=;
        b=YQCIQs51keBoIBNFulTLpgVSCAE/eY18tOcccMWtnzhFraYapszOEFghiTwsQ2ilAO
         Y6T6xw8M6QuBpRGKe3Dhzlf1caBxdzi4AkjtG/QKrijB5vPpgZmzD/fOITIvOvOfNm0S
         oTu9+Y9SnicnxEVYDd8Q1fd0F6njNfyPj6+QOjFNWlNJUdIXK44A7FCdsMQK0TguVXq8
         6LDVttbh1cxidn+2J3NfFCwEBLQjOcSPw0h8ONfEvqaC+Ioc+n/BqDg013LiUcD2yAeS
         NueQuSCCG18TElHwQ4zTAM4EL1NJ2QuqHBLwfYXN9MdLBO9dkBAIQgm+mfp0+Q+78fL6
         iV1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/NSwM114sryLwwjQ3PlXcwCO6NE74yhhYnJ6tZ/Pqw6UyFJXusQuXLyZCQUMN+4MJBa9wqtw1+AEvwa1+F@vger.kernel.org
X-Gm-Message-State: AOJu0YzvH3xV5zm1zie4WlBmAiiOjk0pYWIKsU2LC7UBWTCEVNS2971V
	eeVnad0UR+e68YtMQglr/GYUWJGEicDdNM0oAkydh0HdU+MPhW2nA2wIRVISD7YF2UyubYX9Te4
	O3NVrVk5zD4yr3cj/0CQ1vCxT6Jp5DXWWDyZh4u8F0yPsaBSSJwfUO/V+g0uIzG4shmE8FW28oP
	aPXy0kE4yMtInG+E/78CDS01FkORvv3mk6cTUEikR/8PY=
X-Gm-Gg: AeBDiet7FVajyhmh8pCB0T2fPRNHz0hsddJ5LK23jMbaxmcuzj30otRHHyE8Whq0pf+
	5FYk6yEeog0fJPdANRkTZzTFneKQR8DzNpQfmq4sxEN8CEozKArJ++gL28cd8vZWsK+EfdDqDu/
	WEvMDOppsQLFjAUa2ttg3EhaxbRZ+EUgpqc8aJtUeOEaNH265cKRC2mp3AwB5ozkzZ5pkCJ0sMO
	71QF2XpCRiT7pbcDB4UwdAmdTM1CTnBJcuo1127FaVc6OZQ
X-Received: by 2002:a05:6808:30a0:b0:467:13b5:8af2 with SMTP id 5614622812f47-4799c7ec4d6mr13102251b6e.5.1776864987147;
        Wed, 22 Apr 2026 06:36:27 -0700 (PDT)
X-Received: by 2002:a05:6808:30a0:b0:467:13b5:8af2 with SMTP id
 5614622812f47-4799c7ec4d6mr13102227b6e.5.1776864986760; Wed, 22 Apr 2026
 06:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-4-robin.clark@oss.qualcomm.com> <qpvedddi36ihfldioqep7alve7ah3lbsk3txkru57e22f4ud2h@rhxsnu2fovot>
In-Reply-To: <qpvedddi36ihfldioqep7alve7ah3lbsk3txkru57e22f4ud2h@rhxsnu2fovot>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 06:36:15 -0700
X-Gm-Features: AQROBzDpl_YQ4irJrW5IPEjK4Fxl70V756sJkA12Vz0QJ03GGx5p1Lde8HxXvx0
Message-ID: <CACSVV00pBmXQLTpJfH0-bD9UBvEgwrru_pv6Yw2BSQqEqO=FXA@mail.gmail.com>
Subject: Re: [PATCH 03/13] drm/msm/registers: Sync gen_header.py from mesa
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e8cedb cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=N1XRXrzMJDIqkiJVU_QA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 7E29TPjXG2--BSk4YB1eYjX2U-Fy-kCA
X-Proofpoint-GUID: 7E29TPjXG2--BSk4YB1eYjX2U-Fy-kCA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEzMSBTYWx0ZWRfX220PZaR5K9Ed
 16fp8VdkhoIr+jsFAG+QAOj99Ht7aqEAeqFM8JnjuwtsTXaKK43/W0ZXWvUrU5fYlIngNtUTatu
 fKXO4FreQZCli1Sk8SSm+2gCHbVw3jG7Q+5zkvOd2CgWKMF/BqoCiGAleudxNyPVr1vT5XOKRQP
 8ZOuXAsvtC+PTxSlzIVc4MvN2BFjRqaqLhs8/q7yp6ala+bfw8YxPFfEd6JPi0vdv2x26NGxnTC
 Dj9CQRj0CAbGKDQv67/i29RR915SLy7sTEC2HPYly1Six0PH4R68ljcW8EFz9lXXXnNIIt3CV5l
 Z8AY4EerZlwYDUbqxnl2Mtrrexae3g30YkV38xHYEeWYQAJW9IhFCBCiB/ARYdYWbLkr6cCFVtK
 h3HLDbNIWdrx95S0X3pMyV18p3J3PcaHL06F4ksdc2dkgupPteCqV/sRdHj3VU9SE4yA+cMg7fm
 rT2BDbnjo0evpX8GM1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220131
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104127-lists,linux-arm-msm=lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,google.com,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gen_header.py:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,gitlab.freedesktop.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: DB0CD446DFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 8:39=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Apr 20, 2026 at 03:25:25PM -0700, Rob Clark wrote:
> > Update gen_header.py to bring in support for generating perfcntr tables=
.
> >
> > Sync from https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/405=
22
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/registers/gen_header.py | 2079 ++++++++++---------
> >  1 file changed, 1146 insertions(+), 933 deletions(-)
> >
>
> Syncing with the MR is not so nice, it's a moving target, but I assume
> we don't have a choice...

final version will sync to a merged commit, ofc..  that just doesn't
exist yet :-)

thx

BR,
-R

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
> --
> With best wishes
> Dmitry

