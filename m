Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70B463C12A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2019 04:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfFKCLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 22:11:47 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:54951 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728791AbfFKCLn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 22:11:43 -0400
Received: by mail-it1-f195.google.com with SMTP id m138so2325892ita.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2019 19:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8RcJD0etSUKCdAftUVogv11bxbo5C0KdF/jhN26WyyA=;
        b=OHXgU7noh57Sp/hq02aCQk7Iwul4QOdcr6UViwgqqgDaoPRzDl52iiE0cD1hek0we8
         3IKvO+lUENBcxzsHodJAZnTuabLcoZmMcyQ9lslSwB3speirTQXPv14ltLT3sMs93Mo7
         sDeAhjdXkOwS9iJmOSINgqPbTWdBBDqiFERi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8RcJD0etSUKCdAftUVogv11bxbo5C0KdF/jhN26WyyA=;
        b=DR6KOKqBM5U1UKUPDDJQ3Cj/FPLP5y8euRT5yleXfDzBt3Br+y2rSTyK8ZRogACEie
         7eypcpz4EC1BLYt2LN5H4w/DGZIhfWDeXcaIjK1ohEwkxIxFRIeMxZnR3gBTkgPNt+hK
         6FTDBT/hi4CtoZKaAv5wG2CA8zi+wYES9yhER3RAQWCEm1QkLgVzxBtwf+mxixq+sc/r
         xU2zInKHXsqtCANSenUmzQJVJ277pLUgh2UrQtvrwiQQnlW3GeFBQopPUQCFr8y44AmA
         Zv3EhkjKj0z4+FNj4iPUwzyQbi7lzb399jYn0Nur+D2O4gu6GkfT14kZHqf2z1sg2Jh2
         uexQ==
X-Gm-Message-State: APjAAAUPzKYCwDjx/H+FKjQWCxZE6g5kNSWfEMqAy7vWi6CUq0oAOmQO
        rrm448dMvbTv5wSqb2X2MXRHetKoeT/G4w==
X-Google-Smtp-Source: APXvYqzXNReWPcWQtoTC/Q7rrGPSPe4wVuVRroQKGCnjVJi4KH9bhqO038VqJ1HbXbKZCJDyQffZMQ==
X-Received: by 2002:a24:c384:: with SMTP id s126mr15705942itg.1.1560219102350;
        Mon, 10 Jun 2019 19:11:42 -0700 (PDT)
Received: from [172.22.22.26] (c-71-195-29-92.hsd1.mn.comcast.net. [71.195.29.92])
        by smtp.googlemail.com with ESMTPSA id c23sm4403415iod.11.2019.06.10.19.11.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 19:11:41 -0700 (PDT)
Subject: Re: [PATCH v2 02/17] dt-bindings: soc: qcom: add IPA bindings
To:     Rob Herring <robh+dt@kernel.org>, Alex Elder <elder@linaro.org>
Cc:     David Miller <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Evan Green <evgreen@chromium.org>,
        Ben Chan <benchan@google.com>,
        Eric Caruso <ejcaruso@google.com>, cpratapa@codeaurora.org,
        syadagir@codeaurora.org, subashab@codeaurora.org,
        abhishek.esse@gmail.com, netdev <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20190531035348.7194-1-elder@linaro.org>
 <20190531035348.7194-3-elder@linaro.org>
 <CAL_JsqLFk3=YN+V=RVxq9xWQTrPA9_0zW+eFrdXkGkCnM_sBkA@mail.gmail.com>
From:   Alex Elder <elder@ieee.org>
Message-ID: <bcb7f599-3c22-da27-c92b-4c1903a5ea06@ieee.org>
Date:   Mon, 10 Jun 2019 21:11:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLFk3=YN+V=RVxq9xWQTrPA9_0zW+eFrdXkGkCnM_sBkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/10/19 5:08 PM, Rob Herring wrote:
> On Thu, May 30, 2019 at 9:53 PM Alex Elder <elder@linaro.org> wrote:
>>
>> Add the binding definitions for the "qcom,ipa" device tree node.
>>
>> Signed-off-by: Alex Elder <elder@linaro.org>
>> ---
>>  .../devicetree/bindings/net/qcom,ipa.yaml     | 180 ++++++++++++++++++
>>  1 file changed, 180 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/qcom,ipa.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>> new file mode 100644
>> index 000000000000..0037fc278a61
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>> @@ -0,0 +1,180 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> New bindings are preferred to be dual GPL-2.0 and BSD-2-Clause. But
> that's really a decision for the submitter.

Thanks Rob.  I'll ask Qualcomm if there's any problem
with doing that; I presume not.  If I re-submit this
with dual copyright, I will include your Reviewed-by
despite the change, OK?

					-Alex

> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

