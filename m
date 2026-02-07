Return-Path: <linux-arm-msm+bounces-92124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONOYEBEYh2nBTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 11:46:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E85261059DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 11:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D3203016495
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 10:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCCF33557C;
	Sat,  7 Feb 2026 10:46:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57C52D8364
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770461180; cv=none; b=oROxNFXEzM8qKj5R/a4XSfh0+T+gcPr2crACbOw0iYqX23W1nYllk/OvL3oQieouqDLikFRxjcExkCUhCjNCBaEpig7xK+TCq1zLvW1uFn2CndBet2MPb9kz2PwFmBPvDrcePQUrhGFPsCZOZ4CfyuzRIn3ECX+5Nnb79ZWMXrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770461180; c=relaxed/simple;
	bh=kCHwkn/RN0PJ0M1hvmZXwDCQNEJAD+3pU0BhvjJAO+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UuleMw6E2PSZGpuPwXyRmYYuDV5SMxvbuc6NTu25cld20Q88ZMHNMzkII/LxNhZIOouwilc3u8y0+6H0i3n0nMiHLWdb+S3x4i4zUZSaJFW8q5g6uO8/sgcdjGrgiIH1L/2lV4Gk4n41ku1jDgdlDV92n/cSspCSl7pvg85yw+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124afd03fd1so2160380c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 02:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770461179; x=1771065979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DidoTwHjLDO+cGvfBuo1SZy30ZQOYShqmYXSF7ehSWc=;
        b=Qu9gxtcxZ8kOMrFbCXQgxFO/7jAwSBWRYrdwXXj+8ZBCRKSTxTbgmr+vXOrdpgcuF2
         zXyPDrHEqpP8N5s+sNQlkG8gt91h+kKTf6wAXMYD/nvTaYOFRXFztjb1DUqZrh1aqSuQ
         jW/OY0dlY27X8OpVVP+1uSejcfRjO9esqF1aG6ZYZb6HpMwixYuTenwRvqZNpCQIZ1dS
         XW0Rw0NS6Zsi/rRGvgGpjS08c+E5h23W0GOeD6Gjh9xGYsLXTmj2+E8IMG1XTHqkp7XK
         jInX5+PhNJ+WnO/creqA13wllNkFicfW3CI4LOBez792rX+g4Spws+BGqDSU5coVeQ6q
         yU3A==
X-Gm-Message-State: AOJu0YwwFDHSfTWyv5XYg2+r/pM5CmXBJsIoQeeM0S8+owTidRxWoGNE
	INeG91aQpK7iwXP06KNqreevjV9XaPNUvAlbA7hA7qj/gliDGnTzakYo
X-Gm-Gg: AZuq6aICVwavqJYKh88Jd1OYjQuUz7DpNLvEI8XWbtRVQHo4C0a3FMBw/K2ZNlUT/g0
	C9S1/ZaoBAJOdCApXMw/vLvW1nsWnxTan+PuEKq+e9X3VrTa+3WRtnS2bWJU1CuAmwxQ7yBPr1R
	CuXMyukF668E3PqyDXiFBAi8P1VCUyiYWCmjCLdRlRjsQNDJxmrEToVOnoX+NyZ5h36lhpYKAvH
	r/u1Yv/GWjN5G0xtyKWw9QB/nA7CDKXpTM8WXZQP+HNlGcvw+kg1kP1Tl6R2o/0iAB9iCOG2MpI
	UcZCSIpyxDYZ6wI3PYsrKVTaHHX2lYWycN85tchqXTPbf2FDHAumEhOvdOJVrMPpeMzfg7DIu+X
	vi9tT0PQ/0Y3G0MakLWgHycrA96mXEolHXA2v4NXYOaerquJI4o0SOWLt2E6Otb7dhxo41Jkxub
	nRqUQGa6k=
X-Received: by 2002:a05:7022:7a6:b0:119:e56b:91ec with SMTP id a92af1059eb24-12703ff203amr2433630c88.29.1770461179002;
        Sat, 07 Feb 2026 02:46:19 -0800 (PST)
Received: from localhost ([76.88.4.82])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2b855c3db30sm3465539eec.21.2026.02.07.02.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:46:18 -0800 (PST)
From: Roger Shimizu <rosh@debian.org>
Date: Sat, 07 Feb 2026 02:45:26 -0800
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Thundercomm AI Mini PC
 G1 IoT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-next-20260130_rosh-v2-1-548bbe0c7742@debian.org>
References: <20260207-next-20260130_rosh-v2-0-548bbe0c7742@debian.org>
In-Reply-To: <20260207-next-20260130_rosh-v2-0-548bbe0c7742@debian.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Shimizu <rosh@debian.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=rosh@debian.org;
 h=from:subject:message-id; bh=kCHwkn/RN0PJ0M1hvmZXwDCQNEJAD+3pU0BhvjJAO+c=;
 b=owEBbQKS/ZANAwAKAaR4aw2nAzSoAcsmYgBphxft/h3OOHMFW9gljfElGy9LYa4VrVK5A5HF9
 ePHSVOVqFGJAjMEAAEKAB0WIQQKMq2+gDmb5xY4WeykeGsNpwM0qAUCaYcX7QAKCRCkeGsNpwM0
 qNGoD/9MykzfzTLwxEQDBdQDKTTdpom+Ii9m03vpq9YX2jd9izb95KZkmhCos25c28qlGWdap3k
 aklEW8FmnR0M30kAED1CwvqhOdXSeIUNJHE2NwcUnsclWFpL9zzy2KmBwnxDWuxYRWZpTFV+UBB
 NkR2amB4cghiQqolkcRsB3K/PsScPGcKMWXUY21v/ne99dQNn29w5KRm9M1SwhXrMWKSrivv7kA
 9sKg4MW74PZSdg+7DjN6+M9n1j+JfMtlK4U23Zki7Wj4z+mgSkG41/+hFq4qrmpEGft211urPyn
 Fz6U8M9x6CxdSapYTlx199lAKSyerXdCSgjmREzhipVZQvGg84LMr2I5580YNgjL7eJ5mKsRB5F
 MpcxY93rj/FPouddMPhxwPeyXXF3lmyuOASXhKqC07bwyioj/iBmvLS0YcrkPpFXwBz9EVjgysQ
 JKnvL/49+n/rIKnNjCCGvc8rwKi1xPA4TpDuQBXxXfsiu3w5gUikAU9NzBLj4Kdkrm/D+X0HPNc
 EX18+KMreWxvN2rgb+JoJCfHGLVpeGm+Pug4B4xv+9A0DpJy4Hr5KozGNeMFzSg+erTD0x8sMlZ
 ldZ/rRpRG/qaQnH+4AxTlOwHJCZuwa7SWxtZwJ+aW4foK0jKDtR9p5gFDAKcmUC0sDsrA6z6Xw8
 KGq1uoQLC+/UjDQ==
X-Developer-Key: i=rosh@debian.org; a=openpgp;
 fpr=2FAFEBB52F5F5DCE5570D2E66C6ACD6417B3ACB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.902];
	DMARC_NA(0.00)[debian.org];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92124-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: E85261059DF
X-Rspamd-Action: no action

Document Thundercomm AI Mini PC G1 IoT.

Signed-off-by: Roger Shimizu <rosh@debian.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc42f1a90f76a020753ae4daec8c5ea..ec7036cd5042b6cb73cb1794fd01be8fdf7f01f2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -360,6 +360,7 @@ properties:
               - qcom,qcs6490-rb3gen2
               - radxa,dragon-q6a
               - shift,otter
+              - thundercomm,minipc-g1iot
               - thundercomm,rubikpi3
           - const: qcom,qcm6490
 

-- 
2.47.3


