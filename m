Return-Path: <linux-arm-msm+bounces-43366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F189FCAB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 12:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2917160642
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 11:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB4A1D4341;
	Thu, 26 Dec 2024 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jcd00+qL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B49156C6A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735213674; cv=none; b=EWHsNOtMnA/ETaf7oHyFtGwDmCi4213TpfLQySkCFCtHEdeZ1N4Difs0qmgehWr/hex6TKw8iiPct1GJFiUrcKmwjowhFBfckqkw3YeEQFP6fRxKwAid1bsj/9j2CmLPFqEhOb6QWN84kd7xMWaQwlsr3DXjyFwnHynK1+TbS0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735213674; c=relaxed/simple;
	bh=i9YSydeB4aBVCJIik+5ceZV1CxKN5SG3XQiYfGd1EJo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L6KGssMUXGyUrFJAFQwHxXlw1YcFp0tZEoxryIWdadvx/KcOWZ9OWPWkonZ8UpoVaAUQmLjPGDOJCTx3RwRi55k/Bk6LFoVCH0Mup9zMwa9Exm1Xpc0eo0WH5amkKwRrTmQQTzGn+JUo80ixZLY2pkSW7NcE+CTZL9FY0JKbgWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jcd00+qL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436249df846so43656605e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 03:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735213671; x=1735818471; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FjQpQOBnsAQuQCuuYwq3bt89+C3Jo2rlsvlqkeFhOy4=;
        b=Jcd00+qLG047qmb8lu6ix1cZCAOoiCTCQ8o8CzTxwoP/hxBMUEKuJKjX1rFcoGh2PN
         QM5INJHAkfkVGiEMW7+4hTdInLseUh2JnzWl1MfxNVozKoEs7V9zq5LhS7PaAbQUResC
         o3S4xG36UMZQ/aaB5bT0PvLq4pp7ECIDGP9FN8byhOSG0is7BvbG7+P4MBTB/wMYAsZC
         t5JEqLobeO8P7NLIoIzSWkZX2s8AQKOape0U63Vl8cqK7HInT0e5Xn4HtEXP+rx2XjOA
         L7+YHoAtJxC6HnmwRjq4Wi+NPiUPraD9gZKw+r/FmWkCFt0laU03TRh3c77YXlPJ+atF
         VBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735213671; x=1735818471;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjQpQOBnsAQuQCuuYwq3bt89+C3Jo2rlsvlqkeFhOy4=;
        b=DTKiOZqC/Gp8zIZwcbIhydntA1k5jC3+MFNEsrQ5BFSZVhpwbtQobeYTbY5RRcoRhC
         QJomesVd2hKDHe3XsBMV6abjHcXDJgFkD8NyLooYazb/mLXEkmaN94h+2YaMLDBorCAo
         cJIkUwCSsFpYhyOsJPU4/fIokeN+VwmR4Z91Pz1YGJ5KWUDbnUZIdjAz+lm37aQYPeMh
         B3bDdjaASbh4SYEmt7sYVsg41gSFsUSEfBC/QIUinNV6F7Gs9kfVTOyd0VANrRs2K2Wv
         kKeqfBrior8KkvXQ8UNYI8fonCKzC6vUERb8suDAuoz/V4N4arBds4oQx6CjH2eMPsWz
         vzkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMbOSD5B0msOmTjc5v/q+O7ylvJJcagf4dSaPRJKozonXGfm9vo9v1fDVdF6j2dJGUR2h1yYVZqvexFlVH@vger.kernel.org
X-Gm-Message-State: AOJu0YzNHOY5UhzEFkqkJLpVkaUUp8TUMvbFOODmU2ZHIxmcuG31YIup
	x174+Xu0gfeezlKuLpXd07Yl2/XR2Ww35/B+2vSl/uLQiLhbAyAtPAV+Z4tvtcA=
X-Gm-Gg: ASbGncvR1kKzXfRcqEJRn0eF6TMbrl6vVbS3+CgoTOnCaQtGZ39HZkI/Zrbrf5pt3/H
	ysTziwsGStkK3jlP7tR/7jnU5OBUyXO67AsZKPTVieVR9irhISMIuzbUWKDyOlXylzHmPvm+8lR
	/F1W4n5DiCq97mwiHqOI/Hx7iAafSmUz9DYAhyW46Vs0YJfH1Ozk2d4pT8E212tSm/aNZWgcZ3I
	w4DdnuTdnTzaYO19cWfPHo0Bv5utLrn91pUcJGGcEoqD+HbX+MChPMz
X-Google-Smtp-Source: AGHT+IGdCgRKGMApMvOsj+CIB7nc+uWPPU3rs6XYm2MhAHq7Hlyna9ulgBN/+aNKHhnLDAWOFZLmUg==
X-Received: by 2002:a05:600c:3b86:b0:434:ff9d:a3a1 with SMTP id 5b1f17b1804b1-4366854826cmr174214165e9.2.1735213670641;
        Thu, 26 Dec 2024 03:47:50 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364a379d69sm256925895e9.0.2024.12.26.03.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 03:47:49 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v5 0/2] arm64: dts: qcom: x1e80100: Describe SDCs and
 enable support on QCP
Date: Thu, 26 Dec 2024 13:47:37 +0200
Message-Id: <20241226-x1e80100-qcp-sdhc-v5-0-0b28f2e13c85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFlCbWcC/23NwQrCMAyA4VeRnq00adZVT76HeKht5gqyzVaGI
 nt3qyAq7pY/kC93kTlFzmKzuIvEY8yx70pUy4XwreuOLGMoLVAhgVK1vAJbVSZ59oPMofUSKl+
 DCS6syYhyNyRu4vVl7val25gvfbq9Xozw3L41O6ONIJUMDTfk1+hYw/YUO5f6VZ+O4smN+EUAz
 RFYCGss18pZrFj9EfqLQJwjdCHIeFLAGv2h+SPoQyDMElQIV5Mny2ys0z/ENE0PJgZQhnwBAAA
 =
X-Change-ID: 20241007-x1e80100-qcp-sdhc-15c716dad946
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=i9YSydeB4aBVCJIik+5ceZV1CxKN5SG3XQiYfGd1EJo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnbUJfQzfkqE8wTi8FQOAPU5gZqqOB1VljdLYvF
 HRgczh680aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ21CXwAKCRAbX0TJAJUV
 Vkx1D/4i18ZlTfvL99yEHhx8riHENz40DDETR4bDgesdjyzPP+xnAZC8Jjw2QHSN04rlI6LpShM
 0qCVbXnMXaS1REVHHiOhZhqKy0i6q1Rlc9J+HrGmqizVFzitYIXD+pZK4n+t5ftZihvSwCmlzDn
 HiAGSTgNj9hej7IDVRIIwk10wP1czgcBz/DpCEunEc4ffzNxHO+cnwV6/ikAI3f29cmjfbkOLxe
 m0yyNS++IVFHLiYDAMba5rcxGnmu16f2io13xKmQFVcUKGksM5dpjdtp82x7zBxj7cHTDl2j/oD
 fxvcO1tI1WEurOqOI49Ap0QjsSuGD7jZGUb+zXyKK8hfFAgjKTvCCtnWh9tmdGg9aSLmJ1Hx+fi
 qTA5CH51cdwoXowzZKTcBQ8YYZ7VuBQJJvP5RI2mHWSf9orshddaDDEOPzKscPbJL2pprplGCnz
 x6FaGXhtTz1TnDckdt24YTcV9FQHn11jbi0Hpzz7Ywu1OQqGbTIQ1XbbndAJDNnJHjv7SJ6xQCx
 pYAScB2qHxRNZywdDb1bzOHChoEtMpYHbhi5k+WE1rKk4wqVSy4xvXgKfbWkGzwwusDHapx02gY
 vUo2c7DVRwdgO6dCtiCgk6Cd8g/iqceYEv0W8XOZJO5B6tseuTFx2lK8lDereDijHsKIy5k8cxi
 xg7QVgid/nduJUw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X1E80100 has two SDHC controllers (called SDC2 and SDC4).
Describe both of them and enable the SDC2 on QCP. This brings
SD card support for the microSD port on QCP.

The SDC4 is described but there is no device outthere yet that makes
use of it, AFAIK.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v5:
- Switched the interconnect paths tags to QCOM_ICC_TAG_ALWAYS and
  QCOM_ICC_TAG_ACTIVE_ONLY, as Konrad suggested. 
- Actually enabled the sdhc on QCP (status = "okay" was missing).
- Rebased to fix conflicts due to smb2360 nodes which were already
  merged.
- Link to v4: https://lore.kernel.org/r/20241212-x1e80100-qcp-sdhc-v4-0-a74c48ee68a3@linaro.org

Changes in v4:
- Squashed the pinconf for SDC2 into the patch that describes the
  controllers.
- Reworded the commit messages a bit.
- Link to v3: https://lore.kernel.org/r/20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org

Changes in v3:
- Reordered the default and sleep pinconfs. Also the bias and
  drive-strength properties. As per Konrad's suggestion.
- Link to v2: https://lore.kernel.org/r/20241014-x1e80100-qcp-sdhc-v2-0-868e70a825e0@linaro.org

Changes in v2:
- rebased on next-20241011
- dropped the bindings schema update patch
- dropped the sdhci-caps-mask properties from both
  controllers as SDR104/SDR50 are actually supported
- Link to v1: https://lore.kernel.org/r/20241008-x1e80100-qcp-sdhc-v1-0-dfef4c92ae31@linaro.org

---
Abel Vesa (2):
      arm64: dts: qcom: x1e80100: Describe the SDHC controllers
      arm64: dts: qcom: x1e80100-qcp: Enable SD card support

 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts |  21 +++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 146 ++++++++++++++++++++++++++++++
 2 files changed, 167 insertions(+)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241007-x1e80100-qcp-sdhc-15c716dad946

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


