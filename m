Return-Path: <linux-arm-msm+bounces-12358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0606186143E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 15:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C0441F2268D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 14:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A27B84FCA;
	Fri, 23 Feb 2024 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y8nFaImu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98398821
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708699092; cv=none; b=oRxEApkItOr5iIn32nAAPtCf/eUnW30AGv5Dni2FKhUmFPS0tyEujdPXAkG6qRkvSLCGSbKbMeIDEs740ArOimInkt9SADI+C2CBw5bJHPeRA86X0qRdCfcwbZKxnBf+Zr6VUy5eew/3zhc8nCCgQPDT6jlwNXoACUP5NhlfFb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708699092; c=relaxed/simple;
	bh=OuvXRC94CLFGQE/I3V/oWFbOPTArY8NwO98GFsP3Xi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EH1cM0Vu9022S2NVfmV5LZXQdKirUtre172s+zUncTS8KvkxuIcoWexxE5OoN2x6BWYQhkoUhY4XiGo/JuxBQ/xuwDVWE26d9vSTPfV6XoTSje2tYxD5pFyh0iBFgN28G/xNcTIWDludmJNT4OOFfyPKI9IoeMQaDRmbRNiqqsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y8nFaImu; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-563fe793e1cso1159237a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 06:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708699089; x=1709303889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUd3mgYBbijacmsAwt3IXQNAbwNLxGksnhh4kz+H3mQ=;
        b=y8nFaImu/kzNc17fyp37/wDbxVCGWw+aibFcqSdbp4A3dO/g504AMh4VSvoZex9S/C
         9BCK0+l7FPqsbsR+n62a6mS/x2eR5vpdC5ClIPzTIEils1D3TUsVtfs4S9AK7oaM0PoF
         Tz/MTWZXVxoAp31OWgr0vOFaE2lK3Chv81Em0Kf9S3IppNkzBhVbeqxOZ8VbxJvQXpIc
         6f335dmDvxK3p4UVJwqthDcyBrp3SIVEhTV2mu0bxqcVi5bh6iA8r2GYAROfPSN5Mhdr
         xKNckO7qf8Ob/PmiBXZnhrL2pWFT7Bxvy7Sj1RuBlMV/R9a+OvOCh+HMnXd/i9+Ki79c
         SqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708699089; x=1709303889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUd3mgYBbijacmsAwt3IXQNAbwNLxGksnhh4kz+H3mQ=;
        b=YMRN6Sl39Sw+rV4l4cjtjGiXB0Kb3Wy5KnpHsOE69HSdo6ahy1HfVm0HHOJqEAZSYR
         IdVfto/kCCuarC7qRFUhDnDOn2GsfZv59IrCYTtP2Yjx0nhlYkQ1H+ScBvnu7V3f8kfB
         uCw87pGaLIW9oNPqIK99Fssvk8g6iA5ozBuiWGsSTQWJ1eYjpFtb0z4pckWtQ/7XicEM
         eJE8Wt7VUfze8GEOBRlcjMR2628iBJTvvPz/9/ywS0CizX4z+7uLFZjIaJ63K//4We8N
         RBkcSBfqDbKrDeNOeMt4Xq/msuBzjN7YydQB327xdD+GEm7clq6SfTnRNKKcc1HyA6L4
         QhkQ==
X-Gm-Message-State: AOJu0YzoCaOee7VhWFtS9BALZgbU0AvXDcTn8bLt4KwiE9FoFJmIdgmv
	oOdOyFUzqTifgGE+RfteJuk+nPHUITzH+pRAY1S0cqb8wWfn7+W5GbfydjJt3uA=
X-Google-Smtp-Source: AGHT+IFxLbTtY6sGf8r4wAZ7dfn+gHL0XyWIOQ9JuxE0N5Q5aaSCJFmeQcCvlzk8xtocS/OPjZ18yg==
X-Received: by 2002:aa7:c697:0:b0:563:eca6:733c with SMTP id n23-20020aa7c697000000b00563eca6733cmr16668edq.15.1708699089030;
        Fri, 23 Feb 2024 06:38:09 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id p27-20020a056402501b00b00562d908daf4sm6637536eda.84.2024.02.23.06.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 06:38:08 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 23 Feb 2024 16:37:56 +0200
Subject: [PATCH 2/3] soc: qcom: socinfo: Add X1E80100 SoC ID table entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-x1e80100-socinfo-v1-2-be581ca60f27@linaro.org>
References: <20240223-x1e80100-socinfo-v1-0-be581ca60f27@linaro.org>
In-Reply-To: <20240223-x1e80100-socinfo-v1-0-be581ca60f27@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=647; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=OuvXRC94CLFGQE/I3V/oWFbOPTArY8NwO98GFsP3Xi0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl2K3LKLJu2H2wDU38wEXpexLiMerkyZ84KtvA8
 FeEa7LaMLqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZditywAKCRAbX0TJAJUV
 Vp3cEACN2AcnKFkKo9EzysazyAWEuaUACxpno+k0S2ocKIkdNcgTmU1ACSW5OZPIl8i2IKELRHW
 0X+TeeyZ1+xEG3pWvSrXHP4x//fTe72bKzEIAQLWdkS//3t3V/RhHQz3IPklsBmveRTJ8NEVB4n
 yBfuoXG1lxlYVhF6KEHBFUQ6sDB7w91VPP5hREG2ROgSzOXgj72IwPpFH9HgEHncFOhEWx7Z8Hl
 zBJ/NBPQxAbkuDUFRK7Q57ZTLauiFe2fP8gW8s3NhazYfA6JYhH1nt/ii3gIqi4XqmdyTo+1U7i
 xkRtVmtNxoCxjBtaZPq8SA1FcNcI4jM/LytuAaotdyy5qRawuDC9T+iShp6Ik9ZE5vRZNImH5jh
 Hdr//uIEVPKciYbdoNxifcjXGxf8SXYiBnoEL6S4sBm7B9x3/J26dQdtHF4A0GOUuFcPZaka7RP
 D6EJs4Hpzv4v2YRUXYxGeHemF8HMx8hD97DP23hEfVEM3eczLjSdqwIdYFjsXTGNQf00jJDfsKw
 li2y8xrWUHmEczYf1HcA3d0CKHJ3nESh0i0Q8RXgu4S88nIA87xTnGcqYBQWeYQ1KD+K88WnITt
 6kTZM4vrtZ7R7+5kHAPfTXw806NGd5VPMQVGswzzCcY0VvfVKrjDkYFuyByRuRq7tIlXgXyQTJY
 EIBddb901qdxBzQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add SoC Info support for the X1E80100 platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index e8ff9819ac47..c8e968d7a620 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -430,6 +430,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QRU1000) },
 	{ qcom_board_id(SM8475_2) },
 	{ qcom_board_id(QDU1000) },
+	{ qcom_board_id(X1E80100) },
 	{ qcom_board_id(SM8650) },
 	{ qcom_board_id(SM4450) },
 	{ qcom_board_id(QDU1010) },

-- 
2.34.1


