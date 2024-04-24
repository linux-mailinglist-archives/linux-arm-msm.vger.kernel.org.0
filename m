Return-Path: <linux-arm-msm+bounces-18365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A2B8AFD5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 02:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A50191C21A63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 00:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842492CAB;
	Wed, 24 Apr 2024 00:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="id1f8PQ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59E623D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 00:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713918790; cv=none; b=OeIcniGWqj7YVCsr7f9vPCb/jdkLSMgXbP3W8kYKRIDJ3sWJ0wJduAzBLGGdzJE/4W0q0PgXRI8btYLQ5Ssc16TZ5a6HhuN/rHqfi32jtPE3ibod7awS5r1rgCFLLp0PiMWDPDXnbtuJ8N5jQBE9Jc0MIK+TYz8I8RVgkI1+GhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713918790; c=relaxed/simple;
	bh=Mo7bjGpzxsYhfjYB2S4ea4wGb0qUxaw55QtRpB9qplQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7Rt75LP7KpmwkN4pvYAYed55hc9VVkjP1cYgjb8+xKjyd7rlLEb5+V7hKPEqgkltznQv3pSNwyo9QBKhPcV5hj1p9wmqRFAwv9fNnnYh23qvHhqKmyVRW47nPPfciG1s8UiBX+idOuU/wrkhI1Q9KdmYTRlsNDOSdRaD78iYDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=id1f8PQ7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41af6701806so2404665e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 17:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713918787; x=1714523587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAKaM/NAWXKicFPhL4rUq1IF2FcJrJKZl2BaiGpi3IU=;
        b=id1f8PQ7U9b69+jHbN16kEawsHi8wf+s/SoFMJI1bFJUX4NzIh83B8mMINbDG2ZIA8
         YcdD6kMNirO3D6qikWjHFS2ScDzsunXYOwJzKULll2SeUc7JQ+s9WVdcGJl113LyScPE
         Huy0Z7vZisAcwfGAfpyl9hftC/rNK2YS3WEZxkUB7l0gAclm5IOXTgA8AjxYxNG1Ug6E
         Y/C+gepdpvBIzctEMmgafABzQSD486SkKzjJeb7ZVZWzG3a/pjj9mrafPzooZ4Mkk5jq
         MSV5W0lTrYMUgmiZYE5nyZenhQrOj0SjN1SSZNsR8UpX31jG9h7OxON4Jo9hUE73J1+0
         kc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713918787; x=1714523587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAKaM/NAWXKicFPhL4rUq1IF2FcJrJKZl2BaiGpi3IU=;
        b=vGgqPMB4G361TeB3XbmW4AltcrDSqOFZZR/hy+wzUXW6H1hzRTka5ZO33apNoVqXpu
         DMU8ojkCoTygA5IMNLsFyhUlOPjhGIvQ1gR14asQ0XhucIAdPAsyj27EkGuuqWgOIvbD
         +PBQVi/1AdffqfY2f178VAJ2omt1TCR4gW2x3y2SXbyzjusKEs3YemxqwB83cgE9/9jJ
         kaAlXstLqRn7tYzHVdnIfNC92lq9enSmbWnGiUPkSbhnWkNS38G9+WKy01kV4YhkbNbw
         6OFMf2wO0s2JLzVJJnFYUJmTLVzIuwCICD5kTkng+FcZEPvhemI545SLJiJgpI1kMOe/
         237w==
X-Forwarded-Encrypted: i=1; AJvYcCXaBa/PBnhfg7Df17bNgZO+UFCNToo0mZh0PA1CQgBz6y+DKiVcmHdaoOwAqMQxdXw9VNPyakUCOzjhl/sdA3LSLN6junAnkNp0y8xugQ==
X-Gm-Message-State: AOJu0YzvLDFgAX6gly994cE0IDDjQMoS0Pao/KlGGiYYEmgFoAEU3Bms
	ZSkJt3nYnlPbAhghOA/0WHZONrecUifMHek0Pvx9kqPcJ7/i0fXU/iHnG5etvnQ=
X-Google-Smtp-Source: AGHT+IFpAjfvCMf26JCAyQ5PFNYY2hVGBw6cp6y6VxWiiNczw8dNRnHz2uy0fv9wzBVTrkaJALFJgg==
X-Received: by 2002:a05:600c:450a:b0:41a:e5f5:9a4a with SMTP id t10-20020a05600c450a00b0041ae5f59a4amr595896wmo.9.1713918787285;
        Tue, 23 Apr 2024 17:33:07 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id i13-20020a05600c354d00b00419fba938d8sm13247121wmq.27.2024.04.23.17.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 17:33:06 -0700 (PDT)
Message-ID: <d03b86d4-2995-4f51-b0d0-08400a12ea0c@linaro.org>
Date: Wed, 24 Apr 2024 01:33:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/19] media: venus: core: Define a pointer to
 core->res
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
 <20230911-topic-mars-v3-14-79f23b81c261@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230911-topic-mars-v3-14-79f23b81c261@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2024 18:08, Konrad Dybcio wrote:
> To make the code more concise, define a new variable 'res' pointing to
> the abundantly referenced core->res.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


