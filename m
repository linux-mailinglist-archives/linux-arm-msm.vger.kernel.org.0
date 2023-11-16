Return-Path: <linux-arm-msm+bounces-805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0871D7EE368
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 15:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BE2BB20A39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 14:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A5D328C1;
	Thu, 16 Nov 2023 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TahFNGsg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714CD130
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 06:56:05 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c5028e5b88so12725761fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 06:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700146563; x=1700751363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BOjtDTqTnf7Djty8sAXJwD9eQx6I0vPmvqRRWr4Mj8Q=;
        b=TahFNGsgu7GDPRFlLGHT8S1BKnpSxBlpbyKZeN6indXTpuZxp2RTYFgfogtjYgchfE
         ZhmpRFbQmHKG165hEYxvuHILMIOoCjfYTEyMigRY3/Dq2PJJ3EAJJZyd+CbOXYteTvFG
         Z+nSzn7L2yDysCPRUk1mnHTilNkpcm1qCidQHxpMfv8bFA3XhHKEPH0OlSnaUsYvGvvT
         mOZcc++ND5tFdTcQw3zOXlmhHVnYDkpEJqG1QLpa3ivhN4Ym+ZLF7s+0bpn/UlBX0JYo
         6Sd9KIcSY3u6W/K73bVapZKJa25AetzuuXi+HtTi4bXX722wqnBHRyuVoujcaibX0q2t
         8EVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700146563; x=1700751363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BOjtDTqTnf7Djty8sAXJwD9eQx6I0vPmvqRRWr4Mj8Q=;
        b=PIfji4E7xQBYkEqHk29C0qc/ELJbdG519BgeMqeThCBxbUi0o2lanvJGXrtGXGoKCS
         IGkkBR5poHX28GofOMjn74utx0HVcjxQYmtpA7fHDIkIza9JjxShVMW8PPJC0fzpFh/h
         QIlnBST1l9zkJhA/QXlJMWmpggEYP7JsYDpmlzfBqL6CFhxLKjD1U5rzMnzZIBtKxel9
         jB0OkRFKRjJXQWCLgqt60qhsBVX+7tc+sDatCl4dA3s9bKVQbwz1hEn3ZL/YwLYCaCfR
         crpPA/hpIvMSbFI971ko6ts410/tw79azjD6TfA1bGVtmhHwZX4wu9tm6ySONlnmBNQK
         CiOg==
X-Gm-Message-State: AOJu0YzRdmVWx9rjh77wLdnrVqKCB/bO7xO0OxosxH8Lo5d1beP7jsix
	MWdjn0wYwk7mAZ53aAZ//sheaw==
X-Google-Smtp-Source: AGHT+IFDMYXqlEg+F4sWMGncBm04jorAZmXLffuWB4mSZRl9WUMnZsfBmoQ3Py0+VAOCD0Sg3r5ZvA==
X-Received: by 2002:ac2:54b9:0:b0:500:d4d9:25b5 with SMTP id w25-20020ac254b9000000b00500d4d925b5mr10759938lfk.56.1700146563658;
        Thu, 16 Nov 2023 06:56:03 -0800 (PST)
Received: from [172.30.204.128] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y2-20020a199142000000b00509463003e7sm17278lfj.186.2023.11.16.06.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 06:56:02 -0800 (PST)
Message-ID: <15792113-c54d-404c-b686-cc7c75ff542e@linaro.org>
Date: Thu, 16 Nov 2023 15:56:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] remoteproc: qcom_q6v5_pas: Add SC7280 ADSP, CDSP
 & WPSS
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
 <20231113-sc7280-remoteprocs-v2-6-e5c5fd5268a7@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231113-sc7280-remoteprocs-v2-6-e5c5fd5268a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/13/23 09:56, Luca Weiss wrote:
> Add support for the ADSP, CDSP and WPSS remoteprocs found on the SC7280
> SoC using the q6v5-pas driver.
> 
> This driver can be used on regular LA ("Linux Android") based releases,
> however the SC7280 ChromeOS devices need different driver support due to
> firmware differences.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

