Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0857360306B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 18:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbiJRQA5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 12:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiJRQA4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 12:00:56 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 815B36C948;
        Tue, 18 Oct 2022 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1666108850; x=1697644850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k4e1kohq0AjaS3npqA02nZrS60kNr7lx5YClMC11s2w=;
  b=PETUI+6NuI0jFO34h56WgO0/R2tC4oeB4B04wxvG+TLkpKBy0C39oFpC
   md8X998mjb6uF6ehvTRuOH8XrSJn2wXUBwMHmB8sAazJ6pLkPqXcQ5c+E
   /Mk0eb/xWnLX16wULTGFR6JRTqyO/8rpWcLLWzIXEJESruhDbFRlQlfFR
   E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Oct 2022 09:00:49 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 09:00:49 -0700
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 18 Oct 2022 09:00:48 -0700
Date:   Tue, 18 Oct 2022 09:00:48 -0700
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     Eddie Huang <eddie.huang@mediatek.com>
CC:     <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_richardp@quicinc.com>, <linux-scsi@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>,
        <stanley.chu@mediatek>, <liang-yen.wang@mediatek.com>
Subject: Re: [PATCH v2 05/17] ufs: core: mcq: Introduce Multi Circular Queue
Message-ID: <20221018160048.GF10252@asutoshd-linux1.qualcomm.com>
References: <cover.1665017636.git.quic_asutoshd@quicinc.com>
 <11ee57da1d1872f8f02aa5d94e254ee9ddf4ef7a.1665017636.git.quic_asutoshd@quicinc.com>
 <c89473d2cf48eb92b4afbd78578cd508c481f8b6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <c89473d2cf48eb92b4afbd78578cd508c481f8b6.camel@mediatek.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 18 2022 at 22:29 -0700, Eddie Huang wrote:
[...]
>> ---
>>  drivers/ufs/core/Makefile      |   2 +-
>>  drivers/ufs/core/ufs-mcq.c     | 113
>> +++++++++++++++++++++++++++++++++++++++++
[...]
>>  create mode 100644 drivers/ufs/core/ufs-mcq.c
>>
>
>[...]
>
>>  /**
>>   * ufshcd_probe_hba - probe hba to detect device and initialize it
>>   * @hba: per-adapter instance
>> @@ -8224,6 +8233,9 @@ static int ufshcd_probe_hba(struct ufs_hba
>> *hba, bool init_dev_params)
>>  			goto out;
>>
>>  		if (is_mcq_supported(hba)) {
>> +			ret = ufshcd_config_mcq(hba);
[...]

>
>ufshcd_probe_hba() may be called multiple times (from
>ufshcd_async_scan() and ufshcd_host_reset_and_restore()). It is not a
>good idea to allocate memory in ufshcd_config_mcq(). Although use
>parameter init_dev_params to decide call ufshcd_config_mcq() or not, it
>may cause ufshcd_host_reset_and_restore() not to configure MCQ (init
>SQ/CQ ptr...) again.
>
I don't think the memory allocation can be moved prior to reading the device
descriptor since the bQueueDepth is necessary.
But I agree to your point that ufshcd_host_reset_and_restore() wouldn't
reconfigure MCQ now. Thanks.

>Suggest to separate configure MCQ (set hardware register) and allocate
>memory to different function
>
How about I keep the memory allocation in ufshcd_probe_hba() within the
init_dev_params check and separate out the initialization outside the check.
That'd ensure that the configuration is done for each call to
ufshcd_probe_hba(). I'm open to any other idea that you may have, plmk.
>
-asd
