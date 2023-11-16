Return-Path: <linux-arm-msm+bounces-809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7507EE385
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 15:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA9141F24B61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 14:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3FB328AC;
	Thu, 16 Nov 2023 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zYNjg7CI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F8CD5E
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 06:59:34 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5094cb3a036so1359510e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 06:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700146772; x=1700751572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZznfpNYp2K+gv/eV5dWRUl0My2eaThlyxN6BclNZEOc=;
        b=zYNjg7CI4EPWRIJI2C6N4Qjjxj5TaGUNhvDz2Jqh0eHhvEY7E6b+Kyy2Vr7P8j0rY7
         jq39W1ECNQgbE5iDHW1swMnYgVCYT2aEFcFyqCMYTG4Gx1w6s0U3j4pfmu54khoq7Dq6
         I6g/SCXTL31epj2XClSdRY5iVuKh72hhzjLXdh8V5NqdAwDGx/3Z1vasCLnkHTBrRRzU
         VjdbZqTrgBOXbQfvPzIsDaryWANpufJHPfOR1USHnLfg8yGsa14jO0RRtplBDrPCTXOT
         y6BPAeNYd9g1NFD/dudtEWvueCnAXwa6Lp79lgfHx0YTPvT5Y7BAaAUBHldz//HeL5XR
         Ffig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700146772; x=1700751572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZznfpNYp2K+gv/eV5dWRUl0My2eaThlyxN6BclNZEOc=;
        b=CvKiA3/dqCW2LO7EgjwFtuiQqgwwV2YZHf9trKgwnHLoDEIhv+0Txc48VYcjeWLFRt
         iqg67NSmq5YC1NiIjGwH76WyqWjnm2HJSh0HRzgvpz2Xyj5DpG5UHghe56GMd1D05JPq
         MuBwIC9Y2TTKdkKdJ0RLm+ah0MkHY0C/H1AuuTIlaDz4Vv20Qgz3+u5ehb6r/nGuqFWB
         BECXYR5I0uYBowH3Tj2SAOvYEesBCn0Q8LPrnF19R9G11bopinmYHCNeeekM/RKmAl3P
         WAYGAfkrkwk9gn9LbmzApv0XQuhLJvvnKHmHGw9fARN5CpSHUZzPGndnpyoVXwiU7dvX
         BlLQ==
X-Gm-Message-State: AOJu0YzSi4L8jj3/SH4VwyGY9xldEj8wfaN8Bcn5YgP1JJvps2cpiUPf
	8CxI96pn2sfmG3q+Xqs4zrVQfQ==
X-Google-Smtp-Source: AGHT+IGRhd32Eae/+/fJ/TOBsRvxst0EQUkVv4rV1p2XEMWXT+a+vnfSBCC+UA9XOPQ9BtFB8PMbJw==
X-Received: by 2002:a05:6512:234c:b0:508:12f6:ff07 with SMTP id p12-20020a056512234c00b0050812f6ff07mr14724159lfu.48.1700146772188;
        Thu, 16 Nov 2023 06:59:32 -0800 (PST)
Received: from [172.30.204.128] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y2-20020a199142000000b00509463003e7sm17278lfj.186.2023.11.16.06.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 06:59:31 -0800 (PST)
Message-ID: <19f7f5ec-e45d-4dc9-882c-5015e3df62c9@linaro.org>
Date: Thu, 16 Nov 2023 15:59:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 WiFi
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, =?UTF-8?Q?Matti_Lehtim=C3=A4ki?=
 <matti.lehtimaki@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
 <20231113-sc7280-remoteprocs-v2-11-e5c5fd5268a7@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231113-sc7280-remoteprocs-v2-11-e5c5fd5268a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/13/23 09:56, Luca Weiss wrote:
> Now that the WPSS remoteproc is enabled, enable wifi so we can use it.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

