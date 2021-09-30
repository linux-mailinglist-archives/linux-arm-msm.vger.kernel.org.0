Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A372141D212
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 06:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbhI3ECp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 00:02:45 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10522 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229512AbhI3ECp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 00:02:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632974463; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0fT3aNKXsrBX4t+tHvtMz9qUHFpaZPC4Ksn3XbXKe6g=;
 b=ruc+jp4Hu8r5il3ZjHX2Ot1WOKce/P3oRLwiOaKSuj4GsogrlC0JaNvgURzqzquWeaiwU/yC
 JArLlmcTgmTtatszENq/thh5Gx+HlrC16/vLNkHaQyM6B2gtCd5BAaMj0E2/L204Q9iZaV3u
 eoSqNN02+yKc4LlEHy7vqDJP/Hc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6155366a9ffb4131490a2466 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Sep 2021 04:00:42
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1295C43617; Thu, 30 Sep 2021 04:00:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 22C8BC4360C;
        Thu, 30 Sep 2021 04:00:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 30 Sep 2021 09:30:41 +0530
From:   skakit@codeaurora.org
To:     Douglas Anderson <dianders@chromium.org>,
        bjorn.andersson@linaro.org
Cc:     vkoul@kernel.org, mka@chromium.org, swboyd@chromium.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: pmk8350: Make RTC disabled by default;
 enable on sc7280-idp
In-Reply-To: <20210929153553.1.Ib44c2ac967833d7a3f51452d44d15b7b8d23c1f0@changeid>
References: <20210929153553.1.Ib44c2ac967833d7a3f51452d44d15b7b8d23c1f0@changeid>
Message-ID: <86b0d847ddf06c1b445f3dbac9c771a9@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-30 04:08, Douglas Anderson wrote:
> The RTC on the pmk8350 is not useful on all boards. Some boards may
> not provide backup power to the PMIC but might have another RTC on the
> board that does have backup power. In this case it's better to not use
> the RTC on the PMIC.
> 
> At the moment, the only boards that includes this PMIC are sc7280-idp
> and sc7280-idp2. On sc7280-idp I'm not aware of any other RTCs, but
> sc7280-idp2 has a Chrome OS EC on it and this is intended to provide
> the RTC for the AP.
> 
> Let's do what we normally do for hardware that's not used by all
> boards and set it to a default status of "disabled" and then enable it
> on the boards that need it.
> 
> NOTE: for sc7280-idp it's _possible_ we might also want to add
> `allow-set-time;`. That could be the subject of a future patch if it
> is indeed true.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 

Reviewed-by: Satya Priya <skakit@codeaurora.org>
