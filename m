Return-Path: <linux-arm-msm+bounces-77861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F182BEC897
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 08:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA4714266D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 06:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC20279327;
	Sat, 18 Oct 2025 06:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CljpQGQc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FEF2641FB
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760768715; cv=none; b=m7HigTLSEno7A/RQVEc1oGdWdNT7FpzAuYySaCHjGzT7c8OVM2/aeKodtSLzfigEyk3cUSMw9WBwLwqSJAuu8f5UC/BQsjNIPt2TajOxKtkyBOjG3XtGTuKCK1yCEG6QJz6GjjfE9Pb5WN0tVTOKNBQXdxyIKfxdWme5GPE3RCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760768715; c=relaxed/simple;
	bh=bBK06m919fcrgtih+JVTXodl3XFTa8xsFxWUlcI5j+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jGMDSDDVFBKxpFOB5tnoa/0xIjHxi9Xo+IJgu7ttkADN3JSM8n7adwtwuWIzigW86PUHlYIpSGLvhL8Xe8vbNyobgq9eTRD51gHMgZH2T9OvePpzzsHLSuhNee7fu3ob2P6XpQlrK5sGcgiB1d11YJEZyrHK++ZexrO+QNa4nXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CljpQGQc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-426fc536b5dso1458738f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 23:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760768712; x=1761373512; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOjOlRS5epVikQ4z5SQ9kGD1JPQvt2c8mE5ArTmJEf0=;
        b=CljpQGQc/nyojHlCfT0Ze05TRRzMSN1Sv15PowzH9VCFP9SB3ErGTQqamPNTcYHyt2
         L6yKPlR0I9k0zxC8HmHh2wxreJuG0FjspGTTicgBFSpSukqin/X04ZpSIitzn1dRLtJs
         xKBMlEnUus90vuYRvETno0wEZ2zZsFZ+5vIkwRxqLKiHQtSLU5IE9c3NnAAK/sXemuGc
         3oe+GxDsqpltFJDk8/cfVvF2I2ffN5TYgicuwhKfa/tkkhkIGebTJGYcL7F7BhSo3OrG
         03d41S/cevvzBO96d7dT46fsPovofFga7826q5TRrFlIY2quaSnFWbaFkwdxlURTbfC5
         gvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760768712; x=1761373512;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOjOlRS5epVikQ4z5SQ9kGD1JPQvt2c8mE5ArTmJEf0=;
        b=u/jqo5+XRYy6Nfv+hEopJtefcu7p1ZGcoHZmJ+Fr8M2dd0nZ8JCPKcS4aMdk6+I5Rs
         CHncx2f2SShkWkFsJZ9cTG5k6CAT1k0fx/FzOFaz4fVfwskz1Mftx0/AUcExWkAgrPvO
         XupYPCQmQEoT5bKNtSiU82LJixnQdwD2lR2pIbx9BnXVXoMnhTbUiJuc8PdcIa66VuZg
         ZqauElAuTS84uFVYpb4mxV/LuVQwcvedXWxbPeN5ZTtlIPH9tcIZUEnW24GnKKT1zH6g
         wcMi7hcpIvddutdXehmilTW6eckJlSsR2kddCfB6ow033npQY+vdx76e0U5cv2+l6xEc
         3nXg==
X-Forwarded-Encrypted: i=1; AJvYcCWI8Z4db2QhajmhVfZGPiPGNRcQorra+yab+eae0nyGU0yde+CdICRR9tpbvpx2N5knBXUOI1nPJOaG7qyr@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb7XZkdazuMYJUTWwHnm6kPZlf50c7EBFRR/ATPtuCKrmTdeGx
	O4uZM3fTmBm4GbV1ds+hvStopT9IsJB1wev68bnuN/F6ba2HK6JP0hBvzVWAOKRfi/Q=
X-Gm-Gg: ASbGncvhy+4sGFxx8xbxAY9hQzNkIFPyp+zR7K3J3u+ieqUqJgDxE9NzDaxATTmnWSV
	mghc6WgQ0NdBTVfKbzRw/4LYSwf2F2RVw90sFIXb87f/seyuQY1eRj5Tta/WcGAI2qU42w/uqzK
	Ft9pZohjchQ2JcHNi7IoNM18yJvqCIiigC6D4J51pVlsfHGJaEnYmrWV7rWLbqWnSKlS4azU1dW
	acpBg4Kq9mRV4LRVUHh2gRc/9xHbrHzSd0M9bkeQhGfmyK1R0JfCs6MOQQADz00odq4LFG1/oIV
	uNVs8N1ahui2eqh50UnAS9aOWCN0xhcUXCJ8N77mX3ZCxcdsBGHzWARb3stodbobXty/MECTbxh
	8CUG/UMf4SnFBQNwGt619Q3RVLM+3/AFjbKZLETVhcTJ0+OYvj0+p7HhZxTpgtBjtvqEkzGc2Dh
	BC47g6hQ==
X-Google-Smtp-Source: AGHT+IHiJtFCilIcqVXt1blvDDyHCgj8C07mXYG9xI18dPYdiNmhymktEi4vcR2/aM4gupMNGoVXIQ==
X-Received: by 2002:a05:6000:26ca:b0:428:3c66:a013 with SMTP id ffacd0b85a97d-4283c66a3f8mr683531f8f.55.1760768711850;
        Fri, 17 Oct 2025 23:25:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144b5c34sm126120075e9.10.2025.10.17.23.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 23:25:11 -0700 (PDT)
Date: Sat, 18 Oct 2025 09:25:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: codecs: va-macro: Clean up on error path in
 probe()
Message-ID: <aPMyw_ryay9LA5SW@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Do some clean up before returning the error code.

Fixes: 281c97376cfc ("ASoC: codecs: va-macro: Rework version checking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index eb4981255f2b..77a372dfb117 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1632,7 +1632,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		/* read version from register */
 		ret = va_macro_set_lpass_codec_version(va);
 		if (ret)
-			return ret;
+			goto err_clkout;
 	}
 
 	if (va->has_swr_master) {
-- 
2.51.0


