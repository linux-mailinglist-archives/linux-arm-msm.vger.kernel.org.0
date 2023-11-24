Return-Path: <linux-arm-msm+bounces-1847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB717F73E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 13:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E90801C20D8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 12:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48043286A2;
	Fri, 24 Nov 2023 12:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rhRRJEoz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C83DD71
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 04:33:46 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3b844e3e817so1105220b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 04:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700829225; x=1701434025; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u+Mi6KZdaleOXeeLFy+tPLW5lDs0FVUPIzM032jyvLo=;
        b=rhRRJEozhQnC64EWTZjMo26rULV7TQEUU0WNdHkkXIDkvjWQ0Zk//0jBYuDYQCCfMG
         pVSOODFy9iRn3ziNFgR/0s5cXSSKVbl/CF85iUwaQmyZ5rBp7FUHpSW+NxlzGBA2e93f
         dd9FkfSdW2HXA+PAUu+BAJMb9z0EBlLRaOkdZSpX1pj742hhfndqqVdAEo59RNWJX91E
         TClR3r2e2x8qP+GEmiiw++J1KICAn0jqgv5cDzTV8KgQrPgL54K4Fl756abKMEpck4CI
         iFPRwBkRY1wnoKnQAvEeKy/9yGy6mEE0gyjfSv0QsSzOcq0psONuXTUz4OD6cNMo4opE
         Tvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829225; x=1701434025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+Mi6KZdaleOXeeLFy+tPLW5lDs0FVUPIzM032jyvLo=;
        b=Nf+ofq0YhmKu6qjNoNsqPxd1z31hRAoJBKhnAxDwlC5cWSZUN2NDRqrJ7VsBAfUstD
         1JI+BBWh0OanCVJg53xql2OEU6VplSO/HyjyOzhx50tPXLXHLs2JVH/Xrv2/fQXFHAIB
         0RkzXtHID1+j7W5PNoXyzKKXpSiPB/UJ21kGU3OZq7ivyVQaZBUqz12/PGNtaLtYgPy3
         KNJMNd+B0uYMJhxP+8eQZcg1/XtTcR2L3iFHAQUAAJY9g1Bo8IvToBZZ+Ev7tC9AYXFU
         ryTSrEWU/wdJUN1hUxgBoZBuhX82DGxkQjTxTVE5v1+7gpx4Fc5vq0xupeLp66AbftaL
         GPeA==
X-Gm-Message-State: AOJu0YxdQcpl0dfqcWqHPkj3eOptB4wW5918v/NRqMHM1C6YeDPv/lqt
	5MVz/7bI9M5wv1oymSdwAhLo4t+0KQTVlSv+s+EBGQ==
X-Google-Smtp-Source: AGHT+IHePhubWcSlpkQpCam8S7h8ECxff9+Tgwphv1Ehy4bBd4FY2MbEGXszV+3z0Z0IiI2fK7mb4i6avOc4hHx5dF8=
X-Received: by 2002:a05:6808:1705:b0:3b5:6421:1a6b with SMTP id
 bc5-20020a056808170500b003b564211a6bmr3140033oib.5.1700829225586; Fri, 24 Nov
 2023 04:33:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org> <8cf55d82-afb7-475a-bc0b-ec33b56340dd@linaro.org>
In-Reply-To: <8cf55d82-afb7-475a-bc0b-ec33b56340dd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Nov 2023 14:33:34 +0200
Message-ID: <CAA8EJpormPU+GVL4ZBkuiiRR-oMJB0y-rPUTW=W-FM+Hhqqw=Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] drm: simplify support for transparent DRM bridges
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Nov 2023 at 14:23, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 03/11/2023 23:03, Dmitry Baryshkov wrote:
> > Supporting DP/USB-C can result in a chain of several transparent
> > bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
> > in a different way resulted either in series of hacks or in device tree
> > not reflecting the actual hardware design. This results in drivers
> > having similar boilerplate code for such bridges.
> >
> > Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> > bridge can either be probed from the bridge->attach callback, when it is
> > too late to return -EPROBE_DEFER, or from the probe() callback, when the
> > next bridge might not yet be available, because it depends on the
> > resources provided by the probing device. Device links can not fully
> > solve this problem since there are mutual dependencies between adjancent
> > devices.
> >
> > Last, but not least, this results in the the internal knowledge of DRM
> > subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
> >
> > To solve all these issues, define a separate DRM helper, which creates
> > separate aux device just for the bridge. During probe such aux device
> > doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> > drivers to probe properly, according to the actual resource
> > dependencies. The bridge auxdevs are then probed when the next bridge
> > becomes available, sparing drivers from drm_bridge_attach() returning
> > -EPROBE_DEFER.
>
> Dmitry,
>
> Looking to give you a Tested-by: here but got the below splat.

This should be fixed by
https://gitlab.freedesktop.org/drm/msm/-/tags/drm-msm-fixes-2023-11-21

>
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/next-20231123-tcpm-fix?ref_type=heads
>
> - Boot via fastboot
> - Remove USB cable
> - Attach DisplayPort cable
> - Get some activity on the DP
> - Then this
>
> root@linaro-gnome:~# [  376.861822] xhci-hcd xhci-hcd.4.auto: xHCI Host
> Controller
> [  376.867584] xhci-hcd xhci-hcd.4.auto: new USB bus registered,
> assigned bus number 3
> [  376.875775] xhci-hcd xhci-hcd.4.auto: hcc params 0x0230ffe5 hci
> version 0x110 quirks 0x0000000000000010
> [  376.885666] xhci-hcd xhci-hcd.4.auto: irq 229, io mem 0x0a600000
> [  376.892140] xhci-hcd xhci-hcd.4.auto: xHCI Host Controller
> [  376.897951] xhci-hcd xhci-hcd.4.auto: new USB bus registered,
> assigned bus number 4
> [  376.905869] xhci-hcd xhci-hcd.4.auto: Host supports USB 3.1 Enhanced
> SuperSpeed
> [  376.914130] hub 3-0:1.0: USB hub found
> [  376.918030] hub 3-0:1.0: 1 port detected
> [  376.922417] usb usb4: We don't know the algorithms for LPM for this
> host, disabling LPM.
> [  376.931540] hub 4-0:1.0: USB hub found
> [  376.935439] hub 4-0:1.0: 1 port detected
> [  377.885638] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000060
> [  377.892927] msm_dpu ae01000.display-controller: [drm] Cannot find any
> crtc or sizes
> [  377.894724] Mem abort info:
> [  377.905504]   ESR = 0x0000000096000004
> [  377.909375]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  377.914852]   SET = 0, FnV = 0
> [  377.918005]   EA = 0, S1PTW = 0
> [  377.921250]   FSC = 0x04: level 0 translation fault
> [  377.926269] Data abort info:
> [  377.929239]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [  377.934881]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [  377.940095]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [  377.945563] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000101992000
> [  377.952441] [0000000000000060] pgd=0000000000000000, p4d=0000000000000000
> [  377.959448] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [  377.965882] Modules linked in: typec_displayport nf_tables libcrc32c
> nfnetlink q6asm_dai q6routing q6afe_clocks q6afe_dai q6asm q6adm
> snd_q6dsp_common q6afe q6core apr pdr_interfacer
> [  377.965984]  aux_bridge crct10dif_ce snd_soc_lpass_macro_common
> drm_kms_helper qnoc_sm8250 qcom_wdt icc_osm_l3 fuse drm backlight dm_mod
> ip_tables x_tables
> [  378.072201] CPU: 5 PID: 379 Comm: dp_hpd_handler Not tainted
> 6.7.0-rc2-next-20231123-00008-g812004aeedc0-dirty #30
> [  378.082817] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> [  378.088884] msm_dpu ae01000.display-controller: [drm] Cannot find any
> crtc or sizes
> [  378.089697] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
> BTYPE=--)
> [  378.089700] pc : drm_object_property_set_value+0x0/0x88 [drm]
> [  378.110607] lr : drm_dp_set_subconnector_property+0x58/0x64
> [drm_display_helper]
> [  378.118205] sp : ffff800081fbbda0
> [  378.121616] x29: ffff800081fbbda0 x28: 0000000000000000 x27:
> 0000000000000000
> [  378.128940] x26: 0000000000000000 x25: 0000000000000000 x24:
> ffff38d1ccef2880
> [  378.136264] x23: ffff38d1ccef2a10 x22: ffff38d1ccef2880 x21:
> ffff38d1ccef29f0
> [  378.143587] x20: 0000000000000000 x19: ffff38d1ccef2880 x18:
> 0000000000000000
> [  378.150911] x17: 000000040044ffff x16: ffffa79c03e1fe34 x15:
> 0000000000000000
> [  378.158235] x14: ffff38d1c5861000 x13: 00000000000003ec x12:
> 0000000000000001
> [  378.165560] x11: 071c71c71c71c71c x10: 0000000000000b00 x9 :
> ffff800081fbb9d0
> [  378.172884] x8 : ffffa79b9b4d9000 x7 : 0000000000000001 x6 :
> ffffa79b9b6d74b0
> [  378.180207] x5 : 0000000000000000 x4 : ffff38d1cb2d3800 x3 :
> ffff38d1c28e169f
> [  378.187530] x2 : 000000000000000f x1 : 0000000000000000 x0 :
> ffff38d1cb2d3840
> [  378.194853] Call trace:
> [  378.197376]  drm_object_property_set_value+0x0/0x88 [drm]
> [  378.202947]  dp_display_process_hpd_high+0xa0/0x14c [msm]
> [  378.208526]  dp_hpd_plug_handle.isra.0+0x8c/0x10c [msm]
> [  378.213918]  hpd_event_thread+0xc4/0x56c [msm]
> [  378.218508]  kthread+0x110/0x114
> [  378.221828]  ret_from_fork+0x10/0x20
> [  378.225506] Code: 128002a0 d65f03c0 d4210000 17ffffea (f9403024)
> [  378.231763] ---[ end trace 0000000000000000 ]---
> [  384.505974] msm_dpu ae01000.display-controller: [drm] Cannot find any
> crtc or sizes
> [  385.538016] msm_dpu ae01000.display-controller: [drm] Cannot find any
> crtc or sizes
> [  385.666018] msm_dpu ae01000.display-controller: [drm] Cannot find any
> crtc or sizes
>
>


-- 
With best wishes
Dmitry

