Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDC269D264
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 17:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732910AbfHZPNX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 11:13:23 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39034 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731256AbfHZPNW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 11:13:22 -0400
Received: by mail-pf1-f193.google.com with SMTP id y200so4307260pfb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2019 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j5KxHjXq4wZrRuSjnTO35VtGsy0U6Zm7/urplqoNwEg=;
        b=LrSYxPcMCE8kKbBcH0Y3Ky8LLQbhHQZMufx9PAeg0KliOgtT46O/2328VxjkC002s0
         fMFUqT3o78VSV7bCvVraoOlBIzM+/qiB5YjjfsWZg/0MDQ9Tukt7OT68Ak+Hc14VlMvF
         4WSz87/WMNlIAu77o+bBIo1Vi/Vgxb1pcjEbFcfy8MGu3LFJRUvTg7GiMMF2p/n5zXmm
         3OVCDL2D5CAWZnrHVicbMxKodku8gEbDG632rr2+ASNo8rlylbBcCHYsOAmF8CmOjLML
         qYi+Nuu1sU4Nybzy33ueiE7/rQK9yoJ6zRD6dYBZazM4SgLXJo9PqUTfJY8OYzOXJQyg
         C+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j5KxHjXq4wZrRuSjnTO35VtGsy0U6Zm7/urplqoNwEg=;
        b=Ybj6yq/yOpMhGMvkaXHRt26FYOkosDLqiugYXWcs4KqYEshCrh5Fz9CBwRASO3yCAv
         AwIl+xJK6tzgbZoqSGrmI0mpkUDmxv+RJHMvlN5fnbhlC7vJmOBaOIDb7bzEyqA3+Rlr
         jVLa5QueHg47ScFNfeY7GjttOjNwgs4AyMwsB97KA+/XQUq1YAMlN3RYZaSoEUT5Qkud
         ivclgrnR0wFh9lrF+47EEQcYbXOHgPYsEFbQOSFgi4+RPkk/2kkSiXsKX4v7/SDM6TDz
         0ktTOaejE82/hZO7PY766Pa1j3R5ZnmEZR5MYxRXd2XTAS/MkJ7zKOqha/6IxMx0yIZP
         5u7Q==
X-Gm-Message-State: APjAAAW+laHk9MdbynP+H29ZMveuEwwhsWtE3B+fhPZAYwKosBC0zIHL
        Sz4t3cG/rg5Tk1lJN9w1JMM1cQ==
X-Google-Smtp-Source: APXvYqza9qWjK7AbgQw32FUjQQVrD1ZaaAa3XtLTCQmQ29i1QX33eiFCIhXgsXNEeD+tlhOh+piA+Q==
X-Received: by 2002:a63:6c46:: with SMTP id h67mr17290709pgc.248.1566832401867;
        Mon, 26 Aug 2019 08:13:21 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g8sm11351479pgk.1.2019.08.26.08.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 08:13:21 -0700 (PDT)
Date:   Mon, 26 Aug 2019 08:15:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH] phy: qcom-qmp: Correct ready status, again
Message-ID: <20190826151512.GX26807@tuxbook-pro>
References: <20190806004256.20152-1-bjorn.andersson@linaro.org>
 <20190806155040.0B54520C01@mail.kernel.org>
 <57556d09-e2db-dc00-45a9-cbb57da02319@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57556d09-e2db-dc00-45a9-cbb57da02319@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 20 Aug 17:23 PDT 2019, Kishon Vijay Abraham I wrote:

> Hi Sasha,
> 
> On 06/08/19 9:20 PM, Sasha Levin wrote:
> > Hi,
> > 
> > [This is an automated email]
> > 
> > This commit has been processed because it contains a "Fixes:" tag,
> > fixing commit: 885bd765963b phy: qcom-qmp: Correct READY_STATUS poll break condition.
> > 
> > The bot has tested the following trees: v5.2.6.
> > 
> > v5.2.6: Failed to apply! Possible dependencies:
> >     520602640419 ("phy: qcom-qmp: Raise qcom_qmp_phy_enable() polling delay")
> > 
> > 
> > NOTE: The patch will not be queued to stable trees until it is upstream.
> > 
> > How should we proceed with this patch?
> 
> Merging of this patch got delayed. Bjorn, Is it okay if this patch gets merged
> in the next merge window and backported to stable releases then?
> 

That's fine, thanks for picking it up Kishon

Regards,
Bjorn
