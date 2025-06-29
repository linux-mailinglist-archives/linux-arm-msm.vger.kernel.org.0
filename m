Return-Path: <linux-arm-msm+bounces-63031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D663AED1BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 01:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7692F1721B0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 23:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8CF241CB6;
	Sun, 29 Jun 2025 23:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8/X7fwj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EC223FC74
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 23:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751238899; cv=none; b=pfisD7NXM/JcWLRYWVsT9cnenXOa6Gnj+m3RhFVl2kHO6+lxvGmZe5Z18c3NW2dFPL9uakam5NHd7gNgWk7MCWvCnT1rghu8zVnKHYYAVR2OpU5c/vpS6vMEJyFoBagy0YRBcZGtrdjvkC9+Suo1j+g/ttA9d71Cuqbwq8cIfv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751238899; c=relaxed/simple;
	bh=zXm10Gvs++RH5Oc5G0CBrarSvIdE4ZdUzCvPiUGDMg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjTLa0jj6b1+d4ttAkpcuLk4TZhD6if+ti3EPPq/zoaVFPFWwnFN3q8dHs5rpU3GcHzvuZUNSQcPkJShx9n/LHEDsx8FnKoSsKm4czVyN7tqEw8OrDLJRgkGgh6Olacd1ZllCwF6CO33GdsbxB4XfablzBnUJUh1q5BnzksC9KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8/X7fwj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TLMupq003653
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 23:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=moUTcLn71exp8xhAgwmP4wIU
	hIDn1m41gmRY4c0fElY=; b=F8/X7fwjKbBozMg/hPMgyz6M89bXtIBh9kgnj3Dg
	ZQ1AhF+XRJ6yRWs5SSuznGeUCpzI1rcHse+uMAHgAv4S6f47yt4FouBgZ9IcgauI
	TdTxdt0+jpE823qeCXxzx/Dwzsk9yCGlc2jz6NCjRs6w5cEImBW30hKZ+U485nnh
	Si7Jn0Z45+7XcdBfLDMyXONumVFTEQC/qkOiV0YqphQ/lhDKwPTbY+nfYScd7Rs8
	WyeM0N97Ip5WQESJTr/6HvVsbAOPKagEl5OkBwhtBDlnldLs64T0klxGIFRpj9UD
	G26Vi5BWXHjulUzR8F+pwC2isQTElUFBX6ufJBQWpu9CJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxaudc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 23:14:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3cbf784acso945519485a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 16:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751238895; x=1751843695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moUTcLn71exp8xhAgwmP4wIUhIDn1m41gmRY4c0fElY=;
        b=aaqX+ktRmRgbZ0Nqblbw1h9FFlv4rbx87SLB8ylh5rTOAjZANrQWW2ZViIpeoqyd61
         bMKeTYnhkUm5vMF60OKilGMYrFLifU1ZXJbAt4iJwNLwbfN/fI9NsXDEMEFBAS56WzzL
         UeB69i5GWMLNVdsjzMN0hz26UL83B/wnDif9QysFOPiRZEFlL1hGuoIPKBBfFRHcCYre
         +qyFcGCa+ZtRZXlqxkKIV+wKzp7PzrumODtCtgwGNg+XX9/a96ngPRSMAJPlhJqGWjzQ
         PYstP34g1uB+y9+R7WCJTsEFFvEzeaTJ6JUq/45CwZbe6GNSx6zK84SyV2m8yxcdKWUA
         UwRw==
X-Forwarded-Encrypted: i=1; AJvYcCV9oh4NqGDhXhspSeY9x2YDdY7k5+gjK5u5ERXxua9LFDf3DstELVG44ZeB5q2rTflpwUukxG931SiQYl6c@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0XiCVrGPO00UK5ye+skA+opAtfYKHbEYG5V8LKra3JrdguAF3
	aCXaaDxShImsI7qQwalXQOdoTRQAueF5Jedbc0+7r5v1SgWPAjz0MCJZM23itH+rJC8q78In53v
	Zm17yOJ7IxZlWIDrKEArbRu/ipLzwPmBpHAdcBzO/YydWIRSoaWR2C3pBMKvP4Ka+XCbs
X-Gm-Gg: ASbGncvYjh29VRsWBCC/TWjkZueMGNlKAuDV1/kFvy77dx7pgyWjJ6pj8PNfI0Yr72G
	+c6INH4S8DLuPRH0SwHklBHf4tWV6bFaBqiDzWF0mR3CxBrkfd9GYTmb9kYpptydZPeJ5H6qIAP
	YTqjFFBTg5Sjin6E4trEHgeH5xOX6WOyOb/qBTej0/IAJ5Bjbi8H2b5iYpWgy2bFPWHV8G13n6G
	xzJ0JMN0RFAcKAKz8wdngoKYBJqvgnoMex23KGuL1/kjx/T2jqKdyr0oZ62AJJiohf7uhQcD/NJ
	kVYnUQt2yuqiR4woPdrCEPI2cILhMiSjHLa0U94ciFoG4HdS+6vvsrKmtkX4GdYva4VwOayPJz6
	SiwBO/gRlYvpwJxjrkQ0T19c1I3+LsUiUm8M=
X-Received: by 2002:a05:620a:4006:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7d4439b8a60mr1660901685a.51.1751238895293;
        Sun, 29 Jun 2025 16:14:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGtolllQv5PQ1tLpSY3ShpYSmRV9yanIB0jjWowyMAtnFeyB8J0IVdJGAeQDimlLkBi7mA1Q==
X-Received: by 2002:a05:620a:4006:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7d4439b8a60mr1660897885a.51.1751238894856;
        Sun, 29 Jun 2025 16:14:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24ed7esm1237565e87.81.2025.06.29.16.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 16:14:53 -0700 (PDT)
Date: Mon, 30 Jun 2025 02:14:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Casey Connolly <casey.connolly@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 09/11] power: supply: qcom_smbx: add smb5 support
Message-ID: <ywav3k7tp3uoynpnbxfvevctwwmfcseltfxltiq7slixflitmp@qqrmp5adjytp>
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-9-ac5dec51b6e1@linaro.org>
 <anawfylnc5afpljxeooruyy3lgxn3wizy57jruvnmro6akfsx7@zdzsnludbl6f>
 <87d8b81a-2ab9-49f2-9319-99d74f84081e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d8b81a-2ab9-49f2-9319-99d74f84081e@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE5NiBTYWx0ZWRfX0aHS0d34CTbK
 Q31Qb3/Oirv1oIHPTAPGGaYhSNs8MaShEl6KiMDEfZ8YbSeua1snmJQ0Qpefw+kp0Qme/5B+cO6
 6eUvrnlNaaypuSm8XEz67COfzBLFlk4dxWf6Yx6v6781k6fIKWj6LgrBGE/XlCgyXb9Z0svYhKM
 j8MvpPbM/eQDOxRaob04aZO7Hj3R/PyYLQNR0aAafxTqklcgUWKb8qWrdBI55wRkCn1jJ/o85mw
 eLMfyvWKPvUuGd5MD13YCHM3Q1USNAp3HBxqrUO+j7EvLIsZtTvNUcfp6kBxztCfobpehT9pL4V
 EYhsljtYyGiZ+EvAXrYk6wR/+aIQcWNaMliHx7gu3p6ht1dANTfhjhZzMnU8m7xxuNaBya0Rv8W
 ONSGeW4BIsN97nQ+3G78HY3Du9Mo63QhILZeInnm16kPncL2L89nqAgUh+fkFFinpmCojwZV
X-Proofpoint-GUID: i2rVHfXMGpgwc47JcwvVjdWkIq12d2LH
X-Proofpoint-ORIG-GUID: i2rVHfXMGpgwc47JcwvVjdWkIq12d2LH
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6861c8f0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=YK0pAgHl7by2gtRoomsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290196

On Mon, Jun 30, 2025 at 01:06:24AM +0200, Caleb Connolly wrote:
> 
> 
> On 24/06/2025 03:06, Dmitry Baryshkov wrote:
> > On Thu, Jun 19, 2025 at 04:55:17PM +0200, Casey Connolly wrote:
> >> Introduce support for the SMB5 charger found on pm8150b and other more
> >> modern Qualcomm SoCs.
> >>
> >> SMB5 is largely similar to SMB2, with a few register differences. The
> >> main difference is the new Type-C hardware block which some registers
> >> are moved to.
> >>
> >> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> >> ---
> >>  drivers/power/supply/qcom_smbx.c | 367 +++++++++++++++++++++++++++++++++------
> >>  1 file changed, 314 insertions(+), 53 deletions(-)
> >>
> >> diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
> >> index 10ddd33a09599decb23c0f1ccd02fa9b56602543..d902f3f43548191d3d0310ce90e699918ed0f16f 100644
> >> --- a/drivers/power/supply/qcom_smbx.c
> >> +++ b/drivers/power/supply/qcom_smbx.c

> >> @@ -580,18 +721,100 @@ static const struct power_supply_desc smb_psy_desc = {
> >>  	.property_is_writeable = smb_property_is_writable,
> >>  };
> >>  
> >>  /* Init sequence derived from vendor downstream driver */
> >> -static const struct smb_init_register smb_init_seq[] = {
> >> -	{ .addr = AICL_RERUN_TIME_CFG, .mask = AICL_RERUN_TIME_MASK, .val = 0 },
> >> +static const struct smb_init_register smb5_init_seq[] = {
> >> +	{ .addr = USBIN_CMD_IL, .mask = USBIN_SUSPEND_BIT, .val = 0 },
> >> +	/*
> >> +	 * By default configure us as an upstream facing port
> >> +	 * FIXME: This will be handled by the type-c driver
> >> +	 */
> > 
> > All of this needs to be reworked to cooperate with the type-c driver.
> > Otherwise it might try to reconfigure the Type-C mode _after_ the TCPM
> > has negotiated some configuration. So, it can't go in in this way.
> 
> Hi Dmitry,
> 
> this is the smb2/pmi8998 init sequence, we don't have any type-c support
> for this yet hence this. When we add role switching/type-c support it
> will make sense to rework this but until then we need this.

No, it is not. It is smb5_init_seq, which is then being used for PM8150B
and PM7250.

> 
> Kind regards,
> 
> > 
> >> +	{ .addr = SMB5_TYPE_C_MODE_CFG,
> >> +	  .mask = SMB5_EN_TRY_SNK_BIT | SMB5_EN_SNK_ONLY_BIT,
> >> +	  .val = SMB5_EN_TRY_SNK_BIT },
> >>
> > 
> 
> -- 
> // Casey (she/her)
> 

-- 
With best wishes
Dmitry

