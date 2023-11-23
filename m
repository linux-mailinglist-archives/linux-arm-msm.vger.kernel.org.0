Return-Path: <linux-arm-msm+bounces-1689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D98007F5E81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 12:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93F64281CF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 11:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9439241ED;
	Thu, 23 Nov 2023 11:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RXsw4eQf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B29D49
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 03:57:49 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5079f9ec8d9so844667e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 03:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700740668; x=1701345468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQKfSQzvl6n50M4875CnD5xT+T/rNm01RbmwONA33QU=;
        b=RXsw4eQfbefoggqIdo/NjV3dj1Cfogs0lDj3vVTfE12CAjuR4RkoRPwtPtDHaGIpqm
         QiS6fg7zfyvjouoJW6hK6S7gFYYssJ8ormWSWJwh/1qOacejZHmT8iTJMc4cvn68gVju
         pV7YWSW6UgHxOERcbDAaDRd0BK9tC/rHjGKr2HOnAwvNW8koCmEg04E4beKhZnrCTLbb
         PSgnnwiLP6sTryEQ//04uHmzNGYSjYuOhrFLwmzbu3snaFjvbPkDK6JV0VSoLCVPgP75
         0vETqvpUAi2+MFa/Dwm0faJdE3fZyyYmsULnKhHuybZZSiQCI0rZ0azi68fSoQvWNhgM
         v7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700740668; x=1701345468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQKfSQzvl6n50M4875CnD5xT+T/rNm01RbmwONA33QU=;
        b=BnOg/jzOLTsgWcX1YfPx6OIJrJBOCc+iSztGUhW0F/eOUBeDl2WZfuOaVDyYCith7+
         xJpJNC5l8rqNSVsMCZqBz4Xj1zoosANDwXjTR9mHL1FQYNRqKcU8z3nks62uC1Ka41xH
         RTRu7krdAxuoR60WzDTWxzjhpmC1LNwKQGeWLcikfACj1lDd8R+7ukLjkebo6j1mZ7QC
         gX48gvFWaexzeTgo+LKWs6NT+TFOy6Xn4ym8TlKMZTxS+SZMGOLeuZIqFuXrs+w/mIHs
         8GIQPZDetpgmc3lPDIqxDhABb+9NaGDauxGt6qYlgyjI6pSRivVwxv+UOKwj993qpdl6
         0Wlw==
X-Gm-Message-State: AOJu0Yw3XNcKTvBI07N17dLWJk6fZSiXpYc9D1reQG0xGd0TjF/ghX1G
	OaA8gUgMrsdfqRixPMUGYqU0ug==
X-Google-Smtp-Source: AGHT+IE+19JiYtimOS/PBEDLWjSlimik3++amKqAhSSo37eVU9RxdRbmAlBsZzwdcxUkAGtJ0DjG8g==
X-Received: by 2002:a05:6512:3710:b0:507:9b69:6028 with SMTP id z16-20020a056512371000b005079b696028mr738559lfr.24.1700740667712;
        Thu, 23 Nov 2023 03:57:47 -0800 (PST)
Received: from [172.30.204.221] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w28-20020a05651204dc00b0050a71f99960sm167359lfq.197.2023.11.23.03.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 03:57:47 -0800 (PST)
Message-ID: <1846a5c7-da25-4cc8-992a-3898bbf403d5@linaro.org>
Date: Thu, 23 Nov 2023 12:57:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/3] Ethernet DWMAC5 fault IRQ support
Content-Language: en-US
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>
Cc: kernel@quicinc.com
References: <cover.1700737841.git.quic_jsuraj@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <cover.1700737841.git.quic_jsuraj@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/23/23 12:53, Suraj Jaiswal wrote:
> Suraj Jaiswal (3):
>    dt-bindings: net: qcom,ethqos: add binding doc for fault IRQ for
>      sa8775p
>    arm64: dts: qcom: sa8775p: enable Fault IRQ
>    net: stmmac: Add driver support for DWMAC5 fault IRQ Support
You resent this series 15 minutes after the last submission,
with no changelog, with no increased revision number and no explanations.

Please refer to the following documents:

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html
[2] https://b4.docs.kernel.org/

Konrad

