Return-Path: <linux-arm-msm+bounces-79150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B55C13F74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82A2119C0E1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFD8302CB1;
	Tue, 28 Oct 2025 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R8FjLV0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895A5302160;
	Tue, 28 Oct 2025 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761645347; cv=none; b=pZ3ZVN9zHf1VN9s8fsEhUBnMvFuaIxq4s8JAjpPm/4ElNPi8VChhyqKKurvHo9J0hFR7KPtswAHp5YQ4kHPAay6CSJm+l2ahw6NtBua0rdaDQh6BFlrfROTjFqnHN2tvlZ3sr8o7yCTfsbeMj/W6yQDprGYzFBWwbwlvRUCWLvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761645347; c=relaxed/simple;
	bh=drUNvnzk4B66zjRoKAYXtMaNwYbmhzkjE6I26tkD0TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lK1+y+IfZ4OmP6G+EMyz8NHkWsbpEdDHTwK0+ZhNGncJGTVuSWL6ei60PSRdKOnPjuBoLB3pfh3Oes4369nmLQpdZOy4yQINwf0ksXNPraVa1i1W6uT8tTLcknzzaoU/Cx2NlLcZ2ilUfVM0VUp03MCB1l7a5Xp3AEkggUylL6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R8FjLV0v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S4p2MF591277;
	Tue, 28 Oct 2025 09:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smXHDMXrCZNA+TvjDFOW48yo98V1HfJ29j+4aR1KUQE=; b=R8FjLV0v2mm/yqCC
	Wr4HczVqwyo7QRsxb1OaxN73EJL6VxA+W3Z2mjSgTByxhb6XHsMOFaj4/NeIj9oR
	2Bj7kKQaqPdSQT/DLcIiJNcP9ljYpaawC4BjXySVe3cBgGYTaQj82W8/6HY2G6Aa
	G6kVZV/VhMelIieDEtPn3I8kZEMib9LperpsfxIy25z3h+OikJlEkR6X5abO16FJ
	EL/mcCO3mPbdAQH3NA9M+RDIKLsInkP7fAyezzHuLm64pjTsJXsqSFs50uJkJihU
	CgXulsXX0xWb5yKzZEOfbtquDcbQci3GcoBAMmoLukPLTXd/4SwbJqj7O3tfHxQo
	DluBkQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2q5u8vke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 09:54:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59S9swt8004710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 09:54:58 GMT
Received: from [10.206.96.75] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 28 Oct
 2025 02:54:49 -0700
Message-ID: <9fe1375d-f4fc-443a-a9b0-eb8079e08376@quicinc.com>
Date: Tue, 28 Oct 2025 15:24:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add edp ref clk for
 sa8775p
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <robin.clark@oss.qualcomm.com>, <lumag@kernel.org>,
        <abhinav.kumar@linux.dev>, <jessica.zhang@oss.qualcomm.com>,
        <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_mahap@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <vkoul@kernel.org>, <kishon@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-phy@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <quic_vproddut@quicinc.com>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-2-quic_riteshk@quicinc.com>
 <aifibm7pjva3rkb4gkzyxun46sraxyeh7jh6vgcirv5tsbf6ad@7f5bbs4ix7sa>
From: Ritesh Kumar <quic_riteshk@quicinc.com>
In-Reply-To: <aifibm7pjva3rkb4gkzyxun46sraxyeh7jh6vgcirv5tsbf6ad@7f5bbs4ix7sa>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4MyBTYWx0ZWRfXzukzlvziT20S
 HHowZRHU+mOMJ+gVXtpwz2Z2hTQxObF4IrfL9fdSu8Tx2aLRfGNc6ocku5lIHq0HH930gddcqLw
 8VikFxtFZS5SU/RDyADfRqs6B1YsHX6Lb+vOJRJsjS+XJBwYci/UQzkQGr5lBWmhuTNi0nl0v2y
 3tB+h3ka3m8Gm1z9dFI1+yJ5lMwMBygShHiNEANftCw1c3F7VmEsQkvLkmb+pooKxU1pcbGTtdI
 OunDTfEDA7E1zj5a0Tmw302DOz0LAm3M7Joa+In4+WAzTquB+TMFOulRBChBELdL7S+Aboubi2H
 FQAaGmvkn7jpe0nASxBhzFH8lvKb11beeAS0TtsqTH73Nx70rLZxCL/Xs1nOq/2Yg275DOuTrSZ
 pAhCckTou7M0fmeN1fJJo41Ig1kfpA==
X-Proofpoint-ORIG-GUID: wX0ON1gh3e_AQW4vGI8oM0EVR5bZwTkO
X-Proofpoint-GUID: wX0ON1gh3e_AQW4vGI8oM0EVR5bZwTkO
X-Authority-Analysis: v=2.4 cv=c9CmgB9l c=1 sm=1 tr=0 ts=690092f3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=dsHzLA6eIQ2_NKwUNnsA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280083


On 10/13/2025 6:04 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 13, 2025 at 04:18:04PM +0530, Ritesh Kumar wrote:
> > Add edp reference clock for sa8775p edp phy.
> > 
> > Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> > ---
> >  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > index bfc4d75f50ff..b0e4015596de 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > @@ -73,6 +73,7 @@ allOf:
> >          compatible:
> >            enum:
> >              - qcom,x1e80100-dp-phy
> > +            - qcom,sa8775p-edp-phy
>
> Usually such lists are sorted.

Sure, will update in next version.

>
> >      then:
> >        properties:
> >          clocks:
> > -- 
> > 2.17.1
> > 
>

