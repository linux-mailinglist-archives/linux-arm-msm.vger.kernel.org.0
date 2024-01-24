Return-Path: <linux-arm-msm+bounces-8094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AAA83A365
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 08:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AD5D1C2889E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 07:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143CD17566;
	Wed, 24 Jan 2024 07:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zHmJ0Jkt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139D2171C2
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 07:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706082339; cv=none; b=eyeoI7JGOdgI9riJy6xvQeHAKzx0P/9Skf6rem5ZTiw5vZfOw+eVNdn9ivDKnDUWWqBQ2LL3vz+R5lkzgCg2AeroMFj8A1pEwjS8NXK9XBE6dHjhJpqYlg6cmbYX8WKe9AefMa0uD+Kmvo8OzBjTdAo+KpEztrHT2fxAIl++Bzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706082339; c=relaxed/simple;
	bh=sVXlhCINy91jWhZ6PsZ+NZ5hY4jMsVzvytP/1xoTcWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=exeedmEGxD5ntIqS/OcIhC7dXmMBB6T6uJf57j1+JxRLrOolEVaoWRpCG2o0srMTBQQiENlO5sl/AXFYeONXXMp7kwiL3R01qHP80a6AfVSNJ1dM46/C+RRIUOJtzkrYJuT0JIP/UYMy9/gbe1WjQPQDZAENDnfolWuo9WL7pi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zHmJ0Jkt; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-559f92bf7b6so9333001a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 23:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706082336; x=1706687136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Twb14CHQV4rxLJEwyOADsP4YgaAe6VIG5jHjsjkoYM=;
        b=zHmJ0JktUE3PC8HWNARk1Uzi5CCw6oUEOkGYIbSXWy2ecVhujkLpkGOf2yhq0nVMUc
         RTstJ45AqP3m6R0xNCZ+cCn+wOty8za8GSkaHdLX25G+eer3Sryf709WcdPGmxrCAf2A
         fpIgsidkxJGuNdUWR5go6Ah1p+LeJGv392WUBY2i/dndqSDmbmcbLrIY6qJ2NiQvAklS
         8vyo74d52ClIbc7BrQpl7FbS+l3xPESM3jEoBFwKOZE8YTVRhbKHST6dblsTo+4NcOSQ
         w2wvfncdy3jKNU9p5SoYRZ6XLfgOnBPaLrAioK68I1LLDIkdRJTdzH+Aftbbb0ZtlW7z
         IBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706082336; x=1706687136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Twb14CHQV4rxLJEwyOADsP4YgaAe6VIG5jHjsjkoYM=;
        b=VX+q7rMtneOF2HNaUFCwfQL09C2Bl3cyNXeX8kPG5jCtlntqqrw3HVfxeRMacrwl5a
         oncq3gwKXOADHgvXUhhf9hzpdCP8Ngh7sEdUfFBLj12j9ynJl7rUeA+ZcKaNnVSsHM0x
         9WropEICgFAlFheHyORPNnwEh4kTExSNjDy60PCVCVtxnwalxZ5pEedPoXrnkAPOs38J
         p3AdCcxgPQQYduTx9rdcc4Pxgm2XVjBCHQ9c3YyH4/1CdDFGSTJkxu/0PLzZkf3bx3Yq
         28dCLtA30nk/QYTZ/y11BWEArZwx+lU0RAjus7KWMe4M0ZSKAYZAViApqa9hBWhEUX4d
         E8Uw==
X-Gm-Message-State: AOJu0YxuyE4fk2ZiOf4y7iP3qPMLWeMngv1rnyMSFiGsbqv2OymWSwRp
	KyyC87KDmkT/9IotHXB0LZlsqQ98QKqTsikiH0FzmDVmb8OSRDIgMR6uRJJnq5w=
X-Google-Smtp-Source: AGHT+IEd7wCKPo8WkTbk0u737H/8Ow4jEXZBmtDW8b4VUySFuKLyGUxPBx1MuSzXlKRiapm7MvRwSg==
X-Received: by 2002:a05:6402:34c5:b0:55c:972e:3e97 with SMTP id w5-20020a05640234c500b0055c972e3e97mr1149526edc.3.1706082336269;
        Tue, 23 Jan 2024 23:45:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id c4-20020a056402100400b0055c8a30152bsm1306951edu.83.2024.01.23.23.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 23:45:35 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/6] cpufreq: do not open-code of_phandle_args_equal()
Date: Wed, 24 Jan 2024 08:45:23 +0100
Message-Id: <20240124074527.48869-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
References: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use newly added of_phandle_args_equal() helper to compare two
of_phandle_args.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on previous of change.
---
 include/linux/cpufreq.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index afda5f24d3dd..3cd06dafb04b 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1149,8 +1149,7 @@ static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_
 		if (ret < 0)
 			continue;
 
-		if (pargs->np == args.np && pargs->args_count == args.args_count &&
-		    !memcmp(pargs->args, args.args, sizeof(args.args[0]) * args.args_count))
+		if (of_phandle_args_equal(pargs, &args))
 			cpumask_set_cpu(cpu, cpumask);
 
 		of_node_put(args.np);
-- 
2.34.1


