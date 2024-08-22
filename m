Return-Path: <linux-arm-msm+bounces-29256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D244095B115
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 11:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F3001F2291F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 09:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CBC16F271;
	Thu, 22 Aug 2024 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="juLGC5q8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C15157467;
	Thu, 22 Aug 2024 09:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724317311; cv=none; b=mjTUFlL1kz39CBWhVBMOHEWRyldc6nr6VzMpU4uSwh5pCxwKhIyRaf0a6nK4redLHeWz/9VeaVrzFe0s+bxCBCkEn9MiLfvP53xjXWVj9UngqNFw4Gtixvqr/YCkkKDmCRqnwfBasGIUmOcuhCK9sUVPqzyrm6zP87TzCnkw/gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724317311; c=relaxed/simple;
	bh=EB5XLDiY+WJ5p4OL9UgSPS1vRM/EIxd3jTHfKz8SejI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TvJUIifkU5HckCqqzP4W+ADhVAjlqP3HWZUTcq+G9vu2FC9G4flAO5cAlCGK6L9Kv1RlmmzFX3SPdwS+MKqqBaU0oaXZ1o5mtDN5B935/hIGLsbRLlWBniq9/L7hWr/i75SMazC+egnU51GbdVwzQvMO4LdWwEg33vgKPvr84N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=juLGC5q8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M12PZM001986;
	Thu, 22 Aug 2024 09:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ATTq5zni+CfcXZ/YPJd6N7qjhxRv0fqB5rv69GUFdA=; b=juLGC5q8X1gDyHt8
	tQRdrqL/UzZHXCFMDDRuPSxx+dJOrY5WzOBlKmrEM3vCVsjL/Jhfw9/1WIj4KuDn
	JCl2n8o1jPCnXOJHDnoyK/E4r+lzeeFV1vov4yk/sK3WajYQqyciybfVBE7UL/8B
	uYbaa20E829jCFg5L7l8KFS9qXEJFSsD+UBr84IX3vKhWxTG6WfM/6NGM9R+h2XN
	0V2x3di9wqmIZwTI93G2V3lnmtTHGjgCLg68kLhv+TOFAiLJQpBXPgKxGoANRf0Q
	/+cDyy6sFCAFRXHdJvfgwU9YeuY4R0mlPni5xm5sZh4h7NLPWkb4dSpmWXR5bzja
	ySNLeQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415nrrst38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 09:01:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47M91k3S024960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 09:01:46 GMT
Received: from [10.151.37.150] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 Aug
 2024 02:01:43 -0700
Message-ID: <c7f24af9-c43f-4d8b-b5c1-e34c34de4d44@quicinc.com>
Date: Thu, 22 Aug 2024 14:31:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: add hexagon based WCSS secure PIL
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
References: <20240820085517.435566-1-quic_gokulsri@quicinc.com>
 <20240820085517.435566-3-quic_gokulsri@quicinc.com>
 <4y37wrg7gi3unpqw5ukgd6jrwuqmuofcabhmtwzlgfpgtiighw@74abrhmpzktv>
Content-Language: en-US
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
In-Reply-To: <4y37wrg7gi3unpqw5ukgd6jrwuqmuofcabhmtwzlgfpgtiighw@74abrhmpzktv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: E0asXlR0VLCkFlI5PpTv0B-_ZqjC5W5R
X-Proofpoint-GUID: E0asXlR0VLCkFlI5PpTv0B-_ZqjC5W5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=744 mlxscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408220066


On 8/20/2024 4:55 PM, Krzysztof Kozlowski wrote:
> On Tue, Aug 20, 2024 at 02:25:15PM +0530, Gokul Sriram Palanisamy wrote:
>> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>
>> Add support to bring up hexagon based WCSS secure PIL remoteproc.
>> IPQ5332, IPQ9574 supports secure PIL remoteproc.
>>
>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
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
>> +	 * and add them to the coredump segments
>> +	 */
>> +	num_segs = of_count_phandle_with_args(dev->of_node,
>> +					      "memory-region", NULL);
>> +	while (index < num_segs) {
>> +		node = of_parse_phandle(dev->of_node,
>> +					"memory-region", index);
>> +		if (!node)
>> +			return -EINVAL;
>> +
>> +		rmem = of_reserved_mem_lookup(node);
>> +		if (!rmem) {
>> +			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
>> +				index, num_segs);
> Leaking refcnt.
Got it. Will update. Thank you.
>> +			return -EINVAL;
>> +		}
>> +
>> +		of_node_put(node);
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
>> +	if (node) {
>> +		rmem = of_reserved_mem_lookup(node);
>> +	} else {
> No, that's over complicated.
>
> Just if (!node) { error handling }.
Ok. Will update.
>> +		dev_err(dev, "can't find phandle memory-region\n");
>> +		return -EINVAL;
>> +	}
>> +
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
> ...
>
>> +static int wcss_sec_ipq5332_init_clk(struct wcss_sec *wcss)
>> +{
>> +	int ret;
>> +	struct device *dev = wcss->dev;
>> +
>> +	wcss->im_sleep = devm_clk_get(wcss->dev, "im_sleep");
>> +	if (IS_ERR(wcss->im_sleep)) {
>> +		ret = PTR_ERR(wcss->im_sleep);
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(dev, "failed to get im_sleep clock");
> Syntax is return dev_err_probe.
Thanks. Will update.
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_prepare_enable(wcss->im_sleep);
>> +	if (ret) {
>> +		dev_err(dev, "could not enable im_sleep clk\n");
>> +		return ret;
> Just use devm_clk_get_enabled.
Will update.
>> +	}
>> +
>> +	return 0;
> Best regards,
> Krzysztof
>

