Return-Path: <linux-arm-msm+bounces-63451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CA8AF6244
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 21:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E4901C47686
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 19:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37CC2F7D00;
	Wed,  2 Jul 2025 19:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gz/Pxbg8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A9C33062
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 19:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751482846; cv=none; b=WGCVXNzoyUbEE4zu8JQUiZre74O6+WsYXqVHZ/UvPgUXEPytThA5qGKu07LVHdrrMEbZ4q2F9hvVP4cdspXG+e08erPwiBr/OROZGz8ivZrhPhiPgKsXIizbMn9KXxMZALTG4/zzw6BrD996NfOoAMTVnpfNM0N/ZEY74K2cUZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751482846; c=relaxed/simple;
	bh=ZzLpMwX5WzD9jwZ44+XEnxN0FLfWhUHz9Fj27k89SJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=IDfJZiOeZs3RjyDk7Tt41g+tzbZWOgoWF5xdv+46m0CJLYD2FRrZpgLCCafEzq9n1WClycZX7bEc9ze1AO41u/WmasMZbu1U7UPrGUyqnJTo6KKFq+mDJtHxtgy1ON2GYSRctxvBVNhr9QkygsektE6m1ZTtvHQ+vMPZRPJfPxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gz/Pxbg8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562DJGA2002460
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 19:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=+Hi4OFWQN74gf29SCjhq82t1+AZHZTzvICMf6bwxODM=; b=Gz
	/Pxbg8eKHb4SIWYa3Jpwtgl7ikIocw06njIAMyI42GsMJOQnEn5oIaGxvzq05oQZ
	dVe1jWW4gBmrjL46GwVZH1vLbyx9ZFs9RH+AEFv+73sXbU74mhY4ca7Pbyc36Xq8
	GG7QXJwplPhdzNCxvgK2TMcG/YJRzi8msy6/893JULPtwAdpRDvpG9KBH7ciDznK
	rm5IqeteztpSddQQEN8ZzqTb6/JFc8ApsFphpLlntO34oFXJ/k1QCXHOX435Hcss
	D1PNr2nv5DNf/oaAicOQOtRGKElEhB+lRt7FtL9pqwM137GKc2eY1RHbhCV4+XTQ
	3qFr7shggYccs0gDoS4Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcwr75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 19:00:44 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-40b99df0be7so648990b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 12:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482843; x=1752087643;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Hi4OFWQN74gf29SCjhq82t1+AZHZTzvICMf6bwxODM=;
        b=YXJ/dLo6svl/ieL8OXBTQztBdeQx5IGUDcootrTdW8l4TlhO6wCawpK3OU/+cgzKWt
         79bUFu2FQHIe80+6F2Yj0txeJllR/gK4oiN9g3wcpWR2uxta9J4rHlJ6OSBDJZqaOUhA
         pYdeLxL00vQpWqMIcBknloSEG2uELzPtm6EMFI6oPne0EchhGvpTLIVyIqPMmkitmpJk
         gsn8cWdnY5ERQknOEEJQ8dj44a4AXNjXGD6vQAhgg3Gip8tNsUtz4T39V1jkJldDJnPR
         hv5yGIYp4oz2DQJpI+KYQKe/mwiWO5aVrVYmo8f4t56gQm+MJqrcPu1GLE1j5VB9Fak0
         kJFA==
X-Forwarded-Encrypted: i=1; AJvYcCW7Oj15YeBBEeBYzW1s20/sM1NtNEP+t+vcgKXlC7eMwNYk8E+RPHWPhO+kNfpTA8bw/5M3XmuFW6cdrsLx@vger.kernel.org
X-Gm-Message-State: AOJu0YyJr6m6buS7Khux5T2DxOelJ4d49y2IizZwWFF0wOir2F6bfMaX
	9dWmm/XoDs+ygSa2zbxGj+SmAWIDvYitbEd59d2qC/v/ORjOL/GScRb9AerDF7HeSukl4+AzZ2u
	neuQA0AEvcJJwBUGSt6PETkY62mqJWrrZzFEnODbKH2f0cUWsElLEXdz9MBv3zv5P8XUhLwTU7D
	/p4w4ebnKLvyqm0qHJUydm5AA1/8RPR0sfLNJ8rrnHMO8=
X-Gm-Gg: ASbGncuMnWqngbgwqpOSQTzlh3k0Z/IB5fIqPYkYhRVh6pcQH9u3aqokLfNNgVIe69B
	TKbKw9JC3BOb6vFzDWC4nSGTm+/HRS2AHvWIxRl8C/qJElAjN6eeIms8XzLzieUn16eJ7niRAtY
	ugMB8oSGI6SO3Cski0KzV0M79uvV8+29Zl0A0=
X-Received: by 2002:a05:6808:6d8e:b0:404:8e:69c2 with SMTP id 5614622812f47-40bfdf21e90mr295872b6e.0.1751482842901;
        Wed, 02 Jul 2025 12:00:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRMcrRIZay6hMAGvVa57iatWkhPq9rIs+Lvfh48yNUeZ9KCbXf+fEf3iNU68YsrjhIhBQGRsdLElq5+I5VUjs=
X-Received: by 2002:a05:6808:6d8e:b0:404:8e:69c2 with SMTP id
 5614622812f47-40bfdf21e90mr295848b6e.0.1751482842545; Wed, 02 Jul 2025
 12:00:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-8-robin.clark@oss.qualcomm.com> <20250701162114.5gkdr7f5cww23ou4@kamilkon-DESK.igk.intel.com>
 <CACSVV02jA9dFUFuaKAmoOn_wav0V-QrTj4vo6Krr2V4n7MRDKQ@mail.gmail.com> <20250702074835.7pcbjlhczplibowt@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250702074835.7pcbjlhczplibowt@kamilkon-DESK.igk.intel.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 12:00:29 -0700
X-Gm-Features: Ac12FXz-65Bv82tj3yj2dd8MCkuAfc2blW-3OHfQEJHly2NJrDaG4_vgnVPpqaA
Message-ID: <CACSVV00fGkeGKXviFHVR6Qrz+pXLgVSpqr3-4GqBT2TH_nxxgA@mail.gmail.com>
Subject: Re: [PATCH igt 7/9] msm/mapping: Handle larger gmem file size
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: mtPFwowaN421mGZ6_O78LmvfEdtMALiH
X-Proofpoint-ORIG-GUID: mtPFwowaN421mGZ6_O78LmvfEdtMALiH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfX//9Lf+DNzRFJ
 cVqSz3pgGnn0klREvWR3YqGEW1PBZPQwLLJ+hty+0HByO0G7lm0b/eZ0FHmZJMHJNDpq/VT9RmL
 Vcdanh8ebmZwXVIUIIAdCwSP1ezfyNm0JteaYjNoeWePuHRX/T8S8Q2AAw75Hodscd6F/Uhgwnn
 zSOpCmFSBauaHt9ntqBcUIPrj68kzUpmw3OPTWABR/zix1LFwjBdDP79K5024/C862lZt66ZY/E
 mjN1cfKgsJpQdEafMeeJS4cFKfYpGPuI8RyElhoRwaISswywLEwc+KiH6QfXGMrY6iqcRAij1OX
 K8urp+XUKvHZL5nu6xduOElDpzZKRggKm5Et1y7l8ZzPCZPEpgVIOBqFIof3R5BnrgkkJ+YllkS
 PqNrnuxbzgxoF1Ss6m6JVGnDzwG4oAUsT5snurrh2csYwEAfQoVQv4FnRb0Ap/Rp6C5qa03J
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=686581dc cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=FV7_indNlyCjRKMUmb8A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=989 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020156

On Wed, Jul 2, 2025 at 12:48=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2025-07-01 at 11:01:06 -0700, Rob Clark wrote:
> > On Tue, Jul 1, 2025 at 9:21=E2=80=AFAM Kamil Konieczny
> > <kamil.konieczny@linux.intel.com> wrote:
> > >
> > > Hi Rob,
> > > On 2025-06-30 at 11:09:01 -0700, Rob Clark wrote:
> > > > From: Rob Clark <rob.clark@oss.qualcomm.com>
> > > >
> > > > If running on a system with full desktop environment, the file will=
 be
> > > > much larger than 0x4000 bytes.
> > > >
> > > > Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > > > ---
> > > >  tests/msm/msm_mapping.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> > > > index 03a9e814c931..978ea18375dd 100644
> > > > --- a/tests/msm/msm_mapping.c
> > > > +++ b/tests/msm/msm_mapping.c
> > > > @@ -122,7 +122,7 @@ endswith(const char *str, const char *end)
> > > >  static uint64_t
> > > >  get_bo_addr(int drm_fd, const char *name)
> > > >  {
> > > > -     char buf[0x4000];
> > > > +     char buf[0x80000];
> > >
> > > If it is that big why not malloc() it?
> >
> > in kernel, for sure.  But userspace stack size is multiple MB at least
> >
> > BR,
> > -R
>
> You are reading "gem" debugfs below, so this buffer in igt is in
> userspace, no need for it to be on stack. Btw you just discovered
> a bug in igt, imho this function should give sizeof(buf) to caller
> here to igt_debugfs_read():
>
> igt_debugfs_read(drm_fd, "gem", buf, sizeof(buf));

Actually igt_debugfs_read() is a convenience wrapper macro for
__igt_debugfs_read() which does just this.  But makes
igt_debugfs_read() more convenient for stack allocated buffers.

BR,
-R

>
> Also imho it should be calloc() to avoid garbage later on in buf.
> Or if it should read all of debugfs node, make it like:
>
> int igt_debugfs_read_all(int drm_fd, char *, char **buf);
>
> and let it alloc *buf, and later realloc this *buf if needed.
>
> Regards,
> Kamil
>
> >
> > > Regards,
> > > Kamil
> > >
> > > >       char *p =3D buf;
> > > >
> > > >       igt_debugfs_read(drm_fd, "gem", buf);
> > > > --
> > > > 2.50.0
> > > >

