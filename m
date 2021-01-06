Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E322E2EB71D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 01:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbhAFAwg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 19:52:36 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:23913 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbhAFAwg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 19:52:36 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609894335; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=PZc2NcG7uuh+6im8cfLwXFTleXn53JDpJ97p6N/GsAg=;
 b=TInKWTM3L4Yt+qOny0+fxdgQk4K6dWFQ8UuBNniCzajxoZD1bbCtAml8UKlwn1BqkPulWGDK
 C9rFKBs8c+4/5qe6uL7PGv6u42+8qqKy84yh++dh2q2eR/hNWiZooGoUkZmh+4QOnz8rZIzE
 MXKf/odJr2Xn+canLxeOGbFngSg=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5ff509a2d3eb3c36b4c3cc6b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Jan 2021 00:51:46
 GMT
Sender: cang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E8BD4C4346A; Wed,  6 Jan 2021 00:51:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 007A9C433CA;
        Wed,  6 Jan 2021 00:51:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 06 Jan 2021 08:51:42 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Greg KH <greg@kroah.com>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] scsi: ufs-qcom: Add one sysfs node to monitor
 performance
In-Reply-To: <X/Q+/MSk1d2SW3lA@kroah.com>
References: <1609816552-16442-1-git-send-email-cang@codeaurora.org>
 <1609816552-16442-3-git-send-email-cang@codeaurora.org>
 <X/Q+/MSk1d2SW3lA@kroah.com>
Message-ID: <684aabf8070279e380e03ec7b891330d@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-05 18:27, Greg KH wrote:
> Oops, forgot the big problem that I noticed:
> 
> On Mon, Jan 04, 2021 at 07:15:51PM -0800, Can Guo wrote:
>> +static ssize_t monitor_show(struct device *dev, struct 
>> device_attribute *attr,
>> +			    char *buf)
>> +{
>> +	struct ufs_hba *hba = dev_get_drvdata(dev);
>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +	struct ufs_qcom_perf_monitor *mon = &host->monitor;
>> +	unsigned long nr_sec_rd, nr_sec_wr, busy_us_rd, busy_us_wr;
>> +	unsigned long lat_max_rd, lat_min_rd, lat_sum_rd, lat_avg_rd, 
>> nr_req_rd;
>> +	unsigned long lat_max_wr, lat_min_wr, lat_sum_wr, lat_avg_wr, 
>> nr_req_wr;
>> +	bool is_enabled;
>> +
>> +	/*
>> +	 * Don't lock the host lock since user needs to cat the entry very
>> +	 * frequently during performance test, otherwise it may impact the
>> +	 * performance.
>> +	 */
>> +	is_enabled = mon->enabled;
>> +	if (!is_enabled)
>> +		goto print_usage;
>> +
>> +	nr_sec_rd = mon->nr_sec_rw[READ];
>> +	nr_sec_wr = mon->nr_sec_rw[WRITE];
>> +	busy_us_rd = ktime_to_us(mon->total_busy[READ]);
>> +	busy_us_wr = ktime_to_us(mon->total_busy[WRITE]);
>> +
>> +	nr_req_rd = mon->nr_req[READ];
>> +	lat_max_rd = ktime_to_us(mon->lat_max[READ]);
>> +	lat_min_rd = ktime_to_us(mon->lat_min[READ]);
>> +	lat_sum_rd = ktime_to_us(mon->lat_sum[READ]);
>> +	lat_avg_rd = lat_sum_rd / nr_req_rd;
>> +
>> +	nr_req_wr = mon->nr_req[WRITE];
>> +	lat_max_wr = ktime_to_us(mon->lat_max[WRITE]);
>> +	lat_min_wr = ktime_to_us(mon->lat_min[WRITE]);
>> +	lat_sum_wr = ktime_to_us(mon->lat_sum[WRITE]);
>> +	lat_avg_wr = lat_sum_wr / nr_req_wr;
>> +
>> +	return scnprintf(buf, PAGE_SIZE, "Read %lu %s %lu us, %lu %s max %lu 
>> | min %lu | avg %lu | sum %lu\nWrite %lu %s %lu us, %lu %s max %lu | 
>> min %lu | avg %lu | sum %lu\n",
>> +		 nr_sec_rd, "sectors (in 512 bytes) in ", busy_us_rd,
>> +		 nr_req_rd, "read reqs completed, latencies in us: ",
>> +		 lat_max_rd, lat_min_rd, lat_avg_rd, lat_sum_rd,
>> +		 nr_sec_wr, "sectors (in 512 bytes) in ", busy_us_wr,
>> +		 nr_req_wr, "write reqs completed, latencies in us: ",
>> +		 lat_max_wr, lat_min_wr, lat_avg_wr, lat_sum_wr);
> 
> sysfs is one-value-per-file, not
> throw-everything-in-one-file-and-hope-userspace-can-parse-it.
> 
> This is not acceptable at all.  Why not just use debugfs for stats like
> this?
> 
> Also, use sysfs_emit() for any new sysfs files please.
> 
> thanks,
> 
> greg k-h

Hi Greg,

Thanks for the comments, I will rework the change to make it right.

Regards,
Can Guo.
