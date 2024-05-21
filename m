Return-Path: <linux-arm-msm+bounces-20137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E638CB2F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 19:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E57D3282783
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 17:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D379214885B;
	Tue, 21 May 2024 17:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O+9hcj+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D240148841
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 17:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716312951; cv=none; b=WxueTkKKpLFZM2q3ycOAxvAbL8+hTdajCkQCWtBQ6g1C2mVD2Pp4lVT9r0cNFYdU5HdD6Pm5PzvHbCs6klzcLxcibseCWA4qdOQBs6LAeTGZNNm29PbqVOuMpMUTnFt4OqClwVGPFFyuSb+RN8yuodtb7XwCJe74bBKX5vsd4jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716312951; c=relaxed/simple;
	bh=XuD3UMWSTicjIiF7ozXmrSi2myUo59yuazJuOkCVELs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8im4+EBKLk2Kt0wDXo92hfIqQnc2JDqTuSmlGMEr1NomvD+afJkWrC0WH9EdU6SJ5PdECVC7Zm0B1eH36lmAWZHmCW/N92u59tOrRO+cEd7uZ/AS/UK3m63SF8YC3EuErrcmGmoLnKW0F1jdjezmWtDth9GqV14sMLukOSHQ9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O+9hcj+3; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51f174e316eso5058273e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 10:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716312947; x=1716917747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Ctw+pH4MnzojRpfpKhoAI1zwXX4IBqahQuQmnWxFZo=;
        b=O+9hcj+3m2pGAY8J4QCMFjL8lJn0oVlooOB2sgzvqNsroYohaFTgXBYZmAe6k4qvAT
         4DNK/B0I+XrqEvIfeCR6SxbZr0aVEuouDe80BFSopAKqcTQWzWDa4n/+ogsZbosl0Wjd
         BDTo9g92DsBLMWpYTrc0fGzL2zsH+n9CyXvt5svQt6+MVwBlKl+VAuVDv5LYUYaGhfy7
         ik2WK4gwBovZ2E+Hu8R2fRqeMt8hSXG6qDVJpTz6lrf+YdR9VGmgLdi+Knc75/xIU19a
         zSMXeC+pvI7KCfyi8l9eF/seQ0TS5be7eeq9Q6k/NaMAglD/uOUoJ3OQ2IaACqXhKN/c
         +INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716312947; x=1716917747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ctw+pH4MnzojRpfpKhoAI1zwXX4IBqahQuQmnWxFZo=;
        b=naYUvl25UBYjuZDRNgqkkBpbfUp1zylKQu3Toe6YNYI0OC6Mt/yhF2zWoU0IVe7UP4
         /62ypaCyphCDtX+jgh1NzqFypirpKXtCvTJc8ri/DiX4a1XsZaQpmbOBkqcwWTvT5VdX
         6ubsHkTeG29YqYZX0q6rj4ESO5GefXDDxd4hneUliyhhVMBTQqS0SqyduEVSrqDrbPDy
         FaES2AdT9fMIW1aY4KWCTJWCY78cFS8E4Y6w7aN0wmegoSXEQSTrM4s+6hqvPDh5p4/T
         /iHtb9PfDZwbVxt/fA6Dy+siikptCFrAJ2jTcuZT1R5rvsO0b+SBWfxTJYx/niDmqp2p
         DFeQ==
X-Gm-Message-State: AOJu0Yzxlwn2O1o/eTXCrDRJREVYocvJGQ/0DiQrlxzT5brQD9a4zcc+
	c8zwoB7K31+XvR1oee4hT3nYY/8MPCLIRVTDpBHrgKQB9c0gdr8mWdl6wVXgK0g=
X-Google-Smtp-Source: AGHT+IG3tpTeaNwBk05y415j39FL3r2RzN7r9+FBBuxHR6nbabjWWdvFIWpNFzi37IVlgNTTHwLGOg==
X-Received: by 2002:a05:6512:3e0e:b0:522:2edc:c858 with SMTP id 2adb3069b0e04-5224b73a706mr21157861e87.34.1716312947234;
        Tue, 21 May 2024 10:35:47 -0700 (PDT)
Received: from [172.30.205.5] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba54esm4705961e87.110.2024.05.21.10.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 10:35:46 -0700 (PDT)
Message-ID: <d45ee913-7f6d-447c-8cd8-2bfe2986aaa2@linaro.org>
Date: Tue, 21 May 2024 19:35:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Enable download mode register
 write
To: Mukesh Ojha <quic_mojha@quicinc.com>, andersson@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1715888133-2810-1-git-send-email-quic_mojha@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1715888133-2810-1-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/16/24 21:35, Mukesh Ojha wrote:
> Enable download mode setting for sm8650 which can help collect
> ramdump for this SoC.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

