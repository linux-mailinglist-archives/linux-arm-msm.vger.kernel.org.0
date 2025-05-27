Return-Path: <linux-arm-msm+bounces-59490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19442AC4A06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 10:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08C4A17AFC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 08:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5CB248F4C;
	Tue, 27 May 2025 08:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pVTYCAhX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0801248F70
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 08:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748333974; cv=none; b=SfaovNWH8IByBRkUg/zfWAqah2ysZrhp1P7tj+mIoWvJQdU21L+j1Zz1t0DMM0Ao0v0h9u/MCIo3BqsdpY2UDX5Se3+63VnAizbsjgOskI0c/iBasq8dkcWlLXw4Nfn1xvd1Eh+VpJEAResgdq3EPWsxRtj/hMRVFG9WycPrRaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748333974; c=relaxed/simple;
	bh=ia8kZdP0HFoJkRuqfb9xYK3PP1X9WFdfCow4Ewno8P0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iP6QtXdnHBoEPHzlexrampZaNF7/ldwE9V1YM2YRpKg2XvK0lPgg4y83OBsTGXNcGX1jKSV4WV3/7rFX71FmFbo3Zesf1LPOkAXBF4Z6r6esG3mGGRI9ivpXzj5yLy9OuhX2QJGE1ZTu98kA6s7wr29VvZtVGNnlyHepWxJpB2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pVTYCAhX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so36295265e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748333971; x=1748938771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMOUzI+Rl9kCd96v3bJcE+T2pFM5Ij46/8q1c510Oug=;
        b=pVTYCAhXK0P46qJjOhOoNjEwGWdy7Z6CbVLokeqZf5mbK9vDAB/ep6MskK6VIrTfQM
         EcTNKvJs+jSB34M0oV7Na+ujMXdhffd4tDC/8qp063d2j4XOksNeFdgISMj/X30xiJty
         gM+/hTM8P4rLkgm6gk2IOrhD/j7Ci+M7BfWzfv9DnF6kAqPTK2xRO1y0N6Ys3TGzHWo0
         jvogReYJOQsXzrxW+qlqyBAHShL3nJ0lctCRC0DL2X8DM5+R6m5IQS9P03ZJenMhK1Zd
         Uw4mVOIF5+8jAq/hpmbzULXJXPlhDQVhVoIvDYV/IacmYptdI0gtYpQbDqi5O1XyNlnJ
         3w6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748333971; x=1748938771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMOUzI+Rl9kCd96v3bJcE+T2pFM5Ij46/8q1c510Oug=;
        b=p3qwgR77yjg2b/CsEunE6q0cJ5lmMxBbke8HMGOocKfF95SfpOpO3Yvh2aLYC7SqYT
         f22KQ0DwUJGK13OMcbr7FuIE+MW0zghRIxt3SH/jaii1TNpopDJBoyBMrGawE/IRw3St
         wHGTx+wM9nXmhhzpbhgYj/rHhstS20UuHjET7vkElvYKnCJTtPN5R2m/90pa4Mc8CmyG
         CmqyCULanyyQ0EMsI/sGVmkYEUjOBurjKbz/5OeSY7c+dgiOX1ixFD2RR0ty/iD1noz1
         X9ztd/ZYY5mCVQpKRCKKAg2MBDG+xmI38TcFthBXc0BgZHQSv5r9ZK5aIyMAnBIhV7Jg
         djTg==
X-Forwarded-Encrypted: i=1; AJvYcCVs/wBkBWKsjbPHi+uKCOgGzLU+BvSiu4UzLH572GhvlHh8oU1KozsUbZOVbMuIf+xyUO0bgMDha9F69ObU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg3L7r2IcivldwfpL5WK/uNl4j6dBSXzfTGBM831Tq+NJ+fi/7
	/2PQQ0EqBmQBT+CR7tm0BTUNuNY0J1mwatILfHVXYLWsqt8lvw8wuEOxVZ+LpLLfhOE=
X-Gm-Gg: ASbGncvUKyIy7TN1pUC+FLHMYloCMHpT+YTr1IVoOQsAlsEJFwziUGBRTQ4ZJY2TQDq
	87YTro/9DHsLqhdDG+kCkxdgEyRPq9DdCMefB/8GMvM4RuT2MWq45HRpB02hftqnsbZ1XcsYguj
	+6u1zL5jVfOhbLh3qBaw6hlJIdpzcMBi+NELOUMlp21iQEthGvLCqXMUiKatfjzvBvAIx7gzGlS
	KZINT4eL59ltLCADZIlG1Aw0AN0l1fAYbID1YNV4UI3viS/LngsqBPgAR5yRwVhSyRzvEDPanoG
	dVY19vOXDFCGocWygmW3/bpAOGiyoZgDJMuylrbFIEPWdd5RuDBfPqkbJRarvR1N56imjcl1Tsp
	G5nnR4S6lav6cmVSj
X-Google-Smtp-Source: AGHT+IFjTsGVi2CK4OkLJrI3Smdv4M+APjpCmrgDiR1D6zlgPXvjVIxxpzIlokGl7A7BbOpPT/vmFw==
X-Received: by 2002:a05:600c:a13:b0:440:6852:5b31 with SMTP id 5b1f17b1804b1-44c91dd151amr132439605e9.10.1748333971167;
        Tue, 27 May 2025 01:19:31 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d53ce0b4sm6807921f8f.37.2025.05.27.01.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 01:19:30 -0700 (PDT)
Message-ID: <b3d4b080-5a9e-4af0-bce7-41c06d1d27f0@linaro.org>
Date: Tue, 27 May 2025 09:19:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: qcom: camss: vfe: Add VBIF setting support
To: Vincent Knecht <vincent.knecht@mailoo.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
 <f2162241-6423-43b3-a6b5-74e373cd8834@linaro.org>
 <10c45ae1d2453f7c81dadeb132b6c2911ab7d95c.camel@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <10c45ae1d2453f7c81dadeb132b6c2911ab7d95c.camel@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/05/2025 17:20, Vincent Knecht wrote:
>> You have both
>>
>> if (vfe->res->has_vbif) {
>>
>> and the above switch, there's no point in checking this twice in two
>> different ways.
>>
>> Choose one, suggest has_vbif is enough.
> I think the switch is still needed, so that distinct settings
> can be applied for different SoCs.
> 
> Or should I just apply the 8939 settings unconditionally, and keep it
> as an exercice for the next dev who need other settings for another SoC
> to deal with ? 🙂
> 
> Thanks

The flag should be enough.

---
bod

