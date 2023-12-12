Return-Path: <linux-arm-msm+bounces-4435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4DB80F25E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 17:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98CCF1F214E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 16:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F227765B;
	Tue, 12 Dec 2023 16:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZTgcnQUe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F1EAD
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 08:22:42 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c9f72176cfso73330611fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 08:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398161; x=1703002961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9rIMOgJELoYzb7wiNwf62z7Kl2Dio0qgPcZXUZG0LhA=;
        b=ZTgcnQUeqbkqww46jnCJ/dYcQgOtGVztShtd4F3kzE4OfYUh6Z70TTps05hkFO0rUg
         W21ohjbDXj3eCSt5dElCtP4tCFFlqAlfwZcUtSAXyTc0H83jV9/jd7wrCIkfIUwUfjZf
         tjJrXOq5MskRDMqSzJoB23t/3ZNci8+RBrOQ9Xi8+sJ0AOJ3DjQmC/MEy+wD9xeKcpIJ
         rH0HUBiBP3gfojnBjuK2ozkpm4Gn3Chlvr42gbUR/TaOUgfoKcx6mRVr7EiIMBjzWa0Q
         xTOOIz8X7dOARaAUEc9iczoaJznvnJFXjvO/ry7SZIDEAasvSqWr1zi/aFgwVZQDPtcq
         5u5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398161; x=1703002961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9rIMOgJELoYzb7wiNwf62z7Kl2Dio0qgPcZXUZG0LhA=;
        b=aPfzQr/Z/uT4AYdQWtFWGJRAaqkzZknass2LY2cXK5kTDJGwi1oMUla6txPveRCCs6
         64pC8/bnM3+ZQSuDdGaDQQSX5ZYA7GK3WnlkSIVe2R+/1ek3A0LHi8kUHrM3z1tqkO1j
         FxDeI/ScVq+b0PceaMMopuhJpCwOUTUYaoMY+l9/EUryuBRdhk6//hnIwMzviR7mbS8c
         1YPmaXY5mlJgXq0QJx0zJ00B1l/mKgVCCVTdEdptm+WT0ZgKkPhtP0bjZ23Lvl1IMYfC
         7/ukS9Ycj6CoLSwYWFY+19vW7Njsev2fIg5Ey1RxRRfKiKMbh3AOblpni+aZrhzsILiL
         NzVA==
X-Gm-Message-State: AOJu0YzInxjDTgdx1h5kyHSHzM7a/Ewyslszp4RNu2S7IHaXmOVztSzA
	hv2H0PgdMbdFZt5kQVidpds95g==
X-Google-Smtp-Source: AGHT+IHsUDU7BTze8ti+y5I5/DuKnoBA/50hWRceCV0DyXBALJk4vmUkpqm9pO1iXitAVzNrUDFxAA==
X-Received: by 2002:ac2:58ca:0:b0:50b:debe:d35d with SMTP id u10-20020ac258ca000000b0050bdebed35dmr1450754lfo.133.1702398160591;
        Tue, 12 Dec 2023 08:22:40 -0800 (PST)
Received: from [172.30.205.64] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id h8-20020ac24da8000000b0050beffaa549sm1368848lfe.255.2023.12.12.08.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 08:22:40 -0800 (PST)
Message-ID: <fccf0f17-edf4-4f9e-b284-4ccc5e1a8167@linaro.org>
Date: Tue, 12 Dec 2023 17:22:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: Add missing nodes for CRD
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sibi Sankar <quic_sibis@quicinc.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>
References: <20231212-x1e80100-dts-missing-nodes-v1-0-1472efec2b08@linaro.org>
 <20231212-x1e80100-dts-missing-nodes-v1-2-1472efec2b08@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231212-x1e80100-dts-missing-nodes-v1-2-1472efec2b08@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/12/23 11:24, Abel Vesa wrote:
> Add all missing nodes for the X1E80100 CRD reference device.
> 
> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Co-developed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
[...]

> +
> +	kybd_default: kybd-default-state {
> +		int-n-pins {
You can remove this level of indentation

Konrad

