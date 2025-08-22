Return-Path: <linux-arm-msm+bounces-70331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0A9B31406
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0168C1D228E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA452F3C3B;
	Fri, 22 Aug 2025 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I+eLrQV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3512D2ED17D
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855574; cv=none; b=LHYO3PIih2FKwDPRD6OCo59GqSKIcmJV8IGeZlUFbta4MfRYyPVr441NsKz49eRqYKcyuR35S6CK+Kjf4JkU6O/jvdncKWuD25bRw+I/Kv/AJMZnhVYy0NkhleqoQlWWu7wz8lSrV8AJaeV9xQufZVFUgn4fJLk5pIFFlW3OQbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855574; c=relaxed/simple;
	bh=/ijYBip4Gef+08P0Kp9cDhiylfO8cgPDqcobGaJy3Uo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s8+5fmrPqc7AgpM7og81+3aix56s1MY1WSvIOS5xk0KzK/Dua7E4zOCKOiSTlnRVO5iRa1C4AQWxpmZrtM6RjlgX1sp0J2HZDqQDt3XsOLgmu3BajnE3RG+e8KxjXoAaTNU3YIJSNieCvy2cHjY5s8wY/mtqoFSid+j7oLUzPdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I+eLrQV1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3c51f0158d8so1164749f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755855567; x=1756460367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qJ51d/LzxXtFMmJ/9ohPT/eBh8hSvxUNsu8PvJJDNs=;
        b=I+eLrQV1NcGu6bAqE3fJzZmJAq05p/6JepqSCDsEBNB4rJ2TjUdtWeqaBIgEJ32CMa
         mvCK+xseo4l9CnB89Y84lV+L9wij2WcHb1/ZlGlxw9huIIpTiXgji3GfTAiGhuP2ogmL
         XbNwMlp9BWlv7ypZpSxhr7/6C4wmrowz91/P9geaH6hP8Bkw9aZNsNglS6hHQ5PHqWlX
         0g8EwdSk/32LOhY21NK3r321jNk+/hik8WXBpp639mTbh1dKfi0TicuZUP4dfK+M3OU1
         5CiTCXYgThzQVe/OPkVktHOXAdP0oMa7Y/YbVBytNKJqIT4c3/7Gm+WIHxNokuamq78I
         KtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855567; x=1756460367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qJ51d/LzxXtFMmJ/9ohPT/eBh8hSvxUNsu8PvJJDNs=;
        b=GKpabLV0HhOq0Ce6molG9lNxX1TRYGUtgu+Lt9WNACct9QzKSjBEkyUEs3L2CBG4qP
         Pvpgxcs1WiEwVzBBOcP8mDdv97kHUJnmecfAuuNkPMmUw0jLIvFcs+qeR9cfJgOw23oT
         bYDRyLm1kWalzKmhIE1wtDUOJMReFLq3isAB659lekwoWsbIF/CG+5bc+ZCXxybRfEn7
         2XfxC6Uw6DfzdGF30sHMSPkYVOduZl3BA9WgPqDvY3OyBBKlPTLQ/IVFzKBZaVGfcNCJ
         HcQoLamxemTBI87EeFAyORBP/hHCP9cQEiuOO449lGV+h7QV6ZK+NhHkdgXDQaznzMta
         20oA==
X-Gm-Message-State: AOJu0Ywl8bS8WBMP6mFu01QIDVVY41dp3wAZn0rSGoorzdEC+klNwp/y
	vLcj3RVkgtheFu1fIu/LL5Peoz17huE9s+6SBWmFtZzIzN9DyvOVMfNZgmYWnNR9CH4=
X-Gm-Gg: ASbGncsW4gy1UqYCENlIlphbz/y2Fi4UuNH3RI3tppmR16dmNDJ0IPry2169T9gWRnZ
	hK5FXD2LhR010qfm6ZuwQLVotksaI05hq1d1n2tk7WP8HuEo75TPJ10Z2h67an1M2vID0zY4XGm
	msXs+br8KfmrtZTl7GRq62dtzkFuFh2z+jXgpLsjncO9y+gBftWh5VhtSN/yXH1wwwCtIE8V5Ua
	s8R4BX7cBgdM+cHm53Yr0K7j+lRNxZKgSwzpPr5g+A90wUPfz8CCd4jB0Y1dykFnuVLwvvx1uPz
	icVyo4eNAXCq2L0A0IxuM2osksDcjXzBEMY6CfnN9rzakyjO7SrEkuyZDQ92sFyD6uhYrl7+djp
	95q84qru4jQZuKw8Asf/qjbW3k1V1PwMYfWcrSW7x+i8=
X-Google-Smtp-Source: AGHT+IGLbeNgCPY3QzD01aDKsP++v1teSlpVKBAg69DzLUXtEAXS8+pA2PvrG1/xF48FV08k8DIZWA==
X-Received: by 2002:a05:6000:400c:b0:3c6:a970:1501 with SMTP id ffacd0b85a97d-3c6a9701cebmr110928f8f.5.1755855566927;
        Fri, 22 Aug 2025 02:39:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c684524163sm609890f8f.61.2025.08.22.02.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:39:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 11:39:20 +0200
Subject: [PATCH v2 08/16] arm64: dts: qcom: x1e001de-devkit: Set up 4-lane
 DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-x1e80100-4lanes-v2-8-4b21372b1901@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
In-Reply-To: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/ijYBip4Gef+08P0Kp9cDhiylfO8cgPDqcobGaJy3Uo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqDrE4Tmp8qOSpiuxCPDdZyYqOEkzZjfZkV2QUK2P
 vl8CfTCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKg6xAAKCRB33NvayMhJ0Y7dD/
 9HH65FmwV0TTwin7fXUg0Aa9FMKMuafXSeFqKDcbGa+AyNAmPKhcBvrdMJA5Ri2zHw9BuAgewAyWOx
 SsAT3tdmwOvMfZUYc26UZpAan8e2snbK7DryR+3xQ4+owPb9en/dOILZTsB9fp2ZOvklVmf/JCYZNa
 PQk+KaRxkCrpXJ0QNQTnAsiI9up3r0eyXwcplxSUjBwfjRTKSLxtaHoXhGW+i4yOVfCV6PgO5mkkLd
 aY/Nj206vW1mKQWFbc6bC0XlH9b1+jkdIvl1YoupTcAy613daGm6NgAsyqhZm2DRYuHpNuzNIXsE8f
 VbO+u33JwkeEWyW+G9sCfqy9DPeQnGEXtvmNDLppfGfxJ6VlUOWMq4fIERcHPfsfi66KYs0W76zaEg
 KwDtlSYG29BdoNKz4TZjjfc+oNZ4sUVRrdtz6fTxg1tQXy+cxSy+OKsZ9hQXpXBXK3YCXZVvfK8Z7N
 oxA/tTgwJ3Pn+IXBXZHM9NVWGCfW55J/wv8aiMPmNAnfgqasg7nYWCHUFn42P5xDbeiiBLsLXSVzqw
 QceHSp0LBftb89m5gYbW/k4GWB1wXpIJEnmcqbzckm6mkVaEUhTUvG0Rwc7FaHVUfkCv5htx3GSN9X
 iQ2lvsJCZJhpHUTexb53jN+aznF4DazTfWjlTBwZATgKeBC+fCuozLoPcDmg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 2d9627e6c7983daedba87619ba01074ee22b43c9..b055925da389146c4a141152bf0025624be53dda 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -983,7 +983,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -992,7 +992,7 @@ &mdss_dp1 {
 };
 
 &mdss_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -1001,7 +1001,7 @@ &mdss_dp2 {
 };
 
 &mdss_dp2_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 

-- 
2.34.1


