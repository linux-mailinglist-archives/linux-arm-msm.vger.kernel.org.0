Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5813F2E05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Aug 2021 16:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238451AbhHTOZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Aug 2021 10:25:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:22324 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240758AbhHTOZ1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Aug 2021 10:25:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629469490; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cd51haHP+MBwD/UOdMJv/XyRlloOaggVKU0MpKh31MM=;
 b=GFFLcvyiDCoJWXqitmVkKwF6Sb6yegbVk+Bj76JE5XUz5VUnkdQ1/5EW7QyAYceU4DEE9qUY
 rhqYZf7meTtUIJfs2s4RwkOblNMONdMxSxwzJsYWoD/h9813Yb/11Im2RAmy2IzHuaO0ZJxV
 J/b0qV8iwiOFcyXFJ8NeBR9nCTI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 611fbb040f9b337f117be7f4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 20 Aug 2021 14:24:04
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B7BF2C4360C; Fri, 20 Aug 2021 14:24:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0877BC4338F;
        Fri, 20 Aug 2021 14:24:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 20 Aug 2021 19:54:02 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v5 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP
 property
In-Reply-To: <CAE-0n531EgLx-gGJswmmNAFmy-P9z=Hh1N=fkLw_uemoeQnYVg@mail.gmail.com>
References: <1629342136-3667-1-git-send-email-sibis@codeaurora.org>
 <1629342136-3667-3-git-send-email-sibis@codeaurora.org>
 <CAE-0n531EgLx-gGJswmmNAFmy-P9z=Hh1N=fkLw_uemoeQnYVg@mail.gmail.com>
Message-ID: <d733d47bc6a86fe28302943e50d02bd5@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-20 00:25, Stephen Boyd wrote:
> Quoting Sibi Sankar (2021-08-18 20:02:05)
>> The load state power-domain, used by the co-processors to notify the
>> Always on Subsystem (AOSS) that a particular co-processor is up/down,
>> suffers from the side-effect of changing states during suspend/resume.
>> However the co-processors enter low-power modes independent to that of
>> the application processor and their states are expected to remain
>> unaltered across system suspend/resume cycles. To achieve this 
>> behavior
>> let's drop the load state power-domain and replace them with the qmp
>> property for all SoCs supporting low power mode signalling.
>> 
> 
> How do we drop the load state property without breaking existing DTBs?
> Maybe we need to leave it there and then somehow make it optional? Or 
> do
> we not care about this problem as the driver will start ignoring it?

We can afford to break the bindings
because of the following reason:

* Load state in mainline is currently
   broken i.e. it doesn't serve its
   main purpose of signalling AOP of
   the correct state of Q6 during
   system suspend/resume. Thus we
   can maintain current functionality
   even without the load state votes
   i.e. when a new kernel with load
   state removed is used with an older
   dtb the remoteproc functionality
   will remain the same.


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
