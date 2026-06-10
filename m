Return-Path: <linux-arm-msm+bounces-112423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8ql9HdxNKWrqUQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:43:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E770D668E5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:43:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rJcS84ar;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112423-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112423-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48DD43053FF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C710F3F787C;
	Wed, 10 Jun 2026 11:39:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0EA3A782B
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:39:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091569; cv=none; b=VjYes14iGKGTUZVOIxVv7Ubq2CSir1gFf6SLfRgNQbeXbKOCBvXqqBWBoujlQTMytpAyYJZpp4xCq44CBLDWqtcgimm7SK4573nlE7y3SbQWva/NYIfIoglDjTV50f73L+hvnDvFtGfz3koPlJnFWKLFaov6KXMOun1qLkU9auA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091569; c=relaxed/simple;
	bh=yWzPcHOx9Y0l0sp44ZHSshHjrd7t8NWvm/wcwRs+4y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHcDoiyL27T+T/Kgp1fQSXQiFkT/fy+XD9ARkxdMsy4ODN7CCk8hBjQSKMzucUFYSzyjqrsT9m1Ss4YW6DAwabsZTuJ8kD2gzGPAmN/ThIJAMTGSAOHiiFAKf0mWB1cprXlLVFysSJDymlkJQ09rjnObnHh2m0i/l9wWk09OyqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJcS84ar; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so5174739f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781091567; x=1781696367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=rJcS84arLuPDEGbQ//g6zkTYX8ufd944J15qvPtiApO5xQjyXtn1niYKtlgYqtzDyQ
         XXAlL3T12CUJ2YrrAUIT+Wq0NK7MWMWYE9lHGf9UUPzKlPCdbTwlkYMG/HjeDSyjdH7e
         MtYGsAFvZjOnLiJSL0i9EVM+vy+R8nKm3WlEcpyKacFdeRycJs6fJLXa4VxZMVyXmUo9
         sJIXPwVx7E009a9pAY28DBzTNs7b7E/UhdI3XrJ8EZzFtQqFkrxisCtix99N+GioLSis
         wtsoUXwBJ4dNMX1YTU0VHFcdnTbHANZ338SR7HFJm01/Sv1r9vntm5vvVxhvsIjmtRiL
         XyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781091567; x=1781696367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=RtNAOixFLXcnsQw37pLY8ukmnMPyWynRZrn/pwQEt16BZNQa2pEr+Hund+sAKI4YSf
         hAF8zWq2inDiSgs2iVSVcSYf+wEvgw8wZNlvHLV5nyZqDgHVdIGd1bu9p85ecfhQKZ/k
         HnVSpEPUg5aLMvlmZCBV5syf31AN3uQq5G/uNQJKNgKd2W+Mu03NA9U+bR8jpbTobRj/
         XeC5nt6Ep9EBOSgoWyKtIe2ScvGz/69o7+poXRn2Dth614fA7tC5GOpIB2gTLz5rqxhu
         HpdCW3gOHm0Gkd1fU1E9kDFfW6PWxTaVckWg5feqntLrH4RwZzm0A2FB+IWH7ULe2S6o
         yUXA==
X-Gm-Message-State: AOJu0Yy8+sKkbdR+7JiRF5nSQmPOoziC107xIXFe1wY/MyfX5tWjnRjI
	U5A4fVKmSPKUyW7OUJPsmxSQBimgfoshUjZLuFKQk0rsoqchqhYKxAcfybBiTw==
X-Gm-Gg: Acq92OH3hwI5m66oQB7mdRQWpTmTjIktIxIui6MsZSS+sKgdlDh9BUHIzSu+xVodo9O
	pRedE9LNzxf1wVXsRRriqOrtskWgzhX2c406cwNeJ/rNgX8U9JGb4Nz2h0Dp5dce2x7R41vnKDz
	Gk+eu0bK0HQrFiL1B8wfrhO4UargYrXjMtu2h+4VXI5J+0sEsjJimkMVNI6pYjtq6xn394DPCa2
	xwHdXAtsEpfwa9s+CuzZOP82mCNEwbUXUV85gx5CBK5338n4C8scFaD7aTaze9GMkt49uvtHLMF
	bHqQxjwyvJjP5Ul6I5WtGp3Bwn+YW/vW8XLnNnKOGrU5W1jDav4OM6h8PhSzDOeKeHVV3ek1eF6
	2laTXckhlckzldBDDx4wbBFRJLFsOa515w8QAvXnNplnXAaSEtVFfXI4SG9OMqdAU0tXLdY/K3Y
	cAuf+z0+o9is8osEc3UtBQYpBsVa2ervLi7x6ZJfs=
X-Received: by 2002:a5d:44c6:0:b0:45e:6518:21ad with SMTP id ffacd0b85a97d-460302e0a3cmr27231696f8f.3.1781091566969;
        Wed, 10 Jun 2026 04:39:26 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:7c0c:c5aa:32d2:49d:5951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm68042009f8f.19.2026.06.10.04.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:39:26 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 10 Jun 2026 14:38:57 +0300
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add Sony Xperia M2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-yukon-eagle-v4-1-763d5698bd2c@gmail.com>
References: <20260610-yukon-eagle-v4-0-763d5698bd2c@gmail.com>
In-Reply-To: <20260610-yukon-eagle-v4-0-763d5698bd2c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112423-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:xerikasxx@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E770D668E5C

Document the Sony Xperia M2, which is a smartphone based on the
Qualcomm MSM8926 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..851d1b4d74eb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -99,6 +99,7 @@ properties:
               - microsoft,tesla
               - motorola,peregrine
               - samsung,matisselte
+              - sony,eagle
           - const: qcom,msm8926
           - const: qcom,msm8226
 

-- 
2.54.0


