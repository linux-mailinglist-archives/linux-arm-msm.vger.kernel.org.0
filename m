Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 281066510B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 17:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbiLSQuC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 11:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232215AbiLSQtx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 11:49:53 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D5A12ABB
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 08:49:50 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 203so5547184yby.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 08:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3dexYhaJLyySOgzO9m48Qw/vO3VgX3BHvOpR8vVBWes=;
        b=D8tSclNVxbCISqviSYEzS21MfzTjmpNSE1ZMOx8zrlQ1/KZljKXGooJL9gtVgiIbJ5
         Yi9lHz4WI16IFe0yf2SZEORuhJ8BT95pVYGMMBBv0Yy99rTTRJnxVOpDpBeKm+VEVNlB
         +3pBfPTexE8uL17VAP4hrxMOSdClpz3TnDggZGy4mXprCd1lHRqBq6O303LwBenPk813
         G0161ohM/2xHc5mlYbHz0f4mijAc7J+188tIB8YWOSQHwD2SwBOoh4d8n18FcqAdKuxy
         TNJuOiX9HtQrmravUtqURfMn6ujVK660Gs+Ja+3fsV4h2v9dobqEeYz9UxiVkVQR6C0h
         Ua4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dexYhaJLyySOgzO9m48Qw/vO3VgX3BHvOpR8vVBWes=;
        b=6kisdbcTmIT2lv3wQz+Ur7mCjQ7cB4IRb3utQYcRl2DYI94ROS9ZKKUjP6h2ViQV4O
         JPsncIRBKdkWC9g50/Xczev51E3DAvM5G3n+bWvE6/x/HhhWmPtagZ4Gpbc+K6s++P5M
         FXFmQ3ajzmoO/MR+udFfuoSmaPIzdtgByqYQOE4hwrOcWLCgpn993ubiEwsP9xu47kYO
         uxQwxsKvfR7UL4pFJxP/omvROWekbnov+i3O2p5zAv0naoAuuKLGQEDW9fD1QTqtORtK
         Onp8n+RL+OzWDY8oGgufUl3DkgkZ4z2B/lj9jYaw1sw/WAolI9F5+rHexRH+cRiN7Ncb
         nJwQ==
X-Gm-Message-State: ANoB5pnT1mQ9y5crZgdC2AqfRu25KrLrTb5bn702/n93MXw9H7TYcOM5
        ZS1QcwGkUS1Hl6PtbSKgZ48pQAQXLlSxKQ2m4OOxeA==
X-Google-Smtp-Source: AA0mqf4gHYmK8JkvwzZvAxfT6E1BXC6RfjcLbInwrxFtU8RIjc8fyTi+XuELpawTO115/OX9+gZcV+YpNCMAm876y3I=
X-Received: by 2002:a25:8544:0:b0:723:5b57:cde9 with SMTP id
 f4-20020a258544000000b007235b57cde9mr4473256ybn.194.1671468590135; Mon, 19
 Dec 2022 08:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
 <20221212192340.evgtbpzmw7hcdolb@halaney-x13s> <20221213052802.GB4862@thinkpad>
 <ec64e3a0-085d-7830-fd4e-6969c1c9bbdf@linaro.org> <20221213175738.GI4862@thinkpad>
 <195a55f1-76e7-3f00-da1f-4ae84f7943c0@linaro.org> <20221219135046.GA126558@thinkpad>
 <1df13a83-1926-05b5-f7c7-388ef431a2fa@linaro.org> <20221219141643.GB126558@thinkpad>
In-Reply-To: <20221219141643.GB126558@thinkpad>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 19 Dec 2022 18:49:39 +0200
Message-ID: <CAA8EJppVGAQ_OLGbsor67c4MdL4kTVL-9O+geX8AcKEjL9s92w@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] Qcom: LLCC/EDAC: Fix base address used for LLCC banks
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        bp@alien8.de, tony.luck@intel.com, quic_saipraka@quicinc.com,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 19 Dec 2022 at 16:17, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Mon, Dec 19, 2022 at 03:11:36PM +0100, Krzysztof Kozlowski wrote:
> > On 19/12/2022 14:50, Manivannan Sadhasivam wrote:
> > >
> > >>> Also, the id table is
> > >>> an overkill since there is only one driver that is making use of it. And
> > >>> moreover, there is no definite ID to use.
> > >>
> > >> Every driver with a single device support has usually ID table and it's
> > >> not a problem...
> > >>
> > >
> > > Are you referring to OF/ACPI ID table? Or something else?
> >
> > No, I refer to the driver ID table (I2C, platform whatever the driver is).
> >
>
> Yeah, that's what I wanted to avoid here. The ID table makes sense if you have
> a bus like I2C or a separate subsystem but here LLCC is an individual driver.
> So creating a separate ID table is an overkill IMO.

Well, struct platform_device_id is used quite a lot together with the
MODULE_DEVICE_TABLE(platform, _ids);

On the other hand:

$ git grep MODULE_ALIAS.*platform: | wc -l
1308
$ git grep MODULE_DEVICE_TABLE.*platform | wc -l
236

-- 
With best wishes
Dmitry
