Return-Path: <linux-arm-msm+bounces-55569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F72A9C06C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD12C927A67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 08:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2515F235BF4;
	Fri, 25 Apr 2025 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cnlLabIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E5B234987
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568460; cv=none; b=p4q2B3KTWw2u49jV0BWY1nEIGoMu265q/hKfDYz7pXQY9qqs7T0xxsO5Nm7vnK1gJ7h4br+el/RTWruiQ/Ckr5BzM/xD5IgQI1i1rEo+lqC1YMAF6BWSDtUEaP2DNVhzQqj8bwmpatj8Iyx/AncbMqWUPWb3eqnUWt6ltIUc3FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568460; c=relaxed/simple;
	bh=b8O4l3RSvg0fy+NWpm7X0oPQjhPePwQH1mA0z4k72Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1dqIKBxwULZdXCGT24FD+1MjNnbf4GpPoKh489tSVui4T4xtWTvsEdvNzbWiQyaBa4I9t/3uh07BWmYxNaG7vvjbxNx3nXScvNjVpvT2DUMNmreNo9jTUnBOxnEYQKzg5dfQXu3boAl6RIhR1zI9YEJG+7fmaY9I9ncsi3vi1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cnlLabIh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so18090875e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 01:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568456; x=1746173256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WC8RFGmD1RHEB436RAA/xlbqbziPuzDw03yfjSeC4YY=;
        b=cnlLabIh5/IN79utqTu4xLOQGjhG1zVzD5iUunpEnChrCkS54opeJ5MNLkc3XVogUZ
         wolNa2kY1IrJlamFaKgMY8/+liPY4lE0njbAqTbydpBx+YcGqEYAYRr4ov4sQAe5uy/J
         A1egddJMEov0RBiuCVZlsrKv3sqWU58bQIK7VA3j9ydRcifxZcnR1gUX13iR+L5j1zOG
         0VWkA1fG04JwsK8djGuOODcPqHVPmVtJ9oJR7a0oAWlatplvwIF4ACCJBcFLIOqL3rnC
         wQ1NlA/rc/0LOjxRZvMX2muPab6xyE+5P9cjOVdSY5R2lLcvmUdd7VKTv495A9vLVNak
         J68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568456; x=1746173256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WC8RFGmD1RHEB436RAA/xlbqbziPuzDw03yfjSeC4YY=;
        b=Jh9haHmZcqSa8qoZdMuuUR6fCEZkXEdYVogIaHbGJiHxzzwi/fC1IMxlFTT3peZKqo
         0RMTpD4CflM8NvDZrYNzz/4kvcKUPF4KvZqOUsXdVgjqvWm13O2nUWfsCkyKRkQIv+N1
         8/TmPYeXtyjYyPu2UQq66mlNyx5Ugxwu36wVZ5JsiAKT44BJ4y16UsvMWm4/4qH/UPh+
         1TZxRHsxBXascpFLehK6wL9SZlBA7GunLhgHasgAQpeeRYzEIs4RzDZAMddemx9K8mbW
         gZes19Ptgwn4gvxx+wsue/UUhqRhL94fIFvEsRLhtleSKsFMqmNHKp+Ms6iCjtfDNpJm
         UfDA==
X-Forwarded-Encrypted: i=1; AJvYcCXq1lk8e4VmYbCAP14e2Pmt19CHqjFv7Diwg3GvMsqBEHz1TsUB21QZhn+WuoprV4xTEsWbGBt/auPIvKA9@vger.kernel.org
X-Gm-Message-State: AOJu0YypjFBWL0XY8kIQTIBiqVD659cmFU/1Nnla3vcgQu2PlA1pJ/Tc
	MXG2pQe8x2fU88/rGA0LBLi12sJZoWQF191fiY1Q2i+3OXWE+yiIWia+LCWZATINZ/EHlgPY0w0
	f
X-Gm-Gg: ASbGnctmWNAgT9fBbmuXS1ykDZWF+iY8dvRS3wNeiVoRU//CaiWX+qPBDN8bi3jQFxH
	IAYh6U2SyyVPly6DDWpvYQSLc/MGriSUnor0JourVqj+BoY4JzqBwVE9HbcNKtkWZXlU6AqCUzf
	+bXU/r38aEs0PjJXr30LNt8uxlL932Jih/ADBg+HzhOiW1FtUC6TI0U7QPb6ywgJopuFJbfyn/X
	L69rYoAFyIngad7E5TuY+UyfGqC893e6rkTl5KaYNIBEtzM7KJSgYvHSANd7x4J+YM7WJjjgkP+
	fvLdIwLeofOB98gdn+Eis35Jq1Tz5vUvpagVe91k/W9ILLBy81wjbHlVXR15ccaC3XyujdIzSZ5
	WNH3Nq8rhMpb3EJpODqO9m7g0rZ+r4veyarB+CDgGCeQzqTtuuRS21r9i
X-Google-Smtp-Source: AGHT+IHnGU5E9kdTmOEv3J8nz+wIEIG5a+AbZeoA5daYiMBxcw7FiKXP7Z+blV7YWaSaCVLY5aXfcg==
X-Received: by 2002:a05:600c:4e88:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-440a66ab7femr10627065e9.30.1745568456199;
        Fri, 25 Apr 2025 01:07:36 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:28 +0200
Subject: [PATCH v3 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-4-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Add a compatible for the QCM6490-based Fairphone 5 which can use this
machine driver.

As a note, QCM6490 RB3 board is using audioreach architecture while
Fairphone 5 uses pre-audioreach.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a4bf6eff811ea3e2b005071cf3410e5a0410f5d8..43c93e24d77259f232062c7e4182a39151111c59 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -208,6 +208,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },

-- 
2.49.0


