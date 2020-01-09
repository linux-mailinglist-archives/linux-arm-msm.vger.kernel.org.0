Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE086135C24
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 16:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730666AbgAIPCg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 10:02:36 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:45785 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730273AbgAIPCg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 10:02:36 -0500
Received: by mail-qk1-f193.google.com with SMTP id x1so6173817qkl.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2020 07:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=KgOKihYdoC4CM0s9zPjus82QslMOvjX86wrDVhk7G2o=;
        b=fKs+1GO2+5aT6aceO1g7mI3L0Vn0IDTuHxHeh2xpa0GPewzR9M6AprlTpMcfdMr1CZ
         m9uoyUmegFuNnt4cZ4rshnZ+oyjwJ5Tfe5hVa4mdH7eQOXLdqw5BqUR2PR/SDxKXIH+O
         NNNzdnKxBqzOKwel5z8lDDWIK221/IVzMULCZISxDdfv4t61igNkEbst0DIqy0/yUa3+
         +xJkSLFS9c8FdMmlWKiu5GtDh05xG7ukmM8173miPgkEJF9umfVDZg3MtLjJizlinJak
         Sd9dTGi4YAL1RRQvteDhWvfQivkk30gO3MWP6pw0wyAEFmGkdnVZNXJ0hBm4YJN176pg
         /RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=KgOKihYdoC4CM0s9zPjus82QslMOvjX86wrDVhk7G2o=;
        b=D61gIVch6s6lGkjkHaJpj6F1Vqb/HUoPEBFJfpFZLAe6Ljey/Wmn0v6A9kH/O81n6a
         OiZFEeIrUI1rLuoPGEbTgbuEtey7KtMbu0qWdruZvuDNEFMMVuhubbluFYNJKDPHgpJQ
         bLaIfnCxcCbaEzxmyUVWaQ2zrAoXIwHOmDvD0zvWexX5kU1miSOIKTIzEc6gmmcJMBo4
         N6Qaae9A/z0enMuJbX+syqCp82ty/q50nlpEp5cJEZq0J+kLd1cX4fjr+zwsmIRL+y0M
         EjCPD/lG7veSYiP4LyQnm1prOvtoLRKnQO+2DmUxnNBQ59UOVJZ7TvcznvM24Q8Mak4r
         X2QQ==
X-Gm-Message-State: APjAAAUlyh1S8bfsTY1q6wVphkSBP+KUG2cY/eTsIb4C6Wl8ZmTaeMaN
        erKaVJJ3AvsleUpXjkp5L36Naw==
X-Google-Smtp-Source: APXvYqzcOmSmmGp0IyB+OmY5vvR4WUECK/hFA4F+02h7F7ZjUvpq+2CBXidGjySxIeY6Qr+zCcphyw==
X-Received: by 2002:a37:9c52:: with SMTP id f79mr9986307qke.371.1578582154995;
        Thu, 09 Jan 2020 07:02:34 -0800 (PST)
Received: from [192.168.1.169] (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.gmail.com with ESMTPSA id n190sm3203309qke.90.2020.01.09.07.02.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jan 2020 07:02:33 -0800 (PST)
Subject: Re: [Patch v4 0/7] Introduce Power domain based warming device driver
To:     rui.zhang@intel.com, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org
References: <1574254593-16078-1-git-send-email-thara.gopinath@linaro.org>
Cc:     amit.kucheria@verdurent.com, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <5E174086.50004@linaro.org>
Date:   Thu, 9 Jan 2020 10:02:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1574254593-16078-1-git-send-email-thara.gopinath@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/20/2019 07:56 AM, Thara Gopinath wrote:
> Certain resources modeled as a generic power domain in linux kernel can be
> used to warm up the SoC (mx power domain on sdm845) if the temperature
> falls below certain threshold. These power domains can be considered as
> thermal warming devices.  (opposite of thermal cooling devices).
> 
> In kernel, these warming devices can be modeled as a thermal cooling
> device. Since linux kernel today has no instance of a resource modeled as
> a power domain acting as a thermal warming device, a generic power domain
> based thermal warming device driver that can be used pan-Socs is the
> approach taken in this patch series. Since thermal warming devices can be
> thought of as the mirror opposite of thermal cooling devices, this patch
> series re-uses thermal cooling device framework. To use these power
> domains as warming devices require further tweaks in the thermal framework
> which are out of scope of this patch series. These tweaks have been posted
> as a separate series[1].
Hi,

Can this series be merged ? It has been acked from DT and genpd point of
view.

Warm Regards
Thara


