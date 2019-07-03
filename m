Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3C1B5E772
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 17:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbfGCPJF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 11:09:05 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34290 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfGCPJE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 11:09:04 -0400
Received: by mail-io1-f65.google.com with SMTP id k8so5647565iot.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2019 08:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aw5rLTOGHVOuWpYtoQJzQDQQgJgAlYekgr7JwjSCTt4=;
        b=PzY9C3Nt2MIKEZNxYLjxFAW+9SjQY8TUYm3Ms5POWyhTT2ApqoPbKFQ+Huyjq362ba
         xHD5+bbNMJ44ZGBQEcQnRc++AwHkwyWrGkF44qTJ+LHDqL/BP8BA9QJc07DoauOkqhxA
         llBHa2jdVUepqJR1eBXUIgC4FhdpNVATbqohNl3nujVWrD3h3dAsNnB+ty+BVONWXeqo
         18smc6JQii8rSR2Y3ZUNGs1w5YgcMZPEiOvzoDGdLb/Shl5ciZSeIF2sUYjp5vpw1oL+
         zidqZ1jJ7lqsGxAuGBO6IKcNjw6v9iChWJkhSnadVtiWogEw10vPbfdFmsDp4XCHWMiw
         IQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aw5rLTOGHVOuWpYtoQJzQDQQgJgAlYekgr7JwjSCTt4=;
        b=i10rqhD/eT7RACdLB+UnOgDzVVJNhboq7In9U/DlBmOpNZEB3wWjjKIqhTw6EBSdQY
         Br+pBfgR0iZgS81bHYwobsUua993d1MfKFdB+wrAm5hAh4sna78+fN1eTB63l/lHJ0cu
         qnobrcd7LvqFm3adnloK0+fSYGWng99bwt1ncGNPtAJEmPkmfTvinxj1GzHwWi8lR8mN
         DhBgOlQvRnlHD39XU0cH4uuL2v/vRTaHqaEFrhxPl3kRndor4Fbtj6JFb5OBByKRUDPR
         6++nD5xsxWFaRW2ju7pcaPrsl7Doz1yLvKW/72sbfPCelHFF91ZSuo3JqLKpRc/sY7j2
         rAmw==
X-Gm-Message-State: APjAAAXJpUBdNmth0l3fNeVFEihwkIasEjEOOx1PJQtDh2a9mXk2+E9p
        7XnVXNmnmGuagpdeCSTkrS4IQQF36UfIrQ==
X-Google-Smtp-Source: APXvYqylDJ9H/znMIYSM76cME/p8SyRkZWaMigsqEugGbrfBUtutBbJz5lC5zaZVFp89G+a78FlD6Q==
X-Received: by 2002:a6b:c915:: with SMTP id z21mr13020446iof.182.1562166543298;
        Wed, 03 Jul 2019 08:09:03 -0700 (PDT)
Received: from [172.22.22.26] (c-71-195-29-92.hsd1.mn.comcast.net. [71.195.29.92])
        by smtp.googlemail.com with ESMTPSA id f4sm2434872iok.56.2019.07.03.08.09.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 08:09:02 -0700 (PDT)
Subject: Re: [PATCH v2 02/17] dt-bindings: soc: qcom: add IPA bindings
To:     Alex Elder <elder@ieee.org>, Rob Herring <robh+dt@kernel.org>
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
 <bcb7f599-3c22-da27-c92b-4c1903a5ea06@ieee.org>
From:   Alex Elder <elder@linaro.org>
Message-ID: <76c1db4f-20b7-4b4b-541c-aa8baa12e7cc@linaro.org>
Date:   Wed, 3 Jul 2019 10:09:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <bcb7f599-3c22-da27-c92b-4c1903a5ea06@ieee.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/10/19 9:11 PM, Alex Elder wrote:
> On 6/10/19 5:08 PM, Rob Herring wrote:
>> On Thu, May 30, 2019 at 9:53 PM Alex Elder <elder@linaro.org> wrote:
>>>
>>> Add the binding definitions for the "qcom,ipa" device tree node.
>>>
>>> Signed-off-by: Alex Elder <elder@linaro.org>
>>> ---
>>>  .../devicetree/bindings/net/qcom,ipa.yaml     | 180 ++++++++++++++++++
>>>  1 file changed, 180 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/net/qcom,ipa.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>>> new file mode 100644
>>> index 000000000000..0037fc278a61
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>>> @@ -0,0 +1,180 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>
>> New bindings are preferred to be dual GPL-2.0 and BSD-2-Clause. But
>> that's really a decision for the submitter.
> 
> Thanks Rob.  I'll ask Qualcomm if there's any problem
> with doing that; I presume not.  If I re-submit this
> with dual copyright, I will include your Reviewed-by
> despite the change, OK?

FYI I have the go-ahead to use dual GPL-2.0 and BSD-2-Clause
bindings on this, and will mark it that way whenever I next
post this code for review.

I will also be updating other Qualcomm bindings to have a
dual copyright (in a separate series).  We'll want to
get an ack from appropriate Code Aurora developers on
those (I'll provide more detail at the time those get
posted).

					-Alex

> 					-Alex
> 
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
> 

