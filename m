Return-Path: <linux-arm-msm+bounces-21608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D828FB468
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 15:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7F8B1C22458
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 13:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87D4171C9;
	Tue,  4 Jun 2024 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="KaD5sjGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308ED15E83
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717509056; cv=none; b=OMPrq0WeaKg0hh6tDDajABs6D9uk4lhs12F9bO9LpOF03DA42HAtma/gdWXkE9jEg7AV3wyRuURlQdmGrWJW8r1vVQymyVpgSWNAL5poT13UpWxTxUWLuza0/mrRH1atVxn8WSwv07NamdfW6T98r15rjr/gqtZ7hdxH9ERXhs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717509056; c=relaxed/simple;
	bh=w6wxT3v94oRxk3E7RBTjLkHohc3Bnp6aI72JbPDOuSg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=C8+ILaafIweOSh47rpoh3Huz2Qf8rRNleZhwKcijc3cCl5ndXBpSv4Lnk0rv4X2T5S8HrHvAauYqO0z7m4O36RzjbEdfcDDIR1rgRFRVETT3eDRzNqTrm6+zH1ZGS2F8uOTioymvHg4GQt7gn6BV6Q/P/QXVG2x0F3ar5CqPPts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=KaD5sjGG; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52b9dda4906so2274819e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717509052; x=1718113852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DAxZmX6/vrF9fWzRMYvQiNF/0jN2EbEz/3Bo7MBhqt8=;
        b=KaD5sjGGaWJJqY1+N2UZHLtiCWHZTJIa5VCjcSu1sIHvAFR0hcLQ9zvNI0L5qTeqst
         KZVsiBlUVsRpRB3IHJUFB2cX8JxUSJFFbMUENIc7mmB+mwOsDKTqRU5ZCDGW9Um5mdgz
         xmP9p43czCWtr+9X6yiEMfk1Ap0zhwt7O71wJ3t/p6wZkzmzBxLx6ckokcEUVf//8DtH
         sixVajLTyMVh/2PTENgl6Q5mfe2siGOCEBvN3gHYDQc01AlwSzz0u7UQfnb95QjY6D2J
         hncxDWq0iUObkFQt2kZ7hUTeWkZ5VCRAQCiVJpPhuxlLqCtj41zsOGuGx64BCJ7U7h6p
         t/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717509052; x=1718113852;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DAxZmX6/vrF9fWzRMYvQiNF/0jN2EbEz/3Bo7MBhqt8=;
        b=ANKpNOEyci2vwifch0jfQEtoQxCKNmuCnP/PYiWA4pfXDZG1pBEeBjRAlbV8WI6YL+
         2Sjcf1H1GH2wtrXqKgPcf8arv3R8YXFBCW/B09Vr7o+7XrvFqszVAsjFBvBxvU50Lhoe
         t4tUJmdV9gPYSgO3KWFnR9FqM6vfycGGPGIGu3CoTfovvRqz9MTeEa+7Ns0yAQCZlsRB
         agQO9F1f9qrin4NGIygpXp89otLlcbsZJ/6tm0bABJTXYmUWRm/31efA8L1jJKb6D/dH
         6/IRUYSSL25ZTkxSdDVyd2ialoI80F79P2sPyk19JPfPNhhUkjhov/qFh+e7DtdKqHlD
         zBCw==
X-Forwarded-Encrypted: i=1; AJvYcCVJT1jjxjM40+yHP2+8UaDGwzLKAMsfF9By7MuH9ujwaDCVLTtkOaknvVwPGRm08Diq7YTv/ko/9PW6lacGwtcc1c7XulmeES6RrrCpCg==
X-Gm-Message-State: AOJu0YxERsyhWqz6o6Dhp0xk7Q1YUMAuBWjZH505QSUWhcpOX2VMZA08
	LSXeZx8BtNCj3onZbnHrQ95ziFZ/zIseSONcY6AHw1oDO6wGoOD4OFbFhzj9aPs=
X-Google-Smtp-Source: AGHT+IHMiuaN/QXE2W2FVQQlvPqF+jnsGtvfXm41KlLvHHQfKwwkQ7H70L30Pz3XUGcM7ni3Los60g==
X-Received: by 2002:a05:6512:54e:b0:52b:851d:4db6 with SMTP id 2adb3069b0e04-52b8957b271mr8132955e87.26.1717509052405;
        Tue, 04 Jun 2024 06:50:52 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42133227f8asm139569755e9.19.2024.06.04.06.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 06:50:52 -0700 (PDT)
Message-ID: <9d54a12a-ae66-491c-aa1e-96b7daa02201@freebox.fr>
Date: Tue, 4 Jun 2024 15:47:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/4] dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Content-Language: en-US
In-Reply-To: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

HDMI TX block embedded in the APQ8098.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index 47e97669821c3..13199f1676f7c 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -19,14 +19,15 @@ properties:
       - qcom,hdmi-tx-8974
       - qcom,hdmi-tx-8994
       - qcom,hdmi-tx-8996
+      - qcom,hdmi-tx-8998
 
   clocks:
     minItems: 1
-    maxItems: 5
+    maxItems: 8
 
   clock-names:
     minItems: 1
-    maxItems: 5
+    maxItems: 8
 
   reg:
     minItems: 1
@@ -151,6 +152,27 @@ allOf:
             - const: extp
         hdmi-mux-supplies: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-tx-8998
+    then:
+      properties:
+        clocks:
+          minItems: 8
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: mnoc
+            - const: iface
+            - const: bus
+            - const: iface_mmss
+            - const: core
+            - const: alt_iface
+            - const: extp
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


