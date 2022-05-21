Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6141052FE6E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 18:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243578AbiEUQvQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 12:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242650AbiEUQvP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 12:51:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6893828702;
        Sat, 21 May 2022 09:51:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 14B8BB80886;
        Sat, 21 May 2022 16:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B374C385AA;
        Sat, 21 May 2022 16:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653151871;
        bh=BOha99GUWNN4v2qhtEDEt3nCgtImNYy1M1W7rwHu7Os=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=TGyCfLjwAPnlw3Wami0qFWVBmYZjfpW0m1My5krlS0jGDi0zdzvvq9s2eqyepzHjy
         Ju5Q8vTFkAMDOjnV/TEL2q4HIwdqS3d39zEa63Eskhg7331moCNo25buEhC0Y8cutS
         TJQa3+tsjB90epACWRDmgEPapaPU8BGR8ussScSH262hMr8CzUwrKGOXaaGMjdW96F
         +Xa9NTtSONYSesPZirlJOqFiEHXjoeUoLsUvL0anf90i2VakcoGnQH6B2hkjZ6omi1
         Qg5bq1O9q6OK0qQ1xi+tJRG9X/UyOyn4s87RTpZKf98P5IXJJZIs4U2TxwzMgo1QQi
         RJQDG/Fj4kHLw==
Message-ID: <aed5ee02-90d3-fa0d-3563-c83987d011a3@kernel.org>
Date:   Sat, 21 May 2022 18:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: sdm630: fix gpu's interconnect
 path
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
 <20220521152049.1490220-8-dmitry.baryshkov@linaro.org>
 <20220521161750.3jvvmlfrvk6yxwkp@SoMainline.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220521161750.3jvvmlfrvk6yxwkp@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2022 18:17, Marijn Suijten wrote:
> 
> And also added my Reviewed-by there.  I think it is normal to have a
> Reviewed-by on top of a Suggested-by/Reported-by, so that I as reviewer
> confirm the contents of the patch?

The review tag is not used to confirm anything like that.

> 
> Since this is the third patch missing these, It may just have been an
> oversight.

If your review was meeting the criteria of "Reviewer's statement of
oversight", then of course should be added here.


Best regards,
Krzysztof
