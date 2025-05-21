Return-Path: <linux-arm-msm+bounces-58955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 688E8ABFD3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 21:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD45F9E7154
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 19:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12390234971;
	Wed, 21 May 2025 19:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h37EErwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B04C22173C;
	Wed, 21 May 2025 19:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747855130; cv=none; b=tDrUpCbfRw0yLd4+2gNa7JrQFUqyNhS4kFMi6kwkOil8JgwF3TL8okzmGcGwNTKnIK1hZR/QvVgypuzVDcbubKxM3NAdhwZeGr4ZMiI75Y82RTuCMUZ4rVqYq2NIXca2X07GeP6qgZsK2+1KjpipRff/tlg/exjhd/y42xdGW4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747855130; c=relaxed/simple;
	bh=nga7nxK8EKA/8Sj8LjZxZFXgqcvpaPVSZXuNqx5KJE8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSCjHUb+5Xf2QRA7DZ1I85qnT8LXdv3vtvBH7RRPBa+Ka5ut/LsI4Q710DR0dOF3abmPwq7pup/zqY+GgN8TAzel1DRvjnVFgu9eROD5V64FYwjYngt8kmqWCcplpsLPAWSP5al/S2m1hTmGhdEfWQOboISAKgyUaS1Ep0KxMRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h37EErwx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LI8AwO011657;
	Wed, 21 May 2025 19:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4Iu1V/M0M1Lmpks9xJhPotBm
	jvTzR7X1AB4T0P1QS+E=; b=h37EErwxoYLH9yBiAruxXL7lhO+tCIf7W3XUtepb
	9FaiL6/IM7s1AcL7T+7tjljTufGr9jr/EMUNK7PW1Ip1XI1h1oYAJJvIEpVTgF8C
	i17GODF9noTb1n7cYk2DXIXDIGxNln/dbzJs9KTL9XgLfl+h6M5FBmUHqA/+L4gR
	0R9D6QbAxOWK86SFUOiW809aZUUW0LbVQR58BPy/lk8AWOFX07uci32NPmFthnVo
	gJvmXKhVcdLO15DiW3iG9d5ePUSYqhM5GffDwTNW/9kzs3WSmnmD1SloC3mYo8HL
	A6/plzlfYxFU1j2udI7p0KdfLX8/TorMACUTQIIRfE1SdQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb3y81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 19:18:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LJIgQk031649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 19:18:42 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 21 May 2025 12:18:36 -0700
Date: Thu, 22 May 2025 00:48:23 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: arm: qcom: Add bindings for QCS9075
 SOC based board
Message-ID: <aC4m/+UAHx5gwLdE@hu-wasimn-hyd.qualcomm.com>
References: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
 <20250521140807.3837019-2-quic_wasimn@quicinc.com>
 <79eb2b17-06ee-42d4-9954-a78ada1ced29@kernel.org>
 <aC3y0PPA8qrvmobw@hu-wasimn-hyd.qualcomm.com>
 <9df2f9f3-289f-4916-a293-ad5d97d530fe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9df2f9f3-289f-4916-a293-ad5d97d530fe@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BbFfJDQOK9hHxcjsyODhItIrXNGGVpjL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE5MSBTYWx0ZWRfXwwoOAKAuLxy6
 /wqX1FHVtcX/KNQc5LCXwqo8UZAWrfP0Qey25joZzXbEORty1Xst26247ctSCjGajaN0yjpirsb
 GMGvh4svM/p6yBxRNLjOrnviFBbDpE6739uUl1VppcCkbI1Wo5jN9+yLbdTOT73tH8cljGZtWWW
 XL/SjRqaT5zbEemp3fLQGpP3m47vK45LY7P2I3iHwMnAcPokkOzMatx76lcBLlJY1aGtKs/Qo4Y
 cbhJubf3zLPRgLfxMZy+Kms1788KUS5ctr0TpX2PVXZSotPfMcdlwLoMWNidEyujwKsEtj3HXZZ
 F83aADODH5N6+M1eTklpYtvEBx7RK2HZpWaxaHDW4m/P0/zrDoBleuaNJbQpYo0xzjcXchw3IX2
 VbreqHOAPUW6hrCaAkwDyBFHfRVqeTZJyiYIv2AXeC8lBOKjtpajOTcok5LBDviGd0CG1hxy
X-Proofpoint-GUID: BbFfJDQOK9hHxcjsyODhItIrXNGGVpjL
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682e2714 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=07lBpJVSqj2dUEkWpfEA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=984 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210191

On Wed, May 21, 2025 at 06:26:40PM +0200, Krzysztof Kozlowski wrote:
> On 21/05/2025 17:35, Wasim Nazir wrote:
> > On Wed, May 21, 2025 at 04:20:53PM +0200, Krzysztof Kozlowski wrote:
> >> On 21/05/2025 16:08, Wasim Nazir wrote:
> >>> QCS9075 is compatible Industrial-IOT grade variant of SA8775p SOC.
> >>> Unlike QCS9100, it doesn't have safety monitoring feature of
> >>> Safety-Island(SAIL) subsystem, which affects thermal management.
> >>>
> >>> qcs9075-iq-9075-evk board is based on QCS9075 SOC.
> >>>
> >>> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
> >>>  1 file changed, 7 insertions(+)
> >>>
> >>
> >> This was already acked twice by two DT maintainers. Apparently we need
> >> the third one.
> > 
> > The previous acknowledgment has been removed due to changes in the code.
> > Since, here I have removed the som compatible so though of getting it
> > reviewed again. Som compatible is removed to make it align with other
> > sa8775p & its derivative targets which we are trying to refactor along with
> > Ride changes in other series.
> 
> Nothing was explained in cover letter and dropping tags needs explicit
> mentioning. Nothing explained about first tag being dropped, either!
> Read really carefully submitting patches and your internal guideline
> before sending patches.

I'm sorry about that; it wasn't intentional. I'll make sure to take care
of it next time. I do try to mention changes in the changelog, but I
understand now that it's not sufficient.

> 
> But that was not about it. It was about us spending 1 or 5 minutes on
> your patch every time, because you send something not ready which your
> company decides to change thus we need to spend time again, and then you
> change it again, which we need to spend time again... do you get the point?
> 

I have made the code changes to align with our discussion in the other
series [1] of changes for Ride. Let me know if we need further
discussion on this to conclude on DT structure for sa8775p & IQ9 targets.

[1]
https://lore.kernel.org/all/aCdAuTS4pg7arxwC@hu-wasimn-hyd.qualcomm.com/

> That is not fair. Your marketing changes should not cause more effort on
> us. And this is not the first time.

I truly appreciate all your efforts. I understand there have been
mistakes on our end, but we are learning a lot from this process. We are
noting valuable points to make our internal processes more efficient and
reduce multiple iterations.

> 
> At least I do not agree on that. Anyway, I explained my point of view to
> Bjorn and Konrad. I am not going to review this. Maybe you will be lucky
> with the third DT maintainer.
> 
> Best regards,
> Krzysztof

Regards,
Wasim

