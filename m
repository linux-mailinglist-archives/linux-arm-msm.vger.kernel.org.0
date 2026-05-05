Return-Path: <linux-arm-msm+bounces-106022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MHuJCFl+mmnOgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 23:46:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9A14D3FD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 23:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCAF6301C522
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 21:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C916B494A18;
	Tue,  5 May 2026 21:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/8bZiad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7388D481ABB
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 21:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017558; cv=none; b=mJeFmoKG74n1Oq5iBV4rP9jcQ5k3VouqFMGdGG+g8hEDl1mJpBVXuK0Giczx7vHYge9SG1zfkAFbX3JOXbmvUmT4tfdgaB7VK5k3hLTFRL79rxR7ls99DBiYNtfqoSoqi4veyOGsrdsHF/L38o6h4JE0CCp1qNFuTURSLSU8KjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017558; c=relaxed/simple;
	bh=pQrsVHH672iLD541aAxk9aTkvN0tzWS/UIaQ6RTMYnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e+gPgCVO2PLZkEtbLXCQk1xswyGx4+WQXTKjb5X4XnwqfMmFHi8BzB0m1U7wdHzeVHMlXjsws/o7g0Abu4IPSHNe/Q6kHGQNePry7utTZwcMwnTgQ1d4jIixuG7qgAj95xEdVikUUNDCRLrklhZfQ3IQ/Ni+tOOyr61ZjAUKCfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/8bZiad; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79a7109f568so64813307b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 14:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017556; x=1778622356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUx1WhuNP3C6tZPswT5NmzfLUccyj6ApWGSEx9tbsXg=;
        b=r/8bZiaddbTCVO5mZsPmxNDluuUS04jkjsiG3771ZtNXkv0PzpQCFcuQezWfFYVstw
         8I5Bat99gkAUUP9TBG7QatQ1IbottnW7/2+cmlq0cPSiNH9fd4Da4ab4QgPW7eWZZ5c9
         rwYGZjYZcngUR1eap9GeDZPt1kH4H4MbMRl1RL+8gAfh4bAMRWkPkY5w6wA4GHD/cfWb
         KjE8f+L4waHYO5mIQ0yq1n7JfESHG/pJLHLWnyaa6l7UwRREKav+aMK19e04Tc1mr+lg
         Cin6qxG3Aq0GiN31ZV1URgoZFSqWI3lM6cNtI7xCJahLKkTP+aJHVEjoLtFl6bE+zGUa
         NR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017556; x=1778622356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUx1WhuNP3C6tZPswT5NmzfLUccyj6ApWGSEx9tbsXg=;
        b=GFUmaVa3XNmi/zMbAaSALyY4aShu5h56+TPPLiOpMq/VtBr+7w3BkXGG7QisydzY5T
         oLsTsOyVANM1AzeiCfm/aJDXdm8vXMHPa6tNCl3EYlfTwlOmmtAx8n+/qaRopkQmZJC/
         LaB8F68kvdG9tctmbIAbPWDLNn1Zxcy2oV4pk/q9EUTRhMw4q44Ezt+JfojFWCtmnVqF
         6VpXtiNmoVRgTGCQDcr45T9lgymH1uzPp/1zSwNzSxjETSuBdxyyRvuwgYJ60iFgit8i
         19t+mWHDkHkapGZkpVRFgYix5mbP7XXc5SX05iKsag8iU3ts117oZDyDxoZXQwSVydBl
         2maQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9UvPbOXXwYPKCXVLv1bYWWqQJ99A3wgyom0fM9BL89vrloilfEtjPAUjhyx9Hiizv21Yj8RcgUZyU9qqk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi41MiddsVzH2WnQre0eY2lJzichotDD/0s8/Q//lHJCBmq0zy
	dsAZdI8nMPeMQXzHV5wzUmxEPaD8Jq1jRrc+HEzgDz17bZAx8MctM4PI
X-Gm-Gg: AeBDies/IMFtQGm1Swdr28OV6Ny+gEVG/ve4r8YodagzRssynoBJevrVaCeSb3E1+LQ
	kagI/V9MW4ivkFpEmkOx55BXWl1KUS489rbm35RxqqJbzvstW6kRL9P6GA4E34Mf20NUmaZAg9K
	xg5/qWL+62ztCapGgGNxVP9T5xyOZAv6BR00coD3MhP9cRSfHJq+a2fXg3mb6/Ae4jsmLBKMB5n
	V+0fqIVkpDmHMqcfqt8JCToA40Nuf+OWE6V2GVZ14PNdVoG6vzWnt53AVYlYdOk+COznFxZN41F
	1xSuXvyOscPhvfUXoUdPt93DteRELxOLDOviTCmFLuufp4SrpA0vHgZWlVkWk7NP5H19GoxaI0c
	mvWXQIpVl4aE5jf6WEaEmzE9wtSOzsXJORtWYssPRNn2mkDIcFH55ZQbpFZL458tsGUTSyP6Tjr
	mRSJZmZG7+bhpgJMYdfHUBj36kKhJhZBiSBZ1I
X-Received: by 2002:a05:690c:14:b0:7b6:f4f:f06a with SMTP id 00721157ae682-7bdf5d8bbf9mr12969057b3.6.1778017556354;
        Tue, 05 May 2026 14:45:56 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:45:55 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:39 +0300
Subject: [PATCH v4 2/9] media: qcom: venus: add common clocks used by both
 vdec and venc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-2-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 9C9A14D3FD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106022-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Add clocks which are enabled during both decode and encode. This shall
be used in newer bindings for Venus, where subnodes for video decoder
and video encoder are not included and clocks are not differentiated
between decode and encode.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..c1d772c7ae9b 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -77,6 +77,7 @@ struct venus_resources {
 	const struct hfi_ubwc_config *ubwc_conf;
 	const char * const clks[VIDC_CLKS_NUM_MAX];
 	unsigned int clks_num;
+	const char * const vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	unsigned int vcodec_clks_num;
@@ -140,6 +141,7 @@ struct venus_format {
  * @aon_base:	AON base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
+ * @vcodec_clks: an array of vcodec0 struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
@@ -194,6 +196,7 @@ struct venus_core {
 	void __iomem *aon_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
+	struct clk *vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;

-- 
2.54.0


