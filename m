Return-Path: <linux-arm-msm+bounces-648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6CC7EB80C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 21:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 310001C2082D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 20:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540402C1B6;
	Tue, 14 Nov 2023 20:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5012C197;
	Tue, 14 Nov 2023 20:59:33 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0103AFB;
	Tue, 14 Nov 2023 12:59:33 -0800 (PST)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5844bc378feso3444167eaf.0;
        Tue, 14 Nov 2023 12:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699995572; x=1700600372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrcyizvCo/KG3mPdKDm6DsKCToJb9p4EVunNF50SWBQ=;
        b=RnpW/24coH4OMT8UajTE6KsGlAHNKS4CefPObrVjh1ueO6zcOphPW4iM22PJJ19iJq
         Z/FSRYE/ERHZPX7MH3ORaLhy4C3zvSEPIQR13bqOyWr5EzNjjjLUSxolnsrJnkNaldZO
         P6ITFld/bDRuWfi1U7MqjN4t+nnWxNxyv/5IVN4DB412J1Ys4rx7PEUHORTi5rKMlsTb
         fIxj4i+wHF1hIpQNS6HW/7CGgNWQloZlnLaKjJc0HRS4xehe0CjC13tULyQFQs57hF7B
         CO2aMvCWC6heJoHJMZqyugFUq8SES4pt2hLFzd/ztdgnVgET5ujd6SvBDNUjNb4hN7Hx
         5x5w==
X-Gm-Message-State: AOJu0YxxauxCA2u0O732fNbE/zrvnF4UY4vVizzjNGhzTNbSad/QWBK6
	chvk2d5I5MnwPyqVrc3TIA==
X-Google-Smtp-Source: AGHT+IEels1WRec899esP8NHFJ5xegrQyq/vtE4CnTETG7fpYloXxez8M7OEBWem9xAHHkSub6HW/w==
X-Received: by 2002:a4a:d287:0:b0:581:ea96:f7f3 with SMTP id h7-20020a4ad287000000b00581ea96f7f3mr11385607oos.7.1699995572267;
        Tue, 14 Nov 2023 12:59:32 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 123-20020a4a0081000000b00584078d1e17sm400905ooh.45.2023.11.14.12.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 12:59:31 -0800 (PST)
Received: (nullmailer pid 501790 invoked by uid 1000);
	Tue, 14 Nov 2023 20:59:30 -0000
Date: Tue, 14 Nov 2023 14:59:30 -0600
From: Rob Herring <robh@kernel.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org, Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: Document sm8450 pcie phys as having 4
 clocks
Message-ID: <169999556983.501734.2621240369392640952.robh@kernel.org>
References: <20231103230339.966792-1-quic_eberman@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103230339.966792-1-quic_eberman@quicinc.com>


On Fri, 03 Nov 2023 16:03:38 -0700, Elliot Berman wrote:
> I noticed while running make dtbs_check that
> qcom,sm8450-qmp-gen3x1-pcie-phy and qcom,sm8450-qmp-gen4x2-pcie-phy have
> 4 clocks, not 5. There was also a typo for the 8450 bindings:
> s/gen3x2/gen4x2/.
> 
> Update the bindings to reflect the correct number of required clocks.
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 505fb2541678 ("dt-bindings: phy: migrate QMP PCIe PHY bindings to qcom,sc8280xp-qmp-pcie-phy.yaml")
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


