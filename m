Return-Path: <linux-arm-msm+bounces-1705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCBE7F60E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 14:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CA96B21266
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 13:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FBC2E824;
	Thu, 23 Nov 2023 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdsNFBJ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52495B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 05:53:34 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40b36339549so4637325e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 05:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700747613; x=1701352413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SG8mPwx9W4jW8bdMcEtjaZlM44NLjKoX6DNsCcgk3k0=;
        b=RdsNFBJ2vJiDTaMIaUc12CWkO67G4gfTRk5XVWqJiPDuIFR+6f2VNe0hTnMN4hlJ1T
         bwk4qzBTBFYIvMRsEKNJ+98qlzMWAMYmPEToA+DYIcQcaqHnwz49lCyxZURL6zDgY7sB
         h9lsoOvLpvc3V3gj7qUI9S64X/4q7eJ8hdKZI7gNKorCH3QETj5k+b2EAXa2Qz7dKyDY
         cN0uBfb6w7u4b0FYiIyE5QdIrS6EC4yE0HoPw83dr6AcuL9D5/g5ZgrX9i7LcD8aXLFk
         J5Ht8r+BDThXmdyJLG7ALbICkY4Xkq7JS5bug8Pk6wjQ0JEeJl0cTNGBx9k++k06umqs
         yLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700747613; x=1701352413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SG8mPwx9W4jW8bdMcEtjaZlM44NLjKoX6DNsCcgk3k0=;
        b=S1zVYSH3JiqUz76fbmAIemhQ1q2EituXorykl3NXFwn7NE7CsST/y/vCDA2foLw8fJ
         BalolVKduj+C3t8BL96kfWfetOGaCVWkKA0ERb4DEWgSUYwlLEwOS5BJjrJ5s33wa0fh
         Tgxmaq7dfKdIBLnxtjQlAdIQDi+n28dqDgZDQfPskHtRYENGsSr+e/9YskDiqQg/EO47
         PzEcJ7XLnhCz/cVH6fKEmi/QnFkzAmHaCHNjWpy+iYCsn5wI/AIG1zPwaKXJKv0031KW
         Q/CgQaLN9/nRpiPpY2kMQhu+ZVAoV62nGEeG3rBXkaPbHQ9/y0Lp7aKTS8owMONxen1G
         nIHg==
X-Gm-Message-State: AOJu0YxcSP5/kcqLNXmzju8L6uiQrpZSn9xidArpwuX7+YkmdwLKWwqq
	q+WpQguKJMBVxjCQtmirQzAbog==
X-Google-Smtp-Source: AGHT+IGynvrumEVFar+KnAO7rOUFdH+ohY6ZbDJcVOQR1lteEZCq+Ersi57pQ3ShlF7XW8iUq2wyvA==
X-Received: by 2002:a05:600c:4f07:b0:408:53d4:52dd with SMTP id l7-20020a05600c4f0700b0040853d452ddmr4281822wmq.22.1700747612801;
        Thu, 23 Nov 2023 05:53:32 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id bg11-20020a05600c3c8b00b0040b2c195523sm2771208wmb.31.2023.11.23.05.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 05:53:32 -0800 (PST)
Message-ID: <f9339226-cad4-4d1a-9465-c4f64de0b799@linaro.org>
Date: Thu, 23 Nov 2023 13:53:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] media: qcom: camss: Move VFE power-domain
 specifics into vfe.c
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
 <20231118-b4-camss-named-power-domains-v5-4-55eb0f35a30a@linaro.org>
 <84a97960-dfef-4d2f-8462-d3acb6f5a125@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <84a97960-dfef-4d2f-8462-d3acb6f5a125@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/11/2023 12:04, Konrad Dybcio wrote:
>> -    if (camss->genpd_num > camss->res->vfe_num)
>> -        device_link_del(camss->genpd_link[camss->genpd_num - 1]);
>> +    if (camss->genpd_link)
>> +        device_link_del(camss->genpd_link);
>> +
>> +    dev_pm_domain_detach(camss->genpd, true);
>> -    for (i = 0; i < camss->genpd_num; i++)
>> -        dev_pm_domain_detach(camss->genpd[i], true);
>> +    camss_genpd_subdevice_cleanup(camss);
> This changes the behavior, previously CAMSS_TOP was shut down last

Nope it was first. As a testament to how confusing this code was this is 
TOP completely not obviously..

if (camss->genpd_num > camss->res->vfe_num)
     device_link_del(camss->genpd_link[camss->genpd_num - 1]);

so this is equivalent

if (camss->genpd_link)
     device_link_del(camss->genpd_link);

Since I'm V6ing to add the additional patch, I will change the logic 
here to make TOP unlink last though because, logic.

---
bod

