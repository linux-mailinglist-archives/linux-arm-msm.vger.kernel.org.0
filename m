Return-Path: <linux-arm-msm+bounces-8011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C499C839786
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 19:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9B2A1C234C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 18:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6531581AB1;
	Tue, 23 Jan 2024 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IhR/gBIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC16D81AAA
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 18:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706034046; cv=none; b=RvBxTJRT2dtSwtYR0Ar34D3qSJPZ6TfawD9TTA00CHVolUYQM4sR8mQmO1y0BpJ+lhvMLRnv8CkQN7v8LHpXcWsyNc+JZYmmMSg4QpdfO8w7QeR4XswIH29v/PasFqNMDCMOzZ3D5Gj7CRbHreMvSDAQAcRRdB5pT7PHV2bP810=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706034046; c=relaxed/simple;
	bh=USIEsJ/MK/XnJIFgdS/GdFEdoheNScUhLt3v98sSC10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTPWL/+y+KsKDc+FwlMmW1j9xd/Ui9VNW/RzXTtJz2QNHsbU89KJg4dNRNgDGCAbcrZmNNKiq57vzqId2p5n/F83CfMXyfTqxroNdU54goNK68FB+HMc6X0tOtUbpa/wk3OAD7Dm6o6en/HBfv8VTQWdGa/Bt1otnnUQX8mIh2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IhR/gBIh; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4670a58b118so925367137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 10:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706034043; x=1706638843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OB7jjC2EZYwUeHhQPxwFxVrh4egi4HfWvlhEcHneyE0=;
        b=IhR/gBIh3TjzC3+xOWdGu4KvCTYY3B8NvbIIbjmhanuAhLTNMTgRnLdbaciRb08hJr
         mSozoj/lDQaMqu1VQ7luQ5fH6uYLOD7hG+7pLi5FgRhUzVBrtni1DmrdQyPprDzqXJ20
         /Oyv+qTLVCb3mrE9oM+MXuddt4G6dqH+eRvVlYI3Xesq+yu7g3zRl89+pd7Ua+aQNmiR
         yn00c7K7QbJ2OqUs4gE1QC6VXCIslLD86FY02K+E6oSqPzc4QUnZKxjhjAn5uArUEas4
         0mSKuNx1+YPraQj1QxIFixISnHBT6nUsVGegQV/obUODnB5kYb1Xd7v/wV0V+2d6/MHt
         jPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706034043; x=1706638843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OB7jjC2EZYwUeHhQPxwFxVrh4egi4HfWvlhEcHneyE0=;
        b=c3DIYONe6LMB5ayjljwmSvhO6qaRXdHJ3lfQWeB64rqATeyTBMqy+nH5BnXcLDJewV
         vMbpilckifN8HDCyiXR+qqA5ZVgr4ZUmmiaC36L7Yi7XGU7F9B9M7QcU9zzeU01GiImD
         XlgIOxE72MsEYEAZw283hKPBCdyQrFeaTishvXLcL8WBXxQi13eQV8mUxHb9c0gCYSDC
         Z5hiuR40xWc8x+PjSs2V6ftND/x/Bx/l+aJsKQ6uSfs4Ej3yDgGPLnmTL6xEO9+nEybo
         8jaSvNAQ8YjddnYZxgAJ029LWMGZA3R+5rrAorsczz+BdOtrW0zMAgGALIMjSN5QT+b3
         O0AA==
X-Gm-Message-State: AOJu0YwnDBqdlcVXMwOY0V3uO1ocmFHG1w8nQ4COsMSA2FDx/DJu/wRI
	iY7QTJ9y7K1W16+TkGaCQSl3dCA5EqXpcWFMjZOdY52E+fcTJFIsxwIDvAMSOcA=
X-Google-Smtp-Source: AGHT+IFCVWWTCP0nN5IbtxjseLprIcS4GMBKsW24BjxmhjMZW0fOgS3rDMCu9S0nZMRuNl+zWKp4CQ==
X-Received: by 2002:a05:6102:30a1:b0:468:151d:13a4 with SMTP id y1-20020a05610230a100b00468151d13a4mr3187736vsd.27.1706034043696;
        Tue, 23 Jan 2024 10:20:43 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id 36-20020a9f22a7000000b007ce1febd008sm1658773uan.34.2024.01.23.10.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 10:20:43 -0800 (PST)
Message-ID: <3d029d7c-7efb-42bb-a16d-30cf965f410b@linaro.org>
Date: Tue, 23 Jan 2024 19:20:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] arm64: dts: qcom: x1e80100: Add PCIe nodes
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240123-x1e80100-dts-missing-nodes-v4-0-072dc2f5c153@linaro.org>
 <20240123-x1e80100-dts-missing-nodes-v4-7-072dc2f5c153@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-x1e80100-dts-missing-nodes-v4-7-072dc2f5c153@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 12:01, Abel Vesa wrote:
> Add nodes for PCIe 4 and 6 controllers and their PHYs for X1E80100 platform.
> 
> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Co-developed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

[...]

> +
> +			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi";

You may want to add ITS MSIs too

[...]

> +
> +			resets = <&gcc GCC_PCIE_6A_BCR>,
> +				<&gcc GCC_PCIE_6A_LINK_DOWN_BCR>;

The second entry is misaligned

Konrad

