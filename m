Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 924592EAC67
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 14:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbhAENyp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 08:54:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729000AbhAENyo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 08:54:44 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88117C061796
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 05:54:04 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id t30so36289932wrb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 05:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:cc:references:from:subject:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=WeMaF7TAVDOEIygomZnq05mZMvBNk5xAGXnGkwP4VxM=;
        b=ye5X2VuG3ou5wXNFk5tCMRRCWTPYTJ0gR4UGwUrMrOUE9rOMVq1fn7BEQ7Qv9ZUe0f
         T52GJNGyEMCs4wOPnymnhwaZita24pCfV2GaE7K76S5eLmBdmPeZI9XHx5xmXsxKp3Kd
         p9uVsXsss0OXMxuo0BC/GGdWySBMsv5SEQGte5AK5UFq7oREC1oS4GO6Q1yG1KFQwRnq
         LEDpFxRk5r5JCTI20JAIPALpeI2upYM+47VQVhMKoBNj/nUY8Sgdo353APdpf3WtF9sU
         A56HDIiyET1lXVEKGyaEQRD+R8KKgfEwuFA3tZZD88P19IWECm1EovZhOlHJ8IXlg/mo
         K6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WeMaF7TAVDOEIygomZnq05mZMvBNk5xAGXnGkwP4VxM=;
        b=jF44vT8HZmSgI7XEsHTLw7y7Mj3w200Siyd7upmzLdjvtzNgnIf1e4JUDkWLlFzV3w
         w9aG5kaT9nSYRrqt+7tRZVbhb3rAZ/5QKhsH2ICNdIqJm4J6S3IPoW/9Qa9liZtET6hy
         Q//LeoQXM24/4l7cmzaEZKhme7NoSH4xfnqb++LbaRbWTtS/tSZs4ZFVopDkWFxy5k+j
         7cQo02H+Id+k5uRtG/DFXmN6CA8L6yliOjwldPKPdJYs7zx22MCdM/S8NDphxgziFrNa
         wIDntokUw1f4lzxZ2WCHICB4MmljlpWQcY2teOXtT17s6z1cbPin8mReNOT+y5gj/G8E
         ICfA==
X-Gm-Message-State: AOAM532TazVewr6VhjHXOFeXr+nIIivIhr6XBPK34QgrmtDfjUdpwzHe
        S8cQzsNJpdUTisl7yIalGkZRDQ==
X-Google-Smtp-Source: ABdhPJyD5a1x18fxXMG+4Mcx13Pev1iFYLAfK9YgIqd+kZ7o7mQ6A/yXNqdPNWouLSe9UlACDrP1xQ==
X-Received: by 2002:adf:dd09:: with SMTP id a9mr84076235wrm.90.1609854843150;
        Tue, 05 Jan 2021 05:54:03 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id i11sm4154410wmd.47.2021.01.05.05.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jan 2021 05:54:02 -0800 (PST)
To:     Vincent Knecht <vincent.knecht@mailoo.org>,
        Jun Nie <jun.nie@linaro.org>, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org
Cc:     shawn.guo@linaro.org
References: <20201204075345.5161-1-jun.nie@linaro.org>
 <20201204075345.5161-6-jun.nie@linaro.org>
 <d869ea94b3b1c73800a5c3b855cb6f280be6c185.camel@mailoo.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v2 5/5] interconnect: qcom: Add MSM8939 interconnect
 provider driver
Message-ID: <a88b39dd-1c50-8aff-f85e-27086db9b040@linaro.org>
Date:   Tue, 5 Jan 2021 15:54:04 +0200
MIME-Version: 1.0
In-Reply-To: <d869ea94b3b1c73800a5c3b855cb6f280be6c185.camel@mailoo.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/2/21 13:08, Vincent Knecht wrote:
> Le vendredi 04 décembre 2020 à 15:53 +0800, Jun Nie a écrit :
>> Add driver for the Qualcomm interconnect buses found in MSM8939 based
>> platforms. The topology consists of four NoCs that are controlled by
>> a remote processor that collects the aggregated bandwidth for each
>> master-slave pairs.
>>
>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> 
> Shouldn't some rpm ids be changed like they were for msm8916 in the following patch ?
> c497f9322af9 ("interconnect: qcom: msm8916: Remove rpm-ids from non-RPM nodes")
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20201112105140.10092-1-georgi.djakov@linaro.org/

Maybe they should. I don't have the hardware to try it, but the test will be
to just add the NoC DT nodes, enable the driver and inspect the boot log for
messages like:
[    2.926647] qcom_icc_rpm_smd_send mas X error -6

Thanks,
Georgi
