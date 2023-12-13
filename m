Return-Path: <linux-arm-msm+bounces-4574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0313A811D43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 19:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72576B20AEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 18:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E3D5FEF5;
	Wed, 13 Dec 2023 18:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tqRKP0Ma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203D2D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 10:47:33 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bce78f145so8456281e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 10:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702493251; x=1703098051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oLN2dhkia1LQwK8gimJQPztmO5+yH/eFHely6bd0W6U=;
        b=tqRKP0Mauw7qtoq3BZxp0H8mtDNhWxs8X8mho6Wy7/XH3470ZAkRay6HHI5omvhKR6
         adY1GMCS7g+GUmADmn2ELCIQax4OFq3yjBMRA+b7IfH0mS4XMF4SJbLtfrhafn36hFgd
         njdndNDAZgflU0YdxeP0jDQl573MM4LI4VPZH4lSbZk2ePMkXHsyj8mIyafDv0TRIaWb
         37KhJbnsHQf8iaBg34fvDrXpmhGJ4hTF8vMGiUpTvH5RBF9QgkhRHLebDsIigj8qQTt+
         FmAhQI/R9ODUWc2RHRYr7oFmtSGaMcmfN8P8PAbGL0xOlqF3X5BNv11ukggtq/RO3zFY
         Cv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493251; x=1703098051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oLN2dhkia1LQwK8gimJQPztmO5+yH/eFHely6bd0W6U=;
        b=Zgc+e6JKHREeeNJnnx9lmU/QU80xa4N60BLNc+KUsmYuL6YcRUzR8JLMeGexNE/a+/
         bImGE7anpiZq4nTbLDQqCjyrm8BaswKbzgTtGQBtkEwai+wSCBRgIXT/hQO6J6rSnoQf
         nXAbRPmWXFopyuAM8W9AISAm7yxwenIjbPNGcSlvwHUtBnUkk0vwMmULZ0b1zHssxk29
         5d0qrpoAXRPsDxSP5MLB24658R5nJA4SBcbHdjOK4gfxAni+0gV6Eoj0uQe7VTOv9Nik
         t04jYXVnkS3UDWaQKNpe5EUCO4UaTRg0kLEHyxNBbYkApC6nmfkLLk72bqdOWVaNzPnA
         2SmA==
X-Gm-Message-State: AOJu0Yztk+u7uHXAfFGhEUbK9QX8tRzMC2c6PdnF8V9asn1LBTsz2c/7
	T7vZT6Dtiklmq+cEp27FqszQyQ==
X-Google-Smtp-Source: AGHT+IEaqMvOYhvY8FE/3LLDRyRP+xGD4h1A37XVeFl3tBKn9LZnhoj+UYXbCVzinqUDMG8CZp6KHA==
X-Received: by 2002:a05:6512:21cf:b0:50b:e29b:2f01 with SMTP id d15-20020a05651221cf00b0050be29b2f01mr1775813lft.264.1702493251329;
        Wed, 13 Dec 2023 10:47:31 -0800 (PST)
Received: from [172.30.204.126] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f12-20020a19ae0c000000b0050bdf00f688sm1653687lfc.299.2023.12.13.10.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 10:47:31 -0800 (PST)
Message-ID: <56280966-834f-4410-b055-a314583a64e5@linaro.org>
Date: Wed, 13 Dec 2023 19:47:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ARM: dts: qcom: sdx55: fix pdc '#interrupt-cells'
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20231213173131.29436-1-johan+linaro@kernel.org>
 <20231213173131.29436-2-johan+linaro@kernel.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231213173131.29436-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/13/23 18:31, Johan Hovold wrote:
> The Qualcomm PDC interrupt controller binding expects two cells in
> interrupt specifiers.
> 
> Fixes: 9d038b2e62de ("ARM: dts: qcom: Add SDX55 platform and MTP board support")
> Cc: stable@vger.kernel.org      # 5.12
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

