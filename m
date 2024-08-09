Return-Path: <linux-arm-msm+bounces-28223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C15A94CC54
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 10:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15D8FB2468D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 08:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC35D191F89;
	Fri,  9 Aug 2024 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DBvKK0It"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80D81917C4
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Aug 2024 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723192456; cv=none; b=Y5HhW634LvL8JUUQPp+GJo+IuXvqWN20NsYKp7zGirvB/GKGckldxIglwxKh7lWWL7FNn3ImLPe8s+DNhFIofVR3ORyhqPo3vrlmNlcUCV4gcrMgt0uPLMxmV5ge0swMlcl9jTpGXfbnYUr4pIKbnWiC9qNuoaIsubIZVACs2y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723192456; c=relaxed/simple;
	bh=iQCCZNb15xA7YzIyMpV93MbfBBT7xhwt8+pmmQPh75s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QlNhXshJBRApzjLND0zTXhXn4o7MnG+IOYO2dPY7RdObraf4Ou/MRoN0O+wouO8L1h+qJ1U3SN6XcfdQGgf3VPQE5vX+8u7dFOEaEjVnqHTou1lCJ+dyxTQ5ErmWJQvz98GtAuuF8yJ/BTYqcFO2ycUujvu09mwDgWkat5blCV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DBvKK0It; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5b3fff87e6bso2008091a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2024 01:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1723192453; x=1723797253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pM2zQn5p3FDpIYaXA2RbE1R8wZYvgZjYLsbkdX740GY=;
        b=DBvKK0ItIeQByCnvUTZlRhEHosMiiyEUGqiWz727zqIuuPr1ttB6QXF/mg0tWmMK2n
         duDvjou8rw+IEDQBZUGRZ4Ryq2bqy2Hr6iCI4zTwJASueJwfMv0ZXByqAgGamOm+Jt/k
         iZhXxwa/JTmBHDbc7Fvv1F72GU/H4w+KALmRAo4Y5KH+PFZB3B9cj8MnW8s4HZmRFesN
         z8wK1SIPagr0DMsZGKq7fff+HNVvmLezy/eJnzv2kZ0Y4Fixoh5lWbGrpHfE3aQranvI
         LFR7Ms4sZrRs2JddMPrVW5lFCOZtP1BSHrrInrkVKKY88NIT2uKKlfhQ9Z44gCOyggKy
         gUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723192453; x=1723797253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pM2zQn5p3FDpIYaXA2RbE1R8wZYvgZjYLsbkdX740GY=;
        b=s3+CV8tU+thOKZ0B2IAs+UaAV8gmSbqr268UwhI7sFE0k61sfRN31m8WP8vO67waYu
         4sOFKXG3p1MXi2AluOh4b1eml8fiI5dMjBVOrJZJePaWXeaxqhxorFRUipwXRhQzJIlI
         sUWOuKpUI/eGYxeojXzNilYhjpT1ChdE+SDNR8aqSRZDnO7BoTpqxuI82xXw7EOTlDLt
         OQcLIThSZacO6OtY5msfzbaN0U/QMz9saVkVlgEvZ9e9ro1GnlG+cixLi5xyjssnfTiE
         0pDNqAGPytk2UPWhqiXIdWjEwDr/Z/AMr4TQb74/jGs8MOn1afpupM9qLsrIa+fVruTQ
         /NrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbN6CC26mZecoyeJl1Vfu2DnMw4zvodjSTBQmQepObfUmSu6yiCOVosSQxNF+DEiJa/xMGg6Bszoc7QNtM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4RzlSOUWt5VTQOv4/IeyZopo1eeAxzC6cnaHFASgY4tdLwa76
	Dyy6emON0dN/a0DTHw6Oid0efpcOCDc8FzpfR0HGXXtXQWWcIOadHZPI3Ls+ivc=
X-Google-Smtp-Source: AGHT+IFCpnNxr3OIcmfuo39c+nNlT21/T85VjYH0R0lGnoZyeMzkVNE10LVLArSs5TAUEYYxuW88qw==
X-Received: by 2002:a05:6402:3548:b0:5a3:b64:3b98 with SMTP id 4fb4d7f45d1cf-5bd0a5a5d44mr558924a12.19.1723192453020;
        Fri, 09 Aug 2024 01:34:13 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c41916sm1336288a12.41.2024.08.09.01.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:34:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Aug 2024 10:33:58 +0200
Subject: [PATCH 2/3] ASoC: qcom: sc8280xp: Add support for generic QCM6490
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-fp5-dp-sound-v1-2-d7ba2c24f6b9@fairphone.com>
References: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
In-Reply-To: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.1

Add compatibles for sound card on Qualcomm QCM6490 boards, e.g.
Fairphone 5 smartphone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 922ecada1cd8..385e902944b3 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -185,6 +185,7 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
+	{.compatible = "qcom,qcm6490-sndcard", "qcm6490"},
 	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
 	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
 	{.compatible = "qcom,sm8450-sndcard", "sm8450"},

-- 
2.46.0


