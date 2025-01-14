Return-Path: <linux-arm-msm+bounces-44988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DC1A103F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 11:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 945203A1673
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 10:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264E923098A;
	Tue, 14 Jan 2025 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cHjx7Hkt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941CE1ADC70;
	Tue, 14 Jan 2025 10:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736850222; cv=none; b=CU6dZQJpavbv1bXH+4SkrJNOBN4Hna9UJVEjx8PGECln92JYIZTkwzR4wOi1eSZG6Qe+kwJ83dKXRkfddtizXNuGQK5xeogpP3yb+qleG3daR2DtQ5o3G/0HQJTSAueIsHgkkdOT7mdcCSqloz+j0CDty31jfcPKoNqiyq4VNkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736850222; c=relaxed/simple;
	bh=mh8qQCEUbbBC1etKbBWuJ/3IbAN/+zeBkWRYqPdXgSM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=vFELeTnKTXeA6bFaeDYY36MCIBxCjmCAXifjumTiAFK0we4mKgviD/WcPNpztT0jU45GbFLJFxrXuWolEVG3Zetk6VRMfnW4+JkWgmgxqPWYc0pYwrns2do1c9PIJFueQqqOEcpcjr117szy+nsn87FADMlBJ1OJuwNBa+6GLMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cHjx7Hkt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E7crI6019850;
	Tue, 14 Jan 2025 10:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1TSZ7H1zYZBfJdPHXjwOa+aKj3lVL+WIucrg31Sy08=; b=cHjx7Hktkk9v7h3C
	fmTKRLiN9oVubsIshn0OLeLh1vFqlUm16rJRkHCaqQH4jUTWtflQt6v1vn7wmU06
	poRuSMtZpF4NZNviEonmaQ0hZOba9feWJe+Y4vveWFfsEUx9w3g6hoz80qMs1I4P
	gkQF1YeIs5UHfhWeSJkVXC1URNsv/WdymwIO2WLowwa34IsrBVAUzwkA/D/g3dab
	nzc9uB6WWLXLF1XMRTL8GbaMMZhue19xnyyRSb4Uzme2ITCIaMBVxDuPtZ7a4nYB
	wbaXoDPG7g/wdLZ7ji5lEHOLNTlFYR66OQGPkF1+TBDoTAzCst8zdKDMn1oPQ2Ai
	f6RSGg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445kqc0beq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 10:23:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50EANZer010385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 10:23:35 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 02:23:32 -0800
Message-ID: <1336e1c3-6ee9-4a19-976b-0bfdc02fc8e6@quicinc.com>
Date: Tue, 14 Jan 2025 18:23:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: platform: Add bindings for Qcom's EC
 on IT8987
From: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
To: Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        devicetree
	<devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <Z2WxzvKRVcOz5d2V@linaro.org>
 <CAO_MupJ7JtXNgGyXcxGa+EGAvsu-yG0O6MgneGUBdCEgKNG+MA@mail.gmail.com>
 <Z2W2UhspMZNT1TRU@linaro.org>
 <c8677ae6-a145-411c-a221-02faa1ce809d@kernel.org>
 <CAO_Mup+YFAT5oFRGYucW5h_eGcfp4C5FzF20hM6xF=qMR1DdQw@mail.gmail.com>
 <23a29a97-4d0f-4bc3-a0bf-10b32cc4ea7c@quicinc.com>
Content-Language: en-US
In-Reply-To: <23a29a97-4d0f-4bc3-a0bf-10b32cc4ea7c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eXsFk1VhcZjkFqga92CvSTu8Ls4SmU6T
X-Proofpoint-ORIG-GUID: eXsFk1VhcZjkFqga92CvSTu8Ls4SmU6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501140086

On 12/30/2024 10:45 AM, Aiqun(Maria) Yu wrote:
> On 12/22/2024 11:07 PM, Maya Matuszczyk wrote:
[...]
>>
> 
> I have raised this topic internally at Qualcomm. However, since some key
> personnel are currently on holiday, an immediate response is not
> possible. Rest assured, the topic is under review internally. Please
> stay tuned for updates.

Just want to update the thread to let you know: We are working on this. :)

The information that can be updated here is as follows:

1. Qualcomm has a reference spec design for EC (Embedded Controller),
and OEMs are able to customize it according to their design.
The reference spec design may regardless of ITE or other EC vendors.

2. the reference EC spec will be supported on Qualcomm Compute reference
designs for other platform as well. This is irrespective of the
underlying transport (I2C, I3C, or any other Qualcomm proprietary transport.

Some of the main functionalities in this patch series appear to align
with the spec reference design. Therefore, it could be possibly extended
to become a more generic EC driver that supports a wider range of devices.
> 
> I want to personally thank you for your current support and efforts.
[...]


-- 
Thx and BRs,
Aiqun(Maria) Yu

