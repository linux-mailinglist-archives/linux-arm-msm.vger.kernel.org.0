Return-Path: <linux-arm-msm+bounces-58960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC5EABFF21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 23:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB9F69E5D43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 21:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B352F2343B6;
	Wed, 21 May 2025 21:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AjhLocex"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A4E1FFC48;
	Wed, 21 May 2025 21:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747864197; cv=none; b=mxQjXsPDQBQ2dNq6UKaoPU1Q3QjfBwDAqnd+0fGD0LmQ9FKLCGhdW9fG5rXX6MPwu5fs8harCltTQdLsI5DoydLmBFjAK6cBdkudLONUL2G9z+VHMkMJzOgfPOGbFeLhUmV4SZZUlL2gGCyijaY4qidHZrXNoSEeBK0rtpErIso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747864197; c=relaxed/simple;
	bh=hQl0V1vrdc7PWua430JVY2fZWhqC8wv91/WeOSCvsqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=unKziZ30hYDtP0PRCXox2ghRySKryBA47F3DlxeuF3xZuEVkM+ntfeW34gZZMyrj1Jg7mYIWqdpYXafgDBFWmqi3shcj+O3qRxFJC8Ah2XxIdayUhuyIeNUtAWjb3UuGWOAJzBHjhGlcnscDqWnxTM1xx0toAbwlxj8cKSTFM5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AjhLocex; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHTfn9029063;
	Wed, 21 May 2025 21:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VQH2hT32qpZU6n0PWsnZJ27lotDiMIcabhSfeBHSQS4=; b=AjhLocex+ztnofVI
	v+utnvkSNXwwxSqhs+0D1CyD0joL6qbZmVu0xLmA9Ki4m840qM2OZvp9IOB1AEeJ
	Gf6h7QGPMqhcjZjBdjv6MujqyHdQBaoj95EVsoS7yio2ZwE7kuUAKBa3DPdX6mxm
	c0PxKEkzEpOAAkBgKoww4YFyMBirucadVLvHAVy+l+V2XDL3qtUysgXduFhM+sg/
	M+pBq5D2SeqwNNisTJghYigYdmAvwl2qZWadcL41/Sm1Cwr8qtYHJIApZZWu/ggT
	J3OuShUdr+y+kAJ+FxAET7+yIR58vvSpVSiwdkqGkM91zqWT10cJkCQp2N6AOk1b
	AfNQHA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf44c5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 21:49:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LLnYZX028039
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 21:49:34 GMT
Received: from [10.216.45.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 14:49:28 -0700
Message-ID: <86fe457b-7071-4e22-9c93-982854be442b@quicinc.com>
Date: Thu, 22 May 2025 03:19:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 05/11] phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <konrad.dybcio@oss.qualcomm.com>, <quic_rdwivedi@quicinc.com>,
        <quic_cang@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-6-quic_nitirawa@quicinc.com>
 <z3yfou4oolymsgb72dpakwcsmq6v3gnx64mdals7krnxdhpc2a@lsepak4kc2mg>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <z3yfou4oolymsgb72dpakwcsmq6v3gnx64mdals7krnxdhpc2a@lsepak4kc2mg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIxNyBTYWx0ZWRfX61AKLr55rbSB
 OKKotKp5QkpB3EtrN3x84nm5NnBQhk5/qTZnOJ0XNcL91bf6HFnIQqkZY7wqSqF3+Wi2rB48ugp
 /ACyKY21zkicOuc8L9e8/bpNH6UOqUxQCVuQhyfaBZipvAmGf0IHbdiqBrhFjBdf2Mtqdoy8F2R
 T+o14dMfaIsOlO0JyH+L4bIoc/PYcTexPiqXy9pWjyF6IZYWq/lrhDkGfS5eYvfn+PXSeyac8eH
 WRKa+KYpo8fgP2jsj09lA3Yrff4CmDyMFLn6++rATJrFqucF3ve8/9bClRJQCM3H2Yj9gGSzatU
 qBVSp/RAUYKVO5QFxzb3wFN9dRiFDLNeYso2A5ZB0c8vUCPmL1UfHySkiT93NMtjhXacgsWdCRg
 INByh5T51U+a+QH/XyN4OxOg8xvfTgPU1aLmkuRV9f52q2vBXhcMlLNEymK2R6lIc85tMpsf
X-Proofpoint-GUID: 4SpGuZVcs5HkYdWtQJ7gByQxJFBXbR_s
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682e4a6f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=XLgfHQIRnCPKqbsVxRkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4SpGuZVcs5HkYdWtQJ7gByQxJFBXbR_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210217



On 5/21/2025 7:00 PM, Manivannan Sadhasivam wrote:
> On Thu, May 15, 2025 at 09:57:16PM +0530, Nitin Rawat wrote:
>> The qmp_ufs_power_on() function acts as a wrapper, solely invoking
>> qmp_ufs_com_init(). Additionally, the code within qmp_ufs_com_init()
>> does not correspond well with its name.
>>
>> Therefore, to enhance the readability and eliminate unnecessary
>> function call inline qmp_ufs_com_init() into qmp_ufs_power_on().
>>
>> There is no change to the functionality.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 43 ++++++++++---------------
>>   1 file changed, 17 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> index 33d238cf49aa..d3f9ee490a32 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> @@ -1758,12 +1758,28 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
>>   		qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>>   }
>>   
>> -static int qmp_ufs_com_init(struct qmp_ufs *qmp)
>> +static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
> 
> Since there is no qmp_ufs_com_init() now, qmp_ufs_com_exit() lacks symmetry.
> Maybe you should rename it too.


Yes this is already taken care in differnt patch of this series.

> 
>>   {
>>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +
>> +	reset_control_assert(qmp->ufs_reset);
>> +
>> +	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>> +
>> +	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmp_ufs_power_on(struct phy *phy)
>> +{
>> +	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>   	void __iomem *pcs = qmp->pcs;
>>   	int ret;
>>   
>> +	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
> 
> Now, this debug print doesn't make sense. You can drop it.

Sure, wil remove.

> 
> - Mani
> 


