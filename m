Return-Path: <linux-arm-msm+bounces-4818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 375DD8139D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 19:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E80132822B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 18:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2F968B72;
	Thu, 14 Dec 2023 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NaNr0mz1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2016910F
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:22:16 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bfa7f7093so10922755e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702578134; x=1703182934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5zt6+gWy3AYMGQQWK/VYCZJ/8Ak/jHvaEgVD9s7jZJE=;
        b=NaNr0mz1qAc3gO7fJQL2VF0XNWaGagG1TgvrUlQoV1aLBDol6j7KEehPFNeB64gThz
         3kG/OEyyBEyxnwlu55AuZKgDbDXDXGzYlft1DQmbxiurB0BwFxFAjjoddlbCjx0qTzwZ
         GB9udkEMKsJCHxhA/JNHP8obwYXI1dJV/oEiDH9LYXclYqy1SKApT62vlj3etT9I6ztE
         qeop4/RcSywKAf2yDyqHqwsg8aubHeDTuNLoCaRen89GMtbQcFhuiRmHxeeAZNnvEIvA
         Yjb2tW6VZKxSigbfuhoggSjvdixTGH7d/M2X4FJKYo7l3i70XpBlp69Xfmp99eL7NCJX
         /FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702578134; x=1703182934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zt6+gWy3AYMGQQWK/VYCZJ/8Ak/jHvaEgVD9s7jZJE=;
        b=tcHiLKq8p4Ig+NOM8ulFQsrFfOuGZo+SXZR+qwFwScYz5u1Mvx12+r0ZxZLufXMXDV
         dtqTnSYM0K1pzxTPpbWHMijUHX47W6K1crFiXPiCXNy4dh2mBXn2k6Pm9Q5oL0xhGpdT
         Y+izY1VJByO1VMn9VltfCniN61V/QbXeDJ2EvL3Oy/PgSbcu+J4GQxcgZAfsCD6eyDDT
         wtjNKYCLPshmyBY0l09IhzKI+1joby1SRUTpFU5fQ4hUC6ENq+hXKo8A61lpbI2HOQZM
         6VEN9piVy8Qy/B1iLW+HFB+7REwDIY/hI6ZcyxJOlpmn6BhrYc95vdpr2no9sPr9um8y
         c4YQ==
X-Gm-Message-State: AOJu0YzIVzi7Lsk+3QHadbQal2kxp2gRXJUyDb8JGPJWtze2WyjFMhcE
	g1RPxCY/8MpH37cbwKkO73xImw==
X-Google-Smtp-Source: AGHT+IG+XbVz7FwSzjj/gwHLGVwqaJROV9CW96oHkXLky1gS42N0U1lqDEU4h7qlZAmOkAmt1r4s7w==
X-Received: by 2002:a05:6512:92a:b0:50b:e9ec:4e2c with SMTP id f10-20020a056512092a00b0050be9ec4e2cmr4474729lft.104.1702578134417;
        Thu, 14 Dec 2023 10:22:14 -0800 (PST)
Received: from [172.30.205.72] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i10-20020a056512340a00b0050be8d89aefsm1929877lfr.309.2023.12.14.10.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 10:22:14 -0800 (PST)
Message-ID: <d9a80642-dd8d-4b3a-bf59-2852b5a5146e@linaro.org>
Date: Thu, 14 Dec 2023 19:22:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm8550-qrd: add PM8010
 regulators
Content-Language: en-US
To: quic_fenglinw@quicinc.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, quic_collinsd@quicinc.com,
 quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
References: <20231214-pm8010-regulator-v2-0-82131df6b97b@quicinc.com>
 <20231214-pm8010-regulator-v2-5-82131df6b97b@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231214-pm8010-regulator-v2-5-82131df6b97b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 12/14/23 03:59, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <quic_fenglinw@quicinc.com>
> 
> Add PM8010 regulator device nodes for sm8550-qrd board.
> 
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
Weird to have "pm8010" in p4 and "PM8010" in p5 commit title,
but it's fine, just remember to be consistent the next time
around

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

