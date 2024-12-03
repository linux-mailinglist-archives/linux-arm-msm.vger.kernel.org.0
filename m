Return-Path: <linux-arm-msm+bounces-40067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E49C9E1A60
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 12:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24011284FFF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 11:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6F51E25E5;
	Tue,  3 Dec 2024 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I8haX6bM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BFA1E2838;
	Tue,  3 Dec 2024 11:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224134; cv=none; b=NPpbKawt6KQu5TAxum2DUJXBMYEo0srhrkbesukA+SlDdqrigd61LxT7XSOt1bgjPfn1aG5r5FkEF4f/hVIK2bw5JqQ+r/TMCDOCULJT8rkQNu5JgBjMNzBk1gH+1/DQU5G5HfpxJnfAQwZiSwmlz7PnxNW3RCNQLDAp8JCNmEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224134; c=relaxed/simple;
	bh=R5MhqaBE2PQVkdtI4tlW1w8mTOCQqNJGuGkhLYLl57Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T85PECHrsKQiJaC0JM91geVtHAFhsH++xPae/Of1RhX+m+Y1lZ64TbMsSETkCC2XfAJ4yiIG/gjiE0vPG6MnnrVK2pZzSOukKGbYOfjIrE0eZ93Op2UDLDxlgbSEjBvnXfX3+PUkp4+DapFx8IKEBFBS/4WsQpD3HPGqdlq2ybU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I8haX6bM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B34BwWg032204;
	Tue, 3 Dec 2024 11:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Utp8wn+oiCv6KEgRhVjryk61jbXzATW0Zd/tGlfn4jQ=; b=I8haX6bMgAhHWGhF
	5KRxDdKyCxLB6Wqk1Xc9PLix2Z/UJSlEGyK9Aj6pzRNzOoNEAglgDyyHVZtKwokc
	vrS63DzzGp9nWuLb2E7UlQhOx+T2j88ESQ3iQl6ICjtikj4mB1ASylI2Aj5a7hZz
	hf/8OQGT5rXH8abuIp4SexxKqQ1lnELR+MBlO+ZFk1b0BIFnLa7Dn65qv/1J0ILi
	rbgsUSLeFu8qQ2rO1Pg60ZQZApDLeW9148mtgHRkSfnnCKIGs2XlUNgVEFkGCgR4
	XEubjNwrFJS3uLwl1Ef6aeLnOY5nuqcQF36nirrjzPgsCgkuinE0GpADXWpBqTWG
	TD7wjQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439trbh2ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 11:08:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B3B8hGa011594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 11:08:43 GMT
Received: from [10.151.36.201] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 03:08:39 -0800
Message-ID: <77a00ba0-eb28-49a3-89b2-789b34502e8f@quicinc.com>
Date: Tue, 3 Dec 2024 16:38:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] QPIC v2 fixes for SDX75
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <manivannan.sadhasivam@linaro.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <quic_nainmeht@quicinc.com>, <quic_laksd@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
 <877c8i6nbi.fsf@bootlin.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <877c8i6nbi.fsf@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Tl5joUrkQJ4RkMGNJsZD9XONOT9MLWwE
X-Proofpoint-ORIG-GUID: Tl5joUrkQJ4RkMGNJsZD9XONOT9MLWwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=718 mlxscore=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412030096



On 12/2/2024 10:20 PM, Miquel Raynal wrote:
> 
> Hello,
> 
> On 19/11/2024 at 14:50:56 +0530, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
> 
>> These patches will fix the following:
>>   
>> 1) onfi param page read which was broken by exec_op() patch.
>>
>> 2) Fixed offset passed to BAM from QPIC base
> 
> Would you mind adding Fixes and Cc: stable tags to each patch?
Ok, will add in next revision.
> 
> Thanks,
> Miquèl
> 


