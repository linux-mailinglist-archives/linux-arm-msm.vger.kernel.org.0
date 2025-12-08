Return-Path: <linux-arm-msm+bounces-84712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D54ECAE2A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 21:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A12B3034A0F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 20:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D1C1F30A9;
	Mon,  8 Dec 2025 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDf4WUwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750FA1A9FA7
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765225827; cv=none; b=NCtfR1tkC4bGNsJ1YxOBVwUVhSXiBSVsJAvVI4XMMlPNmjWOnX4TQ4CnMgill+RVWPrg43D520Ag/+K7WUSjQ0FsA+DOo+Zo9EH4pKg1P79jN3Q4RjziiCCemahnbITH7cbVgsrOntxN5lHA041JJi+V4s3PFeCncGXOJrrcWtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765225827; c=relaxed/simple;
	bh=4gTfSSNqg+fvlBo7JqVvlKuZT3uQYmbGh0OanIIst0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAhb1j9jh1rbPO61s1pKlTmv6+XDMc3AB+KAfY0VPThzkf8gIh0m0Vv3zdPRZYhfOk1CgR53NyGdBGTD/Pu0mGylceQMPGSmXUGcnF3n4NhEmTJzJtlf8ejCcrv6tQC09E9nV2gv7FVX3pLXNVRB4ao6nD3h/MyiFx4qcvtyMvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDf4WUwg; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34a4079cfaeso381971a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 12:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765225826; x=1765830626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hVqzapAai2jDs56ozffuGy89QQ/pBXghFLoEyD3GTBM=;
        b=oDf4WUwgGJRuZqQ2/CtTrVYwXogogPtF/dAoeHynN5Y5QEfHaq5L0SYMyXWjaHLoHq
         mC9BEjru4ve3V0whQVjf8dXGj9cd260y6U2nEv5A3Q3WWxLv1opnuafIjxRIV+lxwSlE
         +P6wTNrytlI+QrHxV8B2AU6Ae+7IcNFY30uWzpNKSP/PTAKRJWNaDUlJaudLTSgOOwji
         z+ZwG+QVoh2C4Qt/j1nHyr1vqV6ghmale/kW7SjFwYQUhdKjZd8srwhoFj6x+qB+uiNQ
         Z6qPObQWCPr2scQIK9C12ZhYuhK3snSHp9We4KOuzAXnDcipLTCTOADmHQ1EQeEWuIYk
         YieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765225826; x=1765830626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVqzapAai2jDs56ozffuGy89QQ/pBXghFLoEyD3GTBM=;
        b=ComGUuk37qaedUPNqzTAh+LNLqfdLFKrWODdpSr/shooj3uXBZd4lFFgydGPNxmQur
         wA5sY/XKvKscG3rK85DQuk+oBuzHktl4DF1YhG7ODxOsCGPL78okv9lHlXr7vLJvs8Du
         c1U1u3nTi+Lidwc0GKm8BX3AKJ0cJQukH2sYSclwgSJdRGdfzhYkxh8WZ52JptoyOiRS
         OsMNAum2JilUdQfkveVawn5Nx+8bL5hDAOIDMJ1InNR7bHUh39koTcKun711qviPOnLH
         FHql4xif8um/7kCAS4vleNhhjNmEQxQHYxeVR43W5t2pgPq8L+JoiYPtofxbJWYgsASL
         b8lA==
X-Forwarded-Encrypted: i=1; AJvYcCUPM7msZCFvecXeXCnmFalf1fFtf1JsAdhNM8S88sJ+fGKLJHg6nboD5TmDrivvDsgQf5G6wbeQf0vq4Jba@vger.kernel.org
X-Gm-Message-State: AOJu0YxFNtSV2nopunsbCcV4FJm2DvPmTHdW1zVA7uvgAjD9Vz0jEAX4
	hAqvRvFI37jXNany2yb5nT/fyX6JzR7XxU2EVHfjsHpmsau/FRA36THhcEwTfwOkRjs=
X-Gm-Gg: ASbGnctXwuZ2GKxv71akFNQh/+BEQZZU/BdbkH471pmXEmYhaSpfjLMZNWx7QRL+pav
	p1iqiqGB+et71ltWoB76r1eQgTv9aVr8SYQDIR6C/Kb3DohJRIgrQUaU9WsB6FOp+hDgYJTbGfs
	0EsQY78qFZDHpAd9/+V1xf5ewjH1cDPd5BCdtRfYooOgEagqq3uUGq7vlLXZsJs49/Cz3/Ymeed
	ThMtOkkZ9gCnwG2/bADD6d9KTnTqDDW7f69IqsmMupOWSBDiq6xAJiq4ms99dqVeDMIlxHZXHH+
	oDXhACQ/h9XEK3ENhMo8wuphCu6R/h/rgPV0kKkIRgxquK78r5rIt1AQzGxwq5lNNIQtCM84oOV
	5D5j94e+cKTdAmmf1mOxXywYS9wKX0OnZm5cP1cIlHtVVUyRc1D9AitfG+gi3W03nBaAhkRtvOM
	f/kis5KQbq+7ihwbZrvRlXOpdKa0U7nTm8w2onUKh/rGeZyA9yG27M+fReDLOKNQ==
X-Google-Smtp-Source: AGHT+IEjP0E9NwWrnpIVACYqpa/sxffjy6AzRkSkorC++ujr05swS59yo9HQ4/sJ5bqizoD9pIsRYQ==
X-Received: by 2002:a17:90b:1c03:b0:34a:e9b:26b1 with SMTP id 98e67ed59e1d1-34a0e9b2796mr3171417a91.26.1765225825562;
        Mon, 08 Dec 2025 12:30:25 -0800 (PST)
Received: from [192.168.0.178] (p96936b06.osaknt01.ap.so-net.ne.jp. [150.147.107.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a47ab9d1asm92643a91.0.2025.12.08.12.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 12:30:25 -0800 (PST)
Message-ID: <b1894dcf-4c57-449c-8cd5-8a55be780138@linaro.org>
Date: Mon, 8 Dec 2025 20:30:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com>
 <20251130-add-support-for-camss-on-kaanapali-v8-1-143a8265e6e8@oss.qualcomm.com>
 <f4d29f9b-98ce-4e57-9916-5a37927db2a7@linaro.org>
 <2tvkcuipfaa7cn7goynt6jfzlcxg2d7yvvjqizb6p7sf5oqwuj@drqiyr3khoyf>
 <dc0da45b-165c-455a-8e03-7cdd2d2d2ba0@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <dc0da45b-165c-455a-8e03-7cdd2d2d2ba0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2025 05:41, Vijay Kumar Tumati wrote:
> 
> Hi Bryan, we are addressing the things that makes sense for KNP as well 
> in the next revision. Btw, couple things like a separate CSIPHY DT node 
> and ordering of the resources (that were to be added at the end as you 
> advised), I believe are not relevant for KNP. As for the GDSC names, we 
> preferred the module name and it's GDSC name to be consistent so changed 
> the latter as well to VFE. Hope that's ok. Please let us know if you 
> would suggest any further changes to KNP v9 bindings and we can move 
> forward accordingly.

I think its reasonable to omit the CSIPHY split but the other things - 
clock names, namespace consistency with previous version should be 
maintained.

---
bod

