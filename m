Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70EB617FED2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 14:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgCJNlN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 09:41:13 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:21320 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726508AbgCJNlM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 09:41:12 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02ADY8mq001091;
        Tue, 10 Mar 2020 14:41:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=YPtuuFjlaHziSVTLb4nw/9PbtG4QP/ffI4njO2jnjD8=;
 b=I5UdkSdOwCgWH3Rzmqs9i2C8T7h4EKPpvut6bFS9SW2YGY0mjZ8Pk1GJaWICb4RxtGbR
 Csrtkv3FAJRf3brmvnxlFt8c/8Se4zVzx/e60b7xZaJLM/ZpfQRHS8eH3T/AiBdSSVd6
 1iEAfI4smKR5rDxma6zqF+uRhbUZLw8uIroiiy/dqGWDG14r1wCuzrYYKZ0hWILAtJC1
 D+vC9rsD4MARWDbi9V2hcJPZuQoIiyYNAPAVRk+UKpG/XGgjW66FRvpEdrbIpUBNdYwY
 FbERozYkgnamxG2CZl0bVisYft/73xP+da27ZVpnpJEhcMRVurZ0VosxEc32itNak7SM 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ym1mguvd1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Mar 2020 14:41:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E0836100038;
        Tue, 10 Mar 2020 14:41:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CAC172B2B65;
        Tue, 10 Mar 2020 14:41:01 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 10 Mar
 2020 14:41:00 +0100
Subject: Re: [PATCH v4 1/4] remoteproc: Traverse rproc_list under RCU read
 lock
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
CC:     <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
 <20200310063817.3344712-2-bjorn.andersson@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <87a14705-186d-01a4-e8a5-1844dab4ea14@st.com>
Date:   Tue, 10 Mar 2020 14:41:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310063817.3344712-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-10_07:2020-03-10,2020-03-10 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,


On 3/10/20 7:38 AM, Bjorn Andersson wrote:
> In order to be able to traverse the mostly read-only rproc_list without
> locking during panic migrate traversal to be done under rcu_read_lock().
> 
> Mutual exclusion for modifications of the list continues to be handled
> by the rproc_list_mutex and a synchronization point is added before
> releasing objects that are popped from the list.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Change v3:
> - New patch
> 
>  drivers/remoteproc/remoteproc_core.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..f0a77c30c6b1 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1854,8 +1854,8 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
>  	if (!np)
>  		return NULL;
>  
> -	mutex_lock(&rproc_list_mutex);
> -	list_for_each_entry(r, &rproc_list, node) {
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(r, &rproc_list, node) {
>  		if (r->dev.parent && r->dev.parent->of_node == np) {
>  			/* prevent underlying implementation from being removed */
>  			if (!try_module_get(r->dev.parent->driver->owner)) {
> @@ -1868,7 +1868,7 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
>  			break;
>  		}
>  	}
> -	mutex_unlock(&rproc_list_mutex);
> +	rcu_read_unlock();
>  
>  	of_node_put(np);
>  
> @@ -1925,7 +1925,7 @@ int rproc_add(struct rproc *rproc)
>  
>  	/* expose to rproc_get_by_phandle users */
>  	mutex_lock(&rproc_list_mutex);
> -	list_add(&rproc->node, &rproc_list);
> +	list_add_rcu(&rproc->node, &rproc_list);
>  	mutex_unlock(&rproc_list_mutex);
>  
>  	return 0;
> @@ -2140,9 +2140,12 @@ int rproc_del(struct rproc *rproc)
>  
>  	/* the rproc is downref'ed as soon as it's removed from the klist */
>  	mutex_lock(&rproc_list_mutex);
> -	list_del(&rproc->node);
> +	list_del_rcu(&rproc->node);
>  	mutex_unlock(&rproc_list_mutex);
i'm not familiar with rcu but as rproc_panic_handler can be called in interrupt context, 
does mutex should be replaced by a spinlock?

Regards,
Arnaud
>  
> +	/* Ensure that no readers of rproc_list are still active */
> +	synchronize_rcu();
> +
>  	device_del(&rproc->dev);
>  
>  	return 0;
> 
