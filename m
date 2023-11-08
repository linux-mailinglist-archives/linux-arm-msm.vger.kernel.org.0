Return-Path: <linux-arm-msm+bounces-202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2737E5CB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 18:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D03E9B20F5B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 17:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9466F34CFF;
	Wed,  8 Nov 2023 17:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="cfYH3ytL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CAA32C7F;
	Wed,  8 Nov 2023 17:50:39 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94042100;
	Wed,  8 Nov 2023 09:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eU/mtFa4CZ2Hfx+fPS4t972cA2PqqdiwZLAPO4HbVfk=; b=cfYH3ytLeapbmR+Qkiwj1TBJl1
	l4tfeVmO2bMxotWWEyNzWf7X7+dF3HRdf0uZU1311ZU6BfkFevl8YaGk4r9SUZVIkZvjIbp2MzlTC
	96txEvldh5eYCbw+lSoyUkom8iYWeMV44twkJHieiHUCGjVxa4KHoW+iBoRHMEeSdbxBV7GOu35zf
	KAlYnsNcnVtadM81xILnDSkLHm76OVMKF5TZvYM2NLgRAWnyX3E+yxm2oUPyhHAcZUkFxbskQr04X
	d1DqmiKsCxn7hTDBJto77l+k4VLrOYyP+6WYbTV1Lv52WbuRAjKMf5JzF/pd+pKc1lxokzz86ymbb
	gouPbnXQ==;
Received: from i73190.upc-i.chello.nl ([62.195.73.190] helo=[192.168.68.111])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1r0mhH-000vX4-Qg; Wed, 08 Nov 2023 18:50:35 +0100
From: Nia Espera <nespera@igalia.com>
Date: Wed, 08 Nov 2023 18:50:29 +0100
Subject: [PATCH v3 5/6] dt-bindings: arm: qcom: Add oneplus-lemonade(p)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231108-nia-sm8350-for-upstream-v3-5-18a024b5c74c@igalia.com>
References: <20231108-nia-sm8350-for-upstream-v3-0-18a024b5c74c@igalia.com>
In-Reply-To: <20231108-nia-sm8350-for-upstream-v3-0-18a024b5c74c@igalia.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Vinod Koul <vkoul@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, Rob <Me@orbit.sh>, 
 Clayton Craft <clayton@igalia.com>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, Nia Espera <nespera@igalia.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=826; i=nespera@igalia.com;
 h=from:subject:message-id; bh=lLBKdDMyqz7RKblbrJZiq4poQMn1Tn/kGyZ9WCbn1R4=;
 b=owEB7QES/pANAwAIAfIkzsI3VuKtAcsmYgBlS8pkbxfNnb9+wiCreUpgn7nrQu2uJKGLaNEyn
 mkvBwy5tkiJAbMEAAEIAB0WIQSBPDomug3slDJEnubyJM7CN1birQUCZUvKZAAKCRDyJM7CN1bi
 rVbdDACLv0JR/4COyeb2Eq8egBJNXUSJGyGcJPSlale3yMHqj0ex1RpWSXWVlGzpGA9vs9ZZngM
 QcCHtuhxpzfx9/KUFbL+QG4wsheqmjWMiEPlns8roUGhUkz8so3jLsPWPWdo4QsP8TbStnsvvDc
 v77uKmXc/x6vnH4StNntyVpD0EhVYQDFY4meESoHDsn3N3nywvfBCiS36mEOUfsufu13JO/CYjU
 GtXpRW5lRGd8fY9tooJaImT0cU+CnUPPblte2ZNuNF7HneyzDIELwk/8tMfitKBST20rC6TsvX3
 bIiXe7zp1M3RndZ2PQguSKjuSC+KH3jpd4wiaPGTdoHIC/h8OeTYH4AXAMszQsEusmlsYz4D/+5
 p8rSVcUjHWIqUT8YQfnWVnp+tDWErDUhv+cOVY2zl9/sgEqrBQjzbGDkUYw0K4wSdOjncaVoeud
 Lo0nBASp4RTn1wn3L3Uq4vR4gjpfB3VZyhK4iIs2L7P+v9LN1BU0Lcyz1C4X2M3/bw3lg=
X-Developer-Key: i=nespera@igalia.com; a=openpgp;
 fpr=813C3A26BA0DEC9432449EE6F224CEC23756E2AD

Document the devicetree bindings for oneplus-lemonade and oneplus-lemonadep.

Signed-off-by: Nia Espera <nespera@igalia.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index adbfaea32343..a1e7a9e8c6ff 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -972,6 +972,8 @@ properties:
               - microsoft,surface-duo2
               - qcom,sm8350-hdk
               - qcom,sm8350-mtp
+              - oneplus,lemonade
+              - oneplus,lemonadep
               - sony,pdx214-generic
               - sony,pdx215-generic
           - const: qcom,sm8350

-- 
2.42.1


