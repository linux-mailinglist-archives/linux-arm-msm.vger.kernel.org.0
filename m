Return-Path: <linux-arm-msm+bounces-44556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF094A07588
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C588D162CBE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 12:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D1E216E00;
	Thu,  9 Jan 2025 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XeZpnDQd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E3920551B;
	Thu,  9 Jan 2025 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736425154; cv=none; b=BMsUlnzX7BrXIoJw3UxHhbiAfWnfP0tj7c/i5J2ekFZ0IUyYyPRalDphgbON3dO6bj+zqSbUEdNfESLcJHHhn1dn02oMTNnBRCP0zarvNJygAnGZtPy1XRpuM9yIAhhUJdFM81uO8S4v7T85B/mRoCAKZAHDUG1RftYcgyaGp3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736425154; c=relaxed/simple;
	bh=EUY654x2cDTrH1RHlzK+E4c6IxvYuYHrpiJzsQitgbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Oa5osCGhpwdSYrbq1ofhN7KCQqhh/hfAIPoLwMw29CTDRhsKbRGqURGWyosFcYvwLvLIkcNrAEyx1iLplCedvw44AoSGm/YKciLL7rGaijosexEa6wFatYIK96xdEcJaCVbQjyLmhyecN5uaB5Egij0Hq5p9U8CeG/dv2RhZ7wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XeZpnDQd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5095m58R026906;
	Thu, 9 Jan 2025 12:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEW7ghGXDsyW8phZBrMfvOlK2y0uEc7vn1rniCNtFDo=; b=XeZpnDQdj+Y25rMs
	SEazrG1AlewdCvk9VPi0yLYD6iO0N1FSSFaYvWsRSfEruX0I7MD3GQ+hjSgJPkDf
	O0RlTELOKWLHnJRWQ8YxfY+rQYlMhX8iYZEwcO4UkGu8FQZ0NNSg7XThxvtZLEe4
	rio+cGj33wQnsY+UoSmvLo8oHO4Bd3iMKsZlaV/2i4BVukcRueMk5PohGB9RJKQF
	tUUpfXUELvsSZ/EqLiAmK7Ixiy77wIjv5uSYiU0IOq1yK6FEf1p09zr+GxvGepnN
	Be3Ci7wj121r2CcVppFS/qljNt7iVXE4DToZ4KE7rZ/4YObZt90JuPPgs5dEnp9V
	fqilFw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4428mf8w6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 12:19:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509CJ5IH025135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 12:19:05 GMT
Received: from [10.152.201.37] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 04:18:54 -0800
Message-ID: <a169904a-1a1c-4bfb-9000-15a504f17522@quicinc.com>
Date: Thu, 9 Jan 2025 17:48:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/8] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Bjorn Andersson <andersson@kernel.org>
CC: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>,
        "konradybcio@kernel.org"
	<konradybcio@kernel.org>,
        "Manikanta Mylavarapu (QUIC)"
	<quic_mmanikan@quicinc.com>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>,
        "dmitry.baryshkov@linaro.org"
	<dmitry.baryshkov@linaro.org>,
        "Vignesh Viswanathan (QUIC)"
	<quic_viswanat@quicinc.com>,
        "Sricharan Ramabadhran (QUIC)"
	<quic_srichara@quicinc.com>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-5-quic_gokulsri@quicinc.com>
 <ligcw5ndzuu4kgegxb6f3ttzpmw6iglyzq5kt4l45xyeemsfsr@f2735qq7frhk>
Content-Language: en-US
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
In-Reply-To: <ligcw5ndzuu4kgegxb6f3ttzpmw6iglyzq5kt4l45xyeemsfsr@f2735qq7frhk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: maXleLA_eexYbeCUzQTkiyFEuCG_03qQ
X-Proofpoint-ORIG-GUID: maXleLA_eexYbeCUzQTkiyFEuCG_03qQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501090097

On 1/8/2025 9:39 AM, Bjorn Andersson wrote:
> On Tue, Jan 07, 2025 at 03:46:43PM +0530, Gokul Sriram Palanisamy wrote:
>> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>
>> Add support to bring up hexagon based WCSS secure PIL remoteproc.
>> IPQ5332, IPQ9574 supports secure PIL remoteproc.
> 
> I'd love for this to be extended with a short description of what the
> WCSS secure subsystem is, the reason for a new drivers etc. Following
> the style of
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 

Sure. Bjorn. Will add it here.

>>
>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>> ---
>>  drivers/remoteproc/Kconfig              |  22 ++
>>  drivers/remoteproc/Makefile             |   1 +
>>  drivers/remoteproc/qcom_q6v5_wcss_sec.c | 406 ++++++++++++++++++++++++
>>  3 files changed, 429 insertions(+)
>>  create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index 83962a114dc9..c4e94b15c538 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -255,6 +255,28 @@ config QCOM_Q6V5_WCSS
>>  	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
>>  	  a non-TrustZone wireless subsystem.
>>  
>> +config QCOM_Q6V5_WCSS_SEC
>> +	tristate "Qualcomm Hexagon based WCSS Secure Peripheral Image Loader"
>> +	depends on OF && ARCH_QCOM
>> +	depends on QCOM_SMEM
>> +	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
>> +	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>> +	depends on QCOM_SYSMON || QCOM_SYSMON=n
>> +	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
>> +	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
> 
> Please review these depends, did you inherit a few too many?

sure. Will address.

> 
>> +	select QCOM_MDT_LOADER
>> +	select QCOM_PIL_INFO
>> +	select QCOM_Q6V5_COMMON
>> +	select QCOM_RPROC_COMMON
>> +	select QCOM_SCM
>> +	help
>> +	  Say y here to support the Qualcomm Secure Peripheral Image Loader
>> +	  for the Hexagon based remote processors on e.g. IPQ5332.
>> +
>> +	  This is TrustZone wireless subsystem. The firmware is
>> +	  verified and booted with the help of the Peripheral Authentication
>> +	  System (PAS) in TrustZone.
>> +
>>  config QCOM_SYSMON
>>  	tristate "Qualcomm sysmon driver"
>>  	depends on RPMSG
>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>> index 5ff4e2fee4ab..d4971b672812 100644
>> --- a/drivers/remoteproc/Makefile
>> +++ b/drivers/remoteproc/Makefile
>> @@ -28,6 +28,7 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
>>  obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
>>  obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
>>  obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
>> +obj-$(CONFIG_QCOM_Q6V5_WCSS_SEC)	+= qcom_q6v5_wcss_sec.o
>>  obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
>>  obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
>>  qcom_wcnss_pil-y			+= qcom_wcnss.o
>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
>> new file mode 100644
>> index 000000000000..ef4e893e37c7
>> --- /dev/null
>> +++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
>> @@ -0,0 +1,406 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2016-2018 Linaro Ltd.
>> + * Copyright (C) 2014 Sony Mobile Communications AB
>> + * Copyright (c) 2012-2018 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
> 
> Please check that all these includes are required.
> 

sure. will address.

>> +#include <linux/firmware/qcom/qcom_scm.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_reserved_mem.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset.h>
>> +#include <linux/soc/qcom/mdt_loader.h>
>> +#include <linux/soc/qcom/smem.h>
>> +#include <linux/soc/qcom/smem_state.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/mailbox/tmelcom-qmp.h>
> 
> This will require mailbox maintainer to first accept the tmelcom mailbox
> driver, and share a immutable branch with me (or we have to wait until
> this include file trickles in).
> 
> Please ensure that mailbox maintainer is aware of this request.
> 

understood.

>> +#include "qcom_common.h"
>> +#include "qcom_q6v5.h"
>> +

sure.

>> +#include "qcom_pil_info.h"
>> +#include "remoteproc_internal.h"
>> +
>> +#define WCSS_CRASH_REASON		421
>> +
>> +#define WCSS_PAS_ID			0x6
>> +#define MPD_WCSS_PAS_ID			0xD
> 
> I like lowercase hex digits.
> 
>> +
>> +struct wcss_sec {
>> +	struct device *dev;
>> +	struct qcom_rproc_glink glink_subdev;
>> +	struct qcom_rproc_ssr ssr_subdev;
>> +	struct qcom_q6v5 q6;
>> +	phys_addr_t mem_phys;
>> +	phys_addr_t mem_reloc;
>> +	void *mem_region;
>> +	size_t mem_size;
>> +	const struct wcss_data *desc;
> 
> Assigned but never used.
> 
>> +	const char *fw_name;
> 
> Assigned but never used.
> 
>> +
>> +	struct clk *sleep_clk;
> 
> Assigned but never used.
> 

will remove. Thanks

>> +
>> +	struct mbox_client mbox_client;
>> +	struct mbox_chan *mbox_chan;
>> +	void *metadata;
>> +	size_t metadata_len;
>> +};
>> +
>> +struct wcss_data {
>> +	u32 pasid;
>> +	const struct rproc_ops *ops;
>> +	bool auto_boot;
>> +	bool tmelcom;
>> +};
>> +
>> +static int wcss_sec_start(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	const struct wcss_data *desc = of_device_get_match_data(dev);
> 
> Please avoid "parsing" DT in runtime.

I didn't underatand this.

> 
>> +	struct tmel_sec_auth tsa;
>> +	struct tmel_qmp_msg tqm;
>> +	int ret;
>> +
>> +	qcom_q6v5_prepare(&wcss->q6);
> 
> It would be sensible to check the return value here.
> 

sure. Will address.

>> +
>> +	tsa.data = wcss->metadata;
> 
> This looks broken.
> 
> wcss->metadata is assigned in wcss_sec_load() only if tmelcom, and in
> that code path wcss_sec_load() invokes kfree() on the pointer.
> 
> So, as far as I can tell, you're either going to pass NULL here or a
> pointer to a freed (and perhaps overwritten) buffer.
> 

got it. will fix.

>> +	tsa.size = wcss->metadata_len;
>> +	tsa.pas_id = desc->pasid;
>> +	tqm.msg = &tsa;
>> +	tqm.msg_id = TMEL_MSG_UID_SECBOOT_SEC_AUTH;
>> +
>> +	if (desc->tmelcom) {
> 
> As I point out below, mbox_chan should probably only be assigned when
> desc->tmelcom == true, so you wouldn't even need any additional state,
> just check if mbox_chan is valid here.
> 
>> +		mbox_send_message(wcss->mbox_chan, (void *)&tqm);
> 
> This does return errors as well, perhaps worth checking that as well?
> 
>> +	} else {
>> +		ret = qcom_scm_pas_auth_and_reset(desc->pasid);
> 
> Please confirm that you're not required to keep the metadata buffer
> passed to PAS init_image during qcom_mdt_load() alive until this point -
> as is required by all modern SDMs.
> 

will address.

>> +		if (ret) {
>> +			dev_err(dev, "wcss_reset failed\n");
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	ret = qcom_q6v5_wait_for_start(&wcss->q6, 5 * HZ);
>> +	if (ret == -ETIMEDOUT)
>> +		dev_err(dev, "start timed out\n");
> 
> Don't you need to qcom_scm_pas_shutdown() here to have QHEEBSP release
> the memory back to you?
> 

yes. Will need. Will fix.

>> +
>> +	return ret;
>> +}
>> +
>> +static int wcss_sec_stop(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	const struct wcss_data *desc = of_device_get_match_data(dev);
>> +	struct tmel_sec_auth tsa;
>> +	struct tmel_qmp_msg tqm;
>> +	int ret;
>> +
>> +	tsa.pas_id = desc->pasid;
> 
> tsa is passing a couple of random values over your mbox. Please
> zero-initialize these.
> 
> Why is this filled in outside desc->tmelcom, when that's the only place
> it's used?
> 

will address.

>> +	tqm.msg = &tsa;
>> +	tqm.msg_id = TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN;
>> +
>> +	if (desc->tmelcom) {
>> +		mbox_send_message(wcss->mbox_chan, (void *)&tqm);
>> +	} else {
>> +		ret = qcom_scm_pas_shutdown(desc->pasid);
>> +		if (ret) {
>> +			dev_err(dev, "not able to shutdown\n");
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	qcom_q6v5_unprepare(&wcss->q6);
>> +
>> +	return 0;
>> +}
>> +
>> +static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
>> +			       bool *is_iomem)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	int offset;
>> +
>> +	offset = da - wcss->mem_reloc;
>> +	if (offset < 0 || offset + len > wcss->mem_size)
>> +		return NULL;
>> +
>> +	return wcss->mem_region + offset;
>> +}
>> +
>> +static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	const struct wcss_data *desc = of_device_get_match_data(dev);
>> +	int ret;
>> +
>> +	if (desc->tmelcom) {
>> +		wcss->metadata = qcom_mdt_read_metadata(fw, &wcss->metadata_len,
>> +							rproc->firmware, wcss->dev);
>> +		if (IS_ERR(wcss->metadata)) {
>> +			ret = PTR_ERR(wcss->metadata);
>> +			dev_err(wcss->dev, "error %d reading firmware %s metadata\n",
>> +				ret, rproc->firmware);
>> +			return ret;
>> +		}
>> +
>> +		ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware, desc->pasid,
>> +					    wcss->mem_region, wcss->mem_phys, wcss->mem_size,
>> +					    &wcss->mem_reloc);
>> +		kfree(wcss->metadata);
>> +	} else {
>> +		ret = qcom_mdt_load(dev, fw, rproc->firmware, desc->pasid, wcss->mem_region,
>> +				    wcss->mem_phys, wcss->mem_size, &wcss->mem_reloc);
>> +	}
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	qcom_pil_info_store("wcss", wcss->mem_phys, wcss->mem_size);
>> +
>> +	return ret;
> 
> ret can't be anything but 0 here, so better just write that.
> 

right. Will fix.

>> +}
>> +
>> +static unsigned long wcss_sec_panic(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +
>> +	return qcom_q6v5_panic(&wcss->q6);
>> +}
>> +
>> +static void wcss_sec_copy_segment(struct rproc *rproc,
>> +				  struct rproc_dump_segment *segment,
>> +				  void *dest, size_t offset, size_t size)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	void *ptr;
>> +
>> +	ptr = ioremap_wc(segment->da, segment->size);
>> +	if (!ptr) {
>> +		dev_err(dev, "Failed to ioremap segment %pad size %zx\n",
> 
> Make that %#zx to ensure that the base 16 size is prefixed with 0x
> 

will do.

>> +			&segment->da, segment->size);
>> +		return;
>> +	}
>> +
>> +	if (size <= segment->size - offset)
> 
> I'd prefer if the expression in the check and access are on the same
> form. I.e. test offset + size vs segement->size

oh, sure. got it.

> 
>> +		memcpy(dest, ptr + offset, size);
>> +	else
>> +		dev_err(dev, "Copy size greater than segment size. Skipping\n");
>> +	iounmap(ptr);
>> +}
>> +
>> +static int wcss_sec_dump_segments(struct rproc *rproc,
>> +				  const struct firmware *fw)
>> +{
>> +	struct device *dev = rproc->dev.parent;
>> +	struct reserved_mem *rmem = NULL;
>> +	struct device_node *node;
>> +	int num_segs, index = 0;
>> +	int ret;
>> +
>> +	/* Parse through additional reserved memory regions for the rproc
> 
> Leave first line in multiline comment blank, as the docs says.
> 

Got it.

>> +	 * and add them to the coredump segments
>> +	 */
>> +	num_segs = of_count_phandle_with_args(dev->of_node,
>> +					      "memory-region", NULL);
>> +	while (index < num_segs) {
> 
> You're zero-initializing index above, checking index here and explicitly
> increment it at the bottom of the loop. Why isn't this written as a for
> loop?

Right. for loop looks appropriate. Will fix.

> 
>> +		node = of_parse_phandle(dev->of_node,
>> +					"memory-region", index);
>> +		if (!node)
>> +			return -EINVAL;
>> +
>> +		rmem = of_reserved_mem_lookup(node);
>> +		of_node_put(node);
>> +		if (!rmem) {
>> +			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
>> +				index, num_segs);
>> +			return -EINVAL;
>> +		}
>> +
>> +		dev_dbg(dev, "Adding segment 0x%pa size 0x%pa",
>> +			&rmem->base, &rmem->size);
>> +		ret = rproc_coredump_add_custom_segment(rproc,
>> +							rmem->base,
>> +							rmem->size,
>> +							wcss_sec_copy_segment,
>> +							NULL);
>> +		if (ret)
>> +			return ret;
>> +
>> +		index++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct rproc_ops wcss_sec_ops = {
>> +	.start = wcss_sec_start,
>> +	.stop = wcss_sec_stop,
>> +	.da_to_va = wcss_sec_da_to_va,
>> +	.load = wcss_sec_load,
>> +	.get_boot_addr = rproc_elf_get_boot_addr,
>> +	.panic = wcss_sec_panic,
>> +	.parse_fw = wcss_sec_dump_segments,
>> +};
>> +
>> +static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
>> +{
>> +	struct reserved_mem *rmem = NULL;
>> +	struct device_node *node;
>> +	struct device *dev = wcss->dev;
>> +
>> +	node = of_parse_phandle(dev->of_node, "memory-region", 0);
>> +	if (!node) {
>> +		dev_err(dev, "can't find phandle memory-region\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	rmem = of_reserved_mem_lookup(node);
>> +	of_node_put(node);
>> +
>> +	if (!rmem) {
>> +		dev_err(dev, "unable to acquire memory-region\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	wcss->mem_phys = rmem->base;
>> +	wcss->mem_reloc = rmem->base;
>> +	wcss->mem_size = rmem->size;
>> +	wcss->mem_region = devm_ioremap_wc(dev, wcss->mem_phys, wcss->mem_size);
>> +	if (!wcss->mem_region) {
>> +		dev_err(dev, "unable to map memory region: %pa+%pa\n",
>> +			&rmem->base, &rmem->size);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int wcss_sec_probe(struct platform_device *pdev)
>> +{
>> +	struct wcss_sec *wcss;
>> +	struct rproc *rproc;
>> +	const char *fw_name = NULL;
>> +	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
>> +	int ret;
>> +
>> +	if (!desc)
>> +		return -EINVAL;
> 
> It shouldn't be possible to get here with desc == NULL, so let the
> person have an oops with a callstack to aid debugging. (I.e. remove the
> check)
> 

ok, will do.

>> +
>> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
>> +				      &fw_name);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, desc->ops, fw_name,
>> +				 sizeof(*wcss));
> 
> Not sure how your system composition looks like, but please consider
> something like b64b1266d619 ("remoteproc: qcom: pas: Make remoteproc
> name human friendly"), to avoid the human-unfriendly pdev->name. (Only
> if possible)
> 

sure. will check.

>> +	if (!rproc) {
>> +		dev_err(&pdev->dev, "failed to allocate rproc\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	wcss = rproc->priv;
>> +	wcss->dev = &pdev->dev;
>> +	wcss->desc = desc;
>> +	wcss->fw_name = fw_name;
>> +
>> +	ret = wcss_sec_alloc_memory_region(wcss);
>> +	if (ret)
>> +		return ret;
>> +
>> +	wcss->sleep_clk = devm_clk_get_optional_enabled(&pdev->dev, "sleep");
>> +	if (IS_ERR(wcss->sleep_clk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(wcss->sleep_clk),
>> +				     "Failed to get sleep clock\n");
>> +
>> +	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
>> +			     WCSS_CRASH_REASON, NULL, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, "q6wcss");
>> +	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, pdev->name);
>> +
>> +	rproc->auto_boot = desc->auto_boot;
>> +	rproc->dump_conf = RPROC_COREDUMP_INLINE;
>> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>> +
>> +	ret = devm_rproc_add(&pdev->dev, rproc);
> 
> In the event of auto_boot, I believe it should be possible to enter
> wcss_sec_load() et al from this point onwards. So, it seems reasonable
> to acquire mbox_chan prior to registering the remoteproc.
> 

ok. sure. will move mbox request channel to the beginning  of probe.

>> +	if (ret)
>> +		return ret;
>> +
>> +	platform_set_drvdata(pdev, rproc);
>> +
>> +	wcss->mbox_client.dev = wcss->dev;
>> +	wcss->mbox_client.knows_txdone = true;
>> +	wcss->mbox_client.tx_block = true;
>> +	wcss->mbox_chan = mbox_request_channel(&wcss->mbox_client, 0);
> 
> "mboxes" is optional in binding, but seems to be required here, but then
> mbox_chan is only accessed when tmelcom is true.
> 
> Should mbox_request_channel() be made conditional on tmelcom?

Yeah, infact, as you suggested in the beginning, will make tmelcom
based on mbox chan availability. So that way, if mbox chan registered,
then client uses mbox_send else scm_send. So will remove the below
return on error for mbox_chan since its optional.

> 
>> +	if (IS_ERR(wcss->mbox_chan)) {
>> +		dev_err(wcss->dev, "mbox chan for IPC is missing\n");
>> +		return PTR_ERR(wcss->mbox_chan);
>> +	}
>> +
>> +	return 0;
> 
> qcom_q6v5_pas.c was recently updated to clean up various things on
> error, please do the same here.
> 
ok, will do.

>> +}
>> +
>> +static void wcss_sec_remove(struct platform_device *pdev)
>> +{
>> +	struct rproc *rproc = platform_get_drvdata(pdev);
>> +	struct wcss_sec *wcss = rproc->priv;
>> +
>> +	qcom_q6v5_deinit(&wcss->q6);
>> +	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
>> +	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
> 
> mbox_chan?
> 
yes, will add.

>> +}
>> +
>> +static const struct wcss_data wcss_sec_ipq5332_res_init = {
>> +	.pasid = MPD_WCSS_PAS_ID,
>> +	.auto_boot = true,
>> +	.ops = &wcss_sec_ops,
> 
> Please avoid unnecessary flexibility (i.e. ops is always wcss_sec_ops).
> 
>> +	.tmelcom = false,
>> +};
>> +
>> +static const struct wcss_data wcss_sec_ipq9574_res_init = {
>> +	.pasid = WCSS_PAS_ID,
>> +	.auto_boot = true,
>> +	.ops = &wcss_sec_ops,
>> +	.tmelcom = false,
>> +};
>> +
>> +static const struct wcss_data wcss_sec_ipq5424_res_init = {
>> +	.pasid = MPD_WCSS_PAS_ID,
>> +	.auto_boot = true,
>> +	.ops = &wcss_sec_ops,
>> +	.tmelcom = true,
>> +};
>> +
>> +static const struct of_device_id wcss_sec_of_match[] = {
>> +	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
>> +	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
>> +	{ .compatible = "qcom,ipq5424-wcss-sec-pil", .data = &wcss_sec_ipq5424_res_init },
> 
> Please sort alphabetically.
> 
ok, will do.

Thanks,
Gokul

>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, wcss_sec_of_match);
>> +
> 
> Regards,
> Bjorn
> 
>> +static struct platform_driver wcss_sec_driver = {
>> +	.probe = wcss_sec_probe,
>> +	.remove = wcss_sec_remove,
>> +	.driver = {
>> +		.name = "qcom-wcss-secure-pil",
>> +		.of_match_table = wcss_sec_of_match,
>> +	},
>> +};
>> +module_platform_driver(wcss_sec_driver);
>> +
>> +MODULE_DESCRIPTION("Hexagon WCSS Secure Peripheral Image Loader");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.34.1
>>


