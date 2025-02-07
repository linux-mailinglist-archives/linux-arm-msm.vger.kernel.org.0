Return-Path: <linux-arm-msm+bounces-47125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD306A2BE88
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 09:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B363A62EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 08:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72D11AE877;
	Fri,  7 Feb 2025 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xcbe8mZq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2401F1A4E70;
	Fri,  7 Feb 2025 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918609; cv=none; b=S7SV/d56AeBSwQkSOLbcZ3me73BWIDN0X5DW0OSllOd1xD4jksFO4Tr8I5ceiHaGJMrWPirnwwYxB+wF+GT5U5/FyrkZYdD6Az9/dPm87S4i1NqwEQXxu9OdWBmtNUe6z3H3s5dNX6t0ynK3bOMiOZ5bkb6Lx2dwq29y2WBbTiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918609; c=relaxed/simple;
	bh=Yl6ldaHkVl3Q/jLZovzlP+xEbDH9XAk23aBnRxgMxVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RH7ptMZFqNHilLWMzRPnn5N47m8lU+0E4mnCZBbBTOQtlteD/SPhj+wMmpUUPmObLGCP5pb/XNLGWoMqwvC5jiVptRsvJeE40YPS0h0TbkH1U5Xq+T2o2po+k8zCRsmdYsSHqbRbByF/eetw2u4JAe+VFKGT8AipUP6n5sVMxGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xcbe8mZq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5175787c024662;
	Fri, 7 Feb 2025 08:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mPR0ceyB/SJj6hD908j/YJazELTEVbh/kd+3G/RomqE=; b=Xcbe8mZq3Xehtt9A
	CM7qRoBpjZYt/dWetyU+OlY9XKwbNO9+A4kNnRlPtqT/4RRFZUBUIjbKN66ZujQO
	pToAUkD8+1lA0q/zauCRSpDLC1t0hifBD5HCkpTkeQE0EjtZ0psl8WEvcqW9yvh8
	34lIdL61owf/HqRpu2/zTHIq/k+q4xr19pFDsME+jOHyvaYfabHAnakczR1LJwv+
	DJ/uh3SCik5u1YvD/YX8M+JQewVFzgbgaAX/SjheLoUt7luSNUK1kLahbKQWwvgm
	4AtQdaZxXyn3giUQkQeV1VkSlveoFdvzJOP+TUv9PgChSyg2h99+pgUcrLObVdcI
	uyHXFg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nbr40h1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 08:56:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5178ufHS002527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 08:56:41 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 00:56:38 -0800
Message-ID: <de8fc55c-2d68-490b-9a12-cb368e27d266@quicinc.com>
Date: Fri, 7 Feb 2025 16:56:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] Fix USB vdd info for IPQ9574
To: Varadarajan Narayanan <quic_varada@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250207073545.1768990-1-quic_varada@quicinc.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <20250207073545.1768990-1-quic_varada@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u3eytLjIE8t-yvxVLl4YU4ty3mbhIZlW
X-Proofpoint-ORIG-GUID: u3eytLjIE8t-yvxVLl4YU4ty3mbhIZlW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_04,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 adultscore=0 mlxlogscore=794 spamscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070067



On 2/7/2025 3:35 PM, Varadarajan Narayanan wrote:
> Use correct regulator for USB phy.
> 
> v2: * Skip the first patch as it has been pulled in
>      * Reword and fix commit message formatting for the remaining patch
> 
You dont need the cover letter patch if you only have one patch.

B4 can handle it automatically.

Thanks,
Jie

> v1: For some reason, the dt-bindings [1] patch posted and Acked long
>      time back seems to have slipped through the cracks and hasn't been
>      merged. Including it along with this patch as both are related.
>      dt_binding_check & dtbs_check passed.
> 
>      1 - https://lore.kernel.org/linux-arm-msm/170266996013.286103.17303148912355511017.robh@kernel.org/
> 
> Varadarajan Narayanan (1):
>    arm64: dts: qcom: ipq9574: Fix USB vdd info
> 
>   arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
> prerequisite-patch-id: d3da55704446c2222b5c624d9bb3a738357cb2fc


