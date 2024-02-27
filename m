Return-Path: <linux-arm-msm+bounces-12707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0E98690EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 13:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B3DA1C21113
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 12:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FA113AA4B;
	Tue, 27 Feb 2024 12:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CVsMFmtq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06B613A87E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709038405; cv=none; b=XoewFngwivFs3brzd/q5Xc2IqvU+LVUxSBitLHEAB9kje+HzhmUbCKy8ImkiFwKVZyPF6Pv2ES5EbdVX91mdZyrPAFmJtig1soiTCph225RD6sY5RxWow3vKL5MdokhiqpqVF4KBGktG23/KLVsnNX4/rIIOq9NnSHbTDUDtASI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709038405; c=relaxed/simple;
	bh=YlfJwnS0Z4WBUl1lUKuKwvtd56ds2Yjysw3v7W3DaNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gS1ZaZ79J3kyQc9tfyRJIkmU2PYk6aAW4YDyPHKadUCFA9ZRcDf0ZjqOTKQ70+KuQ1IqZkVwHHRQstz6PvO+SwihS/KdcLIOlhECumRHBNjosxA1VmYc39VqXc+O+Xsz7bQLa+GiPhZag1bZN8p+SLn/tHybe7vVz5DjyXIEfqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CVsMFmtq; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3650dcd38a0so9654625ab.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 04:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709038403; x=1709643203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7CIH7Bwb9FCvMBvdoeWa0vbfj42UiLRlo71hcmbEJIs=;
        b=CVsMFmtqDxmp6LqLARdz7szNr1W4HF/b/M4kbOnFxDEnf6XHmI6ej5QA9mUFymUGeJ
         fd1Eufx+7/7NoxslCj+361rfH82HuZnxOMpobdwx7Oiy35Z11fMLovwZmIxkeQxaOPKy
         m0HuTDW+gY/8QMtbCOuDbAkZXU5MQGCTJgFRSGOm5wBzHb6mmDCo+jYILxe5kqvrcqQW
         Jfbrs1JDRXEXHJz+BXZOxqGuCMulb/V1M5TOvvhpOQPvKQphtgO+Ny0fYu+MyX3FmqqI
         7qKOTX+lG0Wr3aUOC4alsCP077X32cNq5JRjIYkCYUqF7n1c76RZHZGfJi0oH+Gi+/e4
         Hy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709038403; x=1709643203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CIH7Bwb9FCvMBvdoeWa0vbfj42UiLRlo71hcmbEJIs=;
        b=evxM7m6YIVFPPvn6YmPLyOjVUCsn13FuYwSESOR3U5cQc2oms0b8QyrEklV4EiAqq0
         QIX+6MHB6EYxtYDaJdIT+vnmvaaRXffpT7//tEiG5Qmn+NgWy2Yjvxg+LbH7Dj5YPszM
         9+Hb5CvOE9nyqpKnUXwzvlBjcERS5siIKtth3aiTmkCIECEOLxaGYu+5BhuUXKgmJ6y0
         ziSTw7VbxPJpf9HEFd5dyoyBpBdnP8mPJSFikpXWr2mWT2pgCN0QJrnubsTkEIWh5/0q
         3MpycE9bGP5sUN1R2a4ygmItoy8rV9uYTzLCD++Mwo7gBuYMtv+n32fSDAGBMn3dsH1z
         TcOQ==
X-Gm-Message-State: AOJu0YyA0C/vjkReMEyawcApH+uizF/cu0TE+6Vt4PBjQevNEbPMgPT2
	oBf9Uk0w3sNHSTFv8xhE86vOy+bxXc+5JhejU+aEJPNPeJIZT5/Jmd/Wk0qsnnY=
X-Google-Smtp-Source: AGHT+IEoKEIDH+9Ypi4qGOJqasSIl8l7ugcEPMbgXFix92TuZVJ7CJ8yzF1naMNA96T7Fhj69JxKhA==
X-Received: by 2002:a92:90e:0:b0:365:1785:88f6 with SMTP id y14-20020a92090e000000b00365178588f6mr11104305ilg.3.1709038402946;
        Tue, 27 Feb 2024 04:53:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r7-20020aa78b87000000b006e48b04d8c0sm5841193pfd.64.2024.02.27.04.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 04:53:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Feb 2024 13:53:04 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: sm8450: add missing
 qcom,non-secure-domain property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240227-topic-sm8x50-upstream-fastrpc-non-secure-domain-v1-1-15c4c864310f@linaro.org>
References: <20240227-topic-sm8x50-upstream-fastrpc-non-secure-domain-v1-0-15c4c864310f@linaro.org>
In-Reply-To: <20240227-topic-sm8x50-upstream-fastrpc-non-secure-domain-v1-0-15c4c864310f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YlfJwnS0Z4WBUl1lUKuKwvtd56ds2Yjysw3v7W3DaNY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl3ds1HbEd0tiGJBvTnwbYRXFVxVrkUyTlZZfp9QPn
 F/NGLu2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZd3bNQAKCRB33NvayMhJ0WOtD/
 0d0NexXXCSIk664KIzR1AjJ7yoGh8BdxthEQRbY4+qi+/WFqMYOPNusacCw6PS4+iMRdzkCuAfslm3
 AWMJd4VMmKTzv05A0Kk9ap4idDl/Vr38ZfDyqFok/vkw48Y1tog3bPSnUDKzuSnr89N4UVkK7/U99o
 Q7Ag/69/p/WtepgdDmCQQKnKmIj/0WEwRAgJNS0n55cRDqsGXgjyO2ZktVrBH6AFI2iTaJDbCld5Al
 riCe+yqK993UCSOBfqzeBmh47WEQVSs2hIvD53+xVR9sC9ANKXSyn6ViwWHl1TYHjmjh5mje/aXV1W
 v4r+JpASA0aF/bCv2Pilp8TX5z8MFLB6iFpotCCoj4TbXOhDGd7iIG1M+jepwJCQLlxl396GuKh+L2
 cDWFDX83r2k1VBXyiaHsMibrr73aBz6cx4ZU4nqKs50WKPsVzg1VsDRSsHm2aWK/7npZeUhe37qSMZ
 H4eJGf2DFZt6RyIuKaFcRO35R0dMm1GWNedcghHydApNt0Zh+Ec7d0pcWL7rJ0tbXxnn1l0wvtU8EJ
 vZXp0KUfvRZh6kcsDFUo4vslRmAUu/tsOFMt7D3F7FaNi3isQuvkGlBWhMb7Ig+JpXF8v1IVAjmhvO
 R1/oCDaJqdADoIclZEhlifRi1XLzfeIGHkwkjkf9vUqmMrPu3lZNImyCyfGw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

By default the DSP domains are non secure, add the missing
qcom,non-secure-domain property to mark them as non-secure.

Fixes: 91d70eb70867 ("arm64: dts: qcom: sm8450: add fastrpc nodes")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b86be34a912b..2a1eea75f79d 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2363,6 +2363,7 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "sdsp";
+					qcom,non-secure-domain;					
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -2665,6 +2666,7 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;					
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -2731,6 +2733,7 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;					
 					#address-cells = <1>;
 					#size-cells = <0>;
 

-- 
2.34.1


