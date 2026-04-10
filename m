Return-Path: <linux-arm-msm+bounces-102608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFdrIgKz2Gk8hAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:21:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAB43D3FCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BF8C304A6E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C7E3AC0FE;
	Fri, 10 Apr 2026 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ug1GkVtc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E435A3AC0D4
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809034; cv=none; b=lKqXhNmzExfqu9BU3U6AUjQQJ2YFdTHp1m9hRZuOLbZI8gtQ0KT9M2a3I4jZQ8qPYbMHF4vvMvoE55vl02LLA+ZWGo0KTPpduehBB588rjLZJMFQ20Tfelmtxt1kaoNo6RLltAsdRhoJhfFkBszoi7/uZE4gPCRTvT0+8OJxBk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809034; c=relaxed/simple;
	bh=B17bVmBmnkP1hcqtGSn9ht5X8PSnvCu4sZaG15J8RhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OjXICjvqyV6hqSd3p/clmZQykLXHLU+TQRL6PJOhjJp962ymMPDHjyArj1lBkg34hqg3S1sliRqQtRdGBGTRGLLwpEfnQUucgfY/vo0q72auAEy8RJ4g+DmGOEptWjM8psHl97iSXwMNwY7d9/lsVVhMvfU7wjFN8CFGw1USk8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ug1GkVtc; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66e6d9610d8so2586479a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 01:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775809031; x=1776413831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/I8STiLmCdAUWAKR9dG6wn9ETGBCkr8LaZ1bDk3uHnc=;
        b=ug1GkVtcL3hcvY2TaQ9+ntIpARBqmZoQjXbUh4IAJc2h2TZTwuXCJAvOEzaANt3qny
         fUka1GmC4Fcqb0UdHmGSFQz5cQ7O/KRnIa0a/lpXTU9L6kctR/KtuU4CwU2u95oZr8xW
         hV7zCncgHT9OnvKbvKhpB7SI5y8cvvKXQHlxHY/aby5mz/bKpJ44q/31Zb/daTsF6j2M
         aeln597pCeX93rKqmT2FadNuy7Yq3w69HURp2dtGqoNIyfDJzxwQ2ryIDqQJ3+YudDBD
         kJc5Bf2yGLH5UsLgGl2Kd3b16VUZ2gfgbjMqzGvlATwQj6fB5CvQwfYLMnBMn69riBSr
         9d7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775809031; x=1776413831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/I8STiLmCdAUWAKR9dG6wn9ETGBCkr8LaZ1bDk3uHnc=;
        b=icOyxdzRlWk/wACLSseurPRuOwybHFQhZtegSV7lvWnVUpziKoynHUVxvRrHXktzd4
         Megtq1rVx6U2CKfJrMd2pQ7q6vT9F6hj59B2cXkAUqsTHveveVsCxK0Wy8tm/9rh+UKz
         /cnlEZX6DjFR2xlQ0IYvPYPNuaRyFyhncbi/Cv5+HKKXYJd+ROq92BjXkLFU7TahKDtC
         LIhfo1ZY2NoyjRdJSP9pl43akkWiFdrsTrc7LKVE2DitwaFvZC/caVdjfL4LWGhV7Fx/
         bQSEWH8c2ydRNTqdxf/a6GDg8uwWlVJbtrush1tNtvlvPFWP89u1EucUJsGeOj/HpVhu
         W3wA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ0aM34k1UQvU/xGvHfQgbJ+IS1BAw/OlCajcn1NuKwVhPio5TFsY0oH3/BpCvRz3EWoVRQtb68gHZW0pw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3e13Ujn4K08/5Oot/rV9a8A+c/vmP7AsQ9i6ZHOY22q3ZdEIc
	flT8JxpBjmeieORRF+BOsP274IKGPLUNM8OXrU+y9zX3UjKBpAS9coasfWRNvZ9X520=
X-Gm-Gg: AeBDieu86hO3UIzjPK2Temtx9uIXHgZFlLrt6UDvQNLUl/He9ofxmiUmjT7tmxVCr/f
	1PwSK6FtBdc1FcG7Iai/2rgbJ84a7B576rAEN1EfpXhQ8RiCtX38t6/P0kLEWVyS+gEFJVSFf77
	F715+D9UrlMO9lxBRHw6Q/U7AZ2UxtX0aSFawaZ3oK9vJUQQ5I5ldw0hEMUWrnDnu/Rwd50dCI/
	j7yZwWtlVQUDV6WVMnOaKu+Bv2hN62dlbtP0wHuAdzbDp5cGaXedsBLJW4g+tAlyxCZPYYnl0vW
	gBdiGg8VVjYgueYxThqkM/aFEvfuHd30BnjC4PlMBZ4VUO7SQys5TKWMibtgG/wbY+/mshzj7rH
	/bq7sweqXtM+vT97zzQ8+mLQg03031o4N2qxJS6Z4jFVIXP9Iy6qYCcSH/THX9HcTU+KCTerkG3
	29jl8TsFRijXH88g5e+VDk1Ks8J9QX/2fQSrqRBgD5U+ufMFeq9PKiLqk10SBLYPLMWDieGHwHf
	AEr7Q==
X-Received: by 2002:a17:907:a4b:b0:b98:6a8f:7916 with SMTP id a640c23a62f3a-b9d724958acmr135988066b.15.1775809031197;
        Fri, 10 Apr 2026 01:17:11 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c7c81sm58488466b.43.2026.04.10.01.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:17:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 10:17:02 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-milos-ipa-v2-2-c699b6b8cf27@fairphone.com>
References: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
In-Reply-To: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775809026; l=815;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=B17bVmBmnkP1hcqtGSn9ht5X8PSnvCu4sZaG15J8RhU=;
 b=IwTuVvJsgu8rMOmBfU26s9NGz8XHAIiBWQdtyotBXFTPHny0nzmz0kWVXDv7QSRNEsBbkoW2N
 NlN1jSMUPp9Ad/0y60KMj03S0YNmYQu2xXVp5m43wEW9CKVgyJVRdjS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102608-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2BAB43D3FCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Configure and enable the node for IPA which enables mobile data on this
device.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index c1899db46e71..31c6d6627619 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -690,6 +690,15 @@ vreg_l7p: ldo7 {
 	/* AW86938FCR vibrator @ 0x5a */
 };
 
+&ipa {
+	firmware-name = "qcom/milos/fairphone/fp6/ipa_fws.mbn";
+	memory-region = <&ipa_fw_mem>;
+
+	qcom,gsi-loader = "self";
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };

-- 
2.53.0


