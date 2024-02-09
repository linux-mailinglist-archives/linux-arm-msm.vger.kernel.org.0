Return-Path: <linux-arm-msm+bounces-10333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 552CA84F531
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 13:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88B671C21479
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 12:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96DF2E847;
	Fri,  9 Feb 2024 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRo80Z20"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6AC37155
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707481925; cv=none; b=WpcsYTi8JNJUxbjo+Ly72Wy16oFX9GfNxIK9Rkkt8EaHb6G9/xQDdZZ1PSY1QA2IfvhYKbzvBrcF9W8QfRTvbSbbqrZTcrCig/HXLX2iSk7F8iLKfpTf3jtYfOWkkZDq5Jr1P4L5yqa4guN8hXqUIbNb8sMlif64WlmSbBWyGg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707481925; c=relaxed/simple;
	bh=vuzeVL8ENhRaU0enciWl9Devo54cDMBpxGGadOWRB6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FqmlmkmOQbbY4Tn+7jOJmIx8CtCteYZuiA4MvZaQ1/i51oea/Fy33FHX+Glve8DwkcWSbUMLOulRVmun9Hqq7+MheS3b7RB298MtpsWQD2eoXrh2RkFO2ZdLkSYfiO8uNPGqMT9N/yqmR3xpBfGOaZWSvvYmIXH6IMPuXDTedlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRo80Z20; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3122b70439so105483266b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 04:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707481922; x=1708086722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Or+7TV33UjjLnzKrdJHHM1U4dB+jQLRVi5nUD3I/5qk=;
        b=mRo80Z20qPeOemXXDzgc9rhxW6fzRqXIKTNTsMtlSyWgvZxiOJPJO+F+PijuiCpnbk
         jOPK2LQd/eQMr4Eia43AVtrjvZfWT3LLJIKmZHE5GiezyF72LnF/o7zHVOP+iS0+ykZ2
         6cq9m7JtwG3RjkRzPeVBzYoofkz5WvrFkLMFIi4rf8OiEhmECWHpkxM2O4K3ia5wtQuu
         AmOX3mMi0G3pcbXQENX6i94z4rKOpLxKFwKmNvZFghI4PaW6oILgnmeWKmKwVOnvS6lc
         yJfd1nPAdJsbZ7Fgq6MbIIT6VKRBnnyxVs2JTnhjJMavobn7z+7WCQT1z9SCEZXDA4a2
         ddNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707481922; x=1708086722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Or+7TV33UjjLnzKrdJHHM1U4dB+jQLRVi5nUD3I/5qk=;
        b=BZUFhUif1e+GyetHbMlSZBOuy80bIQ0p/54e3s//2j/YlopqyLP6oSpFLf/0NuzjmA
         qVhCtb0AWG3ehvcz4nUmP2EN4v8BA24K/ZiLqO/hls/Zb3Z0xSTbwsNV27ssciGpfGNl
         IJ+OTIfH22qIlweR2g1wuNNWY6FEQMQd5z2Vf39CgQ8RmIGkndU4+xav4P+GgJwLaOAb
         Mf8bKpDhrHOgx59qnnwip81q1Up1TsKkVzuAyEj2XTLn9kERmTIJVE+uvTyXCgyMY9Ii
         KpKxzLU5MGgmEHwEw3Q4lsDyFYOBRkoQFrWFCqoQE/+vApMQ33qEpLcpHIamRBivfLJu
         mdBg==
X-Gm-Message-State: AOJu0YwdGSbZzBrG2Un/oHNVscLQSb28At0EPokJb1+vNNwigVJn613M
	TXJLviug8o8kkBOCvgAxJzo9ZT95IfRI8ZPqWyIskm5aigdAJJb7uC2aq6/30G0=
X-Google-Smtp-Source: AGHT+IEj752jsa1mlfenpseUAJ3Dy+D08f0ucMRiMLkgNgZPgadQnjiwhwFQMn4/JVjeBV0AQ8fYvw==
X-Received: by 2002:a17:907:175e:b0:a38:984e:2e5a with SMTP id lf30-20020a170907175e00b00a38984e2e5amr1103863ejc.33.1707481922377;
        Fri, 09 Feb 2024 04:32:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPWizAxbPQghB/0XjNG9xvU9op6+8x2fIZERWVKdSmy1YWH4cND3733FPafW3b+GXFlR4wI2jCFyHJ8BTZqd5fIByEpOFUd15UyBXvydGs/L0zDoRpHnSVG3HyjN3xutvszptxt+N305dGkaiQKWmD+VuQBspNkbt/MS+jIH6Y3DG/0XfaN3iFcXaan8lVWoq873bZxIJl+BE3M60l5+L62zqBxK5GJw2Ot1tnWy8=
Received: from [192.168.1.116] (abyl12.neoplus.adsl.tpnet.pl. [83.9.31.12])
        by smtp.gmail.com with ESMTPSA id cw3-20020a170907160300b00a381ca0e589sm717897ejd.22.2024.02.09.04.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 04:32:01 -0800 (PST)
Message-ID: <d0133a63-51bb-41e9-826e-61495fef419c@linaro.org>
Date: Fri, 9 Feb 2024 13:31:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] interconnect: qcom: constify things
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240208105056.128448-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240208105056.128448-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/8/24 11:50, Krzysztof Kozlowski wrote:
> Still some things were left non-const.
> 

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

