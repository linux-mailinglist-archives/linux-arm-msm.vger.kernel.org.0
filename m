Return-Path: <linux-arm-msm+bounces-101119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEScLlcTzGkvOAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:32:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 253C236FFD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F719301410F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FFC37B028;
	Tue, 31 Mar 2026 18:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FeHF9btr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STo4hj5f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDE837BE88
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981746; cv=pass; b=VZwBB7cGZCTgqCUyGfh85Om6IoE4RXQaAdC1GkQlFN3qVkp1DjXQQ1HeYNHy7K2EMtSyBAVzlTTAgDOIbSfYBtOM0H3BgH16YhQ6DlmMBCKgoUdui+YjUbv7skq73ByezK+KhX+lCsLDuSnDXRCxEZSWMNbliQFRqkxiILZ/BX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981746; c=relaxed/simple;
	bh=uNJS9FAZabuqY/mFspTpzSJB9mbBNyyhkY/MkSFqocM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRcGNk7/FvxyJ33NyaLLODIWMZeFulEUuvRaZs/MLefVVDPNLifcQrkDZ57NrQJkMfVJv3wlyr3HH0Dm0uFrMOeZ3sJVT3Hkn22xV4yxPcUP/E4+kOIIdUDUocAU79dHAHQObQtulWrjHZko43Fyfy44kKJ0ECc3PEyYpDULlhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FeHF9btr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STo4hj5f; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdnCB3663999
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=sqccXtNxMUDUewBaqU0CTK7kGLsJIPlUppOXDkrqdQs=; b=Fe
	HF9btrHUbi6HB8KI/sqrH9ChzRFBtCMnhEUFnnGLQtDFqvxxvKMtqWlHETpqKj16
	YrNEtx5GTKNLic23vrLIz+WnSIPdlzX8SVHPTWKfDrQ0GCftaGj1yoocb8CcbpRA
	U5floaOPZqSxnU/4FksljjWTT6jGnnZGRUMPJ84YkMGQHjnoQEHLHMjwHmQQTdyr
	BdKQ57FRVHNgQu1NMgNGBvnecbiKcaTkqNy4bkJJhnIjp1sUASCYnTl4CXFQDAhN
	FpxFhR9/4OstPLVEPnkRaw3CdwJnh8A94ZSb31UnxoJCiVpWt7yhxHJPrpD43xf0
	AUN827+qxMrRgxNvhaCA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga35sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:29:04 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4670a0ad001so8242785b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774981743; cv=none;
        d=google.com; s=arc-20240605;
        b=MixUSDRSZmjt6/GjQnAzKxX/4lmZTTlWxh4CLnI0xPDvOC8y4W/Y/hD5CUkcVMQW+H
         zZTykH9BN9PQshWRM4J+gORfMD8bD1Gn3iOyjnQ5ZPghRv0sO7gBBJ+sPqAgGBAGGvew
         ejORBug3+1GkWG1P65OZO3otp187JizB738AOHW76X7zwmuTwDo+Txc8HD40U2qDUOo/
         PeyUUvrjBDF1Ydh1XHz2qcPDt33++DfX36JQHlKk2B8/+pWy0wT4pnRN7Y8DFjumxc4l
         eGuO/1cbpFR2V+j9OTJv0K74/DuULKi/RBHHdzErHywxhhrjEy/mNqlsqLh6XerP4oso
         3Mgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=sqccXtNxMUDUewBaqU0CTK7kGLsJIPlUppOXDkrqdQs=;
        fh=hTINOAzVOP7+3OcWR+Dy9oKUSvlmFthc/tY3vhl24nc=;
        b=G50EXk2Z6b20BRcTEwTzOjPypXhyzfHAi9V7RURVLsjvyBSTEySXWeVkQeYITEC19D
         /GK6tzJhNW8ip9SS/f9SlXx6jSKGFN8Ij/gTyVeRn+RxRk+i5URzNeUGEO6MpI4vpW9g
         UUwLwj/77EiVTBtskJhjZncVBC8inW8vvuPWutEo4L9sBkUkk0x7hF3l4W+7ldYvTEy3
         M1n9Q3Q422KBdCsSZYp3RqVNOuDPpYCzhTfxrM3yr1uI1REV0iBOpjpChDFjpuYbsUGJ
         Ctvp6Nm/q+AFJlAQ2xCfNW7VN4xtn6E0dEWA/UQZOYlYyuZMnAoqK7iUF9ObsKUqrDuf
         FZfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774981743; x=1775586543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sqccXtNxMUDUewBaqU0CTK7kGLsJIPlUppOXDkrqdQs=;
        b=STo4hj5fdsVrKZu/ew8lEbGvB0uvUOwqe6Cy3XmFNpnvkQ9FCdeQXW38znGY1jfTM0
         BXr2xxPVRkZIJkSazlbqDPiVVOOhuPFlVjUxAA7Qv/EdWLp0n7pxrNBsX4TMtVNeJWCM
         tFcUzO4qOH6GShSxcRMMSfleNGIwM+prJ2S7FxYKSuNlT3jZs4B/TZR2Mg5GhLr8F0qb
         1xSltQbsgQm0TspVayY8hSwHWypG/r8XVecfbHcAEwJR35GW4hXqCAYhQAE1NT+tYJ94
         m2UYklPpJYcpGCVDPT28DpCa7yZgjt0AFX3ZfhvlY6JzywCmeahZMKfJ5zmGDGMOolwo
         kgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774981743; x=1775586543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqccXtNxMUDUewBaqU0CTK7kGLsJIPlUppOXDkrqdQs=;
        b=RE20V34ZEpAfiSEi43I6z/wYedfM5aPyxxuQT25KZAWGhbBQn5L5L5sg6b/OsAslrA
         9Phn9XY18cT9Sot3zdgQoUUl0GoeX+Jsf8Cix9KG38hcFbJ0fpPreACVd7aP/rUhVjtQ
         JJ4GnCXzxwPlwGhm97H6ee/XvMNvQjDmtNi96SXl9wngBpVBJVOLfuB86eUsg6PvZXRW
         bavF8G2r6afaovyLosKpdepJnJPuoqAFLNjqug3GnCji0a2sCsaOaPVXaxfnPHpVONpL
         /XWtoHQdr9a538Y4ToaiMXRg/T3QtuV4y8aZGSzHk9aStT46VTNI2FEx5yrYcUxy5YBE
         MFyA==
X-Forwarded-Encrypted: i=1; AJvYcCUuA9WVFPWZjcr5b8UOBKZ05JP6vhuhp2W6Vq8rvu+pNhp1BdnWtjOxQel9/FDpmiHEcqTwRR+F0T6UrI8t@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/INJRIPRJSevs8/0ooWYKNkwakMUtAoqqFz3qNG8YPGwa807
	/LtPPBiNj1cWGhZFztDol4ovzzYs99vsOS5vKtDxSeQa1N4Y4jK/5yAj42cRINVDE5rho7Dtf6r
	DdAl/jToOL26l5b6JPdKa5yPz7LcLpo0QwGgjohqA9wl7Ie1dEg6L82Sk2l16IQweWuAZ8jymIy
	KsQG5X7yfCdhrgVKTJabE57zgEXUc7BItdY10otHcX2x4=
X-Gm-Gg: ATEYQzz/gT7nHVwTHQ2RdW+UReO2dej00+7bZhnZ9LyR7mJhzx/tgSFW7zj0t2sHhee
	EwXjPsyrZLBPm58DzWmxWFspOnBa8aY81h9PFCBVCk/Y5MPLyUezw1WmwGEYJIguLrutrThPfgY
	vSE3Pa4VrFlQjN5Rxrc10AJIQ+2lyYx6ShdikKQA/OyaPEHqDs2+35KmKPfAyM4ed2wlD+zEyNO
	xUFNc1ZhKFeGTeuhYKn+NXhOeFf4xOSWWFABA==
X-Received: by 2002:a05:6808:1b0e:b0:467:4939:9656 with SMTP id 5614622812f47-46ae022479bmr312778b6e.37.1774981743576;
        Tue, 31 Mar 2026 11:29:03 -0700 (PDT)
X-Received: by 2002:a05:6808:1b0e:b0:467:4939:9656 with SMTP id
 5614622812f47-46ae022479bmr312759b6e.37.1774981743161; Tue, 31 Mar 2026
 11:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-8-2b53c38d2101@oss.qualcomm.com>
 <CACSVV01RxTce4qEkt=vPb8AmPSuTLVTh5DR5gCAP2n3U3vkDqw@mail.gmail.com> <720bf565-342c-45b1-b797-3e27a7e9bb56@oss.qualcomm.com>
In-Reply-To: <720bf565-342c-45b1-b797-3e27a7e9bb56@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:28:52 -0700
X-Gm-Features: AQROBzDtrqI3f2JoaAPt5nnKoxW2Eymn4fBESv7H27PzGlJQ90cjFmRLoj1lafA
Message-ID: <CACSVV00qWGtHFOeEwTVw5=2XV1yvvi2TfTBFDjG8tQRg4eHzhQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/17] drm/msm/adreno: Coredump on GPU/GMU init failures
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cc1270 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=Ex9mMNGI-Umtw2ziQKAA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: HOh74FxrlVCpphi45VYJNmOzHcToi3Rm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3NyBTYWx0ZWRfX+W2SGLL5BIKF
 AAlh8hJiTLzX7BH5vRhcBjGWmH/h82NxTKZJjlBHePaMPB4DV5JOP4BMPUaVXtuh/r15T/mp8mC
 EIbjrSm6JRXC5KljGYIEQ0nJyR6J9hnCMazuTwSV2rKuutmQmk5/ZsPhtRYGdcprrluitUngZH0
 MQm0/9bPPb92zbeTweBKFMO+gidkIXAckKP+L1nq0rb2irbdih0olmm7ICRi/zFDthI5bHk4zsY
 jB410+icIhmkjOszYz+J23nUN3bmUkty7ZWbnwASE77hpg4/CYq/BaN/ydstBFcjYk6jGJJPbCU
 luYrqOiQ0Z7qJnGxoGf6YEcv7qG0PQoCZrQPmfOjD03acFgwdVeyCZcV/owqv3RrNqX8xBdDe29
 4krhWF1rRt4UG/DKP01/TEWPAdqLCfDysHzBrAMeXXBBcZieQoEWvPvl4dbrS9ydm41hgn3QEyX
 IUwlX1hA/YokO0WN5uw==
X-Proofpoint-ORIG-GUID: HOh74FxrlVCpphi45VYJNmOzHcToi3Rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310177
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101119-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 253C236FFD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 11:05=E2=80=AFAM Akhil P Oommen
<akhilpo@oss.qualcomm.com> wrote:
>
> On 3/31/2026 1:21 AM, Rob Clark wrote:
> > On Thu, Mar 26, 2026 at 5:15=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qua=
lcomm.com> wrote:
> >>
> >> Capture coredump on GPU or GMU errors during initialization to help in
> >> debugging the issues. To be consistent with the locks while calling
> >> msm_gpu_crashstate_capture(), call pm_runtime_get(gpu) always with
> >> msm_gpu->lock.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 1 +
> >>  drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +++--
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 5 ++++-
> >>  drivers/gpu/drm/msm/msm_gpu.c              | 5 +++--
> >>  drivers/gpu/drm/msm/msm_gpu.h              | 2 ++
> >>  5 files changed, 13 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gmu.c
> >> index 1b44b9e21ad8..916c5d99c4d1 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> @@ -1335,6 +1335,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
> >>
> >>  disable_irq:
> >>         disable_irq(gmu->gmu_irq);
> >> +       msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
> >>         a6xx_rpmh_stop(gmu);
> >>  disable_clk:
> >>         clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/=
drm/msm/adreno/adreno_device.c
> >> index 4edfe80c5be7..ca5f96e16870 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> @@ -105,6 +105,8 @@ struct msm_gpu *adreno_load_gpu(struct drm_device =
*dev)
> >>          */
> >>         pm_runtime_enable(&pdev->dev);
> >>
> >> +       guard(mutex)(&gpu->lock);
> >
> > so, I am a fan of guard(), but I realized this means we are holding
> > gpu->lock across the debugfs_init() (only a5xx).. which I suspect will
> > anger lockdep, although I don't have a good way to test that atm.
>
> Shall we drop this patch for now? I will send a respin later.

I think I might, esp since the db820/a5xx ci runners seem to be down atm

BR,
-R

> -Akhil.
>
> >
> > BR,
> > -R
> >
> >> +
> >>         ret =3D pm_runtime_get_sync(&pdev->dev);
> >>         if (ret < 0) {
> >>                 pm_runtime_put_noidle(&pdev->dev);
> >> @@ -112,10 +114,9 @@ struct msm_gpu *adreno_load_gpu(struct drm_device=
 *dev)
> >>                 goto err_disable_rpm;
> >>         }
> >>
> >> -       mutex_lock(&gpu->lock);
> >>         ret =3D msm_gpu_hw_init(gpu);
> >> -       mutex_unlock(&gpu->lock);
> >>         if (ret) {
> >> +               msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL=
);
> >>                 DRM_DEV_ERROR(dev->dev, "gpu hw init failed: %d\n", re=
t);
> >>                 goto err_put_rpm;
> >>         }
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm=
/msm/adreno/adreno_gpu.c
> >> index 785e99fb5bd5..8475802fdde2 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> @@ -391,10 +391,13 @@ int adreno_get_param(struct msm_gpu *gpu, struct=
 msm_context *ctx,
> >>                 return 0;
> >>         case MSM_PARAM_TIMESTAMP:
> >>                 if (adreno_gpu->funcs->get_timestamp) {
> >> +                       mutex_lock(&gpu->lock);
> >>                         pm_runtime_get_sync(&gpu->pdev->dev);
> >> +
> >>                         *value =3D adreno_gpu->funcs->get_timestamp(gp=
u);
> >> -                       pm_runtime_put_autosuspend(&gpu->pdev->dev);
> >>
> >> +                       pm_runtime_put_autosuspend(&gpu->pdev->dev);
> >> +                       mutex_unlock(&gpu->lock);
> >>                         return 0;
> >>                 }
> >>                 return -EINVAL;
> >> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_g=
pu.c
> >> index 995549d0bbbc..472db2c916f9 100644
> >> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >> @@ -361,7 +361,7 @@ static void crashstate_get_vm_logs(struct msm_gpu_=
state *state, struct msm_gem_v
> >>         mutex_unlock(&vm->mmu_lock);
> >>  }
> >>
> >> -static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
> >> +void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
> >>                 struct msm_gem_submit *submit, struct msm_gpu_fault_in=
fo *fault_info,
> >>                 char *comm, char *cmd)
> >>  {
> >> @@ -886,7 +886,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct ms=
m_gem_submit *submit)
> >>
> >>         pm_runtime_get_sync(&gpu->pdev->dev);
> >>
> >> -       msm_gpu_hw_init(gpu);
> >> +       if (msm_gpu_hw_init(gpu))
> >> +               msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL=
);
> >>
> >>         submit->seqno =3D submit->hw_fence->seqno;
> >>
> >> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_g=
pu.h
> >> index 666cf499b7ec..eb5b3a7b81f9 100644
> >> --- a/drivers/gpu/drm/msm/msm_gpu.h
> >> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> >> @@ -747,6 +747,8 @@ static inline void msm_gpu_crashstate_put(struct m=
sm_gpu *gpu)
> >>  }
> >>
> >>  void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm=
_gpu_fault_info *fault_info);
> >> +void msm_gpu_crashstate_capture(struct msm_gpu *gpu, struct msm_gem_s=
ubmit *submit,
> >> +               struct msm_gpu_fault_info *fault_info, char *comm, cha=
r *cmd);
> >>
> >>  /*
> >>   * Simple macro to semi-cleanly add the MAP_PRIV flag for targets tha=
t can
> >>
> >> --
> >> 2.51.0
> >>
>

