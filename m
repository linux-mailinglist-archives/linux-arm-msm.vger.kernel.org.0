Return-Path: <linux-arm-msm+bounces-26149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C489312B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 13:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A30EB20B76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 11:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9419018411C;
	Mon, 15 Jul 2024 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h9BqrVBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187B9143878;
	Mon, 15 Jul 2024 11:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721041314; cv=none; b=BgDOguw8lt4RNYoD1vcqDckFhz5bdOh/ZBpe9vI1O1d2Xg62jBcOBxfVIkl6+mdBspoAxKCGf9/7eoPZBpNMz2Rx/mH5Hb4DHBko3dCOb+MbzR0fwvU4zcORk0waKF1QzxG7UEhQedARq9o8wsHf9Q1cas1nUeuADRpldz0X9BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721041314; c=relaxed/simple;
	bh=w71v9eUAwKNQ3+lXcaYdwENnHGYbeDhpjJ8OM7l0qkc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=B9QXfLH7yRVI5qBhFBXi+mHWZ1PMTyMxhGTyoUe7a9YM9ZHJRSM+xtTvEvKuYpGkgiTgx7YWMR6EMEZa1v9ijlIJxyN9WXigWAz0c0pAxIcgb68Vlen+HH2746ONtHvCIs/kRH3W+yieM/HbQ2kQ3MY7Z7SbWD4hIgh6TEO9w8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h9BqrVBY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F2dGv7020893;
	Mon, 15 Jul 2024 11:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QCrrWxnCjXzDt5WJOpBQLe6l1iaKJ7QPrwp9hS6WCJo=; b=h9BqrVBYKZ3sksFA
	LF11nKeJjlqzGcos7tlxTlODyBYuWQa+/be+KP7KLV2jggnidVs1VxWDL9kuVTCA
	JuOds3BvCJ982nIOHYt8XmP2Qdhd8IE6hP13AE4IFXsReeNX7ahesCmVz2a5qLlJ
	d72jaR2pPKQxfyoI5WXLtuek5xfyUvjWxi2YN0b+AGKIf8Eq4v4AWFJdcp9mlQYM
	7VM7ivbQtZLRx8lK4T9c06thBoM/XBrmCXi2TrLkTDrQQkI/346cUzjHc3Fe7cus
	Dd/17yC6/ahEel2y29CQ1OaIUJmXccg/LCGe1Blg8DNPTHrTPizyqPWcAbT8w7eH
	a4TWvg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bgwg3q8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 11:01:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FB1aR6003290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 11:01:36 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 15 Jul
 2024 04:01:31 -0700
Message-ID: <bc2d6a8e-4446-4311-8745-4a4fdb8bca3f@quicinc.com>
Date: Mon, 15 Jul 2024 16:31:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Subject: Re: [PATCH v13 6/6] iommu/arm-smmu: add support for PRR bit setup
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jgg@ziepe.ca>, <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>
References: <20240628140435.1652374-1-quic_bibekkum@quicinc.com>
 <20240628140435.1652374-7-quic_bibekkum@quicinc.com>
 <CAF6AEGvroi8rJimFv95tkWmRFa5_aTpBJ7GFcRAuZpLGdSyEYQ@mail.gmail.com>
 <0650ba0a-4453-4e2d-8a76-0f396ac1999c@quicinc.com>
 <CAF6AEGv_9e-TDW1r0N4-db6pY_aV_EZFqrpNbATVS5Vy6+fs1g@mail.gmail.com>
 <4a5f54c7-120e-427d-8a0a-9fb83e13a72e@quicinc.com>
 <CAF6AEGtrtFNxDWtuADA4oOHhZJ=dJZcGaJ1XLFJt4fe4Xp=pTA@mail.gmail.com>
 <3b7c05b1-8f36-4c81-a55c-dbb467314099@quicinc.com>
 <CAF6AEGuRKU+DkL0-b3xdR1R45_MiiKQYRRXEXYz-xohu8rUaEQ@mail.gmail.com>
 <CAF6AEGtbw06-gOSvX9gAbi=SA801gmD3_8c5xkOU-G9g2qKptQ@mail.gmail.com>
 <9509f256-04a4-4907-98fc-148c5087d74d@quicinc.com>
 <CAF6AEGuLwZ0yFGWMKX-O1VjQB2M57K+CsyJ=7PCKXE=b=VsSNg@mail.gmail.com>
 <f4994451-9dc4-4d25-b544-49531709e76d@linaro.org>
Content-Language: en-US
In-Reply-To: <f4994451-9dc4-4d25-b544-49531709e76d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6tTKYRcgEHgo2Djr44KDs0v1tnx68jY5
X-Proofpoint-ORIG-GUID: 6tTKYRcgEHgo2Djr44KDs0v1tnx68jY5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_06,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407150087



On 7/11/2024 3:31 AM, Konrad Dybcio wrote:
> On 10.07.2024 7:01 PM, Rob Clark wrote:
>> On Tue, Jul 9, 2024 at 12:43 PM Bibek Kumar Patro
>> <quic_bibekkum@quicinc.com> wrote:
> 
> [...]
> 
>> If there is a clean break, such as all smmu-500 have PRR and all
>> smmu-v2 do not, then it would be reasonable to use the compat strings.
>> If not, I think we need a different way.
> 
> if (a reserved-memory region is passed in dt) {
> 	init_prr()
> }
> 

This would have been a straight forward way to pass as a check for PRR
support, but as I mentioned in the above thread reserved-memory region 
is not required if gfx/drm allocates the page.
So I think compatible string would be more approachable way?

Thanks & regards,
Bibek

> Konrad

