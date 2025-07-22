Return-Path: <linux-arm-msm+bounces-65978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 079E5B0D0A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 05:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6232188547D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 03:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0552288CB4;
	Tue, 22 Jul 2025 03:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eoKbi1Fp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980152877DD;
	Tue, 22 Jul 2025 03:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753156300; cv=none; b=pSrd2oyJY5CznKwQrZ7CJlLIlJolGtADMJ4uNPfGk59hxZaD15BFlwXHQXjuJTy2UfT7wgKbtIFzXkbViwHde4xgkV8bUvm9XS4V6y7A75f/sthISjMcpUGCcn98R37SWFeBDfPmq1y0rE+rrB7gAW274D18k0wWGvWUMKIcmfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753156300; c=relaxed/simple;
	bh=CehZcbn56bMNupszjKjrFbdqYFFcXpvEq0EHXB7YYzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tu+MD1cX8rMmnpfiq5yl0KD6rX9ULLP/tI1uGDBZczuUrnY91O1Dn9gqfGFWMlRh+jeNd/gP8dLAttoHQneR4m/oGb1FeC2YwPZy8PzRDw0MDuwZXIFI7OaAEqqSAPBpfbeaZe0DF+c9HiE6GU/bMIGy/GbODopB0k1JvTk60Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eoKbi1Fp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LH1wZv015983;
	Tue, 22 Jul 2025 03:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	480bSrjc4VissYWfmaUeaEfbEzO8ipXiEwsAiIBKUCg=; b=eoKbi1Fp4DIT8eF7
	5KkWwihxbeDaKWrHR8o6VIwjOkHk6W2VV69fqZ4MQkkCgvCUVXPZviaqj5pD/7+H
	08HyHC8LCs/0tgGP2LEB/YMA9EtimjNZrEwtGVH+8Ognk0nDVAC1aR3Xx0gN94/1
	8zuZrzUPUM+K+b4i57uw7RlHAFp9lCmNs8R1lVsnCaam5PJmDJ75E2fkcH/B15QX
	eggn4+BnwZNHZgKOuV0EK/t7PTVF6hE90AdS/I2x91CqBeaq5GQNdmXQjPZuj/Hn
	QHP3DSFFPgyR7+zlXFN6oOdRaMBxOs7+HnalfniEVGRxB3LSSmmPyvqcZZGdafNP
	Bw6fOg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451ftbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 03:51:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56M3pYjC015813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 03:51:34 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 21 Jul
 2025 20:51:32 -0700
Message-ID: <5ffce535-5142-43e0-8b5b-ada50bf84336@quicinc.com>
Date: Tue, 22 Jul 2025 11:51:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] driver: bluetooth: hci_qca: fix host IBS state after
 SSR
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <quic_bt@quicinc.com>
References: <20250715051618.724475-1-quic_shuaz@quicinc.com>
 <20250715051618.724475-3-quic_shuaz@quicinc.com>
 <67431c9f-d843-488d-af32-c70aa183ba19@oss.qualcomm.com>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <67431c9f-d843-488d-af32-c70aa183ba19@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687f0ac7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=NnzlATz_z2kU6vU1Dn4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sa070-30mqVU5gWOTmACfBNgVIYaCNbl
X-Proofpoint-GUID: sa070-30mqVU5gWOTmACfBNgVIYaCNbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDAyOCBTYWx0ZWRfX36JGcJDLPRq8
 zG0LSTmEnxBjfm60eiHGIHBxGGr798V9EgwcCGaO0GaxURBxbUdnAB/k1JsBAlV7ai/tkWnvr7Z
 oK24wld6niK7XfYJgEkTFMA1gKBEjm5c4E/CWXDcBD9JdKbW1lpwVFZXpmrjypfA2mmeszZwT19
 fvCqIl+IzLJBG7j58YTfI+GSYjyF/2owN/VWgk5893DMkC7obRbZN20vKU1Fk0oxMevsVcQhUSW
 rfY06PfvGDQ0OIE1GRLqtu325eD/aGt4ADmBRs8SfYOl9m1FLxnOJHNLd2I4T7f0TLKzAKxJqcs
 L4g0W+UdmUhSoOq/X3b/hDPZe+dymr+cG2hDjFbOF4p+5QiDD+LBnQ8opVT90BzwiQpvPwH5cbJ
 mDBhuZsLBEZuEb5lqg2r9IdUxN0msdlkN1nk51C/VamtSp2cXBT8O995OX/MLKXy1HcMdcPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220028



On 7/15/2025 5:12 PM, Konrad Dybcio wrote:
> On 7/15/25 7:16 AM, Shuai Zhang wrote:
>> After SSR, host will not download the firmware, causing
>> controller to remain in the IBS_WAKE state. Host needs
>> to synchronize with the controller to maintain proper operation.
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>  drivers/bluetooth/hci_qca.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 791f8d472..a17d3f7ae 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1658,10 +1658,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>  	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>>  	 * This leads to a reset command timeout failure.
>>  	 * Also, add msleep delay to wait for controller to complete SSR.
>> +	 *
>> +	 * Host will not download the firmware after SSR, controller to remain
>> +	 * in the IBS_WAKE state, and the host needs to synchronize with it
>>  	 */
>>  	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>>  		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>>  		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>> +		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
>>  		msleep(50);
> 
> This touches upon the code introduced in the previous patch.
> 
> Any reason they should be separate?
> 

Since this is a different issue, I separated it. The same reason applies to patch 3/3.

> Konrad

Shuai

