Return-Path: <linux-arm-msm+bounces-41435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3FD9EC758
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65422188C414
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF18A1DB956;
	Wed, 11 Dec 2024 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZjBz81q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984761EC4DA
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905812; cv=none; b=A50FWmbLRuPIDH0ls4+QFwdbnd3vCE745tVZDk8xfiWDBIdYS0d9TWkl7jfWo/sgC9zzCR2uZb28Q/X22RPSCIgW/4XNdvc9Qnp2NkEVEA26MYaLpELdu2zBJKoV32h9S9GAg8NInBuS81R10zEghUkRWf51yLGCfA3k9Bm839A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905812; c=relaxed/simple;
	bh=mRmcybJomrA8DtYq9fiyqS6rR7q297sl5lRf/i/VlGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2P83dUDXPH97oprmSGzvAkDL3PfDL6QATiaIXFUtlXNN9HpTmkInfI+fecw8gGhKNm1wH5PCOirfgcEIDpoRUiJdEdkOeL7hvOJcpi1kHZKIG74SwQiG8bYxKUwykBVVebXAEkVdbrNC3OiDxPcfsXdKwXkP3CTC72fwP3gW+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZjBz81q; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e06af753so2824413f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733905808; x=1734510608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4/tn0+NaXoZvCxd7DO6dwQt1/7UILyIFVNQSPfY62g=;
        b=KZjBz81qSRGscxaLNsENWG7Ltli9uAOo6mf7ux/64spu0JZKi36HixORf06kqPtakp
         KUWStfMZMCeSlNrj2/1HxGgkXPs6Twcz2UWEMwW16kJJ78n7Qdpvnoeb3qvT/JtHehJ7
         QspBoW3MBM3Mr+6l1e8A6HA0nOGHU1Aa9SSBakPXYotPTDoB3b7cb3ocbSEKpOTflT4A
         5TnhpsInBaI60sS7QHo3CrtzLfg+lnVLrm6tKgr31ZaJEgUmjoI4Uu0BOdDzRyCJIPHE
         jt9LrB0mVQRq5aEpf0DscPZ59X66YzxZWEhspZb3bm5Mh1iQ33eACOhu7ELT/bezSHGO
         HoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905808; x=1734510608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4/tn0+NaXoZvCxd7DO6dwQt1/7UILyIFVNQSPfY62g=;
        b=N7FJ49w29ykaxw2o1FhAizLhwsezauRWaDHsCC6uxEyY57Bl1x3LdydO1dA6nJohuy
         VAyMkm3cz31ql0K4+62b6RpQxEBmFWWuZc42Q6EqeS7lUNSHZbtmkRX2jyy4sDksdvKK
         vJ9PpNd8uUUh2IkHHf11MnwNRJXKML2lP44iy7mvYZMaDeJFXEhLTnp8zOTvK+tIIoJK
         YQOEX4xP6SGhl/+mvaCTdt0wOW5G7M18uCceIDbQq2nbUfRL+azsXDtchhnMgWSTPW0t
         irUIH1gLPs9KOoW3z6riN0t46DT3KvaLTubiSEtLuvdvCGm27HiAPYWbfd2+nb+DprYM
         PW7g==
X-Gm-Message-State: AOJu0YxrKcAR/YVktmMlfKNCvaLCZYy5axCnfzEE/gSYdXqh2grsLe5+
	zQ7phAq4GpCFHwqRrua4cP0a9L9XDOwxNNdHuywQRlWPK6aauA/CY//mpgxwiZU=
X-Gm-Gg: ASbGnctF+aciGzyk/sL6IdqVhdnRMc8XDmITIJWcd2SAKq+MwyY4jWB8m0kBCT/fmO3
	Q50uLhcdUwE2lCZdqDfsUzyF8h+H7GvRJR54vFhcJX5/x7txOXrxq2UURjx/EFua5ZtAMeH5L3X
	1hj0WLjQfSC0pvUDQVHJzPBZfgXNxsXJNS7sc50glCX05VJVT1Iy6dStVUSCSmbqvbOa6ZrZbop
	6P1rxOA+7dMUOKseu3avhbVxkOSwCkdP2lsBTB3P+rGAi4TmZKxcRtF++STKc1sQpYICsGEMoI=
X-Google-Smtp-Source: AGHT+IFH/NzXNJbgRyEoKdsrxfAQKdSlTl8if4/S8TBRBKiFSopNd9WK8zDKR4VFHgwJ90urpCjVjA==
X-Received: by 2002:a05:6000:1a8b:b0:382:30a5:c38e with SMTP id ffacd0b85a97d-3864cea3ea9mr1488908f8f.31.1733905807963;
        Wed, 11 Dec 2024 00:30:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a3e38sm735687f8f.23.2024.12.11.00.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:30:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:29:57 +0100
Subject: [PATCH v5 7/7] arm64: qcom: dts: sm8650: add interconnect and
 opp-peak-kBps for GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-sm8x50-gpu-bw-vote-v5-7-6112f9f785ec@linaro.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2681;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mRmcybJomrA8DtYq9fiyqS6rR7q297sl5lRf/i/VlGk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWU2FIURdxNJLLaES0fnJrqYO+HzNf4JEpRojHmTZ
 gBojavyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lNhQAKCRB33NvayMhJ0ZWEEA
 CaXmuD++16A4jWWDPTEnOk6gHg/IoOGcwhhh5hSIk7V1mQdjU/g5+hVTcDxpB7epXvCSHEei5zO7l8
 j151YYqlSesFX58NbskoPn4b5RnO5oTgQojQ+s1fSk+4sy5ma7p7eavT3ScwnkZmmePM9CZcFYixFv
 maLVtAqSC9HX1UbotSMFXkl49O4YNS3NmD691m3yaqz584LXPApnDnsL7vk9cYucv+wb+cRt32i8aV
 zkDut4H7bGNPxieMKeSPddgeGrPI2lbeOyF1KEMo9HXRqqNH7W9bryUOcKOyNnU1fIjvWX+WEJ2Pa3
 GMjrFD66Z6NYSthpEO6yhvWhBliW9g26Md2JO8QwIG2V4hEKS/afML23yoQM8MezF3johQgLBQ4WFP
 JuVUVb70eptjRYCC4NMk4Hpe1+sI00FhEtRTv8sLCcS9bqfw5R1fuO/edkzlhIqckvoZEviiJBReJ5
 z+OEs9GqX1Gk4p20epT7VQJuL74ywqCBm18WqgMuUnuVR8Zvwbhjc+0mHJR8RJZ8AtUuK7TzPDkzcu
 PFt1AFR4vtuZW3ap+J76jHpTBf0Ufg8jEP9US4gjrRMNKm/lxk++tJzD/d2pkZnpGFLu8RdGGzjxdV
 3Sm0R2CkIrPFb2c0Z8e1L++R/uV3E1BDLcUL54gh3YTqROKG3BiLEK+2ijSw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Each GPU OPP requires a specific peak DDR bandwidth, let's add
those to each OPP and also the related interconnect path.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 25e47505adcb790d09f1d2726386438487255824..c76c0038c35ab048c88be9870b14c3a0b24b4183 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2636,6 +2636,10 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
 			status = "disabled";
 
 			zap-shader {
@@ -2649,56 +2653,67 @@ gpu_opp_table: opp-table {
 				opp-231000000 {
 					opp-hz = /bits/ 64 <231000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <2136718>;
 				};
 
 				opp-310000000 {
 					opp-hz = /bits/ 64 <310000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <2136718>;
 				};
 
 				opp-366000000 {
 					opp-hz = /bits/ 64 <366000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-422000000 {
 					opp-hz = /bits/ 64 <422000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-500000000 {
 					opp-hz = /bits/ 64 <500000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-578000000 {
 					opp-hz = /bits/ 64 <578000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-629000000 {
 					opp-hz = /bits/ 64 <629000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <10687500>;
 				};
 
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-770000000 {
 					opp-hz = /bits/ 64 <770000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-834000000 {
 					opp-hz = /bits/ 64 <834000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <14398437>;
 				};
 			};
 		};

-- 
2.34.1


