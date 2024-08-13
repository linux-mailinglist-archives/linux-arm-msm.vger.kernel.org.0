Return-Path: <linux-arm-msm+bounces-28425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFBF950D8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 22:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2F6C1C211C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 20:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4A31A3BC8;
	Tue, 13 Aug 2024 20:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WWWHSvnI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53037A953;
	Tue, 13 Aug 2024 20:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723579513; cv=none; b=YsX46KFEP4NzRQQq+S8amMZKbnSWlAJsRDsvLPnSCCjqxqMVrU6ltv0tkO2EXEE54L6eUXp1Th9J7L1rMbiaUUD/5DFKRNPwFVHAWljbiQK2M4+e4GKXhcDF4Zf8FzXSETJQcOyxXkNPt60K2Et6fJsZJmQv+lSSNSRptCO8bGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723579513; c=relaxed/simple;
	bh=kIy1yq0X5WjGMSdd+FDorAYstfMBeDZ9v9rwsLZoH/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aBAdUfTdph604ylWcPRyy0WQ3urA0UrsQ1gvKPaDENBuU0x/kj7IXb2wiREfahzlo6cSyo67LkG2mFU1nIgHdjobUeWvA+S0sy6KaABXuKGHy9smcY0dTliOvvhMTVAnMHcilt46K7CGlDw3FGU7q5s6DTLLwQJJo/dPy7oHvNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WWWHSvnI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DCjrdP017459;
	Tue, 13 Aug 2024 20:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIy1yq0X5WjGMSdd+FDorAYstfMBeDZ9v9rwsLZoH/E=; b=WWWHSvnIoJTWbMP7
	LKsN5mIAIrGd6AVM6psREMMhaCl7H+oOdu4SiEKb6dlMsfYpqv7r00zBpQqXWi+/
	UyDfzbvKR6d/HYXU2fXi89oF8JVXgWl3R19KENffeqxpIweIxx+YSW8WvlKeRlt7
	qSmQqtyAbxK131SBBTYAVHseMXqmh6W5gnY5luUJwj2Le7m5PPM3X4vfc7Fyoqn8
	joVrTsVbR0/f2218zGIO5YQV+cUN1wW5B/SfkjD8uNk8Sg6UZpG4SsHsE596FXAw
	AbHK2EdPxYHQAqI6ojpKoLg3IdKchQD6+zm6iWFMMvQREttDYUb9nJDkyOCwIPiG
	gAfFOw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1d4h0b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 20:05:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47DK55UT016756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 20:05:05 GMT
Received: from [10.71.108.157] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 13:05:05 -0700
Message-ID: <42659c55-8e99-4a66-88d9-357fbb8d7a2d@quicinc.com>
Date: Tue, 13 Aug 2024 13:05:05 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: sc7280: Update eud compatible
 string
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Souradeep Chowdhury
	<quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Elson Serrao <quic_eserrao@quicinc.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <20240807183205.803847-1-quic_molvera@quicinc.com>
 <20240807183205.803847-4-quic_molvera@quicinc.com>
 <b0058c31-d416-48b5-b6da-5bbdf493febd@kernel.org>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <b0058c31-d416-48b5-b6da-5bbdf493febd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ogWRv5ZzUClThfSDj4czyh09JrRZ1rYb
X-Proofpoint-GUID: ogWRv5ZzUClThfSDj4czyh09JrRZ1rYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_10,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=662
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130145



On 8/8/2024 4:03 AM, Krzysztof Kozlowski wrote:
> On 07/08/2024 20:32, Melody Olvera wrote:
>> Update eud compatible string to reflect use of non-secure eud.
> This does not match diff at all. You say here something but do something
> entirely else. Sorry, that's a NAK.

Will drop this patch.

> Best regards,
> Krzysztof
>


