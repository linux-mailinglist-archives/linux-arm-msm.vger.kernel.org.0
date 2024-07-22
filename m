Return-Path: <linux-arm-msm+bounces-26791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E76938DA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC5B71C211F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A195716C86A;
	Mon, 22 Jul 2024 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aEq/s2Fy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B3E16C87D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721645228; cv=none; b=eq7nN7BiT/6QYO+NthBKSTgcqBFZCpvtrgn4Z+1kbwRI5tB0Jj1CBzHIxIuFCJuNT8Hr59WZkL/fORVQKA+YeARXcorPKav2KCPGcgmyBe1+ofVSMtdQLRAQKnbbcfT3DpzENOQjMnOKB6rO78DEHSJizq4f9aC0M7USzwjeyeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721645228; c=relaxed/simple;
	bh=hF6ayJCJkIBKijeaBFULRdN6VNY2DaemcsN3XyDmXGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XUPIf9H2poDuSx2WJ+jkvJuBXR8kKSi5VBsjIA6OQ60szDDXKQh8Cg7EK4OzU6XENaTZmiq5r3EPHsMGNxKCD+S9ozRolPH7oGJJGMQGpIJ5tgKQd13Q77aAcQfsSJ3RWw5NydM7g/TmlQh/AaMhn7EJgFsy7byoq01cQMX0XW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aEq/s2Fy; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a1337cfbb5so3586531a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721645225; x=1722250025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0GHq2/UdLxU9Y0D4l+QGu4ETbrx8HO0wX8xQZ/agm08=;
        b=aEq/s2Fyxod6cWFLjnbpiS8SclNhhwGKmeDfZuFFBZwAXwN+hEP/ZWhaAE2Rft1X/h
         ru8GRf3xHbiSEi/xBY0gILVwBfZWNK5O5fHbNnrHuPQbEffzQ6CaPxQCH4Det+eUQXus
         16Zdx1UgZkYqtzEkuV5JonxiMRb8pSl2N6RkbTFijGUvs5Wr9FByu8kTW92k+otK1i7b
         S+Yc+cbwOv31Y2nOJT0/DwBDNHL0iEwkEQbU9nDL/hN0JwghN4vMg39myJJg84BCoR5m
         1jBlgUb0gazua+nb9BOjP68lBoW9I1lJzsr6tdMPEqT4aFP/NnNOrNTNbgHOZ0uOWgPz
         u5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721645225; x=1722250025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GHq2/UdLxU9Y0D4l+QGu4ETbrx8HO0wX8xQZ/agm08=;
        b=ObnOqcR8V3q+NLhCtL+XgiuCEgPESfJBPJn7LtIEPlVBTyRoJtnPIFNsWGAENArR5r
         xItkFPmJ8duvXpB8Ffj8x6/VV+4q3d58FYpXP/xte6g0FkwJEgPRHScYYIPkw/nAAjc6
         Be9wcMeYK3W74nHbGygvqp37WY+KpClQ4Bxya/mvB+48JNMCB56dRNmijcQiov4XLW6W
         He9vbn/ds1EnpTZmDLzCACwdOP5DyZLzjOYujXyaJ044WY0rRqo8Ebp2PFIKUl8sdOAE
         vI85W0W90oVm7eVt+bFsY3VPgteFmXr/RP73W2BvYcpX1rtUAA8LSyt9Opn1KePrLLAr
         09/w==
X-Forwarded-Encrypted: i=1; AJvYcCUS+AwobNgqZaaJXMccJhWziwZzJQ8F24qxdxsglgejSJ5cuMnxvhWdCiQyDunNhK2vb86FeGUq465VS2SngAD4cAU9LUX7YeXJ9UlEHw==
X-Gm-Message-State: AOJu0YwlQYtq4IestVDr0pW04/Aw8ssHyNqm5mRAjt9I7spB4V8pUtB9
	cnZScqvhIPPDB1nDjkfaYUx3QCebuTq+Hnd548U74P/fO+/se79XbQ8rZj9U348=
X-Google-Smtp-Source: AGHT+IFaZ8NoZLu7yBEkVtDAIhC7XEeJ2YCA6hIW9sNo3VVvtI5shChc5IkB0TnPYYlhXNZDTyxiPA==
X-Received: by 2002:a17:907:86a7:b0:a77:deb2:8af2 with SMTP id a640c23a62f3a-a7a4c011cbemr441422566b.16.1721645224954;
        Mon, 22 Jul 2024 03:47:04 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c950ff7sm408118466b.224.2024.07.22.03.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 03:47:04 -0700 (PDT)
Message-ID: <e13ad261-beff-49c0-b838-8d32ef4042ce@linaro.org>
Date: Mon, 22 Jul 2024 12:47:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] arm64: dts: qcom: sm6115-pro1x: Enable remoteprocs
To: Dang Huynh <danct12@riseup.net>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
 <20240722-qx1050-feature-expansion-v1-11-c4d486435b96@riseup.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240722-qx1050-feature-expansion-v1-11-c4d486435b96@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 9:10 AM, Dang Huynh wrote:
> Enable [A,C]DSP and MPSS remote processor on this device.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

