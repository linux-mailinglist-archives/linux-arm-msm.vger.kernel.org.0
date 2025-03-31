Return-Path: <linux-arm-msm+bounces-52850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1714DA75E08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 04:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E40C1889FBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 02:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408FF26ACD;
	Mon, 31 Mar 2025 02:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IvgCvv3/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B63173
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 02:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743389605; cv=none; b=E5wcbqDSuUnDId8QVprPIpUYGUlunLaqOuLg/SqQFdConr/mr8WHewE1xuxThOlf+moOTQ1J1Bj37Kd4OLN3Ui0BXSdXd9WCjup+dKfimGym2XFjw4rKKCGld1fUDohFExRN14DLEQP8q/oz8bPVTFxhd7RsiX4GykaeSUE64Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743389605; c=relaxed/simple;
	bh=gYBhyhOIKxWFfUlE0hWZEwSA+q9r3fM2VeOT4FMERLc=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=XXxLKh9at30p3+a0U1b7lm1jVlT26ANCLdcmGORhn832Ln33lrypkSR/0e8uuuGGwtD+ygbh3p2TAZ+Fpf2aSrfe9gliIAAX9jTdEkLz2992IpMHc05hA7BTwBaVatde3rEZnwH4FOlbtoS8jAER31kD4J4BuLcyDYlod1H4oEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IvgCvv3/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ULnOfq017377
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 02:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/3dRdPYbzhnM3HKXWukKd4
	smW2npn0pGodeHyDTUyEA=; b=IvgCvv3/Uh7AmSd6YVIBefZ0YlI3GWaticf4ku
	yvm0m8VoytaH5mpzIoBBw9jkmRBjBfErbT//j7caVYrVQvA1qfEmpz9NdxJUAs/G
	aDa1LztUrCxx07hLLQRwt+PnpGqj8d9GmC3D6kQi2zBoNRHp/G6MZvSwcgOqrw5l
	wHqunFeXFz+ZGf1lm9TC6JcT/vsIkbwdZkaGIfQUTX9IRmSSxvvwmaXuPItOC3fl
	TdKY579eq3yE279R51HOGZnmeaGttMJgxJaz12GYNc4gDZFnQT00Jz9tSVWRi9rr
	KoaW4PsB5+uLXIOdFjvTHTYPmWB+PEitirQNFfwteBA75kBg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86kkay1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 02:53:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52V2rLsD007613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 02:53:21 GMT
Received: from [10.110.121.93] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 30 Mar
 2025 19:53:20 -0700
Message-ID: <e423c878-3e21-4ac0-8d16-2cfd80213296@quicinc.com>
Date: Sun, 30 Mar 2025 19:53:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-arm-msm <linux-arm-msm@vger.kernel.org>
From: Trilok Soni <quic_tsoni@quicinc.com>
Subject: Summer Projects for High School Students
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67ea03a1 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=xoq66md7CG7LAzZO:21 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=etSyzPbsdeYKhqsjHyYA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10
X-Proofpoint-GUID: PgIIo6hF2A5UuLKRqYKW7X3QMc-ONMBr
X-Proofpoint-ORIG-GUID: PgIIo6hF2A5UuLKRqYKW7X3QMc-ONMBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=12 bulkscore=12 suspectscore=0
 mlxlogscore=580 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310019

Hello Everyone,

I am looking for some project inspirations related to Linux or Linux Kernel or open-source projects which I can suggest and mentor to few High school students in California over coming summer 2025. 

Few simple projects around Linux kernel can be:

(1) Open-Source Project contribution E-mail setup
(2) Documentation fixes. 
(3) Warnings Fixes 
(4) Build Improvements - scripts/python 
(5) If someone is really motivated then fixes around "C" code. 

At the same time, I don't want to get them too deeper into the Linux Kernel, so some other userspace utilities related programs are also fine.

I understand that LF has mentorship programs but they may be age-restricted (18 and above). Feel free to suggest and I am not fixated to ARM architecture only.

-- 
---Trilok Soni


