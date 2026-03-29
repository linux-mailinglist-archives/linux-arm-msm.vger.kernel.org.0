Return-Path: <linux-arm-msm+bounces-100579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIvZDgmwyGlRowUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 06:52:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D981D350BCB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 06:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD9D7304CCD5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 04:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFDC284B3B;
	Sun, 29 Mar 2026 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqazyhMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AECF26FD97
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 04:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759718; cv=none; b=AQZPoN0Ewaiy3ABCEQFQUqA5VJIePW9cDVvGQ1uxyB5ion6FeeAsA+8WPLMBqXfah7op5vKOhLp41EmzisiPETrQ3c+p5Lc8BhZqRPdnnfsphQDlplWOZEEP76MUBH12SoFaJ8GLMBk8VNy5mYlH9CBvUFVkRh/8Bm4AFiqMKk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759718; c=relaxed/simple;
	bh=dSmdH/k7eoOG7PHFk1pjfGKztHp9W6X8Whf07jDQ+ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z8V1LgTWuhYadDiATzXSZmqICmFgSd33iVt7EboecCvyhJYUPolkPmBHoQ1ND7RosXcHdFg8VxcQ5hR/GMt22eZ3P/s8omk+5qKtMeGQ3J82G+Z3D2slGgiTeKqzWqJxIpm6PaDUIQ4lvbj4iNJWILjxd/+1tHzZ0aWDvOsEK30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqazyhMS; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c769e72512dso31811a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 21:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759716; x=1775364516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PSFyUSbDPbuxXLaZDXDANomGT/xjqWL5i9LiQ50fiM=;
        b=DqazyhMSxWigUCEHuBdJyHc2ezmc+/kmxcKmhdhJiEvMTZ1S1QkMLH/aiMjxnC5PBt
         WV39dFR5wGEccr3koVzOyFtImKlvlbPkJPYmqIbD6T2xj7OOIVeVr9f4HKvNDN7DjSYs
         NmZSwaYPPVI5okyCwv8JyA4jdQpbwdXUIBj1gyPbxtyC5r5ZmpUe7A7/wZYIuUMEtCqa
         jq4bIYElXGn9zPym4NC0sowxOClk7D7TXT56sMk5pQ1HKMOpLj8GbOAu0510zaNyFygo
         Q1I6fNyg4aQvgetl/t6rWVsqsxtSJuKn5Qral42mZi+GLEYXAOU21JaIWa6KKi0sfx0m
         eF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759716; x=1775364516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4PSFyUSbDPbuxXLaZDXDANomGT/xjqWL5i9LiQ50fiM=;
        b=Y43WGrzWUx2GZi6Yf/lJgHPxrL9/c+rgEUbH7yNu7V/H+vKZhDAgHQr+uE0VUztmAn
         D5e5ZfDhxHE3NggHH9840TO2ix55UAEZub5cjggSRyulfNfCz8UjSA8IcvhBpJOKk/LI
         uhw6HVJDV/w41VIEhBh909wo3bt4AMnpqxhQ5CU9PulPxe1WSUhXyZmi8YitdHIxN0oC
         awszLxfOP4uZhC6RLKn067+RO8aoDwMJwAdf3CBkk6gN4WZOe4+KZXj9caCNiTRQFfvh
         j4weQ03ibeBVve1yXxGYc+H29JuGR5TDLrgRmsK/Iru9a/DDVXDJ11APhAJbbW4fcxSQ
         SY8A==
X-Gm-Message-State: AOJu0Yyfvj3f0ilWhwkMao1RmbUsJoL1v0bGdYtqf4EDUzL7flnQU+Wp
	qS8Glk7H1HG5/dY9pR3O5sUF6+NylWJoscusb+uD12HdiyvJZ1+EaYPp
X-Gm-Gg: ATEYQzwCpOY3oJaeURnreUqLq2Va3LVwulWeeZej82ZHOpz0AiC97mFDRQUIM+n9DYB
	v5gBIHZrTfbIAes1F27v/8gdC+2mbe0GHMCIsDNXPUe6yKp+sQfPqK7CUoAtS0QvciaiBduEzDE
	IQcugUmCUITdLxdRempL+kCzSP8URxGHWY+3tITUNpeyHVV+KI/zgEpB/OwaBdecB9v59l7Jpnm
	NbfLSS3+at4AldbM5l2LxFBmPSX0YJsC5G71agb368inYE6cWQG2VtHHWtLdY/2p28Yz/m5PGo3
	AmDeuaPezs3X5pj6jL5qMpA/He1UBVSa0Pv/DMUPP6hcWGhtnearZ8PfAjxzxV6Bg9oh8pE/9Ws
	sBDmkT4X0ZAus8VsbXktu5BhWFD7Bf5nYjUx9GBJ0a2tETZROg/BEuUAhKUiwn8ytIY9xQwYSC0
	yBEhP8dCSeR8X5bzSDNsSk+15Stx2p
X-Received: by 2002:a05:6a20:72a2:b0:39b:cd0c:3880 with SMTP id adf61e73a8af0-39c87abc942mr8576828637.36.1774759716542;
        Sat, 28 Mar 2026 21:48:36 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:36 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:47:59 +0000
Subject: [PATCH v2 4/7] arm64: dts: qcom: sm6125: Enable USB-C port
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-4-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1049;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=dSmdH/k7eoOG7PHFk1pjfGKztHp9W6X8Whf07jDQ+ww=;
 b=GM5n8XUOUONfpTli9uJYWckd8fI5avmePflwEDzxTfZsx2RQwjszif+loZsDybWFVSdzFqK+j
 eH3G8XeAlORBqyrmo3sAktIB8cr4uekcn0LEoIBGnm7E5sJG+33BWIu
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-100579-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D981D350BCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Plug in USB-C related bits and pieces to enable USB role switching.
Also, remove dr_mode to enable OTG capability.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index a1a296f90f44..d26ca1637330 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1241,7 +1241,20 @@ usb3_dwc3: usb@4e00000 {
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
 				maximum-speed = "high-speed";
-				dr_mode = "peripheral";
+
+				usb-role-switch;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_dwc3_hs: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.53.0


