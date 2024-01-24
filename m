Return-Path: <linux-arm-msm+bounces-8135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA1083AAD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 14:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 820C1B22399
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 13:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5F5199D9;
	Wed, 24 Jan 2024 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uD0zyZ3W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1F11A28C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706102584; cv=none; b=ZyOSI6n4cllJi6UsU9Q0oWAiT3NLOCVBdV+DBFvDbmbLjm74tDfsgQZ5ACCSTok8ejbLSnlFBVBtHuAO+bv9wvDyZHnjspoPYflMH6bPTpydQU/899M+AA95fmgj9AFOsW5E/qUBsbslb2Dot2w5l5I2Pmh/S+zqbiKuREz3axM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706102584; c=relaxed/simple;
	bh=T4RmIf7VkFcj8d4ZpyZYR6aCfDUYT5c7VXzocciPTWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmIdcJUs99iTr5Zm9XvXeUlF8gIm5L/Q+qWlkqjEWKxFhynO1xDtNuGr8od92DhXnJ3yIBqhkc/80J0l3X56rOXGatEa+hBsMWTxHSbfgR+gBUqJutyE5XFk+nDBGxj9qzhWDUMOM1AouLDGLzfjbSwpHaBUODPasS/MglNHrEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uD0zyZ3W; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50eac018059so7609967e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 05:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706102579; x=1706707379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=11kgJruv5+K6DtBwAzB0hg6cqT5dVQUnLRiLI1MHmYk=;
        b=uD0zyZ3W418Hxi0Js3RwCmxwiRCtoGnjxb0h0/tQysBALQdB2/OWkRmEsDP2gBSNw4
         kaN/W34x9citNgxI9wqsLmvQnVKUdluigoZhVN5uRf/mGO8kIZirN2s/O7F1FwA5TJq4
         VnVUhdyFE8T8bDyd2Gi9kYOIAgkTSXyUvEZOb9LyDwLd2vPZhgaapsEW5rnzneRnX8bK
         CR2zMjEhL5ypjwWUc6q5b3G3G3reCCEDS+uqQSUq7CSdV9G5i9XFvL2DCRA7uXwET6tF
         mAMvnDM9BcVqjVjU8lIjya4EZQKKgAerx3BnqsjHpzJOcqLIIRKQpJlZtSAkClixNDm8
         3gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706102579; x=1706707379;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11kgJruv5+K6DtBwAzB0hg6cqT5dVQUnLRiLI1MHmYk=;
        b=s4NRZld9bVWKyicatMQN2tUsIrDC5IW/S293EE9UP76ASMdhzMBSns1PAJddUvEr3L
         OdZXEkmh1UbGesY3vLWrvIOR3I0yfRqViSVDeNLir7UOrPtWSdCJFIkzfC/ib7QjChNf
         efUn124UE89DaBVbMjVf4tyZORXV/YvRp8CQlrnVnL+/zc//TDcJnv9UhyybW/WvDOOd
         qy/Idj7e1fdtYWa7JDh4zNv0ozxM5avFYjdvHVUFEBOMSBAql4DyAx52/dw8xSpCt+AH
         hCPfing3mVbeLtAhf6gQLzkHY+0x+GBPvYyTxXpLVMQhc+o/bEw+RvonpTg6e22cDZpQ
         wm4g==
X-Gm-Message-State: AOJu0Yz1elIOCWm7zaaMN+rAfOPuKS2cMasqWkQh0JUGwMFpPc3EFNAO
	9s2yucZTYgpHdAk2XP5ynA1ZEEV7LO1eBgED14xIZcidPwno3t05Ul3SWvSa638=
X-Google-Smtp-Source: AGHT+IGCJx8XZDV9wXehwa6+blBx6gU7Yw+6Pl2WRXQb/rId7vUfO2+yja1A4V5G91EOYOUuQjTl2g==
X-Received: by 2002:a19:4305:0:b0:50e:6909:7f68 with SMTP id q5-20020a194305000000b0050e69097f68mr3327351lfa.117.1706102579410;
        Wed, 24 Jan 2024 05:22:59 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u6-20020ac25186000000b0050e70a5b804sm2589732lfi.302.2024.01.24.05.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 05:22:59 -0800 (PST)
Message-ID: <9feae876-5170-4b57-8cd4-dbf35dddbefc@linaro.org>
Date: Wed, 24 Jan 2024 14:22:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] arm64: dts: qcom: sc8280xp: Drop PCIE_AUX_CLK from
 pcie_phy nodes
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240124-pcie-aux-clk-fix-v1-0-d8a4852b6ba6@linaro.org>
 <20240124-pcie-aux-clk-fix-v1-9-d8a4852b6ba6@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240124-pcie-aux-clk-fix-v1-9-d8a4852b6ba6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/24/24 08:36, Manivannan Sadhasivam wrote:
> PCIe PHY hw doesn't require PCIE_AUX_CLK for functioning. This clock is
> only required by the PCIe controller. Hence drop it from pcie_phy nodes.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

So, I have a small phytest module that basically does this:

phy_get
phy_init
phy_set_mode_ext(PCIE_RC)
phy_power_on

To load it, I skip PCIe init (comment out the node), then wait for clk
and pmdomain unused cleanup, then load the phytest module to ensure that
I'm not piggybacking off of the RC's resources.

I tried it out on the CRD, on PCIE2A (NVMe)

Without this patch, the PHY seems to init fine

With this patch, I get:

(1) qcom-qmp-pcie-phy 1c24000.phy: phy initialization timed-out


Kicking the PCIe GDSC from the PHY, I additionally get:

(2) gcc_pcie_2a_cfg_ahb_clk status stuck at 'off'


I think we expected (2), but is (1) okay?

Konrad

