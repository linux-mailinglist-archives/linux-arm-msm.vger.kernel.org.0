Return-Path: <linux-arm-msm+bounces-43674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B22C9FE941
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 18:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73CE83A2393
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 17:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AB41ADFE4;
	Mon, 30 Dec 2024 17:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WPHcCtZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC5886334
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 17:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735578045; cv=none; b=MNWV+iV84wkrRo1cJT3pDhRRapfTx0D6SMICeSVRevwmys8gPW734ZZa1V4XsZtX11nIgVGmvxrPU2AaJfP9HFeqLLYrJUnED875KtfDB8YzmUtqWl/9n1l37TtMCIjVSKy0Zk7qq7ltoxhCW4ud3KZrJEpOVCUW9YY61imz9D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735578045; c=relaxed/simple;
	bh=kURA7o7aqA+HiAjUEE275GbuAo5azOw4NHqeZjBSpUw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dGlmVn2LETWUFDjMXO7yKAzjGoYWsqQR5HE2lXwgXsMUTEOgP3wYUZ7n9ySDhcCx/9VAE2HrADAwIGmpEvlhG6ChC8TrZfq8PVWk5fmjXyUq0Cx6Hi/bA//HxqLQtDRHo349RfsZ69nZBO4gvWNRie4kBlntCiwod/Q7VDnbfLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WPHcCtZn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso63440175e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 09:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735578041; x=1736182841; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vjWl+cSNbynsKxqcEoR2/YImYP9Ijn1wUxi9H5BocWg=;
        b=WPHcCtZnSy0MUYvplc5vvRqA0+BAvc/W3xmmGC/hsbLZVf1uch1yG0sdW0y+IGLWJW
         nKFHhzYJt7NGyZj1XGyiv8UB9cxFkqQ9YE9n7JUiX7nm6Tf3mDAeK2zcSfxVqKELYp2b
         VVNERz5zDKLpufxtUi2qc6SCgpXrOPS99en4MRVweYXVD4AuQOru8AFcCGWavOA27zBX
         RAQk/w+QGsdDVCKDeXX0k163WMtT0ZxR8b0qaZAXsGdi33JC3PHcivSfVmIrGQHQZGLT
         oNiQf7NcFCInBhUGqh/RO8qRVX25Rmm+PQmwzOPqoyTFx2Lm8uVBCS72hLkfahhM3i3I
         SP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735578041; x=1736182841;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjWl+cSNbynsKxqcEoR2/YImYP9Ijn1wUxi9H5BocWg=;
        b=Eu6ymoeB+I+/xRWYxiSYJ1KN/j8HlacaLeL+zsWKke6aK73pjj1+3Z9IkBD3+SKymI
         kCFEKtoakytAahOdS8VjlN7M5YeQhyGBHaUKbNcgzz1EocSRuBtGAEtHI1KJH+njxg/x
         sdvqcvy2lDKCIi4Nq1wupqY/sqArqH4OWs+BxQNPEx3n312TKxc6024N3jZsv+mu+kD+
         r/yJvGQpBTXiCIVT6qPXsJFjn58lpWPUtdI3N6SHlFjQdPfMjwZ8Jpe6xec6+vglnYTQ
         LFfwQoqPLVBbMcEQNivY+yhd8iyUJvyO3/hdWE2xKzE9lXVl/RDl3albbtJRVkLhhNtV
         HcuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjmZyhJSNrJjaaijxuPyJZXNcCT+7We/uG1wGLWlpwIj+L+i8jEElNK9BOq/wM2z2JKMUtSo65509AubwW@vger.kernel.org
X-Gm-Message-State: AOJu0Yytl+iqjyF/9kwNSRvmZst9hKk33U1Mem3YXWS3W3KShQi2Rp3t
	fk9uvIEqMiSlZhqxJatgx9LKa0Zb1cD7bh4qZD6xdGaG/BFEBOXHRrugWdBLREM=
X-Gm-Gg: ASbGncuN9k5TR7+P79Rier/SrExwBh8CqbllyJDhP03eqSjQnmPEx2BkuLTKCV2MD+s
	81BjW2Lhp1JAbPjyWTDGfU9Y5eNFcjDgGwx7UakX1FMHg72VXhiL+/lThWf8vQQqJxBKTrvmlxs
	XjGZ7RUMjA96wanXizzh3pltPG9R+oBtsyMHhuSHMEXPSgCxMuTWRtUmryi4Z8P7vcsI7bUFmQR
	4ExmeuUQo2hcIw4g2hc+Qu9l8ATPoLcy2mew8ZAauux81Nutpbx361qj6JrElwnlA==
X-Google-Smtp-Source: AGHT+IFbQYRuxdc0FKJEy3ZQahDjTHSxWr6YeT2H60Bvmm7u4AFwu1iK5XwFiexTcy5BfjlADgT+ag==
X-Received: by 2002:a5d:5f8b:0:b0:386:3327:bf85 with SMTP id ffacd0b85a97d-38a223fd38amr35121672f8f.53.1735578040613;
        Mon, 30 Dec 2024 09:00:40 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611fc161sm359757955e9.10.2024.12.30.09.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 09:00:40 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 0/3] media: venus: Provide support for selecting
 encoder/decoder from in-driver
Date: Mon, 30 Dec 2024 17:00:32 +0000
Message-Id: <20241230-media-staging-24-11-25-rb3-hw-compat-string-v6-0-a4d5070d3aaa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALDRcmcC/6XRy07DMBAF0F+pvGaQPX4k7or/QCz8TCzRuLKjA
 Kry7zjZAMqqdHlnpHNHmhupoaRQyfl0IyUsqaY8taCeTsSNZhoCJN8yQYqCMezgEnwyUGczpGk
 AFMAYoIRiOYwf4PLlaua2Lts2GO601rynyEgTryXE9Lm3vb61PKY65/K1ly9sm/6vZ2FAQWvHV
 ESlrFAv72kyJT/nMpCtaMEHcGy4o4xGL2TsYjzg/AGcNzxEZT3KoHtvD7j4jff34aLh0VOFlrc
 vdOKAyx8cqb4Pl/vlXZCxl5FT/IOv6/oNkGI6m1sCAAA=
X-Change-ID: 20241127-media-staging-24-11-25-rb3-hw-compat-string-ea3c99938021
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

v6:
- Captures and returns up the callstack error codes from venus_add_dynamic_nodes() - Stan
- Adds Tested-by to patches 1 & 2 - Renjiang, Krzysztof 
- Link to v5: https://lore.kernel.org/r/20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org

v5:
- Fixes venus_remove_dynamic_nodes() on probe err path - Dikshita
- Link to v4: https://lore.kernel.org/r/20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-0-fd062b399374@linaro.org

v4:

- Adds some unavoidable conditional CONFIG_OF_DYNAMIC to fix media-ci testcase # Test build:OF x86_64
- Added logic for of_changeset_revert() and of_changeset_destroy() on
  error/remove paths - Bryan
- Link to v3: https://lore.kernel.org/r/20241127-media-staging-24-11-25-rb3-hw-compat-string-v3-0-ef6bd25e98db@linaro.org

v3:
- Adds select OF_DYNAMIC to venus/Kconfig to ensure of_changeset_*() is
  available. Instead of ifdefing and have the fix not work without
  OF_DYNAMIC, select OF_DYANMIC with venus - linux-media-ci
- Link to v2: https://lore.kernel.org/r/20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-0-c010fd45f7ff@linaro.org

v2:
- Removes useless dev_info() leftover from debugging - Bryan
  Link: https://lore.kernel.org/r/ce9ac473-2f73-4c7a-97b1-08be39f3adb4@linaro.org
- Trivial newline change @ np = of_changeset_create_node(ocs, dev->of_node, node_name); - Bryan
- Fixes a missing goto identified by smatch - Smatch/Bryan
- Adds Krzysztof's RB to deprecated - Krzysztof
- Link to v1: https://lore.kernel.org/r/20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org

v1:
Various venus patches have been held up due to the misuse of DT to provide
a configuration input to venus as to which mode a given transcoder should
be in.

Link: https://lore.kernel.org/linux-arm-msm/436145fd-d65f-44ec-b950-c434775187ca@kernel.org
Link: https://lore.kernel.org/linux-media/ba40de82-b308-67b1-5751-bb2d95f2b8a5@linaro.org/

This series provides support for static configuration of venus from the resource
structure via:

1. Adding two strings to the resource structure.
   One string for the decoder one for the encoder.
2. The string for each SoC has been matched to the existing in the
   DT which currently specifies the mode as decoder or encoder.
3. New logic in the driver parses the DTB looking for the node name
   specified for the decoder and encoder .
4. If the DTB contains the node name, then no new node is added as
   we assume to be working with an "old" DTB.
5. If the DTB does not contain the specified decoder/encoder string
   then a new in-memory node is added which contains a compat string
   consistent with upstream compat strings used to currently select
   between the decoder and encoder respectively.
6. In this way new venus driver entries may be added which respect
   the requirement to move mode selection out of DTB and into driver.
7. Simple instances of decoder/encoder nodes in the yaml schema have been
   marked as deprecated.
8. Since the proposed scheme here always defers to what the DTB says that
   means it would be possible to remove decoder/encoder entries for the
   deprecated schema should we choose to do so at a later date but,
   that step is not taken in this series.
9. Some of the upstream encoder/decoder nodes for example sdm630/sdm660
   also contain clock and power-domain information and have not been
   updated with the static configuration data or had the schema amended to
   deprecate values. Because these nodes impart hardware specific
   information and are already upstream this series proposes to leave
   those as-is.

However if this scheme is adopted it should allow for addition of venus for
both qcs615[1] and sc8280xp[2].

Other SoCs such as sm8550, sm8650 and beyond are expected to be supported
by Iris.

The sm8350 and sm8280xp in the second series would then be able to excise
the offending compat = "video-encoder" | "video-decoder" in the schema and
DT.

I considered making this series an all singing all dancing method to select
between encoder and decoder for all SoCs but, the objective here is not to
add functionality but to provide support for configuration in-driver
consistent with current usage and to do so with a minimal code
intervention.

So far I've tested on RB3 by removing:

video-core0 {
	compatible = "venus-decoder";
};

video-core1 {
	compatible = "venus-encoder";
};

This works - the code adds the nodes into memory and the video
encoder/decoder logic in the plaform code runs.

Similarly if the nodes are left in-place then no new nodes are added by the
code in this series and still both encoder and decoder probe.

Thus proving the code works and will provide support for new platforms
while also leaving open the option of dropping nodes from upstream.

I've left the dropping step out for now, it can be implemented later.

[1] https://lore.kernel.org/linux-arm-msm/20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com
[2] https://lore.kernel.org/linux-media/20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org/

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (3):
      media: venus: Add support for static video encoder/decoder declarations
      media: venus: Populate video encoder/decoder nodename entries
      media: dt-bindings: qcom-venus: Deprecate video-decoder and video-encoder where applicable

 .../bindings/media/qcom,msm8916-venus.yaml         |  12 +--
 .../bindings/media/qcom,sc7180-venus.yaml          |  12 +--
 .../bindings/media/qcom,sc7280-venus.yaml          |  12 +--
 .../bindings/media/qcom,sdm845-venus-v2.yaml       |  12 +--
 .../bindings/media/qcom,sm8250-venus.yaml          |  12 +--
 drivers/media/platform/qcom/venus/Kconfig          |   1 +
 drivers/media/platform/qcom/venus/core.c           | 105 ++++++++++++++++++++-
 drivers/media/platform/qcom/venus/core.h           |   4 +
 8 files changed, 119 insertions(+), 51 deletions(-)
---
base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
change-id: 20241127-media-staging-24-11-25-rb3-hw-compat-string-ea3c99938021

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


