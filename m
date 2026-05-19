Return-Path: <linux-arm-msm+bounces-108546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AVjJ6eFDGoniwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:45:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2E1581AEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4C6932180FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C5F31E107;
	Tue, 19 May 2026 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BajwrF+5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C2400E15
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203617; cv=none; b=dLmlbaqFu/RCpi6YmD+E2dpv8fUGCsKBvPpBrqpBuZZ7NaUfGoKGW3dEQoHkvu1JH0Okvef3XdmjPtbyCzkJNZuguNcQrNbKpvwObUvgFZAqkVf/4a1TfgRw8V/FKz+cLkIBGyyvjtavqsBK5OPTIVGRwun3ZF8lAnfWLE4mQfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203617; c=relaxed/simple;
	bh=PyMDXHTHmiBal63+huyGbhXhACUB3uDUE0n5xE6s7NA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IfNOy5sV/gz++7wFgj1Wn+Ud9g+9u5gEPJVuXgkGuhWDgj4iQ+BWN+Dp01+1j9LNKgliBlsf/sChzmnDxXrHzqqvwRcHR8NW1PJrn+lvUPwqSgcW3mE5UVrn0oPKxvH5WZBo51t94wD4az+z4JBdhfrUMcpjvTjwOs6E1d3cO8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BajwrF+5; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-678a16429c6so6700760a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203613; x=1779808413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xq7nQ1Lsb3vRwbjHSOrZ5dNJgO6+7CKIuI6JGLvOcQk=;
        b=BajwrF+52pOVnrXSdG8nYsG1nb2P/dv5aBLkWrSRM6UImHnLFqX+GyTcCHmOR2QsyF
         aRFXdqk2aPoZs/EqSLpp0f2V8Oh3HrNE3HdmMlxeKepNpSYqgWCobNXrLF9OX7noFsbx
         ZaHBnNr1BgN4Qs5KugIlzww61vtwdmZ9Uh1WiUX4OO2mCrGviMHY8BcjXDSUTUAnG2n3
         LTEG3+burDB36W/R+Yu4XaxBD9EPyA+RnIomXygprHvshJxf2gjqaKqDitytL9sQ+bql
         YMNg9TWj1L3TvVOEjnAy9ksNGuY/So2ocXWxb81GPrtA4O2DkiQkJ7Wa1D4xFe8rnPq7
         CrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203614; x=1779808414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xq7nQ1Lsb3vRwbjHSOrZ5dNJgO6+7CKIuI6JGLvOcQk=;
        b=VO6Z29nU/5KX/2H/tw4EBAOct3Ph16xPiPYYmjnx/6S2c1sq45Ro8Ameaz3RJelDvj
         1EpsJKFXElLUTE4UMzaL7tyA/z8JP4+i1mLF1kz2YdKnKWVIa6/hogDI3VQ72LUlAnMo
         /bEK6+YY38qlyLytComVIlpqHQDQXqzZSfrQG9twlT2jY3AVge3lU5IrXmIKwKbHqgwZ
         RgkPJTIQK9xkPn2xXz1dX20J1GjOxWvpNDr8Hjtf2jzJlgtM2+LymHvYo+lvXg5WzjC2
         DWgpZdnxLeaWCBqpZevC4O7rmBFrpM9RtwS0rsoMwJmjpAHwR80DafsFgrkQ+ogdKw7I
         V0fw==
X-Forwarded-Encrypted: i=1; AFNElJ/KiPqikPPXqZ5IW0kxShzVhUaRIkeeTth6Wn14ymsA2mQKPEtxa5/q2qrmLqzGpSw8GzONBkiX295g9QqH@vger.kernel.org
X-Gm-Message-State: AOJu0YwkF+KkmiSbaWfVtzwatAW5glPDZBt1Lcb2MYMgH5/kDAhDdweI
	fIpjObvujEhZ7JXydqACISCn2Bq3XRmHXnDGgfCr4pwh387euNR771VP
X-Gm-Gg: Acq92OEwTVImA0IEZrDm8l8SG02SDzxOqDah2Et4gRc4G2aaRRm7lvkp+yByPicJIO6
	3cwKR85xRVTzR350j7NyseNqcPIyTBubQuCRVrsxWBRVVFi3hWaEAegou94becNz7NAZec+WCf2
	8pZIs9aLMGkIlbHPZPAmnEw0hW+iHoFjaPgpFgSmI4IG5zcdF7V7aIYabVpPyNNlksyWPbgZHpW
	/TEZDMtcscwBvD0BX4WxSuz2n37ZzayKiM2s/Jf0OhTWr/RJVv3q+1fu3ekr2UZQB50lxM42/UA
	uNZpTx9t1511f7jqJbOu16oT05yY2hNs/groAgFTY9a+Vb1OKmdfkEOS8qa9RMqNc64wumIkLUC
	fFoV70mFpZlVkXJMpgDBFnNrSrqmrdOhhnKAidvb/2BzGEf6by42Ajn7cBmRyg7h0zsMmavnJha
	vJeVW/OsWt+5gKB32veU3ilY8QjQ==
X-Received: by 2002:a05:6402:40cf:b0:67d:bc41:334c with SMTP id 4fb4d7f45d1cf-683b40c5f7amr10086739a12.5.1779203613247;
        Tue, 19 May 2026 08:13:33 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:31 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:49 +0300
Subject: [PATCH v8 4/9] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-msm8939-venus-rfc-v8-4-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108546-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2C2E1581AEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index c1603eebd757..46705a666776 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -88,6 +88,8 @@ struct venus_resources {
 	const char **opp_pmdomain;
 	unsigned int opp_pmdomain_num;
 	unsigned int vcodec_num;
+	const u32 dec_codec_blacklist;
+	const u32 enc_codec_blacklist;
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
 	enum hfi_version hfi_version;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..8e762cf77968 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -206,11 +206,11 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->dec_codecs = codecs->dec_codecs;
 	core->enc_codecs = codecs->enc_codecs;
 
-	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
-		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-	}
+	if (core->res->dec_codec_blacklist)
+		core->dec_codecs &= ~core->res->dec_codec_blacklist;
+
+	if (core->res->enc_codec_blacklist)
+		core->enc_codecs &= ~core->res->enc_codec_blacklist;
 
 	return sizeof(*codecs);
 }

-- 
2.54.0


