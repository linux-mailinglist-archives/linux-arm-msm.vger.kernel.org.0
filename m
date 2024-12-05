Return-Path: <linux-arm-msm+bounces-40549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE969E5B05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ECDC28591E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD0E21D5AC;
	Thu,  5 Dec 2024 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YcE9ZlYJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6698021D585
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733415082; cv=none; b=XE9DX5mFBmhzCxZwCPh/hfkJZskGX4vjWNwahtRgTPV6SeYWrxvAk/J62FDK5XE6Vha5rMLCsf+dT0CHb4m+I1Q7dOEd8pNjtX5eojIwE33M27cLQdyvocWwd+j3fClpURjQthEWBbvHFzNJqDSyx9Hk5/Zh/gsZglZnIw0xyeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733415082; c=relaxed/simple;
	bh=4cvbUpYGVqBA+5ai/iSMN03QRJijrW6a/ORs1SZ3FJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0dzHdeyV+GW4Blh7nhw7aQrpeUlIVFKFAzzE1xVqtT+8t9VLf+mjLA+LT1HgtoT0IEU0oBEMLpbS/lLqFXY+a/BUw4ydM0in/rkf2ablgo+MEmZcCTTZEImrOYv47vu1vSp+txbr9+CV1OoEvDWCuV8p5djui7hwDmUrOc3rys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YcE9ZlYJ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffb3cbcbe4so11333841fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733415078; x=1734019878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3vAx1ky+XubxvxkSqpCsICGxY0icdOX0ReI1Rb+eWgA=;
        b=YcE9ZlYJ0sHi+Mev5UheCnJwg1rEeLJMovhxUPe79Y/1EEybZKPKLQWA4k306pEqhw
         uLWo5AcK8+SnO1NVr2Qbinzi0dLGX4IjBWcO/Iytr8aABhvmCcyNXasFgYCRbo72ALCF
         +ZnSLYWGc3lTgeQF68uznDyYUgUUc5d3wHeugrBbNGeUZioeLbt5+8357mC/uh+iVDog
         NuZEGtKAgAA5OAWcvxQ2VhmQRdPSFpTJm/750zgkaWGzgE9+m7ZhmLTNe6X7O+ciCcGZ
         qQ3RcekS+b/QkOXlGzAzMP2FINg+dAADhhIfEcSWjwHSsL8mMKQBmuWey5ij/hWQxJo0
         xVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733415078; x=1734019878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vAx1ky+XubxvxkSqpCsICGxY0icdOX0ReI1Rb+eWgA=;
        b=F7+Rm9L3Kvg0F9jQE2J9RjaW0Ev1A/YEkoMcecnZXKZ2E2TkDh5ZZOk9d8iPjvN0xz
         CdZkVAdi1ZaLAbsVCRmr0WXIDhSFtyb1OFCeuhqXflrlFo3jALy0qywUfQr9zVH78NRk
         QQjo26bNN82izNErVjFFmDPhuH1RFIs2IEvngmMc5a324zYzlYoVM7YTCXK5fn1gjkNz
         kodEoRTc2GvmFw9WkMgI5cEEeAGUi9Fyu218LTW0MgmhqHS/J0SGi7V43HMZTEgSXZ1d
         vuf3Se/2wOhXo9TTcArkQMWLy9xYS9os5DTX/unIs9130tiGTQH67cBAGjukoH7CLjQV
         1DgA==
X-Forwarded-Encrypted: i=1; AJvYcCVzaBMgZhb7fGm3qGzZ5f4FOchyMBsPOAZ09a8xOKpk8STmuf+61mp9hKfwJ1c8wMW+MNtkxZdMNzyzAMMg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu0mt8MUQ3tuhmL064m80kwDnzNFrgR+i7mvp9GWgA6Mk89umi
	boBD69xII0bxLkfEZVebiufhgNZQSuCc5XSepJWaqswpCoSS547jNUQPTLH+6dI=
X-Gm-Gg: ASbGnctZ+tAiPrihLRYAyzPC2RjoE4EhQoJGRDaqVHjNAk1jYq++qzaM9cahiLjo8Oj
	kYLpXJQS3XNq6JQ1yeM6ydwAFUyzvvAVdGvZtIK6C5XG2rRKibHONEEhsdpGk/tUQ0hNNfa8z+8
	ljHMzGNwQDNg95XtvjpJY/r2KtVAgUB0avbLyP4vLWPNIc/G4s23a0gufHpNL64MmcHyzlVzVQ4
	t7/Xs8mmFHFqZcH1YCTDQ/A8sPSm9aOkFf0s6DkrvwMFQ5nGxDU7fe4ssfr6vA=
X-Google-Smtp-Source: AGHT+IGa6a28W61iyTDan8zO3enSWPo6CBbm0HhVWYO80g9pqx5TBN734XHJ16y+KxOFW8ykpVAjnw==
X-Received: by 2002:a05:651c:1614:b0:2fb:5a7e:5072 with SMTP id 38308e7fff4ca-30009cb184fmr75615231fa.34.1733415078119;
        Thu, 05 Dec 2024 08:11:18 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0da461sm28223735e9.20.2024.12.05.08.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:11:17 -0800 (PST)
Message-ID: <0909a2b2-089d-41f3-82e6-f0e05682ce27@linaro.org>
Date: Thu, 5 Dec 2024 16:11:16 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-12-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241205155538.250743-12-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2024 15:55, Depeng Shao wrote:
> +            iommus = <&apps_smmu 0x800 0x20>;

This iommu list looks a bit spartan.

Here's what I have for X1E:

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/9686eaf9557c386a2525d6668da6fe24ffd518c4#5b6ff684e5292a4c0b51f6a38631777fafae7561_4749_4874

Could you double check this list ?

---
bod

