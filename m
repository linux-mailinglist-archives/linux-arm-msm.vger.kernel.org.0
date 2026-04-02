Return-Path: <linux-arm-msm+bounces-101551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJSBDex3zmk6nwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 16:06:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7012838A36D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 16:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 700EA3028031
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 14:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040C2313298;
	Thu,  2 Apr 2026 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N+Ep1pJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDBC2E975E
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775138676; cv=none; b=LusSn6t4EHkd0dOpKKuYKf67DiNJcw8H1BCEIHhUJUqa+t3MD/L6sN4XYsgK89TWTHlSwzeeBKIKDCKWUBro09nvDl7yUFSDnrsvNDnX649T+UTYeNlLtNvaaxYCIc+ysKKZBxAPT49dzZMIleo/g2Ywi6fe+ax3ECx0t4ySmwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775138676; c=relaxed/simple;
	bh=DYqsTB1G0nLylS0Qpp3OlMS2cyI7ieHvhRKt3JrHusE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fNMXh2d9h2FXE8Z9/afBjapjjq8m/7qDloF7fBgA0dC8L0yhLDtm2erRl3xajvzpBaRob98Cl4aS5mxH8pJmpYz+FIjnXijG1e287r9DBPoWHvA1Eifd0F+dcFnQuv7h0UvoOna2kpZUNzNTr5Tmt4/J88lU4voxHrRl7jb/WDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N+Ep1pJ6; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e6ab06167so153720e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 07:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775138673; x=1775743473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXHc9juVfDusbv47Rd8t6OKcCNL6xA25R2o3K3JKYTw=;
        b=N+Ep1pJ6uK0KD/HH3mfxTk4+NLIO0qaWNxgpVO4nFNGFm5OB1adO5E9QjcbfSCm9Pk
         m+opQv1JraqguFzzeSjEzKe43JvEMMkWdry4Aq62qjt8ZHmCCBg+OAcOxmf3gWcoTFzt
         KhqOMaMfs8jrTTIs+EPaCxkkAt/2zCl4PDQWqI3OF4P4/UwNxfV/YVU8wlbS9YyQbwoj
         oUIijUCbp1AOTehod6hkgBSI/1wLudYlwLmeopm/2rrfEl+Eep31MWiOWSPja09+BoiD
         kjrDfbFMFZl1bpXz4SEA7XUzr2FqhkT4oo/E8Ueyrk3tw9NGvN18/YK6ZqUz6wAQfdrY
         bxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775138673; x=1775743473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lXHc9juVfDusbv47Rd8t6OKcCNL6xA25R2o3K3JKYTw=;
        b=QJZTpoQ1cCaD62gGm9LJazb2viWbyZ5C2ovF+52O42dkei6hUt7v6CjwriLkd+DY5M
         fJ9rN7N7uuAYN/6qYd8b2b/+sY+w/sn3aZMYllT1nXR+ZFS2t5P9/6hdg8pEUviA1VCh
         zhDnUepMSkoAUPuBlSfs754DbPfiLJYOncjQ8Z0CsBYI2aBz2MsgEVcK5VSIvBusqdTC
         b6TkDJoHInh2YstO9t/2+egJW7liv4vZKJaccvWBX9dofxRmHI74CtnH8BWUAHm3+0hL
         PuwYquCRzgXcMsSD5KXiJ1CSzdbQKINkr+0bo1s4LhY+qwPFUfQqD0EexgYqqpzF99xB
         MlcA==
X-Forwarded-Encrypted: i=1; AJvYcCUGyxtWt42Kce7iZVBbjr6/Ru9ePTMeo2ejtts6bnk1JG58Nqs9xOtRjoEEvPkKuFUXiTq08RNoARqSDi4h@vger.kernel.org
X-Gm-Message-State: AOJu0YyP2rtNzoNes6XGM5bG9jxssDAvBSg9Cx9ca7jkehb0oT0WV2sJ
	+HdhieCaN22IPw1vfpQRcg2WsR8A/RSC36LG50uf7X+hwfkXq6VsE8/7cTKmYzmzFUQ=
X-Gm-Gg: ATEYQzxR6zpA5+recA4eGSi7eOeWLWx9RZx0GbBHsur6ON74mXxUeCSTLtDJ3HabN53
	p4Jrjho1vq7tkWWO7/+kiZoHVLEDtVnFrRihRwWS0gNVFFkTfnrFXA3sQXQHnspXeub1d52MPG0
	KEk+8fY+DbY0YH4o7aNyzdYl3J7OYcYrR/qe+htTiugGezWMSXsFZ5OtvDIXSjfoW1na1fasdOi
	D+6hKwfxYmVAL8Ws1gIuF6GKmbDeVe/w4u/AD4SvPwp4U9npWUxw/0quW1l1ZbqWydUJeRtGjVi
	EG1FcBo5rDAMHZFtbwUwKFdrO3TgvmU5+EDiTztd0q5LEDCgu0YJRmAPoAdGw61eA5ZpRgfAxtV
	gTm8672saPQv9PtUyMIxrheWHnropW4Fb9mkQiK2Ei3zRc8w4cl2Ly8c5f5DNbTvhl5mwcbciR4
	XuPJSO9lJAz8mVoIcWQ21+IzWvyqBqbCwAZtwSvoejuiYXAlwAArNpzlkgzNv9HYOfaS4MMXdVh
	tHeKw==
X-Received: by 2002:a05:6512:31d6:b0:5a2:a82a:178 with SMTP id 2adb3069b0e04-5a2c1f03c47mr1486574e87.1.1775138673344;
        Thu, 02 Apr 2026 07:04:33 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm692953e87.62.2026.04.02.07.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 07:04:32 -0700 (PDT)
Message-ID: <7b7b0c03-3c99-4253-8c30-b8179119e6d5@linaro.org>
Date: Thu, 2 Apr 2026 17:04:31 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: camcc: Add clock controllers to Titan GDSC
 power domain
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
 <9e65a64f-b227-4107-873f-5800cc79ee21@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <9e65a64f-b227-4107-873f-5800cc79ee21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101551-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7012838A36D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jagadeesh,

thank you for review.

On 4/2/26 16:35, Jagadeesh Kona wrote:
> 
> 
> On 3/31/2026 7:31 PM, Vladimir Zapolskiy wrote:
>> Starting from Snapdragon 845 SoC CAMCC device serves as both a power
>> domain provider with a special Titan GDSC as a top power domain in
>> the hierarchy and as a clock controller, where the clock provider
>> function of the IP strictly depends on top Titan GDSC being enabled,
>> thus it makes the CAMCC clock controller to belong to Titan power domain.
>>
>> Today the formal hardware dependency between CAMCC power domain and clock
>> controller is managed by runtime PM in every CAMCC consumer device driver
>> like CAMSS and CCI, however this is terribly scalable to any future
>> CAMSS IP device drivers, and unfortunately it is not scalable at all
>> camera sensor drivers, which are also CAMCC clock controller consumers.
>>
>> The change adds an option to describe CAMCC power domain to CAMCC clock
>> controller dependency properly, therefore runtime PM management can
>> be simplified on the CAMCC client's side.
>>
>> The series touches only platforms with CAMCC drivers, which marked as ones
>> using runtime PM (see .use_rpm flag) but Kaanapali, which formally has two
>> CAMCC IPs, on the opposite end e.g. MSM8996 can not be covered by this
>> change, because camera clocks and GDSC power domain are not separated from
>> other media clocks and GDSCs.
>>
> 
> Hi Vladimir,
> 
>  From the camcc provider driver, there isn't any HW requirement of keeping the
> GDSC ON to access the CAMCC registers.

The change is not about getting access to CAMCC registers, it's about getting
access to the provided CAMCC clocks.

> From the camcc provider side, we are already taking care of camcc required
> dependencies(MM, MXC). Similarly consumer drivers need to take
> care of voting on their own dependencies(GDSC, clk).

As I've stated in the commit message, sensors do not belong to CAMCC provided
power domains, but they are CAMCC clock consumers. Access to CAMCC clocks
is broken, if the internal to CAMCC dependency is not resolved properly.

This changeset resolves it in a way, that CAMCC clock controller strictly
requires CAMCC top GDSC to operate, is it wrong? Shall CAMCC clock controller
driver vote for GDSC?

> 
>> Vladimir Zapolskiy (2):
>>    clk: qcom: common: Add option to link clock controller to power domain
>>    clk: qcom: camcc: Make Titan GDSC a power domain of clock controller
>>
>>   drivers/clk/qcom/camcc-milos.c    |  1 +
>>   drivers/clk/qcom/camcc-sm8450.c   |  1 +
>>   drivers/clk/qcom/camcc-sm8550.c   |  1 +
>>   drivers/clk/qcom/camcc-sm8650.c   |  1 +
>>   drivers/clk/qcom/camcc-sm8750.c   |  1 +
>>   drivers/clk/qcom/camcc-x1e80100.c |  1 +
>>   drivers/clk/qcom/common.c         | 16 ++++++++++++++++
>>   drivers/clk/qcom/common.h         |  1 +
>>   8 files changed, 23 insertions(+)
>>
> 

-- 
Best wishes,
Vladimir

