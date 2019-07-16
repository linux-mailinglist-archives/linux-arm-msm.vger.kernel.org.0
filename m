Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6FC6A715
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 13:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387648AbfGPLLf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jul 2019 07:11:35 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38996 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387644AbfGPLLf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jul 2019 07:11:35 -0400
Received: by mail-lj1-f196.google.com with SMTP id v18so19489333ljh.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2019 04:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3UppoPnrfp6kARoJ/BDdFjbxhg47y2G5VBuTvBYTHHQ=;
        b=ZZMThBuqDwl13ushWHRzxVb31hKXGtnUr381OARDy7qrG6qqWJpTATmxvAQnytdAd3
         WWDhBdDpm+aWAaKR6GNoMepO73uWzpX3Qrndbq8J4ty6ViUsvfMqyfs6/itFL/SsfjvD
         CzxIFvBlOjGBd7b3bQw1kh10DwoT/SRvujKG3kD7MpfQ58VUFlH7XAtPL2MVgV+UUGdM
         PdJxH8MVJRUyObEnV+822Z8xRF663Ftj2lbHKB47Za8KRrcZFef/noS7YpIO/Wdn4R3n
         v/aLNt5jQ5gRow8yjC6AmEIagWic/ijm95+H7igKOYeyZsuZTnBx5UE36T44aBN4y5d1
         VXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3UppoPnrfp6kARoJ/BDdFjbxhg47y2G5VBuTvBYTHHQ=;
        b=jX1StzdNkS0gJPoT2u/MJr2a8go9F2Oi06bWHEh9zw4Euqa0f6TM9OvXmIkIjMAWpZ
         uwTEM4FJLg6ZXFnDhfy5jE/zuvlMFhXAD7zmqY2U3w8tRMk8AdJl/QcRjx6/SZxs3SMG
         PlY54RXR6BbOGpy14rPXD2gsOvL6QrbmmIkKT5QhDOiFFyve+c9LXENhUPTtKleFwuHk
         6sV5kH7RswY4mEuBzgh+UANCxidvpUl/1/PwFefPB6365cc5QmaTTecY3rXxEQXAxjSa
         CE72hnYhWtKwJ4glqgQ2XIaA0Y6WRt286v6WdGvOExcMXeL3BPw75TybMOd9FVU27cxJ
         Ruyw==
X-Gm-Message-State: APjAAAVnbDHrBvQzqqZbG/g4+Xb9Qko/n5iQH5MEnmoujOUPOp/at9lu
        Sr5MUWOPGgom9CQD12RjTK8c9A==
X-Google-Smtp-Source: APXvYqzeSAcuRom68dwCg4OqurM1KOFbKuik+yk8ytvJMNyBTrsS8bz4TOshqSAR5pUyabqrXE0MZg==
X-Received: by 2002:a2e:b4c9:: with SMTP id r9mr17164546ljm.196.1563275493271;
        Tue, 16 Jul 2019 04:11:33 -0700 (PDT)
Received: from centauri (ua-83-226-229-61.bbcust.telenor.se. [83.226.229.61])
        by smtp.gmail.com with ESMTPSA id m25sm2768631lfc.83.2019.07.16.04.11.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 04:11:32 -0700 (PDT)
Date:   Tue, 16 Jul 2019 13:11:30 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Sricharan R <sricharan@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 02/13] cpufreq: qcom: Re-organise kryo cpufreq to use it
 for other nvmem based qcom socs
Message-ID: <20190716111130.GB13918@centauri>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-3-niklas.cassel@linaro.org>
 <20190710061839.quncnis6pjyjntip@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190710061839.quncnis6pjyjntip@vireshk-i7>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 10, 2019 at 11:48:39AM +0530, Viresh Kumar wrote:
> On 05-07-19, 11:57, Niklas Cassel wrote:
> > -static struct platform_driver qcom_cpufreq_kryo_driver = {
> > -	.probe = qcom_cpufreq_kryo_probe,
> > -	.remove = qcom_cpufreq_kryo_remove,
> > +static struct platform_driver qcom_cpufreq_driver = {
> > +	.probe = qcom_cpufreq_probe,
> > +	.remove = qcom_cpufreq_remove,
> >  	.driver = {
> > -		.name = "qcom-cpufreq-kryo",
> > +		.name = "qcom-cpufreq",
> 
> Should we still name it "qcom-cpufreq-nvmem" here ? Only the string
> here.

Sure, I can fix this in next version.

Kind regards,
Niklas

> 
> >  	},
> >  };
> 
> -- 
> viresh
