Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9575257FB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 19:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgHaRi5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 13:38:57 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35769 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726085AbgHaRi4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 13:38:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598895536; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=tLMc2AoC+KjzdShJAZhh/7JBmG+icFLxMYh/8L1monU=;
 b=e0Zo8/yJ9Jk67cPdhBJmVOhoVssb8mkaH03RCufgDXcWNhqaxKnce67FRotlP3v+QIwL0065
 pHIGy9aZqtx5UzEhc3co1RJ+KpDLiLWpFNYA2bKCFOEzFtiYqUMMr8Y2Ayz6j0+cXP7TOegO
 W9yC6qlp2SWjpPJRYInLTI4m/eM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f4d35af9bdf68cc03bc79b6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 Aug 2020 17:38:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 35EE5C43391; Mon, 31 Aug 2020 17:38:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8CA93C433CA;
        Mon, 31 Aug 2020 17:38:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 31 Aug 2020 10:38:54 -0700
From:   nguyenb@codeaurora.org
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        Bean Huo <beanhuo@micron.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] scsi: ufshcd: Allow zero value setting to
 Auto-Hibernate Timer
In-Reply-To: <56c8bde3-2457-402f-0ad2-94fc1fe12cd5@acm.org>
References: <b141cfcd7998b8933635828b56fbb64f8ad4d175.1598661071.git.nguyenb@codeaurora.org>
 <56c8bde3-2457-402f-0ad2-94fc1fe12cd5@acm.org>
Message-ID: <0914db1a7aaa8b3b528f2298eb213b3c@codeaurora.org>
X-Sender: nguyenb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-28 20:13, Bart Van Assche wrote:
> On 2020-08-28 18:05, Bao D. Nguyen wrote:
>>  static ssize_t auto_hibern8_show(struct device *dev,
>>  				 struct device_attribute *attr, char *buf)
>>  {
>> +	u32 ahit;
>>  	struct ufs_hba *hba = dev_get_drvdata(dev);
> 
> Although not strictly required for SCSI code, how about following the 
> "reverse
> christmas tree" convention and adding "u32 ahit" below the "hba" 
> declaration?
Thanks for your comment. I will change it.
>>  	if (!ufshcd_is_auto_hibern8_supported(hba))
>>  		return -EOPNOTSUPP;
>> 
>> -	return snprintf(buf, PAGE_SIZE, "%d\n", 
>> ufshcd_ahit_to_us(hba->ahit));
>> +	pm_runtime_get_sync(hba->dev);
>> +	ufshcd_hold(hba, false);
>> +	ahit = ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
>> +	ufshcd_release(hba);
>> +	pm_runtime_put_sync(hba->dev);
>> +
>> +	return scnprintf(buf, PAGE_SIZE, "%d\n", ufshcd_ahit_to_us(ahit));
>>  }
> 
> Why the pm_runtime_get_sync()/pm_runtime_put_sync() and
> ufshcd_hold()/ufshcd_release() calls? I don't think these are necessary 
> here.
We may try to access the hardware register during runtime suspend or UFS 
clock is gated.
UFS clock gating can happen even during runtime resume. Here we are 
trying to prevent NoC error
due to unclocked access.
> Thanks,
> 
> Bart.
