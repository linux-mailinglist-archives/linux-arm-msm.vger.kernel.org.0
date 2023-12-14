Return-Path: <linux-arm-msm+bounces-4817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCF08139D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 19:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DB1CB218CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 18:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A87668B72;
	Thu, 14 Dec 2023 18:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zn8E1Llk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5578F10F
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:21:19 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50c04ebe1bbso920635e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702578077; x=1703182877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tafX2xO3xAurBh49KG+2mvpDK4q6+JAcQjqSwoaxrcE=;
        b=zn8E1Llk7e16Y2Ks60uDFwB7lFGJG6HFJbO+9bXwNt6mQTr0KIFkxNnRsQvTMmS1+F
         ppKne+Ghdj2Hcj6vsK3HppfJ6DUowUFZQZ9mT3xmJdxAD86+zmb7y9xtpI4I0BuVHsHJ
         zB5KuYebQr6p9dig46St7KGucp2fQPnKZAuwE++smd+GH6V7C81WQLPL4BV9bxsuRNwI
         etEbZt+daZ2vmFVBZJHi+RKQYgTLKqTlP2IEYQXIdtsbELgZiXd/PefFNHGJjT8EB90A
         c8uLoh3FxvDH2BeaW33WPyCqC+VpBAvMinr1AH0kCADyv56uNfYiBV1dN4NjGapVi8Qb
         TfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702578077; x=1703182877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tafX2xO3xAurBh49KG+2mvpDK4q6+JAcQjqSwoaxrcE=;
        b=Vi3Sf7/3PK80VvI5/31txSJHvdbbRSmLXOvQ3ZSRSaVMIa1EtKKDFUUuKv5OG/F++O
         a+hj81cHTN1hrrEi5ht+VpdowDWb4ssB43KlhTavvei0BuGyPmlsaqqfTPTDrG4QLBY+
         wbDra0VA04efjeRydbtrzR2Xwvm2EqUBn39j0gXLl4o/bLv+EtVTv0MMGyr3KEP9q6TZ
         +3jRP47cgbotv1VQhVr96Pb6wKqJE2dEYPe4a22jxkYmkGUVy/3Wu0+AguGLtWbEZ1mL
         9+r74/JW9ZJd1fncEsXSnmUEK2L90PlG14fpaQMAq4VOLW+rtmmJQ3w6SKG3b/lBFpcj
         ZFmg==
X-Gm-Message-State: AOJu0YxlRu4VkiDzEcTAivhPKO14SwodbrfrM2fqJmODYXdNK1tqCYVR
	MAmmH40GzrUhB89BJN5qDl72ZQ==
X-Google-Smtp-Source: AGHT+IE1OD2xsxB9RWQXbOqrcXcuu2XkumezDuYt6qOI7ak3ltyNiq6bYWnvuZG3s3zDZDMzhCMgbA==
X-Received: by 2002:ac2:46ce:0:b0:50d:1842:551d with SMTP id p14-20020ac246ce000000b0050d1842551dmr5027987lfo.13.1702578077527;
        Thu, 14 Dec 2023 10:21:17 -0800 (PST)
Received: from [172.30.205.72] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i10-20020a056512340a00b0050be8d89aefsm1929877lfr.309.2023.12.14.10.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 10:21:17 -0800 (PST)
Message-ID: <37f704fa-b5e5-4c2e-9576-0bd37c9ad624@linaro.org>
Date: Thu, 14 Dec 2023 19:21:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sm8550-mtp: Add pm8010
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
 <20231214-pm8010-regulator-v2-4-82131df6b97b@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231214-pm8010-regulator-v2-4-82131df6b97b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 12/14/23 03:59, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <quic_fenglinw@quicinc.com>
> 
> Add PM8010 regulator device nodes for sm8550-mtp board.
> 
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

