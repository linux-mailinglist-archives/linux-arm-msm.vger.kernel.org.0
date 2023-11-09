Return-Path: <linux-arm-msm+bounces-308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5DC7E6D2A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 16:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B481E1C209E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 15:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112E31E539;
	Thu,  9 Nov 2023 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f1XWuvc4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EC1200B8
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 15:19:29 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62035358C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 07:19:28 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so12412401fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 07:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699543166; x=1700147966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQy/D48KYnrts/OWirk1lj+hMLu0jCUKKz6VnU/vkNg=;
        b=f1XWuvc4GLJ9YXa8+huQv0gkKkA2UtHR4YJm163AQZ3NVJ5QpSLkiNPmDBw78/w+X3
         jwtXqQVQ8M/yO1aGPameljgZpa6wZKUg/blM4Lh6QXHlUIjHs8XWiAB3lbFNqo3qRo7r
         IjcLd71rfe9JMoX4/baZIIbRkEdMmWpZvQjb98dyBgilnOH5jYbLS4MeYQPs0dkSYswY
         h6naN0mU9Kk11EUi3t9mbhajbRlyrNW5g/862BE0J1amgne0Qa5RgKR89VagNHI5LvuN
         Wm3gmmgSFUawsHNXdK5mrfBv0YBwD5/9JlP+Y6zcw3P+ZrIRpMw8MGxzVs8gxU4L5I6B
         2MPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699543166; x=1700147966;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MQy/D48KYnrts/OWirk1lj+hMLu0jCUKKz6VnU/vkNg=;
        b=Fp7VZXS6cuDYJQ7smXOaB367O4w1j4h+qaNZwfn2ea2sXJCcU6BCt2rc3CjKr9jN+L
         XZOGyYX3uUVQyUu/O2Ru0PE3jY3LuM/jy6bUSfUm58mwkfOkw8rFyhf9tTvpW0AzUOqP
         bR2SF8ZpTxUycej6xrNU7yF60tQSOhTDb5ujhiwk394QQjeEKK226P57To7WgRtXitpw
         YVTZDvY6/cHi+iC6S51slNyhquZsu96lhjEylNUKYtCKdh9/uVxbIhigUxtiCD9nxjB2
         7RW1enmgrHnHCBgEQEfyJH10U/nX9vtMk3xFDlSwt5u3f8KNOSZQiT6z+gs0yvt10V9W
         NQ/g==
X-Gm-Message-State: AOJu0YxDuNq22x8+hpIdZ8PsekVSYqON/DnSgLkrMo6KmvXmVMH73g14
	DDNOQ6/atZFaDKBcsVRcro12pw==
X-Google-Smtp-Source: AGHT+IF612VI4e/pw7m6zkVyHjTkRNzL8iXzL1nws+2/fW3dY8089S73Q67qmteZBGptX3fg53vX9Q==
X-Received: by 2002:a05:651c:1986:b0:2c5:1674:8d79 with SMTP id bx6-20020a05651c198600b002c516748d79mr5724007ljb.21.1699543166470;
        Thu, 09 Nov 2023 07:19:26 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t19-20020a05600c41d300b0040651505684sm2322671wmh.29.2023.11.09.07.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 07:19:25 -0800 (PST)
Message-ID: <faa889e2-5549-453a-b21b-942c937099c4@linaro.org>
Date: Thu, 9 Nov 2023 15:19:24 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] media: qcom: camss: Add sc8280xp resource details
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231109-b4-camss-sc8280xp-v4-0-58a58bc200f9@linaro.org>
 <20231109-b4-camss-sc8280xp-v4-4-58a58bc200f9@linaro.org>
 <3e0958a9-4d1e-4d1b-a914-5da154caa11f@linaro.org>
 <e80d4026-a525-48ef-b53a-f1276dd316e6@linaro.org>
 <4aaa25fb-de9a-4d7f-9316-ef83c27f4b42@linaro.org>
In-Reply-To: <4aaa25fb-de9a-4d7f-9316-ef83c27f4b42@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/11/2023 15:15, Bryan O'Donoghue wrote:
>          printf("index %d = %d\n", clock_rate[0][i]);

Honestly I'm like a Tom and Jerry cartoon standing on a rake here

printf("index %d = %d\n", i, clock_rate[0][i]);

---
bod

