Return-Path: <linux-arm-msm+bounces-97871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJaRLaXIt2kRVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:08:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81D296BA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B79553001D6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0ED383C80;
	Mon, 16 Mar 2026 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="O+hKw7Uf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1239E382287
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652131; cv=none; b=o/yD/jZHn9wEoChZX5cx0FGC7cgJmE0dCkttKBHQIYHjnv7ydICA4+GbMLynifO12n/ech6Zp6+C+NBHzAC3olHvyCltSxdhj9ekGlxyREtB+10TSHBJqPHcBxkWjKsVwSBXGX8YD9XnD3s5HJPE2mdnTTZ0zN0qvOtIcFKgnpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652131; c=relaxed/simple;
	bh=wkQX15AyJfsKKCCOWFspBnke5YAnjhGrFoyLBmhBKVQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VO2+HBAjCI8KjSVUEwIxjx1f8vAq4EbDG42eFpK2foRZZky4hNLmNgwtx+2bp+u5Slt35fE+vO82bXGK2iYmmxzl8Dn/Zz0NqfDDDh3fcvkCYp5gJAnKqFGdFmtKBcj1tEwI/DOPvGHmaVOmDn8qByRj0ByWGeUPB+DvCGKorsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=O+hKw7Uf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b976536806cso503083866b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773652128; x=1774256928; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkQ3ltXCFznTU4ceGv0LPxbwLcaDE8cpGKaOEA1BzBs=;
        b=O+hKw7UfbttFxPuXqIzH8un2VTFknZzwa2KbI3ynM8jendrg1XqKtRfVNDNKuVUQkG
         5F3zg0ijwzmt3/px5cG+SZ+KzWwG0P0KlXW2BTIK+Jc9n3L37TM2Nau10+SoMl4bqwUH
         0TxeoYu8HnFgsEkkJ0AcuRUR40gJoyozzdsZHoCADWjW0CZDJwKkYaIkeHOFyBAO4L3p
         Xl7IYlk0tq5fEtszPevVbaCqj5cMD5lDNscPWaGdRpgTepyXQUwMW8nDLwZkNDuCBm/3
         zo+Pkd2SkmTjPDXJ9LygnQy1ilVHntAsbndfDS8aIunlcbdMteMeINmtPgxPgpwQJh4V
         5SiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652128; x=1774256928;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkQ3ltXCFznTU4ceGv0LPxbwLcaDE8cpGKaOEA1BzBs=;
        b=eN0Ukj4SF2/uZxKwgvKfl9E+5oy6AVebjZNQw7NO8R9oks3i9AKXnOeePyIgzkfYO1
         6rrSuMdyPcMxtAns9RsjhvQ+GD+GkwVQZKwF/pILL1I9XKDAqyzf6hmuXGVSBMghjqZ5
         skPBWF2Zievy/jljFd+jGresxac0d2Il/Xu9TBQwhDQdrbwzjxTr6ZDsGp+aY8hNJiwJ
         bsnNhhQpNJFkMnJZxHcquXGGJmQMXGiL7jXE4oY1qSTeNxJvDqmtJvpO7SQHrUmkU1Wt
         qGu7Wk8bwVKyA1w13PG8s/Vv7oNELehmQ26njLCEOXbKYrv9U+J6rVqKkNcoXVBYhP/L
         qNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCfD06/gbY8KTTcLzGCLrCaWDS8q+qQDtIMb4bFBF+x28yQMoOkRSB7ribAJj31GWMB7Unn2zNU/w164XP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ARIQUoUm0ys/+42JvVxIaxppVS4GVkwj1w6r27/HjUoe24xP
	BgcMeXxs+CmFEoB1NeE47PRymvfv+7pru93iuhshKisqUv8Q+wL8P+8+uLeg8/Ka7dI=
X-Gm-Gg: ATEYQzxZLGew/eVsCKFosF5zImVv+uffDlQJ2yjhbAEEiuDM0FqNThhmQDLRH2vTuGQ
	UmvScLVW5KBvCAbMcLbjbBfGrzHmBOSxE5aHj+3887KPVtAnGr9bJBbZ4nWH7xBhNXaExYmaHRM
	vjlAuwCRVrEZL94tLAz9m7TjVFcr1/BTKRAuuesQY4iSqHIqh8T+EC1tRQTVGE6YnEQtguomLec
	qBQZpKc5UQqNdNLLyhaD975p17b75g9+3YmrzOOMZLF849KEP5lzQKNefBPjm19BYYIC8tjh3Sn
	KFlCxVtozXN97IlI00f3K4n/cQfDG2ZEJgMTdL1hQSlYi1dEk4heBBGsdyYCY50BEO9zOcV33Fo
	x07Ma1EwAPIU2uCJmbsX5uERftB4fILUox/4WI1k5+w/1hem4esRuRV9XI/dLUHL7e2Y+EHCZk+
	DgmHsOA7m0E0uYc5ZqPUnn5bpt+dF3CjdtQZO9Qlc3AQISyigDv4DLMaCRrYLlABp6vMlb
X-Received: by 2002:a17:907:3d4c:b0:b87:b0ba:5d2d with SMTP id a640c23a62f3a-b9765410045mr711976966b.57.1773652128251;
        Mon, 16 Mar 2026 02:08:48 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97afca45c3sm229016866b.13.2026.03.16.02.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 10:08:47 +0100
Message-Id: <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
Cc: "Mahadevan P" <mahadevan.p@oss.qualcomm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Krishna Manikandan"
 <quic_mkrishn@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
 <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
 <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>
In-Reply-To: <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97871-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,fairphone.com:dkim,fairphone.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C81D296BA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On Fri Mar 13, 2026 at 6:14 PM CET, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 09:33:18AM +0100, Luca Weiss wrote:
>> Hi Mahadevan,
>>=20
>> On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
>> > On SC7280 targets, display modes with a width greater than the
>> > max_mixer_width (2400) are rejected during mode validation when
>> > merge3d is disabled. This limitation exists because, without a
>> > 3D merge block, two layer mixers cannot be combined(non-DSC interface)=
,
>> > preventing large layers from being split across mixers. As a result,
>> > higher resolution modes cannot be supported.
>> >
>> > Enable merge3d support on SC7280 to allow combining streams from
>> > two layer mixers into a single non-DSC interface. This capability
>> > removes the width restriction and enables buffer sizes beyond the
>> > 2400-pixel limit.
>> >
>> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for S=
C7280 target")
>> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>=20
>> This patch is causing display regression on QCM6490 fairphone-fp5.
>>=20
>> With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on the
>> screen. When reverting this patch everything becomes working again.
>>=20
>> See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux=
/-/issues/41
>>=20
>> @Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
>> quickly?
>
> Could you please provide the resource allocation parts of
> debugfs/dri/0/state for both working and non-working cases?

Working (patch reverted)

# cat /sys/kernel/debug/dri/1/state
plane[44]: plane-0
        crtc=3Dcrtc-0
        fb=3D71
                allocated by =3D phoc
                refcount=3D2
                format=3DXR24 little-endian (0x34325258)
                modifier=3D0x500000000000001
                size=3D1224x2700
                layers:
                        size[0]=3D1224x2700
                        pitch[0]=3D5120
                        offset[0]=3D0
                        obj[0]:
                                name=3D0
                                refcount=3D6
                                start=3D00103729
                                size=3D14680064
                                imported=3Dno
        crtc-pos=3D1224x2700+0+0
        src-pos=3D1224.000000x2700.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D1
        sspp[0]=3Dsspp_0
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D1224x2700+0+0
        dst[0]=3D1224x2700+0+0
plane[50]: plane-1
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D0
        sspp[0]=3Dsspp_8
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
plane[56]: plane-2
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D0
        sspp[0]=3Dsspp_9
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
plane[62]: plane-3
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D0
        sspp[0]=3Dsspp_10
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
crtc[68]: crtc-0
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
        mode: "1224x2700": 90 311156 1224 1256 1264 1272 2700 2708 2710 271=
8 0x48 0x0
        lm[0]=3D2
        ctl[0]=3D0
crtc[69]: crtc-1
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
connector[34]: DSI-1
        crtc=3Dcrtc-0
        self_refresh_aware=3D0
        interlace_allowed=3D0
        ycbcr_420_allowed=3D0
        max_requested_bpc=3D0
        colorspace=3DDefault
connector[36]: DP-1
        crtc=3D(null)
        self_refresh_aware=3D0
        interlace_allowed=3D0
        ycbcr_420_allowed=3D1
        max_requested_bpc=3D0
        colorspace=3DDefault
connector[39]: Writeback-1
        crtc=3D(null)
        self_refresh_aware=3D0
        interlace_allowed=3D0
        ycbcr_420_allowed=3D0
        max_requested_bpc=3D0
        colorspace=3DDefault
resource mapping:
        pingpong=3D# # 68 # - - - - - - - - -=20
        mixer=3D# - 68 # - - - -=20
        ctl=3D68 # # # - - - -=20
        dspp=3D# - - - - - - -=20
        dsc=3D68 - - - - - - -=20
        cdm=3D#=20
        sspp=3D# - - - - - - - # # # - - - - -=20
        cwb=3D- - - -=20


Broken (with the patch)

# cat /sys/kernel/debug/dri/1/state
plane[44]: plane-0
        crtc=3Dcrtc-0
        fb=3D72
                allocated by =3D phoc
                refcount=3D2
                format=3DXR24 little-endian (0x34325258)
                modifier=3D0x500000000000001
                size=3D1224x2700
                layers:
                        size[0]=3D1224x2700
                        pitch[0]=3D5120
                        offset[0]=3D0
                        obj[0]:
                                name=3D0
                                refcount=3D6
                                start=3D00103729
                                size=3D14680064
                                imported=3Dno
        crtc-pos=3D1224x2700+0+0
        src-pos=3D1224.000000x2700.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D1
        sspp[0]=3Dsspp_0
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D1224x2700+0+0
        dst[0]=3D1224x2700+0+0
plane[50]: plane-1
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D0
        sspp[0]=3Dsspp_8
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
plane[56]: plane-2
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D0
        sspp[0]=3Dsspp_9
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
plane[62]: plane-3
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
        color_mgmt_changed=3D0
        color-pipeline=3D0
        stage=3D0
        sspp[0]=3Dsspp_10
        multirect_mode[0]=3Dnone
        multirect_index[0]=3Dsolo
        src[0]=3D0x0+0+0
        dst[0]=3D0x0+0+0
crtc[68]: crtc-0
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
        mode: "1224x2700": 90 311156 1224 1256 1264 1272 2700 2708 2710 271=
8 0x48 0x0
        lm[0]=3D2
        ctl[0]=3D0
        lm[1]=3D3
        ctl[1]=3D0
crtc[69]: crtc-1
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
connector[34]: DSI-1
        crtc=3Dcrtc-0
        self_refresh_aware=3D0
        interlace_allowed=3D0
        ycbcr_420_allowed=3D0
        max_requested_bpc=3D0
        colorspace=3DDefault
connector[36]: DP-1
        crtc=3D(null)
        self_refresh_aware=3D0
        interlace_allowed=3D0
        ycbcr_420_allowed=3D1
        max_requested_bpc=3D0
        colorspace=3DDefault
connector[39]: Writeback-1
        crtc=3D(null)
        self_refresh_aware=3D0
        interlace_allowed=3D0
        ycbcr_420_allowed=3D0
        max_requested_bpc=3D0
        colorspace=3DDefault
resource mapping:
        pingpong=3D# # 68 68 - - - - - - - - -=20
        mixer=3D# - 68 68 - - - -=20
        ctl=3D68 # # # - - - -=20
        dspp=3D# - - - - - - -=20
        dsc=3D68 - - - - - - -=20
        cdm=3D#=20
        sspp=3D# - - - - - - - # # # - - - - -=20
        cwb=3D- - - -=20


