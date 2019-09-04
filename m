Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC349A80EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 13:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbfIDLKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 07:10:11 -0400
Received: from ns.iliad.fr ([212.27.33.1]:58342 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbfIDLKK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 07:10:10 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id C990020C7E;
        Wed,  4 Sep 2019 13:10:08 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id AE9C920103;
        Wed,  4 Sep 2019 13:10:08 +0200 (CEST)
Subject: Re: [PATCH RFC 2/2] interconnect: qcom: add msm8974 driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20190902211925.27169-1-masneyb@onstation.org>
 <20190902211925.27169-3-masneyb@onstation.org>
 <20190904053952.GF3081@tuxbook-pro>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <8f1a25aa-6dc6-b94a-fc58-e944bdfae939@free.fr>
Date:   Wed, 4 Sep 2019 13:10:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904053952.GF3081@tuxbook-pro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Sep  4 13:10:08 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/09/2019 07:39, Bjorn Andersson wrote:

> On Mon 02 Sep 14:19 PDT 2019, Brian Masney wrote:
> 
>> +DEFINE_QNODE(mas_ampss_m0, MSM8974_BIMC_MAS_AMPSS_M0, 8, 0, -1);
>> +DEFINE_QNODE(mas_ampss_m1, MSM8974_BIMC_MAS_AMPSS_M1, 8, 0, -1);
>> +DEFINE_QNODE(mas_mss_proc, MSM8974_BIMC_MAS_MSS_PROC, 8, 1, -1);
>> +DEFINE_QNODE(bimc_to_mnoc, MSM8974_BIMC_TO_MNOC, 8, 2, -1,
>> +	     MSM8974_BIMC_SLV_EBI_CH0);
> 
> None of these looks excessive, so please ignore the 80-char rule to
> improve readability.

Indeed!
