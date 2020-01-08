Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47E4B135012
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 00:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbgAHXoL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 18:44:11 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40070 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgAHXoL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 18:44:11 -0500
Received: by mail-lj1-f196.google.com with SMTP id u1so5172378ljk.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2020 15:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eI6iNLQhWDXGqNquTGe31eFOXNqqPHZNYb8TXGjlONU=;
        b=Dwcwsf78XGO26u3wmaWKl2UyNG5AobMooKaFwkFb0YniWuQ6+jO6IPByQsXQ2ucOBe
         WxRS0PAnQHTkCLx4R7SZfKk2/Qvix2xYYVhfu2kt34m9rQMy3eFaxjsxY19jK3zoL3QU
         Mu6kFNNh8NwDgnsKREO/V7quxv0l7+kEs+IT53qDVZyDCjL3ZM6N3msfTTyBxmrAz6H8
         1p2TRmUnlh49v8VQgYOmZjfj3t4K27ztPtTKevf4n6YUMnPD91FWd4Md9v4xRRqja67X
         UeSbU779KNEyGCNi1fzlfCKykUqQa0MWAC25FmAxmswoQ7TyHqhyDjwOgj+mgdSOMrY2
         VClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eI6iNLQhWDXGqNquTGe31eFOXNqqPHZNYb8TXGjlONU=;
        b=SWmne4xqZGJ+E65JZxgF+7isEWUo82P2ONkk1hKvoKPRWeSeWgREQEG8TJPHpZFJXq
         PC0YPLG/6HCx3m7GANzD5ewo/t1ldORPKWfmFJLiMJMYFRjeQDhuSUOHoQIk/CmevD3b
         iO2k6EdyA2OXTfTg0Yoxkl8uFOCIwhAVCqYAmnuiXn4q9LdDmQB93DckEuBFiG/Ng79X
         mzAA1dHyAoOwUEl9ax6zf/hW/OtwOUWgFEM+lSvvS/giy3Q5f5+mqvMwPn6h8V4PfJju
         tzSdwmGSWgq0V2SXLIsiM9/FLeXVNm9iK3dyJ/NliWKuyc+yJpZ9oCU5S737IPNfqimX
         iN6w==
X-Gm-Message-State: APjAAAWn5QcnLd3XkIrxy/rD//jsO/99Va2XWas6vALYP2wH1aKDQ8iK
        CohOndSORtsgTyBymiyl+n/1CA==
X-Google-Smtp-Source: APXvYqxSjCINOfjcSq/Opf15btDPbuxHhfhtkrIWniTi7v1O+ndmQtfv1EYW2gZPaJR8spbk++0hWQ==
X-Received: by 2002:a2e:9843:: with SMTP id e3mr4490107ljj.45.1578527049321;
        Wed, 08 Jan 2020 15:44:09 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id n30sm2409755lfi.54.2020.01.08.15.44.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 15:44:08 -0800 (PST)
Date:   Wed, 8 Jan 2020 10:29:40 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, arm-soc <arm@kernel.org>,
        soc@kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [GIT PULL] cpuidle/psci updates for v5.6
Message-ID: <20200108182940.ur6ujed7vz5xyl2t@localhost>
References: <20200102160820.3572-1-ulf.hansson@linaro.org>
 <20200106172608.63qhvwr5b7jsmxmg@localhost>
 <CAPDyKFq-ueSK2xAOBtec_N95sBVf-Vcm_-xgAhxQUuwAjUzbPw@mail.gmail.com>
 <20200107193844.GE716784@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107193844.GE716784@yoga>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 07, 2020 at 11:38:44AM -0800, Bjorn Andersson wrote:
> On Tue 07 Jan 11:28 PST 2020, Ulf Hansson wrote:
> 
> > On Mon, 6 Jan 2020 at 18:31, Olof Johansson <olof@lixom.net> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Jan 02, 2020 at 05:08:20PM +0100, Ulf Hansson wrote:
> > > > Hi SoC maintainers,
> > > >
> > > > Here's a PR with updates for v5.6 for cpuidle/psci for ARM/ARM64.
> > > >
> > > > The changes are somewhat sprinkled over a couple of different directories and
> > > > there is also dts update for MSM8916. The main changes are in drivers/cpuidle/,
> > > > which have been acked-by Rafael [1] and Sudeep.
> > > >
> > > > If you have any further questions, please just tell.
> > >
> > > What was the reason to bring in a dts change in this branch?
> > 
> > Convenience. But I am not usually sending these PR, so feel free to
> > tell me to change.
> > 
> 
> The dts files are typically moving a lot, so to reduce the risk of
> conflicts it's generally better if we take them through the qcom tree.
> 
> > > Bindings should be
> > > stable such that old DT contents still works even if drivers are updated to
> > > support newer attributes, etc.
> > 
> > They already are. No worries!
> > 
> > If you want to pick everything else but the DTS patch, that's fine by me.
> > 
> 
> Generally, yes.
> 
> > Do you want me to send a new PR?
> > 
> 
> But I'm happy with the dts patch and afaict there's nothing that this
> will conflict with. So you have my retroactive ack on the patch and
> lets stick with the current PR.

As long as there's no anticipated changes in DTS that's OK (which is
why it's good to at least seek the ack from Bjorn in this case).

There's one more issue with this pull request -- it's based on
5.5-rc4. We normally don't move to later -rcs for the base once things
land (i.e. we're still at -rc2), since it just causes churn.

I'll merge this now anyway, but in the future if you're unsure what to
use as a base for your topic branches, look at our master branch to see
where it's at.


-Olof
