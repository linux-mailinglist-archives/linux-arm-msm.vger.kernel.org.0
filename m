Return-Path: <linux-arm-msm+bounces-86765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A96CCE5A5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 02:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B16EB30051AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 01:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C55A1EDA0F;
	Mon, 29 Dec 2025 01:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1g1UZ94";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9P3we3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0701F872D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 01:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766970626; cv=none; b=NPvFIWL+Ngn2yfK59uTKNOSwclG7Zbq+J/DHmzbwq8UeLSWh+nJQBiVB45XQiDjXghIkqGwFl6U38i6UuxwVxPFtPO9RNA/tP26dQwaTuU6bgJb+Pr0EPrhfWkUj/y5awb6xnQNAQLIYzNpBr2EcQyEuGFLESNzlqJ/wy2JS8yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766970626; c=relaxed/simple;
	bh=FkNTeMsZxwSqLYc8Os8ox9tzPA0beZCfcDoXTNwo/rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGJCMLKgQz8c3zbIsDkApmtVq4VtsHrc2gcIbPMmccn2nVDbXHGsxP9dTJZNv1G+n2dTt4tIg22mdARd0nrN85Lboe3vmDAj/48aR6fi3R3depOnch46VKtvnc1zRGBiozPXaOCdOG5cAdFrtjDGa7+Jgdh4VCZ5s15Vv5R/vzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1g1UZ94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9P3we3E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMvTwD240688
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 01:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJ4BWOfev0AxvWtR+KH2UmHGgImxfHsSAZSTOYN05QI=; b=a1g1UZ94UWEI3AW0
	8TGiINT+51HQ3qkfwq8oCbblk28z9UNwEYGXaG0J12KLkrkxLMwiFE1KfKief5gg
	ttApHW3k04k3CxVZNfWk9c1Jp/a0f8e7e6fhQoIMKmW5CMxSfd2SOAcv39+ZdDC0
	wd5NykAL9582sKb1kCSbdOlelSTxF5X22Iuod9AnPD0ym6HDYS/1LBfmVUHIRrh3
	JoL7Ol1hWfntpwVXYpkFpXKknDFOjtdvJ0NoN9tOVQEOycVEOuf+E5HvYz+RvaaW
	0F0/dZ1EDh8IaLGaom7Kg3mNNrjktkRreRYFe/tjq3yzr0mEFRK1d56LO2JYCzkH
	tnhvyQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v07s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 01:10:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7c240728e2aso18912661b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766970622; x=1767575422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJ4BWOfev0AxvWtR+KH2UmHGgImxfHsSAZSTOYN05QI=;
        b=F9P3we3ErTxRMRTdtMgXAmy4regrkMEJb9lfBna1QtAQ5jJ6Um7sYNdMKQuYjUMD2V
         eBCbypkjUcLy7hDXJfm4PqHEZ8eF1rwpOYfZdP694OKvIHe88U1KyWqy7PUk9BD5JdPt
         u+vcDSPmWOAvVCd21P8N/vNgJXwNFjTime+D7JKBUoqgQQVIhZpsc9+1kLbbYYTL6WAP
         xsoCHW1KxZxL82jvStm9+j3zvCl6tILiSajzZ3svTiK/bgs6u3eHazpw33hZ95Qvvsip
         2o6ZVMKga69pNyGcMDXHQfwk1aYZPgh2mIS7a7GW76KhUa/c+ydkZ9vr4u9/JpOrGvJ0
         /LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766970622; x=1767575422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJ4BWOfev0AxvWtR+KH2UmHGgImxfHsSAZSTOYN05QI=;
        b=rIFuob0YLFkWAR38OAtqFq1YHtLDfLV6NwEyc52W3/TGqPX7ilxsYbHsAWzqFl7VEJ
         LQuL1WfmvGyevAx3FJQIcrzSjw73lODng2PkXVKFmKGPBszHPv5PzPjw92AMSsuASGBe
         duNa4LfdkmsKeUcOjCOJgk7RW4UVdB2YuWDMbNKB50yYXEyR1MZKc/yXGu6Q8qerHpSs
         BoGIrP9LelUPUrVD9lc2rAhhOfmf8d3bhpoju+tZan87BQo5sMESYKl1nKVw0KmtKrn/
         48pw/EXZkPlCzDKNhMkVwQRZTdSd0kTYdgcB7UrnK/61iNj/mL4hHR+LsngP4jQYnh8i
         jbIA==
X-Forwarded-Encrypted: i=1; AJvYcCV6UMiQ2FwpRr2G/cKO9FJmsE01hpBuH1RsTllBtUCyTR7xRdfEki0dRZ3pn4vXXGWOtQ/LSI23dUWPRCJE@vger.kernel.org
X-Gm-Message-State: AOJu0YyNg8q9ej8DT8QCUEGw+Ut8hW9wv2IXotN4yz+TPKKGPtPuFKGN
	CnjsY0DqYFkfM7AnWp7OHYrDnPg/xeMdWM7CKhV2ZMKioVg4PuC2vcP0AaA1DlrKi2za8KKR8cb
	miF8Kijf8yStYQHvwUU+rwVT+e8mzaSnAXn7tHKbzl07xySdjJwEYmxk4nFPRUKyKi4SS
X-Gm-Gg: AY/fxX4w9lWGgN7HyvCFKtyzC28BJ6tVolh8I3i2RR1awV/xt5PvohfTtB1rzQV9yal
	N1ZltjDoNGNTiEWtLdRkUOPtzosDdYekpnsvp/b7R5D8Emimu3RU4+5dahUMM7TAsMQbs5CPggM
	IPGkDtI1TakJLZrM+t9RILZiq6oMP+zRfy6g9/yBZANIgUSOsR0BdAbnerggbv70qnVzCdOxRs2
	lC26NrnIuaBNz9va3VzOXQpz+neirXRs2BkvrtDYJakjs4oWMsTqbUjycm1E9zeo1Im86eCTMNq
	h3MpL3ecEKwn6P93RbqQLy3fVJLOQQ/4beHDoZosA5TfKP8p4vozv/QYmLnG2RJXEcAXW2sio0N
	VMy5rkFZJ8V1TYTy1hcq3cWLaGNyPYaPln2rPFUdQF0TNlNokkC6e1V/eLLm7Kw==
X-Received: by 2002:a05:6a20:9149:b0:35d:2984:e5fd with SMTP id adf61e73a8af0-376a8eb2ab9mr22015710637.32.1766970621489;
        Sun, 28 Dec 2025 17:10:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHisaB44sK758zI8M5r2trdQNCa7/jhf5rapQP/cqtsPLrHnhK38AjKdwlnpDugDpbu0acp0w==
X-Received: by 2002:a05:6a20:9149:b0:35d:2984:e5fd with SMTP id adf61e73a8af0-376a8eb2ab9mr22015684637.32.1766970620987;
        Sun, 28 Dec 2025 17:10:20 -0800 (PST)
Received: from [10.133.33.23] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961fbb9sm23834239a12.2.2025.12.28.17.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 17:10:20 -0800 (PST)
Message-ID: <c60288a5-189d-4761-99eb-4681effe1252@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 09:10:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <202512251923.GDSbVal1-lkp@intel.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <202512251923.GDSbVal1-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Bkpl1oXwvVcnsmph1kASU17tX1PbXH4L
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=6951d4ff cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=r4nmail-YYtXJwozotMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=mmqRlSCDY2ywfjPLJ4af:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDAwOCBTYWx0ZWRfX3g2TRcaU0l3Y
 TxDAY4Odjoj/m+AdzII+Vm4y2v/cNsRF5Oy8DoBUYUwOsJrhzVrSzCWXsUP7WFRQGc4/p3REFqs
 UJ5rUCxqua9CNyFXqliZtQFF4xLm1kjTZ/r8yfT9GdBJptt9MRJNhk78y9G8qyiBOd11EWnVd/o
 Eft9KfCATNHp/hCyWKfmt47z4LovysxS399muWVbPEZ7kEwvUJe7IPyUNSUOGLVs4T1oEtH8mHy
 9vnpF9bbYUqFcCkkg5QrpHIuYVivEoJyZnucOOC4dfRoOHuu3iVz+wwBBqquyhMPH49fQxXED1g
 xp6BSJ0XKCJNNtcrY6c+VUMpkCLfoHehTC7Y646Xu1Fuse7J+2VxAWz6hcGGet7mxR8aznDbAe/
 bAV7kOFKo02jthp9iLFgvdwIeY+E5iGkNzoLC1Z80fFOxZFxW/85JbSkNIbfG5YfOT4515cSDNV
 1YE8mzLVwO0DFO9gGiA==
X-Proofpoint-ORIG-GUID: Bkpl1oXwvVcnsmph1kASU17tX1PbXH4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_08,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290008



On 12/26/2025 9:17 PM, Dan Carpenter wrote:
> Hi Jie,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/coresight-core-Refactoring-ctcu_get_active_port-and-make-it-generic/20251224-171604
> base:   47b7b5e32bb7264b51b89186043e1ada4090b558
> patch link:    https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4%40oss.qualcomm.com
> patch subject: [PATCH v9 2/8] coresight: tmc: add create/clean functions for etr_buf_list
> config: arm-randconfig-r073-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251923.GDSbVal1-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202512251923.GDSbVal1-lkp@intel.com/
> 
> smatch warnings:
> drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing freed memory 'new_node' (line 1991)
> drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing zero to 'PTR_ERR'
> 
> vim +/new_node +1992 drivers/hwtracing/coresight/coresight-tmc-etr.c
> 
> 34af91eeb7e78e Jie Gan 2025-12-24  1959  int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
> 34af91eeb7e78e Jie Gan 2025-12-24  1960  {
> 34af91eeb7e78e Jie Gan 2025-12-24  1961  	struct etr_buf_node *new_node;
> 34af91eeb7e78e Jie Gan 2025-12-24  1962  	struct etr_buf *sysfs_buf;
> 34af91eeb7e78e Jie Gan 2025-12-24  1963  	int i = 0, ret = 0;
> 34af91eeb7e78e Jie Gan 2025-12-24  1964
> 34af91eeb7e78e Jie Gan 2025-12-24  1965  	/* We dont need a list if there is only one node */
> 34af91eeb7e78e Jie Gan 2025-12-24  1966  	if (num_nodes < 2)
> 34af91eeb7e78e Jie Gan 2025-12-24  1967  		return -EINVAL;
> 34af91eeb7e78e Jie Gan 2025-12-24  1968
> 34af91eeb7e78e Jie Gan 2025-12-24  1969  	/* We expect that sysfs_buf in drvdata has already been allocated. */
> 34af91eeb7e78e Jie Gan 2025-12-24  1970  	if (drvdata->sysfs_buf) {
> 34af91eeb7e78e Jie Gan 2025-12-24  1971  		/* Directly insert the allocated sysfs_buf into the list first */
> 34af91eeb7e78e Jie Gan 2025-12-24  1972  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
> 34af91eeb7e78e Jie Gan 2025-12-24  1973  		if (IS_ERR(new_node))
> 34af91eeb7e78e Jie Gan 2025-12-24  1974  			return PTR_ERR(new_node);
> 34af91eeb7e78e Jie Gan 2025-12-24  1975
> 34af91eeb7e78e Jie Gan 2025-12-24  1976  		new_node->sysfs_buf = drvdata->sysfs_buf;
> 34af91eeb7e78e Jie Gan 2025-12-24  1977  		new_node->is_free = false;
> 34af91eeb7e78e Jie Gan 2025-12-24  1978  		list_add(&new_node->node, &drvdata->etr_buf_list);
> 34af91eeb7e78e Jie Gan 2025-12-24  1979  		i++;
> 34af91eeb7e78e Jie Gan 2025-12-24  1980  	}
> 34af91eeb7e78e Jie Gan 2025-12-24  1981
> 34af91eeb7e78e Jie Gan 2025-12-24  1982  	while (i < num_nodes) {
> 34af91eeb7e78e Jie Gan 2025-12-24  1983  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
> 34af91eeb7e78e Jie Gan 2025-12-24  1984  		if (IS_ERR(new_node)) {
> 34af91eeb7e78e Jie Gan 2025-12-24  1985  			ret = PTR_ERR(new_node);
> 34af91eeb7e78e Jie Gan 2025-12-24  1986  			break;
> 34af91eeb7e78e Jie Gan 2025-12-24  1987  		}
> 34af91eeb7e78e Jie Gan 2025-12-24  1988
> 34af91eeb7e78e Jie Gan 2025-12-24  1989  		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
> 34af91eeb7e78e Jie Gan 2025-12-24  1990  		if (IS_ERR(sysfs_buf)) {
> 34af91eeb7e78e Jie Gan 2025-12-24 @1991  			kfree(new_node);
> 34af91eeb7e78e Jie Gan 2025-12-24 @1992  			ret = PTR_ERR(new_node);
> 
> s/new_node/sysfs_buf/

Thanks for reporting. Will fix it.

-Jie

> 
> 34af91eeb7e78e Jie Gan 2025-12-24  1993  			break;
> 34af91eeb7e78e Jie Gan 2025-12-24  1994  		}
> 34af91eeb7e78e Jie Gan 2025-12-24  1995
> 34af91eeb7e78e Jie Gan 2025-12-24  1996  		/* We dont have a available sysfs_buf in drvdata, setup one */
> 34af91eeb7e78e Jie Gan 2025-12-24  1997  		if (!drvdata->sysfs_buf) {
> 34af91eeb7e78e Jie Gan 2025-12-24  1998  			drvdata->sysfs_buf = sysfs_buf;
> 34af91eeb7e78e Jie Gan 2025-12-24  1999  			new_node->is_free = false;
> 34af91eeb7e78e Jie Gan 2025-12-24  2000  		} else
> 34af91eeb7e78e Jie Gan 2025-12-24  2001  			new_node->is_free = true;
> 34af91eeb7e78e Jie Gan 2025-12-24  2002
> 34af91eeb7e78e Jie Gan 2025-12-24  2003  		new_node->sysfs_buf = sysfs_buf;
> 34af91eeb7e78e Jie Gan 2025-12-24  2004  		list_add(&new_node->node, &drvdata->etr_buf_list);
> 34af91eeb7e78e Jie Gan 2025-12-24  2005  		i++;
> 34af91eeb7e78e Jie Gan 2025-12-24  2006  	}
> 34af91eeb7e78e Jie Gan 2025-12-24  2007
> 34af91eeb7e78e Jie Gan 2025-12-24  2008  	/* Clean the list if there is an error */
> 34af91eeb7e78e Jie Gan 2025-12-24  2009  	if (ret)
> 34af91eeb7e78e Jie Gan 2025-12-24  2010  		tmc_clean_etr_buf_list(drvdata);
> 34af91eeb7e78e Jie Gan 2025-12-24  2011
> 34af91eeb7e78e Jie Gan 2025-12-24  2012  	return ret;
> 34af91eeb7e78e Jie Gan 2025-12-24  2013  }
> 


