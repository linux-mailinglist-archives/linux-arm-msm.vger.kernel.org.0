Return-Path: <linux-arm-msm+bounces-36280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3BF9B4806
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05E831C26422
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 11:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DCE204F86;
	Tue, 29 Oct 2024 11:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QRy5WAJK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D36E187FE0;
	Tue, 29 Oct 2024 11:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730200258; cv=none; b=jK7AjNGrDYBw44Xnmp9zO51W/Wzfz9Tg5sCIzZCUbtrBXCMwVIgXzkUqCbSkEqd9UGBskm2ooosUR7HshrWZSViClTFJmlhh+ausNaypShHEzaHFYeA3uGzP9eVPjjEJOo2GNvoBPqnuOuqlU4QYC9I/70Fzl8sdtqCSGb/zGQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730200258; c=relaxed/simple;
	bh=yt47M43WyMYlEnC7UAALHEEIK9uCfLcbuK0JvelkRZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EBKNF+R6cmGol19qKLtgKxWkdz6U0TpLhzXXLmXe0Wb1byMWecQSDM3LTE3iC7f+plbElLjMvtL2dZXcrtVQPxh3zKhL9NECXpi3mjDx/+Adh69L/vMH9NVuO/CLvofIEpWak/w8nDdWaMsc6/mOxLNftFA+6a1iJXxMo33A6PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QRy5WAJK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TAp491009977;
	Tue, 29 Oct 2024 11:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	436gstbPCkPlj4d3w0TEgski1t5UL/d1n+5YYqP/jL0=; b=QRy5WAJKAkoHJ8US
	8P2qxS1pt4gpZ6T72S65WjcjgmpRVOlFCmlKiUwcUx99q6M3+1rdCaZ1paXoyslZ
	SDtdeEIzf/Vkit0U29df6x8VAjSmZgfeq5u9mMeMh6KVuBjEn+ueJj5c7KzPkbLU
	dpJEd6mrY3lFMvHNl3IR/zWDUx+uSOcZUkTISLvosF6g4NT6+lxfaF20wYOpyksO
	Ij37KcQQFNGqBikw6rIbqz+IZ6gqLDEgwXFzLj1V9tSW41hoR6sw/nClq6tttUnX
	oBuZc124y9E1aTjsXrmQUBhCw4Oh2N1Jgo85Qr8XSpo1xU8Vkf3KdlcczX0MieT8
	x8pzvg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42jxa881mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:10:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TBAYTj023982
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:10:34 GMT
Received: from [10.216.3.156] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 04:10:27 -0700
Message-ID: <cb2ecd04-ae0b-40c3-ac3c-9bcb1bf46e7d@quicinc.com>
Date: Tue, 29 Oct 2024 16:40:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/3] scsi: ufs: qcom: Add support for multiple ICE
 algorithms
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        <manivannan.sadhasivam@linaro.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        Can Guo
	<quic_cang@quicinc.com>
References: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
 <20241005064307.18972-4-quic_rdwivedi@quicinc.com>
 <517d5373-592a-4a79-8c79-14226ceacbce@wanadoo.fr>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <517d5373-592a-4a79-8c79-14226ceacbce@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eDgxb5ywVO5CFyIqyxmJjQJHptkvzKvk
X-Proofpoint-ORIG-GUID: eDgxb5ywVO5CFyIqyxmJjQJHptkvzKvk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290087



On 06-Oct-24 1:03 AM, Christophe JAILLET wrote:
> Le 05/10/2024 à 08:43, Ram Kumar Dwivedi a écrit :
>> Add support for ICE algorithms for Qualcomm UFS V5.0 and above which
>> uses a pool of crypto cores for TX stream (UFS Write – Encryption)
>> and RX stream (UFS Read – Decryption).
>>
>> Using these algorithms, crypto cores can be dynamically allocated
>> to either RX stream or TX stream based on algorithm selected.
>> Qualcomm UFS controller supports three ICE algorithms:
>> Floor based algorithm, Static Algorithm and Instantaneous algorithm
>> to share crypto cores between TX and RX stream.
>>
>> Floor Based allocation is selected by default after power On or Reset.
>>
>> Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
>> Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
>> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> Co-developed-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 232 ++++++++++++++++++++++++++++++++++++
>>   drivers/ufs/host/ufs-qcom.h |  38 +++++-
>>   2 files changed, 269 insertions(+), 1 deletion(-)
> 
> Hi,
> 
> a few nitpicks below.
> 
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 810e637047d0..c0ca835f13f3 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -105,6 +105,217 @@ static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
>>   }
>>     #ifdef CONFIG_SCSI_UFS_CRYPTO
>> +/*
>> + * Default overrides:
>> + * There're 10 sets of settings for floor-based algorithm
>> + */
>> +static struct ice_alg2_config alg2_config[] = {
> 
> I think that this could easily be a const struct.
> 
>> +    {"G0", {5, 12, 0, 0, 32, 0}},
>> +    {"G1", {12, 5, 32, 0, 0, 0}},
>> +    {"G2", {6, 11, 4, 1, 32, 1}},
>> +    {"G3", {6, 11, 7, 1, 32, 1}},
>> +    {"G4", {7, 10, 11, 1, 32, 1}},
>> +    {"G5", {7, 10, 14, 1, 32, 1}},
>> +    {"G6", {8, 9, 18, 1, 32, 1}},
>> +    {"G7", {9, 8, 21, 1, 32, 1}},
>> +    {"G8", {10, 7, 24, 1, 32, 1}},
>> +    {"G9", {10, 7, 32, 1, 32, 1}},
>> +};
>> +
>> +/**
> 
> This does nor look like a kernel-doc. Just /* ?
> 
>> + * Refer struct ice_alg2_config
>> + */
>> +static inline void __get_alg2_grp_params(unsigned int *val, int *c, int *t)
>> +{
>> +    *c = ((val[0] << 8) | val[1] | (1 << 31));
>> +    *t = ((val[2] << 24) | (val[3] << 16) | (val[4] << 8) | val[5]);
>> +}
> 
> ...
> 
>> +/**
>> + * ufs_qcom_ice_config_alg2 - Floor based ICE algorithm
>> + *
>> + * @hba: host controller instance
>> + * Return: zero for success and non-zero in case of a failure.
>> + */
>> +static int ufs_qcom_ice_config_alg2(struct ufs_hba *hba)
>> +{
>> +    struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +    unsigned int reg = REG_UFS_MEM_ICE_ALG2_NUM_CORE_0;
>> +    /* 6 values for each group, refer struct ice_alg2_config */
>> +    unsigned int override_val[ICE_ALG2_NUM_PARAMS];
>> +    char name[8] = {0};
>> +    int i, ret;
>> +
>> +    ufshcd_writel(hba, FLOOR_BASED_ALG2, REG_UFS_MEM_ICE_CONFIG);
>> +    for (i = 0; i < ARRAY_SIZE(alg2_config); i++) {
>> +        int core = 0, task = 0;
>> +
>> +        if (host->ice_conf) {
>> +            snprintf(name, sizeof(name), "%s%d", "g", i);
> 
> Why not just "g%d"?
> 
>> +            ret = of_property_read_variable_u32_array(host->ice_conf,
>> +                                  name,
>> +                                  override_val,
>> +                                  ICE_ALG2_NUM_PARAMS,
>> +                                  ICE_ALG2_NUM_PARAMS);
> 
> ...
> 
> CJ
> 


Hi Christophe,

I have addressed your comments in latest patchset.

Thanks,
Ram.

