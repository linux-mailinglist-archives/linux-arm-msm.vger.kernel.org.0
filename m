Return-Path: <linux-arm-msm+bounces-37550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B26A9C4EA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 07:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA97CB24490
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 06:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C92A2038CF;
	Tue, 12 Nov 2024 06:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J9875zWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E826E19EED4;
	Tue, 12 Nov 2024 06:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731392271; cv=none; b=FkSUhyOP/mRSw3Yv49rsCZZEV77DNaiLWBiaT5nIBoUGVIAUIdnVZJdkwZR/XDp07WCldZ5yj8Bbm0lPwASkKIkV9tnOytIOyLO6MvmQkDPfGj5rF2ki43swJuSQAK/rnAgS1f0vB0/ue6Xuuo7MlJAzpJr978j1jP17ZheZxks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731392271; c=relaxed/simple;
	bh=FjWfuxbaFsptLDDLdKjT29NXwqNi6LmI9HVJ+sz1XRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FBfpPkyd74P7MX5qbxKCh47bnk7IqSLJiWZctxwJzysBH+jM+OPzXrmBjwwcVgZ+duC1hYgRlYyRCZJlrmnyHnrDbFE5XVwaNGyeeLvSyZZ5ElrlP34wB1Ub5KMjTyQzu3cMjnWlnFy+wZ6mzEFVjbMS3CGseKNRCMJiunB2jDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J9875zWw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC1vdTm005745;
	Tue, 12 Nov 2024 06:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4b2Dl8YQKJ26ieLnPOJHIP3dB1v1fV6KV5TDF2LPOTQ=; b=J9875zWwz5VU/65U
	OL8srDVURyPfquSn3rPeC9ngTUpAETREbPLXmiKeEr9vnobTXN24wuv6Y9cx7JtR
	6mLx9Cncv+ODPQmFd0npk8WNtqOqVXlv4+Wk6xKjNc65zTb9nXSxV+5E6Cgn2EYC
	nd40xq3y1J7175nMsrsY67P8w4IaGCs3Gveg8+F9D2o93E5qIU00FRW44yS4mbRX
	s6R2lFCg6vsv1XpFKXXXeTlzZlibgXIkrAaToVV5RYZ/rz32eEk4J4LArBWwL6tW
	5kPCnkbxhc1qm3yRbHdzs0FLnlxGvjZR4LXQ8/UboQDFBFJhX2f6qb6Fq5RX7gk8
	0YEUJg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uwt5gg4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 06:17:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC6Hiol015524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 06:17:44 GMT
Received: from [10.206.111.70] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 22:17:41 -0800
Message-ID: <78e6ff6b-efe1-496c-a1fb-c9a0a4aba2d2@quicinc.com>
Date: Tue, 12 Nov 2024 11:47:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: enable venus node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241004-venus_sc7280-v1-1-4d7d8fd7e95b@quicinc.com>
 <kezh3lmysij56g2tjwwuas5r26ro5i777yxxitsdcjeg7zp67v@oknrdbkzison>
Content-Language: en-US
From: Vedang Nagar <quic_vnagar@quicinc.com>
In-Reply-To: <kezh3lmysij56g2tjwwuas5r26ro5i777yxxitsdcjeg7zp67v@oknrdbkzison>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gNoc8bsv_U6pjTkxOuoHla7nC6Y2Oyn9
X-Proofpoint-ORIG-GUID: gNoc8bsv_U6pjTkxOuoHla7nC6Y2Oyn9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=234
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120049



On 10/7/2024 1:20 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 04, 2024 at 04:22:31PM GMT, Vedang Nagar wrote:
>> Enable the venus node on Qualcomm sc7280. It was made disabled
>> earlier to avoid bootup crash, which is fixed now with [1].
> 
> NAK, there might be other reasons to keep venus disabled, like the lack
> of the vendor-signed firmware for the particular device.
Can you pls elaborate more on this? Any device with sc7280 SOC can use
venus.mbn which is already present in linux-firmware git.

Regards,
Vedang Nagar
> 
>>
>> [1]
>> https://lore.kernel.org/linux-media/20231201-sc7280-venus-pas-v3-2-bc132dc5fc30@fairphone.com/
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
>>  1 file changed, 2 deletions(-)
> 

