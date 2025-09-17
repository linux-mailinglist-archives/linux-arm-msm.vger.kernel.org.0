Return-Path: <linux-arm-msm+bounces-73881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA96B7D27C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 384C43AB315
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 07:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEFC304BAB;
	Wed, 17 Sep 2025 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lc0K1P3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A674A303A21
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758094379; cv=none; b=H39oYiWcyO7Kosbq/l6f1oUEuzpvB9Cs1X9H+dEoDqF0ut0uEaFMV6wdSRC+tlEtBL/sXvIATkWf6vuhrbXBfVBL+gsBYOfXzvlSffjLYI4HG9hHoW+YgIHuT2zt0NlZ56hFpwMFXVv9AjtP67am8s2xpf2CCzmD8f++B8omw6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758094379; c=relaxed/simple;
	bh=rsdgxahP+TzcBBR6hkRLm1WyGt8Uyj+zEas1EFWfRPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JlcpwF5f8wzns6PLAtdeyxCnLj4j9W1uG8iq4mrqf2gCtoW6r04W3Tq1HMRODdpf2VfYWy1UMu6rN4V+738UjKBx1wqq2SfcX0YuFSvOlGBIlqKisD7rPpgYEjVMfddX3FqyjXVomk/rvoUafy1bAfmGPmzbabAcjnLoqlUeMg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lc0K1P3E; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45f2c4c3853so16672265e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758094375; x=1758699175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bU0kGu02NgCF+W246kGqwLalHsa+RZrJ5/QffDvGcLs=;
        b=lc0K1P3Ei/31SGbdaiD6FDcQCt/vNNZyiSgvZs8PNEap6/18kerLtqH98cSaOCarRE
         E80HfWyaMWqjrigt4c4qUr+Mf85/UVzEynyi25q5OfRrF8n9BRt5rDeoNyQhvfVIMhk6
         Uo9+r8zpQKQYfyJVmU7G4Pdz31SyGujEyOgVNg8meGzKg/GOE6gBc/G/2xvRUc3XiMRL
         OFRmjCJxusermmWqV6YWBTrdSfmGYZrgmyVDYDGyUKNndDYU4eFry9sOYCNpCKu4h365
         Z6FBs2I38yLNFtMNdfH+Q71zF1HQaUzi3eK0Vi2FMiafzcAIyuRczyu8/TGslpMUhe1p
         Tvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758094375; x=1758699175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bU0kGu02NgCF+W246kGqwLalHsa+RZrJ5/QffDvGcLs=;
        b=kM0329rqVfHetnp1iE9rc9OwTbDISaYOhYIHy0NjPcT+yMLd398KsgVI4sooFT3Ic0
         s2aHfcnUup9J+446irSqxB8uZQWW6lk6a7DeeFCxHe+fqa6LrCkn3EzpuVXNHSBPT9uT
         d9VlnmYHEJqk2h4fZdjWD4Iw1UDsQK4FS5x8W0p9jaZPAsPvQ5SO0B+Ti0O498J04ELK
         zpcdB0qx2cjUx9kkg/7ztjGp90hK+6I1Un3hTl0apcZjifL2TcnxlGGg6K2M9F00YV27
         2YCzegsKsWiYStvdVcKzIBBrIlpmQW/zba3aaluYXtHuAoNJprxVpByXFZ5SGAfRs5Z3
         b6Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVIuSfWqKagc+1chXK+RQEASYJ9RdMhHQt9BrAPKFoc/IrJO1Fi68K8CY7DTvTI8CKM412UJCCHQr2ysu1f@vger.kernel.org
X-Gm-Message-State: AOJu0YzxSme/TTp99szLWcAR9m/peCBdyR/0jJBCTKVjhBi0A21ey69R
	kfBZsxhFAzZFV5XULNXATFjqo5TOfpWzhzuSS5jAL8okiqDquLvcHD5ArKR5QDz33Kw=
X-Gm-Gg: ASbGncszui00rTNkPYygxb4EyBV3qJiiX5Yt7BnhvnYqp+y6kb6IP84u9OCdB2YLBRz
	8UmeSUnnoe4NsXvhdtoXL1zcXPEzDj2i67uILhFc7wN4roXor8vXZ9tRr6sUq+leKrGSy6cZvVy
	OKOD4TLKYWjj7tcIBVbx8HzdxQojAJfhccDvRL9cVBTFiHB3o7GbvXwI1DH7X/HgyJQLb8DhPah
	sMWq/Rdt0D/t8D2Z2hUaYzeRMtDZgYxDgYzCQ8XND6bxy8n2ApwMokgQ5HRCXTKCIcApZd+ATRO
	rDBS+iq0stgBexqLCziiU7G5ifRrBiLI9g6AKtn3rM2BfO/ZAoYMq8iotI9/vRV3o6xIXn1zIWH
	X0xSC7ODjHKxLf+IMnVYUZeSW0uawKabdl1P9mDk=
X-Google-Smtp-Source: AGHT+IF0ZgU/Evjex+NzjIeYwN6zsjojKuXG/AxCYo2v92UV+NmTsIKkfmnfInDMfDxScv1zXXuNGw==
X-Received: by 2002:a05:600c:c4b8:b0:45b:8477:de1a with SMTP id 5b1f17b1804b1-46201f8a98fmr8140855e9.7.1758094374553;
        Wed, 17 Sep 2025 00:32:54 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:75ac:2ea2:dfdc:89c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613eb27f25sm25442035e9.23.2025.09.17.00.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 00:32:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 17 Sep 2025 08:32:51 +0100
Subject: [PATCH v3 2/3] ALSA: compress_offload: increase
 SNDRV_COMPRESS_VERSION minor version by 1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-opus_codec_rfc_v1-v3-2-7737ad40132e@linaro.org>
References: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
In-Reply-To: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>, 
 Annemarie Porter <annemari@quicinc.com>, 
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel@oss.qualcomm.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
X-Mailer: b4 0.14.2

Since addition of raw opus codec support we need to update
compress API minor version by one.
Bump the SNDRV_COMPRESS_VERSION to 0.4.1.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 include/uapi/sound/compress_offload.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 26f756cc2e6215fe99bbac4f4a32ceb475068ec4..b610683fd8dbe4cb60489874fe94aca167ac7abb 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -13,7 +13,7 @@
 #include <sound/asound.h>
 #include <sound/compress_params.h>
 
-#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 4, 0)
+#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 4, 1)
 /**
  * struct snd_compressed_buffer - compressed buffer
  * @fragment_size: size of buffer fragment in bytes

-- 
2.47.3


