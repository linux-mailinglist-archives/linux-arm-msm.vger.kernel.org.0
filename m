Return-Path: <linux-arm-msm+bounces-103955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGslFs5352nf9AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:12:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9375A43B2B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 344AF3045ED4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 13:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFFD3D091D;
	Tue, 21 Apr 2026 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6xissAX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UebJr2og"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F026316905
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776855; cv=pass; b=g/37BugEYbaBOvedC+pp30TeRX+tUncq9TevhodO9A2zym3mbX70TzSW7TwNowoz6pzCvr3KX8472bk2CmrOHAhVBFz0bE+Y8dz2WqbyFw4NsUnKT5IMUsKAbuvrl+yzsQCWmUX4hs/bYFby/9gTVjE65C9GlUIHIcLXZ6VfK3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776855; c=relaxed/simple;
	bh=rsYD+TUKf8IDYp5XFzgrpQrtgAWNBZNeemK1tR3Uc4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXN9MDgcjy6TYccTamYhYnCV05Kjrprm0wWUqXSMmyUWBqumoIHgoN51B6s/KpuiV8GHoCSffq/WwN4k0/Ygq6dyAP9SzHXkN4BmTZayFU9ZeHSez6PkksqgmdoyW20O/HS5aMvWgXnk8DCP08xgmu0Hig5xz2WkgHlO+BpSl4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6xissAX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UebJr2og; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LD7Hrk3574225
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=+m9d470AcBWT3RX7HkoLibpXjEoZwApzxhEhxK9DY1I=; b=b6
	xissAX6chkcXQB/h/iR3jOYV8PVRk57uEqtHaOhRJDhGX7ZvVXk32VobOhPMQxWK
	DZCtoeJRm0OMhXTKR3yu0EQmCGq7nzA9B0Wi/ZBsnad4wigZEVfsAToJbzUG0uRt
	nSLBZ7XUaVAApje2ysL4XKkzUA08d+kNWKk9dAf5Ii+8c7E1BQ3D0K0JRpIh2gTk
	JnZSf7VDRxcykazriFHu8tsjWLLay4415w+pJs8XE7dVBYXZID8sLoGDQRlc0VAB
	HLaGQOI4bkI90xItZsVuKN36Bq3BDbU8q2dxJVRQ9sj62MGjbwgZBM0NaPbc7uOw
	x3k8v41Cq0MCat2gLrSA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465hct0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:07:33 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dbb97a2b6eso8187071a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776776852; cv=none;
        d=google.com; s=arc-20240605;
        b=VJg3I4QSh9ifIqb3QFLwLSEYC3PHVvaflFgrNxGKb3Ah0eqUAJUxapfdXcKXDHrIOg
         ixKKFOqOVd+u7spM6OY27ywLoqtbwxTTnhqwlGFs9T64VORFsl2QdypfhpHM99abjJjI
         5e5cD/06hIn9pVhRgFwJyHpf9YzxBubm3VcSvVIy1LEO/ahFHkDuVC0Y72YgrnbFkfMe
         QapmJgehLTI2ZWgmz/8xF6drVW65tsq50+wEwKoFJ/fZO+gAr4xoPIwKn26bT112HytW
         6V0yMBChgOP2cXzoS4GpxXUJSQks67LH6tHE1zflIw+5XAYcUiXR+WhXy18+Y7Y7hluI
         Un6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=+m9d470AcBWT3RX7HkoLibpXjEoZwApzxhEhxK9DY1I=;
        fh=j1su3z+vDIdNGogxymYO+RxipZf0i1tfQNCvL3hqXgI=;
        b=hETRhRVlKCV/CVwcjFnJZ5v9Ck4rW84wDVXbrV9bNoOq3KpNEmIMi9nSNNUATCgeOZ
         bS9jTyvadYQNpYezC9H4mEFirzy4xkb5xSMZQ4oDeWB2YxdTMYRUqOR8x5calaKuE29E
         cf0dPxWgnL5y5yiN2eaTkUMFWrFzZiEwtAtZbLcn4pBjXGCOIlAj7xK11rSiNcz5cXm8
         Dk3fuxtQ3g09NpUqmw9JmCdTdErbPsYOJQjz9SU7aY9G6KLU0arF+qhybbLYTzS8kW10
         dv0dWyhOfVT0l85fOCr03nvjCHRywd+267tAfSYcZxzzDG84XRBqjK8YvsY5HwciPfqN
         gxKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776776852; x=1777381652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+m9d470AcBWT3RX7HkoLibpXjEoZwApzxhEhxK9DY1I=;
        b=UebJr2oggM8HTQLVeAZg5foUBuiGy62qjCx+F8JebgbXsEMJYXNMGFsWREzKiTY3h5
         RExIkHyQsI0AaaeswPq8Qwd4P606/0GaaNhgCou/m0PncR13xlZ1yqVZ3pG7D52LxSBp
         g/maCQ1/nKTfJXWohG7V6s/6STCRygX/Y4E36giIiEPRfl/UDO0vYdDF0f3K1FS0Mv0n
         pqnn3H/B4JCGiQMr+g3mtWGLUoOCUXdFUBocakuTOf67H40Gw5hfynqf5D7gsF9B2zgy
         LAISzpOQIGNUMjopPcuC3GPsKWCutJvuvKNkjMhdzvsGmZpBjTKsiqpQHfjuHXf82wEI
         b7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776852; x=1777381652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+m9d470AcBWT3RX7HkoLibpXjEoZwApzxhEhxK9DY1I=;
        b=e0yNAXbnbw57vqg2QUm+gsryF+6UoKdq4KtydprUeH82y+apBHSKVD5Vatpl0r/sL+
         kfBsOduSpRpwTZjWwuLUkFmm52EAQNwAO7AK1vc5+w/Ye2y30OCGYu5ozQ+fCyVlkqnP
         PE3JimMbbdXhQku3dBrhV4qIQUU81rFVcaT/3RIme2fFjyMiG8ZZe7ck7FfWPO4Uj1hS
         JBXWj0EV3zPuLCgL+eDi/kcHIgtWgEMJpUeiSYsp3Ahk12UCgEUZ8nh8gv5nJJ4uopWj
         SwaaBcLzf+4mgNAeSAyPX4UmkagLgPInolYTeCzPw34MP/FqpBJSPXxlX8NM6DiIC0Ry
         cgBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bTiI0X7qA10PS3QZz504VNLnv6/BVMXjY1MWxq/NFGi9zo7kTp8TK+nQZBMuWKQx5fa3XhNu0+AHCai4n@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqz82lmFomL01nHdybB5e5StZszl1r8f0KOWZwnnlg7XEVO5GU
	daih6tfwBFg/xo4elb5MdTnuEsxvk3XypOwTC0PMT55Tps+3+JHkA0ZnlDx7nMBSqGt1AhDWRsa
	JrzHd/5LBA2Hf9YbKR6X33tHCWiFlBNaU2hjQSYtIXFOCVpsz6wka7n4+3iO+v1KDfZKVt7E1g3
	IsM/RlSKtuES2DcdIXDva4g2L9p3VdV0xiaVue9/biZhE=
X-Gm-Gg: AeBDietYyjDNTfQ7OMcQnZlYxqgkYjbaunLwfh/FFFFerRBK8p7oIQcHN3OyE2IB+ji
	Iblrcgcf98LVvATkQW36BOmf5uAZQuLayCi4V/aHfynuzXCfVT2fEu+1BxIodO/5nrKPZD5nF6c
	LzuBZn0+APc9KiKyBZf0wFlPsWERLCA2+mOB0EpxABYur2dO7AR/HyZwEGObi+sz2z7qV7htSmZ
	+HcgoJQfp8bAE5rNwBZ9mgWaYZHqoNIL0P9r4nIQQ8A/lms
X-Received: by 2002:a05:6820:98a:b0:68a:24af:ac51 with SMTP id 006d021491bc7-69462f31c45mr10520662eaf.55.1776776851770;
        Tue, 21 Apr 2026 06:07:31 -0700 (PDT)
X-Received: by 2002:a05:6820:98a:b0:68a:24af:ac51 with SMTP id
 006d021491bc7-69462f31c45mr10520637eaf.55.1776776851292; Tue, 21 Apr 2026
 06:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-2-robin.clark@oss.qualcomm.com> <sidcsgvqxddatwwflohsd6gjzm5ehbs4alwaejh3pnjnlhj7vm@nqxhdtxxxizs>
In-Reply-To: <sidcsgvqxddatwwflohsd6gjzm5ehbs4alwaejh3pnjnlhj7vm@nqxhdtxxxizs>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 06:07:20 -0700
X-Gm-Features: AQROBzBCyjkFKVyWldLavMg98hNhLDQoe0JaPLwFFjw1Q5YUaiV57PzOYApag30
Message-ID: <CACSVV01TK+iLiaCofFfPU2eeMGT5HX5iW0rf=m+gjojXsjrk8Q@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/msm: Remove obsolete perf infrastructure
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEzMCBTYWx0ZWRfX6My/WrQbfQf2
 xwIIYh4syo7haAAZXpCFb0qSLS2O38u+SbIKiKcIQG8jXFrDLz76u3lViChKhgoykd0lLVnY1mm
 yBh0NS0D5NDYsrl3aDHeUxz/KCDMxpnQ7P2M6OdHhzADzCUZQ5gNOwsLe8K24GvS2zhaAFTvW8J
 OxHoIiAlab7/kUhp7CsG70urDjXpDo+ov+G3p9RAWdO18N8lfgazmcIRgQjpZZLRgO3r2lYbq1w
 M2VVVLdDwHADuOM8KrLDyVftlFYXyUmr9mwak+Opz6O99s1qGLUDdX0JsWbhUpW15hN8jBDpClv
 jjuwMhlDU2JDysSrjoI7PdnvoW7hDH6sf4DvaWIHldpmYFaeJkFvswwW0HCx9ODnSGNf29gMcrs
 WqV6joU9eYCO9cV6KA28UHvuhmJU6OG37fJngHxkP2ZDEbMagyaIbxx0K3MbcOfJNfC/apVAOGO
 2gjN6QKst0GloJnlhkw==
X-Proofpoint-ORIG-GUID: iEWJzGodTIKVYGRco_TKjesyv_qk-FA8
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e77695 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=jFF1PNiZaEqFOHtC3HQA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: iEWJzGodTIKVYGRco_TKjesyv_qk-FA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210130
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103955-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 9375A43B2B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 4:49=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Apr 20, 2026 at 03:25:23PM -0700, Rob Clark wrote:
> > Outside of a3xx, this was never really used.  And it low-key gets in th=
e
> > way of the new perfcntr support (or at least it is confusing to have tw=
o
> > things called "perf").  So lets remove it.
> >
> > This drops the "perf" debugfs file.  But these days, nvtop is a better
> > option.  (Plus perfetto for newer gens.)
>
> Would it be possible to resurrect "perf" later? It was really useful.

Nothing is impossible.. but I was having trouble naming things with
both old and new perf stuff in parallel.  Is it really adding value
over nvtop?

BR,
-R

> Other than that,
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Makefile          |   1 -
> >  drivers/gpu/drm/msm/adreno/a2xx_gpu.c |   7 -
> >  drivers/gpu/drm/msm/adreno/a3xx_gpu.c |  16 --
> >  drivers/gpu/drm/msm/adreno/a4xx_gpu.c |   3 -
> >  drivers/gpu/drm/msm/msm_debugfs.c     |   6 -
> >  drivers/gpu/drm/msm/msm_drv.c         |   1 -
> >  drivers/gpu/drm/msm/msm_drv.h         |   5 -
> >  drivers/gpu/drm/msm/msm_gpu.c         | 107 ------------
> >  drivers/gpu/drm/msm/msm_gpu.h         |  31 ----
> >  drivers/gpu/drm/msm/msm_perf.c        | 235 --------------------------
> >  10 files changed, 412 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/msm/msm_perf.c
> >
>
> --
> With best wishes
> Dmitry

