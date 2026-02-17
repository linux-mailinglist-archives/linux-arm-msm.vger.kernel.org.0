Return-Path: <linux-arm-msm+bounces-93032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIjoKPS1k2l17wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:27:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F2114844A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3805C3018779
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AF32475E3;
	Tue, 17 Feb 2026 00:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cv0CQp5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF8B23BCED
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288045; cv=none; b=rzMPvQ6iSuqm9YVQqFZjTwsKSa6tQpJECiupuOl/AMdIZpX3TwANFIswu5hnGYkp+ovJl8aLl0KNAcfsL/2qIOXb3nUH7HZs2sfoc2b5fV0g+s9jKWOP39DZMFycT/RqVWCXoV+62aMMghWPrWL2WWU21Fc7NxjiBfDR+OTWSdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288045; c=relaxed/simple;
	bh=Toh8WfeMNLXt6DADlEJBFqnv4eGFPJoSXPt04u7zLAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqzQc5Hh1/+FoQBROePdGzUPrgRTokKM+KtCjvQqJTUABy3KeX54oF0oohXSXdMjqN1fHpnD06jJlb+S178V43Ein8ukIg4ETG8DVAHQvY4hSKE7gQUQo/BV+hkq+oD7QgOeF+38YEkq1DXhTim1GoiGFKvXDyuGwb8nJhpmMQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cv0CQp5X; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cb3dfb3461so393817685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 16:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288043; x=1771892843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bkLrppSycIxmkV68TSyhILxOTHj6vATFc9npwdaNyI=;
        b=Cv0CQp5Xj8/RZV1Ej1q42HksMP+0quklMfTfzYis1u+Oe3BpUwEEBqdIIS64CFox+H
         /5jI71p2YUfRiX21+kGK1ZPc3/oPkHisbiCGzMnEfw/p8Rn/yISE4gzhMtgshUTIDBTK
         d85GnbGKX5GmiglSRkIbFWqWpQ6m9mKJ6iJe6L0TXrnvb04qunL+SSO9ALUVXBU6WvF4
         gx2Pnk9lPJ2YqYP2RLqdxmgKiSmAwv71CXRmX21IBUkwwuIM8IgXqWzTrSGCaoY/ApEw
         BNMi5Cb/YIA+oKyZEx8DssWJpnkCM47RG05ZvoFaSJsKbf88aR6KDBJRfRUk1IwJiD+t
         4KtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288043; x=1771892843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5bkLrppSycIxmkV68TSyhILxOTHj6vATFc9npwdaNyI=;
        b=tgdljAkNc7xedU5tt7RW6Knhbv0VauslFhCP2Wp25Pl8CRz+gh8ysz4yCQC7IyXa7e
         9JC9W/3I0fgqX4Jj3UxmpIM3KE6na8WcDvQ8LyuW0UmHKCFWp80mOWAR1c4rwKD8keJ6
         jaP+QolpUF9NQobvFIQSPXbHDv/zC9JQp9UPbKVa5v/PwcXkFNULb2XZRnRjLBe12r6u
         R/7N9dMsz6dmC9bRYDFVEqpZ8ppElrmS3DAKvu1aYO3mMi0m72t5tuw4G5I68U7AIKjC
         HT6Iym6NMq/lr/oXbhr9RSnMlizq9v6eDXRQTuA9yvQsdIcD8HsA/+mJXRn884rkrOOK
         iQXg==
X-Forwarded-Encrypted: i=1; AJvYcCVuGVIce5VS4yqAoT64Hf2YzTJSApPAsB4QJDrf+dGWJauQhKMp7cWYktHX9JePiHodqTuH2oo5EEcREmdl@vger.kernel.org
X-Gm-Message-State: AOJu0YzysgPFg0xjivBJoU5/YXSAVyxDRCF6oTFG9Nrjw+ThtIae3qTv
	m5uwe31N6mXacuSiVkwB3XN6xdLYtM9eJcRx2kd/KPTgZg1UJDQZXWv7
X-Gm-Gg: AZuq6aKBSl2c9Xf+RzWKxpvHGsndkZjCi5MrkylIMlnC838P4RxyV5ECWx7xF08b45L
	Pe3NLWhKgczbKXEkgMSf6UJ6ArDggh3WgnUrJjG5EoVPpU7ahtIL1y0HH6dOHqfLqJpo+pX/ReZ
	22nrkXgUzE3b+k++uFxYs7TbqUpDXljZ+IHZBNlgh4HYZe6Ct5QgdcuyZRwqj4JXa/jAlD1mVxr
	Ie9rQ5OJIUF3AHWLhtZdi5vW2KciBtZxulJl9xBqwc1OtVbqm2hiwHjIYGLXltxr0bV1JyME7R0
	EZLJF11JnT5+mksaP2SyFJ50jk9Irv+m2I5Qhbr52sxugjVxU760k3rLeKZ6iYJtjHQtp3dVhPW
	p2gGTqPHwHoB7RUGIWidL9jrcC/1wDDO3B6YLsX0FocyzzvRe/03YnO76toaVjdiVLbjh6IiqnM
	xh1aCR5egKm+a0AUIu+jB4HQbz9c/SAQ==
X-Received: by 2002:a05:620a:4495:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb66dca52amr244592685a.56.1771288043428;
        Mon, 16 Feb 2026 16:27:23 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc957c8sm156277346d6.15.2026.02.16.16.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:27:22 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 1/7] dt-bindings: media: qcom,sdm670-camss: Remove clock-lanes requirement
Date: Mon, 16 Feb 2026 19:27:32 -0500
Message-ID: <20260217002738.133534-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93032-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F3F2114844A
X-Rspamd-Action: no action

The clock-lanes property has no effect on the hardware configuration, as
of commit 336136e197e2 ("media: dt-bindings: media: camss: Remove
clock-lane property"). Since boards with new camss support can omit the
property, remove it from the required lists.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 35c40fe22376..38b308f441ec 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -124,7 +124,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@1:
@@ -147,7 +146,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@2:
@@ -170,7 +168,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
 required:
-- 
2.53.0


