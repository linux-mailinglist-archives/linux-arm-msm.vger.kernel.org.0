Return-Path: <linux-arm-msm+bounces-37665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C36699C5E39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 18:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5380C1F21FF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 17:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A04217673;
	Tue, 12 Nov 2024 17:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j+/aro0U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FED021744C
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 17:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731430905; cv=none; b=ETVB3tdTQk0r9CPD7SR/ilWV97eACtr3V/AjF6SpJ5ol+eR9NkiwH8PmQ3ruk2Tq7da34gUTn9TVEYiNyEN6ehFpn3ObPm4Z+b9iZaAFnE0QxW852nu2rIeRNk9U92GxmxoyzQQmDbsx95xFxPP7hvl8vyrLUMS8qIKLtOa8MKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731430905; c=relaxed/simple;
	bh=rn+jasv615xUQJB4N7xZ8g5baYva1Q/g3fELDqBa3t0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kf/lZeZfRCPGvGCb3ESS6Hn9eXyj1LsN611OGy8SUF74vzXz2jir4V4rn9mwTA5ECx5KJ8vujulLZZMtj3UD7oQ+yqq5gPRXjCT4SSdg01wxneTrq93EGvG270+8cOfiEfLMISFq44g/ZQQD5C4oFSlSzp2XcROfjVY2JcoI7rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j+/aro0U; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so50552635e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 09:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731430902; x=1732035702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDAU3CwYwIX4meKlBGetJ6SUUfzYfEjUa4hBGXQbBGk=;
        b=j+/aro0UCs+tyWTtKKkcP8k+eyt4pbd0HyyM4qDw3Ohgndqn5J11+ROAfxSZZdhdEO
         tLOQqcQfMx5RYRWFPZW3j61M1UXiZkDIvHm3nvN8zkWKPh9n1AkkThEHtGHm0PXq+BbO
         vWZ2Z+fsVSltG1NJgAyQZx/aH1vTF+toL89axkBmj/PjVLv2vR37qeRBt5aDQIYe+6n5
         AYUxoyxb9kBAWjOq2yG2A8noSgmA7sE+krujelgMGx2Lvv9cEKjTk+hvc3Wi5caxDgYH
         KLnJUk66KQrK5GYd50h3WHWYKHtF9+Quxks0uahLGpy+w5UNibIXtAWDA+Cuy5CDWdWv
         RmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731430902; x=1732035702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDAU3CwYwIX4meKlBGetJ6SUUfzYfEjUa4hBGXQbBGk=;
        b=VrZFyZT0idum4I47qe9Bkj+w2QowdnwNNUawSds5JNFcGH9sufOz5yPgDgOCnJhuaA
         MEikLnfVLn7RszlI8u/tnDZgLO25FQKUI/ZPtHUGHr4YRIPhNeLi4YWmJEfK9o2rDeOw
         SQlezzoBIdcCy666P3LJz/QK8m1MHNyuVoDfz++wxamBeXQP3V4/t1NPMZarxYU2x2LK
         ZESs/E9l2MnbNbXLtupYnM1/MCfsIpbwIt4i2MJHC/TxEFphYvJKugPVeP6S6gKrTdwY
         yv2tGHip+GmFFBza5HMqZ9tgDfAfm5/Myy6Z3Im++G8wqwRiM4AnXWJbj9gh6W2IcgOp
         z1lA==
X-Forwarded-Encrypted: i=1; AJvYcCUwelIA37x53G6GmT68B5KSeSTM5+a22DWGXJLH79mCv45oZ2QvHCu7jqpXqQeAx99ODmT9aqA0y0HFn454@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7nJvNhpR6KExIUIZ7B+G9lI9x3O973dwAkMjfWBbsGJNPnne7
	yuHAItYpJfrpaAiEMygM2n7hcR0aivdlAp0JN6nVPZapFqnrMy/GwGW1xAQ3xC4Yh2yJtkqpvgk
	o
X-Google-Smtp-Source: AGHT+IE0OEDwvtbJFTeaRMmYM5F1pgSlybbTTgZrG3TWcAARzKXSju2/JkaU+mTv07QpjxCuESbsAg==
X-Received: by 2002:a05:600c:1e24:b0:431:5c7b:e937 with SMTP id 5b1f17b1804b1-432b750ac1emr162887985e9.17.1731430901824;
        Tue, 12 Nov 2024 09:01:41 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b053051fsm215018895e9.6.2024.11.12.09.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:01:41 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 12 Nov 2024 19:01:15 +0200
Subject: [PATCH v5 6/6] arm64: dts: qcom: x1e80100-t14s: Enable external
 DisplayPort support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-x1e80100-ps8830-v5-6-4ad83af4d162@linaro.org>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
In-Reply-To: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=rn+jasv615xUQJB4N7xZ8g5baYva1Q/g3fELDqBa3t0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnM4nooVrdW/yU8miEA+L4Xy9iK4msouCHUCLHx
 MvHLodSW92JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZzOJ6AAKCRAbX0TJAJUV
 Vh3iD/936X04EIfWLT0ixdHP73iLGpIg9fGVohinecPML5LM+E/SIZPJt4e4tEAtWAVm/3VljVt
 pMWl5v65H2JihwAOKI8dR6IU1Tjpg/XDCRKISzVdBXLypsT/FsGPQNr9G21ZuDpWw1Y6y5mgIL+
 6RrttKGGGa55CWweuJUxpMl8QzVvvj+QOE0D+oZVz8OHy/EW6y3/B3ftKPx3feWod9byaiIaO2F
 zWzfMAqkkn80lUm6tzvufnOrCceyQSWpBpk0uygPCod1R0jx7CalmD6g7A/kxBGACECJW7t2A6R
 xFBmzfd1TKtETema0lDa2s0koGGxKLMPozDJ6d59253fFEdAqMPoID7UbxPxx9joQBdZGSGPUsF
 iAIfzBQmlO3l8NLv+jra+Z6DkphpjxFfOZRUABFKZtJn/0YnUP5z2rRe6IwTKqckMemgZoUshm/
 V2LvUWtH6qd6t1hTLiuEiwJCsdPN2rYNbUH8OYwRNokg1ZS6j/R/INTE6KANcWkM7nJ4z+QWF+H
 AE8TZh7tk8EhEMIaqCk+mL8g+TKOigMWEDOnvZA2wvnOmnkPzE7DjeFTwdoiL2zoCMwJmPZ3QaF
 wfxIX1MED70VwUTzaDwovsPrRMIyCk1UmFrQOgfruwWRj3QV9lqW5YmI1KF47xI2yRK2JowdGgc
 HQO/SeejfR0k3gA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Lenovo ThinkPad T14s Gen6 provides external DisplayPort on all
2 USB Type-C ports. Each one of this ports is connected to a dedicated
DisplayPort controller.

Due to support missing in the USB/DisplayPort combo PHY driver,
the external DisplayPort is limited to 2 lanes.

So enable the first and second DisplayPort controllers and limit their
data lanes number to 2.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index ea3ecc7c5bda24f3a0a7bb027b456462b11daf4d..b08a173f0cfe2a2fc241a4e689d35b5e7e03d7e1 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -746,6 +746,22 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1>;
+};
+
 &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;

-- 
2.34.1


