Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85D11E646B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 16:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728566AbgE1OsJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 10:48:09 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:33619 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728456AbgE1OsH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 10:48:07 -0400
Received: by mail-io1-f51.google.com with SMTP id k18so30309579ion.0;
        Thu, 28 May 2020 07:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sk3NhDpltS42mXxoOytbsMAa+03NQ034Rus+VTvtCUM=;
        b=JqCrMGmbZC+J+rMzOJ4CIvW8gVlCeeB06UNjRaJQTuEHHs5wi0nbAdwbO6A/EgCRRK
         2+f4ArgZILv3U1EyHzctu32wOAuIxNNeN3PVZ35iogYEYxg7PSCkND9wqqtAeDZTeX/p
         GT2Onv7asHJUQcdlQxgIRCuFuc/ROEZl9NYNoJGnhdS4KwjLhpa0ROHtlWPwDhQXoGyJ
         RPUgidZ6wlrKZPwC3MhCwQTGOzMtKZLQWbv75gMsxqTeN3csazFsYLFbwrg5p9GAh7VY
         UFoddPx7cidmiJDeYBNld0bRe4R1kELzfel52x3WNUpoyWG8MHw+GimEfhe1+XYtc2qz
         AM5A==
X-Gm-Message-State: AOAM533WpuwMkCJt5Rc0EDDeK1EA2cizFFKXhme6UFKAgzAqBf971lB4
        wfWuJrhfWwzt5cqmWu7Sog==
X-Google-Smtp-Source: ABdhPJyqWSoedQ4uoSVKakZIQqvkZaTL4iJfxqNE8vRynVhBNqESQfFiekM/SqxTlkXC5Mdjt6q1qw==
X-Received: by 2002:a02:93a1:: with SMTP id z30mr2833528jah.25.1590677285689;
        Thu, 28 May 2020 07:48:05 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id o18sm3204484ils.30.2020.05.28.07.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:48:04 -0700 (PDT)
Received: (nullmailer pid 37765 invoked by uid 1000);
        Thu, 28 May 2020 14:48:03 -0000
Date:   Thu, 28 May 2020 08:48:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv3 0/2] Add support for replicators which loses context on
 clock removal
Message-ID: <20200528144803.GA36440@bogus>
References: <cover.1590171891.git.saiprakash.ranjan@codeaurora.org>
 <20200525161553.GA31527@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525161553.GA31527@xps15>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 25, 2020 at 10:15:53AM -0600, Mathieu Poirier wrote:
> Hi Sai,
> 
> On Sat, May 23, 2020 at 12:06:50AM +0530, Sai Prakash Ranjan wrote:
> > This series is mainly to add support for replicators
> > which lose context on removing AMBA clock like on SC7180
> > SoC where replicator in AOSS domain loses context.
> > 
> 
> I am good with this set but need a reviewed-by on the DT binding before I can
> add it to my tree.  The same goes for your other set[1].

Then why is it already in linux-next?

In any case,

Acked-by: Rob Herring <robh@kernel.org>
