Return-Path: <linux-arm-msm+bounces-5416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2C8818B5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 16:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0054F286D7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 15:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148E21CAAC;
	Tue, 19 Dec 2023 15:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PvBGnf9Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E231CA80
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a233a60f8feso353492466b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 07:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1703000376; x=1703605176; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33rECMRqDeZ6LFCSYivys/cg11bX52zFIasnF3TDX6Y=;
        b=PvBGnf9ZcEgfmgxhMT3lkIit5GUYnYtqbPJqXgWXO5rn9kgwdM7TlUPmJfFgmMSfF1
         I71w+06xQUIkujEnAfT8s9kVrATUq2iOWyvEzATj6iZq1evat5Z1SZQqptDZjrtGW8x+
         /n3+PFU3MkCSPLVE4vovIOe5rayowDB2AHSu8OSDfwREC+qkuLeUAUdWUsl08XWH4zlM
         aEVXZYHG8jYxH7IYpo74bIiPqpSSPgVvA/lnL5WBFu35N00KAv+V7sFhIN3lwAmfVxJK
         JwxmcOjbZlTpd4NXVtyZ+qzCKmz+UAKzrPqeTmWfBftgE6tEuafp4IR+lUrICUTKDz0o
         D+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703000376; x=1703605176;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=33rECMRqDeZ6LFCSYivys/cg11bX52zFIasnF3TDX6Y=;
        b=wvI2pX8/wwWaQpLnA9ola9E3A+hWLnC8wbgxPP21heBWnCOvHn/3mAwvxRkj611zQr
         l1UDA2361PTbIKlCzy5IkJmqBRb4Reoin9dhiHzTYmhEMlEMRf48NyNclfHlQ7Z8epd6
         wkDng3B1Q/q/ivP2UBZNODwhaJaVb2XgMweMfp3gL8zHGGfeJiVtb+D6okMP7PwmD8jC
         wTQm6JvZyomKsbYrkJtMkOt5ifBt4Fun1EmYVduixhtblLGvnmzclItbm7L5zZ8kcTsj
         dmESUpttUS78KFpKQBEt1ZJlmHLfgLKH5+cSdXulXOed83SLJq5XBalLgaE4kqIzCDZr
         eLQA==
X-Gm-Message-State: AOJu0YwBtt2muYb4X2M52U5KE3cQxlcltj/ScrYqb1G/gN381ej5i8lR
	1HsMPBp4zWwoa2pLA3PPVUEJgA==
X-Google-Smtp-Source: AGHT+IGRCCZ9M/tSiYLOOr44KOGM/Syqm1u08LfUdX2y/9Lq3TeklhrujtRQ7TfnC0nSCK0Pum82lQ==
X-Received: by 2002:a17:907:b59c:b0:a23:699a:8421 with SMTP id qx28-20020a170907b59c00b00a23699a8421mr1234208ejc.147.1703000376206;
        Tue, 19 Dec 2023 07:39:36 -0800 (PST)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id my44-20020a1709065a6c00b00a2471bb0d11sm775510ejc.31.2023.12.19.07.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 07:39:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 Dec 2023 16:39:34 +0100
Message-Id: <CXSF8ZPWKRD9.9CMJU31KG4KP@fairphone.com>
Cc: "Stephen Boyd" <swboyd@chromium.org>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Bjorn Andersson"
 <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [RFT PATCH v2 4/4] drm/msm/dpu: enable writeback on SM6350
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Rob Clark"
 <robdclark@gmail.com>, "Sean Paul" <sean@poorly.run>, "Abhinav Kumar"
 <quic_abhinavk@quicinc.com>, "Marijn Suijten"
 <marijn.suijten@somainline.org>
X-Mailer: aerc 0.15.2
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
 <20231203003203.1293087-5-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231203003203.1293087-5-dmitry.baryshkov@linaro.org>

On Sun Dec 3, 2023 at 1:32 AM CET, Dmitry Baryshkov wrote:
> Enable WB2 hardware block, enabling writeback support on this platform.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Dmitry,

I've tried this on sm7225-fairphone-fp4 but having trouble testing this.

I guess I'm using some ID wrong with modetest, could you check and see
what I do wrong?

libdrm is on version 2.4.118 from Alpine Linux/postmarketOS, kernel is
v6.7.0-rc6 plus a few patches for hardware enablement (like display).

See log:

fairphone-fp4:~$ sudo modetest -ac
trying to open device 'i915'...failed
trying to open device 'amdgpu'...failed
trying to open device 'radeon'...failed
trying to open device 'nouveau'...failed
trying to open device 'vmwgfx'...failed
trying to open device 'omapdrm'...failed
trying to open device 'exynos'...failed
trying to open device 'tilcdc'...failed
trying to open device 'msm'...done
Connectors:
id      encoder status          name            size (mm)       modes   enc=
oders
32      31      connected       DSI-1           65x115          1       31
  modes:
        index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot
  #0 1080x2340 60.00 1080 1108 1116 1124 2340 2367 2372 2377 160304 flags: =
; type: preferred, driver
  props:
        1 EDID:
                flags: immutable blob
                blobs:

                value:
        2 DPMS:
                flags: enum
                enums: On=3D0 Standby=3D1 Suspend=3D2 Off=3D3
                value: 0
        5 link-status:
                flags: enum
                enums: Good=3D0 Bad=3D1
                value: 0
        6 non-desktop:
                flags: immutable range
                values: 0 1
                value: 0
        4 TILE:
                flags: immutable blob
                blobs:

                value:
        20 CRTC_ID:
                flags: object
                value: 63
38      0       unknown Writeback-1     0x0             0       33
  props:
        2 DPMS:
                flags: enum
                enums: On=3D0 Standby=3D1 Suspend=3D2 Off=3D3
                value: 0
        5 link-status:
                flags: enum
                enums: Good=3D0 Bad=3D1
                value: 0
        6 non-desktop:
                flags: immutable range
                values: 0 1
                value: 0
        4 TILE:
                flags: immutable blob
                blobs:

                value:
        20 CRTC_ID:
                flags: object
                value: 0
        36 WRITEBACK_OUT_FENCE_PTR:
                flags: range
                values: 0 18446744073709551615
                value: 0
        34 WRITEBACK_FB_ID:
                flags: object
                value: 0
        35 WRITEBACK_PIXEL_FORMATS:
                flags: immutable blob
                blobs:

                value:
                        52473136424731365247323441523234
                        52413234414232345852323452583234
                        58423234415231355241313558523135
                        52583135415231325241313252583132
                        58523132424731364247323441423234
                        42413234425832345842323441423135
                        42413135584231354258313541423132
                        424131324258313258423132



fairphone-fp4:~$ sudo cat /sys/kernel/debug/dri/0/state
plane[39]: plane-0
        crtc=3Dcrtc-0
        fb=3D66
                allocated by =3D phoc
                refcount=3D2
                format=3DXR24 little-endian (0x34325258)
                modifier=3D0x500000000000001
                size=3D1080x2340
                layers:
                        size[0]=3D1080x2340
                        pitch[0]=3D4352
                        offset[0]=3D0
                        obj[0]:
                                name=3D0
                                refcount=3D3
                                start=3D00101fec
                                size=3D10485760
                                imported=3Dno
        crtc-pos=3D1080x2340+0+0
        src-pos=3D1080.000000x2340.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        stage=3D1
        sspp[0]=3Dsspp_0
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D1080x2340+0+0
        dst[0]=3D1080x2340+0+0
plane[45]: plane-1
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        stage=3D0
        sspp[0]=3Dsspp_8
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
plane[51]: plane-2
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        stage=3D0
        sspp[0]=3Dsspp_9
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
plane[57]: plane-3
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        stage=3D0
        sspp[0]=3Dsspp_10
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
crtc[63]: crtc-0
        enable=3D1
        active=3D1
        self_refresh_active=3D0
        planes_changed=3D1
        mode_changed=3D0
        active_changed=3D0
        connectors_changed=3D0
        color_mgmt_changed=3D0
        plane_mask=3D1
        connector_mask=3D1
        encoder_mask=3D1
        mode: "1080x2340": 60 160304 1080 1108 1116 1124 2340 2367 2372 237=
7 0x48 0x0
        lm[0]=3D0
        ctl[0]=3D0
crtc[64]: crtc-1
        enable=3D0
        active=3D0
        self_refresh_active=3D0
        planes_changed=3D0
        mode_changed=3D0
        active_changed=3D0
        connectors_changed=3D0
        color_mgmt_changed=3D0
        plane_mask=3D0
        connector_mask=3D0
        encoder_mask=3D0
        mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
connector[32]: DSI-1
        crtc=3Dcrtc-0
        self_refresh_aware=3D0
        max_requested_bpc=3D0
        colorspace=3DDefault
connector[38]: Writeback-1
        crtc=3D(null)
        self_refresh_aware=3D0
        max_requested_bpc=3D0
        colorspace=3DDefault


fairphone-fp4:~$ sudo modetest -M msm -a -s 38@64:1080x2340 -o test.d -P 45=
@64:1080x2340
failed to find mode "1080x2340" for connector 38
no mode for writeback
failed to set gamma: Permission denied
testing 1080x2340@XR24 on plane 45, crtc 64
Atomic Commit failed [1]

Regards
Luca


> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/dri=
vers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index 62db84bd15f2..3c179a73c030 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6350_mdp =3D {
>  		[DPU_CLK_CTRL_DMA0] =3D { .reg_off =3D 0x2ac, .bit_off =3D 8 },
>  		[DPU_CLK_CTRL_DMA1] =3D { .reg_off =3D 0x2b4, .bit_off =3D 8 },
>  		[DPU_CLK_CTRL_DMA2] =3D { .reg_off =3D 0x2c4, .bit_off =3D 8 },
> +		[DPU_CLK_CTRL_WB2] =3D { .reg_off =3D 0x2bc, .bit_off =3D 16 },
>  		[DPU_CLK_CTRL_REG_DMA] =3D { .reg_off =3D 0x2bc, .bit_off =3D 20 },
>  	},
>  };
> @@ -146,6 +147,21 @@ static const struct dpu_dsc_cfg sm6350_dsc[] =3D {
>  	},
>  };
> =20
> +static const struct dpu_wb_cfg sm6350_wb[] =3D {
> +	{
> +		.name =3D "wb_2", .id =3D WB_2,
> +		.base =3D 0x65000, .len =3D 0x2c8,
> +		.features =3D WB_SM8250_MASK,
> +		.format_list =3D wb2_formats,
> +		.num_formats =3D ARRAY_SIZE(wb2_formats),
> +		.clk_ctrl =3D DPU_CLK_CTRL_WB2,
> +		.xin_id =3D 6,
> +		.vbif_idx =3D VBIF_RT,
> +		.maxlinewidth =3D 1920,
> +		.intr_wb_done =3D DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> +	},
> +};
> +
>  static const struct dpu_intf_cfg sm6350_intf[] =3D {
>  	{
>  		.name =3D "intf_0", .id =3D INTF_0,
> @@ -219,6 +235,8 @@ const struct dpu_mdss_cfg dpu_sm6350_cfg =3D {
>  	.dsc =3D sm6350_dsc,
>  	.pingpong_count =3D ARRAY_SIZE(sm6350_pp),
>  	.pingpong =3D sm6350_pp,
> +	.wb_count =3D ARRAY_SIZE(sm6350_wb),
> +	.wb =3D sm6350_wb,
>  	.intf_count =3D ARRAY_SIZE(sm6350_intf),
>  	.intf =3D sm6350_intf,
>  	.vbif_count =3D ARRAY_SIZE(sdm845_vbif),


