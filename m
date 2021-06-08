Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B69F39F82E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 15:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbhFHN40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 09:56:26 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:34962 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232842AbhFHN4X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 09:56:23 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623160464; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ZAaGTvvy+FQIbEaP4NPYq26hcjORwSIUmUq9CEcfixW0CVBLwZ4DegggGOnRAbn6xp
    A44zhbfJPtsvI4VeMdCdHhpx3wxv6E3BgCV0ZbASxxzi/Nki/BK9WAqr5TJg2uNHXMvW
    0X9VrioYkXXyLe+ERx/1FdGQjibYU0VQjihKM0lzGE+CGfJ0GYMMbLFpNFjPzW75si6k
    G/GhwBkm7MfKC/DHgFHXalgyTRWz3O+M6J/SbQtG7LfTUgYcknR9w9vQZH2ajRNDrMxG
    I6oS/JGAZdQhsFkJo6MRS7ABlV0HC6ruzPxJvk4P7UNmF9vb0Je6XMf9D6+XS5siTMrc
    W+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623160464;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=rl6OGeTVbuWMtg723dmqTLwwTjsRAkOWOnXJx3St/jM=;
    b=h5A6HD2O1ed16AFmemsCp7wywFDQtEs1NgR7iePTV0iDi8clYUsm9p+0Pl7pBAwzBQ
    /ESFtMMWx5PAdNNT5Rm3g2VnQDvhoHHOzVMOgPNTjMiRyR6iG7oTOxdEvpcSi6cy8X5U
    9g1CBxGd+W6lWzUmzRo6DuHVLxeP1FpalcajOsZRT+jotMsSnsEfQiqWEbru5UgblUsZ
    /nKrNH0gXHdFY2dlRceFl5P7XdSHyqVz+xgg4okG5oMSSlszgGeJxT4Pt+qkHnJRAnm5
    MVJywAniOdmY2gZbys+Sxu4/M8IpDpTY2ckpQhALanyNP+mnAAQz5ukewS7HM6Rv/YBa
    reUA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623160464;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=rl6OGeTVbuWMtg723dmqTLwwTjsRAkOWOnXJx3St/jM=;
    b=mpP9NyOwzoLN1KyHO6PqPbXg9DKqsbnjECMZmRbVwlwN36M6Enw6HkU8Xbqst9ejIZ
    zkce6hsjJQ3lzGbnVpAGnmhPxlHVQshMPfOBI653dwjhQ+JBEusbmUTuZz1HeROMzD40
    56cBgzCV4cqjctrWgAc6396C7LnBd3LBelPKt9LIRHIEPL8SW6OsOhNQ5plVDvTr2Ron
    TEOsxhZbFAa9qDu+f/urXvbTuB+4Ff2BNVbtpOIi7eKDDekxUhpku1ygXGHTNfHBl5mP
    iO1/BhZ4KGEXa2+yObz4DnOvdJ/seinfBr/nJUX8w2gheardsKAv98eVBG2Z+XDK9Z/N
    fybg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IcbDBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
    with ESMTPSA id y01375x58DsOdxz
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 8 Jun 2021 15:54:24 +0200 (CEST)
Date:   Tue, 8 Jun 2021 15:54:22 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] cpuidle: qcom: Add SPM register data for MSM8226
Message-ID: <YL92jqf/146P9vSl@gerhold.net>
References: <20210530121803.13102-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530121803.13102-1-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, May 30, 2021 at 02:18:01PM +0200, Bartosz Dudziak wrote:
> Add SPM register data sequence for MSM8226 SoC and enable SAW2 power
> controller for it.
> 
> Changes in v2:
>  - Removed APQ8026 SoC support
> 
> Bartosz Dudziak (2):
>   dt-bindings: arm: msm: Add SAW2 for MSM8226
>   cpuidle: qcom: Add SPM register data for MSM8226
> 
>  .../devicetree/bindings/arm/msm/qcom,saw2.txt      |  1 +
>  drivers/cpuidle/cpuidle-qcom-spm.c                 | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
> 
> 

It looks like you got the To:/Cc: list wrong in v2 (was okay in v1).
Can you re-send these patches and include Daniel Lezcano (ARM cpuidle
maintainer) and the linux-pm mailing list? Otherwise they might never
be applied by anyone. :)

Please also make sure to add the Acked-by:/Reviewed-by: from myself/Rob
to the respective patches when re-sending.

Thanks!
Stephan
