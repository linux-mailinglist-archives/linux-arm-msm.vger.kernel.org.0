Return-Path: <linux-arm-msm+bounces-807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5A97EE37C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 15:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D078B209D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 14:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2221032C6C;
	Thu, 16 Nov 2023 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B9B36SbS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF8CD56
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 06:58:57 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507a62d4788so1309888e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 06:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700146736; x=1700751536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LRHtC2gpJmEwx4E/5yYYZdnHzrj5ZjGQiahaov9z+Q=;
        b=B9B36SbSlHylhwlmd97I5+Ha/uBPiChIlTZY9TmQ6DnPejnz72h5Usncp4haDG553h
         gRWDYQYdv5nUzHpVhk0BX1CTwVVg/0axWLxAvqvwFuwW7XuQIdPrsSXH65WN0oRiTnpd
         N8caerjLNj8+Ugd78fIK/+uGXX0mh70/Ao++kXhSAh1tATxMw3qje5QIyN9bVzXTYgj7
         7DELwpNzwGSJ7yJTAIbIGspdXXMsBbvmZQ6wBrRJgkKHMK6FNINUMBXElURROAW2xqvy
         bCOBfsTvdhr3DzICUUCTKA86TXhQ90vcBreJboJDlicskRcfWlp8ZIJOaz/Nk97AvMdR
         umyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700146736; x=1700751536;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/LRHtC2gpJmEwx4E/5yYYZdnHzrj5ZjGQiahaov9z+Q=;
        b=qTyjse7EwdV24COleRlz5j0LPFvjchZcgYwaC/FmvDdYe/J2N4dh9YbjCRoMSvoTQB
         NQTRrBjp1jIaeBOSPodpgHQqsUcv1AOkN9HPI4cs4MfebcTSzfEujKjONnQMhBoqP3Km
         6jyfiBkbGVToxiymZstwHxZapkqjXNE7SCp3/g3/+G7HCIlSCVS2ZTlx3+OdluUCnZ+x
         L/CDUc8w/RtSMG9VXBA4X9xXwxwTgtw3Q2weMp4EaJkSbj8o9kWogUNTm9mECKPoNrjb
         ISvAOfRKYdiAEI+f+8TlNAp1lcgVgEDqH3obNZnQp0vDOnk0PX0u6lWZhouYr/YMGdCv
         M/sw==
X-Gm-Message-State: AOJu0YzqzVrKwApoRdpUfNga1cKSZIZjdrJQIyxYU/XxNXmpjJT8ZLXf
	s5kVO0zFUfB1pLkuKIvPDZ5ElQ==
X-Google-Smtp-Source: AGHT+IF39sYCCAsll4ai1X8v8QufbfS9p0GWBm5Tl1nARHiZftR7iTpIiKo0fROv1yllcNFaaBMSNw==
X-Received: by 2002:a19:750d:0:b0:50a:10a6:1448 with SMTP id y13-20020a19750d000000b0050a10a61448mr11111060lfe.59.1700146735779;
        Thu, 16 Nov 2023 06:58:55 -0800 (PST)
Received: from [172.30.204.128] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y2-20020a199142000000b00509463003e7sm17278lfj.186.2023.11.16.06.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 06:58:55 -0800 (PST)
Message-ID: <c640dc18-b4f8-46e5-9bfd-b1349f7d91ff@linaro.org>
Date: Thu, 16 Nov 2023 15:58:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] arm64: dts: qcom: sc7280: Add CDSP node
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
 <20231113-sc7280-remoteprocs-v2-9-e5c5fd5268a7@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231113-sc7280-remoteprocs-v2-9-e5c5fd5268a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/13/23 09:56, Luca Weiss wrote:
> Add the node for the ADSP found on the SC7280 SoC, using standard
> Qualcomm firmware.
> 
> Remove the reserved-memory node from sc7280-chrome-common since CDSP is
> currently not used there.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>


[...]

> +			interconnects = <&nsp_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
QCOM_ICC_TAG_ALWAYS

Konrad

