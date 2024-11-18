Return-Path: <linux-arm-msm+bounces-38248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0816E9D15BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 17:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2AA0286CE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 16:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F0E19CC24;
	Mon, 18 Nov 2024 16:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OU7v34Xc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274F81C1F3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731948518; cv=none; b=WqG59pM1Bmx784qu8aR3B4FKtfxRfrfwzjliNz+//WJ96LUz1vx7m1vkDumHrZBsDQzZRsCB/WoW0b1rRO/44rexpAe4g0sG0Be9nhm3Q3wu+465SVOWrIZkxFFhF+xpZGH4lW01EA2W8bUkL9fIV8gj2/l/dycJEd2m7X9ZXHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731948518; c=relaxed/simple;
	bh=nkdYFTre5jNB3vCGUssIkQ/oLl/TYwA7SYi6pLUQLyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WmGu3XQ/NE5uUaRbskCauyFyEMe4Gtt1JYaOf+l+ogofndQymA3LQ9Zu4d6Q+vZ3KhaseQY8DFKzZrAzUhuZ7SfJLxWok+PiJJaNymMPwNGe9QrbUTSg/PbkO8JHawfPitH00ZklnWoV4YAPbe6EWocCztInMrRIMLyyeQ9VWX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OU7v34Xc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGdXa028405;
	Mon, 18 Nov 2024 16:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+GFP6iBo1rb3ao0ESNw3laydo1qbrn5QHEsN1a+aGQ=; b=OU7v34XclrGlNE7I
	t1tLViM6NGPAAW/VEv3LA3H7TxbmhaJtKHlpw9XQvLVm+HtAgfcHVP9378CvUl3F
	HcUnMfvBr7+F116lWNRhyppXm+Ze09mkLBd2EcZwVv2qAW7i+KcN1bisCsmTJrUH
	9k2hkL4EXs3bdZHAj7Z3wRG+bvDSE+K5U8ShRBZzm5hNgJXvqq2F+/3i+g5JSFoc
	w2JITjaIrOb/JE7c/qmiwvmjurdZgrAluGanuwpZAykGQRRb2Dh78txrAmJxNZTJ
	oP9Mm0OLdHvQLjD24oS1E/pMSDnYsN1yI97WChScpQVrcF9jGQsmev0HjiKcEOVp
	vue9+g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y5r29j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 16:48:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AIGmWst031429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 16:48:32 GMT
Received: from [10.110.125.248] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 08:48:31 -0800
Message-ID: <e7721ac9-b809-4fdd-a369-5e827b35745a@quicinc.com>
Date: Mon, 18 Nov 2024 08:48:24 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Drop redundant vfree() null check in sahara
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <andersson@kernel.org>,
        <quic_yabdulra@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        "kernel test robot" <lkp@intel.com>
References: <20241117202629.1681358-1-quic_jhugo@quicinc.com>
From: Carl Vanderlip <quic_carlv@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241117202629.1681358-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SAByqQladp4lUMziuEWkT8QxC0PAGNiD
X-Proofpoint-ORIG-GUID: SAByqQladp4lUMziuEWkT8QxC0PAGNiD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 clxscore=1011 spamscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=695 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411180139

On 11/17/2024 12:26 PM, Jeffrey Hugo wrote:
> The documentation for vfree() says that passing in NULL is ok. Therefore
> we can drop the null check as redundant.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410301732.abF5Md4e-lkp@intel.com/
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>

