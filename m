Return-Path: <linux-arm-msm+bounces-23155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E9B90DFF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 01:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EC811F2497B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 23:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DD21849E7;
	Tue, 18 Jun 2024 23:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JbjP8rHm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74A41849D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 23:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718753634; cv=none; b=VjaVSlhcfVNzE5CltCC0pECJpmjhSssrl34AXJZAMAd7ItUcsZHHuZPHKRoWyDtW9XMnoiyFHaqnhVcRcnc068rsAB1L5X7h+JtrJpgEpALJ5Jhusbgam1q4CsNjghjMoxR61aIwAHrmEsCNtDOyCcnhlHuL88Rv4pntm2/rrOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718753634; c=relaxed/simple;
	bh=nvgJV2cU52xnEo2x3lWvM2rj+jo+RlJLSRb8gwhLWdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqeoVq8Htxu+N2yF2lAOEAgLIJdVzZbllCHbaL5osyj2788t6IQYZZHHcDgD7djxIU41sH9jksi98zr1VJciWMjUiWoBC5maRdw4ShR5YOKuEA49byOrTRWglsOjcc9RIy9yo2kSgOaRjOVhYJzZmVJDGvzrG4v0W3cdwaO5nno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JbjP8rHm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso1989285e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 16:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718753630; x=1719358430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4BfwFOBcFxn/9yJmvVXLVigVaG5MzgevWsmMsZXB7Uc=;
        b=JbjP8rHmyq3zumxmZRIXZtY+B1MML22PA4isRff3kpBRGzc6JAwhVn8ol8JYfHWGgd
         WSdDkcK88n9oCYXXufkRiZj+uBpzBDxeLS+WN1WuHiWPDU4grRImh9mmC6/EPU2DtZBk
         h9p283i2PPNN5ZxluKR0boZAo1QEJKJHxwIR/jMQWynbjG7XjntmZJPqhPScwANpBkbl
         tk8oRCQsWs2J73zcrsvbNGfdvuxd2RG0p5L7Gtcn0sKsUw9e4yu5+65KkpZiZgwIAkUd
         LpmAKGDfehXYad3x5LcaWPGvY+vIuelBtts874fx9WO/CslTIKhB/qs/AxoJGucfyrs2
         SefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718753630; x=1719358430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4BfwFOBcFxn/9yJmvVXLVigVaG5MzgevWsmMsZXB7Uc=;
        b=uk+HeAUmIUD5uXd+EZwe4nYag5O3MFvAO6aK36CvvKpssROV8wTfWv5YmHFkwmtAp/
         dlVGW/FYeShB1xg6rXhbchkFiraPkcD6RwXdLHMo6+WXb6FDVgWWFCwJ5xnO1ZbhT4X2
         PaiTzht3OrX8NiHEWzOi3zcMh0nLNpOhL+w01LJY7ttacyolhqWrh6GHnHEz9yjV26Q4
         tGuJXTyyXHzRMmwtTiiPhXvPlvY3XkGJ34ZsvA8vqhOFCCOUaqFFZdMqMMPVhM3mtgbf
         4sds9lM4g79+w/ilPNMrQELxD1SRa1A5PAH9/Ir54OH9bfl34tp06Lz2wdAf288k21/H
         VJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCUIHz9zzIafs9jq7hg6bMT8QpyPgyBIeSTjfz/a9izz6OlgtCuiC1WNCLRII8IfNUMOqnTmMPqlMDUWkPrqZgOH2vCAosgyxc40onAIvA==
X-Gm-Message-State: AOJu0Yz3a1NcTtMCDyFyOsYlaiWPxYXN86WKUR7c84MkF48SJkxIR6mE
	h6ESyj4v70I5ObiXsoe57UUDctES4zpcNNBKnYBC2ff4Ho0RZyUtvSXrIxJA0CA=
X-Google-Smtp-Source: AGHT+IHIao0OuSG1XYOKFMaqWoyuBFbBhjekObpcevx7N+l9Zi/ExgLk2u/T3YxpZnZSp4ND/MNIVQ==
X-Received: by 2002:a05:600c:314a:b0:421:811b:b83e with SMTP id 5b1f17b1804b1-4246f5cfa54mr41545905e9.13.1718753629512;
        Tue, 18 Jun 2024 16:33:49 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:6f30:7340:4e06:bff7? ([2a00:f41:9028:9df3:6f30:7340:4e06:bff7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f641a5b4sm205205785e9.41.2024.06.18.16.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 16:33:49 -0700 (PDT)
Message-ID: <f8cd4691-48fd-42a9-8e4e-e942c4475ddd@linaro.org>
Date: Wed, 19 Jun 2024 01:33:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/9] soc: qcom: cpr: Move common functions to new file
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Niklas Cassel <nks@flawful.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, Robert Marko <robimarko@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
References: <20230217-topic-cpr3h-v14-0-9fd23241493d@linaro.org>
 <20230217-topic-cpr3h-v14-4-9fd23241493d@linaro.org>
 <20230829151509.GN818859@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230829151509.GN818859@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/29/23 17:15, Bjorn Andersson wrote:
> On Mon, Aug 28, 2023 at 01:42:16PM +0200, Konrad Dybcio wrote:
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>
> 
> It seems reasonable to update the subject prefix, now that things have
> moved to the genpd subsystem.

Ack

> 
>> In preparation for implementing a new driver that will be handling
>> CPRv3, CPRv4 and CPR-Hardened, format out common functions to a new
>> file.
>>
>> Update cpr_get_fuses in preparation for CPR3 implementation, change
>> parameters where necessary to not take cpr.c private data structures.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> [Konrad: rebase, apply review comments, improve msg, split]
>> Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/genpd/qcom/Makefile     |   2 +-
>>   drivers/genpd/qcom/cpr-common.c | 350 ++++++++++++++++++++++++++++++++++++
>>   drivers/genpd/qcom/cpr-common.h | 103 +++++++++++
>>   drivers/genpd/qcom/cpr.c        | 384 +++-------------------------------------
>>   4 files changed, 475 insertions(+), 364 deletions(-)
>>
>> diff --git a/drivers/genpd/qcom/Makefile b/drivers/genpd/qcom/Makefile
>> index 403dfc5af095..b28c8d9128c4 100644
>> --- a/drivers/genpd/qcom/Makefile
>> +++ b/drivers/genpd/qcom/Makefile
>> @@ -1,4 +1,4 @@
>>   # SPDX-License-Identifier: GPL-2.0
>> -obj-$(CONFIG_QCOM_CPR)		+= cpr.o
>> +obj-$(CONFIG_QCOM_CPR)		+= cpr-common.o cpr.o
> 
> Is there a reason for this to be split in two drivers? Would it make
> sense to rewrite this such that the result ends up as a single .ko?

cpr1 is far, far simpler.. I'm not sure if sprinkling millions of ifs
everywhere is worth it

> 
> Then you shouldn't need to EXPORT_SYMBOL between the two parts of the
> same "driver".
I suppose it's a balance of code complexity (see /\) vs kernel size

Konrad

