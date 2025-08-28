Return-Path: <linux-arm-msm+bounces-71167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B115B3A63C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 18:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF2377C7EF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 16:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E089322A2F;
	Thu, 28 Aug 2025 16:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GCQAwKkR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25BF2236F0;
	Thu, 28 Aug 2025 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756398511; cv=none; b=KrQw7/DtnHy5i5J97cwtGGfz/vVnNxUeH3MDDr49JVu2AuO62hxaBwD63c0MMgN2L05tjSAKi3orb/ILIrGaGOj3T24Ns0imoH4p2DVAj/glDbIU9n1hj70glxsCu+lXb5+6CB+YmSL7MLMb6cATdYKAvX3gzrMHK0Wyk57cJ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756398511; c=relaxed/simple;
	bh=UBajhvaeRHxoiwyC/7OeQSLuiuKddhveqaNdcfszHRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KbKGsB7lQnPqi1zLlWWC8EMvBQ3PHiYPlrsusMx/PgvTBcNi6KscqfiKvANtJrfS2gup7IFUEjsge44tLAPRkytDQWU+FE7kBrmobWEZ48VEvbI4WrikyNcC2FV9wq6PVcKXLCa75534O3JEMezS9SVoaV8JAUVA1tMoRLnNjww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GCQAwKkR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SELYqs015246;
	Thu, 28 Aug 2025 16:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z9xujkxDI2+ZlBqeae4zLl53ypgiJX+WAJVI7Qh/lCU=; b=GCQAwKkR+k6o3K61
	yer7eVOqlNCKp+Ghg/KrQgIC7C8VlTfUbQ0/l0ptnvRbgw8ZErOrtDbN/T6dS43z
	D/NdCXBJrKtWhkpW8Xx2VzeAa5GAripl2o+F47WS0gnZ3FvUzrMMsHLE66zAVPk+
	GjpOL0/p0BGOmZ52Slwp89YpDw0j5Ua/R64qDAXgBqfN0I/DlZZ36MrtDhrv4Zk7
	fClCjbHtPw+3nz/gm+IyVK9wZngGvelZ1SRNPOozYUgLkJt5tVw8EufdEtcVoh/Z
	m/cXurWSK/VcokamxaJ46S8c4rh3uDr1Bmt6o/cEhzSWkvjjo57mdBCxJvkmuOkb
	ME993Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we8m74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 16:28:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SGSGHf006381
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 16:28:16 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 28 Aug
 2025 09:28:07 -0700
Message-ID: <3ecb49c5-0334-49cf-adaa-de5222602ec7@quicinc.com>
Date: Thu, 28 Aug 2025 21:58:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/4] ufs: ufs-qcom: Add support for limiting HS gear
 and rate
To: Bart Van Assche <bvanassche@acm.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
 <20250826150855.7725-5-quic_rdwivedi@quicinc.com>
 <db0a8b86-b048-489b-9b23-6987f48e9419@acm.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <db0a8b86-b048-489b-9b23-6987f48e9419@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OZa3xob9yTEbKJ8a94WO2jZ-yLRy5MRt
X-Proofpoint-ORIG-GUID: OZa3xob9yTEbKJ8a94WO2jZ-yLRy5MRt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX84xjxTih89xG
 KV2bXXkQEIErrk6pNK9cPH+mBCg7Va5K8sjIwTk2VR/YrGGbe2mTmGf2XyClTPWpML39TshTlg3
 2oEugC0C/ipyQ+mp5suX3ra7oheG55xOLWc1T+JsFiJSEN1m6qkzjo4aFpOlGm6IGEqizV6uh0j
 o1jzkZlk4zKflKNOLq65Xwn5SHTUoJw/YCpxgDF4iFFJ6C+CXhXkMJirY4r88+Qgqselst3mSFM
 lBenIOksDKSrG+3n8blifO7BlEAQKAQi+hQbhCXf3GDGoTe4XK3vZ9hD7aKKwevjA3rd8V5kGZo
 cuakTiDEncGKGrmc7Yss4qp9P5Uw33RBXwzXVmE73NMaJNgPtGi7ItcOtD59JImyCNjQvjw2/Xa
 FsX/VVoh
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b083a2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=bAcsrgZfspbOT5EUBz4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033



On 26-Aug-25 9:07 PM, Bart Van Assche wrote:
> On 8/26/25 8:08 AM, Ram Kumar Dwivedi wrote:
>> +    if (host_params->hs_tx_gear != hs_gear_old) {
>> +        host->phy_gear = host_params->hs_tx_gear;
>> +    }
> 
> The recommended style in Linux kernel code is not to surround single
> statements with braces.
> 
Hi Bart,

Sure, I will update it in the next patchset.

Thanks,
Ram> Thanks,
> 
> Bart.


