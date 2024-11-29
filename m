Return-Path: <linux-arm-msm+bounces-39642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 395AC9DED74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 00:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DD88B21010
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 23:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1835189F2B;
	Fri, 29 Nov 2024 23:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g3/mSAQc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E78160783
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 23:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732921671; cv=none; b=F0eWq9J1dY+ERlhFd2YtgebOWCzK1s4lfp/gCcLNQ17k+CqxwNMNO0IgvfL6T2srHROsxgnX4bqxCHC9kuZCgJOhJp5kQGkPxCsub3hedn8ECzrKCuBafVRtIiR68kdw7dRvfdOaObGYEnjgmDQokX3FzD24LZg8SNcLYTYZJ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732921671; c=relaxed/simple;
	bh=eWpZvg/efTDewEn5gJPGAr3VSGlXZwYFXcc6TQ2LfD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EhS2LcPn1tMdLI6H3vnCGKRuUV6FVqsVEkXbSQYsnhgFSC+rRDRSfhWEfDeOnOZ0+pWlqtUOX2uWACZjGEJet9lvr8HnUWqkRW6hdktvvPgh8kfCzReZ2jf1IQBsYhvoWiSExQD6sGYcqJRf+VpyLrLYH48RFjCsZlIg8e9+tvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g3/mSAQc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434aabd688fso15042795e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 15:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732921668; x=1733526468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxtbZr91YGtlqlkH7gV3tkH9u1Viq102T9XbHakKTy8=;
        b=g3/mSAQcC1YqYdq2F3cFsdk3H2iwKKqoXDUVUWa7SvktUxl8UAQLKbCosGgzcok46z
         k+kAwozrSAL1bQQ0cZGZuI9M1lhtLIvTFJxatqgN50rlD1Wth68BxtwPr5rS9+uFNpG6
         0kjZ632I5FDq1sqJl8QM7GZqytSB1TuMF0QwaNiaIvkHGxdbv3yYM4xEW0t3+43Z/UQU
         XlOGZjuEXAMFigY567Nd+BTRykt8kRY3o5TzOIGSaYSJsXHDQ25d6iuPqKWbKJHo5B/h
         3019Z+7SGvLfqAJYkKoBJo85jyDPEY+gmmlqj9R5KzQtqvM/NTFNNLAirMIgkp6fpli6
         4EWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732921668; x=1733526468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxtbZr91YGtlqlkH7gV3tkH9u1Viq102T9XbHakKTy8=;
        b=KbnO+IvjjJKHUvfdQOzjuk+ckySCzwtNH740vXzIi2RXP6J3oSMo87ZQhRmWhBLcOH
         10zFDCDpgBcbP/vgYmuqZiTWqKPv7kc7wN53RX2XmWO5w/us7Fvxv9GwRw3fkTpg8TIL
         WFUcc7fggeM7en+eE9fZUepASfjUSiGebB3GBNR5pyyHxmPk7A3IoQxpc1CAJb93Mmlk
         v/860P1LPVykuhDjTIr4+TyvnxjAZ0S8pQbahnFhlGxsQvKU7mk4MjnXJnZU/5Y1aBAN
         6qcViWr2de7gshyWJN3MB3MdEfAB81BiV+J0wMceaD/mKUtrD9MfTBHkcqie/5cCUVtB
         wVDw==
X-Forwarded-Encrypted: i=1; AJvYcCVbUBQxvfXr7n4QTivqHiQPwcG+PMaauN00wofCvbAfmhWeMjNIPcwrbIt13LPPmeHBI9MFEJhpV33ZWaus@vger.kernel.org
X-Gm-Message-State: AOJu0YyKXaGyB+uVO9+6P/eXPaBZeY0bfiAV/KFXl2cC6cvgfUIX60Im
	PudELB6vHQBd64fuE+Fu2thg0NGdY/jqdngLfQvpCXNkz6x5+N3GRVyNmNLeCUU=
X-Gm-Gg: ASbGncv1e2CmO5kDqC1KZI1sZGVGEMbJVQYk+ur75GxAXgmlExqsw1ofN0Lu1hyO9Pw
	I1RwippHBQlwTvwg0TzL0vE4Y+Nep30gzvpfHkRIoHnazJR6geb7A8sSYSOS7FQRZtOBeexlU23
	4iM6w8cSh7mYwZ2Wj+M1lWDHPbtMhVYQqGXtgnnSvMJyy1LXbtSNO+bup9jv1LPgtKGNL5x8OK+
	DgtGmJEvdHzAL9GJ6X5Bn9NaYn0suoIpSS2JaPl7g0VkKpd++J8geIXl0r3npc=
X-Google-Smtp-Source: AGHT+IFd7WhsLpuxR6ev9R6lOkLb/XIzYSOsYe8y5GrsqtDNgDKIwVga4QcvXADtALaKY/6YuFKTrA==
X-Received: by 2002:a05:600c:1552:b0:42c:ba83:3f01 with SMTP id 5b1f17b1804b1-434a9dc36b6mr134078445e9.8.1732921668271;
        Fri, 29 Nov 2024 15:07:48 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68cccsm5761558f8f.79.2024.11.29.15.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 15:07:47 -0800 (PST)
Message-ID: <93028653-9919-460e-83d3-84bf5ade56d4@linaro.org>
Date: Fri, 29 Nov 2024 23:07:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
To: barnabas.czeman@mainlining.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
 <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
 <5cccec71-0cc7-492a-9fb9-903970da05c5@linaro.org>
 <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
 <a08e95fc03fce6cb0809a06900982c6c@mainlining.org>
 <8dfd2ee1-9baf-441f-8eb9-fa11e830334a@linaro.org>
 <ac765a062e94d549f4c34cf4c8b2c199@mainlining.org>
 <f4e47953-5a68-4ec5-860b-820b8eff2a2a@linaro.org>
 <05e91ae70902f0cd9c47bb4197d8fef1@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <05e91ae70902f0cd9c47bb4197d8fef1@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/11/2024 22:45, barnabas.czeman@mainlining.org wrote:
> On 2024-11-29 23:08, Bryan O'Donoghue wrote:
>> On 29/11/2024 13:46, barnabas.czeman@mainlining.org wrote:
>>> On 2024-11-29 13:25, Bryan O'Donoghue wrote:
>>>> On 29/11/2024 11:44, barnabas.czeman@mainlining.org wrote:
>>>>>> The change does not describe how to reproduce the problem, which 
>>>>>> commit
>>>>>> base is tested, which platform is testes, there is no enough 
>>>>>> information,
>>>>>> unfortunately.
>>>>> I can reproduce the problem with megapixels-sensorprofile on 
>>>>> msm8953 and
>>>>> it can be reproduced with megapixels on msm8996.
>>>>> The base is the last commit on next.
>>>>
>>>> Can you verify if vfe_domain_on has run and if so whether or not 
>>>> genpd_link is NULL when that function exists.
>>>>
>>> I have added some debug logs it seems pm_domain_on and pm_domain_off 
>>> is called twice on the same object.
>>> [   63.473360] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 link 
>>> 42973800
>>> [   63.481524] qcom-camss 1b00020.camss: pm_domain_on 19840080 link 
>>> 4e413800
>>> [   63.481555] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 link 
>>> 42973800
>>> [   63.481632] qcom-camss 1b00020.camss: pm_domain_off 19840080 link 
>>> 4e413800
>>> [   63.481641] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 link 
>>> 42973800
>>> [   63.654004] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 link 0
>>>> That's the question.
>>>>
>>>> ---
>>>> bod
>>
>> Could you provide this output ?
>>
>> index 80a62ba112950..b25b8f6b00be1 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -595,6 +595,9 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>>   */
>>  void vfe_pm_domain_off(struct vfe_device *vfe)
>>  {
>> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
>> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
>> +
>>         if (!vfe->genpd)
>>                 return;
>>
>> @@ -609,7 +612,8 @@ void vfe_pm_domain_off(struct vfe_device *vfe)
>>  int vfe_pm_domain_on(struct vfe_device *vfe)
>>  {
>>         struct camss *camss = vfe->camss;
>> -
>> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
>> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
>>         if (!vfe->genpd)
>>                 return 0;
>>
>> ---
>> bod
> I think logging in pm_domain_on should be placed after device_link_add 
> because only NULL
> will be visible.
> [   83.040694] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
> 000000009bd8355f genpd_link 0000000000000000
> [   83.049293] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 genpd 
> 00000000bfb65e7c genpd_link 0000000000000000
> [   83.049353] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
> 000000009bd8355f genpd_link 00000000ccb0acd9
> [   83.049641] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 genpd 
> 00000000bfb65e7c genpd_link 00000000348ac3c1
> [   83.049654] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
> 000000009bd8355f genpd_link 00000000ccb0acd9
> [   83.241498] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
> 000000009bd8355f genpd_link 0000000000000000

Could you add

+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -786,7 +786,7 @@ int vfe_get(struct vfe_device *vfe)
         int ret;

         mutex_lock(&vfe->power_lock);
-
+dev_info(vfe->camss->dev, "%s vfe %d power_count %d\n", __func__, 
vfe->id, vfe->power_count);
         if (vfe->power_count == 0) {
                 ret = vfe->res->hw_ops->pm_domain_on(vfe);
                 if (ret < 0)
@@ -823,6 +823,7 @@ int vfe_get(struct vfe_device *vfe)

         mutex_unlock(&vfe->power_lock);

+dev_info(camss->vfe->dev, "%s vfe %d err=%d\n", __func__, 
camss->vfe->id, 0);
         return 0;

  error_reset:
@@ -835,7 +836,7 @@ int vfe_get(struct vfe_device *vfe)

  error_pm_domain:
         mutex_unlock(&vfe->power_lock);
-
+dev_info(camss->vfe->dev, "%s vfe %d err=%d\n", __func__, 
camss->vfe->id, ret);
         return ret;
  }

?

---
bod

