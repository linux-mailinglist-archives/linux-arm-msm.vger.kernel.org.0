Return-Path: <linux-arm-msm+bounces-205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C27E5CE2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 19:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 939A128148D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 18:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3909F32C88;
	Wed,  8 Nov 2023 18:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E035B321B7;
	Wed,  8 Nov 2023 18:09:18 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 624F71FEB;
	Wed,  8 Nov 2023 10:09:18 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6ce2ee17cb5so4391591a34.2;
        Wed, 08 Nov 2023 10:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699466957; x=1700071757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnGahxah7u3QgZVPvtUjb4k93efx3g5ON8mE+tawIB0=;
        b=qubwiyhWKrggunN/lL/wXUUwdVXbqj8YP0oQLo671sslcwH73zgGgsnEjGBAjyHODB
         ydrBg2lijHLRJXwTAJc2I167kBvnOg/nM/6MmZbBvtXZTsg59Zg1L2SOxiAzamAs4wkj
         vhMsUCsS0+sArSI2JEQtw3EK3i5rt9SGn6r+QK3nTjot8G4L6Oy3BCn7CS41qV+Lhh2F
         tuzHfMe3ifvAm2SI5xg5SV4bF/ZcDGOhcD7byvcKh0TaeNUAcKiD2nfrUQsyRqGPhaE+
         00mSF/vw8B61Qr1sYUlZKXnBUQktlD14hj2HaDH2xFDZIpKNnKSduMLkl1jfBg0TSGbL
         7oQg==
X-Gm-Message-State: AOJu0Yxsv8riAIqSiNjalugbO5TIec7gqh556cSkjCQ1M5+VnJQ21XIo
	AQhiC9TVwgioHIJVch8YxrRSRc41bw==
X-Google-Smtp-Source: AGHT+IH80TXU8x2dEy8NfsISE5Tz1j4RmhZpTxSuBSFCD6Fp9P0/NzEpZSn7wSjNfk+2BtrLisoGKg==
X-Received: by 2002:a9d:69d9:0:b0:6bf:3f4:3edc with SMTP id v25-20020a9d69d9000000b006bf03f43edcmr2665760oto.22.1699466957554;
        Wed, 08 Nov 2023 10:09:17 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v15-20020a4aad8f000000b005737ca61829sm950379oom.13.2023.11.08.10.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 10:09:16 -0800 (PST)
Received: (nullmailer pid 2647761 invoked by uid 1000);
	Wed, 08 Nov 2023 18:09:15 -0000
Date: Wed, 8 Nov 2023 12:09:15 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,sm8250: add SM8550 sound card
Message-ID: <169946695488.2647474.4328961977911017338.robh@kernel.org>
References: <20231106180422.170492-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106180422.170492-1-krzysztof.kozlowski@linaro.org>


On Mon, 06 Nov 2023 19:04:22 +0100, Krzysztof Kozlowski wrote:
> Add sound card for SM8550, which as of now looks fully compatible with
> SM8450.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


