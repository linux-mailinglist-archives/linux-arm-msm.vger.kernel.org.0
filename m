Return-Path: <linux-arm-msm+bounces-101139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GwJOYojzGllQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:42:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B23370B12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87F2030784C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CE93DA5B9;
	Tue, 31 Mar 2026 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLsQ2cFK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5503793D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985950; cv=none; b=QE50QItPUKLANBONWgeBDWlUL+4UTsN20YkLodzNFbDQf2TQxnTgnsoHYOYCtz67630FT7BS9saiDQUf+TI6sGYFj3ctYlkaqldaz6VBl4r/rFMHQ+9AOwTOzGnx1Fdwvo/uEwxqNnyCZTaLpKQ6GWnG0zxT11SQucPkhgHrs6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985950; c=relaxed/simple;
	bh=PbEDnRTPGkTQYVIBOFEiCXHo/W0nlMVxr3pRa50aTCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FG+2aIE2j+zFZOpy0bHId2a3jjIG5AvuZ+CLbfUC/Gu/5zhN8vLP1MlJAf1+gLDU3jth6sVekx2KS4oyLKt2j403QlDmjlxXf+qsdiilqjo+3Wd/Yk2wj4cAzmodF2WMAGFDBE31vPGCeZ5wEoLL/+PHr04SGynB2Aqoybdrux4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLsQ2cFK; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-89fc4147f2eso62081256d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985948; x=1775590748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glb/MBLiZE+shtD8YN2zjJ6EHK0kWv/fgZbWKQ7BlbI=;
        b=XLsQ2cFKK/BhzcG3nJOhR9O192cyJ7tucQ1Zfa9it0Ay9T1WwJnvITeUutEyfiHKzZ
         RYe3tv2+0Mgu12iXlh0RG2C1NJEWT7E2hBbHX6g7Tz+8gi9XKsiqr04ozG5nOGK2/zQI
         IK4kpr4uIXjOm8G5n5kZEkAnc0gj86uU4XSHN55rKsBq5W1hW0UepCJ8P6I5HE7Y2gEV
         pvy3H3H0R4S/cBCCIXsCXoBw1Bpn0EQm5G0dq0HMzzw0kEsSGVTRiP1lYgYfdGn+m6ov
         JrPhF84qGievtZZvnuwwuZG292Q6n49gyi10GtS84x4S9/lHGpZdxisbEN3aLjqqcBPR
         HNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985948; x=1775590748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=glb/MBLiZE+shtD8YN2zjJ6EHK0kWv/fgZbWKQ7BlbI=;
        b=ShVnouSsqfciczE0/cgQoRZRlj8IoyrSJYOhogI+4yRj/xYlH+s0QS6qr4VoSC7clI
         cMt5tDmfZ+Kw1tq11jK4QA+IavIO8WfjMcKKI9JYIXKSeEF0uDDsyIR8j09hPRpa3qCV
         Lx0L+h2/j+vC+ThHw4Ja0cyhMqEB5tCejxFS3hswMHLwmc06ZRcSmNFSd7sP+QEQhpH7
         Wp6r6DOBeAXpBkuypHkg6YRlCSqdNBJ71NmvxzhFtqGcGZ9p5vVabmUsKg91EL5ng4ZR
         azJOtA9FghW7kzunBsCuQnjcQqVgYzGhM/PtXNvC4dbd04FVuKFcDkHm+AAScCAVZ2P9
         w7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUNSepjlsaQ1C7uvG1tcHQQchJySQMyHS0+pOpv7YTxPGmF6SUs0nJqwNuG6RmYNej790fXQzZQ4ALQVNEy@vger.kernel.org
X-Gm-Message-State: AOJu0YwJDnITkMmKpf5r+s76+uoWQ671sManbH/Q1Pq4evk4VL/yBy7J
	LvT5HtQpI9V6Zk4bCwl4y45XPSzWDyS+F2Q7cEc7CCnxz8Ucul5wLeCw
X-Gm-Gg: ATEYQzzV+AGdsM1V8HMStejrlYUmXZxLtKaLn72E0449lpcdsbbwnWlmLlQRNE6qywA
	Z9xfEB57QaV6XxOSO6j8HoNxOa8IyuUj+p31tbXGGvxOg9gz/7csHS6f7ETOJUzJxft1KnBfAmz
	OmQ9flVPt8x5UkrhrItddVb//SvtPPA66DkzsbCumO/4rka0+GK9lvCcDYqOeTQrY84fquH2SJb
	Wj9jNe++dbxln+nF1s7vdBzcrrg9pSgVON0gmihxpmxY3XUFypK29xD7uW2abBneWsfG8FKD4d/
	QswL/AqfHwB+XhK/+crViYuA0HQl8nNrVo4mUDi1/7JPHOpgxEFJ+2NBdKnsLiy70nBH+etrTQJ
	ljGLhqGXK1xdXNbLGhaB/v66TvJS2hYjf3lifBVkn9pYwPyV4F4AFFhZocE0DftSpSYJS8q4E9y
	uTzBqw1+L6rhSMiFOUJdyB4vTF
X-Received: by 2002:a05:6214:2b08:b0:899:ea9e:31c5 with SMTP id 6a1803df08f44-8a43b518cacmr12388466d6.57.1774985948199;
        Tue, 31 Mar 2026 12:39:08 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecc1923c6sm97466226d6.22.2026.03.31.12.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:07 -0700 (PDT)
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
Subject: [PATCH v3 03/15] ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
Date: Tue, 31 Mar 2026 15:39:27 -0400
Message-ID: <20260331193939.40636-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101139-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 85B23370B12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Adam Skladowski <a39.skl@gmail.com>

Document pm8950 and pm8953 analog audio codecs.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
[richard: add back empty line]
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 94e7a1860977..15389645a3e8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,7 +14,10 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8916-wcd-analog-codec
+    enum:
+      - qcom,pm8916-wcd-analog-codec
+      - qcom,pm8950-wcd-analog-codec
+      - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.53.0


