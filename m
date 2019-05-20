Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 990F5242C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 23:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbfETVXc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 17:23:32 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:36002 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfETVXc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 17:23:32 -0400
Received: by mail-it1-f196.google.com with SMTP id e184so1405446ite.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 14:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nOkJzLKyCI/W8fuopzDIMnbGuxkwQsHCMqTJ6kkCpPM=;
        b=FpleFIPYsNw0MpvUnTfK2Qi3gOgwp+kxp6Kl2y1X9RMamUYkWrBDZY0lHb1yW8umIF
         zoHKvCKRsw52CeID2Fhbx6nfXdCDlf2rdqWKj2IyskmR0sI6ySsqz0dctkSEWet7mam+
         wca0T1uriusnq8SQ9hNLO40oHz8lhbJGimgnlKIuzeBbvbh33ljjWdQKRdRP5KNZYJhc
         GkzbK5GhVpj+QI+VdqDxSJP4E/ITb2qBv0hcoITsXKRyJUjP62kJkKEPhUxpz1NzUvAo
         wLxjD8W4TcdnApbwGKQ+66NIdIkUTvGkaByCGTheJWKlc06dPX0QslcrPmayxO0/TKic
         y7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nOkJzLKyCI/W8fuopzDIMnbGuxkwQsHCMqTJ6kkCpPM=;
        b=tiu/R7njRFBcwB8bKunz9vUCfEiyZpb0VBu0by4Od6asJykNKw2t8Vh1K0+YBjBOuA
         6/hAGk7KaCn/BvbSsOXrBUy89UwZcIcpB9ByQMS10GyT4DfrbIX5yIApA3o45vMx3q4F
         vvC1bDrQiHHbhxf2PLyIFZlN+H7ZKcjIAcMglybyQP0S2IcYc9kniPqRd2bHKlUQRchL
         8rVtRIU674egzcx6vqSeFDg3i3uBd/h28/olVKwclRSmUjn+7tkFooq2HL9MKmri9+os
         zU8D01ecOH/RE+7aCLCidi95Q5A5vJzA9e8NYuqt5fk7ajgPyw7MjV6l/3FQ2sDzgDgC
         KQ1A==
X-Gm-Message-State: APjAAAXn+5qoZvjsIw606odtW+jwiUsGFgOOYgaoenFpNoox0G+TGJu3
        ESjwzX3oQbYPFcCsy6eAxCxOkg==
X-Google-Smtp-Source: APXvYqyuWKfuF4pl19MX2Hjx3MvenfjGOM4mF47wYdhXdTq7PfbQtjHzVAnYM9QfcT4RecS+smrpbw==
X-Received: by 2002:a02:62ce:: with SMTP id d197mr3658837jac.91.1558387410957;
        Mon, 20 May 2019 14:23:30 -0700 (PDT)
Received: from [172.22.22.26] (c-71-195-29-92.hsd1.mn.comcast.net. [71.195.29.92])
        by smtp.googlemail.com with ESMTPSA id i13sm423199itb.9.2019.05.20.14.23.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 14:23:30 -0700 (PDT)
Subject: Re: [PATCH 1/8] net: qualcomm: rmnet: fix struct rmnet_map_header
To:     Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
Cc:     arnd@arndb.de, david.brown@linaro.org, agross@kernel.org,
        davem@davemloft.net, bjorn.andersson@linaro.org,
        ilias.apalodimas@linaro.org, cpratapa@codeaurora.org,
        syadagir@codeaurora.org, evgreen@chromium.org, benchan@google.com,
        ejcaruso@google.com, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190520135354.18628-1-elder@linaro.org>
 <20190520135354.18628-2-elder@linaro.org>
 <b0edef36555877350cfbab2248f8baac@codeaurora.org>
From:   Alex Elder <elder@linaro.org>
Message-ID: <81fd1e01-b8e3-f86a-fcc9-2bcbc51bd679@linaro.org>
Date:   Mon, 20 May 2019 16:23:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b0edef36555877350cfbab2248f8baac@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/20/19 3:11 PM, Subash Abhinov Kasiviswanathan wrote:
> On 2019-05-20 07:53, Alex Elder wrote:
>> The C bit-fields in the first byte of the rmnet_map_header structure
>> are defined in the wrong order.  The first byte should be formatted
>> this way:
>>                  +------- reserved_bit
>>                  | +----- cd_bit
>>                  | |
>>                  v v
>>     +-----------+-+-+
>>     |  pad_len  |R|C|
>>     +-----------+-+-+
>>      7 6 5 4 3 2 1 0  <-- bit position
>>
>> But the C bit-fields that define the first byte are defined this way:
>>     u8 pad_len:6;
>>     u8 reserved_bit:1;
>>     u8 cd_bit:1;
>>
> 
> If the above illustration is supposed to be in network byte order,
> then it is wrong. The documentation has the definition for the MAP
> packet.

Network *bit* order is irrelevant to the host.  Host memory is
byte addressable only, and bit 0 is the low-order bit.

> Packet format -
> 
> Bit             0             1           2-7      8 - 15           16 - 31
> Function   Command / Data   Reserved     Pad   Multiplexer ID    Payload length
> Bit            32 - x
> Function     Raw  Bytes

I don't know how to interpret this.  Are you saying that the low-
order bit of the first byte is the command/data flag?  Or is it
the high-order bit of the first byte?

I'm saying that what I observed when building the code was that
as originally defined, the cd_bit field was the high-order bit
(bit 7) of the first byte, which I understand to be wrong.

If you are telling me that the command/data flag resides at bit
7 of the first byte, I will update the field masks in a later
patch in this series to reflect that.

> The driver was written assuming that the host was running ARM64, so
> the structs are little endian. (I should have made it compatible
> with big and little endian earlier so that is my fault).

Little endian and big endian have no bearing on the host's
interpretation of bits within a byte.

Please clarify.  I want the patches to be correct, and what
you're explaining doesn't really straighten things out for me.

					-Alex

> In any case, this patch on its own will break the data operation on
> ARM64, so it needs to be folded with other patches.
> 
>> And although this isn't portable, I can state that when I build it
>> the result puts the bit-fields in the wrong location (e.g., the
>> cd_bit is in bit position 7, when it should be position 0).
>>
>> Fix this by reordering the definitions of these struct members.
>> Upcoming patches will reimplement these definitions portably.
>>
>> Signed-off-by: Alex Elder <elder@linaro.org>
>> ---
>>  drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
>> b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
>> index 884f1f52dcc2..b1ae9499c0b2 100644
>> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
>> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
>> @@ -40,9 +40,9 @@ enum rmnet_map_commands {
>>  };
>>
>>  struct rmnet_map_header {
>> -    u8  pad_len:6;
>> -    u8  reserved_bit:1;
>>      u8  cd_bit:1;
>> +    u8  reserved_bit:1;
>> +    u8  pad_len:6;
>>      u8  mux_id;
>>      __be16 pkt_len;
>>  }  __aligned(1);
> 

