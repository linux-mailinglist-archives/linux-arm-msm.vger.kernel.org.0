Return-Path: <linux-arm-msm+bounces-22610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC82907943
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E53951F24617
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23726149C57;
	Thu, 13 Jun 2024 17:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CY9wtDxW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3A71474B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718298311; cv=none; b=gh17up/C8yKOpcw5Aa2z2cuCdHxbeLkDpsBoJ80UcV0DGP4EZAEWePoJo0xN8t9wEizbkbcapckwEWjRMSK8JHY2QjaOmlesJVdDQds7V6KVeR59W02pJ9A4MCAI3p5n1fRp0JkxC/629AZHAlZmeHdbYCn5uKpJhjSRLTwvzJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718298311; c=relaxed/simple;
	bh=lOztwQqxwser2C8oxS+R98xLg5ISzwcYa6ufdiD2kmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLNJa4k6NGPYABVMOEmhMfcLSae1MMXwsMtgNjfCxDh9lGw0ksEjNpEVpTrjuuJBFo3Peha8BcW6GdKKIA9t+P2bNFpUItDGAvfHDvHUh82o2X5eHGc7GuTX7FBWsoKXD6khnBZUqe0ZCrMr9D/Of2xmQDLO7qOabpW9s7kWIw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CY9wtDxW; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52c7fbad011so1604171e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718298307; x=1718903107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzTYGEU1DhC3R38BWXEj7wHUlVjFlaRkpbDFC+I05+8=;
        b=CY9wtDxWQkg9AGf4l0DRYTTcl3mq2Phn1pgVmKjwN+kcP/hCYJwbJXIlQ9Tn/MfJNp
         PRvxYVs6sxxs9iCmRaAbNEICrubQc1Ds2zujLs7rf9t4NlswJHyt6xjVuhR/XFp7Le1l
         jOUt6dsRwqVS3qevRaZA04g127IpukplQwkUzSFIAUIyTTtiRkEq/Ox+h2IH37oRUtzA
         kQUdzEG/QrwF7PoO9h2KwUHsvldqt+OmVrdh975ZIzJtypKuL8o/7Mf8X+BYIAcvEmz2
         rgveJhTlE0c31yd0GbFE0ST9p+fc1LnnR4d5PTckG/a6GteHHvu1X29pKTl3Dl03K4xE
         63Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298307; x=1718903107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzTYGEU1DhC3R38BWXEj7wHUlVjFlaRkpbDFC+I05+8=;
        b=dFMPZYKpRD0VUwbf4uMSEhbIH4gftzJ8X3nZdoMWPANR9TGVLzWZE6bH+lP1FvmHg0
         RrbYb5GoVzQGz32xHRnO1Yqe4+trBGnIOWTzABCUAxOK0SZOFjVpi1ze+bQ1E1HOxJ2L
         DxkFRdFEFB3+0Hhtzl7EuKyfGwC5lOVquPcUob3htV2Nfp8GiInNMY+wgdGPoGEjMStk
         xFSunfut+RddXNVLIby/HCM+GymBWvPI3R8YCexJTp5oFgCcZHN0iKSGYd7DytPftd/i
         GkdOiERyWangmTBW5KXXbzTDm3vIVwBYgeM2YfHC2jQuw7ntcvm76tLd7BcwlorNELHy
         hpbw==
X-Gm-Message-State: AOJu0YwIx6+ClnV/m1Oy7oX/yIXOkJ6CkyKuJoU6ZArPxEDaKa4OW+S9
	lZbKDnlmwJi9M1REOmB+rEACdLM+CjFzRmv587P/r95Q25XDfgCOp1zIvSwFx78=
X-Google-Smtp-Source: AGHT+IFsJ0kgv2wUPm1EVV4W2U6CcT3UwOe5fdISUs+9DgB+2yyUkjBcEcAJNtWC7OWzuRYFnRGWaQ==
X-Received: by 2002:a05:6512:3a3:b0:52b:c29a:7493 with SMTP id 2adb3069b0e04-52ca6e6db76mr218800e87.33.1718298307487;
        Thu, 13 Jun 2024 10:05:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:05:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:04 +0300
Subject: [PATCH v2 1/8] dt-bindings: display/msm/dsi: allow specifying TE
 source
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-1-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lOztwQqxwser2C8oxS+R98xLg5ISzwcYa6ufdiD2kmc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaybAqgkrnin4QPjy3QrfpV1tvo5dj5wvvje1+
 di4KHrNe9WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsmwAAKCRCLPIo+Aiko
 1ZbiCACpMTTnYBZ9Mly4AKpccd8ZUe5WsqowDdq/s0dEF0vhSjjtCrY+ssyP6Ad52y/F8+QGkVP
 RUGTUjgH54tglXZpcAggENVu9MP79YVLjxpVPjX2ofb+jPNhzHtVF6rJAOctRuzwssGRLmLD28g
 0EltbC+Zx029PlsTDHDx2sSW47JhvS7lbk1NaolZg3AbE+Ct+ZvwqM7u0EiV94/lIj9SIXPWwOX
 RJkNERZ1oHG/LdzQK8UCVw4rAuuhQIXki8sSIhyTdGJ1qaPiq8x6a3fop5GnznskkhTGwH6ky7O
 +wxpiNdriDpB//XHeUk3Qe/licV7b15ixd3YNCi6Sso+HYGy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Command mode panels provide TE signal back to the DSI host to signal
that the frame display has completed and update of the image will not
cause tearing. Usually it is connected to the first GPIO with the
mdp_vsync function, which is the default. In such case the property can
be skipped.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 1fa28e976559..e1cb3a1fee81 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -162,6 +162,22 @@ properties:
                 items:
                   enum: [ 0, 1, 2, 3 ]
 
+              qcom,te-source:
+                $ref: /schemas/types.yaml#/definitions/string
+                description:
+                  Specifies the source of vsync signal from the panel used for
+                  tearing elimination.
+                default: mdp_vsync_p
+                enum:
+                  - mdp_vsync_p
+                  - mdp_vsync_s
+                  - mdp_vsync_e
+                  - timer0
+                  - timer1
+                  - timer2
+                  - timer3
+                  - timer4
+
     required:
       - port@0
       - port@1
@@ -452,6 +468,7 @@ examples:
                           dsi0_out: endpoint {
                                    remote-endpoint = <&sn65dsi86_in>;
                                    data-lanes = <0 1 2 3>;
+                                   qcom,te-source = "mdp_vsync_e";
                           };
                   };
            };

-- 
2.39.2


