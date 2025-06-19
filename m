Return-Path: <linux-arm-msm+bounces-61829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E3AE0978
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 16:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26E4A1BC77B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 14:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9971228F936;
	Thu, 19 Jun 2025 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XjycNjfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CAB28DF27
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344935; cv=none; b=KEO7aj3u9Uavv+ERpH1JnnWv8Dyhjmgq2Fyt6b4mERuuLPzu/Be40h+IImuqCfiyQ2PP6SBhqbfuO9xEeyalqdNqVm6Fpc8P7ivMD+/3p/xr3WLCEuPIfIAjJbSk5nIw+PTTtbQwuxN7v4FLDvOmGzZL69Z0SklvgIK11kPo9DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344935; c=relaxed/simple;
	bh=iDLIU8cKqvcbXUMIYZ0LyAHF4U27oo4VJDAhYAedWfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E9IjrCn8QxKy1pK34hKmsT8EadpLh+zs7KXIVRBIiqtxL4J2m5GiVLC/OTD6Ul3sP7BLerrTMwdufzGaNDStssca7nBfSp6U/l38kpAjUlpH+3Cq/29C6w3NCP3eFnuSkPKsE/UVg7zs8nmsjapIp7mLm12CpTWN/WZU0W/SN7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XjycNjfh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450ce671a08so5631175e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 07:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750344931; x=1750949731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9GucHfZPCayxh1y8Bqgadbm6OXspkCQUE4SSbOEVnA=;
        b=XjycNjfhOvt2kNBpm+RHazbZfv9Q0LvHUmDtRIhyaXZo8JODRgLZYD4WjBzsVuktxH
         TS/+a0im5wzY7CpSzvFxl9jkg2kSJ48xrgWVRAFIyFSfqA8dBthJvQcb4tk6ofaaz4EO
         fdyrPALL2DbpZwmDiFHYUHlCas3WS9AA7ydMwWSLxspaTge4ikOdZYDnWzl3traVaidE
         1ZbXx6y5AnS/nqES6y+seHadVm09zhhjBeld1mGIGD83vXQAisFrDlXhmEwegFjZn9lr
         89b0dng7Ll88OzkYn5YnZ01TX0OMc/HeQ+MGuKUSS123cmLrcu95S98qbF48UDcrRP8w
         m8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344931; x=1750949731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9GucHfZPCayxh1y8Bqgadbm6OXspkCQUE4SSbOEVnA=;
        b=e4CO9TClV3a6kQ8/OgcK6kOljnY0HcZO1GDELBmV2pKwaLIGMGZoG5PTb1J0z2qOZs
         mjBaAuHzWt6ri54jT4LlCmUkyH6zutuRwW0c/5qIDR+LKbrrahWyZ4TdsCYFIM9UkyuJ
         xMauUVPiChDORvOzyKI+ItRKpUPizqU6t2QhXtdPDwBw18sZJhLN+ag3JncaZ153l1EC
         R2AI1RsS5BtEo2DkGzLuALo89jlwMScZqKhHaiflfTw3jG4SeIURrEquZ+bI+2iTCEv1
         gOdnMgg7gVaFeAot5YcEk0ka+tBnSuuaisn0suNoOWaz/c2RMS50BC0CV6NJJIEFr1iC
         vZvg==
X-Gm-Message-State: AOJu0YxQNzxvB1j8O7juQd0DMjV0Dy9GPtSlI80QaT26fHkvDJaEAF8d
	ida2VHsXiU536FtgvRF1tGmQABVoVpqFf9JFARkX3R+dxakkXxsVqEcnLDDEtqJx/A8=
X-Gm-Gg: ASbGncvKeFXW0tJFVQBeiAiQyapuNou9wqmBdsPm0MFw4MebmKy7siBa99aHaw3WDTg
	54eeI9jQLCMbYpWtd+A6Dz7orusdUV139sHubt+jGYWG4zGRX8KTW1KyY/AyQp5O964Qeppx/ym
	UVyJwofBqCvJGhzt4hMngKoLizwKxP9Up2QiDYT9OKx/PWWa3H1XgffcXzGzqVKqbnDh5J7Fup2
	i0hL/EEwo/bqhmkvkabrEd8ZhwK9YL3RNmFOFfsQ53RoNvD0x0Zl84C8iiVsgjaGqvi4dnE+Ht0
	trjJVD1bGXqdWlRisyMm2DFe4q3dauMCg0G5IUqWe73+/04d1GHuWKVM5U4SJkqtPj2QNtVpqho
	VdobQkeJEIAVmZYtmFUw54g==
X-Google-Smtp-Source: AGHT+IGGobIpKkCLpRzDl1QxoCvpwI+jTHKHBg4d9lnILMNs8XoDrDP97vfxlViyNKxyIg5xdhuMjw==
X-Received: by 2002:a05:600c:5025:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-4533cb5ddabmr223699075e9.31.1750344930711;
        Thu, 19 Jun 2025 07:55:30 -0700 (PDT)
Received: from toyger.tail248178.ts.net ([2a0e:c5c1:0:100:b058:b8f5:b561:423c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebced8asm31343715e9.40.2025.06.19.07.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:55:30 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Jun 2025 16:55:18 +0200
Subject: [PATCH 10/11] MAINTAINERS: add myself as smbx charger driver
 maintainer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-smb2-smb5-support-v1-10-ac5dec51b6e1@linaro.org>
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
In-Reply-To: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-hardening@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=iDLIU8cKqvcbXUMIYZ0LyAHF4U27oo4VJDAhYAedWfo=;
 b=owEBbQKS/ZANAwAKAQWDMSsZX2S2AcsmYgBoVCTSU5Fs57qbeZWVqSoR+0UKygRpv6l1Ryj9+
 AffIy9CL9KJAjMEAAEKAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCaFQk0gAKCRAFgzErGV9k
 tu2VD/0bwY7vbtIlaRWJOFEsK2l1vGsoZuolMH38cKaAlU+IG2W1Fyq7WlUOc2DUn81OGrnksUG
 yr9FjFGovg0DW/ycFt2vSbP6LA7yLbYPanceKT5Plpoj04RZjUbpHkwBACBHVFFo9N9Hy6S+gpd
 g4Srrq5bUjcAKOiSoJO/XIDkoxNV3rdRsJHgBwcoAlMfjoLbGM/soOrqLKhoz/JQqGJUxLsxVL+
 5xU/dSpdXppIkgbzQ6Bjifldq+0v1l7ScdXUTo2Buew2c8zf5nVBkeniJnZ3F6zWXwnaMfBfNBb
 Bq0SYmvymuQeXCYEKqfIUzC+Y0XbTK04cjjeTDwswET04SL2LwBOsmOX0EBIYhum1QjaF6QiGVm
 QJYn35ZyzKMTDoZCO/V6huqhrp8h6t9UGwVfk+YJlJp1NQgH+4sAXTaFqRQzuaUAMsN+wv3GJqV
 kpwMVH4S21qj41ZgWQrHd+QM7Xk4I61d5mXkZt6afscFVFax4lCIRnjUWcn9NbVlACvCJ6fVsLT
 Iwgamw41FbjE6dCtXHRuYKEcssWNZ0trX+cZZhkQyFi9pdyXHMmXQwMKIXDW6IjCsS3ry8F3Qvr
 61LmxgvrbQC5+ViIxKJcQzemtaZisZlI0/HzjEaCGTpCYdTVBmDtMGhV6RSh18t5bE0Dc3D2Ttx
 c1Wm6jRS/gyDmfg==
X-Developer-Key: i=casey.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

Missed when this originally went upstream, add myself to the MAINTAINERS
file for this driver.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2b570ed5f2f28341a3bcb7b699cbb250ffa2a88..a32e53d89c29cacf6e456258c4c7c0206cf8abf2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20565,8 +20565,15 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 F:	drivers/mtd/nand/raw/qcom_nandc.c
 
+QUALCOMM SMB2 CHARGER DRIVER
+M:	Casey Connolly <casey.connolly@linaro.org>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
+F:	drivers/power/supply/qcom_smbx_charger.c
+
 QUALCOMM QSEECOM DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.49.0


