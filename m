Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307CD48EB60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 15:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241417AbiANOPr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 09:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbiANOPq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 09:15:46 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BFCC06161C
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 06:15:46 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id o3so13487965pjs.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 06:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gIos4GkO2iqYWjr5mhM1is7Azpf5/j6Jd0z5PdzqEZM=;
        b=FhPhOVrgiQIgjwrvUl8LqJ3TpxdvbrH15EqUtc2jTWLZRmsKG3S1do6NwptiB4+n4Y
         NcFfh4IlLyleLTi7TwVu4IqDq3kPeQAvTFzxTptLwMWCecZFccZngybfR7nKxbVjRB3/
         +9bpTkD8HSlEylA7FfQtuICHaRHh8fTh4qjqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gIos4GkO2iqYWjr5mhM1is7Azpf5/j6Jd0z5PdzqEZM=;
        b=Hc0OFCuSDUawEKopdIHegnYAdfPCzounhEoT6iC1vEqRZHia8gXMUfAV/+OmyEGbZs
         PFK8y7QXIz85yz7ZJyc0ReMEFaOad5Df9d9jQuleJkY9FTbsrqwVINzVPoto7FhT//oh
         Y+GrIvh0yohILwT4hY0ByshnKjrSRAiGg8JMa5BtnNWWMC5C4vhY2uBsHN3vIsLq93id
         XYFfeQD17PU2zN+bK9LD+264KRHixgbz+hUzBYtC1jhRPF6Ll38p6AUMqYcYUg5Z4nN7
         VkNX9SoTx/CRCJ+ynZfPTiXkXDK8ce5qVdqVzx46G6wex4provCUGRAYvEBebJRGbYt3
         G6qw==
X-Gm-Message-State: AOAM532on1hzgKDZ1r4lTFZEwyZlJ+9BQ2lz1VemPsqPfWhjWgRC8HAi
        pH8bXR0FOGlSUM/bZP9Hci/J8A==
X-Google-Smtp-Source: ABdhPJxTTJQRzasKLq5iWQnNgDSmZDI0ri1UAx7npHnhGH5WObJT3xk9wMvWJ+uOQ2KFU/Cl6ALYCA==
X-Received: by 2002:a17:903:2311:b0:14a:8068:a6d with SMTP id d17-20020a170903231100b0014a80680a6dmr6860296plh.70.1642169745841;
        Fri, 14 Jan 2022 06:15:45 -0800 (PST)
Received: from localhost ([2620:15c:202:201:d9fc:bf52:3ca:199b])
        by smtp.gmail.com with UTF8SMTPSA id i13sm4785019pgl.81.2022.01.14.06.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 06:15:45 -0800 (PST)
Date:   Fri, 14 Jan 2022 06:15:43 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        quic_rjendra@quicinc.com, sibis@codeaurora.org,
        kgodara1@codeaurora.org, swboyd@chromium.org,
        pmaliset@codeaurora.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7280: Move herobrine-r0 to its
 own dts
Message-ID: <YeGFj/lfCLn79yzw@google.com>
References: <20220114004303.905808-1-dianders@chromium.org>
 <20220113164233.2.Id9716db8c133bcb14c9413144048f8d00ae2674f@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220113164233.2.Id9716db8c133bcb14c9413144048f8d00ae2674f@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 13, 2022 at 04:43:01PM -0800, Douglas Anderson wrote:
> The upcoming herobrine-r1 board is really not very similar to
> herobrine-r0. Let's get rid of the "herobrine.dtsi" file and stick all
> the content in the -r0 dts file directly. We'll also rename the dts so
> it's obvious that it's just for -r0.
> 
> While renaming, let's actually name the file so it's obvious that
> "herobrine" is both the name of the board and the name of the
> "baseboard". In other words "herobrine" is an actual board but also
> often used as the name of a whole class of similar boards that forked
> from a design. While "herobrine-herobrine" is a bit of mouthful it
> makes it more obvious which things are part of an actual board rather
> than the baseboard.
> 
> NOTE: herobrine-rev0's days are likely doomed and this device tree is
> likely to be deleted in the future.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
