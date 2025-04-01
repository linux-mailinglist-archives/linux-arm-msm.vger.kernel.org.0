Return-Path: <linux-arm-msm+bounces-52928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E51CAA77533
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 09:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9D7F7A3332
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 07:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE28C1E7C2F;
	Tue,  1 Apr 2025 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="kcG2opWV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13341E2606
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743492520; cv=none; b=KvDJrcCsPeNkIckvN/RXEphnjReu9yfzImoIrzwbA++LJYc2j0uhmx2u/grjOvSA5shwetv2sL0I3DxGcNy/goYO49bVO4viXIZ2VOnX9z1Yg/QW8uhj008bFY+zNrv6BbLQclVvCJ52k3xm8pA1qI5gIgxsxgWN3wFkx2JKs+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743492520; c=relaxed/simple;
	bh=GMnVik6qR/DphHQzN117FOVrrZnJtfT0FulI+aQTyIs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=QLi22hFmkwIkFzlZGTcItxk/H6L6q7Rr4r9g0UDlNH+aDoo4vq30rMICjbzUHNgpR9uhFSlVauoNVJ7HSvIGdPL0Ya7PniTFrBnHDf/TAIEtXPS51eXjLF2+2IGfOgme5XGuv3OyuHvsQ926fHCtVNYL38uhrpX10RBMSpgkvpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=kcG2opWV; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso9960524a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 00:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1743492517; x=1744097317; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvyKOJV2j861DKzg7ZpKwJkwgo6rqIhbah6vR40nKrs=;
        b=kcG2opWVcXZJ68DxcdUB/vulc0pOMJIitWQxSsChQZbY3aaND2gSws48jd8EsiUL3O
         b+QeOLqnrzzolKBq4RlDof4XZw6OyLs3O6BnP8HGpyiDuMLTH5fouaeb5K2my2PBQAqa
         qFUIvmsbohsTKr42bCNAbBgDvDguQuIdbxw0QFU5otiL4AWIlTxx9Vsb6XdUQDLfEI0q
         HrCJe+wRTDMN5qDF72btN57XNf6/SefYJSh0BrG2DqcK+PWVIXvNXE7kMdVT/F40/zCy
         caYfd/6o08+jnHYKvQN3xll3JQ4etLJk68hS0ZElkggWA5fDmm5zcNUjiXKmmXgtkMus
         ldVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743492517; x=1744097317;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AvyKOJV2j861DKzg7ZpKwJkwgo6rqIhbah6vR40nKrs=;
        b=wjeoTwbHJJKAE+lXWR4LOFiNM6Y4U7XwLUGZeJxZdO53ltRzDKobYIO5ahF8Ii6zYk
         66yfHnKHPPlVL8mtY2T63hU8+JJJ9jG0MwZuIlOKuHUl98mOIspTYzGN8qzDrgl0fqGb
         /0IDzUQmzm1L6PeI9rRU6W4OZLF2dNPrC6HVuvSpdGe8WsI62huzcSgi1svNuiAIwoXf
         gUjvoMh3wES1458n9EdFq7XDfVb/sHjsPYG3VjdNn4VGjmEVLrYJM3mGMnRiDHxEzRXV
         Ps+Nw5dDx6HT0d91Qkce4TLMRr9wtYe4vU5yGivZqXdBb2Kmbe/er/XBbl9VMyeCI/rF
         j5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWtRz/n2T3Djqm1GQuaqyrP4/e7vFmBKb1VnCU9VVCba2esXI8orCyDizXkBUNYDLbRBAEQb9Bw6pQr9q/E@vger.kernel.org
X-Gm-Message-State: AOJu0YxrqkYaDumdAAAEMW+JzbY0jTG6OD3YEScq+GQNevAwxCmNsnYk
	Iq8unWCktFPXx60njy+OGPUmchDHN2N4S/657jADMCRXuNmZXxXs252hd0NM1K8=
X-Gm-Gg: ASbGncszt736nXOqTbHdkl8271q3/UHcy/h16Vl/swMmLjd/DOzTKD6VRhuD5V9ddPf
	9y3vAdNSNcGhEbsvwSqpLFPg/Y4+axhVNXX11XK0pfrRrA/5UUvrL3mHL8YH0x/bFThbRAUdLaA
	eO9HJ8fqyDm5HvTnsQh6redOs3vVDnE92kz1enBO2bs55lgmpqMdN+m1yqtGP2NpA9gwhl6VakY
	MhdqGn6w+QKTBInKClA9vi/aCaSclLesR5OD8SD1AU0H0OlVH9Uqstmh+8+oS0RPhWiugHfrgme
	Lq38LUbJdm078sZ+0+obXCXIb3TPD2Up52u4Zgoc4eC0opDD8SeCvhs=
X-Google-Smtp-Source: AGHT+IGreNP1xS+TpYq117PonYwsZsrWIWZe7aQWxPT2KWDAiHRqRQFW+FwoSeQz9TNgmJoNUVepdw==
X-Received: by 2002:a05:6402:26cb:b0:5e6:e68c:9d66 with SMTP id 4fb4d7f45d1cf-5edfce76c4emr8587117a12.8.1743492516958;
        Tue, 01 Apr 2025 00:28:36 -0700 (PDT)
Received: from localhost ([41.66.98.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17b1ffcsm6713611a12.50.2025.04.01.00.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 00:28:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 09:28:28 +0200
Message-Id: <D8V4IHD5INWE.3FK3SCTG05R97@fairphone.com>
Subject: Re: Venus probe issues on SM6350 SoC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Vikash Garodia"
 <quic_vgarodia@quicinc.com>, "Dikshita Agarwal"
 <quic_dikshita@quicinc.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <6P5iXJOUxv3jsPGI11XbeZOagg2ht2Ws-WbN2HjXSFC_xeFgWyGM3a9T6y30gmys3KSxJF9Tv3f7jAehZ6AlOQ==@protonmail.internalid> <D8S03CCD8LGW.TA2FRY4CKEGT@fairphone.com> <6ae076fc-e30a-431e-b75e-7f9b9d7bff08@linaro.org> <ak18vN44u4bjszfN2KsbOPxAzArT4ISzMKI7eapjrU-rK6O85oI-fqAIHPLYeQVIzUS32Huvpql2Vcg6_UHaAA==@protonmail.internalid> <D8U8XDW1QRAY.35U7ER6E74G55@fairphone.com> <5c1d5dfc-b189-4948-8739-1fd90ebd033b@linaro.org>
In-Reply-To: <5c1d5dfc-b189-4948-8739-1fd90ebd033b@linaro.org>

Hi Bryan,

On Mon Mar 31, 2025 at 11:47 AM CEST, Bryan O'Donoghue wrote:
> On 31/03/2025 07:43, Luca Weiss wrote:
>>> Also why not turn those apss_smmu entires you have commented out back o=
n ?
>>>
>>> https://github.com/z3ntu/linux/=20
>>> commit/281d07ae965ce0101bdb528e98bf8c00c94f86ec#diff-=20
>>> ea117dfbd122406c02e5b143ee0969a3de21416b6c192e3b5ad024571f6e4bffR2016
>> As far as I can see, other SoCs only have the IOMMU that is downstream
>> non_secure_cb.
>>=20
>> But unfortunately applying both changes (RETAIN_FF_ENABLE + iommus)
>> doesn't change anything, it's still the same error:
>>=20
>> [   82.603202] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_=
idle:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
>> [   82.604738] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_=
idle:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
>> [   82.606263] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_=
idle:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
>> [   82.606273] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_=
idle:1535 cpu_status=3D0 (OK 0) ctrl_status=3D1 (OK 0)
>> [   82.606280] qcom-venus aa00000.video-codec: wait for cpu and video co=
re idle fail (-110)
>> [   82.606287] venus_probe:505 ret=3D-110
>> [   82.610767] venus_hfi_destroy:1690
>> [   82.610783] qcom-venus aa00000.video-codec: probe with driver qcom-ve=
nus failed with error -110
>>=20
>> Also one thing I can add from my notes, what I didn't write yet. This is
>> how the register looks with msm-4.19 downstream. IIRC the values here
>> are not directly comparable because of bitmasks and stuff.
>>=20
>> [   48.936285] __prepare_pc_iris2:267 DBG
>> [   48.940352] __prepare_pc_iris2:299 DBG wfi_status=3D0 ctrl_status=3D4=
0000001
>> [   48.947624] __prepare_pc_iris2:299 DBG wfi_status=3D1 ctrl_status=3D1=
01
>> [   48.954212] __prepare_pc_iris2:301 DBG
>> [   48.958178] __prepare_pc_iris2:314 DBG
>>=20
>> Regards
>
> I wonder are all of the clocks going that are required to get the core=20
> booting ?
>
> Taking a quick look I'd recommend keeping
>
> SLEEP_CLK and AHB_CLK always-on
>
> https://github.com/z3ntu/linux/blob/04f855c2b70302c9ddcd47b1fee4a2dc84fb5=
ba6/drivers/clk/qcom/videocc-sm6350.c#L301C1-L302C58
>
> It might be an idea to set all of the interface clocks always-on and see=
=20
> if that makes a difference, rolling back individually if it works.
>
> - VIDEO_CC_IRIS_AHB_CLK
> - VIDEO_CC_MVS0_AXI_CLK
> - VIDEO_CC_SLEEP_CLK
> - VIDEO_CC_VENUS_AHB_CLK

How do I best do this? Adding ".flags =3D CLK_IS_CRITICAL," to these four
clocks make them be stuck at probe time.

[    0.459004] ------------[ cut here ]------------
[    0.459069] video_cc_mvs0_axi_clk status stuck at 'off'
[    0.459093] WARNING: CPU: 2 PID: 74 at drivers/clk/qcom/clk-branch.c:87 =
clk_branch_toggle+0x194/0x1ac

I guess some other clock or power domain that's required for this clock
si not on yet?

Same with
[    0.466604] video_cc_venus_ahb_clk status stuck at 'off'

But it looks like VIDEO_CC_IRIS_AHB_CLK and VIDEO_CC_SLEEP_CLK can turn
on correctly with the CRITICAL flag.

Regards
Luca


> ... and if we are going that far might as well do the whole array which=
=20
> is small enough
>
> https://github.com/z3ntu/linux/blob/04f855c2b70302c9ddcd47b1fee4a2dc84fb5=
ba6/drivers/clk/qcom/videocc-sm6350.c#L293
>
> Is it possible the AHB and AXI clocks are on =3D> read/write transactions=
=20
> would work but one of the core-clocks is off =3D> no boot on the remote e=
nd ?
>
> ---
> bod


