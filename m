Return-Path: <linux-arm-msm+bounces-81575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2938C56C21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 11:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD0503B3CCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475252D739A;
	Thu, 13 Nov 2025 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Al1xnPVZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B94A27CB35;
	Thu, 13 Nov 2025 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763028349; cv=none; b=tCw47kFK0a6D0Gv/qVoBwBWbjAz+nmT5VjOFQP40Fmbtlefdf3+IoV23ct0j4rCMcr+n3gzLV/o1Bg6YVhOoY0Pd5absn0haLhzCzCiws/jplCy2GjcNn5MCyZIuVlyjHenEDNRiggqi7SWJ/C9M9lH07yVoboipHcjmX60U06I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763028349; c=relaxed/simple;
	bh=PMQMnmPZgMlRWEN0RltjMRZ0JKtiRryM3+4RCOACEXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TiNlUf5Yy4bO3Y1EBxeTN4fwTXAnG2oeylvQrmDYKZM97NQtu3WoYLlhY8zm0Xu1gnc3iyUD+r8GpxSmHwG+y1G1ibZgVNcR2DkzOHv7KbU+6MUBQS/uxwgByr7oD7tneCti7SCEh2GlxtC8OSiHZJFRs8zkhhlJUBcXyLFmUJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Al1xnPVZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39C2C4CEF5;
	Thu, 13 Nov 2025 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763028348;
	bh=PMQMnmPZgMlRWEN0RltjMRZ0JKtiRryM3+4RCOACEXs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Al1xnPVZen/r+bRREjjkwSIMIGWRNLrLgqcwqO9z9k3zhezrqOtbmm6n0KxSXrXFb
	 EB+kxZBuPKnGBi7yFMwzUpwYt2/2ygJfXGHma6r+q2uBdVeLrgoWBzN1osgoGm3ZOF
	 x2G6hs1v4EqpkIoBEHyGQB/TScfrZzDOUnhcOA0bMgXOygGwaWmGXsLAnr1WYMDvjc
	 j0uSspS1ZaoItnRam9T3WeVxMeexdUoeHRGtnsKW3Vi3v4gkuDtj+eZ4EhgBBDmJMk
	 wFLMzViQ1Xjo99tR0NFgxPh+ByacMx3fUjCaGri7YMKFcdIR9Ut9Yu/ST7s8E0Tf6P
	 Q2MwvaBVz6/1Q==
Message-ID: <e7a8c724-9938-4b03-b855-5a2e3152d36e@kernel.org>
Date: Thu, 13 Nov 2025 10:05:44 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] media: qcom: iris: encoder feature enhancements
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 quic_qiweil@quicinc.com, quic_renjiang@quicinc.com
References: <_qCcVDgw74JJZnRLeyRvD2E58cceoefsZacP0u2-J04hcDEH3Sh1Aeglq-VSWqfWFEx1IdwZDcwsQeQOO4m8yA==@protonmail.internalid>
 <20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/2025 10:23, Wangao Wang wrote:
> Hi All,
> 
> This patch series introduces several enhancements to the Qualcomm Iris
> encoder driver, improving support for V4L2 controls and enabling more
>   video encoding features.
> 
> All patches have been tested with v4l2-compliance, v4l2-ctl and
> on QCS8300 for encoder.
> 
> Commands used for V4l2-ctl validation:
> 
> Scale:
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=width=1280,height=720,pixelformat=H264 \
> --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/scale_720p_output.h264
> 
> Flip:
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/vertical_flip.h264 \
> --set-ctrl vertical_flip=1
> 
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/horizontal_flip.h264 \
> --set-ctrl horizontal_flip=1
> 
> Rotate:
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/rotate90.h264 \
> --set-ctrl rotate=90
> 
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/rotate180.h264 \
> --set-ctrl rotate=180
> 
> v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/rotate270.h264 \
> --set-ctrl rotate=270
> 
> Intra Refresh:
> Testing of this feature requires the use of this application.
> https://github.com/quic/v4l-video-test-app
> 
> The result of v4l2-compliance on QCS8300:
> v4l2-compliance 1.31.0-5378, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 2ed8da243dd1 2025-06-30 08:18:40
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.17.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Encoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video1 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 43 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>          test read/write: OK (Not Supported)
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, CREATE_BUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
> Changes in v5:
> - Move crop_offset modification to 2nd patch.(Dikshita)
> - Fix missing braces.(Dikshita)
> - Link to v4: https://lore.kernel.org/r/20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com
> 
> Changes in v4:
> - Split 'improve alignment' and 'crop offset' into two patches.(bod)
> - Modify the comments for the enc_raw_* variables.(Vikash)
> - Link to v3: https://lore.kernel.org/r/20251104-iris_encoder_enhancements-v3-0-63b0c431b4d0@oss.qualcomm.com
> 
> Changes in v3:
> - Restore crop offset support for the input port.(Dikshita)
> - Set the output port's left and top offset directly to 0.(Dikshita)
> - fix the issue in iris_vpu_enc_line_size.(Neil Armstrong)
> - Link to v2: https://lore.kernel.org/r/20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com
> 
> Changes in v2:
> - Split 'improve alignment' and 'enable scale' into two patches.(bod)
> - HFI_PROP_RAW_RESOLUTION uses the actual YUV
>    resolution.(Vikash,Dikshita)
> - Rename enc_bitstream_* to enc_scale_*.(Dikshita)
> - Add comment for scale case.(Dikshita)
> - Make the resolution assignment into an inline function.(bod)
> - Shorten the long chain that checks whether scaling is enabled.(bod)
> - Correct the handling of rotation in crop offsets.(Dikshita)
> - Move VPSS buffer things into scale patch.(Dikshita)
> - Link to v1: https://lore.kernel.org/r/20251015092708.3703-1-wangao.wang@oss.qualcomm.com
> 
> ---
> Wangao Wang (6):
>        media: qcom: iris: Improve format alignment for encoder
>        media: qcom: iris: Improve crop_offset handling for encoder
>        media: qcom: iris: Add scale support for encoder
>        media: qcom: iris: Add rotation support for encoder
>        media: qcom: iris: Add flip support for encoder
>        media: qcom: iris: Add intra refresh support for encoder
> 
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 95 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 56 ++++++++++---
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     | 19 +++++
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 +
>   drivers/media/platform/qcom/iris/iris_instance.h   |  8 ++
>   .../platform/qcom/iris/iris_platform_common.h      |  5 ++
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 63 ++++++++++++++
>   drivers/media/platform/qcom/iris/iris_utils.c      |  6 ++
>   drivers/media/platform/qcom/iris/iris_utils.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_venc.c       | 33 +++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 60 ++++++++------
>   12 files changed, 310 insertions(+), 41 deletions(-)
> ---
> base-commit: 13863a59e410cab46d26751941980dc8f088b9b3
> change-id: 20251017-iris_encoder_enhancements-f2d1967b29f9
> 
> Best regards,
> --
> Wangao Wang <wangao.wang@oss.qualcomm.com>
> 

Please rebase

commit 29ae148fa88934bfd81af2a616816f9e22559b7c (HEAD -> 
bod-media-commiters-next-25-11-13, media-committers/next, 
media-committers/HEAD, bod-media-committers/next, 
bod-media-committers/HEAD, media-committers/next-25-11-13)
Merge: 97e8e73777ab2 e9a6fb0bcdd76
Author: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Tue Nov 11 12:44:28 2025 +0100

     Merge tag 'v6.18-rc5' into media-next

     Linux 6.18-rc5

     * tag 'v6.18-rc5': (1016 commits)
       Linux 6.18-rc5
       kbuild: Let kernel-doc.py use PYTHON3 override
       rtc: rx8025: fix incorrect register reference
       Revert "drm/nouveau: set DMA mask before creating the flush page"
       io_uring: fix regbuf vector size truncation
       compiler_types: Move unused static inline functions warning to W=2
       smb: client: validate change notify buffer before copy
       tracing/tools: Fix incorrcet short option in usage text for --threads
       drm/xe: Enforce correct user fence signaling order using
       x86/microcode/AMD: Add more known models to entry sign checking
       drm/xe: Do clean shutdown also when using flr
       drm/xe: Move declarations under conditional branch
       drm/xe/guc: Synchronize Dead CT worker with unbind
       tracing: Fix memory leaks in create_field_var()
       ring-buffer: Do not warn in ring_buffer_map_get_reader() when 
reader catches up
       tracing: tprobe-events: Fix to put tracepoint_user when disable 
the tprobe
       tracing: tprobe-events: Fix to register tracepoint correctly
       gpio: tb10x: Drop unused tb10x_set_bits() function
       drm/amd/display: Enable mst when it's detected but yet to be 
initialized
       drm/amdgpu: Fix wait after reset sequence in S3


  b4 shazam 
20251110-iris_encoder_enhancements-v5-4-1dbb19968bd5@oss.qualcomm.com
Looking up 
https://lore.kernel.org/all/20251110-iris_encoder_enhancements-v5-4-1dbb19968bd5@oss.qualcomm.com/
Grabbing thread from 
lore.kernel.org/all/20251110-iris_encoder_enhancements-v5-4-1dbb19968bd5@oss.qualcomm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 13 messages in the thread
Analyzing 36 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v5 1/6] media: qcom: iris: Improve format alignment for encoder
     + Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> (✓ 
DKIM/kernel.org)
     + Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com> 
(✓ DKIM/oss.qualcomm.com)
   ✓ [PATCH v5 2/6] media: qcom: iris: Improve crop_offset handling for 
encoder
     + Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com> 
(✓ DKIM/oss.qualcomm.com)
   ✓ [PATCH v5 3/6] media: qcom: iris: Add scale support for encoder
     + Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> (✓ 
DKIM/linaro.org)
     + Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com> 
(✓ DKIM/oss.qualcomm.com)
   ✓ [PATCH v5 4/6] media: qcom: iris: Add rotation support for encoder
   ✓ [PATCH v5 5/6] media: qcom: iris: Add flip support for encoder
   ✓ [PATCH v5 6/6] media: qcom: iris: Add intra refresh support for encoder
   ---
   ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
   ✓ Signed: DKIM/oss.qualcomm.com
---
Total patches: 6
---
Applying: media: qcom: iris: Improve format alignment for encoder
Applying: media: qcom: iris: Improve crop_offset handling for encoder
Applying: media: qcom: iris: Add scale support for encoder
Applying: media: qcom: iris: Add rotation support for encoder
Applying: media: qcom: iris: Add flip support for encoder
Applying: media: qcom: iris: Add intra refresh support for encoder
Patch failed at 0006 media: qcom: iris: Add intra refresh support for 
encoder
error: patch failed: 
drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h:108
error: drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h: patch 
does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"


