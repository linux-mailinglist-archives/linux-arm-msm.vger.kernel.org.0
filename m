Return-Path: <linux-arm-msm+bounces-21131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F6D8D4F54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 17:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF25EB27BFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 15:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D87183980;
	Thu, 30 May 2024 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fli5DU5H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE22182D3C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717083834; cv=none; b=BEJdB6gjGjPgcvVTvFcAsBrKcQECmMAW4/VgDewcfLmFvuk/JLAduHS1ZX9CQfNE5Iiq8zMy8AmKXaPhEg4ncqwRlUBkb7oGwqRxJeV3U1WwJj5/e3Hdra/0F9GRJSK0aE57inrqLNl12GMFgI8siEAI0/YWS05ua+uIa0hauFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717083834; c=relaxed/simple;
	bh=qmJIXyM7/wHrVyCsOdJnI+O4pbP6RnjnbPTi1vx5E6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RaKmiawrupCauMlpuf/a4k0ZBrX2RZslVzI8Pl/Hn7fgxg0WwU8gTngmhCsbmydwSOtmu5Z/8h0PnsUdc2bZHqCSltO2UXJ8vmdS8s9Okwzhpk1poBcD4C8VGMWUlehH5s9aJbZ8pc4s4c/K4y096rVTWZ1Woy1VJAJVX8NMF60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fli5DU5H; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57a1fe63a98so71425a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717083831; x=1717688631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmSucYhI9HNOgY+VlCp1HTsFHOsiYveasc8JOEnQnrU=;
        b=fli5DU5H6xbxfmm2EGZ5dQ5+PXGnK2YB3OyYVd7YkGQBxieH7torL6TBaeraGBZ3zW
         ypmnbwEnzNvgiX2tGHzOVsiX0KJXiImCLEJtmda+I9iSJ3pPLWtH5p98a1+4Kfl3UN9Q
         VaBEffFjwkjeLEjNhYZr/w1suGy4j4aBs7Un8CxDTjXIO5dacctiN9egO13+Q0hM/up/
         2FE4aOE9Op1rSDgjmU5g3zyaRaEOQkeDOVog4ZW+falfjV6GhZ5KcrYw8klJbAG8aIva
         bX+KMPhTnkWaBCz7JNGXosqP+nxh84AK0dq3HQisfqKY6Un0qhO9jA0pm2tKWfARi1DD
         hfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717083831; x=1717688631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmSucYhI9HNOgY+VlCp1HTsFHOsiYveasc8JOEnQnrU=;
        b=V+eCT7V3OfG61HmI9R/ARs54H8MsLxQkEsHdMh1Tk/DEic9tyCCF2O8IJRgXIVa7gK
         7DrIxywsEqVle6jgu0FOvcf6QQlppVZnNkPB/Z8mTj0GiZOkiaMLttVCEycUtc7DbI0W
         LkZkvuwI+Vr46qEU4l0e4a9xS6WfVY/F97zNGC5SJ+Dn0SmieA5r+f8F0pyXmfEjXjp3
         4XxSDhsNPTo3O3nxrWaw3xHNFhaXJrLlpPoB9Lrt21qUpe7FhG1PcgyOdwCDbEPut0Ag
         RcAWH0ixpaK5g25SsVANhGXIR5DPEYIrvbKALxzSaeBsx8H7lQqb6Mkrjaq8qtG3/v/r
         ORmQ==
X-Gm-Message-State: AOJu0YwGQgRTHMp7efmw+idfCEa9IPq9+tMbNy8cUzr05c2t1arw3xx3
	VDKK46lyusvrZggQ81HstKrnSgYOfnZ41gN+KuDf+rrl40mGgHCFALQS2yOnoO0d7cTfIyWTNdc
	x
X-Google-Smtp-Source: AGHT+IHMwWZwKTQfr6A0OX1rp8tqjDfRdb9EbAjD6c6Us+jt6ZXOdY+x+wiR5fr0HpAcyM8cMFsWAA==
X-Received: by 2002:a50:d5ce:0:b0:578:676e:324 with SMTP id 4fb4d7f45d1cf-57a177af706mr1615948a12.17.1717083831323;
        Thu, 30 May 2024 08:43:51 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579deb8f406sm4879700a12.34.2024.05.30.08.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:43:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 30 May 2024 18:43:39 +0300
Subject: [PATCH 1/3] arm64: dts: qcom: x1e80100-crd: Fix the PHY regulator
 for PCIe 6a
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-x1e80100-dts-pcie6a-v1-1-ee17a9939ba5@linaro.org>
References: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
In-Reply-To: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=752; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=qmJIXyM7/wHrVyCsOdJnI+O4pbP6RnjnbPTi1vx5E6Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmWJ6xGKvMcN17P3209dnOhkO5t2k1wYWwK4oyR
 TtUdM2xHomJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZliesQAKCRAbX0TJAJUV
 VmDEEACJlyAGGAqzO8F6R9VX/YbYErOndAQPIghSUTs+BjMeWR2X7WWRzfKnEKIX3SWzOTsdY1V
 sIhHkqRSuB0a5Ftv4eUgQQqfQcCIRwAytVNOmJtzdau1oGIGL9qzPni7WAIyuIki/4tg7JxZ5QN
 y4vpQttlG504zY22TrJ9HV53kTbQ78IFrhUmc59smBUnwjjIt81QZu3qeS6rvfgcguEPffFN6i/
 c0sP7gQ3K9C5kpn9v6/qf3kThnZy/yGQycKw7/cUJZBcgNWjz6arDiYoC0QSMs5SD5HIVGaSUAT
 ApSsbLA7DKMhnMqDId25AFxsxSuMF5y5Je2+qIRzubUq14libFuCU6tLmeHjPoZqEBO7BiGJZmj
 ip3gUwzbi1wIGOYJv1doIYMx0ke+dFAgtgl5WW2Nnlw+PYpmcWYslVea/hQLC73zhPy2XPbbHBT
 foAfq92RuKusE3s7CawEuUklSYA2O9sylSGTdFFc0utD7CQIadC0FnZUdkwifsIhhzWj2rxB93Q
 UHQsrJZwMvfU2R1OftMbsjm7Fjz1xKAZsej04HCmQ+THujU/O8fOIKybF2NxBOe9AAQ/lR++XNo
 hXlR1+es3MM6nhccBQAOM2tPC4UDTYJccFN33BdBVNV6hbzWxGYc9oe43R27iFcQHq34kEtWLD8
 j0XSm47FSBKKGeA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The actual PHY regulator is L1d instead of L3j, so fix it accordingly.

Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index ed8b80627534..3ce2c8a841ec 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -659,7 +659,7 @@ &pcie6a {
 };
 
 &pcie6a_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-phy-supply = <&vreg_l1d_0p8>;
 	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";

-- 
2.34.1


