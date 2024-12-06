Return-Path: <linux-arm-msm+bounces-40768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C85F9E6B7A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 11:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D994281A6F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31C61FCFF9;
	Fri,  6 Dec 2024 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oa+tM+yL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22861FCF40
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733479988; cv=none; b=lMZm/G+VLwXOp6KzwaGYGpK0f735wXhDl3VOxVi+c6lF9PgwivNJvhVi8sdFNYUjCKspPQ3p2qfTKNCfBx72ojTrOEBnOnO7IQJmKa22gy8dcjIl4uoLB0sR6wFUWt1GO4F3Ku7lRVAzvFxULfhC+rx3hHZ++2v84cRVRtYRcWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733479988; c=relaxed/simple;
	bh=kJsQH/6+45hFkCMoKjbJhWlIsQvNj3V5Moybs+7baEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AGED+OrAB2EVE8byVZPffJSaPtW3lef+T16S/oO/YfNRrb4bOSfqJkFK58J4bk9Ma02D4sS7RDhOTUa68hWMGpre1BROYHOH3OKbQem5PhOxICqnH6Bjc5Lz+UTOmSup4sDRx9ICvGAw6rUSRox2Jn35J1qTKCwO80lOtCDs3hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oa+tM+yL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a10588f3so12481185e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 02:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733479985; x=1734084785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bnFk7xmEwYLwYR0DlRz4OwWyjrchdnL9E3pQhswYw0=;
        b=oa+tM+yLP+oLHDR635b7UGL630BmLHC6nSlZblTk0qKdklthwZNOPI8Gbz8grVeDio
         QwJc2ZAKBE4AmtQchQ88AiM95rgCeF/eSzwVPDRMboi48l3CT/QcAoRbingNpvLG46Gh
         F+V9QOMYPQN2UYsMjli/fZkRdDXfglqrM+wAwanjOA3nQcDMacn5ckw2bJZlOdg5o4b5
         5wp8J2p+96aCx8BIgL7jgXlaG8+7CiatfkQn3XALcVWRgCltXtMjVjmhOOKgEtRl3G7Y
         u/AOq2ffTHuiInOsJHsvFEqj/GVjiRyy0YjgH6r+IgZfsMhcG8Fpvgtmqt0Ig59xa68+
         Ctkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733479985; x=1734084785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bnFk7xmEwYLwYR0DlRz4OwWyjrchdnL9E3pQhswYw0=;
        b=FZHGebYykbdmaRfZETOEp3DmDidxA0+k4mNbBfJm9seZUBHnUa55qBnCCBsT/BHxFq
         902N/BxSwz0x7lo2RU90C/yQwFZtMXBT/s2ZUlYX33oFPcSNCsxYBXwRsuMCDkO+SyjQ
         NofvVSICl0SEJvr6acXk7n6UJdQttKvcrH+pdTJdtT1re35uFSKs5OU+FTCKfVScN9IQ
         Gg3XkgUnKKn+cPrsEYc3+YIfnXjMBb/QSJRtg9OmUM5tu2Fkh05hsZ18wyguU26ePCcs
         Zj7uR12vXPfFmUFHbLkmCGrdsIyHxGjheX+ch3uFw4rx+NeeLfx0rwxu59F5gLW8tQwd
         ISyQ==
X-Gm-Message-State: AOJu0Yy6eeV8N/H9uNmcdZRtusW1y9jtkaN6QEcmFAY2GDsp0Lo8nBq3
	XBe5RWD1p68NHdAUT5WkwpNdlX+1glFi62vEb+aVQo+q4kKptzmZawrqhGQdkeg=
X-Gm-Gg: ASbGnctb0C8cOWtyYGF/OMe10K9v8u6JpuqDxrPQAZmgxoO8MzknqobwCkzGCvRsBRz
	KnnXDcgBE/T6BwBLDLFmAtRiXCyjFBf7QJke9BtWlHHUAmHiZ/h0FJ3scbdD3GZ/KKuEkSbjaZ6
	eZspLL7TotTHxilU95SgJ13cKjwZXDuDybIow2cTPUfDf2WTC2r1KVpWwvV/yLuh9QhB3yb6roY
	Xmzugl4cfxJUU0Hxh/2QlruxCJVt7mUrGDSFjz++sm93VEDISjYF0y/+TcNCbfWuZvh7w4=
X-Google-Smtp-Source: AGHT+IEvA3mxAEnIPZ/FvD+uu5UKhWXCZwWrKNLzJO0budWPIif9gbfIxTokz5PHnLy3hQuLymzvkQ==
X-Received: by 2002:a05:600c:4f51:b0:434:9e63:fb15 with SMTP id 5b1f17b1804b1-434ddeade00mr17289085e9.1.1733479985204;
        Fri, 06 Dec 2024 02:13:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0bfasm91092035e9.32.2024.12.06.02.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:13:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 06 Dec 2024 11:12:58 +0100
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8150-microsoft-surface-duo: fix
 typos in da7280 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-topic-misc-dt-fixes-v2-6-fb6b9cadc47f@linaro.org>
References: <20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org>
In-Reply-To: <20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=kJsQH/6+45hFkCMoKjbJhWlIsQvNj3V5Moybs+7baEE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUs4pJHpDJ7CJudRFVUaAz1GYfEI3rLr0TSaEt6ao
 DEqktZyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1LOKQAKCRB33NvayMhJ0ZWbEA
 DBGzfpaAHQLCDGov68M2nJKndvTmxQwggUbrUl/wzj50oBGd8HTKLjfPKRbmHyYRraioDhyxZtZ5gg
 uKwwTgoeiZ0cQ3UItAXbx/KvAN0Y5TJt5jWrOgEpKKuZjyYOBY6inyRLbQAXz/NL7SOJ6jJCkvtxTE
 bJinFEOqqR6GQVFyhwpzAzm9aJEuFc9mG5OdEAy2lx0j5pXb5l+2++hQblq9hOGNa+jsbD5xyTTWBd
 1JnPo7yb5+JAU18wf3jbYTX1FEWjdmFDskycSOaUHVJaJWp4EPT3PtGP5WWP4pe0iTwQaCslr1Htk6
 6zeRw3o+R4XSFOE2oBw+tn8BY2vMwYyl+VVv3qsVR8CbhvGniV8lHZeJB1gzj1oh1R7dcVwQSJo9Ka
 HogA38uyq4jhg+Nmlb0qvGeBYJcEBcnX2NJRGDo/wAq6tZa5td+vsqNT6eBbkYWj1H2uDxGXnCgV/K
 lKsv09KKbyzT4wRveQlH2GznT4Fp00cA/hgkkHmTvagDTTlkPaUkMjIRTNq7EL2nJURQlDRLkWwDWq
 7tzd4YzGZpiH6iTJvMZbAHNbUVS75iiSlXdgjPdhKZdZ6XIHV2R3XrJe7bFNeIYHCWZlT398fSh8Na
 PxqPzDz/2+3olNVdqFO2MaTmPSEZ8oSKHfAKvznYB2ahERLaVer+z7Tqs29Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The dlg,const-op-mode & dlg,periodic-op-mode were mis-names with twice
the "dlg," prefix, drop one to match the bindings.

This fixes:
sm8150-microsoft-surface-duo.dtb: da7280@4a: 'dlg,const-op-mode' is a required property
	from schema $id: http://devicetree.org/schemas/input/dlg,da7280.yaml#
m8150-microsoft-surface-duo.dtb: da7280@4a: 'dlg,periodic-op-mode' is a required property
	from schema $id: http://devicetree.org/schemas/input/dlg,da7280.yaml#
sm8150-microsoft-surface-duo.dtb: da7280@4a: 'dlg,dlg,const-op-mode', 'dlg,dlg,periodic-op-mode' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/dlg,da7280.yaml#

With the dlg,da7280.yaml converted from dlg,da7280.txt at [1].

[1] https://lore.kernel.org/all/20241206-topic-misc-da7280-convert-v2-1-1c3539f75604@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
index b039773c44653ae8cd5c2b9fdeccbd304ad2c9e5..a1323a8b8e6bfb556a2d6d865f8b560bd6c4d429 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
@@ -376,8 +376,8 @@ da7280@4a {
 		pinctrl-0 = <&da7280_intr_default>;
 
 		dlg,actuator-type = "LRA";
-		dlg,dlg,const-op-mode = <1>;
-		dlg,dlg,periodic-op-mode = <1>;
+		dlg,const-op-mode = <1>;
+		dlg,periodic-op-mode = <1>;
 		dlg,nom-microvolt = <2000000>;
 		dlg,abs-max-microvolt = <2000000>;
 		dlg,imax-microamp = <129000>;

-- 
2.34.1


