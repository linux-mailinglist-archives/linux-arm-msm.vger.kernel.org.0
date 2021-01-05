Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C977F2EA89A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 11:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbhAEK0x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 05:26:53 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:50733 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728012AbhAEK0x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 05:26:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id CAFD17EA;
        Tue,  5 Jan 2021 05:25:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 05 Jan 2021 05:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=ubUqM9i9NxTd2MW29CzycCTtGoQ
        nFRTNu4DW5sQ9V8A=; b=OCFhiGu5aW97oVEbzS8aV8mAAzlb/BNdtdj49bBheMg
        awlpDSfq1nfENTTwj2lxU9tNvz7lbWZMhLW+k0Vz3HsWIvMm7oc7fJQrxY9hqylZ
        Ek6hFu6k89RwdXWF94DG3ZLwrKaNoVMy/Ac0G/jFM1Cu6xgSsD1fbVxjNu5xM+w5
        NhDvxvesHs782bzIOy9tGi2Blbjbtmw+z7Ms6u6JSyMWaJMORvZzTU9cYhha0a57
        ALc6OvMJxfVCrZfVLNOSoO2DJZ7HDb5OPCtMVECYNPBTZvgHi8ermGcnhRiIH571
        d1hbznT7pnNUFrMx1JI7Um/xbNI7/g1wq8+ThabAFAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ubUqM9
        i9NxTd2MW29CzycCTtGoQnFRTNu4DW5sQ9V8A=; b=MUdo9PJFX2nLiJifQkGr+z
        jjPHkYbzoyTsSIUKVo5VtPmGAw0RVOSArAoNa61jrxC5PfchEPZ0Gw0d14oox7fd
        SQt56NEFdsGpoWTrmnH2h40x0vO9X8DIkg4q+KAryT3foCLKS5mdsBFPVudD11F7
        17SqMOp6yU41iNyToPgqiLI2u7A3OL+ti6OJWQdgYqfLfnT0g4H77ED7rJc4QJoS
        RCaij++jejvqpWQWe+1yeI2Jj7bLlLQVKO84eGwRY9PvKTuRDm8vOImjW2D5GEzh
        57eD1RBzNiJk8tb5Jx4DLd0pD0rsJAZ4p2dT006QgEq/k+5qugAz+fTLiemZw5BQ
        ==
X-ME-Sender: <xms:qD70X4kmLYpX0d6tWU4glr3OCffBkGENjOcQzjUp6Nv0p4jWDTAoHw>
    <xme:qD70X32aGgL1HHM5424EAj4h7x9IIrkQ6wcoL_flzVjAbdbIi6eMM5e63fsG3UH2n
    LMLJd4Q_uNeOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefhedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:qD70X2ptvJQyydMcSwu696vvOhcnIoIXOe5-f0vkRgs_Q0LuGeQcAw>
    <xmx:qD70X0k-I60T6E4rixSvjVMJ04uuWY0pJrsy4dIkMSPvfh9kxY-T9Q>
    <xmx:qD70X23fhleG0yiGoBaxaTIcdRk2avJ6cphFsaxoYAGOP-41SFa2ag>
    <xmx:qT70XwNfGMLgfSnj6QF--Gt0yIOKlxdDc-zV4hdntxNU5AtY9ynY-oegUPQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 99ACA24005C;
        Tue,  5 Jan 2021 05:25:43 -0500 (EST)
Date:   Tue, 5 Jan 2021 11:27:08 +0100
From:   Greg KH <greg@kroah.com>
To:     Can Guo <cang@codeaurora.org>
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
Message-ID: <X/Q+/MSk1d2SW3lA@kroah.com>
References: <1609816552-16442-1-git-send-email-cang@codeaurora.org>
 <1609816552-16442-3-git-send-email-cang@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609816552-16442-3-git-send-email-cang@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Oops, forgot the big problem that I noticed:

On Mon, Jan 04, 2021 at 07:15:51PM -0800, Can Guo wrote:
> +static ssize_t monitor_show(struct device *dev, struct device_attribute *attr,
> +			    char *buf)
> +{
> +	struct ufs_hba *hba = dev_get_drvdata(dev);
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct ufs_qcom_perf_monitor *mon = &host->monitor;
> +	unsigned long nr_sec_rd, nr_sec_wr, busy_us_rd, busy_us_wr;
> +	unsigned long lat_max_rd, lat_min_rd, lat_sum_rd, lat_avg_rd, nr_req_rd;
> +	unsigned long lat_max_wr, lat_min_wr, lat_sum_wr, lat_avg_wr, nr_req_wr;
> +	bool is_enabled;
> +
> +	/*
> +	 * Don't lock the host lock since user needs to cat the entry very
> +	 * frequently during performance test, otherwise it may impact the
> +	 * performance.
> +	 */
> +	is_enabled = mon->enabled;
> +	if (!is_enabled)
> +		goto print_usage;
> +
> +	nr_sec_rd = mon->nr_sec_rw[READ];
> +	nr_sec_wr = mon->nr_sec_rw[WRITE];
> +	busy_us_rd = ktime_to_us(mon->total_busy[READ]);
> +	busy_us_wr = ktime_to_us(mon->total_busy[WRITE]);
> +
> +	nr_req_rd = mon->nr_req[READ];
> +	lat_max_rd = ktime_to_us(mon->lat_max[READ]);
> +	lat_min_rd = ktime_to_us(mon->lat_min[READ]);
> +	lat_sum_rd = ktime_to_us(mon->lat_sum[READ]);
> +	lat_avg_rd = lat_sum_rd / nr_req_rd;
> +
> +	nr_req_wr = mon->nr_req[WRITE];
> +	lat_max_wr = ktime_to_us(mon->lat_max[WRITE]);
> +	lat_min_wr = ktime_to_us(mon->lat_min[WRITE]);
> +	lat_sum_wr = ktime_to_us(mon->lat_sum[WRITE]);
> +	lat_avg_wr = lat_sum_wr / nr_req_wr;
> +
> +	return scnprintf(buf, PAGE_SIZE, "Read %lu %s %lu us, %lu %s max %lu | min %lu | avg %lu | sum %lu\nWrite %lu %s %lu us, %lu %s max %lu | min %lu | avg %lu | sum %lu\n",
> +		 nr_sec_rd, "sectors (in 512 bytes) in ", busy_us_rd,
> +		 nr_req_rd, "read reqs completed, latencies in us: ",
> +		 lat_max_rd, lat_min_rd, lat_avg_rd, lat_sum_rd,
> +		 nr_sec_wr, "sectors (in 512 bytes) in ", busy_us_wr,
> +		 nr_req_wr, "write reqs completed, latencies in us: ",
> +		 lat_max_wr, lat_min_wr, lat_avg_wr, lat_sum_wr);

sysfs is one-value-per-file, not
throw-everything-in-one-file-and-hope-userspace-can-parse-it.

This is not acceptable at all.  Why not just use debugfs for stats like
this?

Also, use sysfs_emit() for any new sysfs files please.

thanks,

greg k-h
