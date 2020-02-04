Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6C8151FB8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 18:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbgBDRmu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 12:42:50 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:45364 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727441AbgBDRmt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 12:42:49 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 014HXE5X026859;
        Tue, 4 Feb 2020 18:42:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=BrhkBIB17pdSOgkKEv4fdq2cGldeHd2/xTC8heZgF28=;
 b=DkWpN0/6tZPBc0jjPgyfyn+4L7ChL8F5kIOyS/Fuv0A8auX7ELxDkLQYhomfFnRTqWql
 X6dGnvH/BJr20cyaYrvcEuO5hCHXvPYdg+p9SATmIV2XnD5W+fVUTLZXCZBQCp3I0aQ4
 DFBEPEe/W/IidhlCWOfq5chSLJPPBW7mZp6VRsJWS7qmqvPzsfY9tQ8vkL+isdB4FgYo
 +QgxzoE/+e7S7d11gveDlC3/0N28pXqAvSRkcr2VvzSyHG+4w+/ZRiUJxhGbZN2f/d4A
 zc0wLa8BgeoDr0SyDA9x4vkTB5bQordfWf+TD8jKB59znuVE9taqGBT1JnN2Dg6AsB3v VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xw13nuacu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Feb 2020 18:42:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7A1410002A;
        Tue,  4 Feb 2020 18:42:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA7F02CE58C;
        Tue,  4 Feb 2020 18:42:14 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 18:42:13 +0100
Subject: Re: [PATCH v2 1/2] remoteproc: Use u64 len for da_to_va
To:     =?UTF-8?Q?Cl=c3=a9ment_Leger?= <cleger@kalray.eu>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20200129163013.GA16538@xps15>
 <20200204143343.7011-1-cleger@kalray.eu>
 <81ef1572-1913-e9a8-5002-f7d565d6ac37@st.com>
 <108760116.2187488.1580836214364.JavaMail.zimbra@kalray.eu>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <0f7f1821-11b0-ffff-5a43-880800c62193@st.com>
Date:   Tue, 4 Feb 2020 18:42:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <108760116.2187488.1580836214364.JavaMail.zimbra@kalray.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-04_06:2020-02-04,2020-02-04 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/4/20 6:10 PM, Clément Leger wrote:
> Hi Arnaud,
> 
> My bad, I thought it was only V1.
> I will resend it as a V3 with a cover letter.
> 
> ----- On 4 Feb, 2020, at 17:27, Arnaud Pouliquen arnaud.pouliquen@st.com wrote:
> 
>> Hi Clément,
>>
>> Is it v2 or V3?
>> I also suggest you add a cover letter when you post more than one patch in a
>> thread.
>>
>> On 2/4/20 3:33 PM, Clement Leger wrote:
>>> With upcoming changes in elf loader for elf64 support, section size will
>>> be a u64. When used with da_to_va, this will potentially lead to
>>> overflow if using the current "int" type for len argument. Change
>>> da_to_va prototype to use a u64 for len and fix all users of this
>>> function.
>>>
>>> Signed-off-by: Clement Leger <cleger@kalray.eu>
>>> ---
>>> V2:
>>>  - Change len type from int to u64
>>>
>>>  drivers/remoteproc/imx_rproc.c           | 5 +++--
>>>  drivers/remoteproc/keystone_remoteproc.c | 2 +-
>>>  drivers/remoteproc/qcom_q6v5_adsp.c      | 2 +-
>>>  drivers/remoteproc/qcom_q6v5_mss.c       | 2 +-
>>>  drivers/remoteproc/qcom_q6v5_pas.c       | 2 +-
>>>  drivers/remoteproc/qcom_q6v5_wcss.c      | 2 +-
>>>  drivers/remoteproc/qcom_wcnss.c          | 2 +-
>>>  drivers/remoteproc/remoteproc_core.c     | 2 +-
>>>  drivers/remoteproc/remoteproc_internal.h | 2 +-
>>>  drivers/remoteproc/st_slim_rproc.c       | 2 +-
>>>  drivers/remoteproc/wkup_m3_rproc.c       | 2 +-
>>>  include/linux/remoteproc.h               | 2 +-
>>>  12 files changed, 14 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>>> index 3e72b6f38d4b..7ec79be5eb5d 100644
>>> --- a/drivers/remoteproc/imx_rproc.c
>>> +++ b/drivers/remoteproc/imx_rproc.c
>>> @@ -208,7 +208,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64
>>> da,
>>>  	return -ENOENT;
>>>  }
>>>  
>>> -static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> I wonder if you could use size_t instead?
> 
> I wondered too but size_t is a unsigned int on 32 bits system. So if they load
> a elf64 binary (which might be in 32bits zone), the segment size will be
> a u64 type.
If we consider that 32-bit processor can not address a memory space size higher than sizeof(size_t), this could be solved by adding a test and a cast.
> 
>> Does it make sense for 32-bit system to have a physical address space higher?
>> it's an open question I won't pretend to have the answer...:)
> 
> I agree that it does not make a lot of sense... But when we discussed it in
> OpenAMP WG, it was mentionned that this should be supported. 
My apologize, i don't remember the discussion around the size.
So if a requirement exists and size_t does not fit, let's use u64.
Nevertheless i'm interested to know the rational, if you remember...

Regards
Arnaud
> 
>>
>>
>>>  {
>>>  	struct imx_rproc *priv = rproc->priv;
>>>  	void *va = NULL;
>>> @@ -235,7 +235,8 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da,
>>> int len)
>> len type to update
> 
> I missed this one and I will double check all other callers
> 
> Thanks,
> 
> Clément. 
> 
>>
>> Regards,
>> Arnaud
>>>  		}
>>>  	}
>>>  
>>> -	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%x va = 0x%p\n", da, len, va);
>>> +	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%llx va = 0x%p\n", da, len,
>>> +		va);
>>>  
>>>  	return va;
>>>  }
>>> diff --git a/drivers/remoteproc/keystone_remoteproc.c
>>> b/drivers/remoteproc/keystone_remoteproc.c
>>> index 5c4658f00b3d..25c01df47eba 100644
>>> --- a/drivers/remoteproc/keystone_remoteproc.c
>>> +++ b/drivers/remoteproc/keystone_remoteproc.c
>>> @@ -246,7 +246,7 @@ static void keystone_rproc_kick(struct rproc *rproc, int
>>> vqid)
>>>   * can be used either by the remoteproc core for loading (when using kernel
>>>   * remoteproc loader), or by any rpmsg bus drivers.
>>>   */
>>> -static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct keystone_rproc *ksproc = rproc->priv;
>>>  	void __iomem *va = NULL;
>>> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
>>> b/drivers/remoteproc/qcom_q6v5_adsp.c
>>> index e953886b2eb7..7518e67a49e5 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
>>> @@ -270,7 +270,7 @@ static int adsp_stop(struct rproc *rproc)
>>>  	return ret;
>>>  }
>>>  
>>> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
>>>  	int offset;
>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
>>> b/drivers/remoteproc/qcom_q6v5_mss.c
>>> index 471128a2e723..248febde6fc1 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>> @@ -1148,7 +1148,7 @@ static int q6v5_stop(struct rproc *rproc)
>>>  	return 0;
>>>  }
>>>  
>>> -static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *q6v5_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct q6v5 *qproc = rproc->priv;
>>>  	int offset;
>>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
>>> b/drivers/remoteproc/qcom_q6v5_pas.c
>>> index db4b3c4bacd7..cf2cd609c90d 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>>> @@ -159,7 +159,7 @@ static int adsp_stop(struct rproc *rproc)
>>>  	return ret;
>>>  }
>>>  
>>> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
>>>  	int offset;
>>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c
>>> b/drivers/remoteproc/qcom_q6v5_wcss.c
>>> index f93e1e4a1cc0..3a6b82a16961 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
>>> @@ -406,7 +406,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>>>  	return 0;
>>>  }
>>>  
>>> -static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct q6v5_wcss *wcss = rproc->priv;
>>>  	int offset;
>>> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
>>> index dc135754bb9c..f893219e45a8 100644
>>> --- a/drivers/remoteproc/qcom_wcnss.c
>>> +++ b/drivers/remoteproc/qcom_wcnss.c
>>> @@ -287,7 +287,7 @@ static int wcnss_stop(struct rproc *rproc)
>>>  	return ret;
>>>  }
>>>  
>>> -static void *wcnss_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *wcnss_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
>>>  	int offset;
>>> diff --git a/drivers/remoteproc/remoteproc_core.c
>>> b/drivers/remoteproc/remoteproc_core.c
>>> index 307df98347ba..9e6d3c6a60ee 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -185,7 +185,7 @@ EXPORT_SYMBOL(rproc_va_to_pa);
>>>   * here the output of the DMA API for the carveouts, which should be more
>>>   * correct.
>>>   */
>>> -void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +void *rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct rproc_mem_entry *carveout;
>>>  	void *ptr = NULL;
>>> diff --git a/drivers/remoteproc/remoteproc_internal.h
>>> b/drivers/remoteproc/remoteproc_internal.h
>>> index 493ef9262411..004867061721 100644
>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>> @@ -50,7 +50,7 @@ void rproc_exit_sysfs(void);
>>>  void rproc_free_vring(struct rproc_vring *rvring);
>>>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>>>  
>>> -void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
>>> +void *rproc_da_to_va(struct rproc *rproc, u64 da, u64 len);
>>>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
>>>  int rproc_trigger_recovery(struct rproc *rproc);
>>>  
>>> diff --git a/drivers/remoteproc/st_slim_rproc.c
>>> b/drivers/remoteproc/st_slim_rproc.c
>>> index 04492fead3c8..2fd14afb3157 100644
>>> --- a/drivers/remoteproc/st_slim_rproc.c
>>> +++ b/drivers/remoteproc/st_slim_rproc.c
>>> @@ -174,7 +174,7 @@ static int slim_rproc_stop(struct rproc *rproc)
>>>  	return 0;
>>>  }
>>>  
>>> -static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct st_slim_rproc *slim_rproc = rproc->priv;
>>>  	void *va = NULL;
>>> diff --git a/drivers/remoteproc/wkup_m3_rproc.c
>>> b/drivers/remoteproc/wkup_m3_rproc.c
>>> index 3984e585c847..0e8082948489 100644
>>> --- a/drivers/remoteproc/wkup_m3_rproc.c
>>> +++ b/drivers/remoteproc/wkup_m3_rproc.c
>>> @@ -80,7 +80,7 @@ static int wkup_m3_rproc_stop(struct rproc *rproc)
>>>  	return 0;
>>>  }
>>>  
>>> -static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct wkup_m3_rproc *wkupm3 = rproc->priv;
>>>  	void *va = NULL;
>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>> index 16ad66683ad0..f84bd5fe0211 100644
>>> --- a/include/linux/remoteproc.h
>>> +++ b/include/linux/remoteproc.h
>>> @@ -374,7 +374,7 @@ struct rproc_ops {
>>>  	int (*start)(struct rproc *rproc);
>>>  	int (*stop)(struct rproc *rproc);
>>>  	void (*kick)(struct rproc *rproc, int vqid);
>>> -	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
>>> +	void * (*da_to_va)(struct rproc *rproc, u64 da, u64 len);
>>>  	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
>>>  	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
>>>  			  int offset, int avail);
