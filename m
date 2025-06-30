Return-Path: <linux-arm-msm+bounces-63126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA19AEE89B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 22:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29D1E3B2D32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995AD23F434;
	Mon, 30 Jun 2025 20:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JY0yv4LW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3CA21A43D;
	Mon, 30 Jun 2025 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751316921; cv=none; b=Q0Ouo05ggsmsFo/Z6lIU66KiD6ggCkwPYyy3rwcNWxXhCAIt2jxNTOUTXL4LIS6Jz8AkMtqGnT/9rQjkA51Nfx79fK9SGHkA0t4RL+nYcLau0jQqn7UCph+uwD9D2GJ51Zf285nsfnZkIEM9Na/aHu2fY2acc03rRSG6YKoG3o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751316921; c=relaxed/simple;
	bh=UvQv3d7egSYuxPRSYOChMSjwZYqAVJ0HMCfXl19t91E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkoAoazMOkFb0wmXkfmhznS/WRWkf82a4VzZs2FP/NbH+m/BmkQZlmeljDxlCeELAm3Ptlbad0EcI+gI0JXdM9vSbTBnWMcycyoHeOp7jkE3fkgtHXNbNS2U03racI+yfNu+tw039HYARkkrV/rasGkYqCeVxwdDmUMvi+6lzSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JY0yv4LW; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so2306986f8f.3;
        Mon, 30 Jun 2025 13:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751316918; x=1751921718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PDdkIw3doj8hiDsDOh83GL1tI9OxEZQZRwOHSGdxPU=;
        b=JY0yv4LWviLVfX/Wl9AXXryVLqlYT0Z4fHEzhjcTP5V9rk/yC1ghYt6WPH85aEw+cR
         CpTrGehBQMH77Ir1gm5DIkamBHyEwW3LipBGFKmQsNJxYsFITqxIrH+OlacK0ODF0hMb
         Mu9ToRq+H0kqPNpP4ZwNC5AJrwyIW0IZgL8yD48JS6v3uWTTDPSCzfVGHBk4wkQox/IG
         i8RfWze2JSt5CF0D82FNJp8MijA7OwOzt8modj1PXlqsyelbB+0hClzwKmlIkWb4xzMq
         7JaEVu4BQfsAdpeBAo4H+NNnbSRpswV9J3Bh+AqEaSTAUbZofUofdKImyKYauEsnJtbX
         j+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751316918; x=1751921718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/PDdkIw3doj8hiDsDOh83GL1tI9OxEZQZRwOHSGdxPU=;
        b=j8+4WqIeb3WSryKwhiP+upkkYrId6ykstMukje8QjxnTOPq7TpQaQsc8golZHm+MSc
         b3HvCn59FlGdl4Pkfb9jLrLMhEKwam62+IKpIe4Awbsdh8dOUmuos+cvDLwbuRhjiqC9
         zhhKWgbezqjsBJKzOfIQjla+hbELvKz6unFnJ0eYieCiiyaWra4+K57M7JkxeeBfU2vX
         jMy01Ozn6egB8Q0iWS7lH0aMT+Pp0yDZSjXPNCY9p8VfWjENe3qzMxlcfvx8kN9ttk8w
         D4cAGBv52W5lgxP6kJ2P4Q4DGRqWfMpwRu/R/xe0IPmQLC5CIC24+sZH171JAlsBeDAc
         BTqw==
X-Forwarded-Encrypted: i=1; AJvYcCUEU1B5vB+N2DaQVTjp4JDi6v/r4XuKoM5wRjXrzbBLR8uMwIPQARq2FTkisPHhh0mwDAwRvis7SZQ9wrhv@vger.kernel.org, AJvYcCVVEWJRDS9ndieB5+Je0hshXe9wbPi6a1WAclDbxZm65f8knPStQLjyTNtAroXeR4J9y5pZpQuBhyMQ60MyXw==@vger.kernel.org, AJvYcCX49ZTqT6CBy3uEsHZ0jnhYBNNfuRTTN+Qb5kHflzfSKx+UrSo+Ty7Op4/BuO2tNGaxZZKWMBWMxRi1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4FABdr49707SlkEHLaE4PfNWsxUkcIOpfFXESmyMrmkkNmAIS
	lNl5UFGUaEbmVIUZSt5+BRQXHi1DW98Sufb3+ZNy7BZxjxfC5Ub0g667bYwspwY=
X-Gm-Gg: ASbGncuLJLhJC7WfLFj5wWBj/s9XxVQBI3k8PtzddzFEz1im8Pfc5soNcnc1ZoEwvlD
	bLz5RS+gaWeH/emeHUm5LH70Ru1eq1OB+5Ui15QSWq+y1YQT23bIUT2XFRsr4y5MzSeTtu4UAB7
	sYE+9QnTdbblqnGGMeXl56iMeTQkTrR86vP/ysS3OCPneJRhk83uirTBFp/dPfjO+fgRXm1EFuG
	nhOqSo9gZeRkDEsj+a4MGkSX6yDvUl1P26Z73g3CkGBQcO4ABqCslASsxXU5NO1a3hMB/QZpFvw
	LvkHQKHB/S+kuQBgzowiHGO8AUds8EpAjwCeO+kKqePdtKmC5mPBxnE/xAlGcgiLLrWZaj8L+VK
	6pgIjPxzvibf95+uI
X-Google-Smtp-Source: AGHT+IF+NwFmYmtDU1uGjL9kuTIgl0QWpFBMDk1Mnytf5+grQ+QjHnoJYdmWLz44mvcjEaiq6HJXAA==
X-Received: by 2002:a05:6000:2d85:b0:3a5:75a6:73b9 with SMTP id ffacd0b85a97d-3a8f4549041mr3097448f8f.11.1751316918262;
        Mon, 30 Jun 2025 13:55:18 -0700 (PDT)
Received: from alex-9345.localdomain ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7ec6aesm11322814f8f.5.2025.06.30.13.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 13:55:18 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 2/2] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Enable HBR3 on external DPs
Date: Mon, 30 Jun 2025 22:54:11 +0200
Message-ID: <20250630205514.14022-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250630205514.14022-1-alex.vinarskis@gmail.com>
References: <20250630205514.14022-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When no link frequencies are set, msm/dp driver defaults to HBR2 speed.
Explicitly list supported frequencies including HBR3/8.1Gbps for all
external DisplayPort(s).

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ac1dddf27da3..2308d5a0e3af 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -995,6 +995,7 @@ &mdss_dp0 {
 
 &mdss_dp0_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &mdss_dp1 {
@@ -1003,6 +1004,7 @@ &mdss_dp1 {
 
 &mdss_dp1_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &mdss_dp3 {
-- 
2.48.1


