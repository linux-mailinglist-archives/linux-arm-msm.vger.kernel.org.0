Return-Path: <linux-arm-msm+bounces-13632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C38C1875852
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 21:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 148E9B27AFB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 20:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E50A13A888;
	Thu,  7 Mar 2024 20:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="isoJdhp/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED4B13A241
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 20:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709843202; cv=none; b=C/o15Zw8ug7QIrVLeK4UmYAIwhAPWNvDo5H6Fx75dK71El7vH7HdxEWkuV8aAZr/40I/AEa3pSeVsluq7oCQLb1AUpHePktSeHpATniSW9GFDc2VTIBtFpjVgqxlblOgVMGOtOb5a1rquD2pJ36vP3umbvhN7nbxuCXucxn197Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709843202; c=relaxed/simple;
	bh=R8dlxZ1dL3OvX88UWru4D0wpduTJJJAyqR4VxSwIyG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eK9T9s4RojlSJjsFucaPYUeSOX6jumEhjii/RO+Ay2E86tAauj/I1ooHJSFomyRI9rK+rLrQa96ksdiE7MGPBfmHElibGSkjDhrnQB+TqUOJEYetVc/WfoEnR8LphjMoLieNv968WsZKDQc/IQvyt+HenAasUY/+cEbLhE9AGpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=isoJdhp/; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51320ca689aso162675e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 12:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709843199; x=1710447999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCBc9I/4oSGOdNN/iaVU4s4pU6JlIs3DbcJQb4sXpL0=;
        b=isoJdhp/0Z2NeZOiugz+n+9TsmEL/ef8dZLOXHUk/grrJ/uyFI5wjrdG/kGOz4AVfu
         x0uYUbOzmdTqAm28EihSM5xUEGdU9JY/x1RZZriOgd2YQNJ0PDuVBea4+7HHRm5UudGS
         e5M8dp6hDJoMAjMaNafgb+vfxeHYNBCxa6ofrpkeUUPXJd2EvnzuwcaHLkquetd0+uCe
         arcTZCI7PyBYExAs+mJP+MF/O6SnFTCExVJZYrgnclCBed3eI8JLDUo9lP5JGT4F+zkH
         PCJ409NWq5nWSy3dbp/c8sACeGB0bewnwzrhHSTdC2ZNe48U1aOtUTMlUTw9x4jUr4Zp
         kSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709843199; x=1710447999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCBc9I/4oSGOdNN/iaVU4s4pU6JlIs3DbcJQb4sXpL0=;
        b=G9LAhR4o1WBjCra5JeGCjJ1MrL1bzKr4dfoGG3bmTRp8dCgfuVoqD3yZHCLNlG1TTy
         zb419jgyadbdN7M9zcM6aADCiXLzwcA2iaTmQAGu6WfKgOgdIebuHvNC2N8NyyBNSmdj
         ghcIoTvdOk0HNNkgrIznUfn1E3APTvHybvgIRT50Wr25FtzmVOWJedPUh5PLlw2nzISb
         sMWFGLzxDrQzuiMMpPE3eg2Dr6gmSfQlUVrOS/+DlkJqwtNtG/hlGvByNOrBt9c5Q9w7
         3ZRanpdtOd5aprMa96n1x06mpiaRH92IYBtQmStS4+c7VGVXHD3nFpWV2HnyKVh/g9xA
         MOHw==
X-Gm-Message-State: AOJu0YysgIj2QToDJZtKp6V/zHJgBnFole1cifNU613zX13kEiYyAEDk
	/zdEkG/aaMqHAwC9hh3BkZMMj4JCpPltYw7asOcKqWz3Ps8uTGT3HNhIsLIeG6o=
X-Google-Smtp-Source: AGHT+IF0QtTfnjNxc7RaucC2xKlJ8lzE42wr693p1q+ZVNMxs/Coym5IIOj+4d2YDPz/4k6JNRK4yg==
X-Received: by 2002:a05:6512:3b9f:b0:512:a4ce:abaa with SMTP id g31-20020a0565123b9f00b00512a4ceabaamr3014389lfv.48.1709843199561;
        Thu, 07 Mar 2024 12:26:39 -0800 (PST)
Received: from [127.0.1.1] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id dw20-20020a0565122c9400b005132bf9f8dcsm2957606lfb.303.2024.03.07.12.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 12:26:39 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 07 Mar 2024 21:25:57 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: sc8280xp: Describe TCSR download
 mode register
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-topic-8280_nodes-v1-4-4eba20e08902@linaro.org>
References: <20240307-topic-8280_nodes-v1-0-4eba20e08902@linaro.org>
In-Reply-To: <20240307-topic-8280_nodes-v1-0-4eba20e08902@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c

To allow for swift EDL reboots, describe the respective register under
the scm node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 44c8d543eb67..505cae44f828 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -300,6 +300,7 @@ firmware {
 		scm: scm {
 			compatible = "qcom,scm-sc8280xp", "qcom,scm";
 			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
+			qcom,dload-mode = <&tcsr 0x13000>;
 		};
 	};
 

-- 
2.40.1


