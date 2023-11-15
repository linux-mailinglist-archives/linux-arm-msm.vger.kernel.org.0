Return-Path: <linux-arm-msm+bounces-701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D547EC4E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 15:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B616EB209E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 14:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E7728DB0;
	Wed, 15 Nov 2023 14:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D0+z8kmC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874A7286B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 14:16:16 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F01FE1
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 06:16:15 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32db188e254so4270261f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 06:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700057773; x=1700662573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBcMwoRIYgF7VaZgnHonAhLO4GBcpIaX6rYlfahtvy4=;
        b=D0+z8kmC1IQws8+I4rD2ln/A6dI39UgDLzsIfBiPycrrWmwRRNyKrka+cyO+PO8xFg
         y+u+K7sYIJSBXceRVPlrRmErzZpWs+DmJssyryxPMknj1nDk8g7paz83c0/Sa4y0brKt
         omFtnFa8fOOlUf5iVqBbZXsLWWVtcU+geQ+3nd0cox1kClfKniy7lAgKjvnpSh141ieB
         1vE+LUUe93Hakw1dUq5AHRz1uTsy4BHofxvSyPdIfz8wnVFxzPRRIxcsagXgDs5Fnq/H
         RG7mZgFzoaT4mnD1i+5lv4GowtpGl9/GjGJTlIvx9wuCHaYYQOQICgrxhYe+i3s6tqDE
         7OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700057773; x=1700662573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBcMwoRIYgF7VaZgnHonAhLO4GBcpIaX6rYlfahtvy4=;
        b=rMchO7gE3umh2/W9Th+mGe1uAHyiE72/Fkft2YeS6sF4oRoBIBhILQJOhs3j7CoVnC
         KtygOrUTy55/ZvZpuOqoWT+5Ru8lDpI0hmF6Wb8loosjpHnfAe9Lr/nnX+qsWyojtjh3
         7RjfpmsWk95N56kwgnUOSnzuERSylt+kq0DCKQ1hBgJTYzHAY0uSkStZPyAVh06q4eHg
         5CnYqggJbtz7AZH6lumwbqQWQuPFid0xdV2hK0dG6T2Gsgq3onwqoYMkZAAoCAiKDWHm
         kE+woB7xKSzGhKKA3wqlyNEeKQJQ/8HWhfm/R4srtBB/ogRfh5KvriR07hRVkhOEbU3Z
         85sg==
X-Gm-Message-State: AOJu0YwRi+W35ML5wxxfQc70K4smW5JBvBoSAeqQqkFThCPS39+/dM09
	J49FZ8Cy9pmbq7oU9EcEMUpBiQ==
X-Google-Smtp-Source: AGHT+IHvijU7pyOmo0swcg34eZbJxraA9K0BAbfHw5NkUncOdyQJ0MA3ElGKy7jpzCrcHPoaz3gtuQ==
X-Received: by 2002:a5d:47ce:0:b0:32f:8248:e00 with SMTP id o14-20020a5d47ce000000b0032f82480e00mr10840801wrc.51.1700057773587;
        Wed, 15 Nov 2023 06:16:13 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id dl3-20020a0560000b8300b0032f79e55eb8sm10659407wrb.16.2023.11.15.06.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 06:16:12 -0800 (PST)
Message-ID: <5cd19f5e-baa6-47da-8730-fe0ddedff364@linaro.org>
Date: Wed, 15 Nov 2023 14:16:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq6018: add QUP5 I2C node
Content-Language: en-US
To: Legale Legale <legale.legale@gmail.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CACDmYyf4hxbuw+cpKqEDnqmHpS9yPXuE5MPD5_XZ3hjmYuViUQ@mail.gmail.com>
 <a3e35d3b-906a-4540-924c-0103cf32efa4@linaro.org>
 <CACDmYydnLQd0n9ACnTQ6P4wYf38eMzokyHrF7r6LisG4oTFtyg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CACDmYydnLQd0n9ACnTQ6P4wYf38eMzokyHrF7r6LisG4oTFtyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/11/2023 13:58, Legale Legale wrote:
> + reg = <0x078ba000 0x600>;

This still doesn't look right.

---
bod

