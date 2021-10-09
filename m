Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC7D3427D1C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 21:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbhJITeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Oct 2021 15:34:01 -0400
Received: from ixit.cz ([94.230.151.217]:47568 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229558AbhJITeB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Oct 2021 15:34:01 -0400
Received: from [192.168.1.138] (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 7952920064;
        Sat,  9 Oct 2021 21:32:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1633807921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fX6B3OCFKTs9Z2THMtjC2lKC8OTImP1906QvoIabr1E=;
        b=Bihbb444bEpID2hfUuYddLFUfON5LcLQZ7VXo2DchfU8HdjFTPTh5HiE4kTG7DHWIb1c4H
        EgKi/6p0H1pGwTYones4A3sm+7XHDcbg8MCHTCiYds4hcJQZBCMiWexhzX8SWM7sEV3AHX
        uJSRFoSmr9VbiOGvi/puyxzUiEYyo0M=
Date:   Sat, 09 Oct 2021 21:30:32 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] dt-bindings: arm: qcom: add ipq4019 standalone entry
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <W66Q0R.AIXYHM0GGPWB3@ixit.cz>
In-Reply-To: <YUgLx7zKmD/QTCfn@builder.lan>
References: <20210909060450.10111-1-david@ixit.cz>
        <YUgLx7zKmD/QTCfn@builder.lan>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Yeah, this one patch is nonsense. Sending new patch series adding 
compatible to the IPQ40xx/AP-DK01.1-C1 instead of accepting generic 
board compatible.
David

On Sun, Sep 19 2021 at 23:19:19 -0500, Bjorn Andersson 
<bjorn.andersson@linaro.org> wrote:
> On Thu 09 Sep 01:04 CDT 2021, David Heidelberg wrote:
> 
>>  It seems that some ipq4019 boards just accepted architecture.
>> 
>>  Signed-off-by: David Heidelberg <david@ixit.cz>
>>  ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>> 
>>  diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml 
>> b/Documentation/devicetree/bindings/arm/qcom.yaml
>>  index 5169ebb97946..9b6dd7dc3825 100644
>>  --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>  +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>  @@ -174,6 +174,9 @@ properties:
>>                 - qcom,ipq4019-dk04.1-c1
>>             - const: qcom,ipq4019
> 
> It seems reasonable to expect that the board isn't just a 
> "qcom,ipq4019"
> and in that case I believe this should cover all boards.
> 
> Please let me know if I'm misunderstanding things.
> 
> Regards,
> Bjorn
> 
>> 
>>  +      - items:
>>  +          - const: qcom,ipq4019
>>  +
>>         - items:
>>             - enum:
>>                 - qcom,ipq8064-ap148
>>  --
>>  2.33.0
>> 


