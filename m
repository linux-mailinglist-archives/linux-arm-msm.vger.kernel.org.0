Return-Path: <linux-arm-msm+bounces-95564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN51BlRRqWmd4gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:48:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4583A20EE30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33278306E181
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CABE37AA6F;
	Thu,  5 Mar 2026 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZpjLppp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1074379EE0
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703591; cv=none; b=qSuH2zvF+JNYxfn1t3gsXT0qNjW5TVl/oJjwkyyiMlYV6LIbmGmBayN+7d1EK+pE7YdEUWOFEvIdNnPNQzy6stt0jS4N3qMglcLRQGLbL8b7vDDnO+Gx2rxgSkDw7Qh2cE66BJ99/pmh/kA6h1WqpEf7vFMDJxPuyR0khJqGOBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703591; c=relaxed/simple;
	bh=ZCy68bKzBFZTZSfOpy3mDznqvrsWBJ+1U7/kAOyrhT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGIJUQ8d5NkLuvLuJS2TiDvZfoNMsfyg814jmetKMqpK9SHB4BbTS44n8jZQKSCnR9IcXAeaiPiMei+EmkUx8PFTlChZb3S/9/8pFr4Wgg49El2tINPN1aQiw9XavFwowCCg04fw5spvJoHScmf5eE51rPpAlcyXCkuIQ5GPJbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZpjLppp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65f8c8c3a4aso14432684a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772703588; x=1773308388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl74gGkU+YXXZGgHiIF1hb59wxwbza62LeRvdv03AsI=;
        b=SZpjLppp2z5jQCJz/U61VohKj0IJINuaqwZtTxTzfLdlarV0e3t/773vH1ArZ766lH
         DG/pWN+448p14CzJt7/6UWvM73QAVvnauqKGodIE4vngdS5vhUV0pKAfOfqansI5xR+a
         h2DfnEw8tFnoyk14Eic1tDOcfrCNXUspdFFHoKmjjXvOjjBHjIfTn5OXV6BuU1M9KWma
         dS7j/bCNyUQSxuFmO7PI7lQX3wgi2W9lkDwr3hm4qBtUjWvFhwG2cor3xgmtL2Cm4vzv
         jqOk4unQeL1XePfQEs1PDzCXP3z+bVrrUlfMAy26Zmdg9Yyd7RO654Nf6AsodikAprMU
         qi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703588; x=1773308388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cl74gGkU+YXXZGgHiIF1hb59wxwbza62LeRvdv03AsI=;
        b=SVWzn2c58T208IpqXCvUPBueFXIAa7FQYnSTQwVYrfGobO72gLRgHcDK1s8oGcrllj
         ZxNymJEN23Bn5B7a9F+wZ2zCgtugNXCIfvPShHWJO4cCPGlDEMKVQLEaUUMpBrBLYiJN
         8hrRn2Eajt5Ndl8CQAuU0Zf6v0r30LhJK082r9P6P7eQfHV2gN5nTIDf8tiaAoflIYOW
         BYdfVkPH1Q5Cv8LCb2xTILvjUPvujs4RUTdsoadRwOgtzk6bWM/+R9vRxjPJabp5uP1z
         KidFhtOVO8lmwuwZWup52ButK36bcGF0D5OfVDPeF1KY0N4cd/Ujw7ZiBFb1NYmxzcUf
         b91w==
X-Gm-Message-State: AOJu0YyDBsxwk/uH60tTLb+NVq61hFf+LVDbgcYJAS0wfFLhKtlWe3Fa
	/i4rHdJyfDgdAAcZhZyAjsZoc9kBzNZp83Z0UWj/E6jsYipQmHJRp/0p
X-Gm-Gg: ATEYQzwj1ihGq52qR7auFcRCVHtXX4nhiFKfWhAm2qkeAbhOGWI3zbDRjW8CyFr8u9K
	FEH9okskijUNNjL1vgdsKnJub6y9CNZeS+DoO5xVC7FEG8cndg0NiCfZeMZQatJqmcx224eNyaD
	kTIumH0rJDQEJqwHC+cVSSnZqvN5y2ydTUFufMHwz9YhR2z6kUvDgMKgnoDI4bTkPTb0IRvV5LA
	tloqe7hKa8xLjNW/jNWJ5TsHD/FhMk5XVO4ZmbEXEPykXNnKFWvW5UGcBVG0Laq9zpg7YbF4jt1
	4JuxEmfsNHcBIEVFgu/K4pZOUoZ8Hpabr82TiIkY4FWv/60J46GsCwAZmh8T2yJVgb6pSFaXDv2
	RmUWrsQSHJ08gCMFGcWPymTJVmpDhRDqFYECYlcAx3I+QERdsr7Ws3c+ezNenJFgqq5ZKKJwYI1
	OoNwdU3V2JRI3LwAtlvjvCDtJN856vehwdoG3W+g==
X-Received: by 2002:a05:6402:51d3:b0:65c:64a:216b with SMTP id 4fb4d7f45d1cf-660f00d2ef9mr3126593a12.28.1772703587928;
        Thu, 05 Mar 2026 01:39:47 -0800 (PST)
Received: from workstation.home ([178.227.95.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660bf4d8249sm2616634a12.17.2026.03.05.01.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:39:46 -0800 (PST)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
Date: Thu,  5 Mar 2026 10:39:40 +0100
Message-ID: <20260305093941.305122-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305093941.305122-1-zstaseg@gmail.com>
References: <20260305093941.305122-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4583A20EE30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-95564-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Xiaomi 12 Lite 5G (xiaomi,taoyao) is a smartphone based on the SM7325
SoC.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..711cf3bba6e8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -982,6 +982,7 @@ properties:
       - items:
           - enum:
               - nothing,spacewar
+              - xiaomi,taoyao
           - const: qcom,sm7325
 
       - items:
-- 
2.51.0


