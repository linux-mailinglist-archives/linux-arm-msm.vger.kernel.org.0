Return-Path: <linux-arm-msm+bounces-51196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A329BA5E459
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 20:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EAAE17BAA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 19:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FCD259CB0;
	Wed, 12 Mar 2025 19:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lls1XP+V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAF523F369
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 19:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741807659; cv=none; b=CfjqodgHHVTeNITr8QzfBewnSSNCorGAFxT/XpZuVx7f0nTQ5h9FhNHURJLh7yF/+nQh/FMCbp37/I4W1ChcVxHEywhJwTxRUkp8ElL1Cq/hXIKNKUF2d3bypltCDV1GL+w/IBWbkmVdkWMMxLRoQwfbp2aQbA6oTCnyjjbCxQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741807659; c=relaxed/simple;
	bh=0jMuW75ONhCU98g91Ki0i+ClWIuHSukhvmLA5nKGMW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ebdmaRyXB9M+XAWhPv2qGdFSjI3mU2CO8i1M78QLAJA2EJf4P7wdCoyKseG/6zwehwTEzbgxwaWtLfB1tqwY+IfquzFLvLHIAjA1rzr2mYO+q1OgFGseJFlefTXyrwr1H9J0is0jwJ/4eJ9fSZmWpCPJ/XhKghX3DywcQ0dTtU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lls1XP+V; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43938828d02so216885e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 12:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741807655; x=1742412455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TthKowtkg3ZH4r2XBt7MSSpgewnQfw6r9pBf+S41jDs=;
        b=lls1XP+VmNRIjPDnguDQR/l+7293rxNSZ6NwaT0ZGBQK3QojGx5SyZ4XFEGvatYNYV
         lW4lN+7fkXTWORq2nyJiiy74QPGuvhK0NYteTmEstrlEV4XkOqOA9pFHfMqVMhwSlpCT
         TgrgyDvRG5aAFXDJjlq4ZJ2vyXaAl+nLSOLEmd5z50vJGZtpgL7dGnFS1bKlJlfN4uyY
         wTzfCGiPupmaNUmDJ4TpXKdcaXulSVCCMJ/Sv6lmZAG2e8Pk7c2kR3apJI/0RJtqE1pW
         4FMQ5KxIkK5Tichwkb8ZSHRcBEmcMtf5cIKDLC1wDQhZglzSfIV5CaxRZxTFMDeW2m2H
         MSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741807655; x=1742412455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TthKowtkg3ZH4r2XBt7MSSpgewnQfw6r9pBf+S41jDs=;
        b=C2bVErMi6mABQlATA+jMQZYjfF/0LySQ/vlxNC0mwccHH8p5terckfgP1I1AA/WCm5
         tvFtIatWcLoM87mxhIl5QnE7FOPKcYeeKa70dDPr/w5+tuGC31Fe6ImSgSotPqGZvdN2
         r9p7UevvwxyqB9fmgLMZUZ7PXAkdeIVkN0EGZnZGtwHl06SxDYfaRhb/MvCApqOrljsr
         Wc8RY3Y2cvWET1T/AQbL6n03nmQ4RKBIFkPM3k5SqQmYuPnQNqb5oJktEP/HU4yLIvvO
         3rJCmV9vydDLbtA/wtFlIpDXb5qSPbGGFI0Z0z7p8d5ep2Xi5KeIgqtKJcDSgo3m/adU
         Ircg==
X-Forwarded-Encrypted: i=1; AJvYcCV1TEvdB8IjIhTsQTPcV/+vD8ARrPKJb86+iTyvgGGbOfG//Of0k+gUSi/SIWY9aXbfB545shKWv4FocJg6@vger.kernel.org
X-Gm-Message-State: AOJu0YywEv0b5A/m7YZavzM3w3s48UgsjNfPBYiJuWodRmC22PiLIehy
	IGUogDdK0ZgjuhMO3/taXkevmfZN3RyscXDB7167My1jFTRhzskdgMMALCePDX0=
X-Gm-Gg: ASbGncurVB2wFaiHBC/0tExPdtXuLuX0oIfPNZamjtGmtf29kk8PwuHyrF86C+GFl2U
	JxJLqrS2iUuBGYPzEt7m+3UaSnizkTCYXQx+eiJpeOVLw+j84Zm2L4JskQ9GSz27teU/2qmn7z3
	Pvunimc8fZ0AJCF7nWgTptmHuotX+2bbm8dcS53GiObJdmdkQQNYh1S2H+C0FaPJpdSgRGQRwoj
	aAJCBtzjqCredB18BKDNBsoGe8Bo0DDfzWWXDV8xQtqrr2KNB2gMWYAPAHRoOytGcIIQ+d8qmJS
	mrioc3u7+0r8C3fx/JE4SYFcQ74BMbLG/TmhVMOPKbRC3GSFuWW+9yJpApw=
X-Google-Smtp-Source: AGHT+IFNDMKyFlmL29BIYtE87ieQh9czS303C7tJdh4xet0OcI/TZLd5Tui0luLGPrsnPNEL65CGKA==
X-Received: by 2002:a05:600c:45d3:b0:43b:cd07:92fb with SMTP id 5b1f17b1804b1-43d01c230famr37689245e9.6.1741807655471;
        Wed, 12 Mar 2025 12:27:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a7903fbsm29331995e9.32.2025.03.12.12.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:27:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Mar 2025 20:25:00 +0100
Subject: [PATCH 2/2] ASoC: codecs: wsa884x: Correct VI sense channel mask
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-asoc-wsa88xx-visense-v1-2-9ca705881122@linaro.org>
References: <20250312-asoc-wsa88xx-visense-v1-0-9ca705881122@linaro.org>
In-Reply-To: <20250312-asoc-wsa88xx-visense-v1-0-9ca705881122@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0jMuW75ONhCU98g91Ki0i+ClWIuHSukhvmLA5nKGMW8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0eAiJDEepXFTas2u1NQUyIbL1KrfsyTe1AbbJ
 BJGAwCF3QGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9HgIgAKCRDBN2bmhouD
 18a9EACUxXs1HSjzqKRbbCdN6UK1qvRXdWXEgeIyqupA9qLJe+njP4BVQYtWDbV621t7vHeM3H+
 M+WI9phdIiJcd4i3XJhqUdohjQBaCspx2XpW9sDgNCQ6yzNJccs2menIEKqh6J0tNT8VnWE/S+3
 HnR8AtuRZxdY1pW657ElyIOt4hzJfMgvpkPdncgkGWzD6svhQnqjVc5jXtIf5RN7Ui4FIsKY/2w
 Odqm5o/0OcVhMjjZLBc7ta8DIZyK8ylht+eZAeEkJlgVfv4J2wCSlPW0iOKsFrKqScx7zno/JhQ
 LTjN6KQLx2d8YXjKre2sx99d1BAvgwrPYfvIdSl8mNiHgmjMAWF82DqL28LLJPUJuKlrxyr3LON
 W/u0l9QJ7CZkd7/8Mpi7OSpXOSkBfUGqCwWDEIvjVs2N+rcE743MkktRsvC4IC8w5d+a5oOvNOF
 643walrryb/jloxLJXbPLDYh8NtREUZ0qSh14hMYp7jsjRGZQnC39Om1vCfNEC/MtexYTqeDSSq
 QlBoaNYrednRKM6JNA9o9iquHt+jhIBpCATNSueM9BiQEdSnkY3sxOGpLK0m0uJBRd97re33L54
 RZb08QN8lTFjZ513gHzT8cZa86b7rDy9LBYZvU6cwtVmEce/LdArnWaH4jLPPKlK1eChaHag2ud
 WNF3QUWcC82MoJA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

VI sense port on WSA883x speaker takes only one channel, so use 0x1 as
channel mask.  This fixes garbage being recorded by the speaker when
testing the VI sense feedback path.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 560a2c04b695535c42bb59b17aa8a671247adf95..18b0ee8f15a55aea370350e31cc3939625fb37a2 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -891,7 +891,7 @@ static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
 	},
 	[WSA884X_PORT_VISENSE] = {
 		.num = WSA884X_PORT_VISENSE + 1,
-		.ch_mask = 0x3,
+		.ch_mask = 0x1,
 	},
 	[WSA884X_PORT_CPS] = {
 		.num = WSA884X_PORT_CPS + 1,

-- 
2.43.0


