Return-Path: <linux-arm-msm+bounces-47083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C87B5A2BC5F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 08:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E76F8188A4AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 07:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393281A83EF;
	Fri,  7 Feb 2025 07:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jtLdM9MD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA19B1A3162;
	Fri,  7 Feb 2025 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738913827; cv=none; b=FKFtZWoj5EzHLmMkJRGBmIHV+F5CpfCTWecfvLt5dA7sk7n9szvg/5nUD8MnQ+FY08FQ09KIFgPaePHoaWAmNbMH+WH4Hl58dY1jhqefiNQmF5xCBJQ7zDK+ueKJbItTEwTRDh0p8hDvHJIfocItN49aGcy5kZil72W25A/5Mrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738913827; c=relaxed/simple;
	bh=gs0COABc/7Kq1vfahxzMJsS7UqDHPKuEHuXgwCTV6cQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCdn0hpbRCQ1QdLxFeNrvAKPFXmKrRA1oaOY2am8OdElfp3cSmYnbnnK0hUtHG3Ckf4ZW5koyAjmeV+ZtwV62iOsFYacHdaze2pM+zl2H1zhop/6VnwmPyW9dqiiXoFQWV9tjO1VoEe79cOVUZadbHU5mBQ9ugu1weUwQ6X7USw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jtLdM9MD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5174L5SB008908;
	Fri, 7 Feb 2025 07:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gs0COABc/7Kq1vfahxzMJsS7
	UqDHPKuEHuXgwCTV6cQ=; b=jtLdM9MDx02PHcRrW0qyxfYs4aDW8ZJptcxYPR3f
	s4lLFvPRndA4YnkXeNBqSRjtkYAG3Hz/xFgD6dHu9WUrJc3Wr6iEprXlzhhCWD2e
	RuKzZM/CG5kptEjiluKK9x8KqE7EoZA1fSZMiC9obAhi8whkWaFjVy37tYde5eTO
	W7Z/v/8bKd0Wzn5ooa38Ug794zLvmd9k8bdrNQo4/g8S2O7B0MVDFd952fB4Y6d9
	yWrd3B9TxuOsYBoZ63Dt0Moe5TjUn/DXN9HtlpJgHeQoaDyMQ9EW3VB9BlgT0wQd
	ZGtMDPS2DZMhPadOz+wK5zTeP0h610d8avNQARgXAqqlEw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nb2m8ecs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 07:37:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5177b0vB003435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 07:37:00 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 23:36:56 -0800
Date: Fri, 7 Feb 2025 13:06:52 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: ipq9574: Fix USB vdd info
Message-ID: <Z6W4FBg/RDBJ4rsW@hu-varada-blr.qualcomm.com>
References: <20250205074657.4142365-1-quic_varada@quicinc.com>
 <20250205074657.4142365-3-quic_varada@quicinc.com>
 <1ded2597-d5a1-44be-b5d2-30b70657730e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1ded2597-d5a1-44be-b5d2-30b70657730e@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bWej23OFjSlt0APcZKa60XMDKfHvGMaY
X-Proofpoint-ORIG-GUID: bWej23OFjSlt0APcZKa60XMDKfHvGMaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=443
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502070057

On Thu, Feb 06, 2025 at 08:40:43PM +0100, Konrad Dybcio wrote:
> On 5.02.2025 8:46 AM, Varadarajan Narayanan wrote:
> > USB phys in ipq9574 use the 'L5' regulator. The commit
> > ec4f047679d5 ("arm64: dts: qcom: ipq9574: Enable USB")
> > incorrectly specified it as 'L2'. Because of this when the phy
> > module turns off/on its regulators, 'L2' is turned off/on
> > resulting in 2 issues, namely 'L5' is not turned off/on and the
> > network module powered by the 'L2' is turned off/on.
>
> Please wrap your lines at ~72 chars
>
> You use "'L5'" and "'L2'" a lot, making it hard to read. Try focusing
> on the effect.

Have posted the next version addressing this. Please take a look.

Thanks
Varada

