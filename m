Return-Path: <linux-arm-msm+bounces-97768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBvOKKNZt2nwQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:15:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B02C293599
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCC763044837
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7134C24E4AF;
	Mon, 16 Mar 2026 01:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5x5hzGK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189F5244661
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623584; cv=none; b=LIYyx4n1zpqNG6ElvQ09UirH+9K/UEASAUb0LgE8IJGmyxZqSvuF3dJIiIbDoAb6+xbcwHHO9rGYyDwNFN5Tb3nxXvx3E2kYV6P6Ue9nDH+DrOq/XniHe/ANjSuPXM/FNrTa4sFxvSKjn/dCG68VHOsDTVM9OPhOc0aqXa6gZzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623584; c=relaxed/simple;
	bh=Kla9z7K3G7PO7JT35vZZgL6VfPtFep7pZDHZTVUa9os=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eE/8Ijhb1kSjAscjdVWDAS3XFIW18+he8GKZDO7JBs/yVLFVQJ1cOZoLfzT6x9ZNTdFth0K6jNEdr0vzm93PbFqlZ3KQRvyuZZhjtpNQ49afEGLMvLf9xziA5FYtjQlsCdKxZFHFEXmkIO3KTa+5pPx5QM5qcbIWPrCHNAxzaIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5x5hzGK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so35137615e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 18:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773623579; x=1774228379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVXeNUgf0taT8KVMYZ+Cr2JPpfIJ6nordAg0M3k0x+4=;
        b=J5x5hzGKrcHiNkiriz7SFhmRh3rAtVqS0vhbjfNAusFKB3h3Dlb37Cr1YxKHikFsd3
         olUXQgd6a6UkPZIlAclhIv2WKe2O2+9psGus9vMkzG6ufE4fR48soIAvm15n/pudijIo
         adkuIIanakWtBUtBvulB/Y0D8C5HRjkFtO8JKr4PZ0eMTOsD+wJ2EB0WHUWtGaQNilJH
         E/IMImTgP9yEuAVa9U3rS8Whwx3xsGvUv44TpRK2FtaKWAJj0Ix8gBMmPBjQfuTRjP6v
         F7z3wNFdHi2ECMUjJ6Z5sfbhqKqhwzeE08EkXI3mNE+jkgAxxXFp1/JfjU2sowZDOgI8
         MmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773623579; x=1774228379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aVXeNUgf0taT8KVMYZ+Cr2JPpfIJ6nordAg0M3k0x+4=;
        b=TfsSuwEpYBmDFazqnjEqdl7R3SZyFLfUBn4T2EMHKPR/BxWKpWw4+4GeJ8HeNBWKoA
         Be8d7nMDADhMcHbFZL+Kv5jdfwxYjy/sM4/DR3/0W/SIKrQA/GP+JD7+wPVtLdRaW3kY
         lExFv0J6P6pXElKFvqCffdMlllPSZCf5cVGnX6zHiFeZqmhTsciVZg0HGwbNhjTochVw
         eAFEUsNuPQnsJQThNjsMjbJubBR9V+8nqT2LVTy3UyKp+6b3o812ygMqW0NJUjnY2TaX
         wMTpdhgH6WNh6yNGjUX3rQB0aEcKXtJ0pCeAVm0RmB/yRysznHoZufcJTP7lB32u2NF1
         zI8w==
X-Gm-Message-State: AOJu0Yxh1fnzxwHDmRHtsvLZKSgXy/5BjE6ew11kEsjDLyLHLkw8UkRj
	yzo7G1rSR7FQBmQEfDE/X+kHGBcxMR9gj3+lAAtTSVnqyOGk8CyYtlR88lFAW+zwDdU=
X-Gm-Gg: ATEYQzzWmV2Kgjp7LE9nbUcTu4kz+LLJE/py1fPMOGx4voGNLqzgSFjyZben7sp3fjS
	XMwh5lKec3xEjJ9duC4mbjntJvmKZDDEj3LrL1gqOQGLMmaZC19V/NQq+fHagHj6IwVHu+Tu17w
	i56RScS3hdn2bCcUGOPlUupRWreAj3FFQgw1kYGPsJcNbNVkPu3ZRt3n8nquAGRP5UisvUqoXlF
	FsK4RQL34//ZWQRB8h/diQPxwSrLSHtVvW3N2JGqbhlGnyqBkfW79fe8Et3QTw0rnFNIVsnSB6c
	EPc3RPmqhcOBy3R8HTu3dxLckzDtqfFKSQbee9MUfAgZWl2ICW3R6Kfmwn9OGy4dmOelJoltlGY
	hLAr2VuO5EVhyZOhMgAwAlt49yLKJt32GdiXyWPii4V9KDC5b2CyXdWrsJa1Q0kx6/6YoAzOsPK
	d+ZLDq6aeMvgmgsESO3fGCYZZGv3Dase+bVao=
X-Received: by 2002:a05:600c:8486:b0:483:8062:b43 with SMTP id 5b1f17b1804b1-48556702d64mr188594035e9.19.1773623579514;
        Sun, 15 Mar 2026 18:12:59 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm560918225e9.5.2026.03.15.18.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:12:59 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:12:51 +0000
Subject: [PATCH v2 09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-x1e-camss-csi2-phy-dtsi-v2-9-859f3fa55790@linaro.org>
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
In-Reply-To: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Kla9z7K3G7PO7JT35vZZgL6VfPtFep7pZDHZTVUa9os=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1ka6QuweJ3/JwPP83uIHSj/eRfiz7o0MJ8qE
 cd9CdOVaAGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdZGgAKCRAicTuzoY3I
 OqVXD/9FCRCtJa9xoF+MiIzXIX4uRuACyThR/0fCAHuvYOmxz0TC3gLcokoz0+RsZRKrqr6NSvJ
 h6CKrf924vsloq0VXOvbXB/uluQuhA00wC2y5t4NQyG+62Z0oiHYWyvBkkNHMc+xQyBidCPpFUM
 GwDzfVGm1OmcK76xpNQA99+l2tNhsLC7na8Qhd/06msJYSDt2BB/DyjY7fncJc1vtQKj4vVZ09E
 VBSwyOXmNgxO7fBMYULjpnLt00QonQtioN9xC2a+PW8pR5Cx4V/7nM2vSGiUVdExqqALewO96TJ
 J1i1TJVRJpNvUgMyo2JS8chmTBJqDXdRAb6XtIk/fOuOwQBDrQO4xuBpnscpdq0lsU6Opmb03UY
 q0V3WvrbcpLjCnmfe3gJLJAdjOF58TnWSf12yDdObzciH20P0XnqXe99/J7zS+2hX2Nlp5Hlgu6
 i5Uxmi/JmMsL0J1l3T4KKzhXEqvdVw59PgYWe7af9CPdzpkabxKVR7PgbPLDMtXRiUTlXdmCVPd
 rJ6J5NF85XCSTmL/zTY1jMivNtUXaIcLWE6VUJMWRzbDurOB8o9zq5a+Xx/sGDGRfjuqL6NCINz
 GxRCsBc/ZglThNHmSqVo/Wj3lm0jp66tZNvwOBEnAw4TsaG2+ImDfROhRkSUetBiXX2ZGPlrm38
 kdZi3KRxma/NJqg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97768-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 2B02C293599
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some sleuthing work by Aleksandrs Vinarskis in the bowels of the ACPI
tables for this part shows we need l7b_2p8 for the avdd supply.

Suggested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index f10dff1da7f8e..1611bf7302ddf 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -552,6 +552,13 @@ vreg_l2b_3p0: ldo2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;

-- 
2.52.0


