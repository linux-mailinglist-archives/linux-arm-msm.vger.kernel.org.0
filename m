Return-Path: <linux-arm-msm+bounces-106970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLwzJ2kJAmqznQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 18:52:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 064C1512B3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 18:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B23C31EC616
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFEE425CDF;
	Mon, 11 May 2026 16:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnHlNz2W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PwdYLrFA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57C037FF42
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516224; cv=pass; b=GWyEI1KRGjmfB6lEHyBbXUCf9tNz7ARA3sSp/Dl4Elx7LhUsuODUd+x47qQkQdYsb/dw30M+WI7vhOyocP/lPXLD0O71+kARwrSqb15vvQolnbH99CoKR3bk6YG6iHp5swrbMVY28Vn8hVy+Ckjh6V1qwfuBeroR0Xo5709v4ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516224; c=relaxed/simple;
	bh=/3Jcz6Gm8B1qb11OTb9NAMdueGxaS83dGpKqXrha6Ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggBgT6P946OiHkCVS3+27dnDV+JV1x2yfupoHaRgzFuO+DMd2CsuOy0LXBKVB7wjYTLC9/fdchz9NelIcyvVbwtSbGducgNiulv4n2bUkIS0f6bzkxgVQ84+OGYDaY+/h5Yq+vryUDVJ3KYC1/ITrgyBGvYBR+ltApPq3AbYviE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnHlNz2W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PwdYLrFA; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BA52jP2039441
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=OzS0X7IM7l/lLVRxpSgo9g9Bn7AO8/fqwA1ioGWBXaA=; b=nn
	HlNz2WuTsHi/QIKhVv+AiJz76fhTf2cpw1j++qxOQN5lfrQoJCuLB2d1DRmwsm0f
	iLJoe07uzUQhM2D/72d61GlMT5V/tZ7Se5fDT2JX40C4xqY+FE71N3A8TvIrCFrO
	XjhdTeGviKH4J4UMgfeFkUC7MNORQIkla8hMl1SdOvL9i4+l5HX2lL82ZvLkFKKm
	j6hIg1cqhadiuQa+EFgUZ9SgQ1PZ33fqUq6yA5sVJ3/gGICM/ucQV5eH+P9WxJeU
	f8r3GTgGOQwix82NuxlntY06qDSvtnLaITWOHDyoog1bceZcSd4u+gD/w0xGcOVw
	/NfU84/OzUMVIirhGbIw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3d22sgm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:17:02 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-69b4f753046so2075384eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778516221; cv=none;
        d=google.com; s=arc-20240605;
        b=CN63CnAfLcMiTHGvzzTVKLkYreLVU1RM26fvrUmDkEzuUZZtpnuFMw9svK9xytyDHW
         AJTyA4DjAcb7kS6DWQOsNNCj84rR9BTNEOFs0I1ip1U/+JVrqo6sx5rLyuZ36vZISKf7
         vkYxV9WnYmt64HmLjhSo/cVRCK09LlKT2SHaVJqWJXYAzeOaScrJRxC8He0a0iarFuCY
         EV6NxLI59/GwJmMDuKcHcLqQH/LSU2FvAgCahGzPJJnewvKumI+qD25vLLmWnmnDhdQd
         9iTy+KZ2iSu14DjdpURM/ey5SubG8KFkMTOPD5wkKNlDy2zW2Q1nmQYvPRvHz7cCg3Lt
         xF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=OzS0X7IM7l/lLVRxpSgo9g9Bn7AO8/fqwA1ioGWBXaA=;
        fh=2HDQc8evUbQ6czFP74s1B7eCNSHWJaDRIekniLjopEI=;
        b=lXemXBzmexZNLm5ZR+hOkwv8PXfgIkkYkCrb3ChE5da2TvVR0PGvE84/ocZ7iVW7Ju
         lntwSY47N1M9CD8X0wpFRo9sxGyULJiDaZP44Td+CBSrHJWqIxVIDGsTKx8iywNNShz2
         jhhL/EaYYqNUbmEJIrU5SStNdzEMa+zNvYF/L9BOsth7m6a9gcH5wxzAfLg7bbZtPrki
         AV1xx8I7H95SoSyH3NUIRrVAW1N0ryWXoY3CN/BZDGdYvP0zKCnuHzefJXlNSIIWtZle
         mizSN2ISxlK+pqI9sL3wxOZTKFYdResFZduWQWdGlRSVfI+83oQatpZiOmh4v+PYXj4D
         v/sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778516221; x=1779121021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OzS0X7IM7l/lLVRxpSgo9g9Bn7AO8/fqwA1ioGWBXaA=;
        b=PwdYLrFA7BJv5v6uQ1pLk2gguM7ib3KqMVvnyQYIxzhadKb2Df+t+heH008kAtNPl2
         pTEIati9Jo8syZ3S9gfoic3Fg0yTQTM95AkKEq8AMtOySXfvMAXSdyNuG7WizgDQgcNZ
         cPEvm+cuDDES0PQ2e5z9Ny8TGXrbUus5VvDsSJtlM6gfoSrnJ+5FzCm2MTxZxt13cNw7
         8sTa+FWIGxmHbjyty2re38Jj1Mp39j1/ZFzHRkqXVReMKRcs28QDEp0rqrD6w0M7KsHJ
         R2xNaQXEjZeQac3gFwxF+YhP3kzFyrWzcBwSusu8vL0yKeVuJd0RfTbJ837PJu40l2wz
         UmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778516221; x=1779121021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OzS0X7IM7l/lLVRxpSgo9g9Bn7AO8/fqwA1ioGWBXaA=;
        b=i3bQMuNyu2uOprcs0NqaF7dsx3jV5CRhZgqEm/DtSp6LcQMW5FAMMCk1zF3pLIN+c/
         zSR1enm6qNxVjHsd6skprHpGFJmbunLxid8bC+lgKp821EkI22Fxe9rgLCvPVyPLsJpF
         NDTfp+ZAPFHMidJ4kcaYdoTZ4++gJdwnGzosWNhLnLeDU6PRbo87hZnyfKc8PgwwXaoQ
         MvVhlk3Mx5EbR1h6L61akOrhEEJwjaScPKGmcI6KF/QuYJYyRmVuysVu8jo0Arbo3ULh
         V+6miqL6drA98SGMpiUtZu1xCkelSpwiaSA2k+t53dIhSdKsKDkbtE97NNzue7pjSf9y
         LtRA==
X-Forwarded-Encrypted: i=1; AFNElJ/+2UuTbW3VGEFS3u48WAfQu7EXJ3kbUKVHPhUQ/TGyjJdKBTIC1ieuM1hOlbnj4pYDyiDl18K8YjUi9EPz@vger.kernel.org
X-Gm-Message-State: AOJu0YxeSW4hiA5ugVSw0fTWgXga0UYbOMEM0WH7ljs909NflhcUayw1
	4W27OkNFHKeVbAHuw+BwesN7dCF0JPrrF5nqBg5dsBeDeL2CpHqyQdVQ/ixqUD9Zd5Z1/RbLU8O
	FJYA0YaEkOCq+iMKxWXxAfIjPb7xlys2TBM+bgFzcp5gd0cggEiwr9lm/7sZfmkmEUuIjyjahRk
	gMnkpdWHMqt0eOlBVQ8pgQ8OuCLhOECIvWWUN740lz8jA=
X-Gm-Gg: Acq92OEKOgm+uPkHCFiA/1rPo5w7CrY6yOl2+M/k9z2VpGYMCAZhoHBHwwMkKXxYHn6
	dAyS5iCloRD/BzvWG3wioeT6uyprqfEfSXSBB5T1u8IXyDQYi6WB3jv0YOfIDl93PDZxM59/Tw8
	1As2RfsrFU8SZCGTHEeZdDuKWo27FOkWxSbmcrNenej9QyidbgFWnjfmafJgQStFAeF2xAkpDai
	509n5A3LBwI6XVDk3mHsKsXHVXwU85QezNDNQ==
X-Received: by 2002:a05:6820:180d:b0:696:64ab:cd9d with SMTP id 006d021491bc7-69998c8fedbmr14053673eaf.12.1778516221378;
        Mon, 11 May 2026 09:17:01 -0700 (PDT)
X-Received: by 2002:a05:6820:180d:b0:696:64ab:cd9d with SMTP id
 006d021491bc7-69998c8fedbmr14053617eaf.12.1778516220881; Mon, 11 May 2026
 09:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-panthor-shrinker-fixes-v2-0-39cdb7d577c9@collabora.com>
 <20260508-panthor-shrinker-fixes-v2-4-39cdb7d577c9@collabora.com>
 <CACSVV00NdUKe6-05U3g0q5X3tw4zmqO_s2gk-KZxQVykpydvAA@mail.gmail.com> <20260511174429.35afcdee@fedora>
In-Reply-To: <20260511174429.35afcdee@fedora>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 11 May 2026 09:16:49 -0700
X-Gm-Features: AVHnY4I40hrkxySZSpEMeonWzoJt3rA3BByl76Aatz-t8sb8-MR6pz1lZCD7E1Q
Message-ID: <CACSVV02HQ-ci8mHg4os7e-yaf51hdHyQ6cFa9tGOpc9=keL28Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/gem: Make the GEM LRU lock part of drm_device
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EaT4hvmC c=1 sm=1 tr=0 ts=6a0200fe cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=X8FTkJh-O0bHBhosSCoA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 7gDSWhw9ABgAU87wzRgbPkEF-QwxTVtZ
X-Proofpoint-ORIG-GUID: 7gDSWhw9ABgAU87wzRgbPkEF-QwxTVtZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE3NSBTYWx0ZWRfXzIREk5huyFMm
 QQKA4KCk2IbLGNUht/19BFD8ngyWutTyCouAci5APNwJy9LRzMOvoRsfaeHnyZmS8HY40cFgR9q
 JI2zuaKpCO1//CbyCyUJ/DB7fUl9wfePCGoD/X8RBXS6iPvdmZtMDKXxwFnKENZaL8R3KREghkp
 cC+J85Q07cv28bgLaM5IJ4WF/1fGlRrNbSc5cppmonLkcYshcJtVs8ygbLRtt0yug7JmS5IdiI9
 3XjiaAeddRU4XcIVytPZbDDrvszokwBCZvP5uPVuEMRs7zQMj1ic4/gAi7fS2Yqayu0u6OK5G3X
 0WIkKzag8wl8v23U3MyEJOu5fWVthSmW82Q9QdIOP6C/Enf4hDoyRZyx0Zkxx93AV1KVaTd4l2d
 eNpdnSddgDDhFslhUga+GaWEcOvbcJ4oWHW8eplpavWecn0+55StWEuB84lu04xeGNYFBSR3kRs
 J/u4DWvo7XuTJarTT0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110175
X-Rspamd-Queue-Id: 064C1512B3F
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
	TAGGED_FROM(0.00)[bounces-106970-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,collabora.com:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 8:44=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Mon, 11 May 2026 06:18:44 -0700
> Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> > On Fri, May 8, 2026 at 3:41=E2=80=AFAM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > >
> > > Recently, a few races have been discovered in the GEM LRU logic, all
> > > of them caused by the fact the LRU lock is accessed through
> > > gem->lru->lock, and that lock itself also protects changes to
> > > gem->lru, leading to situations where gem->lru needs to first be
> > > accessed without the lock held, to then get the lru to access the loc=
k
> > > through and finally take the lock and do the expected operation.
> > >
> > > Currently, the two drivers making use of this API declare device-wide
> > > locks, and there's no clue that we will ever have a driver that wants
> > > different pools of LRUs protected by different locks under the same
> > > drm_device. So we're better off moving this lock to drm_device and
> > > always locking it through obj->dev->gem_lru_mutex, or directly throug=
h
> > > dev->gem_lru_mutex.
> > >
> > > If anyone ever needs more fine-grained locking, this can be revisited
> > > to pass some drm_gem_lru_pool object represent the pool of LRUs under
> > > a specific lock, but for now, the per-device lock seems to be enough.
> > >
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >
> > Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>
>
> If every one is happy with patch 4, I'm tempted to drop patch 1 and 3,
> since they are irrelevant if the locking is fixed the way it is in this
> patch. Question is, do we care about patch 2 being backported to stable
> kernels then?

Or backport patch 4?  It's a bit bigger, but mostly mechanical.. with
only issue being backporting across addition of panthor shrinker, I
guess?

BR,
-R

