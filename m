Return-Path: <linux-arm-msm+bounces-78256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7681BFA289
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F8FD4032E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B412ECE9E;
	Wed, 22 Oct 2025 06:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="goBYNmik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFAF2EC0BB
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761113230; cv=none; b=RDmlD1WOHXzRA9EA1jwevWIucVX+C6tW9M2Wamcf+DLxbAKD2A0Ov5c24JHZqWwXo9Fdl4+PodEL+hE6zuj6iTosseZngn8r/EoBSUx+Uqpx1AyGOmLv02B7xzlXmImcoRjhU6CZXEmjnJPY3msL2s52LC3ONEV1TpN1zlVNrH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761113230; c=relaxed/simple;
	bh=mzm8zjzGXa3bcj2hI1nuVqjf+8xVLhv71Tv/OMlTJC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ozr3+x2Zky4P8af5D8DMeudaJk92/AG0SdFTWOqWNcBfdkID05bMXolyYlbxlfctxv8USV26+mUN69JRXsDnkjTObB9a9bsCWBlhGd4uApibJb+WWdAVDUiX2RCTERQQUHB+kwd1H4QmS2l9iXGXmIl8bCq+0zm1GVYodv2lsSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=goBYNmik; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso4859092f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761113226; x=1761718026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGUtKwd70bSCJqEqH6YRK5k2F3XmhHRzuE4jsE9R33M=;
        b=goBYNmikQGygkSpVuRz8dAbPiRYC9TRrEh6KpIqKiosrggp/7509WAj+m/jvF33bNL
         gDPuuo89pq3QiZrWIvUFi5tN9SW7JDiZ7IP2Bv2T7XZzdfuqk1+vdpnHYfxbBRMIvnnw
         itdjjURPMwYBzSk2yAQR+/pJ7mInVMlUg6xWpaKO/Vo3LXcc4vP9TPtA91xt2OpF+2tM
         2pyDEq2eUJZp83oEF47C2lLf2lLaRzNjONDwsj6hrdLxetd6WYCwaJcMAefe/taQP+y5
         KCbfgx6rCmeJwAxQjpjRdiRwGXsidrJLstjFxibrR1lUssZefDU1cMRkK+xAwOHeIyjI
         fy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113226; x=1761718026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGUtKwd70bSCJqEqH6YRK5k2F3XmhHRzuE4jsE9R33M=;
        b=TtUgSEUG7n6HAKCX6vmI1UA+/WUAPsrWLd5vMpX5cepultklhCux9ji+2yQga6/8sp
         CiGtMBiHy/aATa51mSgJsAxMu6Jiw0EH2+20HQ4zAqhOA1+6V98v/ZLf40NRJpq3kC7p
         J7hjM6W2g/ZMqdluw9jmjYt9Y3mKx1GG5fi3Bq8ArGaUsgteO0Nb5mf768OUfLtKp1nc
         BUrgIbbBJ4XLaaIEtWoWKgeN5fwx8ArtrrpvofxLTETk8TwghzdbXyzQYi5/WuIpC2cY
         utCvqpo0GCMbQxgsOqOMo6PTLUsxWnbVlYWepdtrJqi+rtgUi+u8i7vzHFxcaAZDNmUO
         GExA==
X-Forwarded-Encrypted: i=1; AJvYcCUFPss5iGuJWfiYHeNkqbFEbJSx/cFnm12MvWizcCh0yAvWGvo/0JnVfpgT5P/4AOqWDSpcpwZOYFv8SA76@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/i18ux4M/S3GqGhpPupozJQqPswXjSnwd0Fdi9wrNbisnMop
	AdbHE5DVI1ntb0O7RHHMSF2KCdjdCpCh1dTqWp17aJd3ZSVOwQ5XGFhC6zYQ17jm64o=
X-Gm-Gg: ASbGncuqSdTbYXDFmTn1CnYz7GtKOPQkqtUxK86ldSa2DkoTPr9HfpPZNHZWlHmCTfw
	SQ4CG43bjVXn3RQKBl6kZJfhQyMJR//Ubdk8d15UVHNrf0gs5zVjOpKnxzxx3OwBJJqrXhAsXaA
	7sqcm6MeIxP/8SSXL+rA6Q+TrFMi2iQ6etJmbCyI0a6zFIXnrvMrTx/Of9Y1EKRVGaL8RxJG6uM
	oqli4OnY3HHxYJpl64yML6tuWrSjDQ47jUM3e3QmiD8SLYoDDDjMbird9+cYqqnipyjtumkaTUX
	QNeZ1h09VtKPrrX1jpvhblR7hdzcjdtdHjkOwumZlKOteHkuxXDIU4bc+GZk3arfHVBi3mV/Jfs
	IzqTew9l+ElMDQhOC5iveaDHUBhF+KdsU0N/RVzzgAOAqiFAu9eohZPT111FA2pwtbnPe7RT+IB
	hAS3NnD/o0rK7Fcdpa
X-Google-Smtp-Source: AGHT+IFMMvPFqbCgXFrKUM10p7J2tPmq2z1/eAW/zj9g6TRaqGihpOwAHdCmyorfaFbNXlUU5ZMJLg==
X-Received: by 2002:a05:6000:400a:b0:3ee:3dce:f672 with SMTP id ffacd0b85a97d-42704d146c1mr11064085f8f.4.1761113225910;
        Tue, 21 Oct 2025 23:07:05 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a75bsm23794067f8f.23.2025.10.21.23.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:07:05 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 22 Oct 2025 07:06:41 +0100
Subject: [PATCH v3 1/3] arm64: dts: qcom: qcm2290: add APR and its services
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-rb1_hdmi_audio-v3-1-0d38f777a547@linaro.org>
References: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
In-Reply-To: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2

Add APR (asynchronous packet router) node and its associated services
required to enable audio on QRB2210 RB1 board.

Cc: Srinivas Kandagatla <srini@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 72 +++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 08141b41de2462ce91896fd84644413fa46ac047..7303aff33814f256a2ea09a71a640db466370eff 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -17,6 +17,8 @@
 #include <dt-bindings/interconnect/qcom,qcm2290.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2077,6 +2079,76 @@ glink-edge {
 				label = "lpass";
 				qcom,remote-pid = <2>;
 				mboxes = <&apcs_glb 8>;
+
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					service@3 {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+
+						q6afecc: clock-controller {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+					};
+
+					q6asm: service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1c1 0x0>;
+
+							dai@0 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+							};
+
+							dai@1 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+							};
+
+							dai@2 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+							};
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
 			};
 		};
 

-- 
2.47.3


