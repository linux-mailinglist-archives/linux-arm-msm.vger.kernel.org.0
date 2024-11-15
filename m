Return-Path: <linux-arm-msm+bounces-37956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE7A9CD95B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 07:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3474EB23C3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 06:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CE615FD13;
	Fri, 15 Nov 2024 06:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fIsz8yYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D82185924
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731653966; cv=none; b=m2Hd5ctNSathr26KbbNrIBRfOfiIzGA6eav8aOc90KwAQ80864ya/PDHHRglb8zBiPPVyYnE8If9GPm5hHbQEFDabu0/eDYtS6Bs73ziUIfPto2l/nw+CmlzZdE48IJfZ79PEnuZNA+h7N3lCdj/5caxvGCg4WTRaawN9mXwkpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731653966; c=relaxed/simple;
	bh=vCdT0PSYt7ug/bjF626EO7sSeIjB87TMkLXNwZ9G7Ew=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bPwkLL3zCozVa8BcD4BJlqPJlZXU8NBhYCJhtTkleNm8Q1NfC81PUUayIRj86BT5nWAlA4UhUwtHWGTYm4S1EpTBM40iXHS1bPqO5PsJHbqd2qLwpPP8S+hoi9uRKbWUkPVa3qq6Oot+NLFT7hmRyIGHLGhqMaRoKDbam4QOtvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fIsz8yYa; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso15567611fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 22:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731653963; x=1732258763; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8cfWVnQzgW/o8QfkeZ4D6IstQJzWOaYah0IgQm88BY=;
        b=fIsz8yYaLkPT3nxs0Upaxo+RhEfZzz4ZKLh3M5+XxOFq3Ao7vwbij/Jqa+PONpIcDO
         RWofzEXoXEro92wY8l7yg8fBmFd/4/m3ZRYDWivKWyigU5fdYAXufFetdmM2kcGq26Cc
         skoUusUWciSoQL/Dh+phDDAUGR8jaFvrpEybj7MonoStthzLbysfn9m/HQZ5OjCv4CY0
         zoJm9yIdQTpPv1I0S8/AqT86SNV6FlpwjrtbfwE2smsk5swlcoJNPMTF1JIXFrOC+i7c
         LmvUDaxkMEQL4u3c+1STRC8ZBi5Zm78fyuDrRJQW0YKa/NvHD8x99qtHiGvvuAq8RPU8
         VSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731653963; x=1732258763;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8cfWVnQzgW/o8QfkeZ4D6IstQJzWOaYah0IgQm88BY=;
        b=lcbKNK6GDNHUmUTuCGzMCzDGdOIK+u+jdu2ois7apNeW9VZ4Wk88XUKdDXEN6VJTUQ
         ZTi2VodXpqtgpYi/16VVWK5ymSK4tKpKjSWKNyIZvEReAG8nVGCAmqtxxrB5LwJ5+/OH
         6sfxXSXRtvZO0cPkpy+PbRL5OSyOo1h/3oYPL3codoURcPLMRvedqqWu9WcUpAT0uLVs
         P4T2EsBA/DBmEF4gqcWTQPwiPjhjLQ4crLbT+4qKJllb8b7MCRy+4s2PfnGLzPHgtqeu
         tarrbeHq3lBHzKUAq3RiqMBKgmBPNVEmQI6b4u+GCtSq3+wjDwF2iF6866JSuTbg0wOy
         3EGg==
X-Gm-Message-State: AOJu0YwDlsQOotVe6WKhT5Zyo9s4U4oydvXzFkqRgbW0B6izkVaPYBxF
	TBNmqinG5a+K9ZgJP/6yHiBK3fhQWIUVZM1ozgdMCx2h6F2WnCcBMSeDguXkpXE=
X-Google-Smtp-Source: AGHT+IGR14P71JvmfPxscnZ8AtrJiDNaABAoCva8RLK6hhRhDLztxqxeX/QSTGO3aJyFaA8uuOmTfQ==
X-Received: by 2002:a05:651c:1543:b0:2fb:407b:1702 with SMTP id 38308e7fff4ca-2ff606618ecmr7216791fa.20.1731653963122;
        Thu, 14 Nov 2024 22:59:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff5988ffdbsm4438281fa.111.2024.11.14.22.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:59:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC 0/2] arm64: dts: qcom: move board clocks to DTS files
Date: Fri, 15 Nov 2024 08:59:19 +0200
Message-Id: <20241115-fix-board-clocks-v1-0-8cb00a4f57c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEfxNmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ0NT3bTMCt2k/MSiFN3knPzk7GLdVOPEtFRTIwMzI/NkJaC2gqJUoBq
 wkdFKQW7OSrG1tQD4+HsoZwAAAA==
X-Change-ID: 20241115-fix-board-clocks-e3afe520627c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2377;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vCdT0PSYt7ug/bjF626EO7sSeIjB87TMkLXNwZ9G7Ew=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnNvFIJY4yUnhWZoSpTYrIbc8hNlNDQmafk95eG
 N/n2jCZI+qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZzbxSAAKCRCLPIo+Aiko
 1SB2CACr8iWTqBO8VkWl670KxlCnGUnppG7N0fIiL9BKA9sxN5E4b+aS3FM1bt7bjxoxhlL1nag
 zdq+VSh+Wax6PSYWqTUMQ+4sukwj8Y/kCb0vkVkEYiHlfDkFPM4ZVkLxVf7msx6Be4OW4yitsS8
 J3oYzLikmRpV/zwOLBqRag1NaU60hIdTKFSYSslG8kiLIcDfaqZP3GWWaoJlDn+JekL8KWr0cXV
 Vx39mCFyXYgt667kellvUMGhmEyG9WQjKrX267SFl9CIot0F2glDWUQhfQ8aCIZ4z+uCD8H1lwQ
 NiDkAfD3vLL2NJT3hgynWug1e2SmS8x6Xd+K++Q4Oet0XoRp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Multiple Qualcomm platforms play strange tricks with board-level clocks
(XO, sleep) definitions. On some (older) platforms such clocks are
completely defined within SoC.dtsi file (although these clocks are not a
part of the SoC). On other platforms definitions of such clocks  are
split between the SoC dtsi file and the board file.
Such definitions don't fully follow the DT guidelines. Move these two
clocks to the board files completely.

Being an RFC this series converts two platforms as a way to raise the
question. However note, this is still not fully correct.

The XO clock is (usually) an external crystal used by the external PMIC,
which then provides RF CLK and LN BB CLK to the main SoC. However for
technical reasons this part of the PMIC is modelled as a part of the SoC
as RPM or RPMh clock controllers. It makes it impractical to describe XO
clock as being used or being connected to the PMIC.

Sleep clock is a 32 KHz or 32.768 kHz RC oscillator provided by one of
PMICs. However pushing it into the PMIC might interact badly with fw
devlink, causing unnecessary probe delays and/or devlink loops. One of
the possible solutions might be to move it to the corresponding
PMIC.dtsi, but model the clock outside of the PMIC node, providing
/clocks/sleep-clk node from that file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      arm64: dts: qcom: sm8450: move board clocks to DTS files
      arm64: dts: qcom: sm8650: move board clocks to DTS files

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            | 14 ++++++++++++++
 .../boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi   | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 14 --------------
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 22 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            | 22 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            | 22 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ----------
 8 files changed, 84 insertions(+), 48 deletions(-)
---
base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
change-id: 20241115-fix-board-clocks-e3afe520627c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


