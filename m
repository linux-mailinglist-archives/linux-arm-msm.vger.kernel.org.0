Return-Path: <linux-arm-msm+bounces-95666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLVdEf6bqWnGAwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 16:06:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6239214290
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 16:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23EC6301DE19
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 15:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF50839FCB3;
	Thu,  5 Mar 2026 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8gCH7L4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0iCCePP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507BC3B95F1
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 15:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723009; cv=pass; b=fw1ulu+lxmw6djfOU6hJ/y/IftXgXbwA+t+s7p9pWVaknC0AQqQTk1V34WVF+rk/Be/AjLZ5swmj+DMiecmf1m6+oEex93w/wvGn79KGCGbls90Skeo0sWpL7Zlr1VKNoNuveWYcRf2T0sBVRjCviUPh4u0CU2nFkwlT5Kr5OOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723009; c=relaxed/simple;
	bh=kuQtYUb8Th8APrt/3MYJZ+wk4N3GYmH/WpmA+L4581Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+E52OiIPgXci2NUGIogb9GDS64DTktJR4VDiLoIZB6Nmkn338Z5zbrpVTwnIGIgP6tKh68Rg210Vn778MobU1PDFZk8woZ6jE706s/noyo/rb7tOOq+OawyKrXEsPgkcL+tch8kKKOP9pVvnWZcyPYHZmVS3b6AqToEhS0G+JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8gCH7L4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0iCCePP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFpGi917271
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 15:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ejTcTE2T1qRg/5f0YDJu8m4fa4521jxxFWERnh0RJe0=; b=Y8
	gCH7L45JWn/HjUc3BfuZ9xnEPbncSbpCEdBBjfN8kz14pSFI9Ua8RSKa4uroPCia
	PELpbRGQWV7h6iHPXi7JLlZwMM7OhoK4fdFUcpfLIbbqJtnoq5kgB1egGrTAKDOj
	dtn/1Fn7KWd5nDw3GNKUanXvI4KY9Hun50QtRkPBTZjKqysRQ+AP4YdnU4gLHcbn
	NjO3CPzLB5dDCWX1gQXLAdSC+a7v7zOnltxSMLJuEpmRtUrWdeAxc+NzYiI6bn2u
	0Owkiq/gP7WhCIYmVVtYgToFGomlvbj+ZTDYM0linp54IJAD4/Mu/lyGz+CPUVtS
	7DNERbpmRU4ziL+rHbFw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380swbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 15:03:27 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67999892f00so144960573eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 07:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772723006; cv=none;
        d=google.com; s=arc-20240605;
        b=bIWTQQqFTr/1tHwvDsLeAPRQgt/PwpU/VC9oeY/m7l93is0wAk76jxY2lHFHlrBDLz
         a4R4I/2hQjCoU/gZ6UN5I84w8rVFvH62tMXrLJtGwmVIbMVwsJ3ivj9IdmhOA/Hb0xqX
         UT1zv7f1p8hq3VR6zSUbz+Jjnooexaf8vEM+ApXeO9Yw3QcNhRk5RPQpdbaiPCLUQ+sP
         JnWena2xPFF6eSSncJnxgNRsD+Oq0rzRkkq6e3Z8C5xzaB/xdTJoyjAyTWyDO2TfsZW5
         ICLbe55Qooc5ItDF/216M947Dp/fGYifXeHUCPDn3IqJu4GiQS44+CZMpp2CFN6LXPdC
         mQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=ejTcTE2T1qRg/5f0YDJu8m4fa4521jxxFWERnh0RJe0=;
        fh=NrTqf3MZ5/B0r4sn+JyHZ+fIHn60dwX/k1lfisk/rG8=;
        b=OgLqiFwlBZUdLZivX3MMU64DcChaCHGoO/Gmy2Vn385vL2Nn6ivfq8j7dkw0KzgoOC
         RzKc1l0zhpYv1moSn63R8UurIPlEyYf7xPLeko7qSvmeCXHQQf1G/GpfkutsnqvjCyb5
         K0qpk00IV9ps4dMemvrg8PyMvnm4meq2vz5/LzEMSb4/L3n+Q60KTKsAGJWl03mPIhjK
         Mwo0BwnGdir4jIEqlGHqkxYFIs61m6OzMD39owqitfklyDBYEw9DZ9XdjOzLyYMHhu6Y
         VukYG8VvB9iMLREfCwMWk6vAyTcSFYCAUuSG56L8eI9oFllp2BY7I1dNteEK2tcvb3Ck
         IBlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772723006; x=1773327806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ejTcTE2T1qRg/5f0YDJu8m4fa4521jxxFWERnh0RJe0=;
        b=f0iCCePPMYxIgZ5nrmEzn2LBY1pW0C/Q/e6w+vGlKunI0YqWiUfnzHEkmdUJKXB/qN
         5F5gtSYZZHFiMid78UiyKK5Ubjk8EnulT5K03Iho8N5q2Bqa/Mz1S4MDWYrS3H9C6UsQ
         C2kpJKQSLAOegVvwy+hfNdf+72Gq1Ix/IT8jTqsek2PAFQv67PeIfp3WY4oqift+CvJ2
         Vn+rVyWVNRgujHaOVCLomZZWYEfFOU5OsPGRYs7+kJSbcDIQ/Uz61w4Xwm5oFND78SO1
         Ztj1/bWi2z9yar+AKd4BPZERJ8MnqMoETnzHJ8sq5OrQVPedao7O7KjmpbVfaua7A+v/
         U9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772723006; x=1773327806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ejTcTE2T1qRg/5f0YDJu8m4fa4521jxxFWERnh0RJe0=;
        b=Xq0FV9q7w2hR9FdMRrqdOiM3mKHBtOiS/9b3mgVLFqx8Q9gYTUlLvHUulOpPmgvMlJ
         qDsOsTl/g0F4X9N5L/iATGqfnVVVIyvlbYCvJx5cLzzCx3YmANHiCy5BsEfIc2Vgc9/6
         2fuFKkW79M94erptxGMNjrTS3RVdhdkmIn00nJ2IGfrlT/umyz8SP2BwO+mZkNVdyWje
         kWK0glgVOuJkvmsRjMF0XTgAo/fzigt4fyYhAWfCigTP+jmqwHMu5nVEED6HFnr38010
         +UYR6cp5Oaz7CQClj9NrOSkmdJ+orFORiobEYUmAj400khvl91nguCWbVCO7DnHWsn2P
         yPPg==
X-Forwarded-Encrypted: i=1; AJvYcCWwwso8tJUAK8LeaAmVGGBVt+078x+CpRi9ySqAbybkShzw6mwBQVCdiQKmcG1JnnY0ukOdQ6yLgOQziaW3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw4lGkI7YLPOH21PXr39WLUaLE8yS6l/V2BRaym1DQGzhWqvkQ
	plsg1oMCuxH6Z6SJG7W5VFJsShtkoTNx7Tj/PUxIEDnUgTd+RZN0NZBEvNEtsyzdgXfCUEBLTBk
	0BBgFVhbDd82HN+SwHk5r0gQMJtoOBmR32Zy0HoY54LfGbLfjp8hgSSNua2fZXofCYXgcKw4WK3
	97LQA/TeoAx7yo4UJtqhq1IieGa5HxQaU+GIL1hkvEhHo=
X-Gm-Gg: ATEYQzxSr5ptUTb4VbhXj785TatKZocPHBR6kxS2kmTvqNd31sAvdrAGSCKAL7wjULC
	eOClEcl1Kx94WZk8YT4HKbNQcmznd240f6aByHKNYPmGE+9/f65dUCaxQtUnZsfg+Ba6aGiSEuU
	O67AZupxu7Km/Vetu8msZk3+i4cjykhORMcV84TTScOpd51fkfYoPiXChzVik7YdY94635v0gRx
	eiZcP0oMw/Rj4xuQuPnY8tb0QoSObSxQZJMJw==
X-Received: by 2002:a05:6820:208a:b0:659:9a49:8f9a with SMTP id 006d021491bc7-67b176f9f67mr3931573eaf.19.1772723006332;
        Thu, 05 Mar 2026 07:03:26 -0800 (PST)
X-Received: by 2002:a05:6820:208a:b0:659:9a49:8f9a with SMTP id
 006d021491bc7-67b176f9f67mr3931529eaf.19.1772723005755; Thu, 05 Mar 2026
 07:03:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
 <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
 <CACSVV01M7YmW1OCjUQ+QFRpXHoY055MEnBCczeG1zRuQyi8z_w@mail.gmail.com> <fpeatj5yrhp45rdd2qzcdtltrofr67noqc7fygsisyaquzx36o@ek3mfy32z5rv>
In-Reply-To: <fpeatj5yrhp45rdd2qzcdtltrofr67noqc7fygsisyaquzx36o@ek3mfy32z5rv>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 07:03:14 -0800
X-Gm-Features: AaiRm51bDhvB43EfwoxoSRnaOyoFThqhuUzYzZWYldhnSsTl3epiIJCXPrkywEM
Message-ID: <CACSVV02U1+or3yo5biOZ6imkkoExNPeDCmgEUWKc04ObbsikuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a99b3f cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=ASjFhuaS4dzjz75NzcQA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: yb7lAFvnboIX9ZKD3nrAPSVtONB7NnIG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEyMCBTYWx0ZWRfXy/g7hgSkMyPr
 Ju9IvtPN4frvC7Q2SBkc0dYB0MSNUl/1QoympvVMHyZjBVA983qXRUdYZOaBIiKprEvuOMthVsn
 CUusSCIs0/9+cEE4zi3s/y/wgDS+9MLmDgjHRzFV+eNqLALS7LIKm04QdEpClykvsF2aVKY0VPc
 zNtokDh0fvnbFLQ0szOSo3krBUoS7weeNkMoqp9XURo+vxWdom64ePANeaWCcxDFioluZNKo0rs
 vhiC2evapblduPVRQ6wokJv1px2fAO5n3Qi/f0wklRm1iVbq7K+YILZ1y9SXXJfxc34gLQlOgJW
 /KmfcCwTyUkSBBqKsls257Wn7qamoXSY19CYcfTvne490L7eVu0GqaoOeYg6ljKQ46gOPeoCNmO
 UQNuV7jgD6khWpdglXY3Zn2qnI4RtP7IWQWsCDhlItXrENjjfscLBzD60ZBeLOUKioPFWzJgfqg
 o6vLoHoMzECyHLHfJUQ==
X-Proofpoint-GUID: yb7lAFvnboIX9ZKD3nrAPSVtONB7NnIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050120
X-Rspamd-Queue-Id: A6239214290
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95666-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 5:03=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Mar 04, 2026 at 06:59:42AM -0800, Rob Clark wrote:
> > On Wed, Mar 4, 2026 at 6:57=E2=80=AFAM Rob Clark <rob.clark@oss.qualcom=
m.com> wrote:
> > >
> > > On Wed, Mar 4, 2026 at 5:34=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from t=
he
> > > > KMS driver, imports them into the GPU driver (msm or kgsl) and then
> > > > uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: =
Take
> > > > the ioctls away from the KMS-only driver") dropped all IOCTLs from =
the
> > > > MSM KMS devices, pointing out the need to use dumb buffers, however=
 dumb
> > > > buffers should not be used by the GPU for rendering. Restore GEM-re=
lated
> > > > IOCTLs for the KMS devices.
> > > >
> > > > Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-on=
ly driver")
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > > Note, here I assume that dumb buffers generally should not be used =
for
> > > > rendering. That doesn't seem to be complete truth as Mesa kmsro on =
MSM
> > > > devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resou=
rces.
> > >
> > > That is problematic in kmsro.. (but also unsure to what degree kmsro
> > > ever got used "in production".. the x86 drivers don't use it.  Androi=
d
> > > and chromeos didn't use it.  Etc.)
> >
> > (also, allocate from the gpu render node)
>
> I think Asahi and VC4 allocate buffers from the GPU node and then import
> them on the render side, but unfortunately iMX IPU driver doesn't seem
> to support PRIME_FD_TO_HANDLE.

I guess my general suggestion would be to allocate from GPU and import
to display first, and if that fails then try the other way around if
that fails.  For kmsro we could handle this by providing our own
ro->create_for_resource().

BR,
-R

