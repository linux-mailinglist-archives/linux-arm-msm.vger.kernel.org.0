Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6715318B86F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 14:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727206AbgCSN75 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 09:59:57 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:32303 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726933AbgCSN75 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 09:59:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584626397; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fjT3eshzOsMm/IK7+LKn3mH/24uCjv4XPfqaSyzCytk=;
 b=I/tnQwcayOKwH83WPUN5O5FFt4A9FYwXT2yFXWzPa96p5V/5T8Q8n7PzfhdDTXXxUz1fx6+R
 Jr8YAEALa34ipqhhqIblqixNuXAF7j9kJmXnPCVg0JJt/pLYXTvU6eYxR6q2EXtOnTXAOm1U
 x9+1uZb0EtIMgnJ9vj0wf9KF1c0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e737ad7.7f6955b3e3b0-smtp-out-n05;
 Thu, 19 Mar 2020 13:59:51 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1112AC432C2; Thu, 19 Mar 2020 13:59:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E6750C433CB;
        Thu, 19 Mar 2020 13:59:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 19 Mar 2020 19:29:48 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [bug report] soc: qcom: Introduce Protection Domain Restart
 helpers
In-Reply-To: <20200318094750.GA4617@mwanda>
References: <20200318094750.GA4617@mwanda>
Message-ID: <5b8a818b3743870c4653cc692f89da08@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Dan,
Thanks for the bug report!
Will get the warning fixed

On 2020-03-18 15:17, Dan Carpenter wrote:
> Hello Sibi Sankar,
> 
> The patch fbe639b44a82: "soc: qcom: Introduce Protection Domain
> Restart helpers" from Mar 12, 2020, leads to the following static
> checker warning:
> 
> 	drivers/soc/qcom/pdr_interface.c:158 pdr_register_listener()
> 	warn: impossible condition '(resp.curr_state < (-((~0 >> 1)) - 1)) =>
> (s32min-s32max < s32min)'
> 
> drivers/soc/qcom/pdr_interface.c
>    145          ret = qmi_txn_wait(&txn, 5 * HZ);
>    146          if (ret < 0) {
>    147                  pr_err("PDR: %s register listener txn wait
> failed: %d\n",
>    148                         pds->service_path, ret);
>    149                  return ret;
>    150          }
>    151
>    152          if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
>    153                  pr_err("PDR: %s register listener failed: 
> 0x%x\n",
>    154                         pds->service_path, resp.resp.error);
>    155                  return ret;
>    156          }
>    157
>    158          if ((int)resp.curr_state < INT_MIN ||
> (int)resp.curr_state > INT_MAX)
>                     ^^^^                              ^^^^
> These are casted to int so they can't be outside of int range.
> 
>    159                  pr_err("PDR: %s notification state invalid: 
> 0x%x\n",
>    160                         pds->service_path, resp.curr_state);
>    161
>    162          pds->state = resp.curr_state;
>    163
>    164          return 0;
>    165  }
> 
> regards,
> dan carpenter

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
