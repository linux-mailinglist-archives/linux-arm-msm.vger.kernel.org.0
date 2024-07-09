Return-Path: <linux-arm-msm+bounces-25727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF3092C2F2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 19:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDC551C2252C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503FC17DE1A;
	Tue,  9 Jul 2024 17:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSUtqeMc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D374E17B02D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720547915; cv=none; b=A2SHrYgX8+rFNOUo1m6CDUpdIHNr9DTkiL0LQHXSmuvTSwCmVmcY4nW2NSbH5Vym54R4Qgt4WQO5xIw1FY4eCdPjvFfz1U8M9aGZkiwda4+RcWOXf8dRikEDBC/eJYnCVeKXFUVhgAmQU6dcg7HTg6qZFRTO0ZZtg4YuBFNTB1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720547915; c=relaxed/simple;
	bh=+/+EC2l+olOF7KyGXIXNGZzNzi+/+As1tcpMx62bp4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddbGkT5FDOYCFm3w35Q0od3ORJN5LE0WYXADEZQo8XejWh6ng9qE1hAhHiZaK0XvyWcdwOkxMsD5hxQtqFEKvG69+qwOJwzLBbZR2LtRPPTb0UEN4VC8CnSvVvNfa4B61+4Vb2UYfN15mdIeuXCw991LuLRL//b/uqv6En3FXnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hSUtqeMc; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fb72eb3143so43775ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 10:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720547912; x=1721152712; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=akLpSFPHdkCvX8sa/CAhBoiIqmBtSWHSGyWXF/WIX2o=;
        b=hSUtqeMcYpwX1GU75LrK8Vmb/HUmegrPhyzc5tspqVTl7IP/h2w2irN/igVSUdP3WQ
         0vFZc7dhhFUwNIRwGdR7dIWGrkifRDhk6OMLh86AzVd4wtD6kNny8JXf/DeTcRQFbofY
         laJfTZhpaJEA83Y6Nq8Cp9Ey5RspuLBEklPnGwEdrzsESm5mPv8M1o48r9Ntd90eKUwl
         L9GPOBHJ7qBSHusKh6LG3LjVpteSki/67WDZSUKr9T9/BMv32IXPiZv/oUfPsqz6NZ7U
         V2BiwxTKMsWOnUHh8QpjvOO4+FVzQEH5tQyOtlmZHYPddGgpTCUbuIe3Yv2NylVRtlD7
         cK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720547912; x=1721152712;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akLpSFPHdkCvX8sa/CAhBoiIqmBtSWHSGyWXF/WIX2o=;
        b=LC3IUdliuzxJ8cd9H41Hdie5uZcgX+seBociW3DVWMLFjzm2nHeoJpITuvxAzGGaC+
         OZL1C34fwGUOR+6RHFj/aE/NHKtDyp1nsKbbX9yM3Mo7RFV5GOi4hLf3LNBLnjnBPKn+
         pQ0E4nubmWSmpxlu3yO+uBwFJm5cjzXJNBFZloOity6H8fCxsTuM5owyTTQHCpkumK0g
         Mj2eEt1oLXjKKZceqadMwTLRbj3d7Jvi2YzOhmr2GwUHAXzFqn+pYLd5R0hanmqMjdrx
         8K1IvIHMwG+y4bBH4zEA0/E37j9A+wEaXzWXAKGOe2dnF7Zb3TV15GFG7mU96ZtFLr6+
         9Dug==
X-Forwarded-Encrypted: i=1; AJvYcCX0qB0QkpEIugMcSG0Su4XieWj3Fxzaj8eUOQjpaR3tg1aMHpWvDWet5aJmzkQyynxnHnyIW82mP3/XBAAerydO/AP5dwdswXwRZ53m/g==
X-Gm-Message-State: AOJu0YxV/LGjp6StQZ6e2siTqb0n/EL/PYwBLuUfgKFv9XPb0rkaBQ8t
	OE7nCOy+llg2v2MNnxJ4Bukt5ALtF4uTuY6iA0G2NP0hA+OslcnyaRPRVdnQvw==
X-Google-Smtp-Source: AGHT+IFVh2IfVOJVgTJ8rxZyJ6qhLDArqH/TiLZO7RAzJ4aVX61SuWXJwMdf52YpYAsJ0SEWy7Yk/g==
X-Received: by 2002:a17:902:fc4e:b0:1fb:58e3:717d with SMTP id d9443c01a7336-1fbb7fc8302mr48538235ad.12.1720547912078;
        Tue, 09 Jul 2024 10:58:32 -0700 (PDT)
Received: from thinkpad ([117.193.213.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ab7debsm19019685ad.166.2024.07.09.10.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:58:31 -0700 (PDT)
Date: Tue, 9 Jul 2024 23:28:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] PCI: qcom: Add QCS9100 PCIe compatible
Message-ID: <20240709175823.GB44420@thinkpad>
References: <20240709-add_qcs9100_pcie_compatible-v2-0-04f1e85c8a48@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240709-add_qcs9100_pcie_compatible-v2-0-04f1e85c8a48@quicinc.com>

On Tue, Jul 09, 2024 at 10:59:28PM +0800, Tengfei Fan wrote:
> Introduce support for the QCS9100 SoC device tree (DTSI) and the
> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> While the QCS9100 platform is still in the early design stage, the
> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> mounts the QCS9100 SoC instead of the SA8775p SoC.
> 
> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
> all the compatible strings will be updated from "SA8775p" to "QCS9100".
> The QCS9100 device tree patches will be pushed after all the device tree
> bindings and device driver patches are reviewed.
> 

Are you going to remove SA8775p compatible from all drivers as well?

- Mani

> The final dtsi will like:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
> 
> The detailed cover letter reference:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
> Changes in v2:
>   - Split huge patch series into different patch series according to
>     subsytems
>   - Update patch commit message
> 
> prevous disscussion here:
> [1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> 
> ---
> Tengfei Fan (2):
>       dt-bindings: PCI: Document compatible for QCS9100
>       PCI: qcom: Add support for QCS9100 SoC
> 
>  Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml | 5 ++++-
>  drivers/pci/controller/dwc/pcie-qcom.c                       | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240709-add_qcs9100_pcie_compatible-ceec013a335d
> 
> Best regards,
> -- 
> Tengfei Fan <quic_tengfan@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

