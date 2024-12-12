Return-Path: <linux-arm-msm+bounces-41608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6378C9EDC73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D2FB18897DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421B4FC02;
	Thu, 12 Dec 2024 00:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hKCjdvhT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466115684
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733963159; cv=none; b=T8yKOaj7vdUmtAugnmW6oKMRgpxyvtMEzIHUW6zXUMmzC2D7EpKnq77LKANHXz4PNqNKhmOKw5250m+M5Z4heQZp+d7pbOmUf4Tb3mxKuaBc3Va5HngsO1NEfzLgW34b5n10iKHY5FsmGAZV0ZouW1HYZ/cJ0mdgAgXIkdiF70M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733963159; c=relaxed/simple;
	bh=VMRhznEfuWRzm4PskXKJVX6kiXv2IdahJDfuMosc19g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B3GHYoiiUFe0mzB4joBdx6t73rjNSy2z85IOnP/V+UpMowOO4pcSnpZDtIU+X7D9LzzchLkgdlZud9nWyqtJQLNlepVCAkFPK3eFdIeOrUcfrssDdYyZR6muFgip9wM1YwG6XDmPno2vhNCgt/o/acTbwT7rIpp/1R2nQcn1TV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hKCjdvhT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so308645e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 16:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733963154; x=1734567954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19KAgtQ3cw31dITBtSLiYsrKex1kzCFQG+F837LVi9w=;
        b=hKCjdvhT9fNckN373W0BpfhaPMK8pKL1Od1WN0HBFEmWQI2N2T+0IwqmHtHKXpOC7K
         4/6Z7Nk6/6ueneNKASTpyeIrK43UuZoNYJ4/zpc6TTJvRjmxsYNRreuhMDatuMP3BBlR
         XVkENOFOBhvPAQTFOD0ups1R0AEYDCNxkuqSQvDR2q3q1y2m0Qa0X7dNPY6WmSvUqUxb
         UuwTqI+olAvXjK0G7W+6hvKlg4yJMeOFHeiW7ZRsm8+vgkBOjswZqu8vOYsZsAykO5zI
         jBOHu8fdJFdOh3oM2ObMRRtQOCwEWV1dvUfRzS6eWlWQJv+AMz5ZwDSVQjxEzRjjfNm1
         hdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733963154; x=1734567954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19KAgtQ3cw31dITBtSLiYsrKex1kzCFQG+F837LVi9w=;
        b=jMfs+rzjwwI9jgy/DmTPKpU2BTr8ZjlK2QUvW5dFMZuymBs4Hr8vRTK2SwHGHmuj70
         LfVdEx78G/wcmQQRM8cmwig0jj0PI1Ro6LGdWbNzm9G2Ur29eru/ZubeipkbT6a6YXSr
         jh9vCd7ftaZ1WHGiGkOU3VDOy/nadTZkah4JuzJTfidqCxYF5Al9Iby7uySd4DyrniT1
         9OgPX1n7LkJ/jO7Qi2QHhMN5BqhqQL8kEs+KDZiu2bwkVwzjrYcnC/xYZlrC69GMzabf
         +x33AKJogj5GIAzrCNC9k9eneltyGKktuqlBbjL/rsjrN8lUPtpLy1qZ1Xy7q27K5seo
         Qj0w==
X-Forwarded-Encrypted: i=1; AJvYcCWU9V0sPREsor9Y/PoRyV+E6iPmQ3GX9e6fbZ9crp738UNLEh7wSaIm9bAe19mj8kIJXsJtqM/j9ukPMqjU@vger.kernel.org
X-Gm-Message-State: AOJu0YzPzOAIfP8yimJuaCpK0c+X34Vp7BpNCMDOFHnEX089uI36YicM
	30eeK+KxLcwy0OnP2aJoBe21vVRh9LrirZRa0eRTy8GNh+68n/HnlHLkeEEPhh4=
X-Gm-Gg: ASbGncvvI9ZuqL/wyrHX5qSOGP+UYbbE++nF2HASGcy2uDejDggFVF6yVAclq3pphLd
	1FKJNvimEIr9hz5iWlgiGcqny6seLUEm5Dshe4Z1Xf56cJbcRPStGuEPgREwLS4BoXefh3Ueq6J
	NvKfKi9n+G5vehOC2dd8iA7W/46xoNygSZPhpCiJSO6RH8jxWVXMgZlKsjn+dmN8xTgV0Z9f3mF
	Wfos7ZpqmB9bPebcrW4HuDTQnPiVjZfLP+IyfK+Kclj9KxQU7EX44oKvBmtiiQuAapMX1vh
X-Google-Smtp-Source: AGHT+IGvxDqLJUy3fFQzIVuzvp27FetMomZVJ18+KKI8WYt/hlHo5f831O2u91CuH917Kdc7PAT0Rw==
X-Received: by 2002:a05:600c:b99:b0:434:9c60:95a3 with SMTP id 5b1f17b1804b1-4362282abaamr12382335e9.11.1733963154513;
        Wed, 11 Dec 2024 16:25:54 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625553333sm46095e9.6.2024.12.11.16.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:25:53 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	krzk+dt@kernel.org
Cc: konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND 0/2] Qualcomm sm6115 LPASS clock controller
Date: Thu, 12 Dec 2024 00:25:49 +0000
Message-ID: <20241212002551.2902954-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates from previous version:
-- no updates, just resend.
The same version as here: https://lore.kernel.org/linux-clk/20241101012247.216825-1-alexey.klimov@linaro.org/
just rebased and re-tested.

This is one of the required dependencies for audio support on sm6115 and
its derivatives SoCs. This was written by Konrad Dybcio, however his linaro
email is already invalid. Konrad suggested sending it as-is and keeping
him in c/c. Some updates may be still required, for instance the
maintainers line in DT bindings file.

This was tested on QRB4210 (Qualcomm RB2 board). The only changes from my
side were fixing compilation errors and small changes in commit messages.

This is second attempt and v2 as suggested.

Changes in v2:
 -- added Reviewed-by tag to first patch;
 -- removed the second example as suggested by Krzysztof in the first patch;
 -- dropped patch "clk: qcom: reset: Increase max reset delay", the change
 already landed.

URL to initial series by Konrad:
https://lore.kernel.org/linux-clk/20230825-topic-6115_lpasscc-v1-0-d4857be298e3@linaro.org/
URL to failed attempt to send it recently:
https://lore.kernel.org/linux-clk/20241017005800.1175419-1-alexey.klimov@linaro.org/

Konrad Dybcio (2):
  dt-bindings: clock: Add Qualcomm SM6115 LPASS clock controller
  clk: qcom: Add SM6115 LPASSCC

 .../bindings/clock/qcom,sm6115-lpasscc.yaml   | 46 ++++++++++
 drivers/clk/qcom/Kconfig                      |  9 ++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-sm6115.c             | 85 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sm6115-lpasscc.h   | 15 ++++
 5 files changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-sm6115.c
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-lpasscc.h

-- 
2.45.2


