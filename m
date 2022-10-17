Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD864601B28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 23:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbiJQVRY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 17:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbiJQVRY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 17:17:24 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5DB13E29;
        Mon, 17 Oct 2022 14:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1666041435; x=1697577435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=laBnKledVN1BnwOpPt87j32+Kw/82HKxTY4CPoJNBPo=;
  b=iyHP/xZQqB+p+Y40N3Yaqn9UZadpiF6pdTMHlY9cTu8+qSg2FwN2TGPL
   e+wiPmTggnP3wVASwr+cQKTAGjDBjdijXgLue4GeVzIYbRzG99b4RLSP2
   dev2qHrM3WSXpwhxFLozVy6MVLxFjNmjVi6zqpmr8JLl1WgWNoF1ujEwd
   U=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Oct 2022 14:17:13 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 14:17:13 -0700
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 17 Oct 2022 14:17:06 -0700
Date:   Mon, 17 Oct 2022 14:17:06 -0700
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     Eddie Huang <eddie.huang@medaitek.com>
CC:     <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_richardp@quicinc.com>, <linux-scsi@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>
Subject: Re: [PATCH v2 08/17] ufs: core: mcq: Allocate memory for mcq mode
Message-ID: <20221017211706.GD10252@asutoshd-linux1.qualcomm.com>
References: <cover.1665017636.git.quic_asutoshd@quicinc.com>
 <48b4a739e03056ad0e958ce65f7de5b79ce0ab02.1665017636.git.quic_asutoshd@quicinc.com>
 <813a86729b42693d2ac0b6e29ab7867feef69e23.camel@medaitek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <813a86729b42693d2ac0b6e29ab7867feef69e23.camel@medaitek.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 14 2022 at 19:06 -0700, Eddie Huang wrote:
>Hi Asutosh,
>
[...]
>
>Please use devm_kzalloc instead devm_kmalloc to set variable initial
>value to 0. (For example, sq_tail_slot should have initial value 0. If
>not, it will cause error on my platform)
>
Ok, will do. Thanks.
>>
>>
>
>Thanks,
>Eddie Huang
>
>
