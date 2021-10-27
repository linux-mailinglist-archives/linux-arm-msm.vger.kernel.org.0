Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE6843CE27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 17:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238076AbhJ0QBl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 12:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238466AbhJ0QBg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 12:01:36 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FC6C061745
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 08:59:09 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id na16-20020a17090b4c1000b0019f5bb661f9so2463357pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 08:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DN0M028IcPxor16NY4zNQ6KdrEsEqQ5iFPl6MyAoGPA=;
        b=Hkhe7iGI0K8SRI1G3HZ34zmXt2hr2U6Wv23X5uzs9hqgrmoqBYpKYqOkWURliScyfl
         IvDZ+wE+pmZvg1s6bdM1DVjTdwZ6KV9UyabipNaL9+HIH7G+orE6YRkq1gaSF1jeagkO
         J34i0OloyLcSwHnEnauUleIQOi5a/xeGJYriA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DN0M028IcPxor16NY4zNQ6KdrEsEqQ5iFPl6MyAoGPA=;
        b=ZdabsPgEPsW3/ZQjmRtnlt1Sh6ngWmv+cho3foLQ0GJngO4aLqx2FSeJwiz4zzJH4F
         ztlndisb07KLbcohIPYOFrHCVNXEBpgef71coON8wH96ZcVSHEj3GkH4V9R3BAOyj/gd
         xxxYiSaLv66KkoE7Rw11cVl/VLzw3Wg6TK0j2P7RhpRDu87l2VEmW2kWU2tgIs3HthIZ
         yizvY3ZNp4IiiYjjglqnPjNmdUR3OvPuYibeKqKI0qFNd/3tGj/t4z/k//aVRbOL2YYW
         tSCv7UIN9h3RJUgSugUd4kP5MUZKDCq2iycTcm2vlAU9Ki/sWJxtNbRPqaolBH+jgVZd
         qIgQ==
X-Gm-Message-State: AOAM530pqq8HL7T8mPKzbK5KGO0uMn8AOvlIY3eWeS47IJQpDJKeSSKD
        H2tKKeEG3r1xB0qj1jyjqJmftg==
X-Google-Smtp-Source: ABdhPJzG8mDMEBfswvzruxZuiMix01R6gOyZzzx38cUqlAm2dSx9WAjyiVtH8UA12FRXcQgLpTLiLw==
X-Received: by 2002:a17:902:aa08:b0:13f:eb2e:8ce8 with SMTP id be8-20020a170902aa0800b0013feb2e8ce8mr29833672plb.0.1635350349227;
        Wed, 27 Oct 2021 08:59:09 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:5ca8:d6ca:59bb:2694])
        by smtp.gmail.com with UTF8SMTPSA id f203sm386161pfa.112.2021.10.27.08.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 08:59:08 -0700 (PDT)
Date:   Wed, 27 Oct 2021 08:59:07 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     tjiang@codeaurora.org
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Subject: Re: [PATCH v3] Bluetooth: btusb: Add support for variant WCN6855 by
 using different nvm
Message-ID: <YXl3S7TT30PFfyB8@google.com>
References: <1d19afff955cdc8d47582297a26246d9@codeaurora.org>
 <YXgrwKUZwUWuWfG4@google.com>
 <fe118b60df5881b0e9938f57aae6f87e@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fe118b60df5881b0e9938f57aae6f87e@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 27, 2021 at 02:12:07PM +0800, tjiang@codeaurora.org wrote:
> Hi Matthias:
>   the previous patch is submitted by zijun , as he is not working on this
> project, I take over his job, so can we assume abandon the previous patch,
> using my new patch ? thank you.
> regards.

Your patch is clearly based on zijun's one, it even has the same subject. A
change of authorship shouldn't result in resetting the version number, it's
still the same patch/series. You can always add a 'Co-developed-by:' tag to
indicate that someone else contributed to a patch, or use a 'From:' tag if
you only made minor changes on top of someone else's work.

Not sure how to proceed best with the version number, especially since there
are already 3 versions of the 'new' patch. Either option can create confusion,
I guess you can continue with the new scheme, it seems the patch is almost
ready to land anyway.
