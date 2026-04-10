Return-Path: <linux-arm-msm+bounces-102596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJLuDhCo2GkhgggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:34:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A83D3626
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F00C4301BF57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680C23A3828;
	Fri, 10 Apr 2026 07:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BUnQP3Zo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4978538B133
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 07:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806298; cv=none; b=kUCuipPFZpojHdwqRltdtTDHW0p4PA/bZAcfzwfvOvvEgyotHiAdnTPkO6wDvwTpjFVqu1St0kyU4qZ2TBhHD1lKTEiLr8faMau3RdD5Q5xDoxTMtMCMkKhblLb0OFlSHtvmyii2DMxXprmuHL1T0JFzSp35DiXP0/wUCeuFGUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806298; c=relaxed/simple;
	bh=tkPOh9suv+Ph/NP6Bu3BjsLgITZxnb0+dKSWRPPu1Qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IKguCaeUnEtpuEk2T4G+yCHaBChA8FK0rJ5AUpj7iXLCF0m4xg4r/pO3G8etEIlOK/iz9WPqAGqO+wLC2uJ6CE6aa3oFCm1cQsuD5rdoyGT3DJ2fGh9k52x7nN14FCCsiJFgPZmXXLUxdLeYTUu95AXDn5RqbANfJotDXukBdVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BUnQP3Zo; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6708acbfb85so633372a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 00:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806295; x=1776411095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3fsUR4mnupvB8/aouxbwBgwEvITDdKkDUtdFYBqOHc=;
        b=BUnQP3ZonzwxS7uqKSKzT7PWpNm5oBTnRmNOur4NwCtmivhYe8+pwFMOvlGDmIjxOQ
         5P9UlVLAqj4CphKRlpbQabQ0pBVih+HIi3eM70VygOUI7/hzNonXYynuPL5HSXBADmPW
         Qb9RL3axM25bAVqIx4aOLRskovcj2Hwk8bsUCCKHy15a4pfu0F8+NJr+AV2JayPZBAfX
         9HUn4Ze6TXuZ23xtDvujyOoRE56LxrE2EDg/HRM1zq2ab/zlBVtKrk7tnCMssWBW9RIY
         WA60oIWgOPC8UQO+4b8VHVDzalFCVQgaD0gQ9B3y9uaS5axzhLIDxA58ReILOb4P085X
         9vRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806295; x=1776411095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G3fsUR4mnupvB8/aouxbwBgwEvITDdKkDUtdFYBqOHc=;
        b=jgV19A3VMk+ZkfmO+hWVw0HRM/4fZefEd2oOrW2IlTAZ65oMSpTe8+l8nhh1/bwKeK
         wRAatxbCTKoOXI2qVnwlPfyeltEO3Ii53ayv7kvau5QWdzEaB1AFYm2YTP9GSpWZLXN1
         hlECSZQ+fw7mXrbWT2mUXwuwMr5e4DbyTgp8C3Lok4hFKMLeGzE22uGnt/l3ufaCzw1L
         ZaJ3c9nvRlGcXYXtgGK5ZvsUUoafTwGx0/QQ5BMWFeAAF4fNY8Pwn9HO9eqHp1TW9TN5
         Vdn0I9f/+IbUSAsH3GTCHcSW4lc6TGyZ7breoatBQOG/eDIItCs0lZGae9fLGLPmSz1N
         brgw==
X-Forwarded-Encrypted: i=1; AJvYcCWgSMd/5DQZ9AiH+QNFPHxrUYrjSngGcsfingkKzcVqwnbR/22jlM0vE6DZ31JGSBevVl6U8f0ryRw6m3D6@vger.kernel.org
X-Gm-Message-State: AOJu0YwqsgcsolP9lnIj9OLmq0fqS+qZ8zNg2hzjvETEpg/YnCmK+PW0
	9mED3TdLR62hfRrAXaqbHZsG4TRPN1aIU6eazcWKmQakyyW4X/fCkOco2YHLmsRvNAY=
X-Gm-Gg: AeBDiesjHGLVARU7bRJPKhg/QbjNigjtOLIhFLj92ND+t03Hfsu1Pgxft+m8LarKTzs
	UrK81fztB2a9l4YMA9YbNCBX02tDMwXqLFV51i/3jTUjEp2adBUFgWvq/fB1mHs+gwi+Ajida0k
	Nb13YfW4YRUQMtbbRv32HOw2NByTfSODTo77QyGI9MsU869hvJcfd033TJSjDHi0bZfHHMT9kNv
	vTE8DgM5sQbUH5bBdeUPHo2N4vlB2fOyx+4v4V5z8SdBLNH6hx3Ov1mHiRtcehncZP1uof37g/t
	e09389QoMxANFDPRBdzimN6btvHkAvbq3IPqe8gEdL+AFAPoaWyA0lpdVZ/PqCtuzhIsQtZ/9+y
	umLmU4Tk2gsqoLk6XtilCcrSwkU73/9D5GvAUH5KSbMraS0AXDi8uDuwoDN6Aod4099x2TxQMn8
	wDsqmVMcLL+GKkly3qz8tkpxenMlTY7xvSpO/iFcSQkC3aE+n8tLKPmBLxUfKFv9DJSl/6u65Sf
	w7ScQ==
X-Received: by 2002:a17:907:6d1b:b0:b98:8e42:95ee with SMTP id a640c23a62f3a-b9d729cbb95mr121173566b.46.1775806294635;
        Fri, 10 Apr 2026 00:31:34 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670706252f3sm365513a12.18.2026.04.10.00.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:31:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 09:31:06 +0200
Subject: [PATCH v3 1/2] dt-bindings: sram: Document qcom,milos-imem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-milos-imem-v3-1-d215385fa5ab@fairphone.com>
References: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
In-Reply-To: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806292; l=774;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tkPOh9suv+Ph/NP6Bu3BjsLgITZxnb0+dKSWRPPu1Qs=;
 b=F+NUXlBrW+PPfsNwaVjZbDJTAQnbAlz16g4OOgr4LBCzuYRL/9RvYgSAsOpfQGu/+MLzAIfh+
 F+yPaa9U11oDLIxs21F+PUDFqGkAuJA8goCbn6GYwGXh8+3/Hnl2GJ0
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102596-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CE4A83D3626
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible for Milos SoC IMEM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index d9a1da12dc66..d5955fef53a4 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -35,6 +35,7 @@ properties:
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
         - qcom,kaanapali-imem
+        - qcom,milos-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram
 

-- 
2.53.0


