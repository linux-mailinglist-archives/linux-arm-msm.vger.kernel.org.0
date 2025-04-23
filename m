Return-Path: <linux-arm-msm+bounces-55229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0017AA99B68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 00:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34AAC4468A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 22:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F6A1EFF89;
	Wed, 23 Apr 2025 22:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oTtJGmQW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A58B1E32D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 22:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446806; cv=none; b=oQzSlEqcWPzkoUd4AYZHBkNj4i0U+7inCTYn94IZHEFFzeTU2AF4wFNrAVYp6CG1WVI5FH4BmkFxvgLqPoqeX35QOpa+l6NDxmRDw7sGTRB1lzOOjM2HHuXydXJ3cIJIPkIUUXFPIuYNP0//WeqF364dpMHHhYBQfKIEUnWhVpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446806; c=relaxed/simple;
	bh=RSUTCU68FCqDB21S9KgT6s2cR6CgFEajX3jGLDzwP7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f+hiXdIbKwiLhRGYFy0TuHlP+ehiFK5OGmQqtjuOYtIL3/DZuJlRbAPvj7PnUdlJS9Dhet/odmiUqRQg5BucUg8PNZsHWUsZhl0Zoj87EgESdjVPqrwMR5BNLmKH90xBrhceQDHnvtvdGOkRSlfFkD1lADlQOJgPCrdFxFhyFiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oTtJGmQW; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54d72d40343so69081e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 15:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745446803; x=1746051603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxj8CXB8A0+AOQKhy0bB4YPelvc0XBl9NfkObhujdjk=;
        b=oTtJGmQWQ0VLHdMlEG+LMrD4Zen/p8q1yKUvRUaw4kmTP8gPjj3bpz08CSpvGwga2J
         MGGkGEJ1fAvGzKshLLyKsv2rJ5mdcZ8S8VeURL/kl3TgP61GZegVy3TCalGV2M9X8H1w
         2i7tI0y+W6j93rOtD2OWNN+0zSFlzemG6WsHs3WXLyImwdiJ5L0XUgdPIFXD/pZpYopD
         Nc2EPsPlqzwimZVRkVDGuOR19hgx2G20k3m8lvhpCvHtHOh/Kpe18RaobstfkE27EhDO
         T+z4ArtDLfaLVOgzOTONnj+5O2YXTuDeRmhtwcZ/q07ZUPfupFnwK5RA2Z607Hszy0Hi
         sKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745446803; x=1746051603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxj8CXB8A0+AOQKhy0bB4YPelvc0XBl9NfkObhujdjk=;
        b=jRwR2U/XBZ43656yYheeDsQlkZsIF6+pwCzflTw6jiOA12HR4cr7DFMvGb3iNND3Ar
         obyBu9IqgtFfr4RsAlqruW+65bDBLsLvcRdnwPIgz4YLfwx5FcJg33SVPAs/DVEPbP0U
         HHlvAUvXV0yAmZ7e+TdOG5cO1sz37RyqO+x1xpk3xOOSuDX3dGaS4ptjliVTSMOO5v6Y
         Z3zB27/MekX6TeDqMii3Q4f+kg62i/hE39dcM3lAz7qx7EtiDeEh8/ryqVwVkqoQIcJy
         h+dD/9WQevEbrjvZ7HYgGVDM8eCGTScncryrrFfoo14+tJTWPpGYaCa16Awt468RX8dn
         Ph3A==
X-Forwarded-Encrypted: i=1; AJvYcCVRJljPFjqc0auWsFqSlRngqm/w3TL2+9iDmXzPugacM7X0uZslg2eNrWz+C3CTDWtB1ApzD3XhgfJBYVI3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgv2I4r5mIcDp+Ksg6u3PxbeabfXTVrq6QSrMAReaH1neaJSou
	2AChGwPkLmE9dWSVsrAwcG7MHFTSn4C3DzAWWMcjZYPd2UU4Je2oT+k3tDORxFievoUEensfJCW
	i
X-Gm-Gg: ASbGncsrNpH5N4HvUD1VYkuZke1mUcjkxpXnKrIuqR3JNIA/pHrjBW9cU3eLFkk8VyR
	U66O2JKHUmyx0dDVj4t1omfMmuqEmrVrb8KNO9NjJFVUVFBPxrc6/SAqXWuSCQJdKSqTBWYB8lc
	a8vxBQJEJy9clL8cbrRLYuUL5GtVkZYdTJz8f+zva9BvqWf9HeYMmX3YOrieD72O1h4nL8hIj9D
	Fqjgpi8MrDawH2w6DDIMovIx+l4VO7STkCuf5HZQ/kDXHPYb1OSIqMwCamnN/9fcbBNNDT3W6Lm
	ns7heyQcf3RLEW+kaP56oCEfOQp2nz/qahmCbV3NxNAthUAvGihu/5T+66BBECrXZGVrflPCXBz
	otqKL69yRqGBFF4dpl2BCHap55qcjxw==
X-Google-Smtp-Source: AGHT+IHsSJlTpXY6Fa9RVsSz88cws7OogMJx6T/Q4T81Tfoj7+YH6RmAUw7WURekUDGf6SZSD2VAFA==
X-Received: by 2002:a05:6512:124c:b0:546:2f7a:38a9 with SMTP id 2adb3069b0e04-54e7c3e92e5mr63434e87.3.1745446803063;
        Wed, 23 Apr 2025 15:20:03 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb371a2sm19547e87.57.2025.04.23.15.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 15:20:01 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: qcom: sm8650: Add CAMSS device tree node
Date: Thu, 24 Apr 2025 01:19:51 +0300
Message-ID: <20250423221954.1926453-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm SM8650 SoC contains a camera subsystem IP, which is
got supported in the platform device tree by this change series.

Qualcomm SM8650 CAMSS IP contains of
* 6 x CSIPHY,
* 3 x CSID,
* 2 x CSID Lite,
* 3 x IFE,
* 2 x IFE Lite.

v1 version of the changeset:
- https://lore.kernel.org/linux-media/20250312001132.1832655-1-vladimir.zapolskiy@linaro.org

Changes from v1 to v2:
* to support a regex in port property names replaced 'properties' with
  'patternProperties', a sanity check shall pass now, thanks to Dmitry,
* added a few new line separators between property groups in sm8650.dtsi
  and qcom,sm8650-camss.yaml dt bindings documentation, thanks to Bryan,
* added the fourth interrupt cell value needed for v6.15, thanks to Neil,
* added a given Reviewed-by tag to one of the patches, thanks to Bryan,
* rebased for v6.16.

Vladimir Zapolskiy (3):
  dt-bindings: media: Describe Qualcomm SM8650 CAMSS IP
  arm64: dts: qcom: sm8650: Add CAMSS block definition
  arm64: dts: qcom: sm8650: Add description of MCLK pins

 .../bindings/media/qcom,sm8650-camss.yaml     | 394 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi          | 333 +++++++++++++++
 2 files changed, 727 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml

-- 
2.45.2


