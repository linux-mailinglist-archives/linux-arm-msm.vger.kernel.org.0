Return-Path: <linux-arm-msm+bounces-1244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0912A7F20B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 23:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85631B21A75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 22:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7494B3AC32;
	Mon, 20 Nov 2023 22:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M4w6FHVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D6CCF
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 14:49:25 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5098e423ba2so6869570e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 14:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700520564; x=1701125364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7w3IPGNvRYti0737C04DV640y8lLrN0zZWGxZvPfBuQ=;
        b=M4w6FHVX3LRUMRClON2OC7B5vpY/nKiTmNJrkxPFvvIBoz89qgubpOUxrk0oJgvSLu
         VyJr2k/b7HlVaSOYMFwtGuwK1wLYbl7K3AsOXkAMeblID7QfTA/2QBCoxh8ABE0k22TS
         MMYIaKOw1EsXEZZrM8YOwGzI2HyVk3qOxS5AtHZZcA1QssoJLboXBsxe9crtZWhD37UD
         GUSDO4QJXumQWyv1bueA3fwR9lyOjamhjK8xFynenM+WUpuP2DsHICtExWD0l9JLoDGv
         q+b3rJZihnY7M5Jbrk//Fj6bI1B+I4qQbc09ju7hzSH6ErMc6P0rkp9zdv3pP0l+lm9E
         OZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700520564; x=1701125364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7w3IPGNvRYti0737C04DV640y8lLrN0zZWGxZvPfBuQ=;
        b=VziQGJ3EfXdLeCcOC0w76wvDK61xskduG5o2aIaIQunQWfYiBmNOb3iJmKBB+JK+z0
         3W2Wb36hZsfZJU7XtgRsmQY4tBQdpQbSEXFyJEBl+VhtO4G7ucPvILnUaZfgHJb1rjSb
         VyAt78EhrPordYwv59jNYJ4/Kqhx6SDC5d1abl5bKOoDyCPxNXzNMQPtKqGWdLqAughJ
         WonZiHaFFB9EWNbGO1fJzhHoKEssdPzRzAtsFGWy1hgAtPEXdpZDWV0dQJPxTEHYwIQD
         PRsJrYjUFHQLwHAXvAMI9jwydAV7wGtiBbKhpK+mZK9ea0jXurgm/hWH11E88CZ5SJMT
         dG5Q==
X-Gm-Message-State: AOJu0Yy44DhquZvfKCnWfJMt++0tHGhQPfsTIcxLGQbtLHW1dbNjkKKM
	wr7CKX/tpxnw0v1DTM6mbtgXvQ==
X-Google-Smtp-Source: AGHT+IFD8UwHvlZIXLl531QOdo6XgS1ewvLFiSPtvmWi8CMmPCZ9J2HRygNxOeDgJlm3R/0ER3Qymw==
X-Received: by 2002:ac2:549c:0:b0:509:46ff:6e57 with SMTP id t28-20020ac2549c000000b0050946ff6e57mr6342427lfk.8.1700520564046;
        Mon, 20 Nov 2023 14:49:24 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c26-20020ac25f7a000000b00503189d8b8csm1297756lfc.198.2023.11.20.14.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 14:49:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid
Date: Tue, 21 Nov 2023 00:00:20 +0200
Message-ID: <20231120224919.2293730-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120224919.2293730-1-dmitry.baryshkov@linaro.org>
References: <20231120224919.2293730-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the bindings and use 16-bit value for AltMode SVID instead of
using the full u32.

Fixes: b3dea914127e ("arm64: dts: qcom: qrb5165-rb5: enable DP altmode")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index c8cd40a462a3..88b37ceb13ed 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1425,7 +1425,7 @@ PDO_FIXED_USB_COMM |
 
 		altmodes {
 			displayport {
-				svid = <0xff01>;
+				svid = /bits/ 16 <0xff01>;
 				vdo = <0x00001c46>;
 			};
 		};
-- 
2.42.0


