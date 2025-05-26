Return-Path: <linux-arm-msm+bounces-59389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DAEAC3B48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 10:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C718416563D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 08:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182F71EBFF7;
	Mon, 26 May 2025 08:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sd/xVPxS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B23F1EB5C9
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 08:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247185; cv=none; b=fOJCtAfalE2zYTcfuAVvwrX/SdN9bJqaGurzQeBi9eyiYCQk5ktMcg4kxMlM3uaNy5ZDpMvzdjKzDQynBgVce08JxXnitDqn/5L+sjJ9GKcyfU2dFf7Dzc5ca6eesPAqhccedanuvi261kMZLhAyjr3pm0aWk+UU3oQzg62OCDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247185; c=relaxed/simple;
	bh=6dMenWW9G9+jrd7FF1PAJg9qND6VwFxBlkOpgHYc29k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPQdPSXJFpTGf0dq03h0hOil4T+JFnNqnSAZ+Xyx5NCW7FNXtwNBjjzlstygeCS28Sj48+CAv5Et1I9G15TIM4daBZv1koti9a8ahGOkDnXo74LZIDErdtYuINr+Aw7b8DKoVGmnwebJzNVSqBO0qQWPSleZfe0ZqdtV1tC7pOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sd/xVPxS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a375888297so1266885f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 01:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748247182; x=1748851982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6dMenWW9G9+jrd7FF1PAJg9qND6VwFxBlkOpgHYc29k=;
        b=sd/xVPxSFGLvyz7LKqDzLZhGNXqoFKu7+ucNEgIKbRH+1hyeArcNCT1OW9VoVAOgBs
         N/xwIHI8Ch9pwVEFXW7ipYS2B6ri0EWCAw4eUNQCZGZQz809wf5ucyl3k0yJPnJ60uFo
         t04t3MssAPXRXu35rdMAM0bEhCNAFcR6UEKyugHhiw1Moj/5ERABN5JpgQ5P/kBoqVje
         kVfyYvo9hg+JBhpNO+WvIx2svOYPVRaVZHRrU2QL+WF3ThXMTxyPep05ZVx2jXT+CTjV
         HwL3+eQ1LDI/KNT+390leRj+lzUY6oj7Q6JTALTzmUvoJAGe3uj1V1OxNq7Mirv0aHCc
         fUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748247182; x=1748851982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6dMenWW9G9+jrd7FF1PAJg9qND6VwFxBlkOpgHYc29k=;
        b=VV6i9XDiVM3YXYTHNxTaQJHr2IZaYdTftfNTiVgp6JavEbgbmy18iy1UqSvlVT8fzW
         lO8ksjWTz29Tn+S3227HPbG2xHOzjp69NRdz81zAwcscwL+rV+6SjSnjS9HMSk0kTvO6
         fOKoNntbjWTuMMXv9kMIZO8HmMymgQH6u3/pLKzzForHRlUs0P3XY1AFDE1CQfTHDfqj
         FsY2zNp7RGxy3313e1cCgMTm7ODC99aSvS7IX7SJTa7m9dVZhkavov5VCOz0kEb22ofL
         gzhGNGbfSvvEGZCcKZsuiI34L3GVoLNMZITzeWCN3WWuPMlTHzkNsX9XvB2hH1wHkGXL
         PoRg==
X-Forwarded-Encrypted: i=1; AJvYcCXY26ruY+m5kPWap5yOQZqXnGWieLGuYpDvfLPVjeO1tiAkyyHvtaDD2D/9g2CuPNKviZAWmaJOOuRC3qJ1@vger.kernel.org
X-Gm-Message-State: AOJu0YwGDY/ecnxdFxOponhcm6TegwjBI3Noj+WYte/4gbjCk7PGoZA9
	pvePk91bscfM/WfH11pLRf82IFAnPaDnyKHQUs/1IZB0S61jJpZEqvNzU3OZWctYH5Y=
X-Gm-Gg: ASbGncuRcFTqb7pGy3YytkHFbTTkRRniMuOG0JB0aMo4817sL8zwaC8zk4fq3dvv9AU
	APcUdHnyzoG2mYD0ot7RX4hvw5gvUnK+vGJvrrzr471W6lyvqLrJzg8tJsO+TOORTWE56RIxspK
	D/CnQbxCpoBhr2QigTUvpYQTLX40p6kNWiZgagcR2tDq4KpWBVZiyFedwuwiO4Gss35uNVHMo0j
	8GFWQgCF5UAwybTYNloiHdQlWuLxwoRwb8MkESARR5a1lhYT2WQDltyMehlKwW7CfIHiWbuQsUU
	JkaOn8/oWD1qwI7ayJ7GsspwLdBCIV23RkwWNz00o5wjkc5LM9/UE2xwg6vRrZK6+0eo0YK4lmX
	rJwHZzxoQ3pNCkoLE
X-Google-Smtp-Source: AGHT+IHGSsVUmWj3Jah1vKvr6sQDWVSDBSGyOlSKcnIVvmpIKC/Y46McYZjwHULPKpThDtSFgrrx3Q==
X-Received: by 2002:a05:6000:1acb:b0:3a3:6434:5d34 with SMTP id ffacd0b85a97d-3a4ca413eafmr6970418f8f.17.1748247182279;
        Mon, 26 May 2025 01:13:02 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d8ea9520sm2349448f8f.70.2025.05.26.01.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 01:13:01 -0700 (PDT)
Message-ID: <e8750bc1-11ab-480c-a0fb-262ff6a0dd22@linaro.org>
Date: Mon, 26 May 2025 09:13:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: qcom: camss: vfe: Add VBIF setting support
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/05/2025 20:25, Vincent Knecht via B4 Relay wrote:
> +void vfe_vbif_reg_write(struct vfe_device *vfe, u32 reg, u32 val);

write_reg() / read_reg()

---
bod

