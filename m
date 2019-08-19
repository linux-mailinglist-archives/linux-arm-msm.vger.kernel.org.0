Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7651291D68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 08:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfHSG5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 02:57:09 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43825 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbfHSG5I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 02:57:08 -0400
Received: by mail-pl1-f193.google.com with SMTP id 4so500619pld.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Aug 2019 23:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7k//502CULWRlumB5LUfrkH+oVCgs4LxV1yBK5FQWw8=;
        b=n8Pzfswhm9FPBsuTbYIHw3yt1vfkqvLayOSdP1/ZW5QfVYXmUG6Uf15GKoYaiwOzM/
         83br5UBUAxGwaXZEhBEF8hvzVqchUhiLfoSEWCUICWSFL+tG7LOQyxisR3JCGkAAtz2f
         9QbVzrNmosPVKq8kNz3DCin3Mebh1i7kdOYyUBR2vdkxgcKVFE86fAMG+nWNzzqVb0Gx
         uHCCEPU948leGvaytsBRo495cS4T3QwuqgTgrXicF4xyR64gNWoumRAoTkT4xbO7sGpl
         KGH9DBNL8U7ANBSyYIJV7f7IGoXaLjiNMLDKIoIPOOFCdKxQdx6zviuTXH5joz29eJND
         wOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7k//502CULWRlumB5LUfrkH+oVCgs4LxV1yBK5FQWw8=;
        b=XAhQBu0X5AHM3z5HM/W29FY+yxeXphshRocirtcT02rK82wPkC8ApYnGAD4wqv3uKB
         2ROyfTzWnyRen/UnrgsDZ1cHqK1tjf0aQaWN3f1sVoCXzXe3cjjnVAYmjbmMMWGJip4x
         FibxyPrM/IQ8kJFdzpivLSSc9HMR9bDNXw4R1nhjhPI1jN7beVtlkoRNwGI0dsdJfZpe
         jfQoLlGVtGD/qetljjXibyIIkKJv5DVkAcDBPfejVpBS7gidY/5pwEZM6V3KnGIXSr8x
         5tHSvstx2rj1skERPv4AcpTCqHb3K2eMQl7MWRBETrWfJXg6xrJGhqNj2GDf81CSYpFY
         zrdw==
X-Gm-Message-State: APjAAAWlrVaTCK5QhKCKkXUuGjQPPKgysUCtbE6AEhD+DbPOdQMHQVgz
        idg5HOSEb2mmPWtd0Gvf4Sf2Fw==
X-Google-Smtp-Source: APXvYqwtIiM2jQQRDwVLMDAvkIOLbhorGtgsQRqJtncX40+Y0g09W50Mmph5+k2/rKckttxro5j/tA==
X-Received: by 2002:a17:902:ca:: with SMTP id a68mr20639505pla.204.1566197828124;
        Sun, 18 Aug 2019 23:57:08 -0700 (PDT)
Received: from localhost ([122.172.76.219])
        by smtp.gmail.com with ESMTPSA id a23sm14891521pfo.80.2019.08.18.23.57.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Aug 2019 23:57:07 -0700 (PDT)
Date:   Mon, 19 Aug 2019 12:27:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Quentin Perret <quentin.perret@arm.com>
Cc:     Douglas Raillard <douglas.raillard@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, rjw@rjwysocki.net, agross@kernel.org
Subject: Re: [PATCH 1/2] cpufreq: drivers: Enable frequency invariance in
 qcom-cpufreq-hw
Message-ID: <20190819065705.qhcb4ohtsekik3q2@vireshk-i7>
References: <20190808131857.21082-1-douglas.raillard@arm.com>
 <20190808173230.53ddupihjlr6uvne@queper01-lin>
 <14762a81-a81d-d05f-b42a-495dacb28168@arm.com>
 <20190809103704.fatayhzso2b62fmx@queper01-lin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809103704.fatayhzso2b62fmx@queper01-lin>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09-08-19, 11:37, Quentin Perret wrote:
> Actually, one nit, the $subject should probably be formatted as:
> 
>   cpufreq: qcom-hw: invoke frequency-invariance setter function
> 
> for consistency with other patches in this area.

Applied with these changes. Thanks.

-- 
viresh
