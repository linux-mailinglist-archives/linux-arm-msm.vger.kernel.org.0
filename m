Return-Path: <linux-arm-msm+bounces-3286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3D78034E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B94AC1F211DC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A5A24B5C;
	Mon,  4 Dec 2023 13:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GAHVgSOK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0550E173A
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:27:57 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59b5484fbe6so50368737b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 05:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701696477; x=1702301277; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2fW3mjZFFzwIx8dmT9JEHvadR6/J6k7n4MRMrtMRyEY=;
        b=GAHVgSOKkVlBz+w9n1xP4kdiDK9OkF/dRCyeRc7fl5d83MWHqSucPogxsuG2cSS4bI
         /HXSdqeKhbhSQiyMZny0nT3uLqFzcCJqbDYXZdtctYvFiiyfN/JNA05wuWn5Ch+pbqPE
         cby9vn7uOYq9A4wVuewp2B/O6WGic8NanhMMUJlOhbRTxagfZJ7Ib3a3St3QHalNxgI+
         MSKq/ayNyijGzRLfNAdlc0sklc7hoZOFxS4QAx1J/sB3qKFOf2KCAvnMoozX7rLjIkNI
         c3v1Nvrw0JJ6+SqNZqrMydcU3pzBvmyy5AsjfAh5/hUzmIzbbpIdmRZninQecTfHFyaJ
         +TMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701696477; x=1702301277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fW3mjZFFzwIx8dmT9JEHvadR6/J6k7n4MRMrtMRyEY=;
        b=bFL4LFFUmCRqOMe2IiP1sXUU1wg1zCbqbG3zZPnXFXxMYDGuYQa3xY4gBpaSP7547P
         v4rrEdBlunQjY8FeR3bKIdNfe80AHaEuMOee/3lBjcM79ov+NcYLcO0l9SAE3ws3HHeS
         Q8N6Hwayc/kKpufRgqgNd8s87ohF9tSxZ3IXSB8gf8hfvQwdB2qFthcVz2f9TCbaGiwz
         An4nuYu7hmLkzdq0jf26izL8bZtbyGZr9QZBfKnrTBWUZTY2iYOdxKYigcgop5HLt0Ft
         5XA2/ZO3xc9vLN9RsFuv3Ng20t3+I+iRNJe+jaQnMHdE7xZvxImwnvkh+y93QhK0IIrj
         y0sw==
X-Gm-Message-State: AOJu0Yz/F+Zhu4oWPpYs+TM+eMAyhUrN0AFkkomPcd2qWcayN8h57764
	kCQDpgQh1IOdSihED+X8QrVp9yHVDbVe5qS37FLc1Q==
X-Google-Smtp-Source: AGHT+IFT5Ekm/eux4m2CPF+K2InPLFR37b/4dxO3Ja+TBOqMeMVzDBImq2SVkNPbb6g1r6wIiJTMB7rV1scXEx5//MU=
X-Received: by 2002:a81:af14:0:b0:5d7:1940:b373 with SMTP id
 n20-20020a81af14000000b005d71940b373mr3543896ywh.63.1701696477097; Mon, 04
 Dec 2023 05:27:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJpp+SJpX4FFmcTm133KNtztTJH0ovTLRm0bftahPT8a1kw@mail.gmail.com>
 <87leaaqg7a.fsf@kernel.org>
In-Reply-To: <87leaaqg7a.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 15:27:46 +0200
Message-ID: <CAA8EJpomDw0sBOT_t5F33Uqn4FeWRBewv_=_4q4OzvU+JzXH-g@mail.gmail.com>
Subject: Re: ath10k / WCN3990: firmware-5.bin and wlanmdsp.mbn being out of sync
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Dec 2023 at 14:56, Kalle Valo <kvalo@kernel.org> wrote:
>
> Hi Dmitry,
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > I wanted to ask your opinion regarding one of the issues we stumbled
> > upon on the Qualcomm RB1 and RB2 platforms. These platforms use ath10k
> > snoc (WCN3990) WiFi "card". We noticed the following messages being
> > spawned on the console, which I traced it to the
> > ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL feature:
> >
> > ath10k_snoc c800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)
> >
> > As a reminder, on this platform the wlan firmware and firmware-N.bin
> > files come separately.
> > The wlanmdsp.mbn is downloaded by the onboard modem DSP via the
> > tqftpserv request (which is served from the board-specific folder
> > qcom/qcm2210). The firmware-N.bin file is loaded by the WiFi driver
> > itself from the generic folder, ath10k/WCN3990/hw1.0. Current
> > firmware-5.bin file was provided with the sdm845's wlanmdsp.mbn, which
> > is older than qcm2210/qrb4210's wlanmdsp.mbn.
> >
> > I'm looking for suggestions on how to make ath10k driver load
> > firmware-N.bin file which corresponds to the board-specific
> > wlanmdsp.mbn.
>
> We have had similar discussions in the past but it didn't go very far.
> It would be so nice if you could finally fix this :) At one point we
> even had a discussion that we might need something similar for ath11k
> but it didn't go anywhere.
>
> > In particular I'd like to hear your opinion on the following proposal:
> >
> > Add the  optional property to the board DT, that specifies:
> > firmware-name = "path/to/wlanmdsp.mbn".  The property, if present,
> > will be used as an override for the firmware directory. So, while the
> > ath10k driver will not load wlanmdsp.mbn on its own, it will still
> > look for the firmware-N files in the specified directory.
>
> Back in the day I was thinking something like below, please let me know
> what you think.
>
> So the normal firmware path for WCN3990 is:
>
> ath10k/WCN3990/hw1.0/
>
> My idea was that if we could extend it for different "platforms" (not
> sure what's the proper term for this) by having platform specific
> directories:
>
> ath10k/WCN3990/hw1.0-platform/
>
> (Replace "platform" with a unique name for the platform, for example
> "acme-kv7" for a product from Acme with model name kv7.)
>
> Then DT could inform ath10k about this "platform" string and ath10k
> would then download boath firmware-N.bin and board-2.bin from the
> platform specific directory.
>
> And even cleaner if we could have the *.mbn firmware files in the same
> directory, even if ath10k doesn't access them directly.

We can, and a symlink from qcom/SoC/.../dir to that subdir.

So, for example, for Pixel-3, using your schema we will have:

ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
ath10k/WCN3990/hw1.0-blueline/firmware-5.bin
ath10k/WCN3990/hw1.0-blueline/board-2.bin

qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
../../../../ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn

This sounds mostly fine to me. My only suggestions is to change it as following:

ath10k/WCN3990/hw1.0/board-2.bin

ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn
ath10k/WCN3990/hw1.0/blueline/firmware-5.bin
ath10k/WCN3990/hw1.0/blueline/board-2.bin

qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
../../../../ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn

-- 
With best wishes
Dmitry

