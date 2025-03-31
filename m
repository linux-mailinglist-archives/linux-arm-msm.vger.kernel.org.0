Return-Path: <linux-arm-msm+bounces-52851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9234FA75EF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 08:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEA5A3A38FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 06:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456DC18E02A;
	Mon, 31 Mar 2025 06:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VeIV64QP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F1215B0EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 06:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743403407; cv=none; b=FTqc+RcFAHgQ6Fwg5BeIlbnlD4oE/tym6efFCk2Hr9nSnxQoHK2aQHDtaIIAQYjp9fLz7jF43YGnm/Lv/dnfNgjI8t7Zi3kP92jMowxQAMMcOQ6N4mSbHqWlll4b+3w/IWZWujExnO7dYr3k6QSBdeYd1OPGVK9/+zhokMYOEW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743403407; c=relaxed/simple;
	bh=hky7REQw5DX0JCWwyGQHJ7RHNbyG0IJonc9kHJfpjdE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=aQ4Q/jX9mghQk7k/tW6zkSm0c3ci86iYce5+hTJvlDm0+Jpnghllef98D808XZnMjDRx7zRK/0UfbmltFPvqxX0A4jMbDJ5yzhTzaqSYnend4ahpWn1GishieDp0OIqwtnQ4hAkfog1lmOHE/JsZEMG6/29zGmrd8w/ij5xMigw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VeIV64QP; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so7804933a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 23:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1743403403; x=1744008203; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCNuLXgHWyfCcy2WkSO6owH9cNPmm5zWBSR/V5DDmNY=;
        b=VeIV64QPwki5UPQHTzF/xytV4M/zUbxSuS2lYaYSL2ti/q6kGvZ4zEHMo5h+qC0smV
         8ieIj1JPN6yabMivrDDNYRb195GteuZM+xFwI4oGrzAgn3WMVYQXETIaeYN2uRizkY6f
         4yZEGqb4Zk5XMmMbpPiZTB7r0hzmu0aKNF2ZCiKAwG0mgmsV1xZKNhC+gDUjdEPRlbnQ
         W1Wxid9Z2mUdK1WNLvZ9c34+hOQmZIWGIDWeBd90uo1+vDTAbgig6AeqGcoq8817Twup
         VeC+s7cTl0rY5ijOl1Ydih3T7auqbBKRU5SKuS4vW0rNryjNnUM0GkKWIgR0XBEc2pxO
         zc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403403; x=1744008203;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NCNuLXgHWyfCcy2WkSO6owH9cNPmm5zWBSR/V5DDmNY=;
        b=JTP4DWQhEXnjsx8rDF6jl0at/u1dCUrhnzrYwqSyS9usBzB+pKDrK9t9gi9ZPCr4jZ
         qQaG/j68X2u/lYkUpSRCcSeQBunuEWUpphw1SDeS0W01V2PFUfdRFhEh4Y/UyYYILGA/
         d7Bc6Yy6hkvpLX7JsA2DwdqVMpFkEq5e5lK1tUNb/kUWIXMf3xzRzNGOK7rEcwctL0CX
         hw4DQJpcfk80McaF/4kB2Tba4xxGm4c7PLoq92q3UIvbeUnlmY2dzOtYL1fTF7GPdUHW
         rxplPIhG0gJyy8m8iWThP7oAmZTdzH+5DXUA+HFb/OZ1OIEj73DPwrXJIoWBu57k6Wo4
         25cw==
X-Forwarded-Encrypted: i=1; AJvYcCU6I99fnC6/88LpeeMdgQ3Gh0LIQNN5twQOoiMXEz8hafWPbBL3p6e/HLH/X2FFGmRzow8sigs2/b/w/mPi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3UEF1LUxfJYRgMq7rrFPsKZz2jD0pnS3UBYsnkKrIn3go3kaB
	xjxUW/tQaI+3MPqbLVlMixeFQ+EVDjP5/tc693c6gdP6H18QVf5AUDlOz9eLEho=
X-Gm-Gg: ASbGncs6sSdLu0egu9rEP/YpIfTilKxwEyDg2IIwXBwdh3YAvDemgdcF4eLffx3VNZr
	PKnNjkiZ3sN3h3XgZZrNeQbZc/XLV9XRIQavGGyogLzZ27GfCgMaDypJdlDCvGVKFhZ1/6xFQ9i
	ohQCJVd8c8GeAkey8sENsVSsdkxNBsmNsKuyzvdYleb18ejRc+33hSKAIFDz3Fnr+KYbvLKIgql
	cMrHPYJrzr/DxHUzAierkQKy6TbK7tVXnD+UrsLGmMUnvTrxG4FFIRNqUnRdoF4Ppqdcj67V2Iw
	nF7v8iE89yfh9W2X3kwn0Cr/M7ms1+1gRYhuAoa6kEYjHu9ALk/2YzfPx2irI0PvdDbOZLNcWpF
	8KIIxUZygpko2VL3k43u1uWPHu+6AGf9Y6QiPDShZA4gUvhfxf4XuNgpG
X-Google-Smtp-Source: AGHT+IH3W9/kBETcWbE+a0ro2HSH4RvxJ0Y46/aHF/mxst2xxYqXac9McK2Ar02Y4dw3ogqzjcL33A==
X-Received: by 2002:a17:907:2cc6:b0:ac2:6910:a12f with SMTP id a640c23a62f3a-ac738bac9a6mr568245066b.46.1743403403069;
        Sun, 30 Mar 2025 23:43:23 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71922ba33sm577513666b.23.2025.03.30.23.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 23:43:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Mar 2025 08:43:21 +0200
Message-Id: <D8U8XDW1QRAY.35U7ER6E74G55@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Vikash Garodia"
 <quic_vgarodia@quicinc.com>, "Dikshita Agarwal"
 <quic_dikshita@quicinc.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: Venus probe issues on SM6350 SoC
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <6P5iXJOUxv3jsPGI11XbeZOagg2ht2Ws-WbN2HjXSFC_xeFgWyGM3a9T6y30gmys3KSxJF9Tv3f7jAehZ6AlOQ==@protonmail.internalid> <D8S03CCD8LGW.TA2FRY4CKEGT@fairphone.com> <6ae076fc-e30a-431e-b75e-7f9b9d7bff08@linaro.org>
In-Reply-To: <6ae076fc-e30a-431e-b75e-7f9b9d7bff08@linaro.org>

Hi Bryan,

On Fri Mar 28, 2025 at 5:39 PM CET, Bryan O'Donoghue wrote:
> On 28/03/2025 15:22, Luca Weiss wrote:
>> Hi all, and Vikash and Dikshita,
>>=20
>> Konrad Dybcio was suggesting I write an email here, maybe someone has a
>> good idea what I can try.
>>=20
>> I've been working on bringup for SM6350/SM7225 ("lagoon") for the
>> Fairphone 4 smartphone but have been stuck on getting Venus working for
>> a long time (~January 2022). Essentially, whatever I try probe fails
>> with the following error:
>>=20
>> [   41.939451] qcom-venus aa00000.video-codec: non legacy binding
>> [   42.162105] qcom-venus aa00000.video-codec: wait for cpu and video co=
re idle fail (-110)
>> [   42.167037] qcom-venus aa00000.video-codec: probe with driver qcom-ve=
nus failed with error -110
>>=20
>> I've double checked the videocc driver against downstream, the videocc
>> GDSCs and their flags, compared dts bits, checked basic driver bits but
>> I couldn't find anything to get further than this.
>>=20
>> For driver / compatible, it doesn't seem to matter if I use sm8250 or
>> sc7280 compatible or actually the struct I created for sm6350.
>>=20
>> I'll attach the log with some extra debug prints below.
>>=20
>> My git branch for reference: https://github.com/z3ntu/linux/commits/sm63=
50-6.14.y-wip-venus/
>>=20
>> I didn't try the new Iris driver yet, mostly because as far as I can
>> tell, VPU_VERSION_IRIS2_1 is not yet supported there, just IRIS2
>> (sm8250) and IRIS3 (sm8550). But I'm also happy to try something there.
>>=20
>> Regards
>> Luca
>>=20
>>=20

<snip>

>> [   57.868683] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_=
idle:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
>> [   57.868690] qcom-venus aa00000.video-codec: wait for cpu and video co=
re idle fail (-110)
>> [   57.868699] venus_probe:505 ret=3D-110
>> [   57.873495] venus_hfi_destroy:1690
>> [   57.873519] qcom-venus aa00000.video-codec: probe with driver qcom-ve=
nus failed with error -110
>>=20
>>=20
>
> Have you matched the GDSC flags ?
>
> sm6350:
>
> static struct gdsc mvsc_gdsc =3D {
>          .gdscr =3D 0x2004,
>          .en_rest_wait_val =3D 0x2,
>          .en_few_wait_val =3D 0x2,
>          .clk_dis_wait_val =3D 0x6,
>          .pd =3D {
>                  .name =3D "mvsc_gdsc",
>          },
>          .pwrsts =3D PWRSTS_OFF_ON,
> };
>
> static struct gdsc mvs0_gdsc =3D {
>          .gdscr =3D 0x3004,
>          .en_rest_wait_val =3D 0x2,
>          .en_few_wait_val =3D 0x2,
>          .clk_dis_wait_val =3D 0x6,
>          .pd =3D {
>                  .name =3D "mvs0_gdsc",
>          },
>          .pwrsts =3D PWRSTS_OFF_ON,
>          .flags =3D HW_CTRL_TRIGGER,
> };
>
> sc7280:
> static struct gdsc mvsc_gdsc =3D {
>          .gdscr =3D 0x2004,
>          .en_rest_wait_val =3D 0x2,
>          .en_few_wait_val =3D 0x2,
>          .clk_dis_wait_val =3D 0x6,
>          .pd =3D {
>                  .name =3D "mvsc_gdsc",
>          },
>          .flags =3D RETAIN_FF_ENABLE,
>          .pwrsts =3D PWRSTS_OFF_ON,
> };
>
> static struct gdsc mvs0_gdsc =3D {
>          .gdscr =3D 0x3004,
>          .en_rest_wait_val =3D 0x2,
>          .en_few_wait_val =3D 0x2,
>          .clk_dis_wait_val =3D 0x6,
>          .pd =3D {
>                  .name =3D "mvs0_gdsc",
>          },
>          .pwrsts =3D PWRSTS_OFF_ON,
>          .flags =3D HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
> };

I didn't add RETAIN_FF_ENABLE on SM6350 (lagoon) because the GDSCs don't
have the property 'qcom,retain-regs' in the downstream dts, compared to
SC7280 (yupik).

>
> Also why not turn those apss_smmu entires you have commented out back on =
?
>
> https://github.com/z3ntu/linux/commit/281d07ae965ce0101bdb528e98bf8c00c94=
f86ec#diff-ea117dfbd122406c02e5b143ee0969a3de21416b6c192e3b5ad024571f6e4bff=
R2016

As far as I can see, other SoCs only have the IOMMU that is downstream
non_secure_cb.

But unfortunately applying both changes (RETAIN_FF_ENABLE + iommus)
doesn't change anything, it's still the same error:

[   82.603202] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   82.604738] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   82.606263] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   82.606273] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idl=
e:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
[   82.606280] qcom-venus aa00000.video-codec: wait for cpu and video core =
idle fail (-110)
[   82.606287] venus_probe:505 ret=3D-110
[   82.610767] venus_hfi_destroy:1690
[   82.610783] qcom-venus aa00000.video-codec: probe with driver qcom-venus=
 failed with error -110

Also one thing I can add from my notes, what I didn't write yet. This is
how the register looks with msm-4.19 downstream. IIRC the values here
are not directly comparable because of bitmasks and stuff.

[   48.936285] __prepare_pc_iris2:267 DBG
[   48.940352] __prepare_pc_iris2:299 DBG wfi_status=3D0 ctrl_status=3D4000=
0001
[   48.947624] __prepare_pc_iris2:299 DBG wfi_status=3D1 ctrl_status=3D101
[   48.954212] __prepare_pc_iris2:301 DBG
[   48.958178] __prepare_pc_iris2:314 DBG

Regards
Luca

>
> ---
> bod


