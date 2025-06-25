Return-Path: <linux-arm-msm+bounces-62409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E712AE7F20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17215189A066
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A129329B220;
	Wed, 25 Jun 2025 10:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oXw8yLoF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C77E280CE0;
	Wed, 25 Jun 2025 10:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847073; cv=none; b=GWrCSvA79ugiP8QlZa7i3iYnT1q6ApQZ4cD514UOUHemp5NVra3WbX+I801Ku4HoAdaV5Fbzjc+qaoPQcOnCja8oD35M5pZWarhOpPsKRHhmCM15aGNc7NZQuLDV/phjITBKQ6rhxbYTX4lu+l6LNcP+iYYFeCYveXNbfrAdbcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847073; c=relaxed/simple;
	bh=EX7R+Z7b7tyVqTJhTx0O4xL8KA2yl7sOtvNha5cobFU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ml2WHMYE+vmMVPI6uMEk3vmZqJbtAFO1c5E+jy1yZFi78Z3uXiPSCmNJHzrFXmz8+U2vt8O+Dbro3mKqHu2UT77CWeqzpqQzeZRQ00gTiNi7iEPLCNDE0PaoO9ja77EHiBETSU94Vr0sCwCBTZCspLFiKt1S7qWVEvq+q/YMlrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oXw8yLoF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P2w3bS021620;
	Wed, 25 Jun 2025 10:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EX7R+Z7b7tyVqTJhTx0O4xL8
	KA2yl7sOtvNha5cobFU=; b=oXw8yLoFW9GCJeGal+So2iKvWGBzRb2dQkwCqItp
	Zlxt9zax9MP+w0W8IbnLwFoQPzfjKxc+TGdX7NUe0kBb4PqVaSnTlAiWpdZ3YDho
	Drso6/NL20JCmDD6iQkiJZ2KywrDrZ3X3MKtlccR5PnybzGZZvp3YL2nHdBDFfaL
	iojcEh2JEuR27rm76sJdMo3fnayXCp5lo6oRgMdG68fH3TXjHBzwIPn7rkWtILfG
	3il3KV9eSVk1Lxq6l3c8YKm9TAnGlsvjyprNQoD/gC/59p2eelZCvx/TdJkQBu8/
	cRG+GlUwZozVV8N9wgIj8i8ogTvN+a9IGnw+Vj/L4xuxjQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec269q59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:24:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAOSwJ013441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:24:28 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Jun 2025 03:24:25 -0700
Date: Wed, 25 Jun 2025 15:54:21 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lumag@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Fix 'l2' regulator min/max
 voltages
Message-ID: <aFvOVebZiP/ZxA+N@hu-varada-blr.qualcomm.com>
References: <20250623113227.1754156-1-quic_varada@quicinc.com>
 <465751c4-a45a-41ce-ab65-ebddb71dd916@oss.qualcomm.com>
 <aFpA4mk2L/sxlpO1@hu-varada-blr.qualcomm.com>
 <99afe9f1-f6a0-46ee-b8f3-2374dc196494@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <99afe9f1-f6a0-46ee-b8f3-2374dc196494@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3NyBTYWx0ZWRfX58FdAr7Q85fB
 4eK8/C6q1VZD0pp9ZBz3YtyLdiD8Vufj/TsBJ59ZNm/jPxKB22O6BsX2bhHnZhASGzdb2WCbV55
 0ND+/3DN1yugj6GieIBX7lsrm1wAOIActEjkKWtbBCUoqPDoFDj4pFYXpYhARgB3ke96LBL3tDU
 /GNE2HCxaYtev4L44itOAJtv60gKKBE3TgXEkmaIAYEPHIHZpdti6ZxOpnmHEc28Wj7wk0NU+g+
 CtAa2YT5cjFCMTn9t2k30RDtRwRx+chHK7L6KrCfNTk7gd2xSKxJNnz4ICSDtJqltmiK6QdJhR2
 rEcsaxVtkW2BJPPlihe/ec87LJXMl3rSJpHQpp0MLTnjdhSXz+tzdtVksPNj9OI3UP8qIQuLzL7
 NA2BlYbdd29XiGXpnuuaSKXow94VtCxF8uN5uHNX9uwnYkN/4NiqCmwCuPuda1P9RrDMUBMP
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685bce5c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=qalDLaGJQC-KPr74lQ0A:9 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wtlXvUJbgz6IBKRJSKHwHp8opUByrLUF
X-Proofpoint-ORIG-GUID: wtlXvUJbgz6IBKRJSKHwHp8opUByrLUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=597 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250077

On Tue, Jun 24, 2025 at 04:38:59PM +0200, Konrad Dybcio wrote:
> On 6/24/25 8:08 AM, Varadarajan Narayanan wrote:
> > On Mon, Jun 23, 2025 at 01:34:22PM +0200, Konrad Dybcio wrote:
> >> On 6/23/25 1:32 PM, Varadarajan Narayanan wrote:
> >>> The min and max voltages on l2 regulator is 850000uV. This was
> >>> incorrectly set at 1800000uV earlier and that affected the
> >>> stability of the networking subsystem.
> >>>
> >>> Fixes: d5506524d9d9 ("arm64: dts: qcom: ipq9574: Add LDO regulator node")
> >>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> >>> ---
> >>
> >> Shouldn't there be a consumer for it, instead of it being always-on?
> >
> > The uniphy block is the consumer of this voltage. The PMIC configures it
> > to 850000uV based on OTP settings and s/w doesn't change it as uniphy
> > doesn't do scaling.
>
> Is there a chance something in the networking part can probe before
> the regulator driver, resulting in a momentary undervolting?

No. The PMIC configures it to 850000uV based on OTP at power up itself,
before Linux driver probe.

Thanks
Varada

