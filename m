Return-Path: <linux-arm-msm+bounces-98659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHyKCreyu2k8mgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:24:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9172C7D52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E31DD3025E25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6183AA1A1;
	Thu, 19 Mar 2026 08:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3yqK2n+5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A313A9D92
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773908614; cv=none; b=cyIwF9Ejd5zxT1+44O0CcTIbmjrgMyOFCIVTa3IwQRhMAqR/CNsqDaJ30fgI/LO1u9tbl/4X+KXTyDoDFKZTrcUd2s9a3glfOj9pUnCKZo6qknfKZ/0A6w7x5VRxRBW0byTU3b45ui+3p0dtIassDnY6lQE7UCc+PsziU8WkV3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773908614; c=relaxed/simple;
	bh=fdpk4MTgCCFUAQt8nrxbOj/3thQKl+8AmAg215rAl9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JjLNXwXSTuHPsCc63AvsMZfBsfDOpxGj5gU2sj0gso/mu2/9c0HVMSiGD016PEsknvUbYPqskwgTQyseIsj4R0+Ny2wyGE+v8/cu6jBu9JQDWzDRBZUlKRPS2AZWo8Y8Ctlk7DldWg+Nq/XalBDC3ieNc/ouqKLWVJey2oqJS/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3yqK2n+5; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b941762394aso46894466b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 01:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773908612; x=1774513412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XRA9gX/8dteqw2ACYowOiwX4yv6N0Hjd2tp0wHZbVY=;
        b=3yqK2n+5GgRRTfO9fW20WsuTaPeRkXJrvevTdIkIVX+R/ZY4XSSqXWm6xn1TRJCuvG
         R4s9QgiNlMJIB0AksIp7dRCRH8YXCqNn/5bQwZLTGxUb0r5IjRL2y2RDRPQu5Ln5ujwb
         X90ffgOK2TCK+ua0wehpzI9xAAipewW5udZs+PjSpLPlIFMccwmAinV2y5etgZfWCdDk
         R3lHyU5dtzbVhOHJopqu2XOiP8ygvrcjFSHeupwmYgWvO+BJ9XhQHLCcJgfAIoF5J0ZB
         TjXtC1uvD8IJNjneRt1iRYCAXs2pcdCTefafFgqql54o1pxMIGOrGvLhwszfJRI33qxu
         I3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773908612; x=1774513412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5XRA9gX/8dteqw2ACYowOiwX4yv6N0Hjd2tp0wHZbVY=;
        b=GpeDc+lNR4mWY/VuLBzf2gb+ne/23LWbsDS9HuO5Wp85020Pandqo0GQrFxP4RgAf0
         xV8S5S1NkeuIgTF0V8CV+DcQctUzig1cSHPMYtKsbgQ5l2+/eZ2SgLQqwN8k5R4Wljq+
         yKj0AaDyys3Y31BVaMPfo6cF1bBBNgBlRQ3IPIJ6qNYMKTF53qy02bgkW9gMsm5c+pUX
         qP/ycUl+DAil2W+JlXjOxSu/K8AniA/kipcugIX76pQQQZiQ+pN3Mx5PXuZ3qsCRVVfq
         S6BRg8RiqkfSdJtFGDVvjiwjG2qUsAuBmwOL5inx4zbs1fp4RvLqMn9/CekyWTiWbGnv
         e99Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQ0uysLGvfFfaWOovykhZzKY19XdnH/5rZ6STEmW6Ipk9zjutjDfWgpSmS4Ax+cP/4wvxPTbajTPM9dnC9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy14ic5Nf7hz3WEYgMhp+coTMX3enAQWltnQwwL7pEBucVO54dn
	fagy7xyJjiLjSCNs7iRFG/L5FJDcVTB9+A4nve4Qg4s2oCJ2sWjVPXFOnq7dLGr3dJ8=
X-Gm-Gg: ATEYQzy50zrwkru8qNV6zatQw2/uVVxIAywK2U8VVEFdcVctNMrskOyQx+Y6hUF7Wwd
	z34Y9H3P94t2d8F2Fa4jSJxiF3YD+mSn4ZvYN4zyphLiaZl74aTST015tG9lpMZo/VjitIL4iB3
	urXSB+MQ8kq7JrwzUmRoQpVSbN1++qdPaF3OQdA21Rd9ITimqDOlOkQc9DlHCXGejegpO3iudGv
	OOr3AekFmu5JyQIZlnUD2rCOw5kz7PnbXRJX6Ax0uqTQMPOjkc5V7ExFLXzbPCm0J6ygj7rLEam
	gv2muc1PtNkol3CWsWBAGEn92EQRZk+ttRZgezkWLelazt+Id2hyf2gzwCnHYGDcfD8l7RLB1nX
	/yg6oTxH/x2ko0tlm1w5GZbG5SUXW3VrXiIzXVc3LhaiSaU8BXR8LM8UFElDvpX/7tXPRxoH2Oh
	hN0YkKAgX3YFpg7j6ok2bBuO5NbXEfj/1IAUszaPU8M+NlJlhRHt12Rb5iP8/koThGlTAUdMVPY
	+kLlQ==
X-Received: by 2002:a17:906:c145:b0:b96:e593:fd1e with SMTP id a640c23a62f3a-b97f43498bbmr434848766b.0.1773908611741;
        Thu, 19 Mar 2026 01:23:31 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f142cf16sm419743066b.20.2026.03.19.01.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:23:31 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 19 Mar 2026 09:23:19 +0100
Subject: [PATCH v3 2/2] arm64: dts: qcom: milos-fairphone-fp6: Enable UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-milos-ufs-v3-2-b7c60bdd0d48@fairphone.com>
References: <20260319-milos-ufs-v3-0-b7c60bdd0d48@fairphone.com>
In-Reply-To: <20260319-milos-ufs-v3-0-b7c60bdd0d48@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773908609; l=1152;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=fdpk4MTgCCFUAQt8nrxbOj/3thQKl+8AmAg215rAl9M=;
 b=8Zae//PUHJFF0FJtN23rMqKFnv3U5ZwaZiUdM+BkjrJK2hnabwXyI5noSUczI2b69uNN7bqca
 MKm9nmD8uA5BB38IO32+LqT95OnEDWrcBySaVQLBzCSJq1u/Dunp1V7
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98659-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 6B9172C7D52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Configure and enable the nodes for UFS, so that we can access the
internal storage.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 89ba09f48491..bba327cc7a38 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -838,6 +838,24 @@ &uart5 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 167 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l12b>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l5f>;
+	vccq-max-microamp = <750000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l2b>;
+	vdda-pll-supply = <&vreg_l4b>;
+
+	status = "okay";
+};
+
 &usb_1 {
 	dr_mode = "otg";
 

-- 
2.53.0


