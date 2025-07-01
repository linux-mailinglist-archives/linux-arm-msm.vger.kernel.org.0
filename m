Return-Path: <linux-arm-msm+bounces-63205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAA2AEF72B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 13:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C396447B24
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 11:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3A5276036;
	Tue,  1 Jul 2025 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MPBgrhp7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FCE275AFF;
	Tue,  1 Jul 2025 11:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370487; cv=none; b=q58iSdYDDbyIMD8fNXblHV9uEp+N7xJzijQ50TR81rcTqtqsXv4ZJmEYa+rLgl2/fu7bw7nshh44uNhvW/PoKSpW84+ebaxoYjxOj5/tutfxIgV1akuWokW7XcWq8zmsjsJbWtXhCO8T4KwnP654BSp3fuwDFzmabpEa7WCvOUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370487; c=relaxed/simple;
	bh=mSARHChrsSkZqv4FL5ywNNlM+mfq9RkAadWkjMMswZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eaFXdoRa9RxudpZLK6Az5uOsrvowsqD5Enak/E6SBF5YTOO0Cu3BCPeM3UtNTVFS9ETAedsPP7zkgU5KzgMWrT1UAouwToZxTO31bisvnykUXit3l7zJHukww2C0lmowSpBAi+G+QznIXEyrr5XyRjsBPWmfabAb3ieUXCCINuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MPBgrhp7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5618lCvZ026544;
	Tue, 1 Jul 2025 11:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCGpL5WtLCGHD7lGDK/ISop6wOAMqbvqcoNsJwiihW0=; b=MPBgrhp7EkFMuk/i
	WvA1LuBdxuKhUs5pH0lkPCj+KvzspP8lCVgVeCn0zUo4mgxPfhWYjB9a3U7PAd56
	Bo1VuKvFgqBOIFWnInNfxIg9/YFOrK8a8V1iiW/dpwciJPdpf6EoiuFPCsNQUZOn
	/DogWUZySNf+K7FVN0tz7KuTX0fauaLt2fi12l5J7gDWa4hnxeDHTxqjliJ+lBK6
	gIWHrLPmxm7N762zm9lPUDEOhBf920q8jRjVqHcsNhmyA584VA8+cbuEy+O2idMw
	Fp7Urk6tyqY+yb+lkX5ZvVWM0qTfgYy6pPfqSzvDt7yT3Ss2LEKMi7BSBiQHBpsT
	p1HHtw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcrm2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 11:47:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561BlrvZ020980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 11:47:53 GMT
Received: from [10.217.222.28] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Jul
 2025 04:47:47 -0700
Message-ID: <2455f20c-130c-4f27-9cf4-6411e485b845@quicinc.com>
Date: Tue, 1 Jul 2025 17:17:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] firmware: qcom: tzmem: export shm_bridge
 create/delete
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander
	<jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu
	<quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
CC: Harshal Dev <quic_hdev@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <linux-kernel@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-doc@vger.kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
 <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-8-024e3221b0b9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-8-024e3221b0b9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ztKxMaTHEsgXeingGXCKylzfZjaG2-ty
X-Proofpoint-ORIG-GUID: ztKxMaTHEsgXeingGXCKylzfZjaG2-ty
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3MyBTYWx0ZWRfX74DO11z9dMYF
 62b2TucWlwr7aP2wLjZ5GJ8VxyRAYqmoReJedk6CNfnGBZJatEM1OJrxmydL4DRvLfDVKk0HSaA
 glGZa43wXvVkw2RNorrrDsT4ohoJw23givoio+J4JT9e/Hl2q/3PXbKXE+zYKGWyQ4nIZf/gX/x
 0ygEgUAUl4FzOcg4AoT3/bKo4Ebv9c//GZKuU6wOBpOmIJ8xM3KNdFtLFJeJVYgtJ/wQHRhXx5t
 8smIEsHc/qD5i5mML4oYknS7mIIQko5H7+L0qHY+ISOyaPPxqcBIb2UT8LymslIwxMEQzt9YzTg
 n4t9AjjbkwFN7EiF6/75yhn9k5v8CoFMGTOfN3Gk1JPh9kXi6WPxG7qRXFFayej7yueJMXnlc23
 +VdTOVUtCt62g4uAKYeR/hiM109i/duCv/ogYnnAOajxoeL8VSKAQRXcAvhJEhkPTRXvgCNO
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6863caea cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=T2KzT_qPCcxtbzpLTyEA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010073


On 5/27/2025 12:26 PM, Amirreza Zarrabi wrote:
> Anyone with access to contiguous physical memory should be able to
> share memory with QTEE using shm_bridge.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c       | 57 +++++++++++++++++++++++++-------
>  include/linux/firmware/qcom/qcom_tzmem.h | 15 +++++++++
>  2 files changed, 60 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> index 4fe333fd2f07..e9e4f06924ae 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -108,25 +108,61 @@ static int qcom_tzmem_init(void)
>  	return 0;
>  }
>  
> -static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
> +/**
> + * qcom_tzmem_shm_bridge_create() - Create a SHM bridge.
> + * @paddr: Physical address of the memory to share.
> + * @size: Size of the memory to share.
> + * @handle: Handle to the SHM bridge.
> + *
> + * On platforms that support SHM bridge, this function creates a SHM bridge
> + * for the given memory region with QTEE. The handle returned by this function
> + * must be passed to qcom_tzmem_shm_bridge_delete() to free the SHM bridge.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcom_tzmem_shm_bridge_create(phys_addr_t paddr, size_t size, u64 *handle)
>  {
>  	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags;
> -	int ret;
>  
>  	if (!qcom_tzmem_using_shm_bridge)
>  		return 0;
>  
> -	pfn_and_ns_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
> -	ipfn_and_s_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
> -	size_and_flags = area->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
> +	pfn_and_ns_perm = paddr | QCOM_SCM_PERM_RW;
> +	ipfn_and_s_perm = paddr | QCOM_SCM_PERM_RW;
> +	size_and_flags = size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
> +	if (qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
> +				       size_and_flags, QCOM_SCM_VMID_HLOS,
> +				       handle))

Can we add a debug log here to ease debugging in future?
Something like this can also work.

pr_err("Shm bridge creation failed, ret: %d, NS PA|Perm: 0x%llx,
size|flags: 0x%llx\n", ret, pfn_and_ns_perm_flags, size_and_flags);

> +		return -EINVAL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(qcom_tzmem_shm_bridge_create);

-- 
Regards
Kuldeep


