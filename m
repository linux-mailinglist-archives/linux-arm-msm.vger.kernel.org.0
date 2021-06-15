Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04353A8CE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 01:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhFOXxf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 19:53:35 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:43875 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbhFOXxe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 19:53:34 -0400
Received: from [192.168.1.101] (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id ECC0D1F568;
        Wed, 16 Jun 2021 01:51:26 +0200 (CEST)
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for SONY Xperia 1 II
 / 5 II (Edo platform)
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
References: <20210612192358.62602-1-konrad.dybcio@somainline.org>
 <20210612192358.62602-3-konrad.dybcio@somainline.org>
 <YMk7rf4/03AcIghT@builder.lan>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <1455b8ba-f075-e0f4-885e-3e57a42c75cf@somainline.org>
Date:   Wed, 16 Jun 2021 01:51:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMk7rf4/03AcIghT@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 16.06.2021 01:45, Bjorn Andersson wrote:
> On Sat 12 Jun 14:23 CDT 2021, Konrad Dybcio wrote:
>
>> Add support for SONY Xperia 1 II and 5 II smartphones (read one/five mark two).
>> They are based on the Qualcomm SM8250 chipset and both feature 5G modems. There
>> also exists a third Edo board, namely the Xperia PRO (PDX204), but it's $2500
>> and no developers have obtained it so far (to my knowledge).
>>
>> The devices are affected by a scary UFS behaviour where sending a certain UFS
>> command (which is worked around on downstream) renders the device unbootable,
>> by effectively erasing the bootloader. Therefore UFS AND UFSPHY are strictly
>> disabled for now.
>>
> Ouch, that's expensive paper weights. Let's hope someone can shed some
> light on the UFS situation.

Angelo expressed his concerns here [1], and is trying to resolve the situation

in a sane(-ish, it's not possible for it to be completely sane..)  way. Hopefully

more updates can follow suit and we won't have to stick to SD cards forever..


[1] https://lkml.org/lkml/2021/6/11/1114


Konrad

