Return-Path: <linux-arm-msm+bounces-56954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 170A2AAC593
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6201B1BC45EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 13:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B233280002;
	Tue,  6 May 2025 13:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nroz/uM9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9972D264620;
	Tue,  6 May 2025 13:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537269; cv=none; b=BbfDcu9N/2EV8SqlpMc059vjmiG+CMNfd0SF3MmOo+Jtrw51ji/SkWrLEZZqy/sfCxaY0aunu85iCpA/93dcdciGOA2ukk8FSDwSrYP9g4aJvDIH84sSWDB0mirJG2/IsyjA3zXR71MclIeZ/oeG5nYti2ejB5eWcL70LKNZq10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537269; c=relaxed/simple;
	bh=84HzcUpwRImXLWEjja+OpddAzjuEvraDgSNqyAprpig=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWM+jkNiKWmkPPAqGyYmzGF3cv+3HW7vcC0xNefKiAE5POQErUj5spIycGcTExO6U5AX3KX+DJGb5kamF8XuE0mjsopLKk0NcxXyt1Z4CKit1z50DhC66rJFytW2BfSVt1gn2xIcY0VZI6augf14WNqQTXYKqvqsNI5yz1Q68WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nroz/uM9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468rmde007586;
	Tue, 6 May 2025 13:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mLRnJn+PW5nNQXfGhNkMmN6Z
	JTFEewiFpsbX1/uEzIM=; b=nroz/uM9XYDHcwQ7Z38M5wNJsnLDUtWEPHtql+h/
	SWId3HrKeOiFlLOh08Gthhk8BFnQa1fOgu2yojrPK9mlRrTW0JOYqYzuzuIwCyQ6
	k5mtzBKlNjMXSou8zkj0v98oYLySGyjvcau1K3pbG6phgq2hMxbCwkpo8YivjSx6
	0vV57BV7zjLZhcGorZq7u1/MO43Do/HOMstnD5jGwViUKaMiOo0bpKFXle1CYfct
	HZ5C8dfHSNRG23klFEnzsIZfj3ytRuiQf5UnAUJgbHwfhFbMYDjO9Nu0AbmAXKYq
	LsjX3iP+Hy6xq8+I7byIRX07a5S9kiuzKl9toIGMfJ4gYg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg2av1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 13:14:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546DEMr4021637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 13:14:22 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 06:14:16 -0700
Date: Tue, 6 May 2025 18:44:08 +0530
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
Message-ID: <aBoLIFCAjWM2QqpX@hu-wasimn-hyd.qualcomm.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-5-quic_wasimn@quicinc.com>
 <vr3q2c47ht5iebf7nvy3qywoxlquwma3p2tffswrefpmxqy24h@wrfecu6mcqcn>
 <aBoAjaI6nDvSyM/v@hu-wasimn-hyd.qualcomm.com>
 <a100a875-4951-40e7-a516-59040649f218@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a100a875-4951-40e7-a516-59040649f218@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xca1_-1xbc8BXE-NpIJGWx1zyF2Z0-tn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyNyBTYWx0ZWRfX1ydAvWuiKPa9
 w0JOvX0t3atr3+7lkqCExZ2kGhqhmjrc7rcquwTblEDSI6j0F9jflTTsa1LGHj+M3exVmEv4Yor
 M3KFf+ig75OEkRiJvKWb+F1VY6xqCG6SlPBoz3H0OhMCFDwTgomWZRJejOnoqb5krBiLEYrV+O4
 VKqukyJmwSmk8jLCOGWexVq9iNseeGSflcmauvs31x7WyeT817ssWgkwvd5lHYqco7+VDkoP7/5
 3uK0iDgXXU4b2UFh0+Mlm3LVPpzI+9HCrz5A2sczOqA1cyEPnsdCAjBE2orMZN2KZ7YQy55nImg
 /P2X4HaoZ8yF+WpkAaZdQ3hN3s5SRbIaixS5q2DmaQfKNrZi6TX3JWzVnViI00jU13G1BaZcGBR
 YIlVZqQlGYK6+hrxKQ3fkJi6B5F9AMAcTpU5apXfBAY3Db/kpYZzIlqC8nDumaf8yJvR8Ott
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=681a0b2f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=rX1Wcr3nLj4YTub6zYMA:9
 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xca1_-1xbc8BXE-NpIJGWx1zyF2Z0-tn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=662 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060127

On Tue, May 06, 2025 at 03:30:43PM +0300, Dmitry Baryshkov wrote:
> On 06/05/2025 15:29, Wasim Nazir wrote:
> > On Tue, May 06, 2025 at 03:08:17PM +0300, Dmitry Baryshkov wrote:
> > > On Sun, Dec 29, 2024 at 08:53:30PM +0530, Wasim Nazir wrote:
> > > > Add initial device tree support for the RB8 board
> > > > based on Qualcomm's QCS9075 SoC.
> > > > 
> > > > Basic changes are supported for boot to shell.
> > > > 
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/Makefile        |   1 +
> > > >   arch/arm64/boot/dts/qcom/qcs9075-rb8.dts | 281 +++++++++++++++++++++++
> > > >   2 files changed, 282 insertions(+)
> > > >   create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> > > > 
> > > 
> > > For the next submission please include at least the UFS support. The
> > > board is pretty useless without the actual storage support.
> > 
> > We will be adding UFS change once the basic boot-to-shell changes are in
> > place.
> > I have already pushed the next submission (v6) here [1].
> > 
> > [1] https://lore.kernel.org/all/20250429054906.113317-1-quic_wasimn@quicinc.com/
> 
> Sorry, I missed it because of the rename.
> 
> If v6 gets resent for whatever reason, please include UFS into v7.

v6 is just split from v5 to separate out evk & ride changes.
Currently it only supports boot to shell so UFS change is not added.
UFS change will be added in incremental patch after boot to shell is
approved.

> 
> > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > 
> > Regards,
> > Wasim
> 
> 
> -- 
> With best wishes
> Dmitry

Regards,
Wasim

