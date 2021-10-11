Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574E34297F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 22:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233528AbhJKUMz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 16:12:55 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:49286 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231926AbhJKUMz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 16:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1633983054; x=1665519054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4qalDZAuMz1rcxjvxkin+MMISbyKSsDOpZCfQg7Dd3k=;
  b=vikJIBzelfZBl2K00xCQIiJy5tL+j4f2cZTinBszu5RlID4q6TWZPJKI
   D+NtDlAN9JcGS+d7kjixZ1lZ7gzFjuR65tJzFJQruixK7b3SCRob1BuxV
   hij264Yse8HGVWHDBsTj7YRokpu88iIYqCGDIH/kQ7C6laSwnnTIXeYy0
   Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Oct 2021 13:10:54 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2021 13:10:54 -0700
Received: from hu-gurus-sd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 11 Oct 2021 13:10:54 -0700
Date:   Mon, 11 Oct 2021 13:10:53 -0700
From:   Guru Das Srinagesh <quic_gurus@quicinc.com>
To:     Stephen Boyd <swboyd@chromium.org>
CC:     Dan Carpenter <dan.carpenter@oracle.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [bug report] firmware: qcom_scm: Make
 __qcom_scm_is_call_available() return bool
Message-ID: <20211011201053.GA28665@hu-gurus-sd.qualcomm.com>
References: <20211011092054.GA6793@kili>
 <20211011184022.GA18698@hu-gurus-sd.qualcomm.com>
 <CAE-0n51tW3jwAPHaoDTMM89ADcPQuWb4UyjCSbkRXHF3wPe4og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAE-0n51tW3jwAPHaoDTMM89ADcPQuWb4UyjCSbkRXHF3wPe4og@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 11, 2021 at 12:06:13PM -0700, Stephen Boyd wrote:
> Resend as a proper patch?
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Done: https://lore.kernel.org/lkml/1633982414-28347-1-git-send-email-quic_gurus@quicinc.com/

Thank you.

Guru Das.
