Return-Path: <linux-arm-msm+bounces-113039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +eyzEziCLmqUxwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 12:28:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C9485680D91
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 12:28:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=c5Z4WZ2C;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113039-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113039-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F04E3001023
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AC6315793;
	Sun, 14 Jun 2026 10:28:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96B5204C3B
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 10:28:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781432885; cv=pass; b=lFoSy8YkQ9Fpl6SqzFmSU/ehs8/mkvOHSOmzugDzvvSfQxNU+NOoeCo5+x47a5jtKLLrkbxz5CvKeWV9B8ucaSX8BzmwANb4p2vqDfaVYduGLQFTlaaXqhyJuURIqM+gsKd19/AZZ/4Q85qjORaJDCQb4VtIQImI/Nok+oMZl/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781432885; c=relaxed/simple;
	bh=yph45RDO36+XI5xBpmVSQXCA/NwDLnfli0nBiTjgmrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xnt+S0tWT4nixQjWzZemw7ub3y8uEjFhigHU+CB6r0WQ3SAUddLJh/2x3SxBpljCqX+tgRidRjI1xpu2g/ttZZU4PQc7oLnEwrpUs5RGbe6vI79nqSNr+jZGuY910YnXsEqh3QzEfxLWT7/ChxlBS4xU96PbMQoW2hdwSjYx6YU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=c5Z4WZ2C; arc=pass smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf2247e38eso22544645ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 03:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781432883; cv=none;
        d=google.com; s=arc-20240605;
        b=Qk/SA4auG5ywyWMqcc7tu5rfebi74X2WLIy8PgjQ3VCeYnBWkU9rZTnjkaq1A2R0fp
         FvmddrUlvpG68AowPobMva8WxdjyQngcBbOi2kH5mpRkT1YVKFUSGS8rSmmOfh3ZkcE4
         jtYYbxj3CW0xHbqMs7GwziWJNhgLp4DK8qjoDCNh/b5cYgwm7FBChVbKHK63y9ovKIzL
         ylrs8CNAnvP/iQma+RXaZUaN/4rY4bx3WzqlzeFtYLysYpcNxwhJu85sxDWiC1BfpA3y
         Q4nkYcPSQD0WwLTLEZJD9cDWz+SH5kGioZAvQSZ5E9aD7XUVBJp1eAb0ii5OtlBIOp4o
         +36A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yzePJ3jQDgqzUoVchbve1mIf57FTjpX6L66SunK2+KA=;
        fh=nOpJFO3UH0AP7QcE01J/9AOmv9ENVcLMoc68zxVd4Ek=;
        b=HUKeqHSQDEKDzAYCI0S725K0pGSJUGl0kHlgEyvsBD6lUSzhNCGEYrWXqm75Zs8ypY
         5gwBtmqb8l/EQb0i1pVQLCHy1CG7+cVI1rZboDPzU2D2doA9WFqercrKmYF3fPgNqz45
         +tNMO9uL2WS5cdy0sJxJ43ELPkVPLyknd6Yoh7nYO3fsC61OFAGb7TY3VFmvKiHyaEjH
         p+1uguuB3ftIm1dtYnuXu5KWQBfywp93kD/t+uEITLBPwjbC1KCCQHiqcmLGi8E4ELpD
         42LE4zySbP7fHV5vC4F76cMasc7S3VBmSY7yFCPGllS9uTDjt8CoG51DYRKSt62j3PBA
         RA/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1781432883; x=1782037683; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yzePJ3jQDgqzUoVchbve1mIf57FTjpX6L66SunK2+KA=;
        b=c5Z4WZ2CT4TgqdBvs2Yl//5cdmKUBMexaPwekJ54z6m+4Atksc9Mfr+sahCyb2o4yO
         VKjiD50NQlC8zlcCntQyw7nV7YAL6T5EFH1/+zhBPn3bjlGdeuj+T1jo5vsZmV9xPSef
         t5GFbYAfnMt8wAJT+wQz47Sls4XzWP7samsB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781432883; x=1782037683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzePJ3jQDgqzUoVchbve1mIf57FTjpX6L66SunK2+KA=;
        b=BS6Pkwr0pEX1FA998gXAk8yeBRjvsqGt2QicZlmuTllU52WjrmSIQgi2csj0k779C6
         D6qzSdJpXOwXMR7mUX+tF3KUa9JQ1FHhgYy+K9ObeCujAXMTiXphG0Mj6mYwooC8iBtB
         UDm8MABLgklFadkD08JsWVc7bSlZtYllKyyc/MbGfj+adzHtStduYR/NZqlu82Bc50A/
         dkS7GdU5B0s6i5XHS6sn6c8ekvY6xz7Z96TV62UeTBB943o/0U4GjlL6UdJ+m50MZVY/
         MeGU0JzQ35MmejfYPgzy3G2c9tc21xiU5BP/b7MtX6gbY808oj3vEOaB9NQqE2A94+lk
         KaIQ==
X-Gm-Message-State: AOJu0YykiEciY043mzKKEQTdXNsDANhn5kRnsydyXXJMtcqsyay8yiXZ
	trs6JUj43sRF2S84hTl/mcxRoD6EIn7fO7uaMCefd1AL5LpekQ6PN/lowZcNycJbgKKSCJcKOk0
	3Kq4DpCf9xGq5pw9+6EJh2r5cLPDFBNRwy8hrooh4X03YD3d2manqgSAAgA==
X-Gm-Gg: Acq92OEiK/7iDCrG0ee8e9yxEhP9EZvOlcZJDGpjYFsiFLEq1rxhIeMyU1EPW1ERihO
	wjtYNwLaVqI49wgQCpAW0cTciwMCOjw3qZz4IRoKn1XuYlmsWFSKburPhzBepu5Pv4u4dDoj8kC
	y3SKGEEV3H2E/+cS2776y/1iWrXKzYHmdnWRfN1pbYAZr6G3+UeZxYuuJN6796w8Ou/GAiG7vtc
	g5UpEI8j1vUnuKrdEFYK2Q9nVzOIEgCaVxZ0tSJKioNgwBiTAp18gIoINQqDX1NxZ5jvGOd+RVe
	2RyxerFBwW4apqa+jPQ9y/0raU29VRElZHszOVDLB4pvcEJZsBaxHhjpLWZ4UxxvJjNgHP7otrI
	zVPx9T7bRJepCJTW/rj2HKVEg8VcsVH4IVqS2E5GYI5Hc/wfhuCXTlzj/8iFNZFQUnf7oNwlpDQ
	hQbtC92gQ0T7JU3VgK/A1d6ruIAPcd5DFKbmwYgEMK8rpcFdhoWdd2P6uJDL0dP1ZGEFfkA0/Q6
	9gPoBs=
X-Received: by 2002:a17:903:1a4e:b0:2c0:c940:dc32 with SMTP id
 d9443c01a7336-2c4111b93fcmr108749535ad.16.1781432883171; Sun, 14 Jun 2026
 03:28:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMVG2st2udHCUHZ_2j=jNmwTAVi2Cvda0qGgH4tDZHwsGVfLKQ@mail.gmail.com>
In-Reply-To: <CAMVG2st2udHCUHZ_2j=jNmwTAVi2Cvda0qGgH4tDZHwsGVfLKQ@mail.gmail.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 14 Jun 2026 18:27:50 +0800
X-Gm-Features: AVVi8CdcXb4-gMPYfo_2MKrfEemE11HwTvuMlcaF21UGcMmG1gPdvrVoSsDvb1k
Message-ID: <CAMVG2stuY5aTwfmJkL_cLDn86hfuFD+sT-LdqdmN5m21y2aL5g@mail.gmail.com>
Subject: Re: [BUG] qcom: x1: GAMMA_LUT corruption on DPMS wake
To: linux-arm-msm@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jun Nie <jun.nie@linaro.org>, 
	Federico Amedeo Izzo <federico@izzo.pro>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Randy Dunlap <rdunlap@infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>, 
	Val Packett <val@packett.cool>, Steev Klimaszewski <threeway@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[quora.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jun.nie@linaro.org,m:federico@izzo.pro,m:neil.armstrong@linaro.org,m:thomas.weissschuh@linutronix.de,m:rdunlap@infradead.org,m:linux-kernel@vger.kernel.org,m:val@packett.cool,m:threeway@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113039-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[quora.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linaro.org,izzo.pro,linutronix.de,infradead.org,vger.kernel.org,packett.cool];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9485680D91

On Mon, 1 Jun 2026 at 13:37, Daniel J Blueman <daniel@quora.org> wrote:
> Since Adreno X1-85 GAMMA_LUT support was introduced in Linux v7.0 (eg
> Ubuntu 26.04), when waking from DPMS-off, palette corruption is
> frequently seen; this manifests as purple banding. If GNOME night
> light or similar is enabled, the visual impact is greater.
>
> Further, on larger panel monitors or laptops eg the Lenovo Yoga Slim
> 7x (2944x1840), a second INT2 block is used for the right half of the
> screen, which may remain totally blank on wake; major usability
> impact.
>
> Intuitively, the symptoms feel like the LUT SRAM clock isn't being
> driven soon enough during the wakeup, thus state loss may depend on
> silicon binning/variation or related. No such symptom is seen in
> Windows on the same hardware. I found a workaround supporting this
> mechanism is to activate the GNOME night light and adjust the slider
> to update the LUT - any black right half of the screen always
> reappears.
>
> Please can someone with X1-85 Adreno insight check the Linux clock and
> power domain behaviour around GC_EN, Layer Mixer, INTerFace and INT2
> on DPMS wake? Happy to test changes; this is a stunning platform
> otherwise.
...
> Link: https://gitlab.freedesktop.org/drm/msm/-/work_items/89

Just a heads-up on this with additional findings. Note this issue
could be the only remaining daily friction on X1 laptops with suspend,
once my video decode reboot workaround or similar is merged. Also note
in my case, without GNOME night light active, only a few LUT entries
render purple so visual artifacts often go unnoticed until a gradient
eg in an image is visible.

From DPMS wake on a dual-LM panel (>2560 pixels wide) with
INTF_5/DSPP_0 (master) and INTF_6/DSPP_1, I find DSPP_1's registers
are intermittently unresponsive just after MDSS resume. DSPP_0 doesn't
exhibit this issue, suggesting some missing slave/second unit setup,
despite booting clk_ignore_unused pd_ignore_unused.

I found the extracted Windows DSDT \_SB.PEP0.G0MD F-state EXIT block
enables disp_cc_mdss_rscc_ahb_clk and disp_cc_mdss_rscc_vsync_clk;
could this relate? RSCC being the RPMh bridge subblock. Also, could
any of the *1_CLK or MDSS_INT2_GDSC entries in dispcc-x1e80100.c lack
setup?

Does Qualcomm also see this readback failure [1]?

Thanks!
  Dan

-- [1]

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 23dcbe1ce1b8..xxxxxxxxxxxx 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -83,7 +83,7 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 static void dpu_setup_dspp_gc(struct dpu_hw_dspp *ctx,
         struct dpu_hw_gc_lut *gc_lut)
 {
     int i = 0;
-    u32 base, reg;
+    u32 base, reg, rb;

     if (!ctx) {
         DRM_ERROR("invalid ctx\n");
@@ -113,4 +113,8 @@ static void dpu_setup_dspp_gc(struct dpu_hw_dspp *ctx,

     reg = GC_EN | ((gc_lut->flags & PGC_8B_ROUND) ? GC_8B_ROUND_EN : 0);
     DPU_REG_WRITE(&ctx->hw, base, reg);
+
+    rb = DPU_REG_READ(&ctx->hw, base);
+    if (rb != reg)
+        pr_warn("dpu_dspp_gc: dspp %u wrote %08X but read back %08X\n",
+            ctx->idx - DSPP_0, reg, rb);
 }
-- 
Daniel J Blueman

