Return-Path: <linux-arm-msm+bounces-109885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QInPIFS/FWrYZgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:42:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2977A5D8F0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B288A302AB33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE84E3264D7;
	Tue, 26 May 2026 15:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zC21jxOL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9020423504B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809407; cv=none; b=hYK+dvtDcvMovmr2v3pxSDihnmFUSIXfimj2bZOYlCxKJBbCAiabnlkHkDTpUK2bWzoR8QhfdNArruDsoFOz+EJyXH+e9YjScP8uYMml+h3zQqBpGwzElOWhQU/k+GJdA/dieUpPk5VicMTKvsDskriEgvpDU+ddaiwoK+w0gTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809407; c=relaxed/simple;
	bh=d5No5p2kPGYPEeCcwPbvtzn0vYshvW4XXLjtHG58mNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+lyRZKI7aFH/8CZv3XVYF32Fnk2hJFF4lKxQlJ4aA5wSdPKy+dBGhXbJqq8nRyB4URYisOfaMtZdCA7gAniZP1Bt1mDSuapvZ0t4wboaZVvuSyJoyYZAH93khK4dulijAO2xwmWh1ozaoXjxX2X1b/25v3ExyZmRa0nCX+HMcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zC21jxOL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so3040387f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779809402; x=1780414202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Izp9MZRfDJ61whqJr+eGkWfgZt9VEoIk4csFEn366E=;
        b=zC21jxOLAGFNXO/HHhONuDs2YGouoRLpPQP9jYirJdq4MDkDmVgbc2+3tD+xQLnHc0
         0UCFzqLNQ66w2/UU+0SsE1osKpNh0dxfwmeZIddv+G+ZD8ef2QSW2USsVnyuKgckEh6r
         zkhEZFDO6ee+0N4o/Na0v0pLiyECKDcExkZHXIfxJw65rTGe7uF4mM6OHL6mdq8aB0v2
         5g/KENckNW46rOGAq4oprX6Ta+F21F2Sz+t+yrDb4jegTXS8XRO6DgFBDLHjhumKMcaP
         /v7qnFgQ+IXHnDe5AcaVQp8rZQSZswrg5uyGywKlJTZ/AtRKysdcXWl/BbLr/aVHRzb9
         xgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779809402; x=1780414202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Izp9MZRfDJ61whqJr+eGkWfgZt9VEoIk4csFEn366E=;
        b=WkAzvjXRUSUZ3uhdH5PPC4tS7BhVoVeDTg3/1eHGl8dzhdqo2ldiB1tYcAGxSDnbt5
         1LVUixw7JhPWF4euGyrIsAErXsXD9ijFlNj/TrRtkbRL3GcQbu58wnM92ZQGiwF3YtfX
         +u09LxiApyXs1IHRo+aBCnAdL8Xby8Ei+KuZ8oE8YEcBWVVpX7eAKVKJbNmBqK/QKBbd
         XE8Ni6SKXf5eEr2fh7UaKLEnssbYdAFKwT92Cu49i9WZr4oYaYe+aGLfNn59fr6gqxF2
         I6POHezKaq/Md3/Cz0C+HnHdM5Dh4L7djTnunPaRPN1NGUlhKCO9W3TFOFbi5+3cgnx9
         mQjg==
X-Forwarded-Encrypted: i=1; AFNElJ9hETAuavxvL4u8+h26lO2bhyZ5rPwS881hQ9+EjwQ6r5/Uq1h1UsQK94y5hIO6lUwV+XacSin5MjOptHQA@vger.kernel.org
X-Gm-Message-State: AOJu0YzrqlicECGyP9sIEm6Swz1gDLevzJFEVIjYfHbhqa1IuK+OoYZq
	0NWYlrDgvSZ3hnAxWHnVTvjsEH582CkBGfElg7u5Dfv37nHlJIUN492KdqeU8BITkm8=
X-Gm-Gg: Acq92OEGQWTEL7HPJIb9GqjgBjJUuc/GmCTiO/UzmaMLS26hGWlM8jzamiwChidO82E
	2B4jh92GgKdIbfkkru95P4S53a0yTgwrnO3NlnStxowvlToFIuhQyaI9EJN+rzSMYu46TzecYl+
	iHgMc7gQqsp0HOYFJzT+sNZ+jHBL1a/AAE3kDZNnpze0surwthADXigZtbWJuSzyuHsVqaEyyz5
	t50Lf+RM2FsFj/zzhCRYlfkBYVZ7AP39Fl0tOTBVziywHPQnxlQG1IJXDXH+K1MxtpUbSuwQ2qn
	bSZfqlFzJt0chT3VKU0vG+WL3jRhTtYQHjz66lyDKsriM1ksPcIhZIfZE8jyWLmBlq6nL3HhVMW
	7vceBrUB7wlOvE/wLlNtg760O4LKSIfNf+URR7zvz5z5P7+bSD6Na1K5C9ElM7IpqVoYwcI5J3A
	krc9NaI34JC5G3jjYg37BXnd+JRTOYcRGh
X-Received: by 2002:a05:6000:25fd:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-45eb38a66f0mr30090550f8f.22.1779809402180;
        Tue, 26 May 2026 08:30:02 -0700 (PDT)
Received: from [10.107.1.102] ([212.133.41.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5caeesm37691140f8f.29.2026.05.26.08.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:30:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 26 May 2026 17:29:54 +0200
Subject: [PATCH RFC 1/2] ASoC: codecs: lpass-tx-macro: Use correct config
 for sc7280
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
In-Reply-To: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779809398; l=1167;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=d5No5p2kPGYPEeCcwPbvtzn0vYshvW4XXLjtHG58mNs=;
 b=uAdZLNZsfUX4RLp9inUuLMDBsGewFvqrwfJwhlCgMSPgkhFLi8YtiiUMO4qU+M5ZSEnUl9sda
 vCC7PvpT73ODFseHSnV08jqTGnUAaQpiKw5RTnjNyzscsY3xst+kPOQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109885-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,fairphone.com:email,fairphone.com:mid,fairphone.com:dkim]
X-Rspamd-Queue-Id: 2977A5D8F0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the v9 data, the controls will have completely wrong names and
using wrong code paths that do not apply to v9.4.

Note, that this will change control names so it's a breaking change.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index f7d168f557dd..7f93ab0c3872 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2493,14 +2493,9 @@ static const struct tx_macro_data lpass_ver_11 = {
 
 static const struct of_device_id tx_macro_dt_match[] = {
 	{
-		/*
-		 * The block is actually LPASS v9.4, but keep LPASS v9 match
-		 * data and audio widgets, due to compatibility reasons.
-		 * Microphones are working on SC7280 fine, so apparently the fix
-		 * is not necessary.
-		 */
 		.compatible = "qcom,sc7280-lpass-tx-macro",
-		.data = &lpass_ver_9,
+		/* LPASS v9.4 */
+		.data = &lpass_ver_9_2,
 	}, {
 		.compatible = "qcom,sm6115-lpass-tx-macro",
 		.data = &lpass_ver_10_sm6115,

-- 
2.54.0


