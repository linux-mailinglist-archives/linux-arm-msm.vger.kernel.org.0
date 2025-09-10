Return-Path: <linux-arm-msm+bounces-72922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3585B510EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72F31466328
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 08:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A5C30F7FB;
	Wed, 10 Sep 2025 08:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hzJxBM8i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF4B30F524
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757491911; cv=none; b=fbv5Y4/qyTCOUhiMIciA1pzqiJD7jVQfGccIfLVI/RKXwkIoCXnZtLYcfaJu2tRqT/lhuLXXE6z2dapGSpvvwEUG52HN5WwJtGXg42qLC1dtSIhKJBLXreSYVNeVokDSP9J3qzmtE1K7qfwyHLwGkqWL618b+yjD4ZeYEWdb1OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757491911; c=relaxed/simple;
	bh=ELRJva3fiuc8exfYKh8ZbZoAbwpstiAgEsP1yy3AI00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DRSMPM5Qa1xXXVYm5DBzCGsiUignudhxyf/HaPAka7u3qO5RVyfPCYSLnjlYKhC4aYzy1hcBo8/fkpT57nmYBDvOM3VkIk9r/eGxRwRDxEzcjje0HKt+bW46LQ8VN9l7ou4TO8xbsGjrow/jn984XNRn81La+kxiP3v2L5Aryxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hzJxBM8i; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so47044505e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 01:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757491908; x=1758096708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37bRp9+f4wigxD4YWC8DmxwjJmoS8JAeLHOsjSA4OdA=;
        b=hzJxBM8iLfWob+KadSFiPJbXwexHDDQxoqC3eJ8ubTXegJI3I2mP8bx4Jm0H8JRmR3
         WUPaeQgitbMRCoDZ2l+iAARRzn6TdoEAajV24sCuKQvYdKEgINnScFSzRwV9DSPNp5qv
         teulk1VKEoPn2TY+otbMudB/uNmU83/jZ+CyZNI2yNgEWhjM3431vsZiZc69duCDN/a2
         Iz+jCOEmGuWluLQkU0pEed7ivbHFblC37faTWXzlN1qFqRT+tnYPp4XonAyrD/0JfBiB
         i7KIL/bjNh4KdcqdVVpirugmQWEczeTflMkxtVXfNkt+CbbpDPl2JqAKo3wkDNMb30+a
         MocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491908; x=1758096708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37bRp9+f4wigxD4YWC8DmxwjJmoS8JAeLHOsjSA4OdA=;
        b=Z0Mt01hywyzLHIJQpnxuB8eZdLiHTAujFZzL4MnldXNVFvGDmiRcs1VWArqw8coJSS
         DFpLUTk4TwnX3pvJp5/7D4ktQMG5tU0Qif2BM94CEssOfAWTQbQ6tmMceNzXVqCzX0As
         xtK5ESoQ2UfQMMenmXr++a0AIDycFb9sC3KmwkB3B0hy4wHzco1ZnEcyDqeCGi/TgQ/B
         fhRzOlny8T+4t4EbE7glBuJBWnQ/EWNNzLh9knpLFjr+Yt1cRc65edjG5RM2boDRLVdB
         utCDT6qBeKs1ra1xRwzC0gMn2AWpwWusoLZcE73o3Sm9iMasVVOw/RA9OMUkM6WUta7m
         fQ+A==
X-Forwarded-Encrypted: i=1; AJvYcCXr43SP6dauDWOeeorGWi55WjRdqj+Yb9mKTCJF4AUP/SNgflKXFnA7fpriLdKiVbs/LFHEW1fpNK9WqQ12@vger.kernel.org
X-Gm-Message-State: AOJu0YwgciztkwVn+/V5T2OQQkbEsXrMB5sRGdXtO1NA8Yy4SzGW9EKN
	1O/cg5j0Yz92/lmsbkBp9gYf8o/lE+FsZEscSHFqpQ1ZBLvoTX/6lYFaOMa5YuY/9BE=
X-Gm-Gg: ASbGncsgqOgbeViWHlfoSV7swuYoQkqaXuDRoAMp5F/IUSYXWI9uaiLncaBi/btAhXC
	oCZIKCgFNBe/ZCJw5zJfj6lpoEJlpd2lodXq9pAxHLBo/4fon0ebxrX7QSgUU8iuOj2qgB6ycbU
	jUv9Stkd/v/6WizTjwTsrElE15kJ1LPEEZO0cOZBST8cyIi3KHs856rKVmvUHeQqmn5YOBZtrVL
	ZBlPX4C6cukH3Jnx5W2Ho0UZlVvMlfXusgcqwmtZ9Z5WoTJQcbYIvRw2YiIXjdZ1JdEl8eZVana
	P5V5uXqjeYXS6xjvn/lbcmJiw+KGQieOVy7rHryh7Fb5bSyTG7oQBP+aNzuw76YUh7Qk0/1tx0S
	x9fuvhkz2KjP8CeM+VjT/HQP99s6B
X-Google-Smtp-Source: AGHT+IG52FWePrP8CUVkWd+othtSQU/zQLSAcXh37OyedEhfJZcLBPbOvIzTrqHZbmzlQ8IUctMzdA==
X-Received: by 2002:a05:600c:1993:b0:45b:7a93:f108 with SMTP id 5b1f17b1804b1-45dddeb74a0mr134958545e9.3.1757491907914;
        Wed, 10 Sep 2025 01:11:47 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:a727:6a46:52e3:cac2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8218944sm18119995e9.12.2025.09.10.01.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:11:47 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 10 Sep 2025 09:11:41 +0100
Subject: [PATCH v2 1/2] ALSA: compress: add raw opus codec define and opus
 decoder structs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-opus_codec_rfc_v1-v2-1-35fb6536df6b@linaro.org>
References: <20250910-opus_codec_rfc_v1-v2-0-35fb6536df6b@linaro.org>
In-Reply-To: <20250910-opus_codec_rfc_v1-v2-0-35fb6536df6b@linaro.org>
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

Adds a raw opus codec define and raw opus decoder structs.
This is for raw OPUS packets not packed in any type of container
(for instance OGG container). The decoder struct fields are
taken from corresponding RFC document: RFC 7845 Section 5.

Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Co-developed-by: Annemarie Porter <annemari@quicinc.com>
Signed-off-by: Annemarie Porter <annemari@quicinc.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 include/uapi/sound/compress_params.h | 49 +++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index bc7648a30746f4632ecf6695868e79550a431dfa..b3ddd7919f42048b307564d8a6a83e4c8ad2c7fd 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -43,7 +43,8 @@
 #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
 #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
 #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
-#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
+#define SND_AUDIOCODEC_OPUS_RAW              ((__u32) 0x00000011)
+#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_OPUS_RAW
 
 /*
  * Profile and modes are listed with bit masks. This allows for a
@@ -324,6 +325,51 @@ struct snd_dec_ape {
 	__u32 seek_table_present;
 } __attribute__((packed, aligned(4)));
 
+/**
+ * struct snd_dec_opus - Opus decoder parameters (raw opus packets)
+ * @version: Usually should be '1' but can be split into major (4 upper bits)
+ * and minor (4 lower bits) sub-fields.
+ * @num_channels: Number of output channels.
+ * @pre_skip: Number of samples to discard at 48 kHz.
+ * @sample_rate: Sample rate of original input.
+ * @output_gain: Gain to apply when decoding (in Q7.8 format).
+ * @mapping_family: Order and meaning of output channels. Only values 0 and 1
+ * are expected; values 2..255 are not recommended for playback.
+ *
+ * Optional channel mapping table. Describes mapping of opus streams to decoded
+ * channels.
+ * @struct snd_dec_opus_ch_map
+ *	@stream_count: Number of streams encoded in each Ogg packet.
+ *	@coupled_count: Number of streams whose decoders are used for two
+ *		channels.
+ *	@channel_map: describes which decoded channel to be used for each one.
+ *		See RFC doc for details.
+ *		This supports only mapping families 0 and 1, therefore max
+ *		number of channels is 8.
+ *
+ * These options were extracted from RFC7845 Section 5.
+ */
+
+struct snd_dec_opus {
+	union {
+		struct {
+			__u8 minor:4;
+			__u8 major:4;
+		} __attribute__((packed)) fields;
+		__u8 version_byte;
+	} version;
+	__u8 num_channels;
+	__u16 pre_skip;
+	__u32 sample_rate;
+	__u16 output_gain;
+	__u8 mapping_family;
+	struct snd_dec_opus_ch_map {
+		__u8 stream_count;
+		__u8 coupled_count;
+		__u8 channel_map[8];
+	} chan_map;
+} __attribute__((packed, aligned(4)));
+
 union snd_codec_options {
 	struct snd_enc_wma wma;
 	struct snd_enc_vorbis vorbis;
@@ -334,6 +380,7 @@ union snd_codec_options {
 	struct snd_dec_wma wma_d;
 	struct snd_dec_alac alac_d;
 	struct snd_dec_ape ape_d;
+	struct snd_dec_opus opus_d;
 	struct {
 		__u32 out_sample_rate;
 	} src_d;

-- 
2.47.2


