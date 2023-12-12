Return-Path: <linux-arm-msm+bounces-4373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC580E7F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 10:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5E0D28159C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 09:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE83858AA6;
	Tue, 12 Dec 2023 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sXlhNgXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27DAD9
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 01:42:35 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a1e2f34467aso508515366b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 01:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702374154; x=1702978954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ab1u+8M+Dm9uo1aZ0FRCSc/hdRD8QsyXXMToKdHn3YM=;
        b=sXlhNgXoixdSf7bmuoCfidYEGBfDbhddNEIgG6d9J+0eu+C2m0wOvPbJNutDjFLqk6
         L5hHrsaSItsCKoP9qN6qSXxsYpzwPOLpCzXYfO/MFBnmAWgOYoWV5V86wmvyOce0aNIC
         C1cj4TVVyHEGOp1Z2Wf8yfmc63Cll6C5SmiSGxn7QAP0zoitZeKSoG5juXVCXojvEe23
         ktSMr9alBCDsGJPCH54GpSWs3DpkW9pS0hBnbfWBeU9zjCzPaSshe7INCTsG3/HY6Eef
         wiIR8XJoVLjTvuJK6IsDULF5f0/+3d1NJK8VemiqIhTkpUHPp037HE03iMmj6vmGiw7Q
         uc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702374154; x=1702978954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ab1u+8M+Dm9uo1aZ0FRCSc/hdRD8QsyXXMToKdHn3YM=;
        b=idf+4M3H4yqWhK7Uf6kGBV+dOTzOXbZruVpxy+gdOPGAEh5pjo9eolMFy+s4RJ8VK0
         EhOPUIvBtY3acuedetgQC7T7MbT2lIRT4zXG3ZH8OxeUG5vt0EgD9QP1dRyYN+TSVgb2
         5XLgP+PxOm84Z9xFwfyphm3x3qH3AHreD5/t4/SuyhYLQicj3gSgWt+5PWpMc5GVozh0
         01Amvv227fvAH9Ny3eJX03BHLVxW8Qiv/LO/bH1ABfwH/EhuLzyGAll9x6gpYoo42TyS
         fwXnREpjoLfrP5G8ECZbq1Vnzcb7Pd6solNUBTYdvCbsziz2QBKbKvK11EowT6S1Ui6c
         tqlA==
X-Gm-Message-State: AOJu0YxzhrgWi+xAXd2S1VjgkReU6ioTDKsSD05HHJ/TqEzvxKsMkX9J
	YkJExHDI7mop0mUdxQOhlnzye4+dQqzwNLxxjxc=
X-Google-Smtp-Source: AGHT+IGjSOz4SSTqu+GJBYnhLwGCVarT1qCJVfjUEnwNzA+f3tfpoT0jrkRQZSZGaQUqCStgg5FLNQ==
X-Received: by 2002:a17:906:7392:b0:a00:773c:3f09 with SMTP id f18-20020a170906739200b00a00773c3f09mr3444594ejl.17.1702374154403;
        Tue, 12 Dec 2023 01:42:34 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id vc12-20020a170907d08c00b00a1d4a920dffsm5933659ejc.88.2023.12.12.01.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 01:42:34 -0800 (PST)
Date: Tue, 12 Dec 2023 11:42:32 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Add SMB2360 pmic dtsi
Message-ID: <ZXgrCHNkz20Weqjq@linaro.org>
References: <20231212-x1e80100-dts-smb2360-v1-1-c28bb4d7105e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212-x1e80100-dts-smb2360-v1-1-c28bb4d7105e@linaro.org>

On 23-12-12 11:39:52, Abel Vesa wrote:
> Add nodes for SMB2360 in separate dtsi file.
> Also add the eUSB2 repeater nodes.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

On a second thought, please ignore this one.

This depends on the SPMI multi master work.

Will send proper version later on.

>  arch/arm64/boot/dts/qcom/smb2360.dtsi | 51 +++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/smb2360.dtsi b/arch/arm64/boot/dts/qcom/smb2360.dtsi
> new file mode 100644
> index 000000000000..782746a20403
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/smb2360.dtsi
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +};
> +
> +&spmi1_bus {
> +	smb2360h: pmic@7 {
> +		compatible = "qcom,sm2360", "qcom,spmi-pmic";
> +		reg = <0x7 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		smb2360_1_eusb2_repeater: phy@fd00 {
> +			compatible = "qcom,smb2360-eusb2-repeater";
> +			reg = <0xfd00>;
> +			#phy-cells = <0>;
> +		};
> +	};
> +
> +	smb2360k: pmic@a {
> +		compatible = "qcom,sm2360", "qcom,spmi-pmic";
> +		reg = <0xa SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		smb2360_2_eusb2_repeater: phy@fd00 {
> +			compatible = "qcom,smb2360-eusb2-repeater";
> +			reg = <0xfd00>;
> +			#phy-cells = <0>;
> +		};
> +	};
> +
> +	smb2360l: pmic@b {
> +		compatible = "qcom,sm2360", "qcom,spmi-pmic";
> +		reg = <0xb SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		smb2360_3_eusb2_repeater: phy@fd00 {
> +			compatible = "qcom,smb2360-eusb2-repeater";
> +			reg = <0xfd00>;
> +			#phy-cells = <0>;
> +		};
> +	};
> +};
> 
> ---
> base-commit: bbd220ce4e29ed55ab079007cff0b550895258eb
> change-id: 20231201-x1e80100-dts-smb2360-0c7c25f2e0a7
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

