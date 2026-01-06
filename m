Return-Path: <linux-arm-msm+bounces-87626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FD3CF6BE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 06:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4609F302BA49
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 05:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0902F1FE1;
	Tue,  6 Jan 2026 05:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mG8hQxYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFE929BDB1;
	Tue,  6 Jan 2026 05:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767676304; cv=none; b=TeXDM62cYT6fAiX6FAPqP4SkmiLIp6z24WsqSkg2ucmakgYMfMRTtcO2ik5Cp6goqhyeNpmy/nRHHbzGSyozeH68GQE3OlD3/Qk43l5Hc5Sn0BvKNXVftG+APE/MKME0OwUZSLqe1/F1MDKrZ2eLT8fyMP7twllER2U8MfUPCIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767676304; c=relaxed/simple;
	bh=MeOgU2HeYQTOFxvAKe6Pe9Z3WRZHdgp6s14oa7RIzAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EmsJdDxZFwoCvDeFGEKPMOEGRHF8NDY+VM/HM1rIpjHxI4zH/rO2FcrjxE254Yg7S7ELoWo5w2B2amQl8xf0/IwTCB1WB+HZlRC84wVFasaPy/qvVyjKTjvfN9oLG5jSXATx3LnsY04ujMxQajvFpE1dx5bvtVRY2z1AL3cFYPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mG8hQxYD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063R0Hw529766;
	Tue, 6 Jan 2026 05:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DhK0OvXcW0x+DJMxcMruZCbOIvsE1qca4ehQ64wghkE=; b=mG8hQxYDVvIZWSHP
	Dff4MqLSoPLWSjF4v3ytMhKHHUBr2K4u6b1bQzmqUiURQmtp4WKB8ai2sGxU5uCL
	Oeg26CGDOb9ujDuDdqiXaBt3dLtMhoL+JGJ/hB1G5yiVuPpIHvBzMCIQOfedYXHH
	iVi7JjPMguAHTfBrQBbFETkOUtXuc8KAdL9Mwdg31KLPPCltqWhqB0Bcpld+RvvC
	fUiTJsK+1m2S7lujgdBv+Sx9dgWm5wgbA555sDy7UHdZisQWA0Z3MWZW9J+PNCmC
	IGJF5NCK+kWBSpaeOM+McxdCe0L1rAkWygC7ucsEWJdbNyq7xjj+Woiq3NpCD6eS
	K3+rfw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu1uq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 05:11:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 6065BaeH030628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Jan 2026 05:11:36 GMT
Received: from [10.218.1.24] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 21:11:33 -0800
Message-ID: <ec9e420a-932d-4265-8cac-dee003933898@quicinc.com>
Date: Tue, 6 Jan 2026 10:41:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <herbert@gondor.apana.org.au>, <thara.gopinath@gmail.com>,
        <davem@davemloft.net>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_neersoni@quicinc.com>
References: <20251120062443.2016084-1-quic_utiwari@quicinc.com>
 <a2c6cbdb-a114-423f-a315-6e5e9ab84e5a@oss.qualcomm.com>
Content-Language: en-US
From: Udit Tiwari <quic_utiwari@quicinc.com>
In-Reply-To: <a2c6cbdb-a114-423f-a315-6e5e9ab84e5a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA0MSBTYWx0ZWRfX6ZTprt+tpwlN
 16jLjBxBfWnAK0ahmQHORf+morRDL3KuPnCg5FQGZj+4NnSQUN9q/Qo6LCFB5rnRBO7n/5jGTdR
 yaGkeLg+RFj/b2DoGY0yF93t78Hue4Ct2OIJYBDpsHSN1Npwn0Q0ekf+lIQCrEk9i+0JOp3y/Ke
 diBiAqYNfyHkk+Caiywet512IUWUHwgTNxdLn4//blLM0rd7m633fhl8wNZwf+nNRTh/mRAX8Pf
 wbcuSNEPoca5lFp56ofDiClyDvR7VLtIZ1pddbzhof2u+EMo+w3dMGs2t/zc2psJm4NN2QG/EyP
 B3rLDyUT9PBnB1sq1VBy8rHTokI5M2s9F3SXMBD/asj/kEl8IBwuYp7An2M6DkG0NANwHeebIme
 tGKIheGFmyG35+K6aDHtVwj5vphw3QYMsKUPTd0lhE+ovTEiqtwhqilT/95ETRFBRs9bPdIVA+I
 15fJnNYSyz/+pjKpYfg==
X-Proofpoint-ORIG-GUID: epd_anbIQ1cKMAdDNmlATPrRySZSN6gd
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695c9989 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=S-ec_UsR21Fgmf9DpLIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: epd_anbIQ1cKMAdDNmlATPrRySZSN6gd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060041



On 12/5/2025 4:59 PM, Konrad Dybcio wrote:
> On 11/20/25 7:24 AM, quic_utiwari@quicinc.com wrote:
>> From: Udit Tiwari <quic_utiwari@quicinc.com>
>>
>> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
>> runtime power management (PM) and interconnect bandwidth control.
>> As a result, the hardware remains fully powered and clocks stay
>> enabled even when the device is idle. Additionally, static
>> interconnect bandwidth votes are held indefinitely, preventing the
>> system from reclaiming unused bandwidth.
> 
> [...]
> 
>> @@ -90,13 +93,17 @@ static int qce_handle_queue(struct qce_device *qce,
>>   	struct crypto_async_request *async_req, *backlog;
>>   	int ret = 0, err;
>>   
>> +	ret = pm_runtime_resume_and_get(qce->dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
> 
> This is quite new, but maybe we could use
> 
> ACQUIRE(pm_runtime_active_try, pm)(qce->dev);
> ret = ACQUIRE_ERR(pm_runtime_active_auto_try, &pm)
> if (ret)
> 	return ret;
> 
> and drop the goto-s
> 
> Konrad

Thanks for the review and suggestion konrad.

The optimization you proposed is more of an incremental refinement 
rather than a functional fix, and I’d prefer to keep this patch focused 
so it’s easier to review and backport. Would it be acceptable to merge 
this as-is and handle that optimization in a small follow-up patch?

If you consider it a hard requirement for this series, I can rework it, 
but my preference is to land the functional PM support first and then 
iterate.

Best regards,
Udit

