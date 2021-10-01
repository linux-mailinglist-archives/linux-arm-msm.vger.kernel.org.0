Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF19541E7A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 08:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352280AbhJAGky (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 02:40:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13629 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352255AbhJAGkx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 02:40:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633070349; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DH07yRNxfLIbPow4oMCMJkb9io5D23Aj6DAM87OKB7w=;
 b=L/NJ3XbBL01HIPsQP+E6HgzAZAtK8WZZsSbhl07rAAIaB4b3IZROz+25us7aNWfcd2uOTpf5
 zmzp0c3skaeeYjN/fFVnVf2i4MAt7aw0tv9/GJWhbhygu6VgqmDJjzOKLYiqOS5uv1Obi3Xb
 aG2OTvQvClyeiFIcKDrqHCVUML0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6156ad0d63b1f186582f8e8d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 06:39:09
 GMT
Sender: mkrishn=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D9B1C43618; Fri,  1 Oct 2021 06:39:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mkrishn)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 356EEC43460;
        Fri,  1 Oct 2021 06:39:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 01 Oct 2021 12:09:07 +0530
From:   mkrishn@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org,
        sbillaka@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        khsieh@codeaurora.org, rajeevny@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        robh+dt@kernel.org
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sc7280: add display dt nodes
In-Reply-To: <CAE-0n53kQU=8pdcWR0OZap1wDgxxwed0qvfaGruc71YT5Cj1iA@mail.gmail.com>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
 <1629282424-4070-2-git-send-email-mkrishn@codeaurora.org>
 <CAE-0n50b=pX=1MFwGPDvDR=O03tUAkAgyMonGm2+SXBft=16KQ@mail.gmail.com>
 <5adf2ab2c2a162272509d253bd797721@codeaurora.org>
 <CAE-0n53kQU=8pdcWR0OZap1wDgxxwed0qvfaGruc71YT5Cj1iA@mail.gmail.com>
Message-ID: <8f344213978f31c04e80b804a931db56@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-30 23:28, Stephen Boyd wrote:
> Quoting mkrishn@codeaurora.org (2021-09-30 04:56:59)
>> On 2021-08-19 01:27, Stephen Boyd wrote:
>> > Quoting Krishna Manikandan (2021-08-18 03:27:02)
>> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> index 53a21d0..fd7ff1c 100644
>> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> +
>> >> +                       status = "disabled";
>> >> +
>> >> +                       mdp: mdp@ae01000 {
>> >
>> > display-controller@ae01000
>> 
>> Stephen,
>>     In the current driver code, there is a substring comparison for 
>> "mdp"
>> in device node name as part of probe sequence. If "mdp" is not present
>> in the node name, it will
>>     return an error resulting in probe failure. Can we continue using 
>> mdp
>> as nodename instead of display controller?
>> 
> 
> Can we fix the driver to not look for node names and look for 
> compatible
> strings instead? It took me a minute to find compare_name_mdp() in
> drivers/gpu/drm/msm/msm_drv.c to understand what you're talking about.
> Perhaps looking for qcom,mdp5 in there will be sufficient instead of
> looking at the node name.

Sure Stephen. I will make the necessary changes in msm_drv.c to look for 
compatible string instead of node name.
Can I include these two changes (changing mdp--> display controller and 
msm_drv.c changes) in a separate series ?

Thanks,
Krishna
