Return-Path: <linux-arm-msm+bounces-1930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0627F881E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 04:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33A1BB212B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 03:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7597D15AA;
	Sat, 25 Nov 2023 03:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ATJ4PU1i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1451B2
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 19:23:32 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5c8c8f731aaso24870947b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 19:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700882611; x=1701487411; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sjL81e6YDLfv+wrtlijj62WmZNGcc6e+Qo6poqFVcLQ=;
        b=ATJ4PU1ifW2Fg0da4AkWjt4X+6cZaXlRCEdzczzFUx6kl+/gbDfjfDfnVMrMOyHh/O
         bcx6rQgSmGyADpj3tLROrY7W+LGVpKqxfq61dZMTREmghCPOd0XEHwDwbNcodSQQ/eFR
         U4d6zFjo1ZoPjqs+wbB9x8X99dXm4gjwfufvw9prjf/nUmT33Td6SDlIVXS70P3KV8Wy
         IqSX5IhMc7IJTLby59IijKLKd1VhyjVO9g5+JIXDexjwp33bWMRlAlDZxCJzF7Nc1fND
         +qrO2KQ9Y9Mp1EJ8/MPvHxYC44RAIgaBDfbx/T8bSIIM/x1Ql5jgZ5+FqYZ/kRoJEJ9j
         GnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700882611; x=1701487411;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjL81e6YDLfv+wrtlijj62WmZNGcc6e+Qo6poqFVcLQ=;
        b=FP+vs7OAHl+P7gGBhLqNZxkN3742iJLT6Tb7qFWU6YRemCj83SbRW9P1Bm9U5A/Cm3
         iVvNqSdYF9Loz6Bk61Fj5ledTdteizprG3FAt5mCDrC8e54oRj5qWa7aHCVQQ4sHD1C7
         J7GwNXxD/LrsUBJN6n2PNWjzctuPkNkz9hzepxNKJFXKDzSwSFUI1xNunsmrTkZdBSjO
         m8B6Lv56PtnEjtMpwcEXxm22hbVrxN2nRWm7HYbS1Vrpza1hQ4w2HcERBUgWN/u5PUx7
         wF8Imkwaiw93iJp6JchOzMreK6c0fCqCzl6Gk1G+DaN749cs2YTvpP1/jBzmaYYZ7VH9
         UXXA==
X-Gm-Message-State: AOJu0YyIhewofpeMu096UQNNIyIvQO945CEIeFeGB1kMNt1VSLA2Sanv
	06jbbBwJyPwMeErdkE8oNCJOgzpHY+tK36Gv4sA5wFggNwRmtVeqdPY=
X-Google-Smtp-Source: AGHT+IECgmqQabDFGiv1Tx6rmpVoGPwGawGaCeEnfzbzdw1qqpZZSxq93SjSW4z8fe7uLB+2cJsZ4dWTT7tVNYKe6dI=
X-Received: by 2002:a0d:d40f:0:b0:5cc:7431:871 with SMTP id
 w15-20020a0dd40f000000b005cc74310871mr5188552ywd.25.1700882611622; Fri, 24
 Nov 2023 19:23:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Nov 2023 05:23:20 +0200
Message-ID: <CAA8EJpp+SJpX4FFmcTm133KNtztTJH0ovTLRm0bftahPT8a1kw@mail.gmail.com>
Subject: ath10k / WCN3990: firmware-5.bin and wlanmdsp.mbn being out of sync
To: ath10k@lists.infradead.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

I wanted to ask your opinion regarding one of the issues we stumbled
upon on the Qualcomm RB1 and RB2 platforms. These platforms use ath10k
snoc (WCN3990) WiFi "card". We noticed the following messages being
spawned on the console, which I traced it to the
ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL feature:

ath10k_snoc c800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)

As a reminder, on this platform the wlan firmware and firmware-N.bin
files come separately.
The wlanmdsp.mbn is downloaded by the onboard modem DSP via the
tqftpserv request (which is served from the board-specific folder
qcom/qcm2210). The firmware-N.bin file is loaded by the WiFi driver
itself from the generic folder, ath10k/WCN3990/hw1.0. Current
firmware-5.bin file was provided with the sdm845's wlanmdsp.mbn, which
is older than qcm2210/qrb4210's wlanmdsp.mbn.

I'm looking for suggestions on how to make ath10k driver load
firmware-N.bin file which corresponds to the board-specific
wlanmdsp.mbn.

In particular I'd like to hear your opinion on the following proposal:

Add the  optional property to the board DT, that specifies:
firmware-name = "path/to/wlanmdsp.mbn".  The property, if present,
will be used as an override for the firmware directory. So, while the
ath10k driver will not load wlanmdsp.mbn on its own, it will still
look for the firmware-N files in the specified directory.

-- 
With best wishes
Dmitry

