Return-Path: <linux-arm-msm+bounces-7128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C346082C2A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 16:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8B2D1C21D5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 15:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579996EB4F;
	Fri, 12 Jan 2024 15:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GCUb9eu4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC416EB42
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e67e90d4cso5088785e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 07:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705072650; x=1705677450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQNAWDXmxYQgA4LCYNmP7mT3vlvbfkNqLGD29l63sUA=;
        b=GCUb9eu4TaulOmoyhglouaCBEVoE057d9JYUGF8PwD4yNuxpkLpwo+NPfKMCZc80zZ
         4YzhDJl1Fx4EK47H7TRgqbGXrFmJdiCYYjruaKe7bH0bTwm0oIHBpdIvPBhhSEELueug
         J+ieGU65i5BytmVPgTc2GiE+HwZdDWv+3iDlz79w9ENsRY1RzUUHUwyLqqSSt08sjJZF
         GZ5+g/J3aoRlcvzeMnE6hRbjzna6fo9ZBEWNrbdKHdU7faVmXJxCL6KxRROg16rSwtJR
         uu4bFUNPHBzadKdgKBzylk1FrpGVPA4yBbCBC9rYiw44lbHTRf6NEWzEf/xzfZPh/eyR
         ZwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705072650; x=1705677450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQNAWDXmxYQgA4LCYNmP7mT3vlvbfkNqLGD29l63sUA=;
        b=n0/Lw4N5sXqvT/nLPth2+iHZw4LMUMkeONnYWqEsv0fx7KvQe5VMmMTw7kw2/vUmWn
         RlnO01SrCRHf7TElVnNIC5QAJxtJoAqF9luxpIdckR8i/tIi009hbBDUxY3CPRMNFEGQ
         ++pX4ERbzxc6kHsXCodicrztrvSsdZuqxV526u0ve2mQSlreT4SFK+a3mHj90mogLA9C
         Pijmdx/0n2mCFtf6puLjzhi1JSB2+v6lVnlCnyveI5zRfRb/0Sl0yEal8vxNT+7zEQg6
         GLGv3dXwECOi8ab5+jXadasyAb6h7cU0mndUzAvZ/68ExxmCJyWT5/usanDNHTtTxnBz
         bNEQ==
X-Gm-Message-State: AOJu0YxSCq7HHOg3lgOv9MeBceBzOvC8BRc2+Ds18Win2KU4IuAJGpIf
	LMHk0ohFVpG+HbmmIP2aqGB9DkKH203ySA==
X-Google-Smtp-Source: AGHT+IFSQRMTt3MRHiq8+omkYfNKh6C4s/p8ZGj089lXD4FOE2t74cG6vQoayvJt3ce81EKNlrpH0w==
X-Received: by 2002:adf:e64f:0:b0:336:ea02:ae93 with SMTP id b15-20020adfe64f000000b00336ea02ae93mr486332wrn.180.1705072650364;
        Fri, 12 Jan 2024 07:17:30 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id r1-20020adfce81000000b0033667867a66sm4147699wrn.101.2024.01.12.07.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 07:17:29 -0800 (PST)
Message-ID: <fecfd2d9-7302-4eb6-92d0-c2efbe824bf4@linaro.org>
Date: Fri, 12 Jan 2024 15:17:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] PCI: qcom: Add missing icc bandwidth vote for cpu
 to PCIe path
Content-Language: en-US
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, vireshk@kernel.org,
 quic_vbadigan@quicinc.com, quic_skananth@quicinc.com,
 quic_nitegupt@quicinc.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240112-opp_support-v6-0-77bbf7d0cc37@quicinc.com>
 <20240112-opp_support-v6-3-77bbf7d0cc37@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240112-opp_support-v6-3-77bbf7d0cc37@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2024 14:22, Krishna chaitanya chundru wrote:
> CPU-PCIe path consits for registers PCIe BAR space, config space.
> As there is less access on this path compared to pcie to mem path
> add minimum vote i.e GEN1x1 bandwidth always.
> 
> In suspend remove the cpu vote after register space access is done.
> 
> Fixes: c4860af88d0c ("PCI: qcom: Add basic interconnect support")

If this patch is a Fixes then don't you need the accompanying dts change 
as a parallel Fixes too ?

i.e. without the dts update - you won't have the nodes in the dts to 
consume => applying this code to the stable kernel absent the dts will 
result in no functional change and therefore no bugfix.

I'm not sure if you are asked to put a Fixes here but it seems to be it 
should either be dropped or require a parallel Fixes: tag for the dts 
and yaml changes.

What is the bug this change fixes in the backport ?

> cc: stable@vger.kernel.org
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>

---
bod

