Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC9A7CF966
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 14:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345704AbjJSMwg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 08:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345513AbjJSMwf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 08:52:35 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D92F7;
        Thu, 19 Oct 2023 05:52:32 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 96A7E660732D;
        Thu, 19 Oct 2023 13:52:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1697719951;
        bh=Abzjk6a8uejkrxQwKZXIm4Vvmm8k6nlRAqg0GllSd3Y=;
        h=From:To:Cc:Subject:Date:From;
        b=Eo1OmeQnbdwU6/tOtFY05Q0m/TTLTDTPiokkflhGYso7ef3WRvMPp76G+DuoY+fwV
         WbIXS+H8aa3QQDyzGEQBvMKB7assR/+wz2kzA0sUYM6bQOSQdW2SHgxaXd7LE7NUs6
         qbv75nhxbXAD0EfctS0QPbFaWflIMKPugvWqTW8fYewV4nY2c2gFL3LhuM5rKS5b3O
         RUi0QHXRlttqwlhaC3TQb7mvcZMnagj0ITcCe1vuFofQ6OHohKO7DBr6ji9PZDf/Ls
         4kaffhI75QfXTqNcv1iGjkNT/5/4jUP2q3tEhU0QyFyN05FdygK0GP55AHi0nybqw7
         mmpa3ZDkFG5Bg==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v13 00/56] Add DELETE_BUF ioctl
Date:   Thu, 19 Oct 2023 14:51:26 +0200
Message-Id: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Unlike when resolution change on keyframes, dynamic resolution change
on inter frames doesn't allow to do a stream off/on sequence because
it is need to keep all previous references alive to decode inter frames.
This constraint have two main problems:
- more memory consumption.
- more buffers in use.
To solve these issue this series introduce DELETE_BUFS ioctl and remove
the 32 buffers limit per queue.

VP9 conformance tests using fluster give a score of 210/305.
The 20 resize inter tests (vp90-2-21-resize_inter_* files) are ok
but require to use postprocessor.

Kernel branch is available here:
https://gitlab.collabora.com/benjamin.gaignard/for-upstream/-/commits/remove_vb2_queue_limit_v13

GStreamer branch to use DELETE_BUF ioctl and testing dynamic resolution
change is here:
https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/commits/VP9_drc

changes in version 13:
- Fix typo and wording in commits messages.
- Only apply V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS on createbufs ioctl
- Fix queue setup test in test-drivers

changes in version 12:
- Change flag name to V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS.
- Rework some commits message.
- Change vb2_queue_or_prepare_buf() prototype.
- Rework patches where 'min_buffers_needed' was badly used.

changes in version 11:
- Patches ordering:
  1 to 3: clean up
  3 to 42: use vb2_get_buffer() and vb2_get_num_buffers()
  43 to 46: allow to use more than 32 buffers per queue
  47 to 50: allow verisilicon driver to do VP9 dynamic resolution change
            (which was the main purpose of this work)
  51 to 56: prepare and introduce delete buffers feature.
- Add a patch to rename 'off' to offset.
- Add maintainers CC to drivers patches

changes in version 10:
- Make BUFFER_INDEX_MASK definition more readable
- Rebase on media_stage/master branch and add a patch for nuvoton
  driver.
- Fix issue on patch 13

changes in version 9:
- BUFFER_INDEX_MASK now depends on PAGE_SHIFT value to match
  architectures requirements.
- Correctly initialize max_num_buffers in vb2_core_queue_init()
- run 'test-media -kmemleak mc' on top of the series and on patches 1 to 47 without failures.
- fix compilation issue in patch 50



 
Benjamin Gaignard (56):
  media: videobuf2: Rename offset parameter
  media: videobuf2: Rework offset 'cookie' encoding pattern
  media: videobuf2: Stop spamming kernel log with all queue counter
  media: videobuf2: Use vb2_buffer instead of index
  media: videobuf2: Access vb2_queue bufs array through helper functions
  media: videobuf2: Remove duplicated index vs q->num_buffers check
  media: videobuf2: Add helper to get queue number of buffers
  media: videobuf2: Use vb2_get_num_buffers() helper
  media: amphion: Use vb2_get_buffer() instead of directly access to
    buffers array
  media: amphion: Stop direct calls to queue num_buffers field
  media: mediatek: jpeg: Use vb2_get_buffer() instead of directly access
    to buffers array
  media: mediatek: vdec: Remove useless loop
  media: mediatek: vcodec: Stop direct calls to queue num_buffers field
  media: sti: hva: Use vb2_get_buffer() instead of directly access to
    buffers array
  media: visl: Use vb2_get_buffer() instead of directly access to
    buffers array
  media: atomisp: Use vb2_get_buffer() instead of directly access to
    buffers array
  media: atomisp: Stop direct calls to queue num_buffers field
  media: dvb-core: Use vb2_get_buffer() instead of directly access to
    buffers array
  media: dvb-core: Do not initialize twice queue num_buffer field
  media: dvb-frontends: rtl2832: Stop direct calls to queue num_buffers
    field
  media: pci: dt3155: Remove useless check
  media: pci: tw686x: Stop direct calls to queue num_buffers field
  media: pci: cx18: Stop direct calls to queue num_buffers field
  media: pci: netup_unidvb: Stop direct calls to queue num_buffers field
  media: pci: tw68: Stop direct calls to queue num_buffers field
  media: i2c: video-i2c: Stop direct calls to queue num_buffers field
  media: coda: Stop direct calls to queue num_buffers field
  media: nxp: Stop direct calls to queue num_buffers field
  media: verisilicon: Stop direct calls to queue num_buffers field
  media: test-drivers: Stop direct calls to queue num_buffers field
  media: imx: Stop direct calls to queue num_buffers field
  media: meson: vdec: Stop direct calls to queue num_buffers field
  touchscreen: sur40: Stop direct calls to queue num_buffers field
  sample: v4l: Stop direct calls to queue num_buffers field
  media: cedrus: Stop direct calls to queue num_buffers field
  media: nuvoton: Stop direct calls to queue num_buffers field
  media: renesas: Stop direct calls to queue num_buffers field
  media: ti: Stop direct calls to queue num_buffers field
  media: usb: airspy: Stop direct calls to queue num_buffers field
  media: usb: cx231xx: Stop direct calls to queue num_buffers field
  media: usb: hackrf: Stop direct calls to queue num_buffers field
  media: usb: usbtv: Stop direct calls to queue num_buffers field
  media: videobuf2: Be more flexible on the number of queue stored
    buffers
  media: core: Report the maximum possible number of buffers for the
    queue
  media: test-drivers: vivid: Increase max supported buffers for capture
    queues
  media: test-drivers: vicodec: Increase max supported capture queue
    buffers
  media: verisilicon: Refactor postprocessor to store more buffers
  media: verisilicon: Store chroma and motion vectors offset
  media: verisilicon: g2: Use common helpers to compute chroma and mv
    offsets
  media: verisilicon: vp9: Allow to change resolution while streaming
  media: core: Rework how create_buf index returned value is computed
  media: core: Add bitmap manage bufs array entries
  media: core: Free range of buffers
  media: v4l2: Add DELETE_BUFS ioctl
  media: v4l2: Add mem2mem helpers for DELETE_BUFS ioctl
  media: test-drivers: Use helper for DELETE_BUFS ioctl

 .../userspace-api/media/v4l/user-func.rst     |   1 +
 .../media/v4l/vidioc-create-bufs.rst          |   8 +-
 .../media/v4l/vidioc-delete-bufs.rst          |  80 +++
 .../media/v4l/vidioc-reqbufs.rst              |   2 +
 drivers/input/touchscreen/sur40.c             |   5 +-
 .../media/common/videobuf2/videobuf2-core.c   | 569 +++++++++++-------
 .../media/common/videobuf2/videobuf2-v4l2.c   | 125 ++--
 drivers/media/dvb-core/dvb_vb2.c              |  17 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c     |   5 +-
 drivers/media/i2c/video-i2c.c                 |   5 +-
 drivers/media/pci/cx18/cx18-streams.c         |   5 +-
 drivers/media/pci/dt3155/dt3155.c             |   2 -
 .../pci/netup_unidvb/netup_unidvb_core.c      |   5 +-
 drivers/media/pci/tw68/tw68-video.c           |   4 +-
 drivers/media/pci/tw686x/tw686x-video.c       |   5 +-
 drivers/media/platform/amphion/vpu_dbg.c      |  30 +-
 drivers/media/platform/amphion/vpu_v4l2.c     |   4 +-
 .../media/platform/chips-media/coda-common.c  |   2 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    |   7 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |   9 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   2 +-
 drivers/media/platform/nuvoton/npcm-video.c   |   2 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |   7 +-
 drivers/media/platform/renesas/rcar_drif.c    |   5 +-
 drivers/media/platform/st/sti/hva/hva-v4l2.c  |   9 +-
 .../media/platform/ti/am437x/am437x-vpfe.c    |   5 +-
 drivers/media/platform/ti/cal/cal-video.c     |   5 +-
 .../media/platform/ti/davinci/vpif_capture.c  |   5 +-
 .../media/platform/ti/davinci/vpif_display.c  |   5 +-
 drivers/media/platform/ti/omap/omap_vout.c    |   5 +-
 drivers/media/platform/verisilicon/hantro.h   |   9 +-
 .../media/platform/verisilicon/hantro_drv.c   |   5 +-
 .../media/platform/verisilicon/hantro_g2.c    |  14 +
 .../platform/verisilicon/hantro_g2_hevc_dec.c |  18 +-
 .../platform/verisilicon/hantro_g2_vp9_dec.c  |  28 +-
 .../media/platform/verisilicon/hantro_hw.h    |   7 +-
 .../platform/verisilicon/hantro_postproc.c    |  93 ++-
 .../media/platform/verisilicon/hantro_v4l2.c  |  27 +-
 .../media/test-drivers/vicodec/vicodec-core.c |   3 +
 drivers/media/test-drivers/vim2m.c            |   2 +
 .../media/test-drivers/vimc/vimc-capture.c    |   2 +
 drivers/media/test-drivers/visl/visl-dec.c    |  32 +-
 drivers/media/test-drivers/visl/visl-video.c  |   2 +
 drivers/media/test-drivers/vivid/vivid-core.c |  21 +
 .../media/test-drivers/vivid/vivid-meta-cap.c |   3 -
 .../media/test-drivers/vivid/vivid-meta-out.c |   5 +-
 .../test-drivers/vivid/vivid-touch-cap.c      |   5 +-
 .../media/test-drivers/vivid/vivid-vbi-cap.c  |   3 -
 .../media/test-drivers/vivid/vivid-vbi-out.c  |   3 -
 .../media/test-drivers/vivid/vivid-vid-cap.c  |   3 -
 .../media/test-drivers/vivid/vivid-vid-out.c  |   5 +-
 drivers/media/usb/airspy/airspy.c             |   5 +-
 drivers/media/usb/cx231xx/cx231xx-417.c       |   5 +-
 drivers/media/usb/cx231xx/cx231xx-video.c     |   5 +-
 drivers/media/usb/hackrf/hackrf.c             |   5 +-
 drivers/media/usb/usbtv/usbtv-video.c         |   5 +-
 drivers/media/v4l2-core/v4l2-dev.c            |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  21 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c        |  20 +
 .../staging/media/atomisp/pci/atomisp_ioctl.c |   4 +-
 drivers/staging/media/imx/imx-media-capture.c |   7 +-
 drivers/staging/media/meson/vdec/vdec.c       |  13 +-
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |   9 +-
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |   9 +-
 include/media/v4l2-ioctl.h                    |   4 +
 include/media/v4l2-mem2mem.h                  |  12 +
 include/media/videobuf2-core.h                |  65 +-
 include/media/videobuf2-v4l2.h                |  13 +
 include/uapi/linux/videodev2.h                |  24 +-
 samples/v4l/v4l2-pci-skeleton.c               |   5 +-
 70 files changed, 990 insertions(+), 472 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst

-- 
2.39.2

