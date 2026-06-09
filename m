Return-Path: <linux-arm-msm+bounces-112241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RoQGKy1AKGofBAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:32:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3A5662685
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:32:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=o7IqhGFj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112241-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112241-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BD2C3131BF9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D50A3B42F2;
	Tue,  9 Jun 2026 16:23:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393403B42E4
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:23:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022181; cv=none; b=AI2PV9Y1Ktz7Z2qIMmlbA/iDaWqvAknwwKGdVjTn5F/Ma3dP35ckgPP671AQtiugeDFFnsvQGIzt63+zkZOCQMs84RGYA6WCm+It67VzuPzKcW8QODdUTpdcL0Se0ZlCBWN15NPW66TgF95jmHwYBYFSoJBYVZpXZk7EAly3QTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022181; c=relaxed/simple;
	bh=EixlG3+pSd1+umoQcq597TULbcew8judyFI9QjElm5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUqbs2qiYg3vwxX0yooQ3a0F9EuXCjVxA6M8wvuVbY/5KjMby5ahEiUEZp+AznyeH3dEUAs53yF/TumjBv8JdgI1qq3s64XNmkSopa14cUudg1YK5F7CjNyt7egD18J4SSp9oIAmhJRsHvKY4dwseP4BT6H+jYrJXm11xMP5z8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7IqhGFj; arc=none smtp.client-ip=209.85.222.176
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-915d17e2721so292134085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022179; x=1781626979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7H6CVxdwvbBnHBwu5wTdK915OM3mOvFPgDPWam3xl2Q=;
        b=o7IqhGFjshO4GfpWCc5WtIsUhEdrWQuu99r4h8PUVp4b3K3NXD6xT3xYVPZ8xCDNg7
         fZQG+VZNOt5zDoUCzFUa/sDTCdfwTEi8+/UpxDdJ7bWTJpUWxaDBTIKNl/8zs32VmT2X
         VzU4WYXHAOJeEMryHzeDcfo4594/Zz4w2h9wr2iT46jZUUSqbzsJnIFGUyCbxwIDcZnJ
         ixmaalT+baYSOh9zirSDAN/6V2Kfy3ktLX5OwIVJs0sQdHpVuehcyITqL4AxFqBqlgAD
         EIyF8IhNUH3IW2JiTHknYcS8HbGIoV6JfX9OEtESfedV+d2b+Q8jAxckOtoYLCVhapBx
         oXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022179; x=1781626979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7H6CVxdwvbBnHBwu5wTdK915OM3mOvFPgDPWam3xl2Q=;
        b=m0/rKJhbjVa+uKBpJc+Eu1FiEhM3QWQjz0/9X1gLTYyy0XbnLVNrmPcq87ec7yyLXM
         vRQxQMmLzoko5eyvymjuvtr7m17o7FdJ+74fCxgQ4exK5i6FT1ycxdOV5NoEs+5n9Ch9
         +SYamszel7KEjOVv2UyWdqsMOe1g7NNSZ09hUVRGnCvii5JOUbgVZQ0XWFgBwobAKZRQ
         ky3w/CcoBX4x7CRmlmRd3c8zEa8VcAfmiQA5ElwKS58hByIijhfRFTxnuNWStIf5Lyku
         nzo48bI0fcirrnMKjGSUB3eDAmc417hOem95Ti1tFUoAVWMyci/+Y70HS73m69dqUrqK
         0Ceg==
X-Forwarded-Encrypted: i=1; AFNElJ+LbeYulYdrw3XU2acdIwFVuEwmp7gRdWgt4+0knEeNJS0x9DJDH8jLYa18sbP+elICbRcA7d9UM+ivm8dF@vger.kernel.org
X-Gm-Message-State: AOJu0YxttIRXD2gQcmIePFE6bnnhqVQD3CLCawwGDc4QBAJWqcA66hVi
	YEayw5lNbViV4CRqRitap3RGnBNsChnFKdUiB8TdHf4T7drb4fLsHThB
X-Gm-Gg: Acq92OFvA9wGVjFzKNkmjmNmGO6ntsob6rNs5rW+zw9/ubmka1v0q0iy8ked/Jt0UHq
	0B4Ea7WSBkmZU36wZdBgB4Ly2iqtRhDxg0YewjJa6P8lZMNDifjpTCcm4VyMGuaGs4v7HFof907
	5bh8OW0/ImgPCEk1vgWAzuNwljcucV6Q+4TMcWo4RREld3Y6y5++I/3wEwGxmWcJY4491P8QsVA
	7DLLq7J/y1YhLUm/wPvp7ytrB8Pd6dRfYDJ2u8RYFGKCrLJG4UOAZovpRC0WU9eR/Ey/O1Xy4+D
	av521eeGOrpcevCv7T/c+DoomrouHqOZzGy2a+6lhb33Ra60zjgmDMxr3AqXr6ChbCbq1pZBvWB
	Viudz/qNjtS+564PY4nl309tHIFzqqNu73oY3wqzI67v7iGqXo1aIUu+fvL3Kln1GaSshStykxw
	L2cH5Q1US+Qki+ca/gG9hXuS4PhT6Ye4YRw0khTQ==
X-Received: by 2002:a05:620a:3723:b0:915:c7ad:8bd2 with SMTP id af79cd13be357-915c7ad8e62mr1920782085a.30.1781022179141;
        Tue, 09 Jun 2026 09:22:59 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d3a0esm2184525585a.40.2026.06.09.09.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:22:58 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 01/15] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Tue,  9 Jun 2026 12:22:41 -0400
Message-ID: <20260609162255.31074-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112241-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:setotau@mainlining.org,m:a39.skl@gmail.com,m:vladimir.lypak@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:johan@kernel.org,m:kees@kernel.org,m:ckeepax@opensource.cirrus.com,m:kuninori.morimoto.gx@renesas.com,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:a39skl@gmail.com,m:vladimirlypak@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com,oss.qualcomm.com,kernel.org,opensource.cirrus.com,renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,mainlining.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F3A5662685

From: Nickolay Goppen <setotau@mainlining.org>

Add compatibles for sdm660 based soundcards.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..63c744524e01 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
+          - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
-- 
2.54.0


