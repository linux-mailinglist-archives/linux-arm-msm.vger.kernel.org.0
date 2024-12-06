Return-Path: <linux-arm-msm+bounces-40726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E939E6988
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E694165817
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82861DDA0F;
	Fri,  6 Dec 2024 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iIy/GWmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306E818E050;
	Fri,  6 Dec 2024 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475674; cv=none; b=Xqu+hnuQGOkukVH88lfip1jacSXVsmUr9b/P+PkkXtLbQtTC7bFcLEZUIIvgEtvu78tQUXgCnwe11h/YaHR+N7urWOYrKZ73KHtNnohoJsubxqvzlSYDwp3pqz5jcH8HqCGtf/IZFDMYCD/Fm9y9AY4dr/5ohkAWTxdmBsBpSzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475674; c=relaxed/simple;
	bh=cJaEmG5Cap40I/5eDF09BoVGIys6UEJD8mrieDH2l4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=swZnx53OVTa/CBIIcgoUTjjoqrED8r5OZqHoNw4CLJn4XiO5lyjQscwhTD/9m1HtUTVy5rW0s/Q5C4+K2MODwPHonNgyoje0mRGq5iV1RxdOCMZAiOOkkPFa20Hy45pFAQjS/bBTXMTAgWEGY0dtWGjltnbFwmJALqgsCGXySvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iIy/GWmF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67M91A015878;
	Fri, 6 Dec 2024 09:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmjqYhq1MJRQ8g7LbaIVL0aiHIBV4Hk6ORD2vdi08Dk=; b=iIy/GWmFG2FbtD2M
	VNqwQFCdCEh4lte0kp5D05/d8imuXSCuUPkQzg2S6lwgrTYFVjUdWTrxof098963
	X+VYPSl6h8IszzectOGnU7LODxm8sOxC9irYmixKqIh9kSx56Mho3vNDlZ304eIB
	sZNa5ceIo2SWvnX3HepDTGMqOWkMmJ2L5kZD1oTS244uUkMC7SVyT79pevUEaN3d
	7aojoAEIR+S5jW0HjngvgxlQlrpsZHX4rM2L6RixRiwOm0zo2GmUvgaEsPA2SHcW
	Kr3Dx8Z8V4ZIk7QprTMMsJELyY8LYzb27EUCu1Egbp7lVZS3zeZer3xLgTGjlYUC
	tmSq0A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnmk078-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 09:00:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B690rdj004703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 09:00:53 GMT
Received: from [10.50.58.122] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 01:00:49 -0800
Message-ID: <75d01254-746b-4089-b717-e2ff49e500dd@quicinc.com>
Date: Fri, 6 Dec 2024 14:30:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: gcc-ipq5424: remove
 apss_dbg clock macro
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241205064037.1960323-1-quic_mmanikan@quicinc.com>
 <20241205064037.1960323-2-quic_mmanikan@quicinc.com>
 <vatyg3nkpillhyknyqe62myhmkp3nfbqwtltjcwfy2qhf4ez6j@iohbquyw6zsc>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <vatyg3nkpillhyknyqe62myhmkp3nfbqwtltjcwfy2qhf4ez6j@iohbquyw6zsc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kOkWGSt4wi5J2PaGsrYmJe5dbRH5KGgf
X-Proofpoint-GUID: kOkWGSt4wi5J2PaGsrYmJe5dbRH5KGgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060065



On 12/5/2024 3:57 PM, Krzysztof Kozlowski wrote:
> On Thu, Dec 05, 2024 at 12:10:36PM +0530, Manikanta Mylavarapu wrote:
>> Since gcc_apss_dbg_clk has no consumers, the linux kernel will turn it
>> off. This causes a kernel crash because this clock is access protected
>> by trust zone. Therefore remove the gcc_apss_dbg_clk macro.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>>  include/dt-bindings/clock/qcom,ipq5424-gcc.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
> 
> You did not even build your patches... This fails to compile.
> 

Thank you for reviewing the patch and pointing out the issue.
I apologize for the oversight. I build the entire series, but missed building this patch individually.
Moving forward, I will ensure each patch is built separately to prevent this issue.

Thanks & Regards,
Manikanta.


