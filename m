Return-Path: <linux-arm-msm+bounces-44078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA15A038CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 08:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 912B0164662
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 07:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0591DB34E;
	Tue,  7 Jan 2025 07:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EI5zPjId"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B759C14F70
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 07:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736235149; cv=none; b=qyxliJIF1WUCnzUUsHtVbsRHSrqVLWw49laaTB0Pnv7LNcT8uunBc6lkhOY64lM/OTKOBU/WRp3qxdn9/UGY2wvdzf2QjT73XXqD12oLA3lh/5D5GK1hYKPAcFjWGCUEVSa2tyaYJHnEtgtQmNQPeGfPB5hR2iQppY2KSPPpB4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736235149; c=relaxed/simple;
	bh=FZEtNKaj3JCG65ps3dFA2ZvHQeOB2XoV5OgwrT933a4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=M6xELSkSzJbHHgaejGLxFH2db0s3ymgZTC++ftDKpOKI6qcxtKB0cP9qNFs8JbW4W1bFCs8yJHDO1TXAJYJkCxnvsbMFNJIZ+apFLhEJHwmtE3n8tRUDUjU8+84s1u4qicprNos1uQ2cCZQNxxMO/javCqkg3gdQMSzRXwT8SFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EI5zPjId; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d437235769so7370163a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 23:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1736235143; x=1736839943; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxsnqoaRjn1U+mzus62drupM2eeFUcVoVsGFZxoMwW4=;
        b=EI5zPjIdaqo/X6wk1NxQv+SadySQN/dkdNwMU/BqN5e+pexLJKv9wikPAROaTVRyNd
         /616Ime7Ey+7vjccBeSj3/4OUVuQGO/OoMYajH28nxF5N8DWcnbuc6hnFr3O/xGozJWE
         DcXe0FnmCfXh3ENqksFigG2EkdkXJLOuwKrzXRb0TPpCs4Ux2muqd1Lwp8+1A9MJelxW
         bCBTS7HKOPoahyij6Eh+SgRQ4X1Y6K9B53DWQ/DG+mU5IF7RVXk/DL9oI2OQCG09tq4b
         kBj/p+CAksc5M2evU9haoNCwimxSPCuKin+B5V7DwqCYrozN3Ygh/Md3VMaswEMES695
         i7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736235143; x=1736839943;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QxsnqoaRjn1U+mzus62drupM2eeFUcVoVsGFZxoMwW4=;
        b=wXK2Yyr8gOdso5jStB/swwe2y2qEROLaPsp5HJuGHGzSJfb9ssv8D9OPNqdOh7CTA2
         LWQ4xZvfA34AI+ao+554W2DnChiHBKBxAZJdVdK5Uoev7Hd7pgpG1wQiNo/aJXmqxhmG
         FxK3L+EJkCz5aIIzZqZaArhIA29FyOCdZKzmJvIKzUfgz4uEYcN6prcn1iP91KvVwVjk
         DcsUJgzsx+oxQp1NGPyIbIAfBWcCzIFhtMh9E0ToXuX8SfvW15SyX6HobhoBRVpxVh5L
         qaYBI2oI/3pNDYCp46dBKx/l4P4tIUZ/ifLWFFZAUVdcWYoxyD+vo9EXqeEHxGbcJvvv
         2Plg==
X-Forwarded-Encrypted: i=1; AJvYcCUv+qO0rgsskWc8kXbgRTv6VwMWeuMloc0kQaJO7jnhKXfj6o7aiyG0vVaN9Bgya7aizlvNssZm+Gc5/LmB@vger.kernel.org
X-Gm-Message-State: AOJu0YzWhwyy3lqaPsACS/eNsviCpYQUd/Ynmd1XuYS5IXEuzpzDwMBU
	KWBjlwq3K5IO+DBBLjqYwWuvhnyNrTv26JZR4ydp6oT1gL0CbIU+SYQsIt+YXP4=
X-Gm-Gg: ASbGncvwDjD+9oZI9NXU63EbrW2NvBoKIYyUsrKsLvdcVZ9aC/yV4B6WcsM8mSXwzag
	InKWfbsynvf32EihoJISF//hi2R9Fwjtpb8yeFxm2BK7MEcUchxUnn82qRIh9+BcL7SqiisfE7P
	78E0MtEBvW7Pk90P6akBVHNXjVe5AqyjQnHA2WotNiMyf7xenrinVcLziBmy6TLg/r4c7LyDpjp
	rKf38Xb+yEgrdg5iVNyLrR72ARj6i/RPaqp0fYFK6kMnogm3uQf4gf2ClUwrTBhObWGEwxeKNq+
	dYOapmwKfW7rk8o=
X-Google-Smtp-Source: AGHT+IHju/xJ5UhqcC+t1vi02NyMGzJzQ3AJeci3xy21v8rmZhpPHEDpgKZLgRB805M7NykexlqqDw==
X-Received: by 2002:a05:6402:5256:b0:5d0:bdc1:75df with SMTP id 4fb4d7f45d1cf-5d81ddf7fa6mr55537562a12.24.1736235143078;
        Mon, 06 Jan 2025 23:32:23 -0800 (PST)
Received: from localhost (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d8baa29afasm13368880a12.59.2025.01.06.23.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 23:32:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jan 2025 08:32:22 +0100
Message-Id: <D6VNZP10UQQM.1OZECZ6TZPY3P@fairphone.com>
To: "Vedang Nagar" <quic_vnagar@quicinc.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
Cc: <cros-qcom-dts-watchers@chromium.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vikash
 Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: enable venus node
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241004-venus_sc7280-v1-1-4d7d8fd7e95b@quicinc.com>
 <kezh3lmysij56g2tjwwuas5r26ro5i777yxxitsdcjeg7zp67v@oknrdbkzison>
 <78e6ff6b-efe1-496c-a1fb-c9a0a4aba2d2@quicinc.com>
 <CAA8EJpqqZL7xybcbJMsbTQB+ht5-A+ocNs+Sq30j=v1zM3JL9g@mail.gmail.com>
 <fbba794a-ba04-4790-b5e9-b4df3cba35b2@quicinc.com>
 <D5KAUZHYJHFS.1NXF5SVWYL03G@fairphone.com>
 <39206687-6fb3-434f-b2ba-a028cf6f8ed3@quicinc.com>
 <D5KW7A8BZG6K.2L7FEV6SWRZ2D@fairphone.com>
 <26b3aee7-5729-447b-983a-cfa5951595ba@quicinc.com>
In-Reply-To: <26b3aee7-5729-447b-983a-cfa5951595ba@quicinc.com>

Hi Vedang,

On Tue Jan 7, 2025 at 5:11 AM CET, Vedang Nagar wrote:
> Hi Luca,
>
> On 11/13/2024 1:33 PM, Luca Weiss wrote:
> > Hi Vedang,
> >=20
> > On Wed Nov 13, 2024 at 8:01 AM CET, Vedang Nagar wrote:
> >> Hi Luca,
> >> On 11/12/2024 8:49 PM, Luca Weiss wrote:
> >>> Hi Vedang,
> >>>
> >>> On Tue Nov 12, 2024 at 3:39 PM CET, Vedang Nagar wrote:
> >>>>
> >>>>
> >>>> On 11/12/2024 6:43 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, 12 Nov 2024 at 08:17, Vedang Nagar <quic_vnagar@quicinc.com=
> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 10/7/2024 1:20 AM, Dmitry Baryshkov wrote:
> >>>>>>> On Fri, Oct 04, 2024 at 04:22:31PM GMT, Vedang Nagar wrote:
> >>>>>>>> Enable the venus node on Qualcomm sc7280. It was made disabled
> >>>>>>>> earlier to avoid bootup crash, which is fixed now with [1].
> >>>>>>>
> >>>>>>> NAK, there might be other reasons to keep venus disabled, like th=
e lack
> >>>>>>> of the vendor-signed firmware for the particular device.
> >>>>>> Can you pls elaborate more on this? Any device with sc7280 SOC can=
 use
> >>>>>> venus.mbn which is already present in linux-firmware git.
> >>>>>
> >>>>> Can it though if the device is fused to use vendor keys and to chec=
k
> >>>>> the trust chain?
> >>>> Yes, infact the existing ones are signed and works with trustzone au=
thentication.
> >>>
> >>> No, the venus firmware from linux-firmware does not work on a device
> >>> with secure boot on, like the (QCM6490) Fairphone 5 smartphone.
> >> Are you saying even after applying this [1] you are seeing the same ?
> >>
> >> [1]
> >> https://patchwork.kernel.org/project/linux-media/patch/20231201-sc7280=
-venus-pas-v3-2-bc132dc5fc30@fairphone.com/
> >=20
> > That patch has been in mainline since v6.9 and my tree is newer, so yes=
.
> >=20
> > See e.g. Qualcomm doc KBA-161204232438 for some details.
> >=20
> > Regards
> > Luca
> >=20
> >>>
> >>> $ rm /lib/firmware/qcom/qcm6490/fairphone5/venus.mbn
> >>> $ cp /lib/firmware/qcom/vpu-2.0/venus.mbn.zst /lib/firmware/qcom/qcm6=
490/fairphone5/venus.mbn.zst
> >>>
> >>> leads to
> >>>
> >>> [   10.848191] qcom-venus aa00000.video-codec: Adding to iommu group =
13
> >>> [   10.863062] qcom-venus aa00000.video-codec: non legacy binding
> >>> [   10.909555] qcom-venus aa00000.video-codec: error -22 initializing=
 firmware qcom/qcm6490/fairphone5/venus.mbn
> >>> [   10.910099] qcom-venus aa00000.video-codec: fail to load video fir=
mware
> >>> [   10.910849] qcom-venus aa00000.video-codec: probe with driver qcom=
-venus failed with error -22
> >>>
> We have seen similar issue with older firmware present in
> linux-firmware git due to a bug in singing of the firmware image.
>
> This issue seems to be resolved with below change:
> aeede7afb7a186b62f9e1f959c33fd5f2dea0f7a: qcom: update venus firmware fil=
e for SC7280
>
> Can you pls give a try with latest firmware if you still see the same iss=
ue?
> We tried internally and do not see any such failure now.

Still same issue after

$ sudo rm /lib/firmware/qcom/qcm6490/fairphone5/venus.mbn
$ sudo cp ~/linux-firmware-aeede7afb7a186b62f9e1f959c33fd5f2dea0f7a/qcom/vp=
u/vpu20_p1.mbn /lib/firmware/qcom/qcm6490/fairphone5/venus.mbn

[   10.260044] qcom-venus aa00000.video-codec: Adding to iommu group 13
[   10.260681] qcom-venus aa00000.video-codec: non legacy binding
[   10.406306] qcom-venus aa00000.video-codec: error -22 initializing firmw=
are qcom/qcm6490/fairphone5/venus.mbn
[   10.406681] qcom-venus aa00000.video-codec: fail to load video firmware
[   10.420897] qcom-venus aa00000.video-codec: probe with driver qcom-venus=
 failed with error -22

Did you try internally on a board with secure boot on or off? I can
imagine this image working fine on SB-off, but not on SB-on, as
mentioned before.

Because when I take that image from linux-firmware and run it through
sectools with the signing config for this device, that firmware
initializes fine.

./sectools/sectools.py secimage --sign --validate \
  --image_file=3Dvpu20_p1.mbn --sign_id=3Dvenus --chipset=3Dkodiak \
  --output_dir=3Dout-signed --cfg_selected_cert_config=3Dmy_sign_config

[   10.624885] qcom-venus aa00000.video-codec: Adding to iommu group 13
[   10.632036] qcom-venus aa00000.video-codec: non legacy binding

$ cat /sys/kernel/debug/qcom_socinfo/video/name
14:video-firmware.1.0-ed457c183307eff1737608763ca0f23656c95b53
$ cat /sys/kernel/debug/qcom_socinfo/video/oem
:hw-skotecha-hyd
$ cat /sys/kernel/debug/qcom_socinfo/video/variant
PROD

Regards
Luca

>
> Regards,
> Vedang Nagar
>
> >>> It's the same with e.g. adsp firmware, modem firmware, etc.
> >>>
> >>> With secure boot off, yes, the hardware will load any firmware
> >>> regardless of the signature.
> >>>
> >>> Regards
> >>> Luca
> >>>
> >>>>>
> >>>>>>
> >>>>>> Regards,
> >>>>>> Vedang Nagar
> >>>>>>>
> >>>>>>>>
> >>>>>>>> [1]
> >>>>>>>> https://lore.kernel.org/linux-media/20231201-sc7280-venus-pas-v3=
-2-bc132dc5fc30@fairphone.com/
> >>>>>>>>
> >>>>>>>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> >>>>>>>> ---
> >>>>>>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
> >>>>>>>>  1 file changed, 2 deletions(-)
> >>>>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>


