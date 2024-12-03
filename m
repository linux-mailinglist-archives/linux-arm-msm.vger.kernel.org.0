Return-Path: <linux-arm-msm+bounces-39985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 146869E1182
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 03:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE1A92834D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 02:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9795D14B942;
	Tue,  3 Dec 2024 02:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tbvml1Uu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A49913FD72;
	Tue,  3 Dec 2024 02:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733194441; cv=none; b=Eyfk2NIJHJi03tI5sRVV4aZtNs3nZiMAIe2x9sAgIen1FXUph5/9pbx2FPhM5z+Lk9X0aJE4KF7BM1ORCpUGKlhScL2h4ExSqnxtKHLb9+xcH2LxSsmgmF9EZtScQVrArJlFuVBqnzPhlMx7Bm52nEx4E8D/xFLxBV2QNuOcJPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733194441; c=relaxed/simple;
	bh=/n78SQE25gbc6nAYuyoM6bFU+IPUeTcPxrIzyvSYRso=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jgugd4ZQ7EHp8Bdd0ZAcdLl1J3CKJzp/HbJrZR/QW1UYemL997Xi9PWoF7Cm18t3yYEMZABDpNWb6zbJRKn/czXmjXlA5Dom8MpVC/P7gPAr/ZdjDQsLMXGO8QyRnn0IrR9aqg58UtLHJhdBe8Lk3U2jDJWjuc80y0m/ORKl47A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tbvml1Uu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2Jn2Wv003080;
	Tue, 3 Dec 2024 02:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GLslK4zAGreCqcP74WNR3iAq5lLYGiNSpTeBWci79pM=; b=Tbvml1UuhmwHsdIr
	1AqPbE9Qc7VwYm78QTa/IvZ+5yyNNDUQhnV5jsPG+ZAInxro0UvDVaL5C9ouBdjA
	45DKdhkYPxrQ3uHLKV7IbONUR3p5Kz541KIDOaFnAszcSVfE90sYRgMwhWEvZ1nd
	7HwpGDnn3faiS373ga8OdJKsZw73jZC0wn334KwXHXetxwnjANy+JvoeUK3yS4on
	ZRV2NAjWs49XQ592OfbVohKFJPj6kQ1hw91IfPzAsrfUKrZgxZQijXt+pFp/cL3c
	ETux+4IGVJmL9zJu1/7MJvTsFGAFGoV7m4zRI3yvDvDWraM9h9+3gHmsIZW8AI+9
	aI4kuw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437snqxp9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 02:53:56 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B32rtl5006747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 02:53:55 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 18:53:49 -0800
Message-ID: <264cd89c-317c-44e4-8db5-51a9190da04b@quicinc.com>
Date: Tue, 3 Dec 2024 10:53:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: move pon reboot-modes from
 pm8150.dtsi to board files
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, <quic_eberman@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com>
 <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-2-bdd306b4940d@quicinc.com>
 <gk4c75u22i6kmqlpv6p6xgv4xcmf6z2jyhti7ccj36gnref2l2@xpumii6ldxcv>
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <gk4c75u22i6kmqlpv6p6xgv4xcmf6z2jyhti7ccj36gnref2l2@xpumii6ldxcv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: V5Sx2CF14OSAL7aafiQVf6Oq-6KZ6Teh
X-Proofpoint-GUID: V5Sx2CF14OSAL7aafiQVf6Oq-6KZ6Teh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=559 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412030023



On 12/2/2024 6:12 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 05:37:23PM +0800, Tingguo Cheng wrote:
>> Reboot modes were originally managed by PMIC pon driver on mobile/IoT
>> platforms, such as sm8150,sm8250,qdu1000... But recently, QCS615 is
>> going to adopt PSCI to manage linux reboot modes, which involves firm
>> wares to co-work with. In this case, reboot-modes should be removed
>> from pon dts node to avoid conflicting. This implies that reboot modes
>> go with devices rather than PMICs as well.
>>
>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/pm8150.dtsi                      | 2 --
>>   arch/arm64/boot/dts/qcom/qdu1000-idp.dts                  | 5 +++++
>>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                  | 5 +++++
>>   arch/arm64/boot/dts/qcom/qru1000-idp.dts                  | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8150-hdk.dts                   | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8150-mtp.dts                   | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8250-hdk.dts                   | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8250-mtp.dts                   | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts           | 5 +++++
>>   13 files changed, 60 insertions(+), 2 deletions(-)
>>
> 
> Should the qcom-pon.c driver also be modified to skip registration in
> such a case? (Can be handled as a separate patch, no need to include it
> here / repost the series.)
Sure, we will consider this case in qcom-pon.c as a separate patch.
> 
> For the patch itself:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
Thank you & BRs
Tingguo


