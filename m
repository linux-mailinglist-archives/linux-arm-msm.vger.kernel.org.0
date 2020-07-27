Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B6822F79F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 20:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729743AbgG0SUx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 14:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729489AbgG0SUx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 14:20:53 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2733C061794;
        Mon, 27 Jul 2020 11:20:52 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id c2so7001356edx.8;
        Mon, 27 Jul 2020 11:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8FUUw7esIwbMihyXWPXnlrNpN5U1e9E3wlcfC8HucZM=;
        b=P8qW6bcXTH3Gi5PFyL52lOBoTaBYB1NoYPtY3IxVG7AD4QJVbu1XqrMGCuuPgzr3uS
         7hEZPz8f9nQpiu1dayflvrHe/dZxIcXhQhh/lQLuEctzSHyDDLFdloBPnlEDMxEan5LI
         E2ZF0bPSbZeRwj63itJZvoPpwqtBR247WiWKh/2vDziQpTcDzF6bwZeR6nZg25cBCgE9
         p/q8makFjjL3XLCdqB8vuSVmA56oAwIY9PCX+yEesPyakuZR7XNLlITNoP08v4ai0mQR
         Q9jY0I/L7FOmBkTncNPSvIpEiJaCM9oBM44eAIbg70sPAQcY04E2u6QFTr0LchIT633o
         hM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8FUUw7esIwbMihyXWPXnlrNpN5U1e9E3wlcfC8HucZM=;
        b=GkvVBAJcX21CqUnFhT+W00uEBkhY55gTVma0+A8WFThkZu1kJD8VjBc0CIyONid0yp
         UDBWnSys+igA3WA4pjD+DjIQ8BGEWbuK0KD3dh8fEscZUsTTHo7My58V5Xc77M+LK/7n
         XpbDpKNXLjGO0CbAKAsNdK2+U8gMQ2dQEpcK0lPo5s0fOdenkCrPB18UULC815ZRXz8j
         qVTE05MUdN3js0EvZh+45QCJceBN/OzXhp9J7A+OMLBghgskFFX/4gTazWaFfclwDudg
         ojWV9uCrQMu+v6PtmNv4Dl3qLGS0xD6eoAHFUHauLcS5E/UgD+L5cjO5O2G2GvxcJNAm
         +z6w==
X-Gm-Message-State: AOAM5313FcFofs3hVTQWh1Lk20VyhZr4U/xTvM5YcpuWoU46+XUxIHZU
        hJ8zWKKZ1feSWsdXfrXJlt8dWYAvQd5ue75q+tM=
X-Google-Smtp-Source: ABdhPJwK0LKOzxxRi7pxIz+arVdqs+BEK6hM7r+hWZ3wgjG2UaXOYBquWiCHySb+WcX4lDcFaaaclsdZohfDFsLYoHs=
X-Received: by 2002:a05:6402:b57:: with SMTP id bx23mr21585421edb.304.1595874051657;
 Mon, 27 Jul 2020 11:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200625182118.131476-1-konradybcio@gmail.com>
In-Reply-To: <20200625182118.131476-1-konradybcio@gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 27 Jul 2020 20:20:15 +0200
Message-ID: <CAMS8qEVKssmOTZTQqgo3y6yUp7KztapQLtek+Q6FewqVaSGYyA@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] msm8992 DTS updates, peripheral enablement
To:     skrzynka@konradybcio.pl
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bumping this up, in case it just got overlooked.

Konrad
