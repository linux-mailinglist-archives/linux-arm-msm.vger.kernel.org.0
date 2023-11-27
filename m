Return-Path: <linux-arm-msm+bounces-2053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 687FE7F9D24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 11:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B9AA1F20CAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 10:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159FA18034;
	Mon, 27 Nov 2023 10:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dgyZ8Azr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55590E1;
	Mon, 27 Nov 2023 02:11:37 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR7vNnT021251;
	Mon, 27 Nov 2023 10:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=EY/c6/Ci98EonGSNUz6fVfm6jLBxiwZHNUrcbJIhhUc=;
 b=dgyZ8AzrEPdMj/muYfIY6vmUUgXJ221mbT63cmMQh6IWmaPLdMtfQkcM8HkdYM1Y91Vm
 e+Eaa7XDLPLUlXzCFdJf8g/Xp6+ILKhodQb38KqIGqseMEabwkqPFmtUbQ0fEfxZa6/X
 rGhH4S8ArhNtC4HGmEDp7qtcSp8nrEC5478A8GQwRJfvnq6MOJnMYsaqLa7BcAe2q23W
 f0LplwPmfHnQrstICNVYEIMiYOr6+u639WhfKJZIQet/fOSSJcwixOH9ssYBcjYGi5+7
 qzeZBGVubFQlS3Z1D0MF7jfJzZCAxgg2e7O0Smxzvdq7wgQCVeNxvKUCckM3QKdp5wzI WA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uk69uc435-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 10:11:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ARABACA005140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 10:11:10 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 27 Nov 2023 02:11:00 -0800
Date: Mon, 27 Nov 2023 15:40:57 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>
Subject: Re: [Patch v6 11/12] pstore/ram: Add ramoops ready notifier support
Message-ID: <3636dc3a-b62b-4ff9-bdc3-fec496a804b7@quicinc.com>
References: <1700864395-1479-1-git-send-email-quic_mojha@quicinc.com>
 <1700864395-1479-12-git-send-email-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1700864395-1479-12-git-send-email-quic_mojha@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1IOVxm-ZeU_nBthYVKeJDrGdxnOedH7K
X-Proofpoint-GUID: 1IOVxm-ZeU_nBthYVKeJDrGdxnOedH7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_08,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270070

On Sat, Nov 25, 2023 at 03:49:54AM +0530, Mukesh Ojha wrote:
> Client like minidump, is only interested in ramoops
> region addresses/size so that it could register them
> with its table and also it is only deals with ram
> backend and does not use pstorefs to read the records.
> Let's introduce a client notifier in ramoops which
> gets called when ramoops driver probes successfully
> and it passes the ramoops region information to the
> passed callback by the client and If the call for
> ramoops ready register comes after ramoops probe
> than call the callback directly.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  fs/pstore/ram.c            | 77 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pstore_ram.h |  6 ++++
>  2 files changed, 83 insertions(+)
> 
> diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
> index a6c0da8cfdd4..72341fd21aec 100644
> --- a/fs/pstore/ram.c
> +++ b/fs/pstore/ram.c
> @@ -22,6 +22,7 @@
>  #include <linux/of_address.h>
>  #include <linux/memblock.h>
>  #include <linux/mm.h>
> +#include <linux/mutex.h>
>  
>  #include "internal.h"
>  #include "ram_internal.h"
> @@ -101,6 +102,14 @@ struct ramoops_context {
>  	unsigned int ftrace_read_cnt;
>  	unsigned int pmsg_read_cnt;
>  	struct pstore_info pstore;
> +	/*
> +	 * Lock to serialize calls to register_ramoops_ready_notifier,
> +	 * ramoops_ready_notifier and read/modification of 'ramoops_ready'.
> +	 */
> +	struct mutex lock;
> +	bool ramoops_ready;
> +	int (*callback)(const char *name, int id, void *vaddr,
> +			phys_addr_t paddr, size_t size);
>  };
>  
>  static struct platform_device *dummy;
> @@ -488,6 +497,7 @@ static int ramoops_pstore_erase(struct pstore_record *record)
>  }
>  
>  static struct ramoops_context oops_cxt = {
> +	.lock   = __MUTEX_INITIALIZER(oops_cxt.lock),
>  	.pstore = {
>  		.owner	= THIS_MODULE,
>  		.name	= "ramoops",
> @@ -662,6 +672,68 @@ static int ramoops_init_prz(const char *name,
>  	return 0;
>  }
>  
> +void ramoops_ready_notifier(struct ramoops_context *cxt)
> +{
> +	struct persistent_ram_zone *prz;
> +	int i;
> +
> +	if (!cxt->callback)
> +		return;
> +
> +	for (i = 0; i < cxt->max_dump_cnt; i++) {
> +		prz = cxt->dprzs[i];
> +		cxt->callback("dmesg", i, prz->vaddr, prz->paddr, prz->size);
> +	}
> +
> +	if (cxt->console_size) {
> +		prz = cxt->cprz;
> +		cxt->callback("console", 0, prz->vaddr, prz->paddr, prz->size);
> +	}
> +
> +	for (i = 0; i < cxt->max_ftrace_cnt; i++) {
> +		prz = cxt->fprzs[i];
> +		cxt->callback("ftrace", i, prz->vaddr, prz->paddr, prz->size);
> +	}
> +
> +	if (cxt->pmsg_size) {
> +		prz = cxt->mprz;
> +		cxt->callback("pmsg", 0, prz->vaddr, prz->paddr, prz->size);
> +	}
> +}
> +
> +int register_ramoops_ready_notifier(int (*fn)(const char *, int,
> +				   void *, phys_addr_t, size_t))
> +{
> +	struct ramoops_context *cxt = &oops_cxt;
> +
> +	mutex_lock(&cxt->lock);
> +	if (cxt->callback) {
> +		mutex_unlock(&cxt->lock);
> +		return -EEXIST;
> +	}
> +
> +	cxt->callback = fn;
> +	if (cxt->ramoops_ready)
> +		ramoops_ready_notifier(cxt);
> +
> +	mutex_unlock(&cxt->lock);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(register_ramoops_ready_notifier);
> +

Can you please elaborate on why do we need this custom notifier logic? 

why would not a standard notifier (include/linux/notifier.h) work here? 
The notifier_call callback can recieve custom data from the 
notifier chain implementer. All we need is to define a custom struct like

struct pstore_ramoops_zone_data {
	const char *name;
	int id;
	void *vaddr;
	phys_addr_t paddr;
	size_t size;
};

and pass the pointer to array of this struct. 


btw, the current logic only supports just one client and this limitation
is not highlighted any where.

Thanks,
Pavan


