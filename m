Return-Path: <linux-arm-msm+bounces-102785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAGiGxJT2mn30AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 15:56:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 137A03E02DE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 15:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50D16300B458
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 13:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7091F2F851;
	Sat, 11 Apr 2026 13:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKLONA1X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWATgPiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C4E48CFC
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 13:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775915790; cv=pass; b=hHb9MvWxeCd9VfgygtCN1kphqVEmCzdbiApozpL5470SlY8bVwQRkt0xDIkKoHZJOO7V7Qv5xBqWx3iAujsYAFhZAGF46K63iiLBxcOlOgtS/HVQRLTEFc6MGcOpeOoePpAVWrXlvYHTSXarfjHCUT+NuTXpEJLHUGxRTzd1cxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775915790; c=relaxed/simple;
	bh=Z8BWmCNsLFy0aH6kRq8cZ0lStcayZq3tHd1h69ewX3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAGVQVNqVQL4xzkzYCCY6FCXdjstqFPyfR8WU8QPzudYNVVXGG8hHZHWeRHawz947VZq+EeZQqPEh8YY/ogR+cH2+a5HJQS8ztjnNsfcJGPwP2Vo/cZo/A6lWikc9hl+VT5wVYd0BEvNtGc+r95xHSaUZTLFFrwrl9jBkNT+qsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKLONA1X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWATgPiH; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4BruG653687
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 13:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=yh2v74eVUgATbTiDREMIszXOd/VRQYJ0x2a0dK2LEFM=; b=aK
	LONA1XnQn8S58xZ6yQNuh39E3l92IVXUwM1nZcRuv7AWROoStf//EvemFWXP2Xre
	9ybdcSeKDaiTFbiSzTJN4joe2BZq2lwdUySOxALEe1RJCWtiXCEgkZhen6abblOA
	7wL0B+ITLZT4gOGH31YivAgkfVeKUDlYAyitIv5TOuUg+Qq36N4a384iDdIUi14U
	Dt+HgsaZt6OSNHW3llg/lTa+A0pvjBoipEysblpr6EdEOYc2uN1XsQYSm1Am4FgD
	rHXMvP21uSmbZyQTK9UCrZmQ5/7hQcx67CH/CraNy6IxS9vZmGGa04C5JI/TUPRq
	eqtKEnidR+tIbbNP7fNw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2b8s8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 13:56:27 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4236c3b8f32so5242456fac.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 06:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775915787; cv=none;
        d=google.com; s=arc-20240605;
        b=H2MTSyRjj5L4oIWiTNwJhMLoGQbAvbtrEFy4PwctEMO0khGtIFCc9sLYGfaiyB+4Sz
         S3yH3YWO19EDA5WkmC+ErgjxuWkkxhWBPCHuTScQgGtpOpV0r1P/DhG4JojIohtdDSt1
         NdZiORWGldv404oomoDL/qPnN/vzvgZTGhh22UVolgqQfgFHkmAdL9MMAneWltJTVQA8
         2x0k4DEl435QgPmnW+rFwOo5TOGwQq0W1YbRw4tLCX8kjBNrlQWuhNkotdqcV6sUS/i9
         at6ed3MdnOoStP7ufi/hXJ49Xb9ocCmB/Aakd3xoyo7W18mJRYrMqRR9NPITpBFCkdlO
         ED4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=yh2v74eVUgATbTiDREMIszXOd/VRQYJ0x2a0dK2LEFM=;
        fh=Q5Zs+nKYNGKBWH14QnwpeCdzhNGlRAg8XPfgNmQx52s=;
        b=BAuMQ62Y3zW5B7SH+8kBj1a7owJz/J4uhzcSUq1rcQsCEGYyxLSKS/sUE16VQhS/qF
         82uXwGGFHP7WjUL5Vv3Z7llPI1m+ehtABz4GuuTQpYWt+Httt2Kmo9wZHjhilJWCfKg5
         gbHqEpWEhVfuc22236L82D7RiFQOEE/bSZ9BZId5MTvpyoZi0AisSQd4Hwnodo63nkmL
         2WhGQ297pFObwmqHagd14bARWObDBf+cVcdLdMObOhY31q0BUIjnwirlvinCkbb0dBCF
         Z3xfC7fdZlAWJ3N8o/oKCOOGuZdaQTXuKmmMBeUz2uxlvB+zAKG9UjyN/IggwYy1iVrd
         8IkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775915787; x=1776520587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yh2v74eVUgATbTiDREMIszXOd/VRQYJ0x2a0dK2LEFM=;
        b=EWATgPiHDReDAMR7fQAqV4R7KgwYdj0nPSoc2PX/VD6Yk14F8cSX6eGOKzOSxkfYFO
         zaJW4nTLdjD4F9rRbyxpA9fj+iNcIpJ7hwefCykTMdXukf7ehPtK3STUDeOo8gVZQqFH
         xR/GGQi64646iInqqkvn5y6Nps/awCRTRmaBKFPyRt3OzIYo8JnEjGpjFSMLt6/En12v
         YpiV4Pq2HpXaAo0HNicz/rOLyI2ROKNCNSKLwzt5OKXLT9IeE9sE5J5Be9lJZZDNOVlv
         5KPpFeyyhSG/VyieZTnjBBAujBvKh5a7jSgTf1kY4HWXLqVHN9JKefOvHTBWaDKZxp3j
         FCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775915787; x=1776520587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yh2v74eVUgATbTiDREMIszXOd/VRQYJ0x2a0dK2LEFM=;
        b=Wo8Mnfg7KnP1g7eZeHbbKPlKQz2U5o5xxE45pnoiUCiiQjf8WF89vVPQFkVz5sEkVH
         OfNGyRfIz3L51pTCzOOWKQrw7m+gFWQewCO0YCMsBehE30v/6WX9ske+m6tt8/TS/B1k
         WNiizyxh2M/Kx07PsV8H0Ti5HfMz3fLCX/Ab+Qyinr8AqkYLkSMX9cCcfN7qd244+OQ/
         is8bI+Fnign60qOgT9gJ9BbALV9dCk2adbXcsnA+fPBSeKXzYZV7Z7ZmqnXcUAJBaHyF
         Ra2SsR7sjlWpIzWYnKOwr4Qce57CszltvGbLBa0uhgw7qmT1lZHzzbGjJgyM7eKdP5FR
         EI0g==
X-Forwarded-Encrypted: i=1; AJvYcCXQqB/ogtHuweLred0FEVU7zl8W/4GfFrNG3OXpvPPwofkXeDHdBUeMVbDJyicf02LjXOq0iNHSq9rzoVtR@vger.kernel.org
X-Gm-Message-State: AOJu0YynmNRyiOUFphT2Ui5iGYwCZdD77xpAzHPs4wZWyYW+8xuPF2YD
	/OcALMQY4yNAFnDqehrRMV+S4NA1Bcrc5vqPax7vL5gNIriNvo3ooEY2qtirG3X2obf+jB5PApc
	LXDHgp/25sz3GxZtEoMDxMiVS0Lyrm+LL6sytHdPtBOc1BWYkWArASWNkBXzyJcU4PLGRNOI6EH
	Vb7CXBbrp46vBn0tFKGtUQuvMNARQVXybcXHrPF9sFqLI=
X-Gm-Gg: AeBDieuQrsxhRqb6dLt4k9mBl8+UjsUDGPE5s5FPtTObp7F/Iem4P2CAafwpLZ09hlV
	5LYiFTCRDyxXkCVCv5vAZOlU7oaa7jTp22FGKKVSQ2SwKRioHktXznWPDBZWpLsph2Na3FehRiP
	XCo3MDpFJMJmW7ftoSp1JvWiH3OhFjrUgPPjjSY2jTgsjOHTy1t6SZAAlKIL3t3B3Ore7SIjWMJ
	99QaLQndMJ5VxqPGt2OQq/r2GfSTv04CjdOCw==
X-Received: by 2002:a05:6870:1704:b0:423:b4e9:b8fa with SMTP id 586e51a60fabf-423bd0ca63fmr5438598fac.23.1775915787010;
        Sat, 11 Apr 2026 06:56:27 -0700 (PDT)
X-Received: by 2002:a05:6870:1704:b0:423:b4e9:b8fa with SMTP id
 586e51a60fabf-423bd0ca63fmr5438586fac.23.1775915786551; Sat, 11 Apr 2026
 06:56:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-15-2b53c38d2101@oss.qualcomm.com> <07fcf759-b53c-4bc8-8e88-48b82713fecb@oss.qualcomm.com>
In-Reply-To: <07fcf759-b53c-4bc8-8e88-48b82713fecb@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 06:56:15 -0700
X-Gm-Features: AQROBzA-sRqdmBF_muUFAE2zHOFlBaMvdKWe5l0zbT8wwrPZW6ScfJPwLACwsdM
Message-ID: <CACSVV03gr87bJcywyt1wHoaLRaaUJEmKAz3jTmipUt9NGSqbtQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/17] drm/msm/a8xx: Preemption support for A840
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDExOSBTYWx0ZWRfX/90NLEtF8iav
 x1UZ0mdzH2U+5zVRh0RYaj1PwtRqe5wf317WmFdO2LhSeeJL7Ahs1/3Dqe5Pj7vPej4YgEIupYE
 3DzWsw35W9/ySGSs0sME0HPdzXk6i87pFzuvJjg6KqBRtkfUm4wjk0OeXK68pm54ovd7iVb+78e
 TywEETdES8MxtyI3braxJQL3ET5Hcm87B4V0JcSzLO+DSVSxJpm8ihN80r/KdPaHrjBQc0abJfG
 5hvS1rT+0+LXZyDqfRt6JUp0QDgMUeX4zlBHgdkW9thiD8u3CTWzkxZ+78h3zwAbRABkLXT3Bb3
 +brHaE9FQ3D3zcQgS0XXTrJA6AwKgcjAiR1ULwwTj8asRhFP9ofU6/XBQMrqsIgQScrqRbhkUt4
 EzkoEVp0Vu/a3G4oQRWaJ8t75v8wlpGxu94nsxyclrCWYkftNeSCNRPFn/GCoN6HDS28eatk5oa
 M1RQSF+mJkRAu7XSH2Q==
X-Proofpoint-GUID: KqML4Pf7_dnUTHnQNIRc2Vc4-5fCSjxD
X-Proofpoint-ORIG-GUID: KqML4Pf7_dnUTHnQNIRc2Vc4-5fCSjxD
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69da530b cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=dlYDSFsnk2uCUIF3f14A:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110119
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102785-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 137A03E02DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 7:22=E2=80=AFPM Jie Gan <jie.gan@oss.qualcomm.com> =
wrote:
>
>
>
> On 3/27/2026 8:14 AM, Akhil P Oommen wrote:
> > The programing sequence related to preemption is unchanged from A7x. Bu=
t
> > there is some code churn due to register shuffling in A8x. So, split ou=
t
> > the common code into a header file for code sharing and add/update
> > additional changes required to support preemption feature on A8x GPUs.
> >
> > Finally, enable the preemption quirk in A840's catalog to enable this
> > feature.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/Makefile              |   1 +
> >   drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   1 +
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |   7 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   5 +
> >   drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  77 +--------
> >   drivers/gpu/drm/msm/adreno/a6xx_preempt.h |  82 ++++++++++
> >   drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |  37 ++++-
> >   drivers/gpu/drm/msm/adreno/a8xx_preempt.c | 259 +++++++++++++++++++++=
+++++++++
> >   8 files changed, 389 insertions(+), 80 deletions(-)
> >
[...]
> > diff --git a/drivers/gpu/drm/msm/adreno/a8xx_preempt.c b/drivers/gpu/dr=
m/msm/adreno/a8xx_preempt.c
> > new file mode 100644
> > index 000000000000..3d8c33ba722e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
> > @@ -0,0 +1,259 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. =
*/
> > +
> > +#include "msm_gem.h"
> > +#include "a6xx_gpu.h"
> > +#include "a6xx_gmu.xml.h"
> > +#include "a6xx_preempt.h"
> > +#include "msm_mmu.h"
> > +#include "msm_gpu_trace.h"
> > +
> > +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
> > +{
> > +     u32 *postamble =3D a6xx_gpu->preempt_postamble_ptr;
> > +     u32 count =3D 0;
> > +
> > +     postamble[count++] =3D PKT7(CP_REG_RMW, 3);
> > +     postamble[count++] =3D REG_A8XX_RBBM_PERFCTR_SRAM_INIT_CMD;
> > +     postamble[count++] =3D 0;
> > +     postamble[count++] =3D 1;
> > +
> > +     postamble[count++] =3D PKT7(CP_WAIT_REG_MEM, 6);
> > +     postamble[count++] =3D CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
> > +     postamble[count++] =3D CP_WAIT_REG_MEM_POLL_ADDR_LO(
> > +                             REG_A8XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
> > +     postamble[count++] =3D CP_WAIT_REG_MEM_POLL_ADDR_HI(0);
> > +     postamble[count++] =3D CP_WAIT_REG_MEM_3_REF(0x1);
> > +     postamble[count++] =3D CP_WAIT_REG_MEM_4_MASK(0x1);
> > +     postamble[count++] =3D CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
> > +
> > +     a6xx_gpu->preempt_postamble_len =3D count;
> > +
> > +     a6xx_gpu->postamble_enabled =3D true;
> > +}
> > +
> > +static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
> > +{
> > +     u32 *postamble =3D a6xx_gpu->preempt_postamble_ptr;
> > +
> > +     /*
> > +      * Disable the postamble by replacing the first packet header wit=
h a NOP
> > +      * that covers the whole buffer.
> > +      */
> > +     *postamble =3D PKT7(CP_NOP, (a6xx_gpu->preempt_postamble_len - 1)=
);
> > +
> > +     a6xx_gpu->postamble_enabled =3D false;
> > +}
> > +
> > +/*
> > + * Set preemption keepalive vote. Please note that this vote is differ=
ent from the one used in
> > + * a8xx_irq()
> > + */
> > +static void a8xx_preempt_keepalive_vote(struct msm_gpu *gpu, bool on)
> > +{
> > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > +
> > +     gmu_write(&a6xx_gpu->gmu, REG_A8XX_GMU_PWR_COL_PREEMPT_KEEPALIVE,=
 on);
> > +}
> > +
> > +void a8xx_preempt_irq(struct msm_gpu *gpu)
> > +{
> > +     uint32_t status;
> > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > +     struct drm_device *dev =3D gpu->dev;
> > +
> > +     if (!try_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED, PREEMPT_PENDI=
NG))
> > +             return;
> > +
> > +     /* Delete the preemption watchdog timer */
> > +     timer_delete(&a6xx_gpu->preempt_timer);
> > +
> > +     /*
> > +      * The hardware should be setting the stop bit of CP_CONTEXT_SWIT=
CH_CNTL
> > +      * to zero before firing the interrupt, but there is a non zero c=
hance
> > +      * of a hardware condition or a software race that could set it a=
gain
> > +      * before we have a chance to finish. If that happens, log and go=
 for
> > +      * recovery
> > +      */
> > +     status =3D gpu_read(gpu, REG_A8XX_CP_CONTEXT_SWITCH_CNTL);
> > +     if (unlikely(status & A8XX_CP_CONTEXT_SWITCH_CNTL_STOP)) {
> > +             DRM_DEV_ERROR(&gpu->pdev->dev,
> > +                                       "!!!!!!!!!!!!!!!! preemption fa=
ulted !!!!!!!!!!!!!! irq\n");
> > +             set_preempt_state(a6xx_gpu, PREEMPT_FAULTED);
> > +             dev_err(dev->dev, "%s: Preemption failed to complete\n",
> > +                     gpu->name);
> > +             kthread_queue_work(gpu->worker, &gpu->recover_work);
> > +             return;
> > +     }
> > +
> > +     a6xx_gpu->cur_ring =3D a6xx_gpu->next_ring;
> > +     a6xx_gpu->next_ring =3D NULL;
> > +
> > +     set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
> > +
> > +     update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
> > +
> > +     set_preempt_state(a6xx_gpu, PREEMPT_NONE);
> > +
> > +     a8xx_preempt_keepalive_vote(gpu, false);
> > +
> > +     trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
> > +
> > +     /*
> > +      * Retrigger preemption to avoid a deadlock that might occur when=
 preemption
> > +      * is skipped due to it being already in flight when requested.
> > +      */
> > +     a8xx_preempt_trigger(gpu);
> > +}
> > +
> > +void a8xx_preempt_hw_init(struct msm_gpu *gpu)
> > +{
> > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > +     int i;
> > +
> > +     /* No preemption if we only have one ring */
> > +     if (gpu->nr_rings =3D=3D 1)
> > +             return;
> > +
> > +     for (i =3D 0; i < gpu->nr_rings; i++) {
> > +             struct a6xx_preempt_record *record_ptr =3D a6xx_gpu->pree=
mpt[i];
> > +
> > +             record_ptr->wptr =3D 0;
> > +             record_ptr->rptr =3D 0;
> > +             record_ptr->rptr_addr =3D shadowptr(a6xx_gpu, gpu->rb[i])=
;
> > +             record_ptr->info =3D 0;
> > +             record_ptr->data =3D 0;
> > +             record_ptr->rbase =3D gpu->rb[i]->iova;
> > +     }
> > +
> > +     /* Write a 0 to signal that we aren't switching pagetables */
> > +     gpu_write64(gpu, REG_A8XX_CP_CONTEXT_SWITCH_SMMU_INFO, 0);
> > +
> > +     /* Enable the GMEM save/restore feature for preemption */
> > +     gpu_write(gpu, REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABL=
E, 0x1);
> > +
> > +     /* Reset the preemption state */
> > +     set_preempt_state(a6xx_gpu, PREEMPT_NONE);
> > +
> > +     spin_lock_init(&a6xx_gpu->eval_lock);
> > +
> > +     /* Always come up on rb 0 */
> > +     a6xx_gpu->cur_ring =3D gpu->rb[0];
> > +}
> > +
> > +void a8xx_preempt_trigger(struct msm_gpu *gpu)
> > +{
> > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > +     unsigned long flags;
> > +     struct msm_ringbuffer *ring;
> > +     unsigned int cntl;
> > +     bool sysprof;
> > +
> > +     if (gpu->nr_rings =3D=3D 1)
> > +             return;
> > +
> > +     /*
> > +      * Lock to make sure another thread attempting preemption doesn't=
 skip it
> > +      * while we are still evaluating the next ring. This makes sure t=
he other
> > +      * thread does start preemption if we abort it and avoids a soft =
lock.
> > +      */
> > +     spin_lock_irqsave(&a6xx_gpu->eval_lock, flags);
> > +
> > +     /*
> > +      * Try to start preemption by moving from NONE to START. If
> > +      * unsuccessful, a preemption is already in flight
> > +      */
> > +     if (!try_preempt_state(a6xx_gpu, PREEMPT_NONE, PREEMPT_START)) {
> > +             spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
> > +             return;
> > +     }
> > +
> > +     cntl =3D A8XX_CP_CONTEXT_SWITCH_CNTL_LEVEL(a6xx_gpu->preempt_leve=
l);
> > +
> > +     if (a6xx_gpu->skip_save_restore)
> > +             cntl |=3D A8XX_CP_CONTEXT_SWITCH_CNTL_SKIP_SAVE_RESTORE;
> > +
> > +     if (a6xx_gpu->uses_gmem)
> > +             cntl |=3D A8XX_CP_CONTEXT_SWITCH_CNTL_USES_GMEM;
> > +
> > +     cntl |=3D A8XX_CP_CONTEXT_SWITCH_CNTL_STOP;
> > +
> > +     /* Get the next ring to preempt to */
> > +     ring =3D get_next_ring(gpu);
> > +
> > +     /*
> > +      * If no ring is populated or the highest priority ring is the cu=
rrent
> > +      * one do nothing except to update the wptr to the latest and gre=
atest
> > +      */
> > +     if (!ring || (a6xx_gpu->cur_ring =3D=3D ring)) {
> > +             set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
> > +             update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
> > +             set_preempt_state(a6xx_gpu, PREEMPT_NONE);
> > +             spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
> > +             return;
> > +     }
> > +
> > +     spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
> > +
> > +     spin_lock_irqsave(&ring->preempt_lock, flags);
> > +
> > +     struct a7xx_cp_smmu_info *smmu_info_ptr =3D
> > +             a6xx_gpu->preempt_smmu[ring->id];
> > +     struct a6xx_preempt_record *record_ptr =3D a6xx_gpu->preempt[ring=
->id];
> > +     u64 ttbr0 =3D ring->memptrs->ttbr0;
> > +     u32 context_idr =3D ring->memptrs->context_idr;
>
> Shall we declare these variables at the top of the function body?
>

We can use c11 / mixed code/declarations now.  It's actually kinda
required for cleanup.h stuff (which I recommend for new code, where
possible.. I've been using it for PERFCNTR_CONFIG ioctl that I'm
working on, and it makes error path cleanup much more straightforward)

BR,
-R

