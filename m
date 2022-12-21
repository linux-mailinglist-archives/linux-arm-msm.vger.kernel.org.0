Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6424652C91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 06:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234429AbiLUFzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Dec 2022 00:55:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234410AbiLUFzm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Dec 2022 00:55:42 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4EF1DDF9
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 21:55:38 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id b12so9739422pgj.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 21:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TaGVUxRUg0LoszCXjRP27hhaB8J+I3ZvWI15G+yWA+I=;
        b=Q4X+/Nj5MG5IJNmLNnYZO/3PjdSmzZnvtqzOIF7vVgzizc31le+nFsOp0ozBrnntm0
         dlQd+fC4HdT0xQyQB3PUk5lUIIjuLwXRpVfYP5GsDg2NqXyQexDmnGV/BbatjAW+e3yI
         S7Pg//+r1sNLRKqJJiohIA1CFqjf6q2eFZ501XnRW/m0TrBmd3T6t7pULd+pOOoBrPab
         3CrD/pYazWJZ3m4lOMZg8iS1AD2xGqB487XWqu2C4g42Yy9MNDEwIT0XcfdYL0zbl86W
         jGmW8Qf9f5o8SjSXRRLtphSYh6rfcU07tG6DAfh4xwQh2uZLUJDYGfCJ23rMUSU9W5rW
         w2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TaGVUxRUg0LoszCXjRP27hhaB8J+I3ZvWI15G+yWA+I=;
        b=5NTjXU7LHuHRG226eUOCDCGf84aob6zR3TY/KMi2Ni0vnrzuiXWayAgYncEuptuE8p
         LRtviEqdWWv7ZPFW3WVrTwqrZuiybtr6jS8+h6JXX0hcPARQmK/LF4ECyFqdj8ObVhHA
         u3Oebkg33l4Pnjj42ZbZOPgjK7JMLqMQuN4eQuZ7CKn1sNFFFF5XnvZc4iLbQ1oFmiCj
         qR4Yxw27V/ZKgP16tsvZir2zGbBDTD0QSDEcnXuaADUJ8nrRlc3UNjD/g2zXecO7ITFp
         J9NVoB8YSExUwtWJAyMiK9O2nRm9bj7tN3FZHnDhMOe7IlYCtSeG8gVbVxF8ekmygygB
         A8Ig==
X-Gm-Message-State: AFqh2koNICxfNrtzoykCP+qgI4Vf0W5ChlqFL2WgqzU04ZIugpsuDz/H
        +nmoOuUnqXuuwDRTeiTsdyXe
X-Google-Smtp-Source: AMrXdXtp5/WrpKvsBrj1r58d1R59LMAQOzJMUCEth4YEP8J7CqflCHtNTidWpMyzqLMFNwkCbCZ0kQ==
X-Received: by 2002:a62:644b:0:b0:577:51b1:375e with SMTP id y72-20020a62644b000000b0057751b1375emr1211143pfb.26.1671602137937;
        Tue, 20 Dec 2022 21:55:37 -0800 (PST)
Received: from thinkpad ([117.217.177.7])
        by smtp.gmail.com with ESMTPSA id o198-20020a62cdcf000000b00575d90636dcsm9616173pfg.6.2022.12.20.21.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 21:55:36 -0800 (PST)
Date:   Wed, 21 Dec 2022 11:25:26 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Steev Klimaszewski <steev@kali.org>, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        tony.luck@intel.com, quic_saipraka@quicinc.com,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com,
        ahalaney@redhat.com
Subject: Re: [PATCH v3 06/15] arm64: dts: qcom: sc8280xp: Fix the base
 addresses of LLCC banks
Message-ID: <20221221055526.GB2922@thinkpad>
References: <20221219182958.476231-1-manivannan.sadhasivam@linaro.org>
 <20221219182958.476231-7-manivannan.sadhasivam@linaro.org>
 <CAKXuJqgL5GsyjaNpkeMf4=72sjw+6ytFUm+yt1WjLyoFLrgm3g@mail.gmail.com>
 <20221220095207.GA38609@thinkpad>
 <Y6JLV4XG/6xDFrN/@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y6JLV4XG/6xDFrN/@zn.tnic>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 21, 2022 at 12:55:03AM +0100, Borislav Petkov wrote:
> On Tue, Dec 20, 2022 at 03:22:07PM +0530, Manivannan Sadhasivam wrote:
> > This is a genuine use-after-free bug that happens because the edac core frees
> > the memory assigned to "llcc_driv_data" pointer that gets passed as "pvt_info".
> > 
> > Here, the LLCC driver is one creating the "qcom_llcc_edac" platform device and
> > also allocating memory for "llcc_driv_data". But since during qcom_edac driver
> > removal, we are just unregistering the driver and the platform device still
> > stays around, the edac driver is not supposed to free any memory associated
> > with the platform device.
> 
> If you mean
> 
> __edac_device_free_ctl_info()
> 
> it is very well supposed to free it as it allocates it in
> edac_device_alloc_ctl_info().
> 
> If qcom_llcc_edac_probe() simply goes and assigns something of its own
> to edev_ctl->pvt_info, then that driver gets to keep the pieces ofc.
> 

Right. It is the issue of the qcom driver from the start.

Thanks,
Mani

> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

-- 
மணிவண்ணன் சதாசிவம்
