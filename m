Return-Path: <linux-arm-msm+bounces-101163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCGaGwUxzGmwRAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 22:39:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A14D6371346
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 22:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B93A3019FEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA3E3A542A;
	Tue, 31 Mar 2026 20:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExGjnv4c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4/R4ymX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB788378818
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774989567; cv=pass; b=mrhUvIg0Kqow+4FqC2f7TmCnprph2y3wfuOJ2xOth65KWpw+VV6+m0c7ZKFutJQEZmkfiiu4SXzpin8IIQixb8cACmTfBq7u7mX12a+sdaCafADh9++kCjP41Z8J8a4O19YZmIi3DrlJHpwKvX/84+0OlkWApXRwyMS8ndEjNsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774989567; c=relaxed/simple;
	bh=9RL4ly8RzsuImpN1dUX3O+M8HqWHagPuaUs7z3yzxLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jk80zHwQJ+k9ugQJbBcUnhxRC7I9QqzswhMWpdxAfD3batdnAMbqYWPlwz+navjTFWJl8rntHL8l15Rmjy1qA6pNsXXQOKWXgwF+VW57Sq+xHtCzbetcuAUCfl92uSE4qSlYeUIKmA49TLQaWHLNaJtBKAfHAkzUDLXDrjiaJTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExGjnv4c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4/R4ymX; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdFH71831835
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=n2x6RwIuLxR3MCzlHPNU6MwPlfd8sBS5fLS/Xz7Q11o=; b=Ex
	Gjnv4cRYbBcnoWP5H/dLR6n48B9J1sTVKiTQZXxU0BoU8dxXO5dscAbXvvlfVA+v
	DfkwTOrt6dpnY3yIncxH84L5furMm99iMKrhdzRnV5xr8saPU8IOM5gS5QlsD+e9
	nFb9a2lDjTfpOqkcAzksxKv8TKDxBKsOdLIA3rovkWPJ/kNM0cHMWErKb+8p8syC
	oIvs/CxxpCUG3jbbg6faWy3shnAjzSBREbHqKuHfwxqd2VdGLHZoAM0k+4EDHLDp
	WleH3Pt4VXAiXjU3G9IJeubOyhEDlNHVZp+hHLFrlTZ6xAhXhC8b5T5fklNC7RKb
	4jeZ7ijjIqr+FdvB+I/w==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equaa8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:39:24 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d9d3230cf8so1091912a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774989564; cv=none;
        d=google.com; s=arc-20240605;
        b=ZyR5h56VUUO+pWBCywqhYsp4osRL3QUAMLiUv9DJpiRfUB1uC1R+w8KLnXjmz0tLUm
         LHmd+2FpNIbzA/gjZh0kIO+obvdE8HRlZ/OjE6cLbUHNrLZ9xcHopKCW6P0gvzD6CH+Y
         B4gpWwkzH4pNZK9UfVFEvR1LU5mAxf9oTi1tB0JKbq5QHQZK+xM3ZPbPrdt4Na5Db5j+
         tsuTK5i/gN+iIIY1yZnHRDwOpd5Q5XuLl44qqAN84dVpUdFiCuMfdlA1prgb86JWVR7Z
         7wlTrkSVCIZwxYudHen/GJHW+X7pB2GOhhrCfknJHFpIP2uya54dvB71QyTPH7dSGlqi
         RXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=n2x6RwIuLxR3MCzlHPNU6MwPlfd8sBS5fLS/Xz7Q11o=;
        fh=V0T5SvxSjp9DIr0B1/Z6Oiq1JteR6i5bogvDOw8RdzM=;
        b=A+V4uV6hw56l3MqXqd+mOipVS9tJ4dSV+4GScEE6iYqG23i/hP251FMPBzFMMsYkVS
         oNmN9grbc5EWR5p0ouR0PoBlnzhOzFsAloVP6GaPtS8JWwYVjao6nKwVa9baKXOaeD/e
         NisFBRncQurM7ES8mpCEdkVzk0/vVq623pOAAzG2yfsTlS2aQmudZLD/6QS5WfZiZloq
         uHq+UtEoYlsk3ZwM4j7pKKiVNw8OETeIw7R/a65nPP4ZsIsnYxMs2BczWLTlLBFP+3ag
         Vz/BlnZy54uZrNrEf+/WBZoRMCzJmdQHdUhh/TiaVtNxNbYmkdpHOdeR9Zyf6dnXRwUE
         GcRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774989564; x=1775594364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n2x6RwIuLxR3MCzlHPNU6MwPlfd8sBS5fLS/Xz7Q11o=;
        b=L4/R4ymXV906FKdkHXEQkzfwJ1AfGf+nyTMpftZ1rR3GL4uxWfTF5JY3VfnGkF3AZb
         h3/uHUN+w66PQtpya1G3AHHR+y8p5BKL9lKDKKAwSxUlSU++3gDvF8XgxgNZWUnUdi7R
         uMbFzG1Beb0s2Jp3NfYVhKJefqsGf18+JAKqbpXGwEMf+p+Kzv1iS/lwUoCcb/HzbQJI
         jlVy6QtoXf53bBd7qs1c7GSI4LgTMHi4X28w+MvrhHEB3eUEpTHkSBuMmGHUodB4vUuL
         LJmNAvJuxuDamZ198SgsZd5MFQ62Cg1g5Fd1wn9ZdcqPHND//9Kr7ZmLUEQo9Wj+U1GN
         oyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774989564; x=1775594364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n2x6RwIuLxR3MCzlHPNU6MwPlfd8sBS5fLS/Xz7Q11o=;
        b=Xa+5OD+sDWvjtW9MmiUB2WA37CQH9nOYCtVk0et/1wUGuImBzlmTO4jdJID5F0fsXg
         aU+gAIQdOaHOXesaSnkpYvHqjL/+w9zSJIOnHOMks7z2Oj/XgEFUcXh80hCGQ/1eIAvX
         b0z4vcI4w2o+Mq4iukdNg2+vgDIVk/1MLDiV2iRIVwgTQzVhiOljUiuYtuEY6aqUTruj
         z83U5kqrl/IdoIHZumKkGybvRYyHekk8K/D1VWSmOj7UGAwC6Ul/UBZrKpdCdHd4UseH
         XtZ3UYscizuAR39e097y2el+4ZJW5GGAj0/B7Ofu2PyrjGVcMOLKfDNP7Icl9G8/Zd6q
         x3wA==
X-Forwarded-Encrypted: i=1; AJvYcCXUbBpHPJQ8QsuCZ2bIWYskDG9LfGbA/A9JXHpoIrxrh3gl2Z7G/gJrVqalPXtDxglKrGy0mmb3qoeaL7av@vger.kernel.org
X-Gm-Message-State: AOJu0YyiQfVGBYp4j8+EH4Ab8l5i2sfnvSis2TKPPwpo+0mvt4eHz54C
	dw0UBlvvwurnUcQ/SQBAD8DYZ4hlquaQDhpwh8e803XNei1lA6gPrizDs0VQfrlkbXtNjQ+07i/
	1nvzYzlTkv8bcBdpHY0XtsOsQ7QFIdCf9AjCQvpm2KnCswTnn0Y01fcRuwgDFzG2zTvGhlehfK0
	+ThEDhHf3hI+2BzsMXHLXjK5ymG+xA8X/GkLdySyTFAtm6lhB3OGjDEw==
X-Gm-Gg: ATEYQzxYIJcriK6kmbr0kwa1wD8LGpQPYwWAE/FqWVs/6WcwMlqOvSct/iuT1R2aPYK
	W5Ws/DH8l+Lv/U91RM26rcLiS6GgFw4NXI4bZDzt/mPvJedMne8st9p9KtxTYqFjPUpzd0yyRzF
	AVg+Dzk5das3OWJKFrXZ/7cML6mQ6ePS9m9a1oq7Ep/y8pco6HwmgRif4FrXcXYPtPZ++ReUvPp
	EeUjuNGAuA77cicePrJoNje58Rg+q+vT9ULxA==
X-Received: by 2002:a05:6830:1bda:b0:7d7:c79a:cb69 with SMTP id 46e09a7af769-7da3775aa76mr2018797a34.18.1774989563894;
        Tue, 31 Mar 2026 13:39:23 -0700 (PDT)
X-Received: by 2002:a05:6830:1bda:b0:7d7:c79a:cb69 with SMTP id
 46e09a7af769-7da3775aa76mr2018781a34.18.1774989563512; Tue, 31 Mar 2026
 13:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com>
 <20260331092023.81616-3-thomas.hellstrom@linux.intel.com> <CACSVV03FFvi0c4XMEShmH5ou4OKKZcvvni2j=0DBoYnuT55ecQ@mail.gmail.com>
 <bd45632be1a5bcd2ce34834b45a35254e23f7679.camel@linux.intel.com>
In-Reply-To: <bd45632be1a5bcd2ce34834b45a35254e23f7679.camel@linux.intel.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:39:11 -0700
X-Gm-Features: AQROBzA8VsO3mMQtD1h3R-Aco6tohePIO4VrDwi1_DI8AqCbRSrROyb9UzFEmww
Message-ID: <CACSVV01XKYegc3B-WAdDCCPYX1M8As1k42kT75JVjKeY+7QAWA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/msm: Remove abuse of drm_exec internals
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Danilo Krummrich <dakr@kernel.org>,
        Matthew Brost <matthew.brost@intel.com>,
        Alice Ryhl <aliceryhl@google.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE5NyBTYWx0ZWRfXxUzrFY5tKZlZ
 I2+if/8xjOV3j0hyD7cf6n0B6PTZn0YQRXHdaV8sZkcxzKzolETvD2XogPRf16nkKceLJUigoOE
 J6YmSgteIB6N5K5Xctx38ptgCvQraHgckm7TqnO1G2uxYTrrLGEB65DwTII2eyrFxldI6J1WQTn
 7XQMcXt+EY6LScqT7u1NUWh3Np+4TDv5nC4q/O35JP5QNqBeWn8B6Mz/aAdmStcnt907NFIaGCD
 cjaA5HuXxKtUTQUIU9dQy8KFZADi0QDvq7v2lNHJ+DWlFVlqlZiO2TRP5i4Fj62cmlubYgu5265
 pNaHKsrlqvdeBW+C7BvHdo08C3Hp36Z97PRqeICWGDAQP/dw8Xi1UMNaoV3DcKTYYQ7xMR076ky
 otjcSEUkAqJQ75Ns1tSv+tk/Pu0Dib1Eszn8m/Tbme+XYom1P0V6fckaUHVdGI984zHbTMh90zP
 RjeCbgUl83lgrbw918g==
X-Proofpoint-GUID: nM0OXkdw-lpQRCdgXL1s0gPF0mrejJTr
X-Proofpoint-ORIG-GUID: nM0OXkdw-lpQRCdgXL1s0gPF0mrejJTr
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cc30fc cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=pqXIF9v9MgCKvzB1QCwA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310197
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101163-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,google.com,linux.dev,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.998];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gitlab.freedesktop.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: A14D6371346
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 12:52=E2=80=AFPM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> On Tue, 2026-03-31 at 12:08 -0700, Rob Clark wrote:
> > On Tue, Mar 31, 2026 at 2:21=E2=80=AFAM Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> > >
> > > The code was reading drm_exec internal state to determine whether
> > > the drm_exec structure had been initialized or not, and therefore
> > > needed cleaning up, relying on undocumented behaviour.
> > >
> > > Instead add a bool to struct msm_gem_submit to indicate whether
> > > drm_exec cleaning up is needed.
> > >
> > > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m>
> >
> > Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>
> >
> > This is pretty stand-alone, so I can pick it up for v7.1.  Or ack for
> > landing it via drm-misc with the rest of the series if that is easier
> > for you.  It shouldn't conflict with anything in flight.
>
> Thanks Rob. Please pick it up and I'll exclude it from the next
> iteration of the series.

Will do, I have it queued up:
https://gitlab.freedesktop.org/drm/msm/-/merge_requests/227

BR,
-R

> Thanks,
> Thomas
>
> >
> > BR,
> > -R
> >
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem.h        | 1 +
> > >  drivers/gpu/drm/msm/msm_gem_submit.c | 4 +++-
> > >  2 files changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem.h
> > > b/drivers/gpu/drm/msm/msm_gem.h
> > > index cb32093fda47..762e546d25ef 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem.h
> > > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > > @@ -452,6 +452,7 @@ struct msm_gem_submit {
> > >         bool bos_pinned : 1;
> > >         bool fault_dumped:1;/* Limit devcoredump dumping to one per
> > > submit */
> > >         bool in_rb : 1;     /* "sudo" mode, copy cmds into RB */
> > > +       bool has_exec : 1;  /* @exec is initialized. */
> > >         struct msm_ringbuffer *ring;
> > >         unsigned int nr_cmds;
> > >         unsigned int nr_bos;
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > index 75d9f3574370..26ea8a28be47 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > @@ -278,6 +278,7 @@ static int submit_lock_objects_vmbind(struct
> > > msm_gem_submit *submit)
> > >         int ret =3D 0;
> > >
> > >         drm_exec_init(&submit->exec, flags, submit->nr_bos);
> > > +       submit->has_exec =3D true;
> > >
> > >         drm_exec_until_all_locked (&submit->exec) {
> > >                 ret =3D drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> > > @@ -304,6 +305,7 @@ static int submit_lock_objects(struct
> > > msm_gem_submit *submit)
> > >                 return submit_lock_objects_vmbind(submit);
> > >
> > >         drm_exec_init(&submit->exec, flags, submit->nr_bos);
> > > +       submit->has_exec =3D true;
> > >
> > >         drm_exec_until_all_locked (&submit->exec) {
> > >                 ret =3D drm_exec_lock_obj(&submit->exec,
> > > @@ -523,7 +525,7 @@ static void submit_cleanup(struct
> > > msm_gem_submit *submit, bool error)
> > >         if (error)
> > >                 submit_unpin_objects(submit);
> > >
> > > -       if (submit->exec.objects)
> > > +       if (submit->has_exec)
> > >                 drm_exec_fini(&submit->exec);
> > >
> > >         /* if job wasn't enqueued to scheduler, early retirement:
> > > */
> > > --
> > > 2.53.0
> > >

