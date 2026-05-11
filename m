Return-Path: <linux-arm-msm+bounces-106868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCIiIM+iAWpKhAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:35:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0161E50AFEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC4A230C14BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1673BF675;
	Mon, 11 May 2026 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HLWjIzUQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A6E3ACF1A
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491237; cv=none; b=I3ZQ8jF7aBrSnoDG1B8OMR7hrFWw/wcZHzam7TuOOzUqQDrUiaVGe74daFFGr7mhbFn5KL/+H0hSntJ3IQXXU1PRbXK01a2B9Wc2xd2yFq/Fasua+7uhH/d2uM6kBSYP72yLNq7XKfZysmY+jghQSzWJXt7KNeib+wvCJKMj7R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491237; c=relaxed/simple;
	bh=NAVya7voMX+3x1Ht+UwvwWzy4wJDoUjAZ0TCjW4oy0Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kYLc5NTQskvaHhHMgLlQnc8UMUdtWjsWeMPKVXvMJ7B3BnmO2Cy0w5niaQ13Ulw2sF1sVCplYjwDrF9NoSNf+eqsD++/x9+FDIs5+Xgflc0Si/I64b2kB4989kcRHPE3pSo+QcKBFsgiYJq6nt3uXyBva22dqqWlhr/M9X/Cqvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HLWjIzUQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44509921fbcso2000473f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778491231; x=1779096031; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHrIYQA7N+eY98d8hD+0B3d3jGppd38vXMR1SQbVXO8=;
        b=HLWjIzUQsR+M+DtMc66GD2/RqFc6jxwc8rTv540IPDLfKKrvwz+cVH2fvlNQcO7C1J
         Ss3Op1AiFP+bANsqtcVaWsajhtZz+4GW0adbFWag+ci02MEz/vIQd9bZA+5+lykYfWJb
         JHh3XOciyPI2KiHcxSacUy3XsZsqHPWfr/A0f4LKlIlZbOg3te808DWV7EHRZZx2u6B2
         fx3sqZet9vXnMvkOuGVr1Xqf1wY35ADpEZE17GKmQZ/jdzRIQXdsXBDFT0Hrn9M+axqA
         6FyPdCHe/30Q96x2RJpsf1roBdccwyVO4eWPeVMCknBqiiYuuX4tZIBtHuagwuZ5k7wC
         IG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491231; x=1779096031;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHrIYQA7N+eY98d8hD+0B3d3jGppd38vXMR1SQbVXO8=;
        b=lIQIdQxawRJ0WckjoETKZLaL0Y3qW1k0f/SIpmWUDgEQ0IHlcip61uKPwCFVCdRyQk
         cxbHsVBgaQoOGxp3KTC90B0DE3FPIQUm4nkhKHyBilj178Jzsh/wFtafBJfuspu7qXa7
         +eTOz6QkecWXKtBwDAcQqJlPgk/lapGMfskVt/ZrfI2h14eKdwI0FnQ6VBcF/dI7oAnT
         X7fudGjLYydpk+icfGoG4I7gngyZdZUT0X7sFYPprR8ebQ9GjB2p7r28WBX7MdFkHxKp
         WgKsvIuDJaZ9QYnKpnri5TYP+HFUEKULUz7DbJJ1tyySIiAWtbmwGdGVpPk/XMXGtX2P
         gi4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/PWuD6tgNa9W7iuXAdAAMyy2679Fxxuj0bmLSXjw+RpJuUCXI+HPuOffeadu+jQwPvWFhAkWa9p0oPGkVK@vger.kernel.org
X-Gm-Message-State: AOJu0YyZDD+H+q5M8s0TCJTeIyFTo/xMACcgwlNu8XBElAlVDV94Xtt1
	5A768IB2YTaH+q7nf2aRNTYT4u6cdAUzNXHmd07iqh5K9Ccmzfy+aVoKOQr4x2/NVs0Y8sCkWxL
	KdvXmeOs=
X-Gm-Gg: Acq92OFacPPjwJqitXGccvBk3bSC6C7Qui1UtBqdeesMyvfbLv/o9GVguEnI/iL1IOz
	PsOl+UzJY1FF+DOZ8DgYC+T4Lnqj/sZIbOW8A1fBMXHZdyRtuxRfRnRxbJXRZAKWVLxMnw3Yh7C
	4gdWw6ej1NaFlG0u5a9gbe9gkUCCyA9Dq5A22kupYKF+KvNwfT+7H6bOwFNvM4fZkp6+LUEHCXz
	yBerZ0hghiYFuuT98aJZxnUOZeRvmlFHhXip+XX5RGC1i/TTpLvvIiv0HSmpHOQeorhd6Gv6B5y
	GiHo5XHXVdZKqY4xxzIGmRqw+onM1+JqEh7km+c5SR4yI/MyIO0I6+0iHdD9vUgZYah12F+2G0J
	Z5YM8NwuCszRm3WImeKQDfOp+2uffxahYiE4j/SWJ44Q5pFIQ3Ot5GutBcEueTRTndJRY7qWyiw
	wHTxhk3tIUAA+inmKKH4S5aX4lsB0HP0JfR23N50RWy0pi
X-Received: by 2002:a05:6000:4381:b0:44f:ba97:6d8c with SMTP id ffacd0b85a97d-4515ce1c7f9mr36736033f8f.23.1778491230726;
        Mon, 11 May 2026 02:20:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120ec0asm23743240f8f.17.2026.05.11.02.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:20:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/6] media: qcom: iris: add support for decoding 10bit
 formats
Date: Mon, 11 May 2026 11:20:25 +0200
Message-Id: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFmfAWoC/5WOSw6CQBAFr2JmbZv5AAOuvIdxAU0DbZQhM0gwh
 LsLuNGdLit5qXqTCOSZgjjuJuFp4MCuXcDsdwKbvK0JuFxYaKkTGckUetcxQrinYyyBPQdQsuA
 eSkJXcluDtBGaHG1mYxSLpvNU8bglzpc3h0dxJexX77poOPTOP7cPg1p3f+QGBRIinaIi1GQqc
 7pxm3t3cL4Wa2/QH0ZlfzDqxYhZaoskzo0q4y/jPM8vfyZlcDUBAAA=
X-Change-ID: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11552;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=NAVya7voMX+3x1Ht+UwvwWzy4wJDoUjAZ0TCjW4oy0Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqAZ9a2Q1MgC2XgKtEWNV/5sxKEWnOdzL81R+3zaP+
 4tsJeT+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCagGfWgAKCRB33NvayMhJ0cptEA
 CqCqeuFn/9fgot2+/sMphdoJG1FQx3T6YbeCvl0JjHctPcNgxPIM3ijJDRl84W726j59NRRe1hbjkK
 KyiZ2brbYHvdI1HXX78+Vn1IPcQaekGVx7j0tq1s/1u9iGYPMEV/ic0ry8bQ4vtKw2a9hYfId9Pbmx
 meSCH0AhjJSOrjMwu1k0IxnFTQZ/YqGsqTFKi+MU6rr+foZTeq9qYqEbVyH4a4+/Gdz7ESWILM/V0q
 oJDad3vlOPfHXissPrirL41TRDokSSOL6+moxGElTvDByI0tUcT04QUySoy95y2FRNkFuDGI1cmFkD
 Wap6xKlzmDFVsX+tZdW1LkHGhXj0DeRSUkUWQiGbEffJa7+2j21JiW6LiESz0u9bsCvgM5mrRwXu41
 glIEqT7DwRPA03OKTzVs5tRAM+mPrG+87oA76BKjSggv9N/wWAK6eauKqPqseeeA5usJOyEhRyD6BW
 TiUgJumzbsuueDG3gK9sg6y9FzMCRipN/P3QcHnJA4RaS6PTtUkk12EDU91jRxlnzoANiir7AESpEt
 ji3NQcjIY4SCDyVtaOULWKaCknLpE9HqMxjFfVC6bawnlx45XViE4RXWSNRnFkYVikhawCTw4ewlmn
 I1vO4H11Ut+WTDtkKJjtdatCi1PuZ2yGEeIFpH0WGIgARU2GgLtDMSQ4DYrw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 0161E50AFEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106868-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:mid,linaro.org:dkim,msgid.link:url]
X-Rspamd-Action: no action

This adds the plumbing to support decoding HEVC, VP9 and AV1
streams into 10bit pixel formats, linear and compressed.

This has only been tested on SM8550 & SM8650 with HEVC, and was
inspired by Venus, DRM MSM and the downstream vidc driver for the
buffer calculations and HFI messages.

I was unable to get 10bit decoding working with ffmpeg since P010
support for v4l2 decoding is missing, but v4l2-ctl works with:
v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10

The non-10bit decoding still works as before.

With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
and tranformed in v4l2 header format with [1]:
ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v libx265 -crf 28 -x265-params profile=main10 Big_Buck_Bunny_1080_10s_30MB_main10.h265
/path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr

Fluster HEVC results on SM8650:

./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 131/147
The failing test case:
- Pixel Format mismatch
 - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
- Unsupported resolution
 - PICSIZE_A_Bossen_1 - resolution is higher than max supported
 - PICSIZE_B_Bossen_1 - resolution is higher than max supported
 - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
 - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
- CRC mismatch
 - RAP_A_docomo_6
- CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
 - VPSSPSPPS_A_MainConcept_1

v4l2-compliance results on SM8550 & SM8650:

$ v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25

Compliance test for iris_driver device /dev/video1:

Driver Info:
	Driver name      : iris_driver
	Card type        : Iris Encoder
	Bus info         : platform:aa00000.video-codec
	Driver version   : 7.0.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Encoder

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

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
	Standard Controls: 43 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	Video Capture Multiplanar: Captured 61 buffers    
	test MMAP (select, REQBUFS): OK
	Video Capture Multiplanar: Captured 61 buffers    
	test MMAP (epoll, REQBUFS): OK
	Video Capture Multiplanar: Captured 61 buffers    
	test MMAP (select, CREATE_BUFS): OK
	Video Capture Multiplanar: Captured 61 buffers    
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

$ v4l2-compliance -d /dev/video0 -s5 --stream-from=test_video_10s.h264
v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25

Compliance test for iris_driver device /dev/video0:

Driver Info:
	Driver name      : iris_driver
	Card type        : Iris Decoder
	Bus info         : platform:aa00000.video-codec
	Driver version   : 7.0.0
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
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
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
	Standard Controls: 12 Private Controls: 0

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
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
	Video Capture Multiplanar: Captured 601 buffers   
	test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
	Video Capture Multiplanar: Captured 601 buffers   
	test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
	Video Capture Multiplanar: Captured 601 buffers   
	test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
	Video Capture Multiplanar: Captured 601 buffers   
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0

[1] https://github.com/superna9999/pyv4l2compliance

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Added review tag on patch 1
- Limited stride command to AV1 decoding only
- Link to v2: https://patch.msgid.link/20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org

Changes in v2:
- Fixed bug breaking 8bit decoding
- Dropped filtering on G_FMT while waiting for soure change
- Dropped format filtering on ENUMFMT
- Switched ALIGN(x, 192) to roundup(x, 192) because ALIGN works only with Power Of Two numbers
- Cleaned and refactors the width/height/stride calculations
- Cleaned and redesigned the buffer calculations functions with proper comments and var names
- Passed fluster and v4l2-compliance to check for non regression
- Tested on SM8550
- Added missing V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 with made gstreamer fail decoding
- Link to v1: https://patch.msgid.link/20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org

---
Neil Armstrong (6):
      media: qcom: iris: add helpers for 8bit and 10bit formats
      media: qcom: iris: add QC10C & P010 buffer size calculations
      media: qcom: iris: gen2: add support for 10bit decoding
      media: qcom: iris: vdec: update size and stride calculations for 10bit formats
      media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
      media: qcom: iris: vdec: allow GEN2 decoding into 10bit format

 drivers/media/platform/qcom/iris/iris_buffer.c     | 195 ++++++++++++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  75 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  37 +++-
 drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  |   8 +-
 drivers/media/platform/qcom/iris/iris_utils.c      |  16 +-
 drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |  42 ++++-
 10 files changed, 364 insertions(+), 15 deletions(-)
---
base-commit: 76671814f2843482d97feca12e95c06f0b05bc8a
change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


