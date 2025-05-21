Return-Path: <linux-arm-msm+bounces-58946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C9ABFA3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 17:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 742EEA260E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F278D221555;
	Wed, 21 May 2025 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BTOkVLVv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583361CEEB2;
	Wed, 21 May 2025 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842288; cv=none; b=BN0mjg9Fwe7walS1COIglal5hSooBKyUSfgrsxx6s06F303ov3pkf1dxOFcnRXgPMzx4/baGjv+Hyr/eC4+aJo6BhBX76g7VASmYjI2asEg0woajfZ3b/3go8ph4AoqiRqAZrhDHot7P4IwUDNnO/9FX5dnElwMnqQnoxZMTtkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842288; c=relaxed/simple;
	bh=iHa2EVnHG0LTko76+gbPKXWrBiAxk4n72dulqY6tgX8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZECLQAbEqpy58MrjjAKIFSHpMHwqD6QagXt4LqbCegpfb9RLa0XGks0NocLkp4XvFm20+Jb/HWe5WpShfySfzZJxl+HorrUGZfDrWOo/5fqAw2evlknpfgkr3pDUCAzTicFQeqhVObjk6ymsLbHS4Si0hlPcHfK79aEWJwixoVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BTOkVLVv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XPlq011367;
	Wed, 21 May 2025 15:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BLCSidJjFiZ4Md8l3XZRARX2
	HKLxBVA0IkrpnexySCs=; b=BTOkVLVvAjjXwK2jOIdLVlDYt58M3sXskluVwbVk
	Jt9jXtSRUw0Zw0icuTGHAhXlbIgimwP3ZSgx8qAdysX9NAymaBURcIACGSf/zHDN
	Tj4GMrUXym5J/pRvym99sBDOmk1PUx3zbbfm+rCWnJ11Iepdk/gD5ZKTrnH6KfC4
	8K2pxOAKkQwCEo5C1djgxgUNX8NX+aMehTsvaAVEUHUimDVu1M9LQGenpSl6LHaH
	G+seEHIVWlLO7QG3q8PRaowQ4IFowG0tyClvXGMTmzYLCmmNrm2OhW3LLw4cmUfI
	Idy4fV6yHb5XMi6sfVh1X7v/ZWTnaeIsQFjEhM5chpaOEg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb3dun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 15:44:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LFigAf030380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 15:44:42 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 21 May 2025 08:44:36 -0700
Date: Wed, 21 May 2025 21:14:32 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <kernel@oss.qualcomm.com>,
        Sayali Lokhande <quic_sayalil@quicinc.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: Add UFS support for qcs9075
 IQ-9075-EVK
Message-ID: <aC304FksYd9r8hBa@hu-wasimn-hyd.qualcomm.com>
References: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
 <20250521140807.3837019-7-quic_wasimn@quicinc.com>
 <b9ecd0c9-c8fd-45e6-b2ff-6ccb72bdfd49@kernel.org>
 <585d1751-a909-442d-986e-88721a093ec8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <585d1751-a909-442d-986e-88721a093ec8@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UlL4iVynxJ3NU82-aR9cY4z0SBFnffJ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE1NCBTYWx0ZWRfX71M563czuOCP
 VXEn/AlCt6zreA38WMmRPg4NIF5SNHfecwV87h/TGp59W/+4UAJ6VnI9YufySwxVE7IJxI6Oi1V
 5n0+aMJrYVERtYOeNH9YHvgAtv6W4ekHyQpGx2LBqwJwgdouFaCjHmympuDEL8DzipJiaIoBsUU
 n/gjF83sgn9ghxT8QJl502q4+UEVOdVKzp77xRKuOicarMsSCOtROCK8mw55JY/aMxvjqxvFLWd
 rdBfNEv6bBy1LOfdZi7ez1TlghnJ09cFBRIPvZxms7E3CR9PnoejjQqaFyGYBJthGFR/h00tK9S
 ZejlsKX0slOPonIp7VVkXrYb0BUsfFx7OkykQL+aOx2vpWumPKhkdLa5AuQpR3Yz2de4XdOPe8X
 4HqeQBHfTkyqycrciFJFrLZF0hpK7ZC1gWQslhXCr15QLz2pgUAzvtVIRi5g20Z/7X8L1YQG
X-Proofpoint-GUID: UlL4iVynxJ3NU82-aR9cY4z0SBFnffJ3
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682df4eb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=1cfLOKoaPCSdn8JfHDsA:9 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=867 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210154

On Wed, May 21, 2025 at 04:23:02PM +0200, Krzysztof Kozlowski wrote:
> On 21/05/2025 16:21, Krzysztof Kozlowski wrote:
> > On 21/05/2025 16:08, Wasim Nazir wrote:
> >> From: Sayali Lokhande <quic_sayalil@quicinc.com>
> >>
> >> Add UFS support for qcs9075 IQ-9075-EVK board.
> >>
> >> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> >> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> >> ---
> >>  .../arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts | 17 +++++++++++++++++
> >>  1 file changed, 17 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> >> index 30a36ffa40be..ba8a359d8fee 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> >> @@ -276,3 +276,20 @@ &uart10 {
> >>  &xo_board_clk {
> >>  	clock-frequency = <38400000>;
> >>  };
> >> +
> >> +&ufs_mem_hc {
> > 
> > Please follow DTS coding style.

Thanks for pointing it out. This will help other contributors to
understand the issue.

> 
> And you just added this file. Squash the patches so you will see the
> mishap in ordering.

Sure will do that in next series.

> 
> Best regards,
> Krzysztof

Regards,
Wasim

