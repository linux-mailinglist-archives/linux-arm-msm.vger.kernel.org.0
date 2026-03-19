Return-Path: <linux-arm-msm+bounces-98671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCIYNA+7u2mtmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:59:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5281D2C83FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56328320C40E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DD23B3BEA;
	Thu, 19 Mar 2026 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qOpcvy4P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B43AEF27
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910521; cv=none; b=bJ2g3OKO45wcvL1z3BVjV6TWTWTIskmOGfTkUv82HVgoEXhc7eQAiobkxVF+BMIC471qdsMMIQE1fpKkoGSaWJM2pU078gu7vUwx/M+7D+rHTWqXRjbPwUs4ucjo3mRg3U1hssmAAmiKi2DoJ+vRKnjA/6dev1Z8Dh1Fet67AE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910521; c=relaxed/simple;
	bh=4zs2htRN5fDjYf/gfjJ1ytgBtvvSkEHoglb5+vpYN3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ll1yXtb7vBn4yjbju8yS8EMqCKhj+ADuruO24342Om+3btabkRzxAP5SVfMidHhFO1wtmM/UkVHKzYTg6Tk+jsySWF/65WczwSkGfLHN1v3GiUObu4p2AKw/B/qnmbAyH4eVq51PLeq6lKhTnasyXH6jRoy9aOqPsiF0ACCS2ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qOpcvy4P; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b2965d4bso484564f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 01:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910517; x=1774515317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7GEIa3OAsHJyOXA/AHM/E033RW8A4eSsP/qQLiJdUw=;
        b=qOpcvy4PyuYumXY/Q6TMUEv2CuiWVW0e6eMLvYa8EwYth4he3BrbK6fiC77FUL22od
         w8Gw45KCqlp0FBdbfWHCQJwd6P+HcessnTi7MdePCFvJGfg4szTe3jmZifM6eHAMSuvT
         nMed8FAK9IuuMuNrOS2z2PnIYYXpS1CFVawr/ExcvbWrfOlA8k6UuKoH02INB6gQwBNV
         mStyEZs16Yz8PQJNshIOqNcRoTQOl42E8DdNIYhxM79xOwUwmDvLDo6zK/gq6BUsX32u
         3npKxULLsbac9baWJugjwM8fjUUEbFJk5zmZWx1hBWB8WP3yegIxYcO+yCPQkDo502Xe
         Z3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910517; x=1774515317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N7GEIa3OAsHJyOXA/AHM/E033RW8A4eSsP/qQLiJdUw=;
        b=ieBvpWJi9LhSVzF9nCEKyJLcyChiekLV42LOK/GngPY9lRipLyv6U5miZ28994gHG5
         BiOIznthq0EDLh6sC71OKG1w7sl80i2HVAluvP3yq3C7VW3T3WRbz+L5Cq3Q7K/O9tDe
         7njObKg5xDMoU+Mlh+oQTMVri61fTbpBec1ipTqjtPjrr7yYnFvhOyI6drmlXroB6/QD
         1FYUB7xhzR/B1oLUxIOEtLi/fim/69O4Tn2gyEV8s8xz1ocD62j0bws+iiSWB/8PS3hd
         a9CiCat4LrqWCoQoPzhnzsKLReNa/7zWUgumhh2ZOWvEDEJMM5En8Y4o8snrb9Oi3oum
         q3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU34EDCHoJXcDHdSczKW+UgKgwlLQMakbVQjSmpnLDO8M62ZUnoCHE7dE29wSSXQhfn6fJKDDngllz6hoQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQWrxpqu2nB9uhpFNjqUGzdLNSiyi4KeEPeOAUOqfhn/67wanB
	IIk5dWtnrw7VDkP4Z4iaZb5P3zPb8AjjC+FArhX4AujQxAAKaPq37GCd4higEtjKyPQ=
X-Gm-Gg: ATEYQzzg00yRC0i654I6/x/cr5NAw9vUTS3OT6r0JXPN9UZHl6IEtGtp4g6KDaxCf4V
	ugpf2KOF3JhGJa/8vpAXFzUaJ7zrBuDr2IeMUhC/Fmh9Z2/mMbLEaN2h7OiqjHNVmQnNaq/T1/w
	rh6W9pRhIayy6/S4VPr6yLwl2D6uX6s6HfhA5/zTSkD0Q1H//y7l2Z7OwU3qbWDN6G3esZ9IFBQ
	C7JINbraaXA9TccNo57pNB6yxoud2Q9aEtwupIxfKm6vHgDrLyeHqFJMpZXLd9WcT3fy2cx+ec4
	eDzfoTflN2MeGuF43ZFLkUshxzi29mXPs6mdYlreC2lhRZHXPoen5oSZUkyToKl653+XeGLuwFp
	bi6idWoh4R86rXIoPnghn0mAFsLVImvqgQyJpO6UORyzDkhBScGvD93yaaXymzN9khpViTKOR9E
	cLXE7noFF5TWU1noLWG6TTzh1OjGcq7VUWzaRXrQTQ4bM/
X-Received: by 2002:a05:6000:186d:b0:43b:3f2d:7d43 with SMTP id ffacd0b85a97d-43b527a41d1mr10142006f8f.8.1773910516752;
        Thu, 19 Mar 2026 01:55:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518588a0sm23072267f8f.16.2026.03.19.01.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 19 Mar 2026 09:55:10 +0100
Subject: [PATCH v6 4/5] arm64: dts: qcom: sm8650: Add sound DAI prefix for
 DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-4-797bf96df771@linaro.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4zs2htRN5fDjYf/gfjJ1ytgBtvvSkEHoglb5+vpYN3M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpu7nunPYOhTiI99B5Q/bNgHEtHbrjhLdq7ubLUAcH
 lJSCB2qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCabu57gAKCRB33NvayMhJ0cAmEA
 CM/lnQzXzLyU8ArEX7ukS0vkNKBQz38y9Nv6eGSyPOQY0sDW3YmKM9yzSVKIjuL024yDvar2AUX8Ih
 st4dPbKYq+/lFKSSZTLwlNoGFaCptRBZNG94QHR3jSMV6OJd8Dyyb/9Wo0R2euulXJChBmy3OeMNAn
 2Aqw3aFaUku1Sj+H42NVncVW4kCCdcZradlXFKwOzOjBvgSkTDiRPX9Fh0eS4mqeMqkMORmdpM/6ui
 Bs2rwZJeaSK57gYJTod5eitu3i+Rejj1ZI0VzhOFLjYFaU6e0ACxBsETiyoXQwOEe5fJlDkrzgD69u
 fztO+Yt/jR+5c29qszteEBbQX9OrWhv/Kx5smzn2EvTFq8OfE2tmVyXrX1KbSdfCzjSjbO3rjLFueN
 M2NlPQFHujH7X3gdQ9SWa7N0VXFYc42eIyS4ofCl4ZBA48aDyueC+lKX01m/u1dT3+WgaEJigz0T3k
 bcVhyt5NKoUFBuY2IhHd3j5o/2cUiCEBoVLp9p6FxgO1QNMlJQlDLS4l8wV2KUp2ees3gEJY5tzk34
 BLluwcybNLRwOrwrlXkJ7PQogiAG5BAPSusADSPqdfyK0QoQ5XUmZ4R+xN1KWHqMaAgo0rJn6GwHGP
 pf+WlySA0ojDgxmJDj05DSh919K16ItqTM9vtaeCck2t9pdgp9L0V024wsFw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98671-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[af54000:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 5281D2C83FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
controller, need to add dedicated prefix for these mixers to avoid
conflicts and to allow ALSA to properly configure given instance.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 357e43b90740..f172c78367c7 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5905,6 +5905,7 @@ mdss_dp0: displayport-controller@af54000 {
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
+				sound-name-prefix = "DisplayPort0";
 
 				status = "disabled";
 

-- 
2.34.1


