Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 403AE132F9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 20:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgAGTis (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 14:38:48 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35605 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgAGTis (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 14:38:48 -0500
Received: by mail-pj1-f66.google.com with SMTP id s7so16245pjc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 11:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2Prj57eO28z5lgjo5XEk+60ja6L41tebRV2EmrAGd90=;
        b=j6KbHbJr6pXF3rIONFb1cXW8QZ6nec5Rs+xZLy4qdYTunmQOmRb1h0OnZ47bqsF+Ri
         YSQao8pisPbywoGr/7hPXXrMSHX1zI5E6RyVonCaJDhBWg4zYdDoR+3ksI0DLD1ZdCcQ
         nSctQ9OBXzljZPCntnEVcEmSj71sYnbCnweigad/o8pteHJPIFbgQgujn6W9Fk7AYT+u
         2bbqJ8glQZDUJIw7YGduRpXSlsz0trqwfDJH4jrH9M6XXlVnDz1L4rBCbub/UDkd0jLe
         Pype796b1IlvyI8Kq0UPUFuO4eX75OdI2+5nXNY3Zsr0Gzjig3+M3Y8MOSINfIA1DfoB
         asiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2Prj57eO28z5lgjo5XEk+60ja6L41tebRV2EmrAGd90=;
        b=qLo4nwGnmzqZVNy5KX86/9hiPRdzMqi9RddCM5Ozm1CxVvjfBDJrLV7rKPunuLFvbb
         Py5VEn79kHHx2jZWG7ZSkovJrnanxxC2l8nmhSAua5Av2u3gOLJ94UK0OeuTx4epph/a
         cPg6YvMpSvmiStnQI9L63zRUGFmfoiwrvUA54PO8zPBDBW2jftYYUJzCeEKACFErzK1+
         tS6dtcUVwVEZc1fvt2vYhyMjT3n6dKwBxOaU0x3Mm0L1KOyL7CBibzOQyD7/J0YOn8sW
         eI5a5Ei62zJhlVlbPsimkJjFWpWgtBmTdqeakQ7BIqX0tr0OcDc0kN1vxyBgznI2XLNC
         aBnA==
X-Gm-Message-State: APjAAAUUSwfxFm9EAZHQ4xzN1H+PwYnNWuR4vRnlaMVvR9EvuJV4ct5H
        RnNKwU/K8rBElbJA+cWTMIfcog==
X-Google-Smtp-Source: APXvYqzmgPKQJGSGcikCPKGdGu42fAIoSm9qJ5Nc/utaPnrITLEcQkgEEbKybjhplo9KuTs//Z9WaA==
X-Received: by 2002:a17:90a:19d3:: with SMTP id 19mr20993pjj.1.1578425927665;
        Tue, 07 Jan 2020 11:38:47 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x22sm593940pgc.2.2020.01.07.11.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 11:38:46 -0800 (PST)
Date:   Tue, 7 Jan 2020 11:38:44 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
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
Message-ID: <20200107193844.GE716784@yoga>
References: <20200102160820.3572-1-ulf.hansson@linaro.org>
 <20200106172608.63qhvwr5b7jsmxmg@localhost>
 <CAPDyKFq-ueSK2xAOBtec_N95sBVf-Vcm_-xgAhxQUuwAjUzbPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFq-ueSK2xAOBtec_N95sBVf-Vcm_-xgAhxQUuwAjUzbPw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 07 Jan 11:28 PST 2020, Ulf Hansson wrote:

> On Mon, 6 Jan 2020 at 18:31, Olof Johansson <olof@lixom.net> wrote:
> >
> > Hi,
> >
> > On Thu, Jan 02, 2020 at 05:08:20PM +0100, Ulf Hansson wrote:
> > > Hi SoC maintainers,
> > >
> > > Here's a PR with updates for v5.6 for cpuidle/psci for ARM/ARM64.
> > >
> > > The changes are somewhat sprinkled over a couple of different directories and
> > > there is also dts update for MSM8916. The main changes are in drivers/cpuidle/,
> > > which have been acked-by Rafael [1] and Sudeep.
> > >
> > > If you have any further questions, please just tell.
> >
> > What was the reason to bring in a dts change in this branch?
> 
> Convenience. But I am not usually sending these PR, so feel free to
> tell me to change.
> 

The dts files are typically moving a lot, so to reduce the risk of
conflicts it's generally better if we take them through the qcom tree.

> > Bindings should be
> > stable such that old DT contents still works even if drivers are updated to
> > support newer attributes, etc.
> 
> They already are. No worries!
> 
> If you want to pick everything else but the DTS patch, that's fine by me.
> 

Generally, yes.

> Do you want me to send a new PR?
> 

But I'm happy with the dts patch and afaict there's nothing that this
will conflict with. So you have my retroactive ack on the patch and
lets stick with the current PR.

Regards,
Bjorn
