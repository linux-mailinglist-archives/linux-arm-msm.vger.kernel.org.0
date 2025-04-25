Return-Path: <linux-arm-msm+bounces-55611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B6EA9C629
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F15024A2442
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7128724E4DD;
	Fri, 25 Apr 2025 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rGeRWTWI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2115248889
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577989; cv=none; b=PD3lU6zxEZzSbEPubSYAORA9zTh60awEqfTIDnOCXnxs5ky79p/YUf0fB2yTu8brw/2BxxuiMOr6pqk5bPnAONtmwrMNtzTIlZOVkRGL4HDhmKxk5cWtPVBE0Repa2k7xKWzwruNV/awzdEO4GBaUnsL4JNgwbvMGAi7WRWpBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577989; c=relaxed/simple;
	bh=85B3q5YxIURMuwDetlbKPbds6WVQ//EnUVbXQdNluFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NQBABc9DaiONi/6Rb/d2tkTtgk1BsWr3JbVQfAmvXOtFe/IsSIjEt7lGMPUi5UpHKGNcxfH1Nt+0S2cJ2MCCAN/WRugtFSmmyXBAqwo9sPUagGsvEOP2EXtUQJazQ72q1OOViZpS4jiv4DB0NwOFIZL/vNfdHnlu1rfPu5HBfSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rGeRWTWI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso265028966b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577984; x=1746182784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JeacGZrrM+C+tPMotUpkenMrM8geMPef44l5x7iZcs=;
        b=rGeRWTWIj6kPYx04Y2qyYOpqkrP9wTl6YHQc4uplKTpzcd57ZLCX5q421XbHnUT08/
         e1aLWsQORsiQZ4TyvSm7HWEY/HevFZfXI/sxLRTskY3rR0uJfv8dQiHmfOFhCh4O9aw0
         uNMhQXJcwYRZsSWepjcfDl/5j48S8GK6+c+jssmDr626Hcwd5v2zngaYkM66L41reaWv
         3FT/G5NQtVHbTvrl1z/m9IOrlMdR2Gbfb8zT/acH1TeA4xmurBNlITWDKBywE3w13oz8
         sskb93lJXe20rhAlTPpT/bOB6kEajcQ6d+4qxkCRBWXjBGVe0T0dbHaBdkj86NL8SwuA
         nWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577984; x=1746182784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JeacGZrrM+C+tPMotUpkenMrM8geMPef44l5x7iZcs=;
        b=QLf8sNUyCzbVIuX0hzXu4t6SUBaekdFV5B+BewsEeor6FsCXb+u1TCqvZgDoyiM12g
         jc0Wei+E1xxpbF0f4v316pVGNugS2F8OdjJZIbLj5BshLTDnAZO07OLd8z/Tp3WRGKmm
         nggISI+51OIN14ZTbYAYxUHbM3QRlT4JnVVy/VND9WD9/lpexL7DvQ+kdq2atwHPeRwM
         4XC3odwjB1SCYoEZByi8tfh9npPtWV+C/Oyd0fqRi64OtUfXiPAhdOjBoFzqbBsFtIwF
         qN2/3VBPlQ1H3EgPVUo9ubMCW63m5FdEh+2G9fi+C8Cuhx5l839YieYH2nN3Zc6Ji8XQ
         /K7w==
X-Forwarded-Encrypted: i=1; AJvYcCUD0RZvRFRS+5bormB9j8j1ceFZf/NSViZDEvB21gEJyCwiUQ1Dn4nGcOEzl1+RvN9GiFxDQph3InsD3kNj@vger.kernel.org
X-Gm-Message-State: AOJu0YwG37EREsfcjdsY5sj1YmkYd2A4yr8jMh6mV6q43GXCJCjyk+My
	hTkz6mcwrY6CrR4IlZuHQAwMTzZil/u/c5aMpkF7oDJspfajMSsOc3D5nC3WRgA=
X-Gm-Gg: ASbGnctxwR/uInZf87PUR8ieZ4BWdL9MT6r2QoEQsDHWBmqupyh/pW9AP/0ZrMU8Vrc
	ILel8f6iUGNegXavluB10Vlf/7MoekoilX+d+/5G5YEZhnXSY9bSyoD7qVviZfFPfY3OHgxx1fr
	Jn9aqpg+n3BcEXrAx815SIA4+Hvf2dlPjp/lXXt3nCEvMgYz0hKYKMAEFt6IV0growcB8KTr4kI
	7W1yOsSL3/PhZ6sfhxFJmryE+Ym25AetyXbaYLZwnPIjVKAE61/HYwNCG3vMWbwKUUfxVb6YnI4
	53OuAXAUEE6oG33gaDMgZG+mfbnJh9EiLpg8xiuKCZ5bycniPiiX+bS6m52eZW+bE/aBlpMkBrr
	YnkKyGHjGzlMqt2FXkokPbhLKStvdl9EVsHiaXQCDCkWgFgP9IAuyQYhu
X-Google-Smtp-Source: AGHT+IGUOsRcDWXWXshgw3+eUDsixcC1XjCIOga2rl+spBxCUbc06RAYeUk78gF6BzGL5litsgHz+A==
X-Received: by 2002:a17:907:2d1e:b0:ac6:ff34:d046 with SMTP id a640c23a62f3a-ace7103877dmr173149066b.2.1745577983978;
        Fri, 25 Apr 2025 03:46:23 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:53 +0200
Subject: [PATCH 3/6] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound
 card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-3-f90f571636e4@fairphone.com>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Document the bindings for the sound card on Fairphone 4 which uses the
older non-audioreach audio architecture.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 57f62a228c262f38e703816efdcf443355052619..6f82e5cf6df30e021692015df9ad7b09d4b2c7c6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard

-- 
2.49.0


