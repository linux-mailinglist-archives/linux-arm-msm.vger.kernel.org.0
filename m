Return-Path: <linux-arm-msm+bounces-47454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E79D3A2F464
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 17:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C0DE7A1147
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 16:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA72256C88;
	Mon, 10 Feb 2025 16:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eabQkDZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675AB256C8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206691; cv=none; b=ZdztIFkJ/0AutpUnfUeRI5fntQ2Fkyyk2Hj1r1CXdY2a54U9oVxJGDG8PxdaQvrhL1ptvyExCXHfwWUT1v99lso/ib5L6QEPps6zjkvAkGrqlxJRzlmFJCqaRRPLL3ebr+pgHLUXe9CpCcvQHK5tXeqlX6W0hYU7J6JZx9riLC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206691; c=relaxed/simple;
	bh=xDIm/RSePeqjNNKN693t7yZjDUS4PKwecZGP9knv6V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPPDA+OdjP+cR6OzIMsj9WwwVYv4Zb76TYS/QsiSA9uNio0Amfx4KJqwn4ZEwqy7eR3z/N1ouKi8cb1lxCoa5e5igslypReiDxQRdWx2pNqM6wY9ru1wmUaBWeE0iV7FD0una6LrAOR6CP2/Bgf3lH3MmQhSFF8lxOdfPA0NJNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eabQkDZL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f818a980cso26436575ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 08:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739206689; x=1739811489; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HXK570SN0hPAje/qFbZ+ZB29I/53fXVG5T36GPnTKYo=;
        b=eabQkDZLJfyvGb+qqDzjR5XknBo09Kxii5C2nJnJi0Zmdsux5A+9ivZMlMZnFkhX6f
         xnFBxSUKf5swEewHz3NOQJUSWDZsE3w6XpEuUIfnL4eseVs3TxFVqG+/Jnx3b3BK1lhC
         CunOZfQZUzrUQ1Wpcuyd80j7KNsjE5WARHP5o6ams3uJfDxclfqcfD/nB4XMHNsllQWo
         lQ7UIslpNRNyAxEj+Ju3XlDkBIF+d2JvIwoDqm7ddDswQywe73/rbDO29Wn8AUjoDH/q
         DLYfmn+nRM5Jw15+FIvCuj4mn+sdO50futhCUJOCkWJk8GRLnOMLoguoS9T2dQAobCzN
         dmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739206689; x=1739811489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HXK570SN0hPAje/qFbZ+ZB29I/53fXVG5T36GPnTKYo=;
        b=X6DzYGe1YexwrA578Fmr7D0MGTnB4xsE+nnoRooJ54g/hVn6DWeZJlDLhuzblmpXyN
         9KhTqeD36IGA7AqwM9oj+3MbNLhb6qad6wcR+o36OLkGhSHYpl8LfCPKYlKc4gnYM7xl
         qnMXJfgMkih6wE4lqerkF30lIDcJJeCt0cDXo3w/NNPC0oJBilvD647e9cDcSiGcuOst
         dXuK/Io4Xa2PCptY7X2nmvcUHXc68HjBGo4EhH942mGU30A4DKna7tC3XkRzoLyn+KOj
         BF1/iUaGpdpdeZ6XS7AoZ3jZH54gGYOxN08xO0KiivJyRuuc3qRyjJbfxOwW0cssuS8j
         gSZw==
X-Forwarded-Encrypted: i=1; AJvYcCVIEJQpbihzk1p33f77XUBFa8YR8GD8VASbdd/fHiVCpD2kgX9ZOznLKInjip0EV26rNkWTkZZNYOIs469l@vger.kernel.org
X-Gm-Message-State: AOJu0YyRCPi4nUEStPau1CYRpWdIky1DsxyY5eWPIwDoeeCFK1LLtlQS
	VkWhygjv0i9drZN2XUQa4km6pmVOi2mtBgyWSksbv2CtVHV68WQcm9B+CDtV9w==
X-Gm-Gg: ASbGncvCTAlQ2EmvKrHeHKVzKqF0DaPtXNEA21GXPuSTw6XbqB5taiOxkfX4+gp9Mw3
	ShOkGMlCHm2U6tWO+4HScYiLGShIU1gGpkjjgI3OLRyKUg2Qjnzzbg8xXAuL0BeMxjMkStEHhDs
	K8rJctJeQbIhyzynA/3YEKu6YHnDwPGqPRFrSukYmWbzj2wPZb7d6fVDxNEx7QeGeClnGO6fWns
	zShK3imi71BDBK6hx9ZSKe9qFLyU/hOF9WZSwkDt6oh75943bGPwF5yWTsf/EQUVc9GfXD1sLjj
	OM82I2Lz0ne0m8R2NXm0OCI0IgeL
X-Google-Smtp-Source: AGHT+IFXG/X92qZwFcXPEHDQKQJuXIqlaQptvHF4J7uFXPKvpdVbnwkYnUW89gE+sgY0hfXiSW0EGg==
X-Received: by 2002:a17:902:fc85:b0:21e:fe8e:b571 with SMTP id d9443c01a7336-21f4e760a43mr223092645ad.36.1739206688645;
        Mon, 10 Feb 2025 08:58:08 -0800 (PST)
Received: from thinkpad ([220.158.156.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d55esm80562995ad.152.2025.02.10.08.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:58:08 -0800 (PST)
Date: Mon, 10 Feb 2025 22:28:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add 'global' IRQ for PCIe
 controllers
Message-ID: <20250210165802.tbvzx4qjygzdsk2f@thinkpad>
References: <20250209153940.3489-1-manivannan.sadhasivam@linaro.org>
 <173920411963.477096.6458317590653327676.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173920411963.477096.6458317590653327676.robh@kernel.org>

On Mon, Feb 10, 2025 at 10:22:43AM -0600, Rob Herring (Arm) wrote:
> 
> On Sun, 09 Feb 2025 21:09:40 +0530, Manivannan Sadhasivam wrote:
> > 'global' IRQ is used to receive vendor specific events from the PCIe
> > controller.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 

Ah. I didn't run dtbs check. Please ignore this one, I'll post along with
bindings change.

- Mani

> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250209153940.3489-1-manivannan.sadhasivam@linaro.org:
> 
> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c00000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c10000: interrupts: [[0, 519, 4], [0, 140, 4], [0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 518, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c10000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c00000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c10000: interrupts: [[0, 519, 4], [0, 140, 4], [0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 518, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c10000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c00000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c10000: interrupts: [[0, 519, 4], [0, 140, 4], [0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 518, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c10000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c00000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c10000: interrupts: [[0, 519, 4], [0, 140, 4], [0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 518, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c10000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
> 
> 
> 
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

