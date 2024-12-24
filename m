Return-Path: <linux-arm-msm+bounces-43250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 006DE9FBD05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 12:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E8401885282
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217E91B414D;
	Tue, 24 Dec 2024 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TQW8oe/1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5942D1990CE;
	Tue, 24 Dec 2024 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735041236; cv=none; b=SHpAMv4J5zAW47xuyI21JqQubE950G052OXdu1VCtHtOXRz80YwE7m6T7irG+NonoEDTlyfJxKl8v/mPpCANiplglt3M1ojFd6ZmyU2IWgObdw0Hryb/n1Tizl+gSdsHAMWV4R8OIJiRrUZF0VXidwWGFFX1VHHe0WN+ncX02G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735041236; c=relaxed/simple;
	bh=SFURuJRo1BAs5gciDwywHd4wjw3RroWFHqSn9AINPvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iz2xBeYY043HuqsntDpNYR96ezbV/6kZzYFwRFN+9rm4V/Z7ZJiuX6CuK0xqk8FCQOJKtmgjhutm1ofZmZ/yO98mj2B3s/6GlQ/g68UPo/fD+y184xRj7HVL9rFSh/mZleLunqsj0DtSrCYCXLenvQzVH8NPv4aqYa1ptpATLHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TQW8oe/1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO9ZaUt007862;
	Tue, 24 Dec 2024 11:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDg6oN1OyIP9bHy27NdtIJIUQEneZnd+hcIOiawXXNY=; b=TQW8oe/1A3AZJJ0d
	3BIMNw2tn3kQ3oobMhcO6AlR8mkZPyu/tStlws24gw7hioJTgxUA6cvQv9mjnqLf
	MlfvzZbBAk8VajbDaJ0SvJh6WFnHatcBshaqKx+/E0QgGHuKdehFhNdPBobRTEDx
	z67GYU0RifjwLo2GGMUvXZ5YfY0nHufns2pzr6q3/bjVlyYMnXsKLLk06xakOoXN
	d30yPflxBrR6DTZVZvYg3Y3tkhjKWsNv7kXZcNhK3xE8Sfkn8t0xCOGVfZXB+ihC
	NFEZKdHOj7O6pESK8BKlitYP7UWYuDdsXSdizwxPdNL2t7DZEpFp8mseOUMiBXqf
	EM9ZCA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qtf88qrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 11:53:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BOBrf22012651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 11:53:41 GMT
Received: from [10.151.36.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Dec
 2024 03:53:34 -0800
Message-ID: <ff9ed09b-61ca-52c5-a0a1-4102f35b0849@quicinc.com>
Date: Tue, 24 Dec 2024 17:23:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, <richard@nod.at>,
        <vigneshr@ti.com>, <bbrezillon@kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_nainmeht@quicinc.com>,
        <quic_laksd@quicinc.com>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241220093029.z4zsr3owdnqll2vg@thinkpad>
 <18af7a68-42a3-6a82-c1b1-38ba8b06ed78@quicinc.com>
 <87seqdpknc.fsf@bootlin.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <87seqdpknc.fsf@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KAAU4yjnbnd7btV7HVK5Lf6Ssspd1fq8
X-Proofpoint-ORIG-GUID: KAAU4yjnbnd7btV7HVK5Lf6Ssspd1fq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=653 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240101



On 12/24/2024 1:39 PM, Miquel Raynal wrote:
>>> Do you plan to respin this series? FYI, these are regressions, so
>>> should go in
>>> early as possible.
>> Waiting for SPI NAND series patches [1] to be merged (raw nand change
>> patch 2-5). On top of that will repost these patches.
> 
> When there are comments on a series, the entire series usually gets
> discarded, so it is now out of my sight. If you want the spi bits to be
> applied, it must make sense to have them alone, but you can send a new
> version of the spi bits alone if you feel like the raw nand patches
> aren't ready. But otherwise please fix the series and send a new
> version.
Sure Will create 2 different series one for raw nand along with SDX75 
bug fixes added and another series for SPI NAND support and repost.
> 
> Thanks,
> Miquèl

