Return-Path: <linux-arm-msm+bounces-56945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F5BAAC460
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 14:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C03B9B21255
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 12:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AB627FB31;
	Tue,  6 May 2025 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lv2oY5cq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BBF1F5849;
	Tue,  6 May 2025 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534565; cv=none; b=L9aOcedITMq9Y2cstpjr0sVXJ9hIqY6gaowogoIYLZdUJcZG5pXZjNzyp2GjyrspyJkTBlIQVw3wJjZFRKJdSPX7SWvz6Z4+Jli13YmPOGAQsOjNxZHoR6RJP/UivHWvB5xRrbeedCtZmKBt2AvllmXrWd0hlMHu8j9vzY6Qnxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534565; c=relaxed/simple;
	bh=Yrmckpll9fMI/+zHbH9lC96tvpv1WEvSjp0vx/BW5I4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2+QGxU7zyBisRFViqtm8cHxJ0oeLVzlTqT7gbb5cKsoPZNQvdQyYid7zS+C3wV4XZE3keP3ZmZXUbQ0lDe0FVqB8Vy28pjT71lVeUeL67IOxtK4DqtZrXR301+r7OS5uZ2JVy4Zv4ZnIfO1CgI+sfpm3llRwFQQQT+IJYxING8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lv2oY5cq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54688oIl016422;
	Tue, 6 May 2025 12:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sW+Ivbcz3iaI9dvf8TBsWJBs
	E6sRfyJgSsVBc0ygf1s=; b=lv2oY5cq1y8kFMdJfBLkyR3DW0IJOjmmrTbvtv+U
	M7xiEzvTP5yAceX6dFqX2BCkhGAu74JvuVbKKn0ozvUujt+FRQnPl3axA4OTVCGD
	mynImQIqvNkSbMO1xwewT8ihmOKQ3GwlSzyC4EV/Csosvgrx89SzHSmbQDxSXYY/
	6ohu10IHVFGvb2QT+VXeRJ1B8BP0+Yp3QvKlmikCvq8XwxRQ5o6evL6MP1BsJKAm
	FZfRFGsN4bA52pliSH+bMh2jj6Rx+0EmMiCINROAKT2a2/fs5Eo5aYSBuowy/2Z6
	G0SeUfx47talV/cu/7obCczRLwiHTnvNsiKlg8LkOideVw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xsx36q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 12:29:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546CTHa7000557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 12:29:17 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 05:29:10 -0700
Date: Tue, 6 May 2025 17:59:01 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add support for QCS9075 RB8
Message-ID: <aBoAjaI6nDvSyM/v@hu-wasimn-hyd.qualcomm.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-5-quic_wasimn@quicinc.com>
 <vr3q2c47ht5iebf7nvy3qywoxlquwma3p2tffswrefpmxqy24h@wrfecu6mcqcn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <vr3q2c47ht5iebf7nvy3qywoxlquwma3p2tffswrefpmxqy24h@wrfecu6mcqcn>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: I7RPriLhYbsDkrE2RLZoLGMgxcnUb118
X-Proofpoint-ORIG-GUID: I7RPriLhYbsDkrE2RLZoLGMgxcnUb118
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=681a009e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xPlbAaFx5iMT8pk6ymoA:9
 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyMCBTYWx0ZWRfX2BKj55Pf/Tee
 ssx4ukFVYQCvLHmQf1Xsnso3Vo///+4NEIHuNC2HQurt+pMdugHBpaqlt0Y9O0OWQNJkc3fDfSU
 Stl38Wuy0TQbyd8wjYj7jRW2PmlCTfH0EM9aaZoGDgQO7lJHxN7j1z/us5vmQGS5ueF0/w02olI
 0Q0j22+aYYVpCdyw7aFfZZtPv4eN7RQhVzOTCz6MeNRyYLP8lWJ4/sXqQddkoYeAHfqDv6rzOos
 /ZZCmqdI9ZoX9rUTvzHPCmfg7JI/WoaEK7xqT1NgJeQiQRPbQrAy2U+39CZlbIZIXDxUGRLNa62
 zic10w6NAc41xOsKgvXoR2/bSSJhlgVjuKKCptWLxJxfK6orcs+rtI4/H9/bTdOwlkxzbOsWwiY
 gGe3fzG2En6RoLu70KNdHgXh9+B8Yl0DzRB5csNiFKcWYvFU86AXPjHVldNCMtXbRyvios/0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=434 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060120

On Tue, May 06, 2025 at 03:08:17PM +0300, Dmitry Baryshkov wrote:
> On Sun, Dec 29, 2024 at 08:53:30PM +0530, Wasim Nazir wrote:
> > Add initial device tree support for the RB8 board
> > based on Qualcomm's QCS9075 SoC.
> > 
> > Basic changes are supported for boot to shell.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile        |   1 +
> >  arch/arm64/boot/dts/qcom/qcs9075-rb8.dts | 281 +++++++++++++++++++++++
> >  2 files changed, 282 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> > 
> 
> For the next submission please include at least the UFS support. The
> board is pretty useless without the actual storage support.

We will be adding UFS change once the basic boot-to-shell changes are in
place.
I have already pushed the next submission (v6) here [1].

[1] https://lore.kernel.org/all/20250429054906.113317-1-quic_wasimn@quicinc.com/

> 
> -- 
> With best wishes
> Dmitry

Regards,
Wasim

