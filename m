Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F7433D9BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 17:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236692AbhCPQqr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 12:46:47 -0400
Received: from m42-2.mailgun.net ([69.72.42.2]:22157 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234152AbhCPQp2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 12:45:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615913128; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9CTh4K42j9Z1oXO/lr99LekONFZlQRZ1Sb+dmUDk42k=;
 b=MAtAjatz8Sv14SB7o2rW67xru5inB/2yC/vutv9Czu+VVKIBDb321jhbJJHzthhcpouhGvSV
 lwOUY1iP2qnejznkFms+SHlAz++bPoSTRWvDqC8IELovg4e8gei0TWM7+hdyGrJHHtSYxSGe
 9z7pUib5Q1lrlUDt2WfzhzgP/Jc=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6050e09c5d70193f8891d48b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Mar 2021 16:45:16
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 72353C43463; Tue, 16 Mar 2021 16:45:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CF6B5C433C6;
        Tue, 16 Mar 2021 16:45:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 16 Mar 2021 09:45:15 -0700
From:   khsieh@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
Subject: Re: [PATCH v13 4/4] dt-bindings: msm/dp: Add bindings of MSM
 DisplayPort controller
In-Reply-To: <000586cb-8364-e4c9-2707-c54f58a0246c@linaro.org>
References: <1614950952-13351-1-git-send-email-mkrishn@codeaurora.org>
 <1614950952-13351-4-git-send-email-mkrishn@codeaurora.org>
 <000586cb-8364-e4c9-2707-c54f58a0246c@linaro.org>
Message-ID: <14139b5aca1f35ecf096d5a096c9dbc8@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-14 06:28, Dmitry Baryshkov wrote:
> On 05/03/2021 16:29, Krishna Manikandan wrote:
>> Add bindings for Snapdragon DisplayPort controller driver.
>> 
>> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
>> Signed-off-by: Vara Reddy <varar@codeaurora.org>
>> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Krishna, Stephen, I've a question basing on our experiments with the
> DP on sm8250.
> Which driver will reparent dispcc's DP clocks to the DP_PHY clocks?
> 
> We can do this using the assigned-clocks-parents either in the dispcc
> or in the DP nodes. Which would be preferable?
at sc7180.dtsi, it is done at DP node
