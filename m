Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 273981B8148
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 22:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgDXU5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 16:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgDXU5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 16:57:04 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B49AC09B048
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 13:57:03 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id g2so4197055plo.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 13:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CMlR2Lch6qanhmgzHXzt9Ss34iAITfulP0yBSMWEtIk=;
        b=Q8RRoyAYtL/AzdVawKmyJnSkxSE86u03IG8xw3LhjN5TgulDYq1XdyATi6YsU3g7sf
         O8Nj2OoAahkWNE2WzQgpYAejnxmiP2G+jbNPownYuQ+2ypW+cRGyHoX6HeFrrjm2C7Q8
         ZdojSE55OwpRlmFGD1RY4LREZWh6qxCy7bU9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CMlR2Lch6qanhmgzHXzt9Ss34iAITfulP0yBSMWEtIk=;
        b=l1bJhZutu2Ljjxk+wbiw7KceqB9T4a3M0/8M8LB6vRNYD1ABXkG85hlV5f6paWL4ID
         nMRLPEt4mLDwLoldlf8EGNJKzxdEW9mHwZXZH/UKMZtvMkap1BMZsNfEEQXO2+kPzype
         d8RVXZxXgbbcZxxPRcvEkiA2X1MJfdecyi1M9W8MXRPp9SW1OsfGHUBJIC2bWbuwCRGZ
         BGgyAiD08E3NiOY2teVivMJZSEYM+fhJ2bht8v0NRw1KWqZ86TMOLGYBAVXyj1N3uAWm
         JoIlvspbDYoBOPy2rO07ObeSBhgF4MxQQK/dyQkSZkUYGCf/NvXaIzspTx+vRewL9BI5
         YJ4A==
X-Gm-Message-State: AGi0Pub5XnIQMNIwbmL37DdBAAfSrJHYo6W1NWZvKJ22fWRO48J/vZne
        wKiUlv6PMClqqQLr58YD3V1Vpw==
X-Google-Smtp-Source: APiQypJ1Esxx+d2XPYW85epj3fqYRYqoDJaHV+BQi55XveY65BnIq4Qp6GCNmfHLlAsHZADZhUGE3g==
X-Received: by 2002:a17:902:76c5:: with SMTP id j5mr2136961plt.189.1587761823068;
        Fri, 24 Apr 2020 13:57:03 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id j13sm5405122pje.1.2020.04.24.13.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 13:57:02 -0700 (PDT)
Date:   Fri, 24 Apr 2020 13:57:01 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>, rojay@codeaurora.org,
        c_skakit@codeaurora.org
Subject: Re: [PATCH V5 3/3] dt-bindings: geni-se: Add binding for UART pin
 swap
Message-ID: <20200424205701.GE4525@google.com>
References: <1584095350-841-1-git-send-email-akashast@codeaurora.org>
 <1584095350-841-4-git-send-email-akashast@codeaurora.org>
 <CAL_JsqKLoiPUhiJDuYX+bSQwoCLTXOvtNyEB8ti__xMfEDyxNQ@mail.gmail.com>
 <ee34573a-e4ff-ad43-64ed-53439206d534@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ee34573a-e4ff-ad43-64ed-53439206d534@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Akash,

On Tue, Mar 24, 2020 at 10:46:40AM +0530, Akash Asthana wrote:
> Hi Rob,
> 
> On 3/20/2020 11:37 PM, Rob Herring wrote:
> > On Fri, Mar 13, 2020 at 4:29 AM Akash Asthana <akashast@codeaurora.org> wrote:
> > > Add documentation to support RX/TX/CTS/RTS pin swap in HW.
> > > 
> > > Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> > > ---
> > > Changes in V5:
> > >   -  As per Matthias's comment, remove rx-tx-cts-rts-swap property from UART
> > >      child node.
> > > 
> > >   Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > STM32 folks need something similar. Can you move this to a common
> > location. That's serial.txt, but that is being converted to DT schema.
> > 
> > Rob
> 
> Okay, once serial.txt is converted to DT schema, I will move it there.

It has landed upstream:

175a7427bb72 dt-bindings: serial: Convert generic bindings to json-schema
