Return-Path: <linux-arm-msm+bounces-81531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0550CC5603A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 08:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E63D3B4CC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 07:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184FD320A24;
	Thu, 13 Nov 2025 07:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IAywLVvM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2773043BD;
	Thu, 13 Nov 2025 07:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763017902; cv=none; b=Dr/eyO50+bWDJIYTtdcScPhOP3l/XPZEMR7RZz+2r3rah8p52KmOEdWCyUW6NAb8xfOcxFHhq4RfBELdbligFklINd4E/cKoSu7tvsFy9Y2Oi3WYDlKwHiprDzqmOvc93YGU/I2Jt/Pd2/0Ain6YkSEIMdetLyU4ygZkWecQazc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763017902; c=relaxed/simple;
	bh=jwZV3cN+md5GWxIHrM08w4it1bCTbyUus7RjFW/i5yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VtzKoU+LfapM6rf75XqlPnPM5thHy9SWdqW6JtwtozB5ES6EGrz1VmH2nwhwKXbFq17+J1oukZzwYqBIn3z5ilBVuF/Xb2XO40URIvaG3NEvXxISLZh2sp9G7UXIv7NBzvzVrSj/VfJcDGgfAo8gCf7+e0Ie8jDXiwyMZ9lAIKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IAywLVvM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD65vuk3564018;
	Thu, 13 Nov 2025 07:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JbcsyPnHmuKn4QQ8CLzN7c30DEC+8jlevi+eLhpMg9w=; b=IAywLVvMA1+pmkMn
	NkqUpGOv/e2R5IWqf5McFqf0tWWTkLxXSTvt/jLJ5ou1Hv6l9Lx1G7TmLAV3dTfW
	QYQ3kHrOoW1y+IEs7U8rF/hBnqy3fQCa7kuNSIbmUh5WL94l7QwXaDXzpaw2zu0R
	Ernmz3J3frVP3EannklHM8EdvthlLqgtZcgdmgqrJ+UPMrOUFwBp9LRUj6TIdK2W
	vcLU0b9WL2mGJFXcOoI+wfVRXywWfp9ekY+5sKiisotMDkf0G7oDZfcKb15M6kha
	18VEXmDIyJStbuVgaknJaWgRopd3BcR+VkDhrPAAFKh4/ODngiyUd4VbTFuFvPDZ
	eCvtww==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9rvg6hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Nov 2025 07:11:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AD7BZlc009796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Nov 2025 07:11:35 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 12 Nov
 2025 23:11:31 -0800
Message-ID: <dbea629d-5aa9-4a85-6316-25ac82a33520@quicinc.com>
Date: Thu, 13 Nov 2025 12:41:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>
CC: <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_varada@quicinc.com>
References: <20251111104604.2494305-1-quic_mdalam@quicinc.com>
 <20251111205212.GA245945@sol>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20251111205212.GA245945@sol>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=XrX3+FF9 c=1 sm=1 tr=0 ts=691584a8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KhDgJi1XJtjopTdYXVYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22 a=HhbK4dLum7pmb74im6QT:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-ORIG-GUID: 5Iu9ByN6QdRwa8Q_AebwRauqJh4TQNgn
X-Proofpoint-GUID: 5Iu9ByN6QdRwa8Q_AebwRauqJh4TQNgn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA0OSBTYWx0ZWRfX/2gMeclkLnb/
 BCVudlpZCc1b67kGSUueBrGmWzINHXFwHfkp0gdf7Qf5ACIOvTskzSkwsRjNdb+JQaEznS+zFEl
 uUfzWKyFmJUd/ZVm247Rs22NfGrTuKl7cNssORzXJNZ6rxtYVQSIt3vyU4g2XckQK3Uy8E5FZPo
 nY1yDi/2tM4z4T6Sma8NPbmDy7RcNRAzgTkoh4TaBByqoxw5O7GmB7hSLKaaeoQBJcZ3p4IwwMW
 d490clNbGeV8u4q2eRHZOfLf5GCJXZdXb5OOWyMqMvmXqRi9mEHFnXh8rFBJxzfIpdTUogW1kSy
 WD18MsYSSDQNPdLDcaxrOJDRhqja+cpu1Dk4gfDzNzo0mRPBoBWk3Vq90CLTcUzaEISysSBTIjC
 gqA8LcCqCBlGUBJQdp73lZwTLPNYvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130049

Hi,

On 11/12/2025 2:22 AM, Eric Biggers wrote:
> On Tue, Nov 11, 2025 at 04:16:04PM +0530, Md Sadre Alam wrote:
>> Enable Inline Crypto Engine (ICE) support for eMMC devices that operate
>> without Command Queue Engine (CQE).This allows hardware-accelerated
>> encryption and decryption for standard (non-CMDQ) requests.
>>
>> This patch:
>> - Adds ICE register definitions for non-CMDQ crypto configuration
>> - Implements a per-request crypto setup via sdhci_msm_ice_cfg()
>> - Hooks into the request path via mmc_host_ops.request
>>
>> With this, non-CMDQ eMMC devices can benefit from inline encryption,
>> improving performance for encrypted I/O while maintaining compatibility
>> with existing CQE crypto support.
> 
> This really should explain that this patch actually applies only to host
> controllers that *do* support CQE.  Just they are using a card that
> doesn't support CQE or CQE was explicitly disabled.  Right?
Yes, you are absolutely correct. Thank you for pointing this out - the 
commit message should be clearer about this important detail.

This patch applies specifically to CQE-capable host controllers 
(sdhci-msm controllers that support CQHCI) when they are operating in 
non-CQE mode.
This can happen in two scenarios:

1. CQE-capable controller + non-CQE card: The host controller supports 
CQE, but the eMMC card doesn't support Command Queue Engine
2. CQE explicitly disabled: The host controller and card both support 
CQE, but CQE has been explicitly disabled (e.g., via device tree)

For the 2nd case I will post another path which will handle host side
CQE enable/disable.
> 
>> +static void sdhci_msm_non_cqe_ice_init(struct sdhci_host *host)
>> +{
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct mmc_host *mmc = msm_host->mmc;
>> +	struct cqhci_host *cq_host = mmc->cqe_private;
>> +	u32 config;
>> +	u32 ice_cap;
>> +
>> +	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
>> +	config &= ~DISABLE_CRYPTO;
>> +	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
>> +	ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
>> +	if (ice_cap & ICE_HCI_SUPPORT) {
>> +		config = cqhci_readl(cq_host, CQHCI_CFG);
>> +		config |= CRYPTO_GENERAL_ENABLE;
>> +		cqhci_writel(cq_host, config, CQHCI_CFG);
>> +	}
>> +	sdhci_msm_ice_enable(msm_host);
>> +}
>> +
>> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq)
>> +{
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct mmc_host *mmc = msm_host->mmc;
>> +	struct cqhci_host *cq_host = mmc->cqe_private;
>> +	unsigned int crypto_params = 0;
>> +	int key_index;
>> +	bool crypto_enable;
>> +	u64 dun = 0;
>> +
>> +	if (mrq->crypto_ctx) {
>> +		if (!msm_host->ice_init_done) {
>> +			sdhci_msm_non_cqe_ice_init(host);
>> +			msm_host->ice_init_done = true;
>> +		}
> 
> This means sdhci_msm_ice_enable() is called only once per host
> controller.  It looks like the existing call to sdhci_msm_ice_enable()
> happens each time after the host controller is resumed.  So there seems
> to be an inconsistency there.  Which way is correct?
Thank you for highlighting this. After revisiting the code paths, I 
believe the behavior is consistent across both CQE and non-CQE modes.
ICE is re-enabled on every resume via the common 
sdhci_msm_runtime_resume() → sdhci_msm_ice_resume() → qcom_ice_resume() 
→ sdhci_msm_ice_enable() path.
The ice_init_done flag only governs one-time initialization in 
sdhci_msm_ice_cfg() and doesn’t interfere with the resume logic.

In summary:
CQE mode: ICE enabled during sdhci_msm_cqe_enable() + every resume
Non-CQE mode: ICE enabled on first crypto request + every resume
> 
>> +	} else {
>> +		crypto_enable = false;
>> +		key_index = 0;
>> +		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> 
> The values assigned to 'crypto_enable' and 'key_index' are never used.
Ok, will remove in next revision.
> 
>> +static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
>> +{
> 
> Could you leave a comment here that notes this is used only for non-CQE
> requests and that crypto on CQE requests is handled elsewhere?
Thank you very much — that’s a valuable suggestion. Adding a comment 
will make the code much clearer. Will add in next revision.

Thanks,
Alam.

