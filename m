Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE95788C8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 17:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241739AbjHYPgQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 11:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242798AbjHYPf5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 11:35:57 -0400
Received: from www316.your-server.de (www316.your-server.de [88.198.220.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E452134;
        Fri, 25 Aug 2023 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=dylanvanassche.be; s=default2306; h=To:Subject:From:MIME-Version:Date:
        Message-ID:Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
        bh=btE2ctEAysytUY4JyxE/voBZJMDghT1xhdC4xmDjgT4=; b=ISk4JijF81uZhF4ghqpHl4U/xM
        BO7hnF5X19Q8gdTbhgu1OlSh9byEtlbjairY6MW2JdyDUUIue0X+aZ6iSsyKOfIYR1i8JPMTw6vi0
        +1pmrLjs+XkOmnN90dlB57r/HCsBvHPU9W6r1zJ+ObGFGQY3NKsO0Rq/br3fqvwTOmGSc+yh0Cy91
        CUkVe7YTL1KdpfYlxvMrbLtaav2rMLGJpfuDCPbHz7q2c1y0Dlk2MLE0YakhEJRAgQ5tBWS1XwSO7
        8v5206qEE5ZaFWjB0w9/RTxH+UnUJpfEY8VISoP9ZbeulkXLQL5hmOQdDvWeaIu3K1fsADGt71DCn
        RPb438yA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
        by www316.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <me@dylanvanassche.be>)
        id 1qZYXn-0005IT-Rb; Fri, 25 Aug 2023 17:16:15 +0200
Received: from [169.150.196.25] (helo=[10.67.205.85])
        by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <me@dylanvanassche.be>)
        id 1qZYXn-000BLZ-2C; Fri, 25 Aug 2023 17:16:15 +0200
Content-Type: multipart/mixed; boundary="------------9YYEjC8OdzW7qlsGLL6n83Zp"
Message-ID: <55665952-c6ce-d097-d4b7-4cacd324eb06@dylanvanassche.be>
Date:   Fri, 25 Aug 2023 17:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Dylan Van Assche <me@dylanvanassche.be>
Subject: ath10k-firmware: WCN3990: Add board file for SHIFTPHONES SHIFT6mq
To:     ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Language: en-US
X-Authenticated-Sender: me@dylanvanassche.be
X-Virus-Scanned: Clear (ClamAV 0.103.8/27011/Fri Aug 25 09:40:47 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a multi-part message in MIME format.
--------------9YYEjC8OdzW7qlsGLL6n83Zp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Kalle,

I would like to include the board file for the SHIFTPHONES SHIFT6mq 
smartphone.
This smartphone is manufactured by SHIFTPHONES and uses the Snapdragon 
SDM845 SoC.
At postmarketOS, we run the mainline kernel on this phone so shipping 
this board file
from upstream would be a great addition. Below, the questions from the wiki:

* description for what hardware this is:

Smartphone with a SDM845 chip and a WCN3990 Bluetooth/WiFi chip.
The WCN3990 chip is connected to 2 QM488xx radios, one is used
for 2.4Ghz and the other one for 5Ghz radio.

* origin of the board file (did you create it yourself or where you
   downloaded)

Extracted from the stock firmware.

* ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)

- WCN3990 hw1.0
   + bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=shift_axolotl
     sha256sum: 
082f65dad7b2ee938911d60a0f4f9ef8df18417ce69e9f42c9e947e961d18f30
     md5sum: 5dce0c544a7a8036ebd4beaeba3d244b

* attach the actual board file (board.bin)

The name of the files are equal to the id string in the board-2.bin 
(minus the ".bin")

Kind regards,
Dylan Van Assche

--------------9YYEjC8OdzW7qlsGLL6n83Zp
Content-Type: application/octet-stream;
 name="bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=shift_axolotl.bin"
Content-Disposition: attachment;
 filename*0="bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=shift_axo";
 filename*1="lotl.bin"
Content-Transfer-Encoding: base64

AQAEBAAAAADQSurUAgEAAAAAAAAAAAAAAAAAAAAAAQAAAAAAIAAAAAAAAAAAAAAAAACQAQAA
AgEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAYAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQBEgEwASgBMAEsASwBKgEwATQBMAE2ATgB
MgEwASgBEAEWARYBFgEYARYBEgEOAQAAAAAAAAAAAAAUARIBMAEsAS4BKgEsASwBMAE2ATIB
NAE4ATIBLgEiAQcAOA8ACgEQgIAAAAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMAAY
AAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAgAkAQAAAAA/IAAAAAAAAD9DBwAAAAAAAwADAAMAAwAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAqIAAA
AAAAAApDBwAAAAAAAQABAAEAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAOQBAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADYA4QAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAABQDAwInp66nJcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQABAQAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQEBAAAAAAAA
AAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAUAkAIAAAAADwACAwEA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAA3AUAAKwNAAB8FQAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAYA
fAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHABgBAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAICAgIAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAA+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAgARBMAAAAAcHV6f4SJjpOYnaKnrLgAAHCnWI9IfjBkKFoQKQgUAABoo1iQSHw4aihW
EC0IFwAA+Pi9twAAAABwp1iPSH8wZShaECoIFQAAaKNYkUh+OGwoWBAwCBoAAvj4vbcAAAAA
aKJYkkB4MGgoXRAuCBgAAGikWJJIfzBkKFkQMggcAAP4+L22AAAAAGilUI1AezBrKGEQMQgb
AANopFiSSH8wZChZEDIIHAAE+Pi9twAAAABoplCPQH0wbShjEDIIHQAFaKNYkkh/OGwoWBAx
CBsAA/j4vbYAAAAAaKZQj0B9MG0oYxAzCB0ABWijWJBIfThrKFcQLwgZAAH4+L22AAAAAGik
UI1AejBrKGEQMQgbAANooliPSHw4aShVEC0IFwAA+Pi9tgAAAABooViRSIAwZyhdEC4IGAAA
aKBYjkh6OGgoVBAsCBYAAPj4vbYAAAAAcKZYjUh8OGsoWBAqCBQAAHCpWIxIeDhmKFIQKggU
AAD4+L23AAAAAHCiYJFQgThnKFMQJwgRAABwpmCSUIBAazBaKE8IEQAA+Pi9twAAAABwoWCP
UH84ZChRECUIEAAAcKNgjlB9QGgwVihLECQIDvj4vbcAAAAAcKBgjlB/OGQoURAlCBAAAHCh
YIxQekBlMFMoSBAhCAv4+L23AAAAAHioYI5QfkBrKFAQJQgPAAB4qGiUUHhIbTBRKEYQIAgK
+Pi9twAAAAB4mHCPYH1IZDhTKEAQFggBeJpwkGB8UGtAVSg5EBMAAPj4vbcAAAAAuGQgKRAU
AAAAAAAAAAAAAAAAAACvcmthT1YZLQwXAAAAAAAAAAAAALZlIioSFQAAAAAAAAAAAAAAAAAA
wXR3Yx4wEBoIAgAAAAAAAAAAAADHaCUuFhgKAAAAAAAAAAAAAAAAAKhtX1khMhIcCAMAAAAA
AAAAAAAAo2EqMRUbDQMAAAAAAAAAAAAAAACxbWVZITIRHAgEAAAAAAAAAAAAALJjKzIYHQwF
AAAAAAAAAAAAAAAAs2xlWB8xERsLAwAAAAAAAAAAAACwYy0zGR0OBQAAAAAAAAAAAAAAALJr
ZFcgLxEZBwEAAAAAAAAAAAAApWEqMRkbCwMAAAAAAAAAAAAAAACvaWBVHy0RFwkAAAAAAAAA
AAAAAMVnKC4WGAsAAAAAAAAAAAAAAAAApWhfVCAsEhYAAAAAAAAAAAAAAACsYiEqERQAAAAA
AAAAAAAAAAAAAMFueF0aKg8UAAAAAAAAAAAAAAAAlV5vUyAnEREAAAAAAAAAAAAAAACsa2ta
T08aJw4RAAAAAAAAAAAAALNkZ1EdJRAQAAAAAAAAAAAAAAAAyHJ3YENLFyQMDgAAAAAAAAAA
AACwZGVRHSUREAAAAAAAAAAAAAAAAKtvZl1MUxUhCwsAAAAAAAAAAAAAsWNnUBwlEA8AAAAA
AAAAAAAAAACXbXJiRlEQIAgKAAAAAAAAAAAAALFkbVNBQBQWCgEAAAAAAAAAAAAAnmtxX0VO
JzkPEwAAAAAAAAAAAABwjqy4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAExQVFhcYGRojJCUmJygpKissLS9
wcXJzf//////////YKNQkkB+MGYgVBA6CCgADXihaJNQekBmOFwYMQgQAAD4+LKsAAAAAGCh
UJBAfDBkIFIQOAgmAAp4oGiSUHlAZjhbGDEQIggP+Pi1rwAAAABopFiRSH04aihUGD8IHQAC
eJxojFh6SGY4UyAzEBgIBfj4trEAAAAAaKRYkUh9OGkoVBg+CB0AAnibaIxYekhnOFMgNBAY
CAb4+LixAAAAAGiiWJBIfDhoKFIYPQgcAAB4mnCTWHlIZjhTIDMQGAgG+Pi4swAAAABooViO
SHo4ZyhRGDwIGwAAeJlwklh5SGY4UyAzEBgIBvj4ubMAAAAAaKFYjkh6OGcoURg8CBsAAHiZ
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
AAAAAAAAwItzejxjMVsZRgAAAAAAAAAAAADHfXJpOVEtSBgzAAAAAAAAAAAAAKaHfX1IazJe
HUwAAAAAAAAAAAAAl3Nzaj1SLUkZNAAAAAAAAAAAAACriGV2S2wyXxhCAAAAAAAAAAAAAJ1z
e2o8UjFKGzUAAAAAAAAAAAAAr4lnd05tKVgXQwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAExYXGiMoLS9AAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJAJgDAAAAAAABAgUGBwgJCgsMDQ4P////////
////////////////+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+PgAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQIDA4QEhQYHB4gIiOlv//////////////////////
oIx4ZFAwEADIfVAyHgAAAAAAJCQjJCQjJSIhISMiISIiKAAIAAEIAAABAgMEBQYHCAkKCwwN
Dg//////////////////////+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+PgDAwMD
AwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwAQIDA4QEhQYHB4gIiOlv//////////////
////////oIx4ZFAwEADIfVAyHgAAAAAAJSUkJSUkIyIhICMhISIhWAAIAAEIAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJCQjJCQjJSIhISMiISIhJCQjJCQjJSIh
ISMiISIhAAAkJCMkJCMlIiEhIyIhIiEkJCMkJCMlIiEhIyIhIiEAACUlJCUlJCMiISAjISEi
ISUlJCUlJCMiISAjISEiIQAAJSUkJSUkIyIhICMhISIhJSUkJSUkIyIhICMhISIhAAAAAv0B
AQAAAAAF/gMCAwMAAAAAAAAAAAAAAAAA9AEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAeAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKAKADAAAAAHCJnaxwiZ2sJSUlJSUl
JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAATFhcaIygtMlMWFxojKC0yScmJSQnJiUkJyYlJCcmJSQnJiUkJyYlJCcm
JSQnJiUkJyYlJCcmJSQnJiUkJyYlJCcmJSQnJiUkJyYlJCcmJSQAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAsABAQAAAAA
JCQkJCEhISEhIB8fISEhISEfHx4hISEhIR8fHiAgICAgHh4dICAgICAeHh0hISEhIR8fHhsb
ISEhISEfHx4bGyAgICAgHh4dGhkgICAgIB4eHRoZFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU
FBQUFBQUICAgICAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACIiIiIiIiIiIiEgICIi
IiIiIiAeIiIiIiIiIB4iIiIiIiIgHiIiIiIiIiAeIiIiIiIiIB4cHCIiIiIiIiAeHBwiIiIi
IiIgHhwcIiIiIiIiIB4cHCIiIiIiIiAeHBwiIiIiIiIgHhwcFBQUFBQUFBQUFCIiIiIiIiIi
IiIiIiIiISAgIiIiIiIiIB4iIiIiIiIgHiIiIiIiIiAeIiIiIiIiIB4iIiIiIiIgHhwcIiIi
IiIiIB4cHCIiIiIiIiAeHBwiIiIiIiIgHhwcIiIiIiIiIB4cHCIiIiIiIiAeHBwUFBQUFBQU
FBQUIiIiIiIiIiIiIiIiIiIhICAiIiIiIiIgHiIiIiIiIiAeIiIiIiIiIB4iIiIiIiIgHiIi
IiIiIiAeHBwiIiIiIiIgHhwcIiIiIiIiIB4cHCIiIiIiIiAeHBwiIiIiIiIgHhwcIiIiIiIi
IB4cHBQUFBQUFBQUFBQiIiIiIgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwA
aA0AAAAAAQICAAEAAQIBAAEAAQgCAAEAAQgBAAEAAQYCAAEAAQYBAAEAcHV6f4SJjpOYnaKn
rLgAADw8PDw8PDw8PDw8PDy8PDw8PDw8PDw8PDw8PLw8PDw8PDw8PDw8PDw8vDw8PDw8PDw8
PDw8PDy8PDw8PDw8PDw8PDw8PLw8PDw8PDw8PDw8PDw8vAICAgABAAICAgACAAICAQABAAID
AgABAAACAgABAAACAQABAAADAgABAAIIAgABAAIIAgACAAIIAQABAAIJAgABAAAIAgABAAAI
AQABAAAJAgABAAIGAgABAAIGAgACAAIGAQABAAIHAgABAAAGAgABAAAGAQABAAAHAgABAHB1
en+EiY6TmJ2ip6y4PDw8PDw8PDw8PDw8PLw8PDw8PDw8PDw8PDw8vDw8PDw8PDw8PDw8PDy8
PDw8PDw8PDw8PDw8PLw8PDw8PDw8PDw8PDw8vDw8PDw8PDw8PDw8PDy8PDw8PDw8PDw8PDw8
PLw8PDw8PDw8PDw8PDw8vDw8PDw8PDw8PDw8PDy8PDw8PDw8PDw8PDw8PLw8PDw8PDw8PDw8
PDw8vDw8PDw8PDw8PDw8PDy8PDw8PDw8PDw8PDw8PLw8PDw8PDw8PDw8PDw8vDw8PDw8PDw8
PDw8PDy8PDw8PDw8PDw8PDw8PLw8PDw8PDw8PDw8PDw8vDw8PDw8PDw8PDw8PDy8PDw8PDw8
PDw8PDw8PLw8PDw8PDw8PDw8PDw8vDw8PDw8PDw8PDw8PDy8AAADAgIAAQADAgIAAgADAgEA
AQADAwIAAQADCAIAAQADCAIAAgADCAEAAQADCQIAAQADBgIAAQADBgIAAgADBgEAAQADBwIA
AQB6f4SJjpOYnaIAAAA8PDw8PDw8PLw8PDw8PDw8PLw8PDw8PDw8PLw8PDw8PDw8PLw8PDw8
PDw8PLw8PDw8PDw8PLw8PDw8PDw8PLw8PDw8PDw8PLw8PDw8PDw8PLw8PDw8PDw8PLw8PDw8
PDw8PLw8PDw8PDw8PLwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAICAAEAAAIBAAEAAAMCAAEAAAgCAAEAAAgBAAEAAAkCAAEAAAYCAAEAAAYBAAEAAAcCAAEA
TFBUWFxgZGiMkJSYnKCkqKywtLi9wcXJzf////8APDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PAAAAAA8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8AAAAADw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDwAAAAAPDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PAAAAAA8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8AAAAADw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDwAAAAAPDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PAAAAAA8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8AAAAADw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDwAAAAAAAAAAgICAAEAAgICAAIAAgIBAAEAAgMCAAEAAggCAAEA
AggCAAIAAggBAAEAAgkCAAEAAgYCAAEAAgYCAAIAAgYBAAEAAgcCAAEATFBUWFxgZGiMkJSY
nKCkqKywtLi9wcXJzf////8AAAA8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8AAAAADw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDwAAAAAPDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PAAAAAA8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8AAAAADw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDwA
AAAAPDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PAAAAAA8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8AAAAADw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDwAAAAAPDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PAAAAAA8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8AAAAADw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDwAAAAAPDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PAAAAAADAgIAAQADAgIA
AgADAgEAAQADAwIAAQADCAIAAQADCAIAAgADCAEAAQADCQIAAQADBgIAAQADBgIAAgADBgEA
AQADBwIAAQBOUlZaXmJmjpKWmp6ipqqusra/w8fLAAA8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDwEAgIAAQAEAgIAAgAEAgEAAQAEAwIAAQAECAIA
AQAECAIAAgAECAEAAQAECQIAAQAEBgIAAQAEBgIAAgAEBgEAAQAEBwIAAQBSVlpeYpKWmp6i
pqqussPHPDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8BwICAAIABwMCAAIABwgCAAIA
BwkCAAIABwYCAAIABwcCAAIACAgICAgIWpqeoqaqPDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8BwICAAIABwMCAAIABwgCAAIABwkCAAIABwYCAAIABwcCAAIACQkJCQkJ
WpqeoqaqPDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8BgICAAIABgMCAAIA
BggCAAIABgkCAAIABgYCAAIABgcCAAIAWpqeoqaqAAA8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANACwAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOAAQBAAAAAP+wDBQEAmQAcISYrAEAAgCLiqSh
e3sAAKmrAACLiqShe3sAAKmrAACLiqShe3sAAKmrAACLiqWie3sAAKiqAAD/sAwUBAJkAExU
XGQBAAIAmZigoHt7AAC7ugAAmZigoHt7AAC7ugAAmZigoHt7AAC7ugAAmZifoHt7AAC8ugAA
/7AMFAQCZACMlJykAQACAJuaoKB7ewAAvbwAAJuaoJ97ewAAvb0AAJuaoJ97ewAAvb0AAJua
oJ97ewAAvb0AAP+wDBQEAmQArLTFzQEAAgCbmZ+ee3sAAL69AACbmZ+ee3sAAL69AACZlp6c
e3sAAL28AACZlp+de3sAALy7AAAPAPgDAAAAAEoVAABgDgAA5hQAAPINAAAAAAAAwP8AAG4P
vhMAAAYY2hEAADIZEBMAAH4QAAAOEAAAAAAAAAAAbQ8AAFUOAAAoDwAA5g0AAAAAAAC0/wAA
AABACwAAAABZCAAAAACPCQAAYQsAAAwHAACPAHz3AAAAAAAAYA4AAAAAAADyDQAAAAAAAMD/
AAAAAL4TAAAAANoRAAAAABATAAB+EAAADhAAAAAAAAAAAAAAAABVDgAAAAAAAOYNAAAAAAAA
tP8AAAAAQAsAAAAAWQgAAAAAjwkAAGELAAAMBwAAjwB89wAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAANAAAABoAAAA0AAAAGgAAADQAAAAaAAAANAAaAAAANAAaAAAANAAaAAAAGgAAABoAAAA
aABoAAAA+gAAAH0AAAD6AAAAfQAAAPoAAAB9AAAA+gB9AAAA+gB9AAAA+gB9AAAAfQAAAH0A
AAB9AH0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAE0BAACnAAAA
TQEAAKcAAABNAQAApwAAAE0BpwAAAE0BpwAAAE0BpwAAAKcAAACnAAAApwCnAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAYFQAA
tBQAAAAAAAA8D9QXABkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAANAAAADQAAAA0AAAANAA0ADQAAAA+gAAAPoAAAD6AAAA
+gD6APoAAABNAQAATQEAAE0BAABNAU0BTQEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAQAAQCAAAAAJgFNAD/////BAAAAAmEBSA8ATAA/////wEAAAAAAADU
QAEwAP////8GAAAAnuc9gNz3PYBEATAA/////wIAAAAzGicCAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEQD8BQAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAEgBEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

--------------9YYEjC8OdzW7qlsGLL6n83Zp--
