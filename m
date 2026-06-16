Return-Path: <linux-arm-msm+bounces-113481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hDW5LUi8MWp6pgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:12:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F346955F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:12:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b="O2/fSBoF";
	dkim=pass header.d=redhat.com header.s=google header.b=NXZY09Ar;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113481-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113481-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C9543225BF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6AB3A7F62;
	Tue, 16 Jun 2026 21:10:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE433A873E
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:10:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644242; cv=none; b=WmhKYqmSL8YttHX+nilaXbMT8/hfY0ruiIwAHyRMPL1hUMGMjF2yokMkKm8jYGpItsDnKV0bjF1r0LQIggHLE+TKyIUcgnReDHqMysucHg3onuWNloZvbZjXMtf1yVimZpZqVRnZJw5wrdLi2TcLKN0dHJtcvuWRmOCRu87BelQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644242; c=relaxed/simple;
	bh=J7gYEeWCxB1tJhgelNOaDUWno2W5LahEOqzwNzbFLVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sz41wSl/Zw6RLnbt8T5cHSaMCFaKlhPY/QVvKhx2TnUdtz1fl3AxA0QnRGe3oQNRQyjzl6T+/AnDW68ihZxLEDeKzVecryW0jKFG6R/iHyhtYTzQDAtqtPnT3sTNydWrvY979wwgtPNwNjRthEBygmzkS8TOfC4QlXwSk9lHQKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O2/fSBoF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXZY09Ar; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjvCrBMszrMJ2Knwf+augk31h+3piL8f3cGGXhlSVYM=;
	b=O2/fSBoFrLQJEyzyeSbFpkZ2/Am+0Sq6AYUtV588+8LrXrgz8N0udmMMHSF0EFrFTMb2rM
	LbhO5UCHJwNaBnrTM2jw7ylZlHt0Ar5hk12IGU1tjZt1PWAUkL9jwY7cm3qSa3kKrsKIZN
	bVWYc08Aj/Jd1U/b+6qKOwSBLxkFIuA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-SWYs0lDiMR-Gf0mZwIptWA-1; Tue, 16 Jun 2026 17:10:34 -0400
X-MC-Unique: SWYs0lDiMR-Gf0mZwIptWA-1
X-Mimecast-MFC-AGG-ID: SWYs0lDiMR-Gf0mZwIptWA_1781644234
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccf3d72081so84026166d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644234; x=1782249034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjvCrBMszrMJ2Knwf+augk31h+3piL8f3cGGXhlSVYM=;
        b=NXZY09ArhFvkxR0SDENgseROA8Eqk4AsZLywHukXsgk9D5MAFgCfUa4Dl8XRdjvcLe
         D/boOlC5dAzdjVsGb5Mazr1sR9g7gGD7PhbTartreyE0Pm873A0OzJjIg+n56K3haV5s
         2yrn+mwTh2NspK0oAXld44+h/2FprESQCeQldrkCKfXHhnYFOoOqV2XYcuQXy/IxHuQT
         34WnObg0mtZNc8B9hJGpIcOanf/wt22lRjUP83Ju0LEOUGilHHJbg1mS0nNGoZBcW1+3
         0zTTYsPFKm7gpzS5E5MnE1/hE5jRNU5pfOZyizsWImfBdfQxWU9ATsVPZj715G5Ta0DD
         K59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644234; x=1782249034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BjvCrBMszrMJ2Knwf+augk31h+3piL8f3cGGXhlSVYM=;
        b=kd4V/rne7rF/kzfi3ZBhW2El5jZuuSg8Ud3FVPkp+PjcyhGRRFdzM71hOy6HCAXMRv
         lE2WlDazDLLP7Mg5f2azth9QF67Bl96rDPkZh8V+W13XjBO+/Pe4+Kie9Q80iZ/lc8/f
         5ik9wpIRlaOyWSsoUbdTMTeJlEnHFKqiOBhnhTIszEtyppjxkjII1YZBg3S0w0Y88cq2
         AWchmt2c0DJOsBPhIlnxjRpKQ8a9rqrJNqHLygEzDL9jm5mJ5fFVSVyTuCgX88RZKpJH
         FU4QriwfoR+BOsU6SXu+pRcYWFpNsLLxDyp2uJhxEXyGxieeWGINcXg9eKzsho668Vo5
         vu3A==
X-Forwarded-Encrypted: i=1; AFNElJ/cU+iPXc+1eFImkR5zIs00d/yiQzpE1/lbLQbrGajETnsuj3BNXUgfawldPzl4wJ41NvDm04Wjyr6kFsIi@vger.kernel.org
X-Gm-Message-State: AOJu0YzBe7gOMun3NI6GP7JGdTPPJ1OfxbEP7juda1z8m46PSnNGep1E
	iHIjTVgbWunS+EHU787vhAj41YAzv/FjNsbQcLHQt7winwsLxpPdu/cXPClHmHtNk/hr/UcJYVT
	ZrkFLw2d4jPdI2brLW/dq3FmflmEUeTu2TZWNoWnF0CiP382fuReTzoAtrK+LWTlmgs8=
X-Gm-Gg: Acq92OGmiWtg1vkpyhfAY5zQhRolbkKr/q+V1q0ssi/B8MZzSyqbTlkPUvgfdUQEvJF
	9snUqMVN/FXCofa+qkifpw/sJDOZkG99z5By5Mv1Xhn6YXIsscaQ2XPUYBfIxavoR3iyXkyeycb
	rW/LMR7KHr3JxIT9f3RMEKAC9aoPEKyKG6u9ZyPxztsAOFwh69GtQ9eE+dwjHxuuXrBd5Ghbb51
	uGHAiqZ/KPsSJ1WrAPKUVfFpJAFRmUzeRmBu5tAkZz7ce6jPGAOsqKL1qDks/AYfHqmEaU2gyTO
	zS+5/BPRw0t044j0QFnd7WdHaQrsV3Z0FwJ/ycrtysVC3MBdIgE6C//fb/J2PHzwdLr+xBz1FoW
	ezHVFLjiJfpO1tKeW4Oc6mQc325jMm+uGw4V2dhzni1Jvkl2qrToWGT5lz1KjPw==
X-Received: by 2002:a05:6214:dc1:b0:8ca:ee3:6ea9 with SMTP id 6a1803df08f44-8db83137b85mr14865336d6.20.1781644232435;
        Tue, 16 Jun 2026 14:10:32 -0700 (PDT)
X-Received: by 2002:a05:6214:dc1:b0:8ca:ee3:6ea9 with SMTP id 6a1803df08f44-8db83137b85mr14864746d6.20.1781644231926;
        Tue, 16 Jun 2026 14:10:31 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f122b21bsm43742846d6.4.2026.06.16.14.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:10:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 16 Jun 2026 17:09:47 -0400
Subject: [PATCH v2 5/5] clk: implement sync_state support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
In-Reply-To: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8302; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=J7gYEeWCxB1tJhgelNOaDUWno2W5LahEOqzwNzbFLVk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIMd+9ZZTSpv2+qfIN0QZzpS14dZQV2jxQ77bXvuKafv
 s0R9a+po5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgImcDGRk6DvyRl26aAfTX/uf
 hovu3I5muH/KqP/qwZ0OUyK+n1+u95ORYfH/Mju+FU+ShENM+0/UxaecNVjopqhtKL/7j8c8du/
 vjAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113481-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bmasney@redhat.com,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oldschoolsolutions.biz:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33F346955F4

The existing support for disabling unused clks runs in the late initcall
stage, and it has been known for a long time that this is broken since
it runs too early in the boot up process. It doesn't work for kernel
modules, and it also doesn't work if all of the consumers haven't fully
probed yet. Folks have long recommended to boot certain platforms with
clk_ignore_unused to work around issues with disabling unused clks.

Let's go ahead and add a framework-level sync_state callback for the clk
subsystem. If a driver doesn't have a sync_state callback configured,
which is the 99+% use case today, then let's set it up to use the
clk_sync_state() introduced in this commit so that no driver changes
are needed.

At the time of this writing, there are currently only 7 clk drivers that
implement sync_state, and all are Qualcomm SoCs where they interact with
the interconnect framework via icc_sync_state(). A shared helper has
been created for this platform that calls clk_sync_state(). It is
expected that any new clk drivers that want to implement their own
sync_state will also need to call clk_sync_state() at the end of their
custom sync_state callback.

There will be several stages of disabling unused clks:

- The first phase will be executed at late_initcall and it will only
  disable unused clks that do not have a struct dev.
- The sync_state callback will be invoked for each clk driver once all
  consumers have probed.

This is based on previous attempts by Saravana Kannan and Abel Vesa
that are linked below.

This change was tested on a Thinkpad x13s laptop.

    [    0.308051] clk: Disabling unused clocks not associated with a device
    [    6.541069] qcom_aoss_qmp c300000.power-management: clk: Disabling unused clocks
    [    6.843310] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unused clocks
    [    7.604556] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unused clocks
    [    8.446161] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unused clocks
    [    8.446293] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unused clocks
    [    8.546067] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unused clocks
    [    8.546203] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unused clocks
    [    8.546254] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
    [   15.436834] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling unused clocks
    [   15.436953] clk-rpmh 18200000.rsc:clock-controller: clk: Disabling unused clocks
    [   15.723348] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unused clocks
    [   21.063241] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk: Disabling unused clocks
    [   21.081996] va_macro 3370000.codec: clk: Disabling unused clocks
    [   21.092740] rx_macro 3200000.rxmacro: clk: Disabling unused clocks
    [   21.118261] wsa_macro 3240000.codec: clk: Disabling unused clocks
    [   21.128758] tx_macro 3220000.txmacro: clk: Disabling unused clocks

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Brian Masney <bmasney@redhat.com>
Link: https://www.youtube.com/watch?v=tXYzM8yLIQA
Link: https://lore.kernel.org/all/20210407034456.516204-1-saravanak@google.com/
Link: https://lore.kernel.org/all/20221227204528.1899863-1-abel.vesa@linaro.org/
---
 drivers/clk/clk.c | 72 +++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 59 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9cb2b42d1be4..7a15cceec620 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1442,14 +1442,39 @@ static void clk_core_disable_unprepare(struct clk_core *core)
 	clk_core_unprepare_lock(core);
 }
 
-static void __init clk_unprepare_unused_subtree(struct clk_core *core)
+/*
+ * Returns true if @core should be skipped during an unused-clock sweep for
+ * @dev.  When @dev is NULL the sweep is the global late_initcall pass; when
+ * @dev is non-NULL the sweep is a per-device sync_state pass.
+ */
+static bool clk_core_skip_unused(struct clk_core *core, struct device *dev)
+{
+	/*
+	 * At late_initcall, skip clocks that belong to a device — they will be
+	 * handled at sync_state time.
+	 */
+	if (!dev && core->dev)
+		return true;
+
+	/* When called from sync_state, only process clocks for this device. */
+	if (dev && core->dev != dev)
+		return true;
+
+	return false;
+}
+
+static void clk_unprepare_unused_subtree(struct clk_core *core,
+					 struct device *dev)
 {
 	struct clk_core *child;
 
 	lockdep_assert_held(&prepare_lock);
 
 	hlist_for_each_entry(child, &core->children, child_node)
-		clk_unprepare_unused_subtree(child);
+		clk_unprepare_unused_subtree(child, dev);
+
+	if (clk_core_skip_unused(core, dev))
+		return;
 
 	if (core->prepare_count)
 		return;
@@ -1467,7 +1492,8 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 	}
 }
 
-static void __init clk_disable_unused_subtree(struct clk_core *core)
+static void clk_disable_unused_subtree(struct clk_core *core,
+				       struct device *dev)
 {
 	struct clk_core *child;
 	unsigned long flags;
@@ -1475,7 +1501,10 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 	lockdep_assert_held(&prepare_lock);
 
 	hlist_for_each_entry(child, &core->children, child_node)
-		clk_disable_unused_subtree(child);
+		clk_disable_unused_subtree(child, dev);
+
+	if (clk_core_skip_unused(core, dev))
+		return;
 
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
 		clk_core_prepare_enable(core->parent);
@@ -1508,7 +1537,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 		clk_core_disable_unprepare(core->parent);
 }
 
-static bool clk_ignore_unused __initdata;
+static bool clk_ignore_unused;
 static int __init clk_ignore_unused_setup(char *__unused)
 {
 	clk_ignore_unused = true;
@@ -1516,7 +1545,7 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int __init clk_disable_unused(void)
+static int __clk_disable_unused(struct device *dev)
 {
 	struct clk_core *core;
 	int ret;
@@ -1526,7 +1555,10 @@ static int __init clk_disable_unused(void)
 		return 0;
 	}
 
-	pr_info("clk: Disabling unused clocks\n");
+	if (dev)
+		dev_info(dev, "clk: Disabling unused clocks\n");
+	else
+		pr_info("clk: Disabling unused clocks not associated with a device\n");
 
 	ret = clk_pm_runtime_get_all();
 	if (ret)
@@ -1538,16 +1570,16 @@ static int __init clk_disable_unused(void)
 	clk_prepare_lock();
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, dev);
 
 	clk_prepare_unlock();
 
@@ -1555,11 +1587,16 @@ static int __init clk_disable_unused(void)
 
 	return 0;
 }
+
+static int __init clk_disable_unused(void)
+{
+	return __clk_disable_unused(NULL);
+}
 late_initcall_sync(clk_disable_unused);
 
 void clk_sync_state(struct device *dev)
 {
-	/* Will fill in */
+	__clk_disable_unused(dev);
 }
 EXPORT_SYMBOL_GPL(clk_sync_state);
 
@@ -4345,8 +4382,17 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->dev = dev;
 	clk_pm_runtime_init(core);
 	core->of_node = np;
-	if (dev && dev->driver)
+	if (dev && dev->driver) {
 		core->owner = dev->driver->owner;
+
+		/*
+		 * If a clk provider sets their own sync_state, then it needs to
+		 * also call clk_sync_state(). dev_set_drv_sync_state() won't
+		 * overwrite the sync_state callback, and this call will fail
+		 * with -EBUSY.
+		 */
+		dev_set_drv_sync_state(dev, clk_sync_state);
+	}
 	core->hw = hw;
 	core->flags = init->flags;
 	core->num_parents = init->num_parents;

-- 
2.54.0


