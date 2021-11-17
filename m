Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41C0454651
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 13:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233656AbhKQMYv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 07:24:51 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:43655 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbhKQMYu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 07:24:50 -0500
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl [194.29.137.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8DC503F5D7;
        Wed, 17 Nov 2021 13:21:50 +0100 (CET)
Message-ID: <f1c7a135-b74a-ea98-b7e0-8602fa7a92b7@somainline.org>
Date:   Wed, 17 Nov 2021 13:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: llcc-qcom: Add SM8350
 compatible and defines
To:     Stephen Boyd <swboyd@chromium.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Souradeep Chowdhury <schowdhu@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20211114012940.112864-1-konrad.dybcio@somainline.org>
 <CAE-0n52MkOx8KC4jSmEHMhmk8sDDf0YNMWhvH-g=Y=OJvA-+1w@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <CAE-0n52MkOx8KC4jSmEHMhmk8sDDf0YNMWhvH-g=Y=OJvA-+1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 17/11/2021 07:56, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2021-11-13 17:29:38)
>> Document the compatible string for SM8350 and add required defines to the
>> binding.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> ---
>>   Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 1 +
>>   include/linux/soc/qcom/llcc-qcom.h                       | 4 ++++
> Why is this include file part of this patch. Shouldn't it be in the next
> patch?
>
Right, out of habit I treated it as if it was a part of dt-bindings, when it

isn't. Thanks for spotting that.


Konrad

