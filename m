Return-Path: <linux-arm-msm+bounces-68775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC65B226F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62A0218939F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CA4311C26;
	Tue, 12 Aug 2025 12:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p8+0CQNv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85481448E3;
	Tue, 12 Aug 2025 12:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001988; cv=none; b=Sw1GsXCYXleS++sgshPTkDlvH9mAUial58xAm1qkUQuM//DHdQmrouE2G3mjNOjwwEf2p63y7yt/H6ByYECRsPxihHIP4TDKYkDAu0pFJ1qZgx7+Qk3ERA3Yixhn5gjoqUYXZGSxm/S3282wQ0AA5Mhs8PQt15CfgTIVE5tPRmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001988; c=relaxed/simple;
	bh=bi1/ZBeMOx+15iS94/tqOtpD23+u0TH5olQ31xfpKyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ep5uD6luKgBLGl1p8fw4OYXDp9LAccoFHKqkL4AT7NxJMhq+fRltaiFWHWXQ7Y4eHMCQGvzFrBO6rgBb37GD4FjLJcpa6dIGuTKe4SFTzMb2wgjk3+9BxOefDmEoe5ac7IctMdQ9LhUuhKNOO4NDu/0LwcC6mAgeAp+DM74HO5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p8+0CQNv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAwHbV001246;
	Tue, 12 Aug 2025 12:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vz3d6AyNp1CCa2+XGVcKad7NN5PxqP54yEy3scYoT4s=; b=p8+0CQNvnxY1Rkel
	GPpzy8JjsEKqTr0WBIKOPt+zkWorllhxyjHC/WaKMs/HyyppDCCgaV2Doy43bTEM
	qUUJHDMR3ySpn+XbdeBKBcR9PLDv+Uf5k1rWUAJjKfd/dCfzrP8ldDB02gLhJZOH
	MR5cRk7WEZb06dxVijJdV3WMOr+U+id+4jk5Oga29m74Nm6nijfmB34puB47JFVn
	XFxCdma5+aOTJQjz9SzcuDFms1Tu/J3fwVLNIrt/V/l+G2ujYRGidMSpit92gOwq
	+ocxt2pGpRryFDlibpobxyz5s0G4ylYXlOXkg5rMHsH7k/VbsSeHzm9oeH7B/XDC
	ocGWyA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vk0c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:32:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57CCWt6x019154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:32:55 GMT
Received: from [10.253.11.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 05:32:53 -0700
Message-ID: <a91d2b6a-fca6-4f22-b865-4baf1f26b6af@quicinc.com>
Date: Tue, 12 Aug 2025 20:32:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix SSR(Sub-System Restart) issues caused by BT_EN
 being pulled up by hardware
To: Paul Menzel <pmenzel@molgen.mpg.de>
CC: <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bt@quicinc.com>
References: <20250812113620.3135226-1-quic_shuaz@quicinc.com>
 <c7bf8c0f-ebf1-409a-9985-bf76474f039d@molgen.mpg.de>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <c7bf8c0f-ebf1-409a-9985-bf76474f039d@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX6CVdyEKztFhM
 Ag9ZaGD7qZ7tRCfMJJYXYd85HJV8rRpJYrDRpQXaS4C3unSpl9FSyKB/xCx10lilqhQ1sipMBex
 YdnG4XdhmGz+rjcOugw5sr6skdbQ4FCIYgPNVGvZnEFLgXgeLyTU6lDLQj1rmLOR5cIas8up+EG
 C2zVftynHWeH69eqoqC+Ltqe7YnEerc6PO1ee6kmkT+KU5fxqW9Wuuv6e4gNThMOpqEYdY9Fpt0
 veSJ5qENNn/fvBgadtWyfy20WggUU5Fk6yXsI7Nu2rLoVNgxM4Tm2hPM/DoApp4oM0a3nkgSoMd
 KCTXPXuNuDl+K4LRb1mAua+OEGBdW/Zic8A6vRzoFIo0WqfrXb76tSr8KuUO/3h3mvyqzYg3gQS
 jPQLtvDU
X-Proofpoint-GUID: EHOt76-pSKEWsdjPecnTZn0U5dPAh8_P
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689b3478 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8
 a=o2dULbkCh8g-75iJRRgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-ZQkrNIT2wkA:10
X-Proofpoint-ORIG-GUID: EHOt76-pSKEWsdjPecnTZn0U5dPAh8_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1011 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

Dear Paul,


On 8/12/2025 7:53 PM, Paul Menzel wrote:
> Dear Shuai,
> 
> 
> Thank you for your patch. In the subject, I’d use the official spelling and put a space in *SSR (SubSystem Restart)*, or *SubSystem Restart (SSR)* [1].
> 
> 
> Kind regards,
> 
> Paul
> 
> 
> [1]: https://docs.qualcomm.com/bundle/publicresource/topics/80-63442-50/htp_ssr.html

Thank you for your helpful suggestion. 
I've revised the patch subject to reflect the correct spelling and formatting of 
SubSystem Restart (SSR). I appreciate your time and review.

Kind regards,
Shuai



