Return-Path: <linux-arm-msm+bounces-813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 595497EE3E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 16:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB717B209F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 15:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9CE30F91;
	Thu, 16 Nov 2023 15:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CbLyqY5r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA24130
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 07:06:23 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5099184f8a3so1336833e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 07:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700147182; x=1700751982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dfwIFk5NqNT3cPJD53cWq63VgBJ0vjZVxcUueV9o4MI=;
        b=CbLyqY5rWFv5Vb8uyDDtRcgrwEAHOWh8nqwGbQ8hwj32yvmtTmQBchBdzWo+/p8G7r
         AnRhbbg4Rf9zYIL58FTXTG40J7043PPtLP+pXSBQ79tlG19Dr04/oy7QpqrBnLVjte00
         aLuRbPfjpTzhbsNVLnz5jYI5aHXe/uZrps/0afi3Ay88YRFH+hMFgZlKRZKI36yQNW0v
         ysnUCNlkw109KJiRUTxrbOL9rzR4SyVXRWqi++8CWpuad/0SnZvOYLdtznvnZAw1bKci
         oMGuzkOo+FGW/xNjxgykoGueb43foiMZtFUJXAWuVJiB9JnfmD+HOUWv2US507qA+ZqB
         AnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700147182; x=1700751982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfwIFk5NqNT3cPJD53cWq63VgBJ0vjZVxcUueV9o4MI=;
        b=ww7a6fMuUZ6ZFKEciXa022cciEneOUizJY/HfsubKs8ARhV1EGtSfjzIh+ABppEnsD
         TnybBGdoaL2CeP9DhoEt300j34wXRVf6VzV4OcIbD689XqqKzzk7KdeIz/BhMsYnX5if
         /kkFK95IuF0MwCPrVC64U1XLXRHbZsWfgaZBxS91xU9jqdKRiwByXOGuf5QQw6HPpY0C
         UH9TgY02ew53i3ab7zUJ4zFkNt7ZP9kgRLnVoewCEO94JhvqMd3NqMPUI9QoGYXbHuCY
         Xt38DdS0n7mZfqPsEpBfzTJ50Wy0LHpv0YTm3opXIdifOi3DqT6CPyyAfSSIcwWc/M9P
         xo2Q==
X-Gm-Message-State: AOJu0YxL6oD+U4DwoVRfS4PrPIvfez0SV4jEa+KJiuAMSsTQtAz5yHVJ
	4OHt8f0MLMFvxrkfaOj5VSBnHQ==
X-Google-Smtp-Source: AGHT+IEepac8C10E1992NN/gCMkLpKp9QW1/jwFDmH1G02vwWWWjDwQxY/mED3fLO5r8K8b3BTMS1g==
X-Received: by 2002:a05:6512:73:b0:507:a5e2:7c57 with SMTP id i19-20020a056512007300b00507a5e27c57mr11031404lfo.18.1700147181941;
        Thu, 16 Nov 2023 07:06:21 -0800 (PST)
Received: from [172.30.204.128] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id b13-20020ac247ed000000b0050a3e7e718dsm19556lfp.189.2023.11.16.07.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 07:06:21 -0800 (PST)
Message-ID: <934f5047-c012-459b-89c9-9c5da742a183@linaro.org>
Date: Thu, 16 Nov 2023 16:06:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: qdu1000: Add ECPRI clock
 controller
Content-Language: en-US
To: Imran Shaik <quic_imrashai@quicinc.com>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20231106103027.3988871-1-quic_imrashai@quicinc.com>
 <20231106103027.3988871-5-quic_imrashai@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231106103027.3988871-5-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/6/23 11:30, Imran Shaik wrote:
> Add device node for ECPRI clock controller on qcom QDU1000
> and QRU1000 SoCs.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

