Return-Path: <linux-arm-msm+bounces-77592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B072DBE3C84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 15:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30C611A67BFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 13:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAC4339B53;
	Thu, 16 Oct 2025 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r+LOjHf7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA28339B5C
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622204; cv=none; b=Lyx5Ci2LOsgdRzE4kz2U191n7DE2LUTUgPO8GRwpH4qrOlidRMTfU5ZaZ+cZoI73Y/Fd5MislkTYdvkiW1Tav6UNOPsVJrkB54c6PaPMHqY6kJWCS3fFEQy7EDHC8o2URY863UTdskh5dBrOAVUd8rLPL3Beyi/yWOF+7j9k3o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622204; c=relaxed/simple;
	bh=5TrM2ZnN+9KpKLJvqPFL6c5/oivBrxMunFTU+lMblU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYiDPtUIq9eEg6FniEDx5F1cRKhQO0EStqD0xl5J9re+uVCVchVtSsc6XkxBlmxQ+sH/hwm+5Obq+oDuwQjwq6+9N2OG2lxJQd6DIep7eItlqYfQLfDP4Rj4DsRguKVJlpnf4HKSZ8ql+u91qqGcRXj4H9SKNbFIvX4xRogkS1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r+LOjHf7; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4060b4b1200so689477f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760622200; x=1761227000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c2QdJEetTz7G8fczLPIsJNR1ytZ7zxdk7c3bXt/pSJY=;
        b=r+LOjHf7pwr59oo3WRMdZf3j8lvlyO8FgSr3/2+6Mw8WxHeHztRJux9Ut5UPrLeARU
         ogVoFzBV/bNZ9Vqmd1WP2EioPbjqepd7d+8JViKlIMD6xdB2q57vs5KKA7lRpbyVbdw3
         kIKV8ZzsrxwCyJ6NlBZUJGNZlSFhJc/BvORhUGgG61nVR+cr/OEiWJF79MpIwpB5GnSG
         VQ9Vp+5DJl7y/52o5awShKqKSfPMmcj86QBE/3qiLv+egPs4MyYBe75P29DEl9uqkJuP
         P7ZPols/3YgDj9Z7tsm3HmA0ESDAz7/L60rCob5Z/QgBF/RnuAY7n8GrMn2XJmpt9CeX
         5RQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760622200; x=1761227000;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2QdJEetTz7G8fczLPIsJNR1ytZ7zxdk7c3bXt/pSJY=;
        b=CX0KbteK4Hjuwsdy5rEjBVwaMA+srv2XbvrXbUIrTYiop/7R2QZPFXsaRkyBVWw8GT
         g92IXdM8YTLiEO7p3gwuvNO5c1z0A7kWTPHAKJFuyaVy5Pgx0h6s0qgBeujT//fG4e95
         rVDC4LgNOMziV42ni2zUebuDaUolCRi/trTJwWvaqMqdqKLYOoCXpRAL1bsDr/V+sbbd
         Ms6fol/cqfXYhZen3xuL7G4MQVFMvhBWm0HXL/QPfh6BfdB2E7ZjXVqkCM+qdLLotEW0
         dVdfucGBakneyJ75qem2u69oR9pOB1vV6yzblvmbIJNodLJliNnnQQvwjw8K/QYs4taI
         H4tw==
X-Forwarded-Encrypted: i=1; AJvYcCWvX6f5H1ydYfFBUYrHtoIzXmBoKtrGBuVyKsctnTue9/2YLs8qo71lRTiJrD/bLE8zD2JNx6y5ylUb00Io@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3qhoaYy3yhLc2n4VVOisivHY6FDqvDHauexMS8mC2ZDCJvSyB
	TJIv63aIMheUSb39w1z4zMi30+EwBBciONq2uy0OLmdwQ/Iqb/OMnbHfbaBlsmZXgPE=
X-Gm-Gg: ASbGnctIhciGbImen6i62GUpEQ5963NYqrTY7QiZ9Y/6LEN+wxUrQ939My8zRqioOZf
	dAd6whcBBIVI+pTRs0yg9StuJTahXq5qvr4t650wEZeOqOGc0GgWWugxJAXyPLJ8UfTW66r/X2/
	etAtNXNBWQm78HInOUqvFfIIZNozurIqH70Yh8zktBStCgsT+LjFSyqJ+LSBd29NGQsfRCncGPl
	4ryit5oI5xArc8DRETlXvbrPSicxJzmR/cLrVhGQCxVYqMYBbj/LDDqa/D+COWmq7PtQ0//m74+
	MSliG5mHaW018OkhNZxjHKED0gxFP+w1gWWsmD4wz4o8BNls9GRyAmCy6an5RaJUEPWJiA7auYm
	ef6MEJBjGXeIJ6CSMReWRvZI7kchOQN8JBNFy2h1t+ezfRp67zZHtVI3pJCMznXSzUyak7CwSDw
	emOxnkTOZTJLhhNPkodFFViaOfg6+/WxJdk0tktEblum8QYf7EQ87PJp2o
X-Google-Smtp-Source: AGHT+IFS4bL1OHrvlJ7NauXkhXRppJ+gq5qkliJnQbz4dYw/SqTcv90p5EoSsU8V1stfZIXijs5KTg==
X-Received: by 2002:a5d:5f46:0:b0:3eb:4e88:585 with SMTP id ffacd0b85a97d-42704d966ddmr122992f8f.29.1760622200498;
        Thu, 16 Oct 2025 06:43:20 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47114461debsm31418275e9.18.2025.10.16.06.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:43:20 -0700 (PDT)
Message-ID: <e7469a02-1159-472c-811f-2004fa7b8c64@linaro.org>
Date: Thu, 16 Oct 2025 14:43:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
 <84f17b74-a3ea-46bd-a6d4-efa79c1cb43a@linaro.org>
 <e0e0fa36-b75f-4d04-b179-772fa4b9d10c@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <e0e0fa36-b75f-4d04-b179-772fa4b9d10c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2025 13:04, Nihal Kumar Gupta wrote:
> I assume you're referring to update s/lemans/Lemans
> 
> Codename for QCS8775P SoC corresponds to Lemans while QCS8300 SoC corresponds to Monaco
> 
> https://lore.kernel.org/all/20250923-rename-dts- 
> v1-0-21888b68c781@oss.qualcomm.com/ 
> Following the above change,  I will update the commit message from
> "Qualcomm QCS8300 SoC contains 3 Camera.. " to "Monaco contains three Camera .."

Eh you're right "Lemans" is incidental, you're comparing to not 
declaring "this is".

Seems not really worth updated text in that context. Feel free to ignore.

---
bod

