Return-Path: <linux-arm-msm+bounces-50378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF338A503F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 16:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C68818840C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 15:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4358C1C7000;
	Wed,  5 Mar 2025 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C0lcNt+r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC8117583;
	Wed,  5 Mar 2025 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741190155; cv=none; b=L/HHcrsvtcYPxFx+fLRTCrT2E1xeh0JAYz1uwAMIFsKZlpIIq3Mrr+lS5lDAod3JX/VtV2RjWiNpb7PPTHlGAXvW4NPpK5eCoq9CSPrXAnNHNMOjiNeny7CFx3gAbVG7lzji34wekgZQe1+iQFmUKMI7SGoJHxTZj3uLHQVFjj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741190155; c=relaxed/simple;
	bh=wSi4NsrLXEqOWKZwt5ZSjZ0vy/liXqMnOy+vciBTxj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n9gg1MfoQu8y7vxNx2egyV+QEQ/ghZC04PLnKeoJjPmOJmVYtIxPGh/FVMXwouWancuKcdqH4+sO+D8HpTr7TOLsl+Ho445oZbXjYKLwAeK5ghiXXubVy2sMUH/IKBM41YF/h96bJBxlSC80d0eLkCeXgBPw0dY2fJsyalEkEDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C0lcNt+r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525AcJDe031396;
	Wed, 5 Mar 2025 15:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZgRpmaBZtbAqYDslfy5CjEsE76Qm+DsXoRMOfnvUBg=; b=C0lcNt+rkPgDZEfq
	FIL0oT48F+3UxsdV8e6MyNsYlc1mH1sPu1iMtwxRSB50aKVhbZ45+mMj07FkzoYg
	LvfkQGqLU1uvizclJ3HYHtyXgBosf1PBKlR9sE1vA5ZS+PokrpiXKFFC4l41xqpW
	YJrmqrGvL0IZy2E0akGSiF9gbYaCfkg49JqhsafXavYgYKXXRtQIcbi41qQwPNMw
	5vqZoeFVOYIhwEjvitFqXq91BfHqpPFr35MtfXSgVy5d5iDKVokoC5vjU8LKvjrS
	Z6LLKNSS61ViecmA27k98qe6qw3M18gA3ISPX3sERtURg8+ZMikH/Q7G66sHXBSB
	mWlgYA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t5vkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 15:55:35 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525FtZeo007599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 15:55:35 GMT
Received: from [10.216.60.184] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 07:55:31 -0800
Message-ID: <ab08fdfb-9268-4d32-bf3a-552b0f5720a4@quicinc.com>
Date: Wed, 5 Mar 2025 21:24:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rpavan@quicinc.com>,
        <quic_sharathv@quicinc.com>, <quic_sarata@quicinc.com>
References: <20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com>
 <7jupetl37t6nshmme5raxavvbjo3vo5eajusroh6j3ccdxnpo5@7qaz2nckghcf>
Content-Language: en-US
From: Kaustubh Pandey <quic_kapandey@quicinc.com>
In-Reply-To: <7jupetl37t6nshmme5raxavvbjo3vo5eajusroh6j3ccdxnpo5@7qaz2nckghcf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KbTHDqhUjolITGTBZ6o82JkKqNjO52WC
X-Authority-Analysis: v=2.4 cv=KfMosRYD c=1 sm=1 tr=0 ts=67c873f7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Fs2MnD1DZPIK8juJ1mAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KbTHDqhUjolITGTBZ6o82JkKqNjO52WC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_06,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxlogscore=611 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050122

On 3/5/2025 2:28 AM, Dmitry Baryshkov wrote:
> On Tue, Mar 04, 2025 at 08:51:33PM +0530, Kaustubh Pandey wrote:
>> Add IPA nodes for Qualcomm qcm6490 board.
>>
>> Signed-off-by: Kaustubh Pandey <quic_kapandey@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> index 9209efcc49b5..ba47786d6474 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> @@ -19,7 +19,6 @@
>>  #include "pm8350c.dtsi"
>>  #include "pmk8350.dtsi"
>>
>> -/delete-node/ &ipa_fw_mem;
>>  /delete-node/ &rmtfs_mem;
>>  /delete-node/ &adsp_mem;
>>  /delete-node/ &cdsp_mem;
>> @@ -515,6 +514,13 @@ &gpu_zap_shader {
>>  	firmware-name = "qcom/qcm6490/a660_zap.mbn";
>>  };
>>
>> +&ipa {
>> +	qcom,gsi-loader = "self";
>> +	memory-region = <&ipa_fw_mem>;
>> +	firmware-name = "qcom/qcm6490/ipa_fws.mdt";
> 
> "qcom/qcm6490/ipa_fws.mbn". There is no .mdt in linux-firmware.
> 
>> +	status = "okay";
>> +};
>> +
>>  &mdss {
>>  	status = "okay";
>>  };
> 

Sure, thanks for review.
Will post another patch with correct format.

Thanks,
Kaustubh

