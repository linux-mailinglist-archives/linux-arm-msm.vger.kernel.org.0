Return-Path: <linux-arm-msm+bounces-61817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8E4AE08C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 16:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6CC71775AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 14:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED0C221549;
	Thu, 19 Jun 2025 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3XUeBUp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6394220F24
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343348; cv=none; b=ILaE602KUEVCe5Be//RVhWDfktUI3Lrd1JhN8aXH1O4h+hTCsEkadKyCaInDzInOWjkzmLwqrDkRa+oRT/9nKmsGVr5DQfpUb4eS9rSK4F20YU5ZS7ewM1JKKHwcyQz5ruZoMyeebfMfFys5C9FX4Cf2pWyX7buZLfChliN44qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343348; c=relaxed/simple;
	bh=D1FpMeM9RG/lMcD7JN2jYaN1GxVsH9kZm9zWuCKx8/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+JrrKo+cJI9H1PFnsHNn7GUYJkihwffwYhdv8n9G1OZb2MUK8HU9ayE4d4jiJ39f0YsOwoJ/1Jx5jCgqOyrhTl7fdtvImOJGLEhiJ36IkJ1sR1zHLL8tsCNIggma/McDUx2RF6NNf/yFWc1MPumG4EefLWHKjmKVNb7wzLpJ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3XUeBUp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453608ed113so7139355e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750343344; x=1750948144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vID+88kysAuv3fohGItdEKtFMSpDLZV0m7kY8iouvbc=;
        b=A3XUeBUp3xAz9rjbcd+e3f3DUCI6FZffcTufj94InBVmS+jKBdVHv28LslvMWG1PNK
         opK0iepVpTH3JSX4XQQEZYMSojvXHhQ0Hppu2fYT2o9tWllv05e0ndSuAJfQ4FOiJcUu
         Gd+lfRQnbHKkpbImyXvIoJUobaTx65jc6ipRdDIJZ7qLEYzCjVC7xbMFAt/PHXJdE+Yk
         03kYf5S7lNkgP66qTaPm0VT8IMKX9vuTiK0TolL9+Hz2NaKGqRjh0E9PaZRxyhOJ0+F0
         HYFe1ykcFvz0A1sxIwZM1V4BFg1OMq1z317RZJeFOwK7XimSJrBmuQlMpbv2/lb277mp
         c8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343344; x=1750948144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vID+88kysAuv3fohGItdEKtFMSpDLZV0m7kY8iouvbc=;
        b=aOZ3fiEvIEc4I9S+R3JsS49RBOHPQPhEvO51HIKJp+NubQd/u5rlTrgNEJXwhuhCbF
         puXVcYrNEX5N6hl89/+MoypUTIyHocBupQIArqWw02XxHaPjKv3AwyUaWFbgQnQiMUYq
         mWgZQKr0/yKgYjBUjnR5H633zRRoFI2ddLBvRsnY3Iqx5u/UwhbxrQLw5XPy1+7YQPqI
         tZzrjkE344bfJzAB+3odrXFZhv04odujBk7+W/YcRK86x+0YsMWJZ15OKMnkznhqxZ6M
         FwNk9Jx+pAL/fUsc0srGC9uGCYp0n+dIvwLhnWfsJdUlX9oXaKQAYIX5WdvP6lKi6L88
         Z9Gg==
X-Gm-Message-State: AOJu0YwTh2q2lnMaXRB5wCjt/CvOS1s+mJTQw1i7zjVcYGSjk/tjTMm5
	1YGIIwqnwY4Sdvu8+EdeCUxiJiOoDQHLdO4Xyg6e5lYTVbkN4zn8rMar4BZanlZgxiM=
X-Gm-Gg: ASbGncsF6hRwZB4+7tRGgLECM0CaOh1YGid23GJtzGK5tJ0ZsymmgigX3z2m0443UI7
	hEjMnz4zy+XMWhFZ4nUlMtM0ElwxBco3ub3DsDYNQmjcsurO6rxPO/TUyhSmHX0KHlyH9rXp5j9
	+P0kn6/8LoVJg3s4/4hbmaosDyROX9rQtOHj8ETDoaPDrKIq2Sx58eSMBgYznm8/Uf+KTNwaIAD
	l2YIzZgzMA06c7ZrY5JQosAQcZL3IQiQl4gXu7H1C6kyQUIZO8sUHjYVJvsouGR3RaGLJOMixHB
	IcxH1lcyFKjFjKfdWvDgeawhx6wPHENGY0S01FkGzle/6MaU8YJ3tcb5Xc4IT7nz4MESAHOuhvJ
	GHRkcD0Dy3fMKjmqyPX3OfDTKbPo=
X-Google-Smtp-Source: AGHT+IFloaKOwfagT+52rEvsHVkybUb2CjvKnDodcnW3R92VmU/osx7OK6rjVXcosFx6A8TVLavnzg==
X-Received: by 2002:a05:6000:144d:b0:3a4:dc32:6cbb with SMTP id ffacd0b85a97d-3a5723a2637mr19283869f8f.31.1750343344141;
        Thu, 19 Jun 2025 07:29:04 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a57b15015fsm14200552f8f.95.2025.06.19.07.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 07:29:03 -0700 (PDT)
Message-ID: <672b5db1-e045-4625-bad6-83224c27c07f@linaro.org>
Date: Thu, 19 Jun 2025 15:29:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] media: venus: Add QCM2290 support with AR50_LITE
 core
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, stanimir.k.varbanov@gmail.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/06/2025 15:20, Jorge Ramirez-Ortiz wrote:
> Changes since v1:
> - Add IS_HFI macro usage
> - Move schema patch to top
> - Fix commit messages
> 
> This patch series adds support for the Venus video decoder/encoder block
> present on the Qualcomm QCM2290.
> 
> The QCM2290 integrates an AR50_LITE core, a low-power implementation of
> Venus supporting H.264, HEVC (H.265), and VP9 decoding.
> 
> The series includes:
>    • DT binding schema for qcom,qcm2290-venus
>    • SoC integration via qcm2290.dtsi
>    • Resource table definitions and frequency scaling
>    • Platform capability registration for the AR50_LITE core
> 
> Decoding was verified on the QCOM RB1 platform using GStreamer with V4L2-based
> decode plugins. The following pipelines were used for playback 1280x720 and
> 1920x1080 H.264, HVEC and VP9 videos from https://www.elecard.com/videos.
> 
> [H.264]
> gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
>    ! qtdemux name=demux demux.video_0 ! queue ! h264parse ! v4l2h264dec \
>    ! videoconvert ! autovideosink
> 
> [H.265]
> gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
>    ! qtdemux name=demux demux.video_0 ! queue ! h265parse ! v4l2h265dec \
>    ! videoconvert ! autovideosink
> 
> [VP9]
> gst-launch-1.0 filesrc location=videos/xxxxx.webm \
>    ! matroskademus ! queue ! v4l2vp8dec \
>    ! videoconvert ! autovideosink
> 
> ---
> 
> Jorge Ramirez-Ortiz (7):
>    dt-bindings: media: venus: Add qcm2290 dt schema
>    media: venus: helpers: add IS_VPU() and IS_HFI() macros
>    media: venus: use IS_HFI() macro for multi-version check
>    media: venus: vdec: AR50_LITE video core support
>    media: venus: hfi_plat_v6_lite: Populate decode capabilities
>    media: venus: core: Add qcm2290 DT compatible and resource data
>    arm64: dts: qcom: qcm2290: Add venus video node
> 
>   .../bindings/media/qcom,qcm2290-venus.yaml    | 117 ++++++++++++++
>   arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  45 ++++++
>   drivers/media/platform/qcom/venus/Makefile    |   2 +-
>   drivers/media/platform/qcom/venus/core.c      |  51 +++++-
>   drivers/media/platform/qcom/venus/core.h      |  28 +++-
>   drivers/media/platform/qcom/venus/firmware.c  |   8 +-
>   drivers/media/platform/qcom/venus/helpers.c   |  81 ++++++++++
>   drivers/media/platform/qcom/venus/helpers.h   |   2 +
>   .../media/platform/qcom/venus/hfi_helper.h    |  10 +-
>   .../media/platform/qcom/venus/hfi_platform.c  |   2 +
>   .../media/platform/qcom/venus/hfi_platform.h  |   1 +
>   .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
>   drivers/media/platform/qcom/venus/hfi_venus.c |  19 ++-
>   .../media/platform/qcom/venus/pm_helpers.c    |   1 +
>   drivers/media/platform/qcom/venus/vdec.c      |  17 +-
>   15 files changed, 504 insertions(+), 28 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>   create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> 

Please fix the following.

~/my-environment/bin/checkset.sh
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#16:
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 117 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

0001-dt-bindings-media-venus-Add-qcm2290-dt-schema.patch has style 
problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
CHECK: Macro argument reuse 'core' - possible side-effects?
#33: FILE: drivers/media/platform/qcom/venus/core.h:537:
+#define MATCH_2(CMD, core, a, b) \
+	(IS_##CMD##_MATCH(core, a) || IS_##CMD##_MATCH(core, b))

CHECK: Macro argument reuse 'core' - possible side-effects?
#35: FILE: drivers/media/platform/qcom/venus/core.h:539:
+#define MATCH_3(CMD, core, a, b, c) \
+	(IS_##CMD##_MATCH(core, a) || IS_##CMD##_MATCH(core, b) || \
+	IS_##CMD##_MATCH(core, c))

CHECK: Macro argument reuse 'core' - possible side-effects?
#38: FILE: drivers/media/platform/qcom/venus/core.h:542:
+#define MATCH_4(CMD, core, a, b, c, d) \
+	(IS_##CMD##_MATCH(core, a) || IS_##CMD##_MATCH(core, b) || \
+	IS_##CMD##_MATCH(core, c) || IS_##CMD##_MATCH(core, d))

WARNING: Argument '_1' is not used in function-like macro
#42: FILE: drivers/media/platform/qcom/venus/core.h:546:
+#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */

WARNING: Argument '_2' is not used in function-like macro
#42: FILE: drivers/media/platform/qcom/venus/core.h:546:
+#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */

WARNING: Argument '_3' is not used in function-like macro
#42: FILE: drivers/media/platform/qcom/venus/core.h:546:
+#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */

WARNING: Argument '_4' is not used in function-like macro
#42: FILE: drivers/media/platform/qcom/venus/core.h:546:
+#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */

total: 0 errors, 4 warnings, 3 checks, 29 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

0002-media-venus-helpers-add-IS_VPU-and-IS_HFI-macros.patch has style 
problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
total: 0 errors, 0 warnings, 0 checks, 16 lines checked

0003-media-venus-use-IS_HFI-macro-for-multi-version-check.patch has no 
obvious style problems and is ready for submission.
CHECK: Macro argument reuse 'core' - possible side-effects?
#79: FILE: drivers/media/platform/qcom/venus/core.h:525:
+#define IS_V6(core)     (((core)->res->hfi_version == HFI_VERSION_6XX) || \
+			 ((core)->res->hfi_version == HFI_VERSION_6XX_LITE))

CHECK: Blank lines aren't necessary before a close brace '}'
#153: FILE: drivers/media/platform/qcom/venus/helpers.c:254:
+
+}

CHECK: Unnecessary parentheses around 'buftype != HFI_BUFFER_INPUT'
#215: FILE: drivers/media/platform/qcom/venus/helpers.c:709:
+		if ((buftype != HFI_BUFFER_INPUT) &&
+		    (buftype != HFI_BUFFER_OUTPUT) &&
+		    (buftype != HFI_BUFFER_OUTPUT2))

CHECK: Unnecessary parentheses around 'buftype != HFI_BUFFER_OUTPUT'
#215: FILE: drivers/media/platform/qcom/venus/helpers.c:709:
+		if ((buftype != HFI_BUFFER_INPUT) &&
+		    (buftype != HFI_BUFFER_OUTPUT) &&
+		    (buftype != HFI_BUFFER_OUTPUT2))

CHECK: Unnecessary parentheses around 'buftype != HFI_BUFFER_OUTPUT2'
#215: FILE: drivers/media/platform/qcom/venus/helpers.c:709:
+		if ((buftype != HFI_BUFFER_INPUT) &&
+		    (buftype != HFI_BUFFER_OUTPUT) &&
+		    (buftype != HFI_BUFFER_OUTPUT2))

total: 0 errors, 0 warnings, 5 checks, 314 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

0004-media-venus-vdec-AR50_LITE-video-core-support.patch has style 
problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
0004-media-venus-vdec-AR50_LITE-video-core-support.patch:64: bufferes 
==> buffers, buffered
0004-media-venus-vdec-AR50_LITE-video-core-support.patch:65: bufferes 
==> buffers, buffered
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#57:
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 171 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

0005-media-venus-hfi_plat_v6_lite-Populate-decode-capabil.patch has 
style problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
total: 0 errors, 0 warnings, 0 checks, 52 lines checked

0006-media-venus-core-Add-qcm2290-DT-compatible-and-resou.patch has no 
obvious style problems and is ready for submission.
total: 0 errors, 0 warnings, 0 checks, 51 lines checked

0007-arm64-dts-qcom-qcm2290-Add-venus-video-node.patch has no obvious 
style problems and is ready for submission.
  ~/Development/worktree/merges/linux-6.17-media-platform-qcom-next 
(linux-6.17-media-platform-qcom-next*) [03:28:03]
deckard$

deckard$ cat ~/my-environment/bin/checkset.sh
#!/bin/sh
if [ -z "$KERNELPATH" ]
then
	echo "Setting KERNELPATH to this directory which is probably what you want"
	echo "Please set KERNELPATH when running this utility to over-ride";
	echo "KERNELPATH=`pwd` ~/my-environment/bin/checkset.sh"
	KERNELPATH=`pwd`
fi
for file in *.patch;
do $KERNELPATH/scripts/checkpatch.pl --strict $file;
codespell $file;
done

---
bod

