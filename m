Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3B0559C3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2019 15:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfF1NA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jun 2019 09:00:26 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37981 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfF1NAZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jun 2019 09:00:25 -0400
Received: by mail-wm1-f68.google.com with SMTP id s15so8887221wmj.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2019 06:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=phd6grQaPeAKpxGCc8e9yaooyxfgwldd6Z0yhWR1iak=;
        b=R2iSA2g3Ls9YJZ8155Z6dZbfM9TXzEMWMS8nJZVcJwAWIG+jOf2gWrQFMRlujxAKnc
         0S5hQ8sAXBaT27zBNs7azSbhGlAz2jdL9M2KvTiQyW8le+Uez+cU1fnicdQpdjaO58NN
         lE/sONL5XKDfuTFVZ4Z/jp0AIKOgvBTLhC9mDbHaoH48pLEEO7Yt+zcPQLsbusf5VEoV
         CSmt6RxIJ5w31LA1KWX+Nhw90WMLPKNkCaAcEq7VExv3/1yncVTwoGJoF9I1ibdQkf94
         gllASUZ7vkStpFWOD13XIbCzA6BvKHaavRiFg3YgbeAc6rrBbvwDLEZbvDKyVafxNQAv
         IJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=phd6grQaPeAKpxGCc8e9yaooyxfgwldd6Z0yhWR1iak=;
        b=Ng92WjfHJcCcG8u/2QUNfh0Ap7hYqlCEaka2T16pco7HWVWFzkxLBYhV+c0UJJ73YG
         H7TINaB2Gxcsxhl2OM6CQ6dDRK18uWcf/C9Cx64z7pgv/cr+UDevravZ8ADkDTsIxkxa
         iQWcWp/dkfnqFRKvqCBbUlA75h0rRqpjXDkjhrSfqdKsp5XocB99gGsTmEekP/o6CO2s
         xjAyUTBjWPnTr/0e38o+C6OBrF7ofNGu6+gzq+sG6L7gMCBq/Ichqz+QTqFsIzDjdYa7
         0bOdfgTKMI+kwpFzeCpX2iFDiEBtry8Rv1RA0gjYkmwUUXPawFwNylPqBzX2krnSHzkd
         vj8w==
X-Gm-Message-State: APjAAAXicLojAC9q/F5oGTPUuUHk4mWYxjRNz91Z9gOUNcN6vPsv6Dcn
        Wf3aTwq+mkIr32H/ijo4ZPJcyw==
X-Google-Smtp-Source: APXvYqxOm3l1AGHuh7dTn+a9WVN6btU7RpwaLearjhiH/vNsp/s0ppDemaLZPZU95gRHvk7Fa1n4mQ==
X-Received: by 2002:a1c:1a06:: with SMTP id a6mr7223207wma.128.1561726822914;
        Fri, 28 Jun 2019 06:00:22 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id w20sm3717174wra.96.2019.06.28.06.00.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 06:00:22 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 00/11] Venus stateful Codec API
Date:   Fri, 28 Jun 2019 15:59:51 +0300
Message-Id: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Here is v2 of the Venus transition to stateful codec API
compliance. The v2 can be found at [1].

Changes since v1:
 * codec_state is now enum
 * dropped IS_OUT and IS_CAP macros and use vb2_start_streaming_called()
 * corrected g_fmt and reconfig logic
 * s/vdec_dst_buffers_done/vdec_cancel_dst_buffers
 * use v4l2_m2m_ioctl_try_decoder_cmd M2M helper
 * various fixes to make v4l2-compliance pass the streaming test

To test the streaming with --stream-from-hdr v4l2-compliance option I have
to make the following hack (it is needed because the size of decoder input
buffers (OUTPUT queue) is not enough for the h264 bitstream, i.e the driver
default resolution is 64x64 but the h264 stream is 320x240):

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index c71dcf65b721..dc0fcf20d3e4 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -1294,6 +1294,11 @@ int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode)
                                        fmt.s_sizeimage(fmt.g_sizeimage(p) * 2, p);
                        }
                        fail_on_test(q.create_bufs(node, 1, &fmt));
+
+                       for (unsigned p = 0; p < fmt.g_num_planes(); p++)
+                               fmt.s_sizeimage(fmt.g_sizeimage(p) * 2, p);
+                       node->s_fmt(fmt);
+
                        fail_on_test(q.reqbufs(node, 2));
                }
                if (v4l_type_is_output(type))
 
... and with it the output of the test is:

dragonboard-410c:~/v4l-utils$ v4l2-compliance --stream-from-hdr test-25fps.h264.hdr -s250 -d /dev/video1
v4l2-compliance SHA: 08fed4d0edb1492b91d9d1054c36fed95c372eaa, 64 bits                                                                                                                                             
                                                                                                                                                                                                                   
Compliance test for qcom-venus device /dev/video1:

Driver Info:
        Driver name      : qcom-venus
        Card type        : Qualcomm Venus video decoder
        Bus info         : platform:qcom-venus
        Driver version   : 5.2.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 9 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 251 buffers   
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 251 buffers   
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for qcom-venus device /dev/video1: 49, Succeeded: 49, Failed: 0, Warnings: 0

regards,
Stan

[1] https://lore.kernel.org/lkml/0fc547f46d2ff90a2a8adf957cca7297@codeaurora.org/T/

Malathi Gottam (1):
  venus: venc: amend buffer size for bitstream plane

Stanimir Varbanov (10):
  venus: helpers: export few helper functions
  venus: hfi: add type argument to hfi flush function
  venus: hfi: export few HFI functions
  venus: hfi: return an error if session_init is already called
  venus: helpers: add three more helper functions
  venus: vdec_ctrls: get real minimum buffers for capture
  venus: vdec: allow bigger sizeimage set by clients
  venus: make decoder compliant with stateful codec API
  venus: helpers: handle correctly vbuf field
  venus: dec: populate properly timestamps and flags for capture buffers

 drivers/media/platform/qcom/venus/core.h      |  32 +-
 drivers/media/platform/qcom/venus/helpers.c   | 199 ++++++-
 drivers/media/platform/qcom/venus/helpers.h   |  12 +
 drivers/media/platform/qcom/venus/hfi.c       |  11 +-
 drivers/media/platform/qcom/venus/hfi.h       |   2 +-
 drivers/media/platform/qcom/venus/vdec.c      | 537 ++++++++++++++----
 .../media/platform/qcom/venus/vdec_ctrls.c    |   7 +-
 drivers/media/platform/qcom/venus/venc.c      |  13 +-
 8 files changed, 656 insertions(+), 157 deletions(-)

-- 
2.17.1

