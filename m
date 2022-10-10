Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 568A85F9DAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Oct 2022 13:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbiJJLe6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 07:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbiJJLe6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 07:34:58 -0400
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182F514082
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 04:34:52 -0700 (PDT)
Date:   Mon, 10 Oct 2022 11:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1665401689; x=1665660889;
        bh=I797lO8UXa57zP09FmaHs4NE3i8Glp5M1ZPBPrUbrjg=;
        h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=jkG5A8xkyU+NYZ+nyAM7Yzw7uHKAoCL+/bx11OwNlgUp43MNraT0TJI5ykH5IkepH
         G6vVn6ja2vFFXCVgjCAewzslpTCWF60mX/T6uLtfKZYL013+ZW8Q+CYquO4yb51Tif
         u7CRhRlzqpp0Y/qICfRubHqXLm2T3pFuARMQLmVA=
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Vinod Koul <vinod.koul@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
From:   Caleb Connolly <caleb@connolly.tech>
Subject: Re: Qualcomm DT bindings and DTS cleanups - tracking community wide
Message-ID: <a5bc5342-be84-9a1b-e40a-1cb9ceea47ae@connolly.tech>
In-Reply-To: <faa4e821-00e0-4ee0-0c62-b5eb6f75abf7@linaro.org>
References: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org> <faa4e821-00e0-4ee0-0c62-b5eb6f75abf7@linaro.org>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 04/10/2022 15:50, Krzysztof Kozlowski wrote:
> On 22/09/2022 16:32, Krzysztof Kozlowski wrote:
>> Hi everyone,
>>
>> Quite a lot of people are working on Qualcomm DT bindings conversion
>> (TXT->YAML) and fixups to Qualcomm DTS. We track a bit of this effort
>> internally in Linaro, but that has many shortcomings and we would like
>> to track it rather community-wide with the support and contributions
>> from the community.
>>
>> What to track:
>> 1. Which bindings to convert to YAML,
>> 2. Missing compatibles (either entirely or because of missing conversion=
),
>> 3. `dt_binding_check` warnings (usually connected with 1-2),
>> 4. `dtbs_check` warnings.
>>
>> Rob's bot gives us daily output for 1-4, but how can we track current
>> efforts to avoid duplication of work? Also it would allow people to find
>> tasks for them to get contributions to Linux kernel :). Is anyone in
>> community interested in tracking it together, in a public way?
>>
>> If so, where?
>> A. elinux.org (needs some formatting when pasting the output from tools)
>> B. gitlab pages/wiki (maybe scripts could parse tools and create the pag=
e?)
>> C. gitlab dedicated repo - some text file
>> D. Linux kernel TODO file (might be difficult to keep updated)
>> E. kernel.org wiki (requires LF accounts, AFAIK, a bit pain to edit; I
>> have it for Exynos but I don't find it usable -
>> https://exynos.wiki.kernel.org/todo_tasks)
>
>
> Hi All,
>
> Any thoughts on this? So far I did not receive any responses, so
> probably this could mean that there is little interest in this?

Hi Krzysztof,

I think a GitLab repo with some automatically generated issues and some sor=
t of
overall coverage map might be a good way to track this. Especially if it ca=
n be
shown on a per-device basis as well.


>
> Best regards,
> Krzysztof
>

--
Kind Regards,
Caleb

