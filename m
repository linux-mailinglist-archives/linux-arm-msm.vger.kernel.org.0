Return-Path: <linux-arm-msm+bounces-5383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 996F881875A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 13:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE2971C235AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 12:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43611802A;
	Tue, 19 Dec 2023 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ybon5DKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A81F18645
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 12:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5c690c3d113so3406250a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 04:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702988554; x=1703593354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKdUP1nh0OG3QlZNgtTdzYD4n/GWKZ63AtyvI5eXs98=;
        b=Ybon5DKf2tjOE2+YEHXxVsb/KCFo5FqLbkxH7KrbX6IVMEyK7OCYwHL+20MOvrNXsK
         WtTWELuwE3M5PofykpPJ4e728fJKiUXSD5kglfwg8+nfXfUTMC5fY9NNpefOm+zxIrd7
         FZZw3Qq3MkAHlYzTxVj6aAx6XcIta/qMNG9jDLqB5nyIZskq2Oe5nyJ2tlbfLoXS/sqK
         2GmVStpWTSZpD7DNRE1qn0Peo/6TnKlZqboR0y/+FSNuH7qTKrV6BdmZnNdrJx95pTLD
         nD6bnCpIztNaBT7WnnN5m4yL5KYxBpxllMQV9+ynXKLiPsBpXoUTy5Y3/qlgIMXbRibO
         iz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702988554; x=1703593354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKdUP1nh0OG3QlZNgtTdzYD4n/GWKZ63AtyvI5eXs98=;
        b=oNLFEtvLN61ZGwciGWpWxvrijEXlcuZug+haVr4awyEyhHru0xfis8xB2a82KIbIrq
         82CwR9qPlMU12mAcc6BseCiGSCJ441knZxvD5DQ+bqDWwp6/Sz/w7jlRab+as0xKi+Lk
         NAT54dbm4NzjLltWLQSwgKlQEfiZ3yBSyJpDPqV1lQF8IuHMStW8rX9STiK5+v48kLa+
         Rv/6wH5Q3yCPmjhtrCcrYDUeyyKxW1Fws1i7gFXUKY0DtHSvMy7100BlktAzt7JWTMwa
         rZBwmOuK7wV5G5HWvi6lkBVRm23mwASReZ3hC1duBvhwPqpl5V1hYggsISOPydpDQtRT
         tiJA==
X-Gm-Message-State: AOJu0Yy/gVd4hR909+EMcfG9JYMd/UXSODYdiXhBw2j0yt/GR2aYIg+A
	iO5aQdQWGbmNP8TFyVOcNXPxWIWKpwUDWqKbMtfg1WEx
X-Google-Smtp-Source: AGHT+IEnCSZ44/W5EooaigV0HsYtJpRFaKJolYB0qjNfaINpNNu4HwniOpI7lT1JCMpXlsTqDyH50g==
X-Received: by 2002:a17:902:7ed0:b0:1d1:cc09:50ac with SMTP id p16-20020a1709027ed000b001d1cc0950acmr14787076plb.108.1702988553726;
        Tue, 19 Dec 2023 04:22:33 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902b19100b001d366f8cfd7sm7719419plr.182.2023.12.19.04.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 04:22:33 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 Dec 2023 13:22:13 +0100
Subject: [PATCH v2 2/2] arm64: defconfig: enable WCD939x USBSS driver as
 module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-topic-sm8650-upstream-altmode-v2-2-a608528864a3@linaro.org>
References: <20231219-topic-sm8650-upstream-altmode-v2-0-a608528864a3@linaro.org>
In-Reply-To: <20231219-topic-sm8650-upstream-altmode-v2-0-a608528864a3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=684;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=VmNuAmZkD7FpY6bewTnP4V/44GbGai75MKliuJO6u5w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlgYr4stUEQaxvnGqsruhjfr6H9gIUuIelp4I0zMKm
 /uEj1TWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZYGK+AAKCRB33NvayMhJ0QBKD/
 0UFG3za7aimsGehqx4bBq1wGwRLjf1eEV/ia2P6okPETNQGT1At3up5yADsL4FW/b0aC6mAdQCPUSD
 2LwdgfpR6EhedKUDJuYOI6gDJ/vASz1Ry+vsbNWTpYyp8z01aWXxrw9Knp0xz7Rv2O+OksX4kO00cq
 uHtBuqQ5M16K7GSh8xkiSpgz8HOHAoLwQlQNB6bes9USdyo94jjrkNpAJ8TyvXoNXORkbhaA2+vmE7
 mEdQOQ+6RgHHLLFA4ukO8/pSeuH5mY6LAS9bRhxFUKb4A5E8Y73SqdKWw95+i6ZqYuulRhyfDsZjaE
 fhGF71TiNEGSszcPhghb+wswuMd933QF27x3UPqsCPC8ZVqi7C9dDDWCz2i0kmkAWR7X4B/UE+0JEc
 g7uL+w0XP6m+KqIJrOkVISONAgwhRdxQtSNsdWlenSihebgaf+ymVBJUuLSQLB2/gDzYsx9xkj+624
 3tIgokT4ar/9T4gadRrsBc/7EiB1AK4F1Fs/nn1Zt0myBwTWCccVZtGSi2nYJYrxo/FJGg2sNzrRYH
 isXRm+EtUFcOIsgvwmkwd0ALDYwyvWdu6S+8r9W1s50dwEiHf4EeNtEps8fmjb7eJc/NSJKOPxwToM
 V7QgeTAtgSAXxFRc67PJ3c5K3dNtwKX9b8DeTOASl/OPKJwli1KXeXhtCB4Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Enable the Qualcomm WCD939x USBSS Type-C mux as module as
is now used on the SM8650 QRD platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0e67a4849b91..c9ba75f1b248 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1067,6 +1067,7 @@ CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m
 CONFIG_TYPEC_MUX_FSA4480=m
 CONFIG_TYPEC_MUX_NB7VPQ904M=m
+CONFIG_TYPEC_MUX_WCD939X_USBSS=m
 CONFIG_UCSI_CCG=m
 CONFIG_TYPEC_MUX_GPIO_SBU=m
 CONFIG_TYPEC_DP_ALTMODE=m

-- 
2.34.1


