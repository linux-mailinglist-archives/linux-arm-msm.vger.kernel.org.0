Return-Path: <linux-arm-msm+bounces-49233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B7BA4392F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BF161886023
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 09:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DA326561A;
	Tue, 25 Feb 2025 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VHcRiYdr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C596256C62
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740474619; cv=none; b=jnxEowccBjB4GmnrbT5rQldWvd2utDbyF7ijyaOvbAJRFZ0c/IVqztVKhjnLHovAwozAV3tck9Ngr/vvDkfDKahQfHya8FJDedrXNAueHZE6eCbgbeu49vVMSJBxQEObnnmp1G+BqR1Rz2qLQ5q3aItRgBdje3Yeb6n4GTGzVMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740474619; c=relaxed/simple;
	bh=qPEwhMwk/tYnbquObvTItoCl+kpW9Zcq0Aog5uMEEb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HTboBcL9pZLH/N7jvnIbhT0k80lxcKvALyJKhvhzpUN6INNeKf2jDO1d0w8RD33fHGkFzb11BCDDn6TrukGCu3i1ylAneftVjxm5B4o2T4qFizUHGUsDrJJEVr73GpA1iZBnv56ichlj/wO0/Sjbqk/lDtHn65mcoe0VRIRv4BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VHcRiYdr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43996e95114so34676495e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474615; x=1741079415; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUxR/r796SUvbiyGa1bSMGrrDRqX6TeysLJjNijsVtQ=;
        b=VHcRiYdrq7NfFVT28kWRCpbXEmJPtngkOz+MRbgwQXo4EUizPThnUTm3yoWy5rKJv5
         LNXo4g6Sz3jxnUIf3X6vgD9Pw7Tk7j26vtKjtc8fw0UHzjTtCmatGzt5Y0eqmPWlQWMk
         qeYmUBdVXBQxWW+i7LUoR/qODwOw5xltof41myva60Ndrj4Div0xXVVh6NpqP6SRmqR0
         hKaNey8u1CyRTl8lQ9FntEvRBZgdiVV/v3VSXRMvwR7vABq18+c4pWWmmHcNSVNIHzIs
         T2xxlYMmJt4LYWDOBPDN4Jby27JbGzznqzHA5y5+YiwfrZKq8uDocecxlNNp6n4XPMvn
         aayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474615; x=1741079415;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUxR/r796SUvbiyGa1bSMGrrDRqX6TeysLJjNijsVtQ=;
        b=acq3Ns7q1bDWLW1wIPX2dcj8yQ1cQzWCcW7KTUFoWoEMyvCRFOkihQLxGO2izZG7id
         9uVeheMdySYynNWDAXjyKurpr9zNu0mNT2vYAtKXIuN5rLds1GKZSOMFVnjMv3vknifI
         EEwXAQD9GGF86ZbRVNbNIJIbVP91xhBHxSZtxXEYc3fHfMGa0+Nw7uaf0H08hnOUsR3T
         LG+RSRbrsJ+xgxIXY0SyUSaCsKDW1o9oSbdrLmTWDiRlheXtSTNE8k04Tc1bA4KpR/G5
         XxJW2ip0LAirew0SfQhb9lOlgIrcTmDAgXgmBR+0oC5R8dARh620ZW4SlaYDEhStrkFd
         lkwA==
X-Forwarded-Encrypted: i=1; AJvYcCVihLXB4ccSjFTsm6qEISNNSTVprbSCV1pP3qjJa2DApFdouj5hU9l47Tai7JczjrPbPGi/0ox8I69wn/+g@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo5VICTsb0k6e+aD/2DfAxVndNmg1ChgL9UPzvwFl3s6owaGbX
	euX23lqSODUrHG/72obWtMFJNWdM3kl6ACcHku8TSwj1UROrfoc7MVsz/2c9iV4=
X-Gm-Gg: ASbGncsgkgofOH9LL/sdBZ6vVwZjhdOEt20SCdLTA8jwuXW3xLZREZ89oGrz07u9LqH
	biq3W48U6lIMTLpoI9Ihr4RwiBBXaYIvXkNF3VasVei+kw13vry42hLQV64Pz8s3WPGwJKIFKy3
	ayFS8K1n09nSKN5iND4c8JzHcEQpEXA0w97z0Hpoqh/KOFhSIK54AudiTojtQ+hlCGZR16Eo2FZ
	jPBoYtKugJeK8YhV9at84jsqzwWJVyGqVjQvyOnEXnt3YEi/W515IT4SrFs4MJTbH9s7MEMSuZU
	Y+sx0c8nwuaB4j2GlGYBuM8y81261p4x+8lYrgu2lqzh+AU=
X-Google-Smtp-Source: AGHT+IGM+4Pzn8UsD55Fq+BjehI/DdVlvQlr7slmeNsQ8GYd6WBYlQHEqixk7pmsC1Arj8pkbnBpSw==
X-Received: by 2002:a05:600c:19ce:b0:439:a1c7:7b2d with SMTP id 5b1f17b1804b1-439aeae05fbmr136888695e9.4.1740474615544;
        Tue, 25 Feb 2025 01:10:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab155eb6csm18607295e9.31.2025.02.25.01.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:10:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 25 Feb 2025 10:10:11 +0100
Subject: [PATCH] arm64: defconfig: enable Qualcomm IRIS & VIDEOCC_8550 as
 module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-topic-sm8x50-upstream-iris-defconfig-v1-1-8a17e2e193d9@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPOIvWcC/x3NwQqDMAyA4VeRnBeowXZjrzJ20Jq6HGxL4oYgv
 rtlx+/y/wcYq7DBsztA+ScmJTf0tw7iZ8wLo8zNQI68I/K4lSoRbX3s3uG32qY8rigqhjOnWHK
 SBScfQqB+uE/koKWqcpL9v3m9z/MC7gDxg3YAAAA=
X-Change-ID: 20250225-topic-sm8x50-upstream-iris-defconfig-b56662147b20
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qPEwhMwk/tYnbquObvTItoCl+kpW9Zcq0Aog5uMEEb4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnvYj2GCmWlPYu4JSBRgvuRiD/l1jBpwcTsfFzEl/C
 Yo+1timJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ72I9gAKCRB33NvayMhJ0derEA
 DOKWr0KWRMUHmWtYFdAjMujKU5JSKy02jE5Ubb+oaMWYNYvWIaKmTQ0JA5U4T4MYztlFXZwNm4Io/U
 4AxbwjBPqtBrjlbDs3DNfd6zbGwRGl3YKKcO5zx0Sla6Av6cuiKPkynEExpBgqQ5weoZQ3rEEMwFry
 uVx23esy8xbDwSYZcVEEqq8gV/H6Z14rMISx1upHJyOlXs4lZStzoIh/1uBKTXfHKiuKE4aLvjVohW
 T2sV9U8PtVRqEtl/iDHGqAzJgVlzn82LFQai55VPvVGsTqJsawzvSG3HXGeQywlr0rUpVHC13/pIjB
 LUc6N0Qz8WxfXJrdP96+lFGpZSZed6VGFhGaEwpPk2Ig0YhRO0oeWnHviJR0vXsqWHOZLVWM7ODQlt
 ei6aYotNxAGFHAaFMzE6YQjsiLUq3Utpj54MBymbf/X6yE47/qngtXcannpVngLmOl2rHAZcGJ/24e
 Za3WhKsBsSuE0qquZztGLmTLxB7IN5912qUawvgpTn2R96JNGhvdSPGHYyEwwvzhCQf/JXHy9vhrXC
 UQYH9Q99Mp5BvRPNf0higDzVfj72OgXjAZAGX6W/+AqNu7ajZ1bnYUwKMcxp1AVUzoz0iZ5dQh8fmi
 mrWvcyDMow9bV+OBd57+WDpI1sGvPbIGj26AUZgzp/hjBZoYh9uG5J2dFtFg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to support the Qualcomm IRIS driver on the Qualcomm SM8550
platform, enable the IRIS and the VIDEOCC_8550 dependency as modules.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a1cc3814b09b31ee659536a64b7db704153d6fe9..710452f75133896af2e3a19ae544f139e1c28a98 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -847,6 +847,7 @@ CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
 CONFIG_VIDEO_QCOM_VENUS=m
+CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_RCAR_ISP=m
 CONFIG_VIDEO_RCAR_CSI2=m
 CONFIG_VIDEO_RCAR_VIN=m
@@ -1395,6 +1396,7 @@ CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_TCSRCC_8750=m
 CONFIG_SA_VIDEOCC_8775P=m
 CONFIG_SM_VIDEOCC_8250=y
+CONFIG_SM_VIDEOCC_8550=m
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y

---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250225-topic-sm8x50-upstream-iris-defconfig-b56662147b20

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


