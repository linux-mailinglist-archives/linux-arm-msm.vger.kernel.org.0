Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8674E7B48
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Mar 2022 01:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231975AbiCYUE3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 16:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231991AbiCYUCq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 16:02:46 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7D722E975
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 12:53:36 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id t21so4409724oie.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 12:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=0hR6detCmXtBfWRoT9BJ6sxe7MY2tS62yTtZv+WfRSk=;
        b=Seytbq0ydpKuf4R/CyPUY/RawpIlqEaJ4Z0EZqfX6FmGs61zB80vlRBAsUDj1kurSS
         kWxzjhd1LDWsx5tyTheiAPEzLqnhJHL+zL1NLYXJuC5XBF3HBRYm7mseDe7dao7SPQG7
         jav5tOdvRThgw1uB1iC1x91aXdcyrIWWjnb9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=0hR6detCmXtBfWRoT9BJ6sxe7MY2tS62yTtZv+WfRSk=;
        b=Wf8JGVCvTnRh9yaDSNwpkqINwQCJLgS4R2DJqqm7e2e3hdPXFZAcg/nc581y/Z0V2k
         8vieIanWFOMTB2xa3t0nSX5kMi5vPuGqkZtlNXVQIOYzX4RHPEAcJDLVyvw5nTVjLibc
         vaVK9PVMwiiCVYs9jXyy89CtOttd0sNBb4WDEi9OdoHRXKnRA/uEKh5uvJTTDkFk4bWl
         +RjLQ4aJ/D10fPhmP2g14JN0ByZpIyPL7Z6OEKz8VtxFtf1gF9+zGH0BjZg3jk8dBLZ+
         QLNBfaw5ogunSg4/B/Kka4QuyWOHawKayz63uE+HEYYBi9HKSwOA2LRbdxWyj6sDezml
         Pviw==
X-Gm-Message-State: AOAM533nKf/jK0gb8oicIQiThseaGq4lzHrzA2dNCwd8qmBpkH8OFYTH
        xWruS9pV0aj4JJys8c7kSZmhGPnk9+pssPkTlWKjxjKur4k=
X-Google-Smtp-Source: ABdhPJwbK62nqj0K16SlmWCuvK8uzSLq7hC1YqLJsKiKUskGxk5vQgX1QjEjgxJTRooFAFH89FdqEOTUmOxG2mp0o10=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr5947337oif.63.1648230185963; Fri, 25
 Mar 2022 10:43:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Mar 2022 12:43:05 -0500
MIME-Version: 1.0
In-Reply-To: <1648209491-30165-7-git-send-email-quic_c_skakit@quicinc.com>
References: <1648209491-30165-1-git-send-email-quic_c_skakit@quicinc.com> <1648209491-30165-7-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 25 Mar 2022 12:43:05 -0500
Message-ID: <CAE-0n50ApgiYbxHbU072s5-QLAmEppjDH9brKbfHja7hiue4xA@mail.gmail.com>
Subject: Re: [PATCH V8 6/7] arm64: dts: qcom: pm8008-regulators: Add base dts
 file for pm8008 regulators
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-03-25 04:58:10)
> Add base DTS file for pm8008 regulators with 7 ldo nodes.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---
> Changes in V8:
>  - Previously added pm8008 dtsi file is split into 2 files, one for infra
>    and other for regulators.

Does pm8008 come in one package that gets soldered down on the board? If
so, this should be one file instead of two, i.e. pm8008.dtsi. We don't
make a -regulators dtsi file for other pmics.
