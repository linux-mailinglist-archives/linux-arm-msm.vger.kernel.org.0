Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E29D13DA01D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 11:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235260AbhG2JOD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 05:14:03 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:50639 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235141AbhG2JOD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 05:14:03 -0400
Received: from [192.168.1.101] (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3EC2C200D2;
        Thu, 29 Jul 2021 11:13:57 +0200 (CEST)
Subject: Re: [PATCH] drivers: usb: dwc3-qcom: Add sdm660 compatible
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210728221921.52068-1-konrad.dybcio@somainline.org>
 <YQJDboMpZ+C7F2fz@kroah.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <81c1cc03-43a6-79d4-7cfb-7645d1eef665@somainline.org>
Date:   Thu, 29 Jul 2021 11:13:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQJDboMpZ+C7F2fz@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 29.07.2021 07:58, Greg Kroah-Hartman wrote:
> On Thu, Jul 29, 2021 at 12:19:21AM +0200, Konrad Dybcio wrote:
>> Add a new compatible for SDM660's DWC3.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Odd mailing list you sent this to, what tree do you expect this to go
> through?
>
> thanks,
>
> greg k-h

I just went with whatever get_maintainer.pl suggested. Unless you mean the postmarketOS one, which I always include so that folks from this project interested in qcom soc+phone enablement can see them in one place.


Konrad

