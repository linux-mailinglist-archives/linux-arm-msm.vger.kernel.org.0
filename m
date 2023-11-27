Return-Path: <linux-arm-msm+bounces-2087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C517FA225
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A3F3B20EA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 14:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CED13066C;
	Mon, 27 Nov 2023 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kl2gfJtn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E500D183
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:14:05 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4219f89ee21so23750551cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094445; x=1701699245; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iD64oD8+Tiz7f283O8sbj0DrpBu/nCS99B4zaBcOQXA=;
        b=Kl2gfJtnYkj8dZ7qR/gc0Bd2VJJAOvCLfAKW1w6tFr0CD11gIJ+sGhjEY52fL+c11D
         7/tuuovaBzOSsOYWW2YhUIEjKYENWdQZ1jjq+SSV9ftzp8lswTpI92WutB16cFkHmvie
         TQHGH2rtJSnKjKFL36PRr27Iaw3m63B4CVMfYs+TKjgNPkFYfS/gSLcff7sUPtwoHXlT
         5gVYmuBgwSFEsD/FvBOX1PDfPMyUfkz8xgxqgGbAS/zdLeSUBGh59IPyrZ0RWjVJHKEu
         eTbQG3C5ySk5fo2W8hbtBULPq1ctYHkOo7H3xmBohERJ8ja1LoZMYonzSGwE4MexzVGU
         q32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094445; x=1701699245;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iD64oD8+Tiz7f283O8sbj0DrpBu/nCS99B4zaBcOQXA=;
        b=eiHX54ibzr4deoVocaazyJEPSaMLLhiJin/wBR1B46IFkhp83J9Qx8gfIe9ZICkqsc
         29TBpKVz7Gjpa7+ViRzblr7vyFLdd3Is/gjuQYmjxFTDtI1oTxHIIu/u9L2ww8W6XYum
         9PzDyHGyECz/wzXMG0JDa/DU+f1E1zv45CKzrejYwKE2B4JUUG7FC2cS1v+GeTIG3cfL
         fFPCvKcJmkTLhdXKgo9//PZkVLpg79TDj8cxR1nDLxM/WYyaOk+suBDuPaPp0t8NCME3
         3SrrdWDzP4fJf/KPKAzsEge2mKhE8A0qa2uFUyUBK0/79zRXAOQI2N+uVe4e7PkDIeYZ
         BRYg==
X-Gm-Message-State: AOJu0YxlTDz+2obssi+ZKHwjONuWwW66e2WzAIk65H3vvoNhWQrfmCd2
	eNxZ3QM215PToDwv9I8/eR4=
X-Google-Smtp-Source: AGHT+IGwg5QV31C5XMheg1IRO4EfPhPM44eKrBn90XyWmIB7Foc3EZAxshRsGIra0OfZq1abL6qINQ==
X-Received: by 2002:a05:622a:1b12:b0:423:98ba:1f74 with SMTP id bb18-20020a05622a1b1200b0042398ba1f74mr14628158qtb.58.1701094444911;
        Mon, 27 Nov 2023 06:14:04 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
        by smtp.gmail.com with ESMTPSA id g23-20020ac84817000000b0041eef6cacf4sm3759645qtq.81.2023.11.27.06.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 06:13:57 -0800 (PST)
Message-ID: <49388112-f42a-448c-9f68-e41266c4408c@gmail.com>
Date: Mon, 27 Nov 2023 09:13:33 -0500
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
In-Reply-To: <f5a4d51d-82d6-435d-92cd-fdd2d1683404@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9d8Wd8vPYUGUOABemRhg3b9i"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9d8Wd8vPYUGUOABemRhg3b9i
Content-Type: multipart/mixed; boundary="------------ANJos5hgeAFPnw8wVTMf0vip";
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
Message-ID: <49388112-f42a-448c-9f68-e41266c4408c@gmail.com>
Subject: Re: [PATCH 1/2] drm/sched: Rename priority MIN to LOW
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-5-ltuikov89@gmail.com>
 <76749276-dc73-4f6f-a467-aa8a721b0878@amd.com>
 <f5a4d51d-82d6-435d-92cd-fdd2d1683404@amd.com>
In-Reply-To: <f5a4d51d-82d6-435d-92cd-fdd2d1683404@amd.com>

--------------ANJos5hgeAFPnw8wVTMf0vip
Content-Type: multipart/mixed; boundary="------------0KPyDQBze61FW4P7mTO6D8Pz"

--------------0KPyDQBze61FW4P7mTO6D8Pz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-27 08:55, Christian K=C3=B6nig wrote:
> Hi Luben,
>=20
> Am 24.11.23 um 08:57 schrieb Christian K=C3=B6nig:
>> Am 24.11.23 um 06:27 schrieb Luben Tuikov:
>>> Rename DRM_SCHED_PRIORITY_MIN to DRM_SCHED_PRIORITY_LOW.
>>>
>>> This mirrors DRM_SCHED_PRIORITY_HIGH, for a list of DRM scheduler=20
>>> priorities
>>> in ascending order,
>>> =C2=A0=C2=A0 DRM_SCHED_PRIORITY_LOW,
>>> =C2=A0=C2=A0 DRM_SCHED_PRIORITY_NORMAL,
>>> =C2=A0=C2=A0 DRM_SCHED_PRIORITY_HIGH,
>>> =C2=A0=C2=A0 DRM_SCHED_PRIORITY_KERNEL.
>>>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Cc: freedreno@lists.freedesktop.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>>
>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>=20
> Looks like you missed one usage in Nouveau:
>=20
> drivers/gpu/drm/nouveau/nouveau_sched.c:21:41: error:=20
> =E2=80=98DRM_SCHED_PRIORITY_MIN=E2=80=99 undeclared here (not in a func=
tion); did you=20
> mean =E2=80=98DRM_SCHED_PRIORITY_LOW=E2=80=99?
>  =C2=A0=C2=A0 21 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NOUV=
EAU_SCHED_PRIORITY_SINGLE =3D DRM_SCHED_PRIORITY_MIN,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~~~~~~
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | DRM_SCHED_PRIORITY_LOW
>=20
> This now results in a build error on drm-misc-next.

I'm waiting for someone to R-B the fix I posted two days ago:
https://lore.kernel.org/r/20231125192246.87268-2-ltuikov89@gmail.com
--=20
Regards,
Luben

--------------0KPyDQBze61FW4P7mTO6D8Pz
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

--------------0KPyDQBze61FW4P7mTO6D8Pz--

--------------ANJos5hgeAFPnw8wVTMf0vip--

--------------9d8Wd8vPYUGUOABemRhg3b9i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWSkDgUDAAAAAAAKCRBMFUeUMaM0r1ZP
AQCwzBKGWSSFf6Oz9Ktr5onlPjRbeXcOFk4UXputujHIrQD/ZQtqUnEIVF73ktHLWTZQMDGJ+0df
pXv3ZFVRxQUv4A0=
=VFsd
-----END PGP SIGNATURE-----

--------------9d8Wd8vPYUGUOABemRhg3b9i--

