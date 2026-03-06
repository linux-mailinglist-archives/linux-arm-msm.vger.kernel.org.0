Return-Path: <linux-arm-msm+bounces-95818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKIWNtvcqmlqXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:55:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 053D82222D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB8423025111
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 13:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9172E39A7FA;
	Fri,  6 Mar 2026 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ShfDxM3L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FA82F7462
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804925; cv=none; b=F+hVRVhbYTPodMEbFL0OeEA5xEb8EA60Nr7OiX5eOrxzWMUYYp+BTZSe2wCeJUc7Fc2RxSB1nVXs2KPXoULRc8z3sggiZxP3hZ4HNWbYycc3kd43/RiVR4m9ZR8xQ3pIcDjiQazbC8TiCne9uEE+oQx9KOm1iLVDAXMAqo881mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804925; c=relaxed/simple;
	bh=1OR1ALE2jVrBKZLHJvIYGf/LHohuVdSZ9p68Cqwcalw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P4ICO7T2aeY+AytydyZTkdytsydagyOepxMPZmcy2S/NFh5a+NGBYCdGsyy2TrmcTYkmtE0cszCP3TBiEa/lTjMfVKrIs/W/hUhdRYmDKZCDvKUcni3eGE4sQwFUjIrFS7YJF05Q8Wzm7LgTKj6t1tAvgtduF1yEMhhdyNhGQMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ShfDxM3L; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439c5cce2c6so3133783f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 05:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772804922; x=1773409722; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KLo34mncvv+zEzucrHcRYMCBDiBVpv66f0nGWBz0AyE=;
        b=ShfDxM3L6Uhsa2K1Z5j/k3byQNeL0hM56ebI+QyIV0I8PPsfQRHYe0k5FLdUx7a+mJ
         2+tNYL3YpJjiFqMl/BkVrJ/JWRAlDfQDECdaIpKeY+YB5ICtG0z5jEUAD854AVohxOZk
         YmGYhkkEMLUJ92n+WrvpCs7KJ0af+UJD4vT5ih9oqzNp2VzSC+llVfowlXiravS0Eopt
         Xtab7hclGZgVy3ECu1siNVapNkchhV/WtaIilhLOOsERIn2Jltwz2nk38KB89dGawRPp
         iUs2WCYi7RyBoDxwsoHIhEk7FalqvEAfX3xxLUQDqigV2d8j8fp0WZjY6XF7pqyeJ/Gp
         Ni+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804922; x=1773409722;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLo34mncvv+zEzucrHcRYMCBDiBVpv66f0nGWBz0AyE=;
        b=IAjde7W2NcwszUryHcrJ2LtYvxKc5+mqOwWqAeDH/4F2V9bmiWUWzW53/zvlfJ+0TJ
         5SXoZvpZ1PrKCNbVYmj3uBBukEbEQ7tKPJHCXeOf37Sq8CHTGlR2LSFHs/aW2vRN7VqU
         ELMtMdK3dSvZZkG8j8JohRL9F9HUDPnGif2UGT8UzRJZg9si0zZSGlsb+++d9WEL8XC5
         wE57v4zn3kjofWK03QOKSoXnZu8rQztnjB/2OZ4PtDZ2XexfX3aSjMI3VR7JsgHEES1Z
         DBa6sIelIMFAEl8PLDPdb/FzvIXPwoQ+QzKRwLisy43cZ/oMIIbLf4VYpQSoep8zf+hz
         ap3g==
X-Forwarded-Encrypted: i=1; AJvYcCXNffHZXdaYMlgGmRNX8qPPtN+szmfDuJB36F945laXwTLE1YpiTx32jLGrSLF8JyzQWNy+6smKuotqfxrW@vger.kernel.org
X-Gm-Message-State: AOJu0YyNQDH51bDPoF2yltya4lIJYaWjozduRxMea5bK71L+eMM2jYsk
	IQ7p+sZp0QtaEPutfHNQWQxP726ZgnPyPEcU78SxGD29DR2yWyTXXTw84cKZUMRyjck=
X-Gm-Gg: ATEYQzwtMZaw7QD+wPDOu9X1QiFUmEiIJhAAgAYKpC9qx1XktnGz2YeOC/dVzZzt9re
	tGIqgRb7/CqX6cCaAOkoAQLxcoU/bZGegNgE2FeAKutTNThBhq3g3bx0pBc2fO8jfjbJqWHnPd7
	K/djIxGBT7rn9H1touQ/P2CQFHLVaovWtZ6jQrnWzSXuAejROafq0bw+113K3Mxr5o0catMbDtT
	IAIQnYTEjG2HIgeWknFMo9TWU8Opzv0eNj0dNcUs5zlizj/HAir4bfEdngbJMYF6fwvzx0AqFM3
	fQHfV5FgB4tddPV1cgAqP1maBkAPlNRrYPwVdyJ4Z3az1bwx6xu5p3lt1yleznLOtz1YtMGD4S/
	xIfqJjLJVOfcjBlrcTYe0iRiMO3TOYEAEPlKNe92P46pU4yfSjl9jlRXe3kVs//XeL5vszIlHKc
	CiWUMfSKqdzAx2vBK0Rs7FKGoFKdo/5DynKFkrwjBM6/fO1/J5/iTYVmBp9UBOrXJChoX0V5Den
	UV+rW7nR/GvFug=
X-Received: by 2002:a05:6000:24c7:b0:439:c5cf:fc73 with SMTP id ffacd0b85a97d-439da654252mr3515918f8f.12.1772804921601;
        Fri, 06 Mar 2026 05:48:41 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8daf2sm4304767f8f.2.2026.03.06.05.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:48:41 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add support for GXCLK for Milos
Date: Fri, 06 Mar 2026 14:48:36 +0100
Message-Id: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MywrCMBCF4VcJs3YgTSWWvop0EdOxDuaiSSqB0
 nc3WJf/gfNtkCkxZRjFBok+nDmGFt1JgH2YsBDy3BqUVFr2UqNnFzMu1bqnLQ4HM/QXNWvTkYR
 2eiW6c/2B1+noRO+1ueUY4WYyoY3ecxlFoFrwb59h2vcvz9r/VZEAAAA=
X-Change-ID: 20260306-milos-gxclkctl-8a8372d6a1e0
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772804920; l=865;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=1OR1ALE2jVrBKZLHJvIYGf/LHohuVdSZ9p68Cqwcalw=;
 b=M06UPn7KuaTC5XklJRqDMhh1yVrVJuyv/h8Op30MNbMy2A5yL6hzG62hBRRaUOV/nHGGRzFA8
 4MgjInTjTzyBWNYS0614zxmx4T4DuzYPPMgQWwBjqw7pF6UMcIB648O
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 053D82222D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95818-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Action: no action

Similar to other new SoCs, Milos also contains the GXCLKCTL block that
we need to control for GPU. Add support for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: clock: qcom: document the Milos GX clock controller
      clk: qcom: Add support for GXCLK for Milos
      arm64: dts: qcom: milos: Add GX clock controller

 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 10 ++++
 drivers/clk/qcom/Makefile                          |  2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c              |  1 +
 4 files changed, 73 insertions(+), 1 deletion(-)
---
base-commit: 755bfcf32666f86ca2a9a2ea2c9dc7eca4c330a1
change-id: 20260306-milos-gxclkctl-8a8372d6a1e0

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


