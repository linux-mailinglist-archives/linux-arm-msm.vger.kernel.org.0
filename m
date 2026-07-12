Return-Path: <linux-arm-msm+bounces-118565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6cUaAdGNU2pXbwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 14:51:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B87C744BBF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 14:51:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=R13fC5dr;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118565-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118565-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D6F9303CD15
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8263ABD91;
	Sun, 12 Jul 2026 12:47:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FFA3909A9
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 12:47:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783860469; cv=pass; b=F4bBNDyx81lMQmwAwmruRhqlPR+RIwo62ZwFk1YQ1r1vVx2KrUR5wZn8um5O91vjKsh6L2qdH4yyC+oMn2wHVtSJaEcOqBiJbyIAqlV4Ak782tPoZKE3270d3kTQOZoJDGRPzU7zFLIh8fnLmPGMkPEGp6fIRW02WXnER3LD54I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783860469; c=relaxed/simple;
	bh=/LEF2M9kzjY+ngIjzl7wqT7Ew/V9YEjs6Sa+fgSqmsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffW9gUPeeD0J2HDBb6rygrx9aP2VDsvdSzfk11GKVR0SHsKica47+eGDnY+c0OIW4dVey8Twk7W5i4NLIBo56yj+myj2dsw+AROtAx2EzqZ4Jt54OyzjieUIH9a/MvAnl0V9/a1MhrpiVIn4RC07jji15jfbrx92fkmVk0pCVpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=R13fC5dr; arc=pass smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc97653887so25747365ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 05:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783860467; cv=none;
        d=google.com; s=arc-20260327;
        b=KCEOD72iEs87rKREiKyiRZCXg7uExIOVTnXE0JiZmRXyRgOae6aopWc6snZ4/vJgu3
         Tdvgk4/46ykDXeTpx3XIyBoQxb6vRi8bwbWkw/VFNRy8RozaBRl4D4RC6FqJ5XMIT6/0
         QugWE10H6NyWjt3ATT91/iPke5DPJ9E3B/7hx7zQikUktOb2Zsrc/fDG/POMtbqo82cI
         nFsAouqlSfJzDJWJrWRlDAb5qnRE7Uh/PIQAD/bbCTs1FWh5SNxzw/TMv0X/AFQuNMS5
         BPZfRcmcg2EbBzR1l1+IfQC5ntABtNZNuWdxDKjzJaCThmxlhFmozkYk0BemhPc059l8
         bCyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ikvSy5XLG1P+DmNPA6bgvTYTJm+JvB6ahXSZXySRz+4=;
        fh=LJvNw9U/JQaJ8Vmbnge22J9F1mtceXUMjawLZHC8o4c=;
        b=KJYW5+lmSVgyH5o6Qnf/lLBivFJVVqRNpi/e8R5Bs/Ayt6AFsGuIEEA7OL84m91unc
         rl3qRPUd4Lg/GiwDTSZh8jUqRJKolmd+BP9pDqoFej2Lh6vURA1UxnYwqEJ9Hl2WmHJN
         TE2yVoOvrfU6/VNawydf52KuolV80beSCq5P+qURRcAavSMf9jcW/5VsHIG0i0Es2yRR
         KnI2TkP/QR4UaB9jwNhI2ktN7BRtVGL478iVj0AwjEg6YgXinYpxpb9eUfGzT1eqLCq6
         VwEyIwVHqedLewSmXt50itxBl1QONeM7Bpit37S8fRyF1rxcllSB6OAcD502kgnSxIlQ
         lLjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1783860467; x=1784465267; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikvSy5XLG1P+DmNPA6bgvTYTJm+JvB6ahXSZXySRz+4=;
        b=R13fC5drIzsay2MDN8HYbDkfzL/oXnPXZkgZsI//N3lBVZCZBkmvdrVGVV3xEIQqaV
         5MT9dFbdTLxBzD1XdLGBGoIiu6rj9l8auIF0pLGr2h+Sp5jWJ4YqteiIeLWdtv1JYt8V
         2vw1lfg/808WCo+BgP4xR8faHNSVxdU/6yrZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783860467; x=1784465267;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ikvSy5XLG1P+DmNPA6bgvTYTJm+JvB6ahXSZXySRz+4=;
        b=HjaeW8dDud58AZUZuzrzR8htEzM8IpKHC+iW/KNte8tvnpJ9VqbR+zdiBU3rBO/Txm
         Tcvzz/PeISzcRBHias05OmB48q5h87jPcwk+gHor3hmzWXNqlRB4tZzTjpBuf5KVH09g
         x9TE7sGmI5StRVRLAJIlVyixmCnP7gTSDV345InU+iq5phOSL8fXjycnV2cO0XKeEDX9
         mg3vKuO0GoLGYvdAHCFasZnovoYs1CjQLkkudWxGG75zSSTeUxIizmdkz+bXvWBi4QuS
         jZx8SopY4wHJKpAzNln3LfePL72W2XAEIsckY7bqtGbykwMnwlEpgXTyUUDgEZbKFPrw
         Q+3Q==
X-Gm-Message-State: AOJu0YwtwQIefvo65ok0bW7XPznfPQ2VN3fn4zIkyiHpkFFMMP9LvRCw
	debZtkFcJhh3vfk0ZvjrLfYzFj9q6ajeJuLQkLYKHWrl8PbX4APXHpZjhwwobGd1rzPWN0nBnFg
	oH/Y8DWuT3bnb1SxFh1i3d5tOBlW9XV4wIKbZKz+E1A==
X-Gm-Gg: AfdE7ckVgOZF+QgCI9u946efp9CpsDi2XuCwmec8M+WD8Aq/DtP4jeCU6gECodQBa+1
	OpFexQIPsUV3USCET16tBvxKb42/wcp2DqGdXy7xJuKboOzwq1cFoeTTson446UUrQtN7h/cqlC
	+FpeJ1QgaZGnmL5M21MyuQ+qPNVFjiiWyrBIovUVtnUcjgD77GlfmIV8fXLlZACRXGeARQagsVG
	tiOOvsKK7ujZCsuKua6Q6VCKsS7MGLHLjDLPDKjxNT8uovQcud7VS/ce66XKRRmlWvgqe+PZCd1
	5jt/V6hT9bBQ9QekSjtEShZkSQxwP+RTO2WkvcMvz9UJS9DjwbBuo363uTjgpSMniQ3yL3/tpfl
	68KCiCPmSQ2D+9Eg+1pHz46YlnyQBXamnR/WInkA0rED46k1AP2zjJvirIEe7+/ZiOLNUs4Hw0h
	3+/01w18/iBGKMUTjCf3mYJdPrniIt+iF/Nt/VUF3AHnNwHiCJb8oM3sPkQBrKcIaxgyq0PD8=
X-Received: by 2002:a17:903:37c4:b0:2ca:bc05:b082 with SMTP id
 d9443c01a7336-2ce9f052b73mr58124925ad.29.1783860466725; Sun, 12 Jul 2026
 05:47:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMVG2st2udHCUHZ_2j=jNmwTAVi2Cvda0qGgH4tDZHwsGVfLKQ@mail.gmail.com>
 <CAMVG2stuY5aTwfmJkL_cLDn86hfuFD+sT-LdqdmN5m21y2aL5g@mail.gmail.com> <zscjwjuqhg36vwsbt735y5gq3bcfxcfh4m46zcgpakacyoxrvf@ekji5eglhdcn>
In-Reply-To: <zscjwjuqhg36vwsbt735y5gq3bcfxcfh4m46zcgpakacyoxrvf@ekji5eglhdcn>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 12 Jul 2026 20:47:34 +0800
X-Gm-Features: AVVi8CdulQCM4FcxmDA84gLCyj97rAnjiQtbUfGcHr-szb3Uwrhdqe4fpBDVKoc
Message-ID: <CAMVG2st0i7W3S5pyZRqMufL+pfKTkv8e3sLnws0UhOpbqfXbmg@mail.gmail.com>
Subject: Re: [BUG] qcom: x1: GAMMA_LUT corruption on DPMS wake
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jun Nie <jun.nie@linaro.org>, Federico Amedeo Izzo <federico@izzo.pro>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Randy Dunlap <rdunlap@infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>, 
	Val Packett <val@packett.cool>, Steev Klimaszewski <threeway@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jun.nie@linaro.org,m:federico@izzo.pro,m:neil.armstrong@linaro.org,m:thomas.weissschuh@linutronix.de,m:rdunlap@infradead.org,m:linux-kernel@vger.kernel.org,m:val@packett.cool,m:threeway@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[quora.org];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118565-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,lists.freedesktop.org,ffwll.ch,linaro.org,izzo.pro,linutronix.de,infradead.org,packett.cool];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,mail.gmail.com:mid,vger.kernel.org:from_smtp,quora.org:from_mime,quora.org:email,quora.org:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B87C744BBF

On Sun, 12 Jul 2026 at 19:56, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Jun 14, 2026 at 06:27:50PM +0800, Daniel J Blueman wrote:
> > On Mon, 1 Jun 2026 at 13:37, Daniel J Blueman <daniel@quora.org> wrote:
> > > Since Adreno X1-85 GAMMA_LUT support was introduced in Linux v7.0 (eg
> > > Ubuntu 26.04), when waking from DPMS-off, palette corruption is
> > > frequently seen; this manifests as purple banding. If GNOME night
> > > light or similar is enabled, the visual impact is greater.
> > >
> > > Further, on larger panel monitors or laptops eg the Lenovo Yoga Slim
> > > 7x (2944x1840), a second INT2 block is used for the right half of the
> > > screen, which may remain totally blank on wake; major usability
> > > impact.
> > >
> > > Intuitively, the symptoms feel like the LUT SRAM clock isn't being
> > > driven soon enough during the wakeup, thus state loss may depend on
> > > silicon binning/variation or related. No such symptom is seen in
> > > Windows on the same hardware. I found a workaround supporting this
> > > mechanism is to activate the GNOME night light and adjust the slider
> > > to update the LUT - any black right half of the screen always
> > > reappears.
> > >
> > > Please can someone with X1-85 Adreno insight check the Linux clock and
> > > power domain behaviour around GC_EN, Layer Mixer, INTerFace and INT2
> > > on DPMS wake? Happy to test changes; this is a stunning platform
> > > otherwise.
> > ...
> > > Link: https://gitlab.freedesktop.org/drm/msm/-/work_items/89
> >
> > Just a heads-up on this with additional findings. Note this issue
> > could be the only remaining daily friction on X1 laptops with suspend,
> > once my video decode reboot workaround or similar is merged. Also note
> > in my case, without GNOME night light active, only a few LUT entries
> > render purple so visual artifacts often go unnoticed until a gradient
> > eg in an image is visible.
>
> Could you please check if increasing reg_bus_bw in msm_mdss.c would fix
> the issue? It's not a proper fix yet, but it might help me to understand
> the issue.

Adjusting like so [1] didn't resolve the issue, however it was worth
ruling out. Perhaps you could check with the Windows driver team why
the DMA descriptor approach was used for LUT setup?

> > From DPMS wake on a dual-LM panel (>2560 pixels wide) with
> > INTF_5/DSPP_0 (master) and INTF_6/DSPP_1, I find DSPP_1's registers
> > are intermittently unresponsive just after MDSS resume. DSPP_0 doesn't
> > exhibit this issue, suggesting some missing slave/second unit setup,
> > despite booting clk_ignore_unused pd_ignore_unused.
> >
> > I found the extracted Windows DSDT \_SB.PEP0.G0MD F-state EXIT block
> > enables disp_cc_mdss_rscc_ahb_clk and disp_cc_mdss_rscc_vsync_clk;
> > could this relate? RSCC being the RPMh bridge subblock. Also, could
> > any of the *1_CLK or MDSS_INT2_GDSC entries in dispcc-x1e80100.c lack
> > setup?
>
> RSCC should not affect these blocks.

Good tip on ruling this out too!

Thanks,
  Dan

-- [1]

--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -22,7 +22,7 @@

 #include <generated/mdss.xml.h>

-#define MIN_IB_BW      400000000UL /* Min ib vote 400MB */
+#define MIN_IB_BW      800000000UL /* Min ib vote 400MB */

 struct msm_mdss_data {
        u32 reg_bus_bw;
@@ -521,7 +521,7 @@ static const struct msm_mdss_data data_76k8 = {
 };

 static const struct msm_mdss_data data_153k6 = {
-       .reg_bus_bw = 153600,
+       .reg_bus_bw = 153600*16,
 };

 static const struct of_device_id mdss_dt_match[] = {
-- 
Daniel J Blueman

