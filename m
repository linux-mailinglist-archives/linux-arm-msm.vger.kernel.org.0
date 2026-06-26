Return-Path: <linux-arm-msm+bounces-114705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EAayCK+rPmoUKAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:41:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9106CF302
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:41:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=jByJNG05;
	dkim=pass header.d=redhat.com header.s=google header.b=cEUxk0bK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114705-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114705-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77AE83181E94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597133FC5AF;
	Fri, 26 Jun 2026 16:33:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7FF3F9F22
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 16:33:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491623; cv=none; b=Phwqf1eCNG1kxtyZOhnbIkBnegbq2ZKlOew/9AEk7B5Im0Zx9T5J0fPyDpCrMfiD8EFZh/82BKpjCHTP3Kde1w3yzjAlS7jAVKOzqizwDOOqiMvLxAnrjb4b0BGeE+b6dmyf1k3DgP9LJMnmYDalFQtFSbR2nB3aCxyDhZFRp4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491623; c=relaxed/simple;
	bh=FvhmOVc3rcOJNkTIOHLcNd2AWDDDczEt68+M8meg1Aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KYurerqlCEZW1oeUFShJoq3hwhwT4ys9Pc2KvasZLW+bnjKG5iHDQIwVqgf2Pdy+L6y72Wj2+Vq0/BvpxS5rkRF+lQpIze3mzMiVlfDYU6N0a0ma4ZVv+RdYBu9qbg4/uqFM5ZNWsWkWjskLZXG03mpqoPwa8E9ngZzFz3v+E00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jByJNG05; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cEUxk0bK; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PGYnFsTCfLymbdR2HkfdxWn8artWtpe8LqSA1kqAwdQ=;
	b=jByJNG051CH65xPMk8LHHz8/T03RB5gEF8D4HrFfi3hWUP50bzznyseE5i/SF0YebB0R+L
	MdpR03QTDeH6STI8l5MrDtfjoTVzjllmsSOsdFQ9r8ZEsKISldX11c8TDn46brwImMaT/C
	k3eRXON3IbRqw90kXpUOO0en8ewayj8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-dlxQV3teMaaOiBSEc-3BRA-1; Fri, 26 Jun 2026 12:33:39 -0400
X-MC-Unique: dlxQV3teMaaOiBSEc-3BRA-1
X-Mimecast-MFC-AGG-ID: dlxQV3teMaaOiBSEc-3BRA_1782491619
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177b8def69so19315471cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782491619; x=1783096419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGYnFsTCfLymbdR2HkfdxWn8artWtpe8LqSA1kqAwdQ=;
        b=cEUxk0bKNLuF0Me0qBqZnm8KMX4AkHzQHBmUmF2nJaeMgBm5dY0TqUTO7zkYGyz8Lb
         QqHwVAdMSZvTzn91IXz7dhN9PlT6ftcTVRc+UOMRjVEXW5S9C/OELByfKseaUvq9fsJM
         dkMNO7X0FWiVuul3YUTm2A52KgZTymcv6TdU/DKdyTISk8zSm+KUMSEUQZZ7dOj4IPdt
         xCBU7NqyTOuSmIsrIAyDFK7+nQAncIr5yn5Aeuob2Tv8E6wAf/PmnNmoAwvZBjF/sRNx
         +wBMZEsynpzq3gyhyhIwfl5rSGoFyXw/xX0MgRwrEN4YVnvUTCObAKdpcEWc9Izk2R6N
         p2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491619; x=1783096419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PGYnFsTCfLymbdR2HkfdxWn8artWtpe8LqSA1kqAwdQ=;
        b=QQ3vWvYBrK/Dfbl5j892bInf7p6F9fD/udX5TYvp2y6gBIC6k5RifA5N2IauEr6biV
         BjrQ/A1eyOjPcn+x9w9Pgjp4xhb+3L919Burx73hjbU4PMGzURqDYrJo9b08wmrEM0hF
         xP8flDZOjI5M5tlASPqYLdj7n8CTao/xnKh5J0v1e1oNRnfMXSPwJft2Yg6PaCIRbEtl
         IyKzvfR2eZ26uooypMejAyBOBiIpeS50aLfhPBaGKtxcoVAqz7HxIP2rTm/yjjnuAhQO
         fyQGiDyzmc5bd3Tv+LFDkoXb++6UD+2kikc0J9Posc9GbpLAADQVTQxz8K1Z+UEoauWD
         6vqA==
X-Forwarded-Encrypted: i=1; AFNElJ9rxK2QJfkUy7bz8q/QPj1t6FRYLYPVVQcpmB6t4Ryyxb+BE6cAwYymymM1wR2dJsMwlSaBS3oZjAlLkQJa@vger.kernel.org
X-Gm-Message-State: AOJu0YwsQRS20sm2bcOW6dZOMGeVAqTbDlB1YttZ5bjGFZ+z0w4gfsJj
	EtmVy196k08wIvMl15JxmXGXVhQd6diHh24d3QmtPHIQeqtm0+0t0Wj9O8Am9mr0d0pfKN8dU32
	jTbPthpFaKctpt5JRLDx7C/SYfuHNKjHxYic5YVxz/e/9x1gKbX690Cdkt0Dtz6ZpDK0=
X-Gm-Gg: AfdE7cmdqxE6JHVT/XiF2QtuCYWXXLTO7X4O/cZMhLx4hNkuLljlRVo/Xtk2tkSLUU/
	piMZUk87jYkWMvdWArBxkQhLDUdyHmBQiDmVVXpjdGnqT+HYCvfhXI2Nc6SDAl7ofiKJ9YUzT8Z
	rT8kOHxxHUnx6XRN9ZSEqkW6vlM+IbQcIJWzLXsOTc1ObaD9JR84qInoAP+5z6OO9y8sPFxuuo1
	J4TolZwP7q0c38xTDb9SWkdH7U2qLgCv2+5vVB16JFP9k+SZ0Pb/4f0UWAOFKEmuIiXy6EgQkIa
	0Ml+DLgzCVIJdKONWoT9jv5hBGM+kEkdsJ31BSAQtWMjzfpuuHK1I7F5X7nzqxu3Y/tfvGuQxLy
	FKhOGlOarOdF+IAsYzUEbAJRzaiZQw3P+WFJwtR7JvdhwOGQmUQ==
X-Received: by 2002:a05:622a:14cf:b0:51a:8c97:9383 with SMTP id d75a77b69052e-51a8c979583mr9924661cf.58.1782491617890;
        Fri, 26 Jun 2026 09:33:37 -0700 (PDT)
X-Received: by 2002:a05:622a:14cf:b0:51a:8c97:9383 with SMTP id d75a77b69052e-51a8c979583mr9905721cf.58.1782491596909;
        Fri, 26 Jun 2026 09:33:16 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018566sm234540526d6.2.2026.06.26.09.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:33:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 26 Jun 2026 12:32:45 -0400
Subject: [PATCH 4/4] clk: implement sync_state support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260626-clk-sync-state-v1-4-4156d8196dc8@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9876; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=FvhmOVc3rcOJNkTIOHLcNd2AWDDDczEt68+M8meg1Aw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVh5m/m9abbz7oEzpCqddVqnMpo2i8adyxd5OyuBhO
 /L6o2tzRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABPRX8bw32md7uEH31RNIwsn
 CAtMj0to+az3eHbbC6ZLnm+jN06YYMnI8D1Ei08t/0/vd9d9zyunsN1dw1VwbX3Zjm1fRd7VOcW
 mswIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114705-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ulfh@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:neil.armstrong@linaro.org,m:dongxuyang@eswincomputing.com,m:jens.glathe@oldschoolsolutions.biz,m:johannes.goede@oss.qualcomm.com,m:mripard@kernel.org,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:bmasney@redhat.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oldschoolsolutions.biz:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D9106CF302

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

    [    0.366737] clk: Disabling unused clocks not associated with a device
    [    0.367232] PM: genpd: Disabling unused power domains
    [    7.791413] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unused clocks
    [    7.799702] qcom_aoss_qmp c300000.power-management: clk: Disabling unused clocks
    [    8.548820] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unused clocks
    [    9.121849] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unused clocks
    [    9.121985] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unused clocks
    [    9.122691] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
    [    9.122760] disp_cc-sc8280xp af00000.clock-controller: clk: Disabling unused clocks
    [    9.142121] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unused clocks
    [    9.169149] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unused clocks
    [   16.057997] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling unused clocks
    [   16.058149] clk-rpmh 18200000.rsc:clock-controller: clk: Disabling unused clocks
    [   16.334879] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unused clocks
    [   16.706113] camcc-sc8280xp ad00000.clock-controller: clk: Disabling unused clocks
    [   21.565731] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk: Disabling unused clocks
    [   21.597069] va_macro 3370000.codec: clk: Disabling unused clocks
    [   21.605039] rx_macro 3200000.rxmacro: clk: Disabling unused clocks
    [   21.630313] wsa_macro 3240000.codec: clk: Disabling unused clocks
    [   21.635069] tx_macro 3220000.txmacro: clk: Disabling unused clocks

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on AML-S905X-CC, AML-S805X-CC, BPI-M2S, BPI-M5
Tested-by: Xuyang Dong <dongxuyang@eswincomputing.com> # hfp550
Signed-off-by: Brian Masney <bmasney@redhat.com>
Link: https://www.youtube.com/watch?v=tXYzM8yLIQA
Link: https://lore.kernel.org/all/20210407034456.516204-1-saravanak@google.com/
Link: https://lore.kernel.org/all/20221227204528.1899863-1-abel.vesa@linaro.org/
---
 drivers/clk/clk.c   | 78 ++++++++++++++++++++++++++++++++++++++++++++---------
 include/linux/clk.h | 14 ++++++++++
 2 files changed, 79 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 048adfa86a5d..2b6fae54702a 100644
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
@@ -1516,17 +1545,27 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int __init clk_disable_unused(void)
+static int __clk_disable_unused(struct device *dev)
 {
 	struct clk_core *core;
 	int ret;
 
 	if (clk_ignore_unused) {
-		pr_warn("clk: Not disabling unused clocks\n");
+		/*
+		 * Only show this message once for the providers that are not
+		 * associated with a device, which is the first pass of
+		 * disabling unused clocks. Otherwise it'll show up for each
+		 * clk provider as well.
+		 */
+		if (!dev)
+			pr_warn("clk: Not disabling unused clocks\n");
 		return 0;
 	}
 
-	pr_info("clk: Disabling unused clocks\n");
+	if (dev)
+		dev_info(dev, "clk: Disabling unused clocks\n");
+	else
+		pr_info("clk: Disabling unused clocks not associated with a device\n");
 
 	ret = clk_pm_runtime_get_all();
 	if (ret)
@@ -1538,16 +1577,16 @@ static int __init clk_disable_unused(void)
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
 
@@ -1555,8 +1594,19 @@ static int __init clk_disable_unused(void)
 
 	return 0;
 }
+
+static int __init clk_disable_unused(void)
+{
+	return __clk_disable_unused(NULL);
+}
 late_initcall_sync(clk_disable_unused);
 
+void clk_sync_state(struct device *dev)
+{
+	__clk_disable_unused(dev);
+}
+EXPORT_SYMBOL_GPL(clk_sync_state);
+
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
 {
@@ -4339,8 +4389,10 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->dev = dev;
 	clk_pm_runtime_init(core);
 	core->of_node = np;
-	if (dev && dev->driver)
+	if (dev && dev->driver) {
 		core->owner = dev->driver->owner;
+		dev_add_sync_state(dev, clk_sync_state);
+	}
 	core->hw = hw;
 	core->flags = init->flags;
 	core->num_parents = init->num_parents;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 998ba3f261da..31a0c9224c46 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -846,6 +846,20 @@ void devm_clk_put(struct device *dev, struct clk *clk);
  */
 
 
+/*
+ * clk_sync_state - sync_state callback to disable unused clocks
+ * @dev: the clock provider device whose unused clocks should be disabled
+ *
+ * It is called by the driver core once all consumers of @dev have probed,
+ * and disables any clocks belonging to @dev that are unused at that point.
+ *
+ * If a clock provider doesn't have a sync_state callback, then the framework
+ * will set up clk_sync_state() on your drivers behalf. If your driver needs
+ * a sync_state callback, then that callback also needs to call
+ * clk_sync_state().
+ */
+void clk_sync_state(struct device *dev);
+
 /**
  * clk_round_rate - adjust a rate to the exact rate a clock can provide
  * @clk: clock source

-- 
2.54.0


