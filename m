Return-Path: <linux-arm-msm+bounces-105490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HgP5NkfH9GmPEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:31:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DA74AD8C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD6A43018296
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E303CFF68;
	Fri,  1 May 2026 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDxT8+2F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C813CEBB9
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649476; cv=none; b=RjRFWFzi3XrmNtvM5IyeitfiWIKJe8BIY9+chVtmQuuyUA0MkjiYqqluAgmzauw3fra+QZnwuK6XPnPdLvTe4QGGbAbVrlYoK5tBogMWC59omFJ2VS87vM6JpMPQYIqNK95qWa65Gpar6Gp5JuOE+ovd1TEGATQW0UpCluITQfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649476; c=relaxed/simple;
	bh=1zmtsmOoLF4c/VPOqKHJVqKxej12LVDn1QxpEGQhWbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nc+A3g0B+2RClgxmawtwS8DDRZcrXPP6yheqnlCZVnThcqeAipBur5DocXeXIp4V10jub3dvc18CSYPXORgiPrW0WHhExQuUCjDSfEZeRiUeh7gGb/EaN7ErSYfU0JSuAgMKOLoIC/kWBfg2prvLWlflaKU4V4amRGhotSpiRW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDxT8+2F; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8eb5ad01402so221156685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649474; x=1778254274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJvPttf7PmmDXRNduf1P3T98TbrwrvVaJRejXXwP5B4=;
        b=VDxT8+2Fo13sZqZXBts2mp/SjbVZAPJcEMqLvMsxHUUUGLqVFKaEyg3fIGBSWo3I2u
         Db391yY2RsnvvNbZ1frXglnx/l4MyPpOenGNPmjo/Bve6aEQ6ei/U63fnId+U/UY9P75
         8WW2Rs1gb7KCH0kyQr9tQTKKMiMxkmWqXs3GpUpJ9xjCw1kJtyAPTatmT5Kz4Z+jH3df
         N/tOHK5+fQgR+5t+pzQr9EmkCj05xTCn3hRqppyRS+T3hsjTa+xAlNEo5q3pb1QTFdr3
         /vQ79v/q5RllXuuem+KNIdgkMW28VMQdEaf4J+EfdtzvH4s72U5VR1FVykL65ltepPG1
         HdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649474; x=1778254274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WJvPttf7PmmDXRNduf1P3T98TbrwrvVaJRejXXwP5B4=;
        b=LxBlzPR4C3ETiTF3FCPp2JT9jHeHIeqtz0pacaUEzaX0WI6tSqqZ2yzQSTb5KDhbJJ
         xeGIus9IppuABCPIVfd5tJVr08Vy9jzuDHsC5x1+xR2UpA+uagX+5KFwR7mHBOekHBGN
         oReTufvXcZLD2Y+hUG7OKQW2McKEZ6BE0vtJERcJZduoNIquWWYeDC9h5iRBTCnkMiuD
         8VYR5tKycKg13Gv7uj/wftTFJoinyo0vchbRm+GA3/1WdjrzxfJY0PJP1kfJh8oUth/0
         J0TUEy1YU0oBnhp5FON5GdcHszNz450yZqlvv7BIO1QFeySXnONXc9lK7B1q+sQh0+Vi
         v+LQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ySKIt6+wjerL0dUiITIN4mEVVFmzcqmLPCgcTDuR5ectyq3Njkgc+ZqUFcIdMqypNc+Y6ujmWN+Gnj8+O@vger.kernel.org
X-Gm-Message-State: AOJu0YyEpgEx+vELxp/kyRromivJOwxKApm7zZ3+0Tqja8gLO5edV1+7
	hCcgtwmZ10WcGW1QuC0hf0hSkQn/XkBGrZlJW6oVRDK7WpMq7Ih+t93w
X-Gm-Gg: AeBDies7Bgw7qSbeorrXVhm0uFd+DqQ0M2bW6OFNpuMaJQdJ5t6n/2fLe/fD2ExAvKw
	d/fZqZjQh+RkhbyXFUT034yZN4Wl4Hs594HRw+aZoPT/baBTvmGOa4U0KhK67h4p2YnGpS3LJW6
	cZi/rfHgxxXsrnXdwIjVh+AUF7m8IWWA88vLgO3M/PsY7eb+GopnvKncqP2OXK0s6zelh9YsSxN
	ZuICmbxDFTNa4OLtjdaKhndCg0bXODfdNVTua8/0hoCBN/CWpzr0KX2ZUzXO/FclMu+vAVwUYh1
	/+jEKNUOps2+6/NNyfm+7KeNrpclfkTitkCa/RjgsI+nfkBWeu+SB8cQM9mqGG/cFPMnHdN1MZK
	sEQ3DM3N++j/cXfsKmSuNam5i6pugau6wpYQy0r/NadZFysUTZT/lu9cvNilr1vpWDbI3tlm4Z9
	5JSiUNvqPwvIMRP6HaftcGUR8axt7B6Lugjz0JX2FZREk1Wvo=
X-Received: by 2002:a05:620a:45a6:b0:8d7:3f45:b95f with SMTP id af79cd13be357-8fa86bbe60amr1257684485a.16.1777649460007;
        Fri, 01 May 2026 08:31:00 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc29380dffsm185499585a.2.2026.05.01.08.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:30:59 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 02/15] ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
Date: Fri,  1 May 2026 11:31:15 -0400
Message-ID: <20260501153128.8152-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 35DA74AD8C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105490-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com,oss.qualcomm.com,quicinc.com,linuxfoundation.org,kernel.org,opensource.cirrus.com,renesas.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The internal MI2S ports are found on devices with the internal sound
card for Snapdragon 660. Add support for them.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |  4 ++--
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 2b27d6c8f58f..d8271f1d9a34 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -127,7 +127,7 @@ patternProperties:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
                 # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
-                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
+                # LPI_MI2S_RX_0 - INT6_MI2S_TX
                 items:
                   oneOf:
                     - minimum: 16
@@ -135,7 +135,7 @@ patternProperties:
                     - minimum: 127
                       maximum: 128
                     - minimum: 137
-                      maximum: 148
+                      maximum: 162
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4342..059f2ea1bd23 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -152,6 +152,20 @@
 #define LPI_MI2S_TX_4		146
 #define SENARY_MI2S_RX		147
 #define SENARY_MI2S_TX		148
+#define INT0_MI2S_RX		149
+#define INT0_MI2S_TX		150
+#define INT1_MI2S_RX		151
+#define INT1_MI2S_TX		152
+#define INT2_MI2S_RX		153
+#define INT2_MI2S_TX		154
+#define INT3_MI2S_RX		155
+#define INT3_MI2S_TX		156
+#define INT4_MI2S_RX		157
+#define INT4_MI2S_TX		158
+#define INT5_MI2S_RX		159
+#define INT5_MI2S_TX		160
+#define INT6_MI2S_RX		161
+#define INT6_MI2S_TX		162
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.54.0


