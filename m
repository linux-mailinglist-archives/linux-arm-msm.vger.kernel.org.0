Return-Path: <linux-arm-msm+bounces-1794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 320657F6DFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 09:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 803DFB20A6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 08:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F4B9453;
	Fri, 24 Nov 2023 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWdx5V+Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3B6EA
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 00:22:33 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-423922b10ffso4464551cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 00:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700814152; x=1701418952; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h1CUe99tZ2t40lYdrzhBRaQqgxTfPMIt0x1iRPPkzmk=;
        b=PWdx5V+Qa2FccpMwE5/qq8zekVdyp/PFRoT7wfuvQrgj3vX6d0oQFLH5IcZZc/kVDn
         0Y42VzZPSo4ewZrufvCVWncaGF6gOLkeHfyGL4NnvEOcKW0Lx5MNHupb/JZWyvt2wi0k
         UuHDKrSJrEnUkucbEStC3AA8GRYMwPhsIpJyDB2pMiSn1mYeXAJOEgHi3o032ZdYwrig
         rMe7I/jVTlMGp6LcQD7UYAlXS8b/LAlwagT7bCc5XLBHw8gpQlh6wZHkQaff3aRj9MTV
         S1kJzfJlqc/4aUdHCvXAA8NMo1IkTnTJkoy7TPEVnRGftdglXi2ct5ZBOgZrS/bAA+As
         2lYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700814152; x=1701418952;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1CUe99tZ2t40lYdrzhBRaQqgxTfPMIt0x1iRPPkzmk=;
        b=WCLs62OK4mVCG8BRaQc/ht1epfWowJkAS+Ecc/8jJhNLRpUMLynZAqwNMCn6DVQBp2
         yO9h4tFe2RmPGdzD1o9mbpJ5qAlq0Pgu32FH8dXcRKIb3iR8ouHvoEDJttacv1Tp54AR
         8QiVwpWQmq24vFl61NrnMoObb7J5VhPG8UTLv0OyTWlcEUUnOxsLfiLw/k8BxZ5ofPkU
         5n9yTKJ1PCfpbZd4JWwRuwYm+WKi7m9iclaRdyCRiIALNUM70HtOZrxe33NjFCY5S/1g
         aNu4ydBz5MiOWYpNP4M80mc7rDVVF6lq/UowCZLv/oohl++URlhmr2Q7cagqLuvZ2r1P
         CZlg==
X-Gm-Message-State: AOJu0YxU1E4uAhnWA+tSr2Z/hyOfL+1xrgQsDO9yQX75eEM6LNhaLwBf
	qe/kWWAFqYfXzLSQ8AHo014=
X-Google-Smtp-Source: AGHT+IFCSonYLl9rxaguXMzr/80+5ivKDtPXTa8Cy+WrVGuK1FG/jp290b39hA+VeVOdkc2uuJbQiQ==
X-Received: by 2002:a05:622a:d5:b0:41b:7773:ee56 with SMTP id p21-20020a05622a00d500b0041b7773ee56mr2211178qtw.50.1700814152064;
        Fri, 24 Nov 2023 00:22:32 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
        by smtp.gmail.com with ESMTPSA id p25-20020ac84099000000b0041b12d5fd91sm1104898qtl.55.2023.11.24.00.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 00:22:31 -0800 (PST)
Message-ID: <9226e1d4-82f6-4c14-9170-4449de36804e@gmail.com>
Date: Fri, 24 Nov 2023 03:22:22 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.0
Subject: Re: [PATCH 2/2] drm/sched: Reverse run-queue priority enumeration
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-6-ltuikov89@gmail.com>
 <9a56f3e7-3c4a-4c41-ac9c-768fc75bcec0@amd.com>
Content-Language: en-CA, en-US
From: Luben Tuikov <ltuikov89@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <9a56f3e7-3c4a-4c41-ac9c-768fc75bcec0@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Yii3UXyGXrha7z2ral9CIZYt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Yii3UXyGXrha7z2ral9CIZYt
Content-Type: multipart/mixed; boundary="------------CVrLyLWs90FXl0CFl0Qd2Y0q";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Message-ID: <9226e1d4-82f6-4c14-9170-4449de36804e@gmail.com>
Subject: Re: [PATCH 2/2] drm/sched: Reverse run-queue priority enumeration
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-6-ltuikov89@gmail.com>
 <9a56f3e7-3c4a-4c41-ac9c-768fc75bcec0@amd.com>
In-Reply-To: <9a56f3e7-3c4a-4c41-ac9c-768fc75bcec0@amd.com>

--------------CVrLyLWs90FXl0CFl0Qd2Y0q
Content-Type: multipart/mixed; boundary="------------Ptx2SA09cl9wI0fNbUBWXK0R"

--------------Ptx2SA09cl9wI0fNbUBWXK0R
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-24 03:04, Christian K=C3=B6nig wrote:
> Am 24.11.23 um 06:27 schrieb Luben Tuikov:
>> Reverse run-queue priority enumeration such that the higest priority i=
s now 0,
>> and for each consecutive integer the prioirty diminishes.
>>
>> Run-queues correspond to priorities. To an external observer a schedul=
er
>> created with a single run-queue, and another created with
>> DRM_SCHED_PRIORITY_COUNT number of run-queues, should always schedule
>> sched->sched_rq[0] with the same "priority", as that index run-queue e=
xists in
>> both schedulers, i.e. a scheduler with one run-queue or many. This pat=
ch makes
>> it so.
>>
>> In other words, the "priority" of sched->sched_rq[n], n >=3D 0, is the=
 same for
>> any scheduler created with any allowable number of run-queues (priorit=
ies), 0
>> to DRM_SCHED_PRIORITY_COUNT.
>>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: freedreno@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
>>   drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
>>   drivers/gpu/drm/scheduler/sched_entity.c |  7 ++++---
>>   drivers/gpu/drm/scheduler/sched_main.c   | 15 +++++++--------
>>   include/drm/gpu_scheduler.h              |  6 +++---
>>   5 files changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_job.c
>> index 1a25931607c514..71a5cf37b472d4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_=
gpu_scheduler *sched)
>>   	int i;
>>  =20
>>   	/* Signal all jobs not yet scheduled */
>> -	for (i =3D sched->num_rqs - 1; i >=3D DRM_SCHED_PRIORITY_LOW; i--) {=

>> +	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>>   		struct drm_sched_rq *rq =3D sched->sched_rq[i];
>>   		spin_lock(&rq->lock);
>>   		list_for_each_entry(s_entity, &rq->entities, list) {
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_g=
pu.h
>> index eb0c97433e5f8a..2bfcb222e35338 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>> @@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
>>    * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in =
some
>>    * cases, so we don't use it (no need for kernel generated jobs).
>>    */
>> -#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_=
PRIORITY_LOW)
>> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_LOW - DRM_SCHED_P=
RIORITY_HIGH)
>>  =20
>>   /**
>>    * struct msm_file_private - per-drm_file context
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/dr=
m/scheduler/sched_entity.c
>> index cb7445be3cbb4e..6e2b02e45e3a32 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -81,14 +81,15 @@ int drm_sched_entity_init(struct drm_sched_entity =
*entity,
>>   		 */
>>   		pr_warn("%s: called with uninitialized scheduler\n", __func__);
>>   	} else if (num_sched_list) {
>> -		/* The "priority" of an entity cannot exceed the number
>> -		 * of run-queues of a scheduler.
>> +		/* The "priority" of an entity cannot exceed the number of
>> +		 * run-queues of a scheduler. Choose the lowest priority
>> +		 * available.
>>   		 */
>>   		if (entity->priority >=3D sched_list[0]->num_rqs) {
>>   			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num=
_rqs:%u\n",
>>   				entity->priority, sched_list[0]->num_rqs);
>>   			entity->priority =3D max_t(s32, (s32) sched_list[0]->num_rqs - 1,=

>> -						 (s32) DRM_SCHED_PRIORITY_LOW);
>> +						 (s32) DRM_SCHED_PRIORITY_KERNEL);
>=20
> That seems to be a no-op. You basically say max_T(.., num_rqs - 1, 0), =

> this will always be num_rqs - 1

This protects against num_rqs being equal to 0, in which case we select K=
ERNEL (0).

This comes from "[PATCH] drm/sched: Fix bounds limiting when given a malf=
ormed entity"
which I sent yesterday (Message-ID: <20231123122422.167832-2-ltuikov89@gm=
ail.com>).

Could you R-B that patch too?

>=20
> Apart from that looks good to me.

Okay, could you R-B this patch then.
--=20
Regards,
Luben

--------------Ptx2SA09cl9wI0fNbUBWXK0R
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------Ptx2SA09cl9wI0fNbUBWXK0R--

--------------CVrLyLWs90FXl0CFl0Qd2Y0q--

--------------Yii3UXyGXrha7z2ral9CIZYt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWBdPgUDAAAAAAAKCRBMFUeUMaM0r6Z/
AQDjQQJUjc3GXNkhCyGrrHsAOMUGtbzzyCiczASKT/UaogD+Ik0QZs5KoVyhIxG5wj5FdLd6uZiQ
IC2V5gUD/2Eingo=
=Kx/l
-----END PGP SIGNATURE-----

--------------Yii3UXyGXrha7z2ral9CIZYt--

