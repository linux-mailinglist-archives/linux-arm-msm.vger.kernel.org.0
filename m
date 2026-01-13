Return-Path: <linux-arm-msm+bounces-88863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F28BBD1AC19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 18:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32FA2301B645
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C4C393DD0;
	Tue, 13 Jan 2026 17:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+NBIslL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joF2zFOo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490323939C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326880; cv=none; b=slbc5exaC3ebj+qBkXu0+YAxHBKwU6SbBfVZQ1ZqaOD9n+vMpLQ1LKrLUGIoIoFHMHkP5idc1qZxgoO4GRWlnJ21X4Kqbe12jTIhxD8kGWZj0X9V11nh3m2gGp+/bxYizYP0F5kbLweyL2JC7NADy3OdunYjXWIFjvUgnXUVf8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326880; c=relaxed/simple;
	bh=ZRXrnPpJm8lDMow8lgpGslnYH2lnJUFefV24pVCZb1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avL65+Y60gHzmxFElfD9IvzY4uXkiipcjYKGLqTqa2DvJmWFdOt6mTLW6Mx/Drx6kZer4Np0izbFY4+2/U7C8wynd4XMSORpb1LpsBiYPtBi6HxHPiXuGrJii0WIJI2O1Yf8V7OGQNIvPMTZUAti9iRrA0a66TDBDUYD93ewlCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+NBIslL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joF2zFOo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DEjL9g4080735
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T7UHyRu1oQnHRFZNo42cXrYA
	1H0xCZn6d1zjyPczYh4=; b=i+NBIslLzTHPua18ncagPctbMD61+Sp+FmG3kTS3
	fWrb4aWKTQVMdmV6APBZ4jtpEDrTsSwUGfq12Sgqofx0vyKTJ/JJgYDLtZkzu7k8
	Zws3FGTNyWtCuT8NZMHUuGoE0EyCBO5VdsWA6NoCZF6o2TVbF4IjBtohlsFmE2OH
	siZWNJRhs3fWlMaPQux3ixlwrE80rSD2+wlErjpCzq5Yz42pKMCOBpTnLe6bTN1U
	0A1s808V9lAwbupOarrEHt+LZgFJt2T5hOCjccCUyhwaQTtiO7ERDfNdlH7SmoK/
	y0GZf+epTZ0/ii9fBsolF0tUGFVYQfDpSf5/Wpo0JZ7eTA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnr3e8p3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:54:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c1cffa1f2dso13012185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768326877; x=1768931677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T7UHyRu1oQnHRFZNo42cXrYA1H0xCZn6d1zjyPczYh4=;
        b=joF2zFOo40Juqs0Idj0gl9e5X96xaTJYwhLptsp/v/bqeTISjhuymd0URpe6b2m2t7
         Inqn15bYd4FiIdZtgr6mLQfamOpVueOUoXOQg94oWUu94jQhz+JebGFFO8IqJieK05V+
         /sCIl59XrnjpfTCS7TA/WAhyBRa+02hUWH1N5otyVvxtbh5JTnb5sIbXI7ZuMO70rOX/
         xTwA2Yf7wJT+AkzESNs02pDnF3q9Lzn+ElOreddAyChmR7TmKrF2VDWSSKY+aUAq1PF6
         vO6oLG0ldUrJ+s4XBtMUxBsodgxQxHH2G9rSfVJ3ur2e0vy1+FXroN9ZClKN0zrvlMME
         9dzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326877; x=1768931677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7UHyRu1oQnHRFZNo42cXrYA1H0xCZn6d1zjyPczYh4=;
        b=UfgbrmE1d9mws40yImScpuDcjEtkyQSA/2kqXIUjZj05TRnmFTh/Sz84MNdpS18JHg
         H4jsahyhQFHFc8msx5HEtyLUh1YlikgFoR4k8P30kIoeJRvIruIMPjCegsF5JG7+b+XI
         yCosZcsycgNOUGINMwhEv/reHDpYxht3yz+yS6MEI8MQPeJIGWy5MzQNFfUD5S3+663+
         CO+CpggR3bHBqTUPHlforHHiC+RbSs9TjJDybml+d4W5bOS3IYD8Kae9o/Ga4WBpH9dy
         Q1hKe2NEvlZxKx0pofMc1y5Xi0sVG3x1sykMENaD4Cnl1PVZenJaGgQcF77nd7HRPjhC
         v3hg==
X-Forwarded-Encrypted: i=1; AJvYcCXklUcONGFqvySSbEWYTcIT8bgCdjE5mAk57wJ0o9aDjArd/Vdp2HPZAaB0VxpmUGzzJQcSDxQGA8Nw2+kG@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ3HpnR7K5mY1UTUGz33B0QpmGlIZeu8lF7NDzKY3znpmEXCCS
	SO/ylmICmIKAILWsMCsRZcNZZDtjyOSmhg51XyOznRQF7/GonYSa6ctx1Z4YQf6MLqS+M+UNC5t
	h4kU5HQmVXVmusXlvod5BklW8ylNtKw3APhXLac9PXe1FBjw74leF1f7Z6Vynyjm1bnQI
X-Gm-Gg: AY/fxX7Sq17UKoUQcfpihXdj3jTTCndaOpxPXACWqSgrCQWj3Y7cf38Xo+pXnWKDjJi
	8ePKNTJywrlrCvCSx8zkgZ7yRk5+mTDpTF8n0VWcRowI0XCL1q5rtE7jAwUVyiOEeM+puvb4l/0
	Qb5mDu6PEbpyeFTKFlyLdB6+JpjPDyiECZIZkPPdnNKdQ3+2xhUIq8WjU/86WAcrr1EdVQTugKw
	2mDcUh35D0ZU63OiIyss95VcD04unOxlyv5osOFJDXh+NwYdUha1NPbKu6yqsumNmu0b3ruDi8L
	0Ggv+0PbzJA44cPEyhTyzvY0qSoijKM2/fDjk3wFVAf8XN8Y566ccAanMZd2keM6bESRbd90ypg
	/fKuYbyprxjIJFTxYp4ydj5kBCdCEBWZc6R4LXg8aZ8PZKyLXHAmOOJY/qyMTsHsY2Ex5w6J0he
	uRGbWSFjWYqGBh1urE171tx70=
X-Received: by 2002:a05:620a:414d:b0:828:faae:b444 with SMTP id af79cd13be357-8c5208a50b8mr537519785a.20.1768326877320;
        Tue, 13 Jan 2026 09:54:37 -0800 (PST)
X-Received: by 2002:a05:620a:414d:b0:828:faae:b444 with SMTP id af79cd13be357-8c5208a50b8mr537516885a.20.1768326876869;
        Tue, 13 Jan 2026 09:54:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3831a754b99sm29452601fa.43.2026.01.13.09.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:54:36 -0800 (PST)
Date: Tue, 13 Jan 2026 19:54:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Enable download mode register
 write
Message-ID: <4ioz5tt4oye5relk7eryk54jtyfat4iglfwvlype4pdi6si5gv@pdrr7vehboyz>
References: <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
 <433fc01b-0e59-49bf-afdc-a23e815cc563@oss.qualcomm.com>
 <cca646c3-5e74-47cf-9dfa-49a888db0414@oss.qualcomm.com>
 <20260113130428.n2kuo2d2tkoosws2@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113130428.n2kuo2d2tkoosws2@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=696686de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vqBD4HcZ2upZQQZC_XYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0OSBTYWx0ZWRfX6hRqmVCZ/Aid
 qBnrGmRCGwaQ0B9sE2tueHTF8p71SQQjuySWnccKsSFa9Oxe5PqTFAo/atKTaqpjLH8FCVGrC72
 oa3m3B982Y6Ic+A6XOVlELUWltQ4L43X8WkLU6QOibhcsgopsNT4VD8/bFtNmiYfNUEyLsq58W8
 rI9UGo5TZvxBlIF4gjoP58LmVjU47RP5y1FjeQlwW98C62v4GzuiQeXu357OXQUqh+R16wiJGC/
 xUqPTC+bmI6SWfWe1ULQSTddAWvDJP09yipzqiCBJGTOa/ug3zUn65Kk2t5G/6MFnvZ4uJPeqz/
 sd45XF7EWDnX6RJV3jySvodWM010dgaTQsZF/85cbArHN8/+jLiLZnYzlBsRvkTVTudOOm3OSXf
 7deWEn9KnyxL3ftjjjQoPTCchWLOVPOTGRKVX/GZRDg8Nyo7cxgCGZVUIu80enWH4d0IiUjRFQH
 27k72sDg2Dwl393xAMw==
X-Proofpoint-GUID: n01jc6XGathAv8l-lrF9Vsw9pFuWIQat
X-Proofpoint-ORIG-GUID: n01jc6XGathAv8l-lrF9Vsw9pFuWIQat
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130149

On Tue, Jan 13, 2026 at 06:34:28PM +0530, Mukesh Ojha wrote:
> On Tue, Jan 13, 2026 at 10:20:58AM +0100, Konrad Dybcio wrote:
> > On 1/13/26 10:16 AM, Konrad Dybcio wrote:
> > > On 1/12/26 4:17 PM, Mukesh Ojha wrote:
> > >> Enable download mode setting for sm8750 which can help collect
> > >> ramdump for this SoC.
> > >>
> > >> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > >> ---
> > > 
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Actually no, we have a mess to undo..
> > 
> > There's already this node:
> > 
> > tcsrcc: clock-controller@f204008 {
> >         compatible = "qcom,sm8750-tcsr", "syscon";
> >         reg = <0x0 0x0f204008 0x0 0x3004>;
> > 
> >         clocks = <&rpmhcc RPMH_CXO_CLK>;
> > 
> >         #clock-cells = <1>;
> >         #reset-cells = <1>;
> > };
> > 
> > That's located at the rear end of TLMM (someone had a funny idea to
> > move registers around when designing this specific SoC)
> > 
> > Problem is, those registers aren't actually "TCSRCC", not even "TCSR"
> > Physically, they belong to the TLMM register window (which starts at
> > the base it promises under the TLMM node today and is 0xf0_0000-long.
> > 
> > What we should have done for a fairer representation is make TLMM a
> > clock provider on this specific platform
> > 
> > qcom,sm8750-tcsr binds the tcsrcc driver, so we can't describe the
> > actual TCSR (as in this patch).. we'll have to break something..
> > 
> 
> +               syscon: syscon@1fc0000 {
> +                       compatible = "syscon";

You can't have just a "syscon", you need a defining compat. 

> +                       reg = <0 0x01fc0000 0 0x30000>;
> +               };
> 
> 
> What about above ?
> 
> 
> > Konrad
> 
> -- 
> -Mukesh Ojha

-- 
With best wishes
Dmitry

