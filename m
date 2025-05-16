Return-Path: <linux-arm-msm+bounces-58223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D42AB9DD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 15:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC1883B6556
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218FA190072;
	Fri, 16 May 2025 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H4R6vJaT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B87E149DFF;
	Fri, 16 May 2025 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402961; cv=none; b=Eh82vTNpiOc+uNI4hL5V2jpS3ODfHudX9IzsPm1LWluVg8pKHtiZCO9vB1qYMrafXRwpuyVpucZnCrsN7nlkqb+RWeBPDMOQ/G6+2eE73ocGhIqncr1CBigQRvNQ2mOc/g9XD46nzIzsu4zUzjwwERw/EIbCkIQc3a/FvDDboHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402961; c=relaxed/simple;
	bh=0bUIUe4Sx2DWxLW1yYo6Ms1yEOIpi/0LQIRHc31B0Ik=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLLq4mxw1KKSQVPzezRvnUgcwarhV8EpbF3vgI0IXpPMUPlJ8ropBlZOuSQTtEi0p44ZkfnJnZwE878qUeGVMuH393SWS9yYA7oUwbYaSpoc42q24AAguT5HfMZDJLXchOi22mQDUetnKGgMEDIFChgO4yCaNlmeRkrIuddB5pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H4R6vJaT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GC6QOd018190;
	Fri, 16 May 2025 13:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oW5TDyB0lDxwJpPJULvDTcBi
	kCCDI6hqCKTXY32JOKM=; b=H4R6vJaTK73tW5Cyn7NFCclwh8hfLxS7T3S9ld1R
	sj9hOeZpIKX24PWFdtF5zofuDtQ/stOEk4loRhcvjLZ0QrhJHW+Ghrwb/Hvmxa07
	w/IGpehkBawkyo4Mr08LhG2qc2L1hCJtt+GEunxiRIu4sYaWsWlZskE+FA6MAfBg
	FmXiX4ZcfZJgUKBnUZtfhQ9AWPgYOsE/L0Rej61YF+zpzcFMOz1UW4bcKFGtpLRq
	zovC6+d+/zbnOOZHn0D/wC4BFGGUAzPjwjkRRdpBqT5ydqWntZ7MnX8i3DSW7yG6
	Sjpks/V1cO9kQN3M/rRuvDlNDJLXC2g4I14jQFQGm2q89Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnt18s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 13:42:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54GDgXdd021142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 13:42:33 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 May 2025 06:42:27 -0700
Date: Fri, 16 May 2025 19:12:17 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <kernel@quicinc.com>, <kernel@oss.qualcomm.com>
Subject: Re: [PATCH 5/8] dt-bindings: arm: qcom: Add bindings for qam8775p SOM
Message-ID: <aCdAuTS4pg7arxwC@hu-wasimn-hyd.qualcomm.com>
References: <20250507065116.353114-1-quic_wasimn@quicinc.com>
 <20250507065116.353114-6-quic_wasimn@quicinc.com>
 <55d11250-75b1-4606-a110-84cdc0592c33@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <55d11250-75b1-4606-a110-84cdc0592c33@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: I-jYnTPIFCLUrKBmxL999qlgodyVDq99
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=682740ca cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=x0sF0_AxRbDvk2FnIs8A:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: I-jYnTPIFCLUrKBmxL999qlgodyVDq99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEzMiBTYWx0ZWRfX8qDYzt0ATIZz
 5ATZwk+WybOWYTcnX7jap2+XdKeCmS2fZyqNG8CmER1uZpra+PPEBsAMrjNx97wYVfyW7Mp1MXH
 AdlvycoYN0vGdRpyxMjXtH3QZy4mmmNgVXayjDDmF+jO5tDAsPypum2UYy0j2IHC/pFdbpBgAqU
 y6Hb4G3ki9HiTbE0dHAnaAzrVm+7srFSm4GCjxKQwCgZ+Nsl7yyHXQcSQaP96ga92UnuT80/jdf
 bFJiKH8keQ/2bBIFQigb/gI/NZHcnzMzDIgtr6U/1kQnaRQdyT13GfoP691DtjjXuhB4kCsvV0N
 8CkQEIwjLiW+7rwIIZRWtv23oufcHh/sXF0yBD0RyOri3HuAnA9kVHiL5VLjFRm1/luelq4Tbs4
 KVfRNKqyZdVhTOXyDh+1e9X35H49rne2WXHK1NDjZIVXLJyHW6zrVph7NAXWSUHzQxWF4q4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=572 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160132

On Wed, May 07, 2025 at 09:00:18AM +0200, Krzysztof Kozlowski wrote:
> On 07/05/2025 08:51, Wasim Nazir wrote:
> > Add devicetree bindings for QAM8775p SOM which is based on sa8775p SOC.
> 
> You do not add new bindings. You instead change existing ones without
> explanation why making that change.
> 

I understand your concern. We thought of adding it to define the SOM HW
which was not done earlier.
I will drop all the SOM bindings and maintain only SOM DT structure on
IQ9 target (qcs9100), which we need it to add memory-map updates.

Also, I will drop similar change from IQ-9075-evk series [1] for maintaining
similar dt-bindings for IQ9 (qcs9100 & qcs9075) series of targets.

[1]
https://lore.kernel.org/all/20250429054906.113317-1-quic_wasimn@quicinc.com/

> 
> 
> Best regards,
> Krzysztof

Regards,
Wasim

