Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C16D423424
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 01:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236799AbhJEXLa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 19:11:30 -0400
Received: from ixit.cz ([94.230.151.217]:57632 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236700AbhJEXL3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 19:11:29 -0400
Received: from [192.168.1.101] (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 376BE23B26;
        Wed,  6 Oct 2021 01:09:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1633475374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ryaZOCEIyzEMf9WLB8AWdQNR9eOGIYijtgw+PlfnnDA=;
        b=ofWsGyVBqJwUGnXZmDn19pSLk9dH8KHRo++Z1SMqNkulyLHIlOPLGma7Xuz0rbKhOYpBCm
        7D0CHrFisBcx5xygqa+E7p8gExn7siXeNAYOVmaT0grnHlQfhczS6d+Lwl1TRxt7m7AD1X
        ZtkOrVpT0WvYwQwmcb+kBKglmKAGJcM=
Date:   Wed, 06 Oct 2021 01:08:06 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: rename vendor of
 apq8026-lenok
To:     Rob Herring <robh@kernel.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Message-Id: <IL1J0R.Y3YCSF1D43YJ3@ixit.cz>
In-Reply-To: <YVtKY6wY4GJpwVvF@robh.at.kernel.org>
References: <20210928203815.77175-1-luca@z3ntu.xyz>
        <YVtKY6wY4GJpwVvF@robh.at.kernel.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Acked-by: David Heidelberg <david@ixit.cz>
Best regards
David Heidelberg

On Mon, Oct 4 2021 at 13:39:31 -0500, Rob Herring <robh@kernel.org> 
wrote:
> On Tue, 28 Sep 2021 22:38:14 +0200, Luca Weiss wrote:
>>  In order to avoid having prefixes for multiple internal divisions 
>> of LG
>>  use the "lg" prefix instead of "lge".
>> 
>>  Fixes: 21f3cbf693b0 ("dt-bindings: arm: qcom: Document APQ8026 SoC 
>> binding")
>>  Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>  ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
> 
> Acked-by: Rob Herring <robh@kernel.org>


