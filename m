Return-Path: <linux-arm-msm+bounces-79156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C56C3C140E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E921D586404
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C102302779;
	Tue, 28 Oct 2025 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eFvvXxu/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B83E19E82A;
	Tue, 28 Oct 2025 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761646627; cv=none; b=Ka7ye6X5zMXMumo2nBH84U5PlgRuTjVvmLfR03dt2FpEl6A0JqE1OisnwuRJHgF2wTRW/5awTBG12zSGCEcgGaGzo3DxGMIyOtCwtCpWA0VJdNlB6Cw4GxkrEY6+u75bn/Np4q9sLG6njdw8dvvGarprofwYQ6saOWXokPzkBWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761646627; c=relaxed/simple;
	bh=dzDRgBfe41vPTtLFx1w/UKaZRygZUStxlPAkuWneFfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k+y08QNdgN1MaoC72mNiyef4EpzTSkiynsw88ZlF0XtdTiYAhhk4nF6TcyI4aJtyk6JPAHDxExLUbHcRbPOvTjHl55gKWnXmQE4vQZMabfb0REZWH+Jg41z/jtC5800Nrns10Mk6wjdbuZS2Rh67vzQ3+bg4NirIaeXKopmkvTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eFvvXxu/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA3MuU1238711;
	Tue, 28 Oct 2025 10:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AXZZaRV9/aKTDc5WPcsiEt+lwX/c/Kd/mZJvpJjiS3Y=; b=eFvvXxu/CskYXUwV
	Z0TkpEG7R/i3JZm0ioIdRwo6AAtLhTTmBjPCdBDm4UIkuq1rhIe+mNSXKwSCQQtf
	g7mVkKv1dlQmrBYkfwcVF/fBTxyTN/GUeRVIgfVTNZDS24gFT9brdCwvB4iHARB4
	ubU1LHkW0KvlyZssuDUt5GrLk2VzK4Y/ePQr9w8tKSow7oHu5v/nuQe5JRVj8MR5
	BTBlOOxOTqGxeEuXPketlPJmhO37BufCrTus4OuWZdLTG1jwtXXj75miH0BhIaiV
	vQYVbe/M1pWHZGio+hPo/VHY+jb+d8qM80Z2AbiJbCpuzmXkKla2a8+PwVjXp6r/
	ByIsFQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2ur3g121-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 10:16:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59SAGeru011629
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 10:16:40 GMT
Received: from [10.206.96.75] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 28 Oct
 2025 03:16:31 -0700
Message-ID: <cfaf4ad9-53a9-4adf-adf3-36203403e908@quicinc.com>
Date: Tue, 28 Oct 2025 15:46:28 +0530
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
To: Bjorn Andersson <andersson@kernel.org>
CC: <robin.clark@oss.qualcomm.com>, <lumag@kernel.org>,
        <abhinav.kumar@linux.dev>, <jessica.zhang@oss.qualcomm.com>,
        <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_mahap@quicinc.com>, <konradybcio@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <vkoul@kernel.org>, <kishon@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-phy@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <quic_vproddut@quicinc.com>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-2-quic_riteshk@quicinc.com>
 <wai7uqe6bn6kcfp3gmgqvc7sfrs37vmpqh6cucc7mopwf5x76j@vkxbwvqiqlyz>
From: Ritesh Kumar <quic_riteshk@quicinc.com>
In-Reply-To: <wai7uqe6bn6kcfp3gmgqvc7sfrs37vmpqh6cucc7mopwf5x76j@vkxbwvqiqlyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4NyBTYWx0ZWRfX2yGWf57XHnkc
 aJ7yBDQfRpt1/dljtXSWtZxUVsAGsfY9LqgAu+q/7VCRqexGp2SlbUqYPoV98u1IB4bXo6pu8QU
 CUU5zp2rA45PjdzyzBwkLxo+oBv+JCWv0Tzgd1GAsvbEH8XhZMvMjV4aY45ZCHL2q80gJSY/TXp
 qHHYS3eBmHkBPEFt4kUDTyfPuRtynrInQtgb0SaXWpsn3ESMhv8NNQ/RdyZiSNaTdIawX0BxTSA
 zIze2rJRT7wRq+Kf2NtvF3ElltzzUyfls2/9jzCWfnbJ+geUNExnsZBOwiMnOlxuJIBhSIGwHE2
 YWSzWxiBzyv4IH4she4iS/06JVK7oO7ftXVWxcSqZpy1EUdISROtx2N0Hr5IIy20xHoRHIyzIWA
 NTtwHM3cLXuvJc0nb9t6npyVxaMjHg==
X-Authority-Analysis: v=2.4 cv=Jub8bc4C c=1 sm=1 tr=0 ts=69009809 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=UE7cb82etAGfsupJFAEA:9 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: 6qcP2j5BWDkV_R2vhP4zlL5mv1mbfjFi
X-Proofpoint-ORIG-GUID: 6qcP2j5BWDkV_R2vhP4zlL5mv1mbfjFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280087


On 10/27/2025 10:35 PM, Bjorn Andersson wrote:
> On Mon, Oct 13, 2025 at 04:18:04PM +0530, Ritesh Kumar wrote:
> > Add edp reference clock for sa8775p edp phy.
>
> Perhaps the eDP ref clock was missed in the initial contribution,
> perhaps it wasn't supposed to be described at the time, perhaps the
> hardware changed...we can only speculate on the purpose of this patch...
>
> You could change this however, by following
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> and start your commit message with an explanation of the problem you're
> trying to solve...

Sure, will update the commit message giving details of the problem.

> > 
> > Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
>
> Please start using your oss.qualcomm.com

Took a note of it.

> Regards,
> Bjorn
>
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
> >      then:
> >        properties:
> >          clocks:
> > -- 
> > 2.17.1
> > 

