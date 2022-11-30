Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F98763E2F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 22:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiK3Vvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 16:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiK3Vv2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 16:51:28 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF3692A1E;
        Wed, 30 Nov 2022 13:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1669845087; x=1701381087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GAy6p2zNRrTbb2Kd0FfJLA6CMe4CwBNHgW0q9DGdS6s=;
  b=pZfNbt71hca0xqb5gXyQsvsHC9s3aK0uHFeenhaRNb7prXo1lAjwwuOM
   gsF+wGJBcFskmmxFLGphptSumxMbj9nXm4dMFa9ZSSB42WB4OGnLCsYlz
   ZbYQxev9+9sb9xCYyIdgvPeXPHM1GCr0sb3UJp9jVFGdSn7QIVjrMaLzJ
   U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 30 Nov 2022 13:51:27 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 13:51:27 -0800
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 30 Nov 2022 13:51:26 -0800
Date:   Wed, 30 Nov 2022 13:51:26 -0800
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     Bart Van Assche <bvanassche@acm.org>
CC:     <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <stanley.chu@mediatek.com>,
        <eddie.huang@mediatek.com>, <daejun7.park@samsung.com>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v8 00/16] Add Multi Circular Queue Support
Message-ID: <20221130215126.GC9934@asutoshd-linux1.qualcomm.com>
References: <cover.1669839847.git.quic_asutoshd@quicinc.com>
 <7b71f90d-05d2-0b42-3a4a-6414e0cb88a3@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <7b71f90d-05d2-0b42-3a4a-6414e0cb88a3@acm.org>
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

On Wed, Nov 30 2022 at 13:14 -0800, Bart Van Assche wrote:
>On 11/30/22 12:27, Asutosh Das wrote:
>>This patch series is an implementation of UFS Multi-Circular Queue.
>>Please consider this series for next merge window.
>
>Hi Asutosh,
>
>It seems like my Reviewed-by tag is missing from several patches?
>
>>Please take a look and let us know your thoughts.
>>
>>v6 -> v7:
>>- Added missing Reviewed-by tags.
>
>Are the v7 -> v8 changes perhaps missing?
>
Hello Bart,
Thanks.
Let me correct this and RESEND the v8 with everything updated.

-asd

>Thanks,
>
>Bart.
>
