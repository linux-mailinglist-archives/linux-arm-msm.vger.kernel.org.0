Return-Path: <linux-arm-msm+bounces-4343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9582580E57A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 09:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 049A41F212E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 08:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA84818049;
	Tue, 12 Dec 2023 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypR8TEwi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8B1114
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 00:08:26 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c2718a768so55179095e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 00:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702368505; x=1702973305; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j7Vc7WfA6zO/nZVypNJ5ZSKRNw4vlGrxvFfZBsf6PZE=;
        b=ypR8TEwi15vwvn3g/orot97Fje5Tu/eDiE672QuyLOJC/zyA/t8BoQfaWZNI1cTKcX
         G0QY5dxFRxawWLO/uT4YaaVGiO8UiYdGIg5aoxu9PRRAR1EQNs19fcaGpldWwTGLM91w
         cOEeEs4++AoJeCartG5mpjYHpPLjLToQEYKok3KI5p/ToztrrLq+vlwvGZhFAu/Cep0v
         w1Gw7Skd+Q3zGb6yitFOHaV77C99gWt6Of7mxPEkmWczlPDWfTsD0GHbjipQ2034MvTz
         ThT4++/J4RkBpb8U75kcxnZU7lwVy8WNiSdAfe7irgP24wZJhoTLQSqwtwPWrWKMJijD
         1DyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368505; x=1702973305;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7Vc7WfA6zO/nZVypNJ5ZSKRNw4vlGrxvFfZBsf6PZE=;
        b=YJMxrBOsqBYOf93V1KDJYtbwHjanz9dYDayzeDlIDKyo1MYYorug8X1nsujgVSbIun
         pzjyvb4S8fX6JJMDqMEKcg0/zh8MfxK92XJjG5WzKucSJsB8A3VsKuPUxttuWKgJ6+Qg
         NS8FMiEgwWM37zh95nMb8lGuDr3nmm9A2XS4fq2ukRPB2fLTBlb9lOWWRV2KkpRYaTrD
         Nql7biNbCZbhDCZ8UKWO0CFB6ZBgNXYxkccCbVl8dpNMyfglrgc4hlYZwhOx96AZz3w7
         9ht3Bgb8QVND91+9JJMbWB0dh1jzL5msw5xh66bjV4LZ9X/vjDKRpFICKN/dFpMZU1Fw
         RVDw==
X-Gm-Message-State: AOJu0Ywj1tmLqfRrWrcE2lkDzPP7cTjv48QPwcBeNywCb88B21rt4TF8
	vNE4nrnRLQOUGSjsQ8SOzm85Og==
X-Google-Smtp-Source: AGHT+IFpC7/sT0VIDkEJ9Oag1ij5lW+BcSQjyEaC79Eoj7mJ9V5d7dc5CmiB4lNlsj8FfFfc2beOKw==
X-Received: by 2002:a1c:4c07:0:b0:40b:5e1b:54ae with SMTP id z7-20020a1c4c07000000b0040b5e1b54aemr3470007wmf.58.1702368504657;
        Tue, 12 Dec 2023 00:08:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c500a00b004094e565e71sm15609355wmr.23.2023.12.12.00.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:08:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] ASoC: qcom: add sound card support for SM8650
Date: Tue, 12 Dec 2023 09:08:18 +0100
Message-Id: <20231212-topic-sm8650-upstream-snd-card-v1-0-fbfc38471204@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPIUeGUC/x3NMQ7CMAxA0atUnrHUGJUCV0EMJnHAQ9PILgip6
 t0bdXzL/yu4mIrDvVvB5Keuc2kIpw7ih8tbUFMzUE/nQIFwmatG9Ol6GXr8Vl9MeEIvCSNbwjD
 Ia+TMNOYbtEg1yfo/Bo/ntu1u7ASicAAAAA==
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OrzPyzSnlQ4w2hZz/Baas4f3W1LzsV2V/lHEDAWTjGs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBleBT2CPZAHiWYnl772ED0TNHbAgYjtuRnkahPbmGn
 3VyDLO+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXgU9gAKCRB33NvayMhJ0UBCD/
 9aS6SDPueYXQWfGRWKZB57ZqiqxFUMnfUecohs0K3A9LsjgvoT4R7lH6F34NLx6LH+WvzRW6pk1TUx
 3UoDBwn8tSItLhAVVeMl2CVJASIf/WjJ4yfBJ/h1lSbcrK0w6BbudEgoa8IrWHbvs2hkG4RJKWxyRl
 wKw6QHOrLYa8tkL+R2KNBq1ncJrCvClS4BKKEuWE1fE/1++ETTHrFA5N83pK/aOmyTgLhxSZVI/e4A
 jpkOIe6EZ832SoOZqB1R8p9HE92d73wgl6jkTSIY9wGdlvtyGuzwiIoDQvJLrmIdbWXKm2M5dWEoZ3
 wqQ34Q1SEXvdQRdOXxNh1RvMvNFm2vM4Ustviq0Tq0vDzA7ipLgB/J4PpPK7w66xhchhKCYEqQN2F8
 GFLAFbRPO4EWOCMNGHL0lDHrma6kQxN0NzNRuys1ZVCgj4iLwWk+y/8Usf2pABq4lZQB3dY+BiuKkb
 c6BlS2j1VD9GlzdWVVgWRgW9/AC1byA/lpMtuvC7UdbHBwPijaSd9iMPzXvAm8+o+pmY1u6DpphYNU
 8p0cQKWqjzRHhWwwhiDRQV2OZPoq+HBSTYWSL6E3C+ufMgyPh+hfynBBUDUplSGC3gt2yeIU6wLgrh
 qOxB2BpJRdk/+JUqbesJAv1m9D6tXx14XEFPbdEBR3szRjrFgz2NzdQvBUGw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the SM8650 sound card using the SM8450 fallback
and add the SM8650 compatible to the sc8280xp sound card
driver to use the sm8650 card driver_name like SM8450 & SM8550.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      ASoC: dt-bindings: qcom,sm8250: document SM8650 sound card
      ASoC: qcom: sc8280xp: Add support for SM8650

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 sound/soc/qcom/sc8280xp.c                                | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: bbd220ce4e29ed55ab079007cff0b550895258eb
change-id: 20231212-topic-sm8650-upstream-snd-card-15eb7afa27f9

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


