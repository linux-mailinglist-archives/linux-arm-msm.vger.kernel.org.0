Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA8A1E6CB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 22:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407256AbgE1Ugn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 16:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407240AbgE1Ugh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 16:36:37 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D784C08C5C8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 13:36:37 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id q16so49154plr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 13:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vRratM29kdQLg6OaUHiYE8TMO8cnRbvNntJYzvfFXSk=;
        b=T7eZHHorrBd8JFM+hOZZRuALMG/zzJsIFsg+LxOKQwBMyAHrC262d4inPtrnaJt+va
         yLEq0Qez19ig8V3/ALoOaNLZPEJbfrEWnUbvJDIATCHuvynuk0yuEpDMOIKeHMPTYzuD
         yIYJU60JDMPHw6GSHpcbJISLoidt1oq371dSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vRratM29kdQLg6OaUHiYE8TMO8cnRbvNntJYzvfFXSk=;
        b=WLnYpPhFuESIgzFFFeWA7GY0EuEeAvx+pfsub2cP/j+x0sCmlSuPmkvBIRcg5t6Q+p
         p53LN+POyunJJ4u3ZSKetaf8tZYWHDjQJnwHcXex5BPNGLAfYsVSKdhGtZ2o9vSsNimB
         MR2v2Ad25AuTQaqhk96ipZk2kJ59pmzWGSu53GkAOIA7Fbz8IrRUtgR2WmQUbD7dzb3U
         YWFhOC4kB7McPKFcnkzzXjMG3TfKoiKYClpej8kLfgJSxsrLUqGFOdF0EAuIK4yh91sD
         bBgdBZkUA3cEXkx20jVOx57HKCPNJ/HbxKWW3OPyBW/tsU1y93MY9SQVn7CQp4Iwqc4q
         koRw==
X-Gm-Message-State: AOAM532lrkGH6/VecdqVVQkf2ZFxP85r1wDViSJfguQ+ZQ7Aso9hR/0j
        6J3uvpQ//tBbxQztU80tXyWZGg==
X-Google-Smtp-Source: ABdhPJz0vzCp28UVxFHgxO6i1oU9ENre+0ToKo3mus4i/ki7fmTgbriZthiFUhxD0Bpkb4yypDwBjA==
X-Received: by 2002:a17:90a:1b41:: with SMTP id q59mr5462545pjq.218.1590698196726;
        Thu, 28 May 2020 13:36:36 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id w26sm5411392pfj.20.2020.05.28.13.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 13:36:36 -0700 (PDT)
Date:   Thu, 28 May 2020 13:36:34 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org
Subject: Re: [PATCH v3] Bluetooth: hci_qca: Improve controller ID info log
 level
Message-ID: <20200528203634.GL4525@google.com>
References: <1590663797-16531-1-git-send-email-zijuhu@codeaurora.org>
 <20200528151700.GI4525@google.com>
 <f336a66a-d392-c995-e28d-34c9cc465371@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f336a66a-d392-c995-e28d-34c9cc465371@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 29, 2020 at 03:42:54AM +0800, Zijun Hu wrote:
> 
> 
> On 5/28/2020 11:17 PM, Matthias Kaehlcke wrote:
> > On Thu, May 28, 2020 at 07:03:17PM +0800, Zijun Hu wrote:
> >> Controller ID info got by VSC EDL_PATCH_GETVER is very
> >> important, so improve its log level from DEBUG to INFO.
> >>
> >> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
> > 
> > Please add the tags from earlier version unless the new patch has
> > substantial changes.
> > 
> actually, this v3 patch is only to correct the code stye issue pointed
> by you. let me resend it.

no need to resend it, it was just a reminder to do it in the futre.
