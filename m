Return-Path: <linux-arm-msm+bounces-22549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E290656A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 09:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF2341C23194
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 07:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D450813C660;
	Thu, 13 Jun 2024 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hMTN8CUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A68A13C3D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718264525; cv=none; b=Nr9W6uW65gGuOQxq+tgWLBIruIszZ0b+ajOH5wh70vuYLcmwsbVDA2yU4h292Lm5a8Y1LjnTjmxcmixc+3KKIuRBkngVchIf5Fs3WtqiNOU1BhEVsCEOIYEjP9cda+xuTWFgO4nTEvBv48O0E+XSt9YfPrZ1JEhNkDszN1cnG4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718264525; c=relaxed/simple;
	bh=UWY1jQHCY6b4p926RE7DUgpp9ygGl4OAgxySR+CLJUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFACKJ9fYwK6FK3FUM6fjZLqTuItsC81lmsyaxdw6zgU5qOAovWxeJZRd9evxt2g4N7uF4Yak6yQbgii2Tad8udxDpmy+XVxk1PABlfhsOmfxQJM2GZ4aPy0kr3DAvgrUImQflRP8QXA7YZL35de5a7/oPp55H62HUs+JmlXF/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hMTN8CUY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52c9034860dso873425e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718264522; x=1718869322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KF85CFMeWWGV8dBA/jqj/6jX8gLuT5XMmUZA13zEGiE=;
        b=hMTN8CUYyhPlJrhE6LWJSklxu85FR1OBgNLXU2rDM7c1e3Ml6lm2k3GS+uQPzVYP9L
         hkmP/aByKZdbyFdmq5zAmnox7iOOeckwL6XVriE7kBT2pmrcn5+ZbMDWTOJ6Hlf7GESR
         Cl38Jn0zuTnGIpE5e/pLq9LAtYmMoGHt3vB8SPjWuJnlvDeQP50Oz++IL8t+UCfg5kbT
         zRgQqoi30x8Uoabjt/jjyd3mahSxSJtCf5a8CwH01W5NZRgEZcrOyxn4HCa/kqjVo1AZ
         sovQbdsqAfGFlWCNNC76ToI921wJGVH8QM3Ua3G1rU6JVZfztmcFaBDHL/BfDrXUrYzr
         7OZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718264522; x=1718869322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KF85CFMeWWGV8dBA/jqj/6jX8gLuT5XMmUZA13zEGiE=;
        b=UNSt6BtK349QdB+D71pgREEsLLiX0zowq6rCxWpOjnwenvuyGYqHdTqUI7jKA1t4Qy
         bBQNH3qZ1IDN58w0T/TJPmaTOeflOOiDO3IFjsAUL6CwwSfETLRjbx7bbMLNQ8DMJZk7
         pTmtWMuzfnfsW9LJufWrw2uoRUgOHAclOkTjWxgENdGby2rqlgwVhfoytfja2F7Gzb33
         mCXkTldHw7OCVFHCZdiN5h5NsABK+y8He3kc3oBBBqZp1EwcFMRTW1GhtaKMsZySIN4g
         KtgoJMpHK3HywsGxy/+C2bkL6vvPY5SXAi+PjZyE7ABjEQ7V/G1hgPsgAno45CM3AzWx
         6fKQ==
X-Gm-Message-State: AOJu0YwKMoW8Zwh8obQvRoEe1UZZ7P6GuQoKklLXnSF3wmwhyKpyg0Jz
	3iL2HO/k9peNk46Dlph3CznsgLGpPHKwRJ99PfhB8yAd/KCYPoTGr7RMtD1HjKE=
X-Google-Smtp-Source: AGHT+IHyDYh9PzejbIrV9uyAGEpgb2Op+Yqzxy+7aXYUzERG4u6uKEJAqIAAqudgHbeAgx7zU7yn1g==
X-Received: by 2002:a05:6512:3045:b0:52c:8909:bd35 with SMTP id 2adb3069b0e04-52c9a3bfb2amr4010881e87.10.1718264522420;
        Thu, 13 Jun 2024 00:42:02 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:c71b:4253:8a9f:c478? ([2a00:f41:900a:a4b1:c71b:4253:8a9f:c478])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282ee85sm114279e87.111.2024.06.13.00.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 00:42:02 -0700 (PDT)
Message-ID: <76f5e3c7-a90b-42d2-8169-e5e2211a14a1@linaro.org>
Date: Thu, 13 Jun 2024 09:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm4450: add camera, display and
 gpu clock controller
To: Ajit Pandey <quic_ajipan@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
References: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
 <20240611133752.2192401-9-quic_ajipan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240611133752.2192401-9-quic_ajipan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/11/24 15:37, Ajit Pandey wrote:
> Add device node for camera, display and graphics clock controller on
> Qualcomm SM4450 platform.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---

None of these nodes reference a power domain (which would usually be
CX/MX/MMCX). This way, the RPMhPDs will never be scaled.

The current upstream implementation only allows one power domain to be
scaled, but that's better than none (see other DTs for recent SoCs).

Konrad

