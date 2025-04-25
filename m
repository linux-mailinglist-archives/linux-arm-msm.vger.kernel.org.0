Return-Path: <linux-arm-msm+bounces-55779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B68A9D3D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 23:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFB043BA264
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBDC223DC9;
	Fri, 25 Apr 2025 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLiAfY/3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C1520E710
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 21:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615201; cv=none; b=DMFPwVNV6w4Fs2sOEzNt0C8fzcB/ZOnKYevl+dtfBzh4zG4U3AZnoeW7sIb5s9EE3CtGLzN8zzltmHycT9STT425L0WBGn3csvMYU8aEDmyXOtv1YXAYARSCZWHr/kQVb32oTpxN5MUInpuFxilfNNRYHAkKpwoUOYt+MgrhuNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615201; c=relaxed/simple;
	bh=JxPwV9RN/TrvkttuKLa/6dUXo2D0QhD01ILVdfvCR9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5QxOuI/yzmkCTEhxGBh1mc7x7idwJYhVQzpyBzFHjD3f9j8fLDDM53kRvameFZPwzHmhC0H55nAY9neUifulDWhJtjQkae0NfVmDx+W8kcKk/7uIc8oWSFLKulWPZ7XOh+A0ahxbgeoD5LH54eKtD6oS9KU5S/yb3acRr14zjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLiAfY/3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so481785866b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745615198; x=1746219998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hJSViueIlkywPb1dDkM+tOQg3Rq/RtJifu7KCMpkkjw=;
        b=SLiAfY/3zy/nBvPh2AwEot8ZjqvAlLgo59CcRUdC/ajyNpQkyhbgYWdhdnzNeDg6so
         YABYDKbJ9udeaPnO2y9lNYEenGGFpXXcn0Ba+8P+NqP+2Sd0O7Smo+OXE7ivtgzLDMcN
         9DMyI5okiZluoHvR/Glxpm2kEO2sQUFqubGR9ZOSb87ZSyJfuFQEqz+3tJKn9nt6VNwe
         UT+OvMkUBtQw0sQSM4KAD5RTD5f8+14OFao3Y8hbjsqygPeVnP+EPtZMqeZE7RGzy69S
         kznm5NR8YVJd1zC/m0S6b+82rWhLjKuL8aB0p0alOYXP8tNtUtioRUMtb6KGEvSBdwTo
         GCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615198; x=1746219998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hJSViueIlkywPb1dDkM+tOQg3Rq/RtJifu7KCMpkkjw=;
        b=A2xZYymWPpjbpcCmqqQKzesT+tSHSUH1fcG23M37Xgt1rlPk8nKwbyiipQTGSasuZ6
         X9baiuE1XRk+zNdZwz0m3Zz1EXW3Q8SkOtvGjH7hs5XsvJfMeFu1E8rx4xZP8/UQGpLv
         9hsvgMBxfClCxdg3oqftuSCpyJBCMN9i/HBOK0BnbG7adXaepjWEWW6zLH3JeAs+cjr7
         eDybwOGtYeaRkMjwzmxy2T79gAJyys9JRDc8JYhVh34BANPWsxND3WOsr20AGewbOMu0
         NIXRtCSLX7jBdDrbaaTsoa4itnGp+alTzpMuULWHSmBiih5ZbqEMP6jhsK1MIVuFTFpQ
         TuiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGYgDezFfNfqKt6nKSGLui6lYofvUi9Ejd/wm0VGukFZGJYo6/uB2DOcoNT2wq3LNUSjliu+smhc62Qn0h@vger.kernel.org
X-Gm-Message-State: AOJu0YxsTM3rgQu5IVKKaTpCqPND2tJCWDOAiiE7XmOpZb0TH38TMU+9
	taHiEQ8sNL8WhuOEQtdhyoQ0wqWDyna4vy5jVBBXDautgrAYtz2F4vmNNxDjLr0=
X-Gm-Gg: ASbGncv2NbtNldNAUvsryYsbiTN90k1z7PNyy0t0G3CXJrG2cuPenUZmlWmqG9wdRVJ
	SPLm5IIoxvWjEATjy6kw2FcRj+yVfmjhgN0kbH0RwiWYqXYQqYJqsK/t4X8cGJ9e8tiwz3CPhdB
	q/XgrFnS/zYrUjRzpaCdyfWLGAhFs43aT+weNm9B/JpfWOboLAt0LSbd2QZhblZYH3haG1kkBGN
	9GP1ubM7iItaXRDPWX1c1tCqJWYieI5dEvkcITRxep6HouXiK3eGUBvxJlgJXJXHl2wvsZL8RWA
	aEZTPTESH3g5LY135Xv3foAyHvAcChhQvloDqLfRG8PRF228qxc1AJYV6cakmHU1IDir42+Khv5
	lluXTDg==
X-Google-Smtp-Source: AGHT+IGoNP03/XEhQmgiGugXT7Kubo8eKyImPsEDnz3PTHi9TCSVIYUFM2j7d3vzwbsmvsEDl1RFXw==
X-Received: by 2002:a17:907:720d:b0:ac7:eb12:dc69 with SMTP id a640c23a62f3a-ace7110bb7emr383246566b.28.1745615198360;
        Fri, 25 Apr 2025 14:06:38 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf9a47sm190854466b.104.2025.04.25.14.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:06:37 -0700 (PDT)
Message-ID: <6841b51f-a4f6-452a-b5f4-c018ac2ec94b@linaro.org>
Date: Fri, 25 Apr 2025 22:06:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: x1e80100-crd: Define RGB sensor
 for cci1_i2c1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
 <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-3fd4124cf35a@linaro.org>
 <d0b3a631-e75b-47c7-a98c-6158507f1148@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d0b3a631-e75b-47c7-a98c-6158507f1148@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 22:01, Konrad Dybcio wrote:
>> +		orientation = <0>; /* front facing */
> This most definitely needs a dt binding definition instead of a comment

That's standard somewhere.

But now that you mention it, it should be a define not an integer.

---
bod

