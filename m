Return-Path: <linux-arm-msm+bounces-8827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E1F840433
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 12:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C6E81C22139
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 11:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B4A5FEF9;
	Mon, 29 Jan 2024 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yh56MIvr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411515C8E4
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706529146; cv=none; b=mSYSy0J+fMpZqmjk5dRNvta+gaZfZLEfC7ibpNAUQ4MWa1RLMwEMuUo18rwRffNUwTpAK2c4YPyUyuQ67V03OJH3xrCTpaE5cqCZwRlXR++j9VqneT0GaizZRM5N1XWIB/EGk2KI5xq8sYa2ML45PD5j32T7W7lNRuZQXy3JPng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706529146; c=relaxed/simple;
	bh=pEaaZzWd53CrhjsWjih79Gm0lLf84UYwD3xSD5zEQj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZKdHz8y5rpkoLK2P8/NDlxN3qZNUG73YoeyVB7eKr3CxlGrjIR3p83SSEVjGiORBMkI57oDmE4rKbQeZcVtaBybLlb4Oh4LFLSjlTs8CbaTXdkgDcf8V1gaNnL4xilThEFO8H1fqZkUksC8YysvvyWOhkT2E8xunn4UHyAZ/MP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yh56MIvr; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55790581457so2826968a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 03:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706529142; x=1707133942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u11vGwKEs3fH7gtNpJv3ew33Q7fXCEnCXNY0GONseQ=;
        b=yh56MIvrIsDDIDVRv+XbFPR1vq7DFcZr2EVOcMGSm8H5VBpT+4FLwgMKgbreCl94KO
         4+kllBcnF8Tsd/Z7TOsH5z8zzbD4FWMfWiNXja/DLdcEfku4uvC0ldYaRIsBQnfo1Gy/
         5nzJdHCiRfZ8vXCkwv5QuKhz89AoZ7KLKzGn857jrjih/EOfLQ4MUeCUWhasUfvDSPvb
         NsdAVSnnjVHjTVwyl6Aj7h8JFbeUGv9hEBae0urfW90XUQ/Pc7ybAZ2EYeqcBh5WH0rc
         BUxLbc5/yWEZNypMX3EM3sF5x48DAMh74kk8wLIxuESZlSgOetYf92PXnYlJHC7sGQp4
         sVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706529142; x=1707133942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7u11vGwKEs3fH7gtNpJv3ew33Q7fXCEnCXNY0GONseQ=;
        b=S7eyUmt6ga77Nntgq+bLhjUw9CKbv+ow/BTbm8inRr7bm24iTFfB+xBMKkER0QuNFM
         WzHvTsfmVnP2hlSv2S28a9P7bVjueX8+5G7zaqU7OKTCoUL2CF4LF44Rp6oqijdCHVUL
         /aCeDzrYQ4L5f7akvcJdqPv/8Vg42yZVBlwvrQvwfJdgpHAVg8NdzRbPrjPrz1C5Mrct
         FYXIemOY7+MFnhwMqLXPbwjKmGXnpkT0kqkiVGyo3aFKRZEDLPWIoMAxZXgBBhCb2frr
         1sMMSoVxvYATfqCvAYYhXlNHaAWcsDPdEayHRbwasBtiEYbeESHUMl6VYDbryqrZo8Hg
         sm6g==
X-Gm-Message-State: AOJu0YzYa3GTL6GvTEFbMLn7Snr8DU/WwYtkue85kiBt4RZMoDSoq5/i
	Pg8XfDCCvKBH0Th/oA0Pydl80MpFZ9YIfEisgcMJyNhCgDQx2u58Kb7nWKM6BlI=
X-Google-Smtp-Source: AGHT+IFmy3sCvOF6JNQB/p5p+/mn9vblRl4lD4OGfVKlB3WcdWBRMAzyMpmnKg1BqnvigRA+MvIHwg==
X-Received: by 2002:a05:6402:274b:b0:55e:f866:30dd with SMTP id z11-20020a056402274b00b0055ef86630ddmr2119525edd.12.1706529142419;
        Mon, 29 Jan 2024 03:52:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id ec19-20020a0564020d5300b0055f29ececeasm19907edb.57.2024.01.29.03.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:52:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/6] of: Add of_phandle_args_equal() helper
Date: Mon, 29 Jan 2024 12:52:11 +0100
Message-Id: <20240129115216.96479-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper comparing two "struct of_phandle_args" to avoid
reinventing the wheel.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Dependency of cpufreq and reset change.
---
 include/linux/of.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 6a9ddf20e79a..85bcc05b278d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1065,6 +1065,22 @@ static inline int of_parse_phandle_with_optional_args(const struct device_node *
 					    0, index, out_args);
 }
 
+/**
+ * of_phandle_args_equal() - Compare two of_phandle_args
+ * @a1:		First of_phandle_args to compare
+ * @a2:		Second of_phandle_args to compare
+ *
+ * Return: True if a1 and a2 are the same (same node pointer, same phandle
+ * args), false otherwise.
+ */
+static inline bool of_phandle_args_equal(const struct of_phandle_args *a1,
+					 const struct of_phandle_args *a2)
+{
+	return a1->np == a2->np &&
+	       a1->args_count == a2->args_count &&
+	       !memcmp(a1->args, a2->args, sizeof(a1->args[0]) * a1->args_count);
+}
+
 /**
  * of_property_count_u8_elems - Count the number of u8 elements in a property
  *
-- 
2.34.1


