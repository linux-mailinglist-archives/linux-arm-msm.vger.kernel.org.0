Return-Path: <linux-arm-msm+bounces-8782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3343783FF6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 08:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEDCF1F23A5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 07:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F66B4F60E;
	Mon, 29 Jan 2024 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NTriMtlb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D9B5578B
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706514764; cv=none; b=N8UCEto29iD3au6bK5nVVWyfuVSnH6HLgsG4ZebaBYJmaFifnhTSG0FqzpqM+ExGUYk7/DyqD0EWQIiG0bQTyuwkOUbrlCGf/MdBB512qL7HeFkWTNXLvi/jPIpQFTl4LIvbQZNoT3CeMmen1xfvEvFQQL+LHBaZSp6ZRn4qXxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706514764; c=relaxed/simple;
	bh=RDS3ZoaA8gicslZTrtrM9BW7KEYbWoKjgQpkJyCx8uY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iR+wtY5V3pE5fn8cXcfXT+MGJkEqGK4B+GHYTUedD01kxCtgVnu0uhntKTdbuyPFNi3AzUV5QHo8bQddbQ5IGtn+ShYMzVLSaXVqMttQCQG+Y40GV7YNCzuCI67VHY8qkr6/ThCxw0hveYs2GhSOMbZCkpoG+utogUqINDXVkdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NTriMtlb; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ddc268ce2bso1262463b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 23:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706514762; x=1707119562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGZmbpiHB5LcToFKY964Ba6HaP984WWJZXhD/o2NB2w=;
        b=NTriMtlbgQ9gWGdhuTLfp7kOfewZ9dOhrShHIqE04fgyjiv0oLnuMashYpUGSoDKUS
         Os6JofK2JZN1yMKVBybAinCkyOZvmYo0sBIpMBdT9gN7Q9OzdCfTyOK98shb3pVpeqYs
         2Gchyak6cR0mk1LNpNk8vOXqDT2t/tbPaMMlRw5nkpSoFaVXeEes5vljQTsVU8Tr4Hr4
         Tiv49PpBDp3RfhZSOoJPlJ8mRisef9YRv3zW8KPq4uMtwkn8XiehEMhghOQd22gaXPI7
         /1tHuGBaR6oWD5MfV1luEVaScaMMj5tsz+0N0Xrs1nT+tTrq544HFl0xgiTUtbBgV5c6
         roxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706514762; x=1707119562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGZmbpiHB5LcToFKY964Ba6HaP984WWJZXhD/o2NB2w=;
        b=ndIjQ6zs+c0pabm1ZgAcj5Q6jSOAQOI8BvWgY41SQwJkWOaS37WxAcCmmaVwe6neGx
         LgO6oyUoL1omKObEhJSkBmWVPmKg2klILEd2cPtChx74p0qJUuZncfm/v6zTv7Eicuiz
         rp7wQNJWuzDaTkqAGFEpCkOwZLueMqPqM3TueUqfSrU2Pt+3BzK2zbiMyi2b6kWQcGQy
         HS9CB3rLWHChiAxNn5XAzVuQsxFJU2EZwN6GsjZ9+86ZwCGcXOTQbFUhUS6psto9Xctn
         gvRql0j9TyprjZwZy4ZYJtIiZNlC2zEuFX7Y6+BQynxNps2D3Xumu8xePf3RqFWhTg8x
         Hyvg==
X-Gm-Message-State: AOJu0Yw444Fzax0jSAQGRchFP/ZdPC9EVoZXWdS22NDsHafob4yb1dTJ
	PErL3WXHFff+vEern2wzKyzaCRrJI68qu5aXgZ8TIXbcn/3USqTB7RGtnZT4jQ==
X-Google-Smtp-Source: AGHT+IG7K/V3h+UiJFEyIIYzNIW2m4V7VPWv9oD65gGdio9qLk5mVc2U/DAxYQsCC9mZ0qepdxBZUQ==
X-Received: by 2002:a05:6a00:138f:b0:6dd:dbb2:8ee9 with SMTP id t15-20020a056a00138f00b006dddbb28ee9mr3441304pfg.6.1706514761954;
        Sun, 28 Jan 2024 23:52:41 -0800 (PST)
Received: from [127.0.1.1] ([117.193.214.109])
        by smtp.gmail.com with ESMTPSA id t19-20020a62d153000000b006dddd685bbesm5467329pfl.122.2024.01.28.23.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 23:52:41 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 29 Jan 2024 13:22:06 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: msm8996: Add missing UFS host
 controller reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-ufs-core-reset-fix-v1-3-7ac628aa735f@linaro.org>
References: <20240129-ufs-core-reset-fix-v1-0-7ac628aa735f@linaro.org>
In-Reply-To: <20240129-ufs-core-reset-fix-v1-0-7ac628aa735f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Andy Gross <andy.gross@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=RDS3ZoaA8gicslZTrtrM9BW7KEYbWoKjgQpkJyCx8uY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlt1kv3559B3ZmFp95EfvcA/qs983RKuPwQsFLJ
 LOoamFISWeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbdZLwAKCRBVnxHm/pHO
 9RiWB/9WYqXIx/kGqIVlP6rmJnnmWoZjyVR89BVi3fUMSh1HRZwHrR2Qbe0sfSxB4Kr5zeeQcrD
 3XfbKs+eu2nqNfxqSlUXVurUkB/bFQCGu4oQHvhiWxCYTA4/s3R7XM/7HmfClsFlY1UaYFUujXa
 AGEHJrzYPPK+XWMEuM4aQ2WEOYUikKu1BzU7755v2OPYwKeDcIH7WlHdDg6+/N4VNUZmjPq375P
 eFKciTWzxm3x2bSxck9/uOJ8dm3p0BmjFkgrZ4Cmg3J2tiV2zlZBfgXrI1BgPaKG9/wud2jkPUN
 gH73zWmaXnDESGrKZZOaYYP4+0kApTt1ReGO+UV60bG1TzO4
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

UFS host controller reset is required for the drivers to properly reset the
controller. Hence, add it.

Fixes: 57fc67ef0d35 ("arm64: dts: qcom: msm8996: Add ufs related nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 8d41ed261adf..a6592b3e2db7 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2114,6 +2114,8 @@ ufshc: ufshc@624000 {
 					<&bimc MASTER_AMPSS_M0 &cnoc SLAVE_UFS_CFG>;
 			interconnect-names = "ufs-ddr", "cpu-ufs";
 
+			resets = <&gcc GCC_UFS_BCR>;
+			reset-names = "rst";
 			lanes-per-direction = <1>;
 			#reset-cells = <1>;
 			status = "disabled";

-- 
2.25.1


