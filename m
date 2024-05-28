Return-Path: <linux-arm-msm+bounces-20750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 414068D1B92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C1A31C21970
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 12:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C5616D309;
	Tue, 28 May 2024 12:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="aYOYmE1A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E816B758
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 12:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716900330; cv=none; b=IOq2m4GBuFUBA5GWeXEv2KGtMeqpRGePhXhND1BseSqzv3yQAmwGvtfNp/dfwvDZadxHUlUCmKqq4+mkZ1r2n30GUNkUPapwoempq4EgcofActZfNXkeUGxeAjvTT74DV0OAedAmiMUiBKAIbMaP44uloCFvGuR0QHlEwA9Xddg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716900330; c=relaxed/simple;
	bh=1gp8qyEHcxW85ejZo1+aBeyEzLT9O8kE/y5xAMso358=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPPh8KN3gIiAAQjR+68fbMGzebr2OQtUKl+ZGPchpsK/WtksSmNOPhr3b54bbY0F+qORKyy7sjtSf/dpQRMszpMPT/Fi289hphIgHwU60/K9b8NkrNRp3ZLECJbXQOxht++ehyL5NxTAsQt1qMO6u2WqtT3ryVNAvh+m2auBwRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=aYOYmE1A; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e716e3030aso6913021fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 05:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716900327; x=1717505127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxZsD9x0oGA1kCoTVftsUV7n60iCo3BuIF7BYQR4RCU=;
        b=aYOYmE1AtNNXnTcdloyx7ezqgFZ7vZ0EcA8J7TI7pwjrr4EgXceUTtBsstLUHxS8yi
         WE69iO0eEo58wIMR7s+ZAFR2khvwvB6biol7SjBWrxpAXQQKRfJyoOfzRzjHr1hjoha3
         /UPgfE3Nrpqf624hmEq4TK7d7ozEJ916r9PM9jF+lvt+X2zpoMKfnXon8zvZ9YATlDgL
         3RaXQpA+6qSTPX3TJqB++W2HigPpCpVqdV6VoV29xEQ3q/uBbeHWttvNrTMEHluCoWw3
         KLYzUqVB2Z8t/j0a2+hf728O5CMXs3/FmMjTx5KO7n89/Gvg5PL91U/oy9MZwyMYp1j9
         /PDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716900327; x=1717505127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxZsD9x0oGA1kCoTVftsUV7n60iCo3BuIF7BYQR4RCU=;
        b=m0hDijNUfQKe0Ejyhefn2ZEXQ1qyhF0PMei1mJijaT/brI/MEFtWipci/bcLxBNwit
         RnRZ7RbA/t9++IyPvAWx8N67A5WcMuOK3jI9S+SuBNGRjiwNAwCJjm4/6ryd+3OiaVI2
         zQKyNd/vRHl7E3qBprOmfOAThmTMOC9geZXtgOobNRuUfdJ2hUYQWcF9yFgfw/WHl0AY
         yswaqM2N0z5+stdmpgfhsuoXsqvbb/nbmb/mnIEFNOCr/hs9CNyo/7tS5gCqg+akwhOw
         opFi1afP6CXRswO10hRHSw/Jkce802sFwvK5FD6oPVWNeXaucD8o/G7OVjmeEKavZ5pc
         tALQ==
X-Gm-Message-State: AOJu0YxeF5GerKTL1hy0hzAQuCrzohH3Vp95xmDIQbpnfsqB0s+HDh5V
	SIBHrVBvSEBtdMMQlnSyTaa8YRuW4mKBHmJphNqXvS84o6k33J7M8+6ecvYSqBU=
X-Google-Smtp-Source: AGHT+IEUfp50xAXdylzyzsSdmBeXxPYDx7087qrl33CEQ/qMlmS/sUQO7LwxSyNPXy0jpMnDth2aqQ==
X-Received: by 2002:a2e:9483:0:b0:2e9:84f9:3e17 with SMTP id 38308e7fff4ca-2e984f93e4dmr14048401fa.50.1716900326879;
        Tue, 28 May 2024 05:45:26 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3564afc3577sm11088204f8f.102.2024.05.28.05.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:45:26 -0700 (PDT)
Message-ID: <c81feca0-3d56-4733-8eea-f8c574e99d9d@freebox.fr>
Date: Tue, 28 May 2024 14:45:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: add HDMI GPIOs
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <8cc61db5-2920-4dd1-8132-5af434fb05b1@freebox.fr>
 <36f22383-79a3-427e-bf17-35ce2e1dd620@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <36f22383-79a3-427e-bf17-35ce2e1dd620@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2024 14:31, Konrad Dybcio wrote:

> [...]
> 
>> +			hdmi_cec_default: hdmi-cec-default-state {
>> +				pins = "gpio31";
>> +				function = "hdmi_cec";
>> +				drive-strength = <2>;
>> +				bias-pull-up;
>> +			};
>> +
>> +			hdmi_cec_sleep: hdmi-cec-sleep-state {
>> +				pins = "gpio31";
>> +				function = "hdmi_cec";
>> +				drive-strength = <2>;
>> +				bias-pull-up;
>> +			};
> 
> It's super strange that both states are identical. Usually, the pull-up
> is disabled and the GPIO is unmuxed (i.e. function = "gpio"). If that's
> not the case for whatever reason, you can drop the sleep variants and
> simply reference the leftover one from both pinctrl-0 and pinctrl-1.

Patch is a direct translation of the vendor code:
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi#L2324-2400

I suppose it wouldn't be the first time that vendor code
is doing something odd.

Though, I'm a bit confused why you would single out hdmi-cec
when hdmi_ddc is the same?

Regards


