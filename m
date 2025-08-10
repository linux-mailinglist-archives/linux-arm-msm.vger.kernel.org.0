Return-Path: <linux-arm-msm+bounces-68240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F947B1FBD9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 21:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4766D1895CF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 19:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0237C19D09C;
	Sun, 10 Aug 2025 19:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cvJ+/Vdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9D81E515;
	Sun, 10 Aug 2025 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754853393; cv=none; b=k5Zg9XPLiiO00f4aLjn/FdR6qqr4sNfvOfMHd9Nx1P+WQHOXhYZWrrfKtXYcn/tAzmCwQuvFu8VMvS7/Xdzh4/ptbaCA13jXUPCvfeTEyZy1kOuQASwq+lZLurKoRBQVDKdxq1+GWd4e5cGAETz4plFZTba8nf6qQDwcsMsWXIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754853393; c=relaxed/simple;
	bh=Xb9tycNB9p5Q6NvE/8a3k8CIomgb8P1+goDjyPYBESY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OuqAhFlTE+qLTDtHbPn3P5YzEwyTQeiQkqVnoDCXlIFu9qNhZwe7IA5nXaUb8nY9QOS3CLz2nux/p5bbnMEo/4Pr+109szQGiVdQ37yRbLh2/AjeuKfbpQrqZqB+oMp70E633tvzQ8U54jn6EzyHcFx2enL73FpNYIr8bnXTbpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cvJ+/Vdw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57AI0fuG028125;
	Sun, 10 Aug 2025 19:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ozIY8WvBwqxK3xwEYAdMoffurOJUZYYSHvkeKeqjDMc=; b=cvJ+/VdwarB+07Ch
	6GDxByhK3woxrVvKiYojAJ8sMMUPCcljQqq9NnePrW3bPViyalYcQviIlhSSNCJG
	+8H23P5guBiSPg0hnyTFqJF6if/ldXairItUHfMF1S2XH9kDMeL31Bt2rxFQP2P3
	GcuPzqvauO2WrmuOt+kXckLG6WSkkCAAlyESklVBVyVimSMsccui4t8OKBhUdPA5
	ZbcIU2BDsV57PuJAB0RrP+X/2eq6xnauD5gahSDLLrQuzmRUf9FQeO6eDaQEoa7l
	oBRmLHZv31rBNvZ0PDyr6ObHFVWkrZ5N6TEt0yM6YiEg1y5DMYwpVAIwLW+4F6jn
	CNrNTQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmab0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Aug 2025 19:15:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57AJFoI8029094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Aug 2025 19:15:50 GMT
Received: from [10.216.19.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 10 Aug
 2025 12:15:46 -0700
Message-ID: <4ce3b453-1941-42ac-ae03-e66c09f40852@quicinc.com>
Date: Mon, 11 Aug 2025 00:45:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ufs: ufs-qcom: Fix ESI null pointer dereference
To: Markus Elfring <Markus.Elfring@web.de>, <linux-scsi@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Bart Van Assche <bvanassche@acm.org>,
        "James
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC: LKML <linux-kernel@vger.kernel.org>
References: <20250809134445.19050-1-quic_nitirawa@quicinc.com>
 <f9dfcc92-4591-41bb-973b-86d12ca37e19@web.de>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <f9dfcc92-4591-41bb-973b-86d12ca37e19@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfXzxDVuCiTJpyD
 pFoI4L1LzDARe9gCTGqN6pMHD7Fa2TyDOtrFhzuBpCyJxdsWp40vy4BcufhAfJNEz+asUMbZfY0
 qgxrX7q+5pQu11T3taqkNsY0yzWxxG7nGZeJogEbv7biH224sgMgVqFSxGlK0mM7m6KUv6o37Cc
 DdTJokRdjQwXVbUEuO+UesxWKOSrRujfdRXwGr5p+9b9xxybqQeJ1oll3Q+sjy/S3y+VeeZ+xvD
 ULwN2qZkt9usmhpLjLvO1g9Sa37SYUn7ImgxrqjQnwk3iJmSNiPurjseE+iGuSHyUdjJ5X5FLLT
 68+Qcv7alhkiweqb25ht+VFsEKQ0wACf9axfQJyjpdqdG77Xi03Umbendzs2t+e53K6TGh6XmWH
 Dbqqcp4P
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6898efe7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=HzWNzFUQfMb5d4qv6N8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LnelRXfXVI-dNVbs95V_RgZYNLcejWrA
X-Proofpoint-ORIG-GUID: LnelRXfXVI-dNVbs95V_RgZYNLcejWrA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-10_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1011 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035



On 8/10/2025 5:30 PM, Markus Elfring wrote:
> …
>> Fix by restructuring the ESI configuration to try MSI allocation
>> first, before any other resource allocation and …
> 
> How do you think about to add any tags (like “Fixes” and “Cc”) accordingly?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.16#n145

Sorry, I missed adding the Fixes tag in the commit message. Thanks for 
pointing it out.  I’ll make sure to include in next patchset.

> 
> Regards,
> Markus


