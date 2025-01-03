Return-Path: <linux-arm-msm+bounces-43913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F01A00DAB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 19:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A538164944
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 18:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7B51FC105;
	Fri,  3 Jan 2025 18:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XkE2NMvP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446CB1B983E;
	Fri,  3 Jan 2025 18:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735929309; cv=none; b=USkSdmEF6Vube/eWnCNflU839bX95i9/qxHJG3T9fho4CRptUbI2FZoItTlgc8qFQVuQ9wsCJZFj4mGY1EV31ar+ZBBTBfoVFzJj0ruoyrqowlz9LO3q7F2yv+c0AX9n0eKfDKozvMY1ZqSvy2tUzPQ8UfsjGB+gJuRnRryGiho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735929309; c=relaxed/simple;
	bh=cg13nGk+pd6M8lZasEF4kw2CMaV6aeKRyqtwNvZ348U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QSbOXwsWw0Es4ZZoYj6QwqdL/N4XPe3iO/F5crkpntu60pMqSsML7ZUs4pIKJVbVazfYl07p7fxYGCMYHIgUPowCh45/O5pdrqJP16lso8tWtebaxVn+GDC3zeDJ79We0TkRk7PZ5fDabjXahbLeBeHyfj0KfF4kr0y4Fshzoi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XkE2NMvP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503C4aKn022482;
	Fri, 3 Jan 2025 18:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s2MGKo8sMsPhMxsdtHXP7AtIS6Sa2FVTH1PPY0Cs3RY=; b=XkE2NMvPk1dgSEDZ
	/hzcrBJSAixVu7RjoXoeht1fBio2xuf6GHEFK9IorlfTK6UddZFeJy3zBIfcE46n
	/e2sD5QaThmesxgD4ZS+sQ5OvZcdPY/xVYe8Ack5qhJc12TOcYji8AKYAu/2tY2M
	65VCxWJw77GdJN6tKrPvw4m0JOk1OJHpk8uH6wrOtTpp+3YLyeDfhPRB/c5FqJtP
	whZsLub6U3OVz8z4P0fZXQfi2Ff3O3kRSYHgCqKRc+r8BwVKr3XdbUx3WMt/jnWA
	o7+Ms+UumZRHnP5hODO2rT00D3Zc566pGIO8w58FhlnIDBk9ZF9ipjAW/YpWuy22
	Dnf93g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xfk3gpnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 18:35:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503IZ2lc018990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 18:35:03 GMT
Received: from [10.50.14.170] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 10:34:58 -0800
Message-ID: <280bb40e-e3f3-484c-95a3-63ce0c7ffdd0@quicinc.com>
Date: Sat, 4 Jan 2025 00:04:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] dt-bindings: mailbox: Document qcom,tmel-qmp
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <jassisinghbrar@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <dmitry.baryshkov@linaro.org>
References: <20241231054900.2144961-1-quic_srichara@quicinc.com>
 <20241231054900.2144961-2-quic_srichara@quicinc.com>
 <3ad8c99a-d722-458e-8783-951018e2a7ba@oss.qualcomm.com>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <3ad8c99a-d722-458e-8783-951018e2a7ba@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QifgEvRtZb9wx9Xa_aPGrXamVX8jHUf4
X-Proofpoint-ORIG-GUID: QifgEvRtZb9wx9Xa_aPGrXamVX8jHUf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=736 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030164



On 12/31/2024 3:02 PM, Konrad Dybcio wrote:
> On 31.12.2024 6:48 AM, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> TMEL SS provides different kinds of services like secureboot, remote image
> 
> Could you expand the TMEL acronym?
> 
Trust Management Engine-Lite, will add.

Regards,
Sricharan




