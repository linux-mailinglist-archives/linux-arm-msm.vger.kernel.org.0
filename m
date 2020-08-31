Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B84258047
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 20:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgHaSHR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 14:07:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:24989 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728203AbgHaSHR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 14:07:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598897236; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fAEf+wFDeBUv5cYz5qkmxYUlTUgGSo7Zjv4xY6DTkC8=;
 b=c9hR4jQEfxPAryQNMjMyG9NOzRF9QpTUh7k3WPEaM9Ii6p+JtzY/zNGtTlvKnGfkCcV1Fd0N
 TSVo1ja/ucBtmzKLfnPjJOF3+tfhjqhSjU9E76WXwsXY+zAvp6IzLQKhgksAu0I22znAdDwQ
 oZn+DEFtv809NXxw07ObQqOfWXA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f4d3c4c238e1efa37d512fc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 Aug 2020 18:07:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E6991C43395; Mon, 31 Aug 2020 18:07:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 49534C433C6;
        Mon, 31 Aug 2020 18:07:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 31 Aug 2020 11:07:06 -0700
From:   nguyenb@codeaurora.org
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] scsi: ufshcd: Allow zero value setting to
 Auto-Hibernate Timer
In-Reply-To: <BY5PR04MB6705177184FC1A0E5F7710FDFC530@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <b141cfcd7998b8933635828b56fbb64f8ad4d175.1598661071.git.nguyenb@codeaurora.org>
 <BY5PR04MB6705177184FC1A0E5F7710FDFC530@BY5PR04MB6705.namprd04.prod.outlook.com>
Message-ID: <96e34a8d7d52dfbc47738f04d2a127c2@codeaurora.org>
X-Sender: nguyenb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-29 00:32, Avri Altman wrote:
>> 
>> The zero value Auto-Hibernate Timer is a valid setting, and it
>> indicates the Auto-Hibernate feature being disabled. Correctly
> Right. So " ufshcd_auto_hibern8_enable" is no longer an appropriate 
> name.
> Maybe ufshcd_auto_hibern8_set instead?
Thanks for your comment. I am ok with the name change suggestion.
> 
> Also, did you verified that no other platform relies on its non-zero 
> value?
I only tested the change on Qualcomm's platform. I do not have other 
platforms to do the test.
The UFS host controller spec JESD220E, Section 5.2.5 says
"Software writes “0” to disable Auto-Hibernate Idle Timer". So the spec 
supports this zero value.
Some options:
- We could add a hba->caps so that we only apply the change for 
Qualcomm's platforms.
This is not preferred because it is following the spec implementations.
- Or other platforms that do not support the zero value needs a caps.
> 
> Thanks,
> Avri
