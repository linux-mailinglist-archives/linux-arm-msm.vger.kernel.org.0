Return-Path: <linux-arm-msm+bounces-105489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FGaBzDH9GmMEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:30:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D37DB4AD8BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0486D3009002
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BDD2D7DD7;
	Fri,  1 May 2026 15:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrxZ3reh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F1A2DE6E6
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649450; cv=none; b=fSUL+2aJunZfIVpaYdeJFD8r1pmezp7qoOl7B50pQSNkPEs1w7cUWvIvZCxE+VuUMgpypR3MKP2pJiUbIdXpYfZmxPA5R17pQa81faW6oIC/bS5nibuzeLwmrbOSNQBB1bpiZdfllkRnZHb/q1twUln8ims0M23jmkUMlOShnmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649450; c=relaxed/simple;
	bh=lihiiTwPifUcAtDxUq5btFnr9qjxR7ME5vy/TYYPh8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8PTAqNOwtdz+Xg0JOV/7b/JF5yPGUSmfyInefSJgx13Keql+oNZR/44zCekbyT3O3SAr9+gKrHMX+TOgzzncIEzuhi67wA8SaH9cDxYXzDj5MQYJ4qeqhCbitEqTLN5qJft6R24WIdQKOAn2+noNm8vs2VaIUomN0pSJ1fqPjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrxZ3reh; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50fb1ad3734so25876991cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649448; x=1778254248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSbjpL7+FS6L/5F7be2H7D2Bc6xGNNobMjYaVOSt09w=;
        b=IrxZ3rehaIOyFYFYa1HkvWu6k1YGC+z+JopwK6654nUFZbS3WlhWRsgAu5IW3OEolH
         KD4RULZO1vIxm06jm8FBG0VqieeXQxWxBXEDOYNEWx65Mbodl6No0huvmh9r7djPMeUC
         CzFshOjSvEm6g7dazL7vV7zJe5S1VMNVA79taD2of5W1w1lM5NPntZNtJWKNJ3xvsrVI
         XE+UjsfFXqLWanMU8t6Zq+JSRij55CqvnqeL3j80JZibA5Gq5CVZtPNJ/WhOuv1EPl+p
         pUBUC5azI3DnGmPk7u/lu8tIa1Q4Rcj9Vs1erlfAzxZsUUHpbBykEN4CXmKkkRBEIzZp
         YHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649448; x=1778254248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VSbjpL7+FS6L/5F7be2H7D2Bc6xGNNobMjYaVOSt09w=;
        b=oVREHXexB/7DhUJzss+B38pIvEvlZhCbNsCukpp8srFxDxhPmZ0j12zWO/nQPCI3VF
         XbUwcYKdKLDAM3lemRA0IjI0oI7y2C2UeH0NxZjt1e8q080HK3NFaUHlpwSBYSZnY+dG
         4MhHGOkNX4CI03H31M+dQtyYeYb34lYNsh0bfi5cvp1wdxN6gi/gu9LBymkl8Kfr91XL
         +OSoKrRUIIsSyoDVeKkdIjIHw8i/Jo16KCz9L3et5cz1hz6Hb2Ve76pxDXuuUrw0SsKP
         bQ2ylkNcTeiUtmYLiZouy11WDZb+eZ+S0lYJpm8BrSRUrjEVept1b1HrpLG9QUejAWGW
         /bwQ==
X-Forwarded-Encrypted: i=1; AFNElJ93ccmfDDYUaDKzOjLu0lRwbSDoGmwvhXEIoBJxfe6vDUYP6ANNiyjv1p3eG9mmbef90lpmQornx4CyXrPg@vger.kernel.org
X-Gm-Message-State: AOJu0YyAW/wZLukEjgxP/Xzs093f2bFvaW29KDRF9CjRonhurKc/q5bA
	Angeug+9XmuNMwJdkPcvvvQ4WO8L841qxSZAIA2P37Lv+P09JgW8kL9r
X-Gm-Gg: AeBDieuNXk0v/ViMuvotlNsfJt8nWIW05KRtW1BqKlxasD/A30NNFeGSFSCEtgY+BWk
	0xBWZKrXPAEc2rN1OCBzRrtlLAhKRFL+zCR8Gfg4zLs3gn5Fj+/6LPWKWYb+w3jAW6/Cwk4clEM
	k5XkZzfDFduCqbcXBCIpHYDeOT4K8Z8FRIgrmuIEu3ezPz9C7/t5IuQ99wM2gEk9nGxZYBvhM8w
	pFckF46140YFTQhjJu3DCqrbn/uPEZVvXhqe5yWLmdSar3SKW+rAfTHv77H6vZKtTeV7SKCy32E
	7r2OsVN+GTx1eVlCxDwUfuYLAS5mCzKTXXeMCRvHjEULKfjdyMvALqVKLstyYvi0Ubtxf6WUb9i
	WgSeDAaG3IzFJUWTujRZrX7d/5YuIfRTVkqIt2ZaAgfy61/vzNJPZdn/3GJlmQTU0EoL7mFvjbJ
	aYITZYVJgKmw9hg/PAfIALeBOrPSuxYg2n1S7k
X-Received: by 2002:a05:622a:5d11:b0:50b:2dd5:2be with SMTP id d75a77b69052e-5102d0f99bfmr68786081cf.13.1777649447924;
        Fri, 01 May 2026 08:30:47 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51043c1b8fdsm11833831cf.6.2026.05.01.08.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:30:47 -0700 (PDT)
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
Subject: [PATCH v4 01/15] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Fri,  1 May 2026 11:31:14 -0400
Message-ID: <20260501153128.8152-2-mailingradian@gmail.com>
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
X-Rspamd-Queue-Id: D37DB4AD8BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-105489-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.992];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Nickolay Goppen <setotau@mainlining.org>

Add compatibles for sdm660 based soundcards.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
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


