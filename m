Return-Path: <linux-arm-msm+bounces-90055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCrKKbYfcWmodQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:49:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CF35B853
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 258AEAE4B04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B8548B37C;
	Wed, 21 Jan 2026 16:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PE/HD6lD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B8A48AE06
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 16:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769013635; cv=none; b=WSzpxCRwJKlQG6K7SmU0A/UMkbWdVUyUdAEmKvcMwhwqV80of0TRAXhRONZ22ygqff5LXxplO6/bu9fsWhGfvKXTtpdJUK8nLSVo8ISArCZnYcCXa8/69cJKN0cpQEAlr4HhC5jtOjboX2c7tqDmdqWv4ch+xmSiy9vIf0hibA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769013635; c=relaxed/simple;
	bh=GucOFHbEItyyEMohgBU11TPz69Zj2v3jbLe09shtoY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WF5BVofII+uJKCtiHAflgQ28s/sMr4zWXalWxfvCsWnLoYmkscJG/utN+JZ/PEni6zo+ODekYGiwPHYp8/u3E6s4pHTv1JGBPsOz/G5RCfgSmic7YOX5Zti/bC7BTxryCcOhgSvlU2PwhQQtO3QdxZB9vxG1N4USRjT0CwO15js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PE/HD6lD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so267555e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769013631; x=1769618431; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhACDPHLI7qChDV2w7aC2l8AbJSpZTGzgle7QIcbXyg=;
        b=PE/HD6lD567dImmiCcYfITHGlOB/eJEoNArJdYTFWRKx2t7c5mnt9xDwbV9Cw0aeHK
         +/1VtJ6ua4a1P58InxsomFWHcvAYxl4Qg9N5neJRfLYJ3ef/9+UQv10bZJGvAIQ0fM4l
         e7N6rqtyv5fEdsw64OfqDXchChPC23DjCohdljJqpFi3BjOrvyFWcENmRHlfafL8N07v
         HPsMwWM+HnutRbpI2lROwN9m2p9mmD34kRZXPZeOZ8RBKmWiXxsxAGHBFcHb4zuqLMZ4
         BhbqBz6y+drJMOKlvSGH9SN9842DjxbpDwITrQBak5rgWzGQFp29SZgqF0VOV+46vkXh
         lyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013631; x=1769618431;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhACDPHLI7qChDV2w7aC2l8AbJSpZTGzgle7QIcbXyg=;
        b=JhcwymkdhiKpsVTa3j+Q/0MN7U5qB9OfxHKm+m3u8gGiwzgtMcWxHVPIrzTNCygKdV
         va9dWnM2BIWJOBsOU21gmJ1q4q1FeMtjTG6gZPDJ9qY4mm5wcHjd5yJkYTyH8RImxlWy
         URPe0HYTpNdbg/iZBN4pICtUf8vpNgZp6HXytxsyibhcnI7P2G01OqtbK4zJx6JOi/lK
         FMLByY6El+3LU4pY2k6+KyuyDRBBSYpnCX5KBehqF73D2MvcI/+oSl8A4ZUDVixHBAGQ
         m9+dE5fZX21VkpRHmTWbRGSLArqonJTYuvv6JFcSEeqqyydcao0gbLr77Hue2xBeVrW5
         1yiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBbGdt4NiCyyIQqQPlEsy3L6LILKDXhMvCVxYE1XilPMegiMG9kX2U6ZUeSsdVTBsPeNSkP7Agw1peA+FZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8XTYiIeQIi5Ku4+LmB3QfFyUF5OS8IOlQ0UMpoXd1uyoLNlab
	OWFn3oAI4YEf1I4dmYKYlL58FqNeOuIUqUBU8Gl+HeGqh82ZB5VjFhLS7vNZ0UKFNS66mXcQ8ae
	IPTMMEPk=
X-Gm-Gg: AZuq6aL8liQIiX4bxOQuK6DTmj9mBFFh9i2QaAsTjafa4DCwE9mCIUQGa7b6qE+n+B7
	1D0i6H91CsWDBC+leJzVMZe+R24QMvoaNXrOBrocSBxR4FuhctwgJ7/UxBLfkO7q2+zHadGeDCT
	cvNku5PwLza+TsxpOQbpsP2qjoR/9ppErOHT645dcHDifYDotfYAdSW+tZlTQ2a57JRKxNEWtkm
	uL5AWmUV2JyvjRWBNT2ED9aLT1WhY2044nAL3b7IUjVi4bKadyht1lsJZmI3maDAh7pQrK7yACj
	1XBbRVZvhJlP9Do1ffrNUd4kQqJYjjPlvWETsi4s+FQ8i64sBZHMA7L+GJr43J8r8jz32ds5v3B
	thSguij91+dvFrBtUCyGUc5nGljpF4XPUbVLJjtrSaM8wlZqaK0faNqf3q6BQ0V4g5f66D+UyHa
	SK+02gvVn7F6yMnLYJGhP/YKmQNu3eo98=
X-Received: by 2002:a05:600c:310e:b0:47d:885d:d2ff with SMTP id 5b1f17b1804b1-4801eb11002mr233352155e9.29.1769013630788;
        Wed, 21 Jan 2026 08:40:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470287c3sm1000255e9.3.2026.01.21.08.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:40:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: Add support for the Ayaneo Pocket S2
Date: Wed, 21 Jan 2026 17:40:25 +0100
Message-Id: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHoBcWkC/x3NQQrCMBBG4auUWTuQRBuCVxEXMfmrg5iETBGl9
 O4Gl9/mvY0UXaB0njbqeItKLQP2MFF6xHIHSx4mZ5w31llea5PE+gp+Nhy/saByq+mJldXxLSr
 YzOl4Clhy8JlGqHUs8vlPLtd9/wHAH3NWdAAAAA==
X-Change-ID: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=GucOFHbEItyyEMohgBU11TPz69Zj2v3jbLe09shtoY0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpcQF73XasjjuPZpifp64X6HcPJr4AO06D8Ckz+ajP
 JePH4V6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXEBewAKCRB33NvayMhJ0cRRD/
 4iPepGS0tsFVCwRjsupRcu4sFNYMd6a9/ty2I6Ka/f/n7Z1xNpM68Vw4+xMcrwEbBE8JTqVkgzz1zv
 P1z+e2gBaeopSuXPa82s1CNoyI9XwHtVJL0hKeYckfUTr2Ww75Y2GPnLOYMg88GHG2CDtCZpyGRXvN
 ajUIggup8QpBjnKbv6O31qJtuHrR2ASilfajHZvoePoWkM6iVruEH2ZcDX0wYIJEiNcvZ0sDerdQwj
 7x6pFUVoptK7yV3HhDrSMsmKR7k/EpAVzO0R7gMOWRlG8mOVn7jTXPcKqN/MsIZprQ5apptApldSsO
 y7V007SVRJgsQoMBzFSzSMRjfvjZ+W5cp7tgzLVwyfZHiSK9Zt2IhkcTIv8W6V3LD242w8vW5XP8jV
 438pgtKko0iRhhZfqhzbEWRkJ9mBIAI1B5fMqyfhBk3TDd55xAbCMlUqHKsi0ocSKJ5v86/bwkgY9F
 R/i1nWZuJ6OSvAHd0tOSlphjDhg+lOZasxehThzcmk0G4iAWCDcwJBEfEjIe7k9lEVkB948N3jpXfO
 U20qhwm17waC9roaPAOSJh/qyRECKf0ba2/SC/U3zrhMPF9OsMnSNfp/7Vgl1v+yVJXOS/SPhkhEkk
 SpHGxS1AFWpzT8LymVkJ3Vfr5/kyd6j4mWOh7qQdAirOkCjc8+AFSBegFMaA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,linaro.org,outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90055-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 31CF35B853
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Ayaneo Pocket S2 is a gaming console based on the Qualcomm
Snapdragon 8 Gen 3. It has an internal UFS storage, WiFi,
Bluetooth, gaming buttons, SDCard, 2K display and USB-C
connector.

Product Page [1].

The Initial linux port was done by KancyJoe (Sunflower2333)
at [2].

[1] https://www.ayaneo.com/goods/9344082149621
[2] https://github.com/sunflower2333/linux/tree/master

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
KancyJoe (1):
      arm64: dts: qcom: add basic devicetree for Ayaneo Pocket S2 gaming console

Neil Armstrong (2):
      dt-binding: vendor-prefixes: document the Ayeneo brand
      dt-bindings: arm: qcom: document the Ayaneo Pocket S2

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1445 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |    2 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |    4 +-
 6 files changed, 1452 insertions(+), 3 deletions(-)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


