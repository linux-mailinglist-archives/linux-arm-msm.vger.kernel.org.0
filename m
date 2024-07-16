Return-Path: <linux-arm-msm+bounces-26300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 958B993233C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 11:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51DAC28443C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 09:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31E5197A92;
	Tue, 16 Jul 2024 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jhxome/a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEBE198840
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 09:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721123119; cv=none; b=TfZc70R0Bl7sjiR0AsM44XrjtrkY0BlgMo4fizsjTBRJV0ZA0ma9tS+5OesfLgVpK3wa96n5j71iietEW012kuoI/raTCqy2egXmntEY4PiHb1ZEHErxFjfJTs82eB3lUJfJzQmWbmf71MSrByQ7CAnY2tyBU2oPJbLxunBLSj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721123119; c=relaxed/simple;
	bh=IbF+oVlsASrCxDCtgSMiLlRtmsmtWhBwoHzzIyNr2Z4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W35r+y7Fg74XtyEZ7BKLNeFR1ZGPaeaHV0ltNUiCrSttEdpjA8G+XPAHdCxHzZhBQrso1QpfayoG8Wf++UZ/Ixl+EBsNN7UWcbYOoVL4JFES163QuFKJM+sAZ/tw6yhSZyMPSTRPOhy/AdcuQ5UOKl1KLs5v3uktYE9aU8ErHdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jhxome/a; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4265b7514fcso36236775e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 02:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721123116; x=1721727916; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2k6a4tmpt4FwSS1Q5VjwCKqeHMpr9HeTZeCfn6YizvU=;
        b=Jhxome/aIUm6MdFuRGAXGvJMD4DQeYIbOL42ldLKfb0Ei8j2pbLDo7sIojHUzaZEuP
         rrJJafOfA6cONlq0QVfgXBEY0pN2Kxyl83oaepRzi30wHeF614AVik8GVPpFyY2eIpDq
         1ecO6RaU1xro46Uuf6RfzQC5t4ufk+ohasmIZZOj9W/qjQ8WQFyH8NokhhdCUcL1vXZi
         E5wBoR9vyrOoCfY5W/eOT5KLMSDgT9rY/G0fumvNrbwxM4LuhS/1PlI31AHb8BSx4fHM
         +MFE9/PM/ECuXUYT5Hjtd9HNh8J12Dx+Gn4zVdZivbbyPReNnk8/vPvPkt7IYq8/MjCr
         JODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721123116; x=1721727916;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2k6a4tmpt4FwSS1Q5VjwCKqeHMpr9HeTZeCfn6YizvU=;
        b=TTjElR1tDdEj/SiD3LDnVNjFRlxOJX5saMxiO8lVUvHc0V+edxbeaw220UkIpglOQf
         m0UcWIQQdGB8DHOT7Q7AopbZDWklIab1dYaWQ3mslaDM/OXKcZ0qj/iASYuwHbV5B2h+
         D3Uv7DLGKOj6eU1pfBmd+gnZA6SWztaIVIRDM3rUm8l4NFV5bnb8lIWeqbFyo/8aMCi/
         Mr+k652VMwtR9ssHqwa2ArmSmHmu92i9thugDw+KHgNxTEuKXIf/LZMrpVy5rUpEpUh+
         C+rRbg61ELyvtbKxHDr6y/oOeVHHPU/r4D2SFFnxA4F2n8OJUAPlQ1r8fF+kRwRlb0ur
         byLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXOS2vt291PuNFJnqhuYbfcOuhDLRvHvFfw5ypsh4F2M4ydj9al5BCfb0/IUCtkhyNr8hYvLUhrqA2Sat5rRjdRpWKS9lk7w9ntZe/qw==
X-Gm-Message-State: AOJu0Yw7a/hha32YBURfqBB+Cjy+C75Z0z3TbSgd4Hug3Fe/yWHfKiGe
	O4nNj8utUC/2DfEXgugIf0qd5+RBOvbPk3sBTprua0SJcTo8xe+Wj54rYB7MTVg=
X-Google-Smtp-Source: AGHT+IGH09+J5MKzEaIfOp2Cw3apVixdIIGoHnc0cSbNzkcbgCAs8q/Irdj+//xDLZB+oxI5c+HA7A==
X-Received: by 2002:a05:600c:4f06:b0:426:63bc:f031 with SMTP id 5b1f17b1804b1-427bb686d69mr11855835e9.1.1721123116010;
        Tue, 16 Jul 2024 02:45:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2cc2efsm154408185e9.36.2024.07.16.02.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:45:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sm8[56]50: use the PMU to power up
 bluetooth
Date: Tue, 16 Jul 2024 11:45:09 +0200
Message-Id: <20240716-topic-sm8x50-upstream-use-pmu-to-power-up-bt-v1-0-67b3755edf6a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACVBlmYC/x2NQQrCMBAAv1L27EISq1a/Ujw07Ub3kCbsJloo/
 bvB4zAws4OSMCk8uh2EPqyc1gb21MH8ntYXIS+NwRnXm5u9YkmZZ9Q4bBeDNWsRmiJWJcyxNos
 5fUmaQV/Qh94vwzn4u3XQklko8Pbfjc/j+AFh+qcwfgAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=846;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IbF+oVlsASrCxDCtgSMiLlRtmsmtWhBwoHzzIyNr2Z4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmlkEq/tSs1Nb2dFF7Fs0FQyUXnTXibdgXCkrTWlTq
 P79n+naJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZpZBKgAKCRB33NvayMhJ0YprD/
 43QxVIqj//7SEKCPKDUKP2mtFXeEPOQv8/QyTTbDJrOw5cBHaDhBlV3K/L3aeiZQk00fkRjhSewOEv
 qIJ10TY9PBUO8OKJ+RMK02yBsIEZ0bCoGzJo7mp+siy596cF3Gd1xsq4uM/2z64TRoe/hdAYMQkmRn
 dp+opcNHMqQyygpfbr//qovDn5Sk14gclNXIQOK6GH+YpsgxamSoYQ3UjcskLnCmNonb2eR/P05ZTe
 EmVehFvF7sQUj/WbTcmj7dbJ+9fgxaSz09sIsYEeBnnGoSs48ufjNGQ8vHDKvO2Cim5vM8npMux0gE
 vO1a94qETQLiZ6hzSJ5plt2NW3WK9XEjXED0PnpzlelpaD8x5rtPbnrTpDxrBoacYZE6c1hhfQNZGr
 e5IIyJibtRAJMmZhA/REJi4a9IhA8cwkSsMH0JlWlgnLRsYBa06JJrDemsB+CTIHH29xVJQ3mv3qJy
 52/4hdYcVlbJAGH3DFwIpF17y9FDkQ2QvvcObd8GOFvWBabk8Hz2FBApINSTIWRv31a9O/uczlfNZz
 YnInrAas0AxaIrm5NkUEXod5Qb4IrtcnIYVW/HSskQyvDKuivNAa4GJrRZ9UWYLDvpK+rx7smxlRIL
 DWGB9r/PMsNB14K/D9keWXw9Elhjxbr2m77T0aHeyiSVXuOPRm56bu1XlrdA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Update DT of SM8550-QRD and SM865-HDK to use the PMU to power up bluetooth.

Based on the SM8650-QRD change at [1]

[1] https://lore.kernel.org/all/20240709-hci_qca_refactor-v3-6-5f48ca001fed@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      arm64: dts: qcom: sm8650-hdk: use the PMU to power up bluetooth
      arm64: dts: qcom: sm8550-qrd: use the PMU to power up bluetooth

 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 26 +++++++++-----------------
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 26 +++++++++-----------------
 2 files changed, 18 insertions(+), 34 deletions(-)
---
base-commit: 4f40be61af99a67d5580c1448acd9b74c0376389
change-id: 20240716-topic-sm8x50-upstream-use-pmu-to-power-up-bt-bf4bd83fb912

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


