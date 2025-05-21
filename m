Return-Path: <linux-arm-msm+bounces-58857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A200EABEDCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 10:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04C7F3AC91F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 08:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EACE20D509;
	Wed, 21 May 2025 08:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ge8KF0V3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B241E7C27;
	Wed, 21 May 2025 08:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815867; cv=none; b=iU/6+k2/s9rLQqzzpi+CtqyWY8jCeLZvWfPnGNhTlbkCPjS+XFjjUf1aJnGxm9v8e6Bv6dkAdO99r0G8KvVjneMGhJ6uqhJ6/xRDXjsRLFB8v8ljXI9ucWeIrVsQ5pE7sg2otBTxS9wXVVgcDRm7oIEGLx6gKG7FgLgZidJeBYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815867; c=relaxed/simple;
	bh=XiJxLeC24/pKHi9fOtdze4fw6C1A0nz5VfG+RetSoRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G7JXnd9cGuEybS0DjLG20k3A4i3e3DItr0gp+Vk7R4q6qmfd6zMgW6ZjOgY7XSnTYP++LcdFq1T4S3MmRaWy2P/1oFJzc5napyxPj5ipAsE2cXkNr+UhGzy7gw19JCRgrv98kifDLzJ1eEBZBn/dhmhK9JJ350mk77mocc070Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ge8KF0V3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5qkhQ000753;
	Wed, 21 May 2025 08:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIBpob/UJr2FLrefJuVrS/wLOfDj1n6dK1C+cBL9UBA=; b=Ge8KF0V3wldfqWW9
	2jsdcgn6DxLBEKK1rtVFUY9JQ1km/mFeGfjqdzGOvIJQancpEnO01jFzBzvBCWML
	GGZ3O1viqJq2SvgEUBf3ObS4IGKi9eGxtQaBeZCbPaxHmTByh0PmvQ1OTgz2eNea
	1ZLMGWUzVBOZH1bJN5xY8YEvcpIAK+C8rt2eXVjyVfntUsEMItqvZf/MTZh7llBh
	KDxZxJbQC/fzHc65PV4z0Hw46dnYZapQymr8Z3ksuwBaUnCwM3JfRD4ZNh8ewIAT
	czkT2qSo61fhFrV/HN0c5nvnA6XgU8evjmKyBEKCvfaj6yruwhi3k4geAFnMUan2
	++5pmQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4t4vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 08:23:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54L8Nulm025209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 08:23:56 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 01:23:53 -0700
Message-ID: <d7d85aa1-6f27-4557-a5e6-60bcfae32908@quicinc.com>
Date: Wed, 21 May 2025 16:23:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Bug fixes for UFS multi-frequency scaling on Qcom
 platform
To: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: <quic_cang@quicinc.com>, <bvanassche@acm.org>, <mani@kernel.org>,
        <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <neil.armstrong@linaro.org>, <luca.weiss@fairphone.com>,
        <konrad.dybcio@oss.qualcomm.com>, <peter.wang@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>
References: <20250509075029.3776419-1-quic_ziqichen@quicinc.com>
 <yq1h61elobo.fsf@ca-mkp.ca.oracle.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <yq1h61elobo.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oSHkT2t1Q4h5FFEv_vtrxOBkW982KGXb
X-Proofpoint-ORIG-GUID: oSHkT2t1Q4h5FFEv_vtrxOBkW982KGXb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA4MiBTYWx0ZWRfX3v9zHqsnvPay
 M0bxx6jJdtuj8HUP1HXdxBr5/Rv5lvIy3Kj1IXWhCwGco4sL5o3Mw99DTkEbiG2YNnvMFXoTvpE
 IlkFu6ESbVbmj4YA6gW56idQbBixq7USAe6dlGEdiFPHqyN2lrTl/pbj6NfGQpSK7CbSa5kGOxl
 F8AUcwOi6ozcJ9kuIXmXYpjDsmOI6u7pdDnA6TZ3WfJONEF0vSCBEUV5ARZYGO4LTgSPx5uEDqv
 PN7rKeAk11WRd1dkdGCDXflSLeEle5Q3s4PqeSXrC7wBhiOgJHVAF2ac5/vMnPfhlua/RXlFljy
 TUQYfpk9Ono+rauws6Fz2LnrUxtH1wEHr09yC+MDnRu9rHgbqage+MCL/5WsdI3G4nyXaQkPff0
 JvNRbJ3VHGLdLmquYMztMGb4g48nRW7kgoFP8nDCLNukuG0bkS76F2t1psVn9P5FABBLWLWe
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682d8d9d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=6H0WHjuAAAAA:8 a=KKAkSRfTAAAA:8 a=FzGy5eBrWT_g2xVYw_wA:9 a=QEXdDO2ut3YA:10
 a=Soq9LBFxuPC4vsCAQt-j:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210082

Hi Martin,

Thanks , this series need to be applied since 6.15/scsi-queue as the
series UFS multi-frequency scaling was applied to 6.15/scsi-queue.

I will updated a new version to rebase it to 6.15/scsi-queue.

On 5/21/2025 9:58 AM, Martin K. Petersen wrote:
> 
> Ziqi,
> 
>> This series fixes a few corner cases introduced by multi-frequency
>> scaling feature on some old Qcom platforms design.
> 
> Which kernel is this series against? It does not apply to
> 6.16/scsi-queue.
> 
>> For change "scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()"
>> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on RB3GEN2
> 
> These tags should be applied to the relevant patch.
> 
>> For change "scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq"
>>             "scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path"
>>
>> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
>> Closes: https://lore.kernel.org/linux-arm-msm/D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com/
>> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4
> 
> Same here.
> 
> Thanks!
> 


