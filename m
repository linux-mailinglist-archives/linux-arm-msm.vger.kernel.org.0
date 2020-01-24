Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5398A148D59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 19:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390827AbgAXSCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 13:02:03 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37120 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390362AbgAXSCD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 13:02:03 -0500
Received: by mail-pl1-f193.google.com with SMTP id c23so1106246plz.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 10:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G5fEZ2U0+CDS0hG812zeGyRQK6DtCt/mFqHvclq9uxI=;
        b=Zlwl7Z+1c2DrxDJdXvTPzh7C0sA9dUNpKWhqDlfwFbHqka9y984PM3S5s3ev0wosoc
         PQ8FlrOzjsxrL8BtP75O/HDz4gBnX4lSw2p3h0IBOxR7SIMbih5TDY0/HuTx3vH2ssJk
         eBcePQIzQNCu358CeCSHEs0rLSHQa5zJc3yOwPTIFN3lpzuZw9BVBalrOrRGjdj7uJtr
         NqbK+wD5RG6DYmdbkmaWnDarITmrhdLgEPPn1x85FLPuzsV6b+MoxvTbEQyvxNa6Q7Vj
         /0CYcxglHG6XJrXuHosf/q1Cghr2kT1EvIar+xrMhuFbfb29sbUnQf8/spqMFtoTyhvF
         p8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G5fEZ2U0+CDS0hG812zeGyRQK6DtCt/mFqHvclq9uxI=;
        b=bqL7FEgVy7/kjdB1ACU8r1YR0iclrro2RpteCHK7j7KQQTCy4G6UqjkJuro9aV6EHh
         IEGN/gsnRqjsgpJtfIMgrwWoNVpR+wYMigUTu7uOdEgxKh1603/bU6i9gtyZlZZHyOE5
         gkU5i49v9RvfVPTHw5ebAU0gQyzpYv8ViWlcNI7xHdgnn6t1GU8JDnutIBpV65geDn7n
         WbdvSIEmGjUcOFw7mj9brdI5on9dvwUj2bQ2CiOs+qJC/2scvfQfgHf9tCk6Jpmjog6J
         aNl497m8nkKoZo0r1ugs8Iurv/VTLGEJeaa7E3wynezUFXV141XvfRN89er1h2kSYYfB
         n2Rw==
X-Gm-Message-State: APjAAAWumIkyYJBko+Lsd4sKBaTww9tTeKG7y4ugqORuxcqJMWoI5GBC
        dI3TQ2Us8ZQ7+VqwuV5Tn/3oFg==
X-Google-Smtp-Source: APXvYqwBEJkZ8Vl8tLg9tesk9zn7tQ3YoyossHKjnx3jILJeNULNqlWCDh10GhwkawsZ99tjJSIQMw==
X-Received: by 2002:a17:902:b788:: with SMTP id e8mr4897986pls.1.1579888922548;
        Fri, 24 Jan 2020 10:02:02 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z6sm6617298pfa.155.2020.01.24.10.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 10:02:01 -0800 (PST)
Date:   Fri, 24 Jan 2020 10:01:27 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, devicetree@vger.kernel.org,
        jshriram@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com,
        psodagud@codeaurora.org, robh+dt@kernel.org, tdas@codeaurora.org,
        tsoni@codeaurora.org, vinod.koul@linaro.org,
        vnkgutta@codeaurora.org
Subject: Re: [PATCH 2/7] clk: qcom: rpmh: Add support for RPMH clocks on
 SM8250
Message-ID: <20200124180127.GO1908628@ripper>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-3-git-send-email-vnkgutta@codeaurora.org>
 <20200123064614.78346217F4@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123064614.78346217F4@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Jan 22:46 PST 2020, Stephen Boyd wrote:

> Quoting Venkata Narendra Kumar Gutta (2020-01-16 15:39:49)
> > @@ -490,6 +512,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
> >         { .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
> >         { .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
> >         { .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
> > +       { .compatible = "qcom,sm8250-rpmh-clk",  .data = &clk_rpmh_sm8250},
> 
> We should sort this on compatible.
> 

Yes we should, in case this was a request I sent out a patch for this:
https://lore.kernel.org/linux-arm-msm/20200124175934.3937473-1-bjorn.andersson@linaro.org/

Regards,
Bjorn

> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
