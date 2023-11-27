Return-Path: <linux-arm-msm+bounces-2106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE887FA2F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 421801C20C6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 14:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E1131725;
	Mon, 27 Nov 2023 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVPstHn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61963586
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:35:31 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-41eae4f0ee6so22332801cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701095731; x=1701700531; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2B4bMCdtnwdoGPakwVrUs+LrD9K7dJqM4LxYamoMPsc=;
        b=YVPstHn2R0w/udeAh2PC8cM1OCUnvXDcoRMGJ7XVp9D8wMkCgsVO5tPChdDY5eJRr+
         NF6O0kKRcMh+zD2YW8SUIWrtlL9qxaxRJFUJ8hIxQWMAVyK0Uv/7JTLchp/JEbWycfsF
         +uWuoE61A1zFzvkd6jBA3vcMIsKX4em9oltSTUJ/l2VrUDBxQvY6YQIl3GuiQ5FnsTch
         MA+5S9Eb147M4jkS/TAOPNQqly+2bZaEgRnJKRIzwDw5RGOEkLAmLtP+PSKm7+VuC7j4
         Usdahpjlmq4OLR5CtoNrSGpAgtGdogM7g4s4H6aqsuMStJLQ97bN7efndJ7vbc1KMe8d
         WM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701095731; x=1701700531;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2B4bMCdtnwdoGPakwVrUs+LrD9K7dJqM4LxYamoMPsc=;
        b=PCeVFEqrM8CIlvx8tEUM8qPJ75M/ieY0riYpACqXPfY5kSw0jYzWOBK0NQdjK8kTQc
         2lKo2KLrXDEVAXBc/xe7XFQS+NeuzUmYp/TS8Td11bzbPNuMPAoXM5rIW0unkgnGd0Uz
         i3QWVkB4feDGWuNjTlVGTYDOCpFkyyAl9jfwHGWyxOeTOzDT5wnYiL5m+3qpW//tYBYj
         qxtkKjF59eBKNxoRomNU9mmfAefpGr2ZZF501RdEi4xjc7oOPMBSW9foKE8lEq9FqBaX
         eu5sxO9QF5kp7D4HxoGGjkBD0NF3PhM+GrluqqQc/xBG1MT0oswW98oL0JLm0KWtJuXj
         6l5g==
X-Gm-Message-State: AOJu0Ywt5yU9kTd4msVLPewxBdVv31brLMwTDmkB3v8LXwD9ycXCmvME
	gECwEnZxj4vmlKkFG8QWOoc=
X-Google-Smtp-Source: AGHT+IHkqtNIYFQtGjRhqBHdorUWSd4IxHUJVMJ023H/FDvloASUbRXcU6kumdrkB3LQRj0vufCRTA==
X-Received: by 2002:a05:622a:514:b0:421:9f8c:e42 with SMTP id l20-20020a05622a051400b004219f8c0e42mr12726184qtx.63.1701095730820;
        Mon, 27 Nov 2023 06:35:30 -0800 (PST)
Received: from [192.168.2.14] (bras-base-toroon0964w-grc-76-76-65-20-140.dsl.bell.ca. [76.65.20.140])
        by smtp.gmail.com with ESMTPSA id y3-20020ac85243000000b004181e5a724csm3768229qtn.88.2023.11.27.06.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 06:35:30 -0800 (PST)
Message-ID: <4cc1a0fb-a6e4-4d90-b2c3-423ed6c1d44c@gmail.com>
Date: Mon, 27 Nov 2023 09:35:29 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.0
Subject: Re: [PATCH 1/2] drm/sched: Rename priority MIN to LOW
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-5-ltuikov89@gmail.com>
 <76749276-dc73-4f6f-a467-aa8a721b0878@amd.com>
 <f5a4d51d-82d6-435d-92cd-fdd2d1683404@amd.com>
 <49388112-f42a-448c-9f68-e41266c4408c@gmail.com>
 <7429262c-6dea-4dcc-bf7e-54d2277dabf1@amd.com>
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
In-Reply-To: <7429262c-6dea-4dcc-bf7e-54d2277dabf1@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PepzSRcxqI9eB3CbgR6zBi8S"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PepzSRcxqI9eB3CbgR6zBi8S
Content-Type: multipart/mixed; boundary="------------zibjDWxyoel9r0KEW6xMDOuZ";
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
Message-ID: <4cc1a0fb-a6e4-4d90-b2c3-423ed6c1d44c@gmail.com>
Subject: Re: [PATCH 1/2] drm/sched: Rename priority MIN to LOW
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-5-ltuikov89@gmail.com>
 <76749276-dc73-4f6f-a467-aa8a721b0878@amd.com>
 <f5a4d51d-82d6-435d-92cd-fdd2d1683404@amd.com>
 <49388112-f42a-448c-9f68-e41266c4408c@gmail.com>
 <7429262c-6dea-4dcc-bf7e-54d2277dabf1@amd.com>
In-Reply-To: <7429262c-6dea-4dcc-bf7e-54d2277dabf1@amd.com>

--------------zibjDWxyoel9r0KEW6xMDOuZ
Content-Type: multipart/mixed; boundary="------------f5JZn0y6x0y04tb3jFRRbS2E"

--------------f5JZn0y6x0y04tb3jFRRbS2E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-27 09:20, Christian K=C3=B6nig wrote:
> Am 27.11.23 um 15:13 schrieb Luben Tuikov:
>> On 2023-11-27 08:55, Christian K=C3=B6nig wrote:
>>> Hi Luben,
>>>
>>> Am 24.11.23 um 08:57 schrieb Christian K=C3=B6nig:
>>>> Am 24.11.23 um 06:27 schrieb Luben Tuikov:
>>>>> Rename DRM_SCHED_PRIORITY_MIN to DRM_SCHED_PRIORITY_LOW.
>>>>>
>>>>> This mirrors DRM_SCHED_PRIORITY_HIGH, for a list of DRM scheduler
>>>>> priorities
>>>>> in ascending order,
>>>>>  =C2=A0=C2=A0 DRM_SCHED_PRIORITY_LOW,
>>>>>  =C2=A0=C2=A0 DRM_SCHED_PRIORITY_NORMAL,
>>>>>  =C2=A0=C2=A0 DRM_SCHED_PRIORITY_HIGH,
>>>>>  =C2=A0=C2=A0 DRM_SCHED_PRIORITY_KERNEL.
>>>>>
>>>>> Cc: Rob Clark <robdclark@gmail.com>
>>>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>>>> Cc: linux-arm-msm@vger.kernel.org
>>>>> Cc: freedreno@lists.freedesktop.org
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> Looks like you missed one usage in Nouveau:
>>>
>>> drivers/gpu/drm/nouveau/nouveau_sched.c:21:41: error:
>>> =E2=80=98DRM_SCHED_PRIORITY_MIN=E2=80=99 undeclared here (not in a fu=
nction); did you
>>> mean =E2=80=98DRM_SCHED_PRIORITY_LOW=E2=80=99?
>>>   =C2=A0=C2=A0 21 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 N=
OUVEAU_SCHED_PRIORITY_SINGLE =3D DRM_SCHED_PRIORITY_MIN,
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~~~~~~
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | DRM_SCHED_PRIORITY_LOW
>>>
>>> This now results in a build error on drm-misc-next.
>> I'm waiting for someone to R-B the fix I posted two days ago:
>> https://lore.kernel.org/r/20231125192246.87268-2-ltuikov89@gmail.com
>=20
> There must be something wrong with the dri-devel mailing list (or my=20
> gmail, but I doubt so). I don't see this mail in my inbox anywhere.
>=20
> Feel free to add my rb and push it.

Done.

Thanks.
--=20
Regards,
Luben

--------------f5JZn0y6x0y04tb3jFRRbS2E
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

--------------f5JZn0y6x0y04tb3jFRRbS2E--

--------------zibjDWxyoel9r0KEW6xMDOuZ--

--------------PepzSRcxqI9eB3CbgR6zBi8S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWSpMQUDAAAAAAAKCRBMFUeUMaM0r9uR
AP4puMB/qHKd9jBHPABQCNfWJmFrh252RevzGJYaIiqOdgD+LXhefPMxysudiSB1K8/fC8Qvbky0
DmxdBKJgXU2ehAM=
=Atc+
-----END PGP SIGNATURE-----

--------------PepzSRcxqI9eB3CbgR6zBi8S--

