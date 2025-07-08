Return-Path: <linux-arm-msm+bounces-63958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E13AFC108
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 04:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5129F422C8A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 02:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BED1225414;
	Tue,  8 Jul 2025 02:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I+6eZrX2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D3A383;
	Tue,  8 Jul 2025 02:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751943181; cv=none; b=po4AaIjldPKB2s9jdbTV3ZoCc7FCaqM1hZL+qGsxbx2Q20+/QKomD51ux6sOZ+tgyB8ADNvQeCbw3xDz4i3Lb2VM7J7q6alY4Vu46/HJAOAjsmT5e+3bBfK9qF3P8lbd7MgzkPr037/oBaytWg5103kNrlpWh+M6tbIVwkwb33A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751943181; c=relaxed/simple;
	bh=2YPaOuP0AKZnwJ6QA5VdtBos5n+zVrR0TqRlQjwzdAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WCSNDDZX61b96FcilPKcsgaMRfDPudMicSDeebVGCdcG8JBgPTZmEroe2eDC0LGV7VOJg9ssPIU1pzKYqPHLR5rh2jKplbjVgnwe3W4zhLCQmrCEOxTVu+edYjRsJuuRQsWdmC84EhkquTh9fR8ov5CyT+ZW0jBhUYFNz4qtSd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I+6eZrX2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567MXP4h019666;
	Tue, 8 Jul 2025 02:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sR815mEl+sUZgpjEY6ReuyVgD3GFXXoJSV6V6GNAHLw=; b=I+6eZrX29+efemxn
	iD1gVeUEGSmsWSrR84vXr8U01pk+aRJoNIndtKmBRFtZz1cC5QOtWnI/gIL5aRQE
	IUCXmUweQZ+6dEMDEZGdmxl81H+bJu0aznH16MwvJcYpCwnmAFixEn2yAQaG3Mit
	4TZNzwEx1pNRxzHhAOjcI/fI+Kl0oov1LDHp3KxhIyq0a63c/cp/m8igg69trnbk
	JH0J3Obtnk8kBHxRglg3w5gSLAz/QkBW4Y8ZaM0gyfp+l3tnABSq3DadxSjyky+q
	Lmi4B/lAfGFgMAmm/WHc6TQM/bLXKPCTBliRQccEmCno+twRn8zAPgKzXWxRdD8Y
	0gyv4Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqtmbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 02:52:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5682qZuI026457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Jul 2025 02:52:35 GMT
Received: from [10.253.13.246] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 7 Jul
 2025 19:52:32 -0700
Message-ID: <720a6969-7d30-4eb8-a970-2e06740c2780@quicinc.com>
Date: Tue, 8 Jul 2025 10:52:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND net 3/3] net: phy: qcom: qca807x: Enable WoL
 support using shared library
To: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>,
        Viorel Suman <viorel.suman@nxp.com>, Li Yang
	<leoyang.li@nxp.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Wei Fang <wei.fang@nxp.com>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <maxime.chevallier@bootlin.com>
References: <20250704-qcom_phy_wol_support-v1-0-053342b1538d@quicinc.com>
 <20250704-qcom_phy_wol_support-v1-3-053342b1538d@quicinc.com>
 <20250707164332.1a3aaece@kernel.org>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <20250707164332.1a3aaece@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686c87f4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=5vVSTZcSAIpnvYd1Sv0A:9 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10
X-Proofpoint-ORIG-GUID: YH3PtwPB5M3HBfmMXCuPuMKfiWXBU18m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDAyMiBTYWx0ZWRfXxiL6U2Luud0t
 DqhhkBXzEEByLIcuanmT/3wA+zcWDk05ueIVtroO1U18ORkT6No3LDZVhZ85L3C/qAajY2yjZjN
 eEVm4aE9x34c6uac7RpNtBllUQ/FhBgyZnDtSXDsahvJE4T9lRwMByftnn9rFwVS2EwKKAakmoF
 2Sr5sC5MkI67nHoqu818BzjEujYgq2bICTslJV7pv84KUqJjJhLrJw9HphIcP3ulHVLw3WlSU7q
 nLE1HLwcmsW91L9Whl5o/aG1C1dbWPwpYvQuCaroKsOmLl1ItxUkjufceilbLz34BprwxmJkmDQ
 gbmTucIiC0MqZQCnTUVdbTYDBweD/UTjOO69nHFgXbTOvGFhjrxpKmzS+iHHPIy+NcrbJxvkWdj
 b76cwNXfTrJ1aZ9YQx0nomuTwKSuY7+XVOgPtxIfCoOG9aTJ2mFowpCvrTID+PK9Iq0TbAVr
X-Proofpoint-GUID: YH3PtwPB5M3HBfmMXCuPuMKfiWXBU18m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=893 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080022



On 7/8/2025 7:43 AM, Jakub Kicinski wrote:
> On Fri, 4 Jul 2025 13:31:15 +0800 Luo Jie wrote:
>> The Wake-on-LAN (WoL) functionality for the QCA807x series is identical
>> to that of the AT8031. WoL support for QCA807x is enabled by utilizing
>> the at8031_set_wol() function provided in the shared library.
> 
> This needs to go to net-next in around a week (fixes go to net and
> propagate to net-next only once a week, around Thursday/Friday).
> I will apply the first 2 patches, please repost this later.

Understand. Thank you for applying the first two patches. I will repost
the remaining patch to net-next once the first two are available there,
as advised.


