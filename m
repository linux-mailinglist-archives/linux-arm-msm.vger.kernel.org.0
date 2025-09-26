Return-Path: <linux-arm-msm+bounces-75349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F47EBA5569
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 00:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35D2A3AB142
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 22:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824A12848A2;
	Fri, 26 Sep 2025 22:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NIIdeMse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C8B2288EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 22:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758925965; cv=none; b=S4oGmXZmmX0eX5BtS6uQKnF9vrTiNmzJpMtK5B6wUvWB6zSa4fTCgrtsutAshmWxVRAxbAWwSMV5F3XN8sngz/p6HSieO1acKG0ItXAdZ3RTPWYB1TzeqUGLrKOzLgY4oLoEcYxJpvJpU32NJBxxtl5ejWUgJE3KxnYNXA0HAeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758925965; c=relaxed/simple;
	bh=znFcf1RBV0F44gQwo5us/gWI6yjbNviXchEBoQK6rSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVVwPtaEad4sP4ijvDxHCUSfolHyUGn6HgRXROhoF0yxu7AlaNCOB4BCsvmvJDxJxokWFuqvzyHm7wGxuiKmvA7YBKpUncPmqO0IlrNakAmRLpeOb64d+yfk1jf+i5EBOJVNOHZ/E9Y70XlVX3tie3VxbK4ttUc8Tj15ySHk+zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NIIdeMse; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWpN2006733
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 22:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2SVj+rcrTxYvSoZ0kq/i2JFM
	zLdOy0X+vezT0Ex6p1o=; b=NIIdeMse6Y3bSYMx9gvq5jlmkWzGJ04T9+n4a78b
	MNxEMKfIr110a9g9unBtvcBxZ+gv89wrXtbKus4OLaGllYRX3glsv/pwD7l/A9wJ
	CkEIQFtBigf7W8WqCjGdbyNMqFAsyVu8AfCzKJVf+lgAODVIT0l+mXOdO/l5xBM3
	aOpjumfKq+OUcsA2gyxK/WePIeW6SCMA+uGFAy20hOA3koo+gG0tquk2tECLHRef
	RxBzQahiUGDa0gdSjr5E93PgDbhi4/9NFiu8q2QxpiNGn5O77MU2ddSL2RUUro/4
	mDGRGxIzFhe3G3MrLtaF1FxJX3uP+JL8Dbf7Hm5Ofy2XLg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qva7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 22:32:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de801c1446so18345521cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 15:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758925960; x=1759530760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SVj+rcrTxYvSoZ0kq/i2JFMzLdOy0X+vezT0Ex6p1o=;
        b=QwNKatof7zlU3VXB1d7TVkELJPeR+K7B0ruSTqvdU5TQSCo5cSOVhXk/cw5ZjuGlS8
         G3tTlOp9WxAl6EnHX3iLXd28BKlswci+YS1yEG5zENlMeD8JhCQet5Y8BzQWQQJrERLA
         GpENqyL0NpOJJykXDYt6tWF1fNq3rF9ybEYvukV5FdmLLAIo7nZyKGX7vIGGCxgjtS1x
         pdhGuCRMgBJAueeaZqlWXTtK+xAEY76sXOsKY7gVYp/NepKFdlNaHOu5fbgscuzhkuXb
         LLiPR5S+5M4Wq9pDP5tTc/yLxFL5MA5e6SgBPQ93cndqFBl5FLmdqCOaDvRDtPdQEqMq
         XvRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPQBIvUEC3aGDPlZ1t2LcD8pC7y0mTKSkNPEOyGTm9vqNm+YoMV2yCCKyqsUb8qFt3T7c8bvpntM8/hLXO@vger.kernel.org
X-Gm-Message-State: AOJu0YzADQUfCUJZDOsT9IVvRQipEJQ12g1Uu4pcpxgsSFBwhkq+Cn6q
	DMF6IxUU4Vr+VvP8udQPJk10oH4728dGZLX2ecxrI7PSSc35eMD2KVKHIELek8Qh8+JVmj9VgoC
	cO4tu02gUfPHnstqaLqOXVUFtrdbbtrAEqNGH1xTLo8Gs2ybAZtoxoXPkiYVT/qONmOce
X-Gm-Gg: ASbGncsEJwEQd5Cf1eiHiF1yLbLOLiVp5gjlDIkDZDc+/AZSPoBsPuMaTVdNCoDf6KA
	kYwJRgr5zw4PxOnJlohRksXI+mK0zpnWlloB3dm7ITUd8DJfCTCN0ERsvIXBcOD0YUHbJuh1duf
	AMUot5loTmP5ddjmJSKKKdD07ga3CkjEQLPOPbhb8aasXpuz5wN2oMWdqS/A0jnRW6Fy8RMxJLO
	BQXfpdgZ8d//QBaExL+sAWzqnT95l8FIC2aHgjUccrvQlQxSvxEI/fL0fdnAuK55Xo14RB5phq8
	/YaCGlV9+6ksffPKG/1Bwq/Mx6pxAuM5dnsmgR30qBoCo237spz8jbbsYg6FtAY9LmG92sM5/iZ
	buQWlCQCkCPSnvLo2PwgN20m9dhntVZLq1aP+VhxwYDAPRxQm8jKg
X-Received: by 2002:ac8:7d8e:0:b0:4cf:b74b:e1af with SMTP id d75a77b69052e-4da4c1aeacfmr120856951cf.63.1758925960421;
        Fri, 26 Sep 2025 15:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSKsflht3AH+ZuTBu3r3cqv4Tg39yfPXMIU2pgxdiUv01mDKS9PShSozAj2uV/V6eYBFeM8w==
X-Received: by 2002:ac8:7d8e:0:b0:4cf:b74b:e1af with SMTP id d75a77b69052e-4da4c1aeacfmr120856541cf.63.1758925959860;
        Fri, 26 Sep 2025 15:32:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430ccbsm2145795e87.17.2025.09.26.15.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 15:32:37 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:32:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Rework X1-based Asus Zenbook
 A14's displays
Message-ID: <nemvj6vyk2mj255l5fi372677znsptawkkhx4zlcsty5enpy6a@fhtpf2c6v4v4>
References: <20250926-zenbook-improvements-v2-0-c0b512ab6b57@vinarskis.com>
 <20250926-zenbook-improvements-v2-2-c0b512ab6b57@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-zenbook-improvements-v2-2-c0b512ab6b57@vinarskis.com>
X-Proofpoint-GUID: sl0CPXrYVMncnUCFhNdDZYJrcHoQ6efp
X-Proofpoint-ORIG-GUID: sl0CPXrYVMncnUCFhNdDZYJrcHoQ6efp
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d71489 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=gxl3bz0cAAAA:8 a=APu70hjm6WG7nynXYqgA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=vUPM0Wvl0xcrLs4nqPIT:22
 a=kiRiLd-pWN9FGgpmzFdl:22 a=poXaRoVlC6wW9_mwW8W4:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=UDnyf2zBuKT2w-IlGP_r:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX1/bX3U5JxPJD
 InwCtFuBEWTmjRbHB6hNkd4+A/7dD2HXZTipRdkICUb2lIVP/aooDVynev+4fZhKz+j9HSmxBOO
 09lJqI4z2CZTDr0+Da8E3wFPEvG1xq6kedPdbol0an8SrJReHqOenjrkg/uaYy7wgDE3sI/nLrM
 s44uo912y0UCTJ0vDCXhtA1W0VwwWF5UQBbdcyw4seRbgz9pUsU9iwqBRNU7++s2ieG2XcT8mpL
 yxAdNT9tv4WpPClA1g38LbeTPk9Tdos2tPKPgnJqh8SvUCJcX2PwlVDdRbxee+FgkOE56qQPojJ
 fAvvr4+Iv9P+lPyAUu5hX6F1x7Rz5FMfdcnr8w0UraUAfECToBqlE+/UkwM9jx/3oAktHb+RNlG
 n1S3Vr7LISmVzOmcmL1RqnYsCGjU0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Fri, Sep 26, 2025 at 09:08:53AM +0200, Aleksandrs Vinarskis wrote:
> The laptop comes in two variants:
> 
> * UX3407RA, higher end, FHD+ OLED or WOXGA+ OLED panels
> * UX3407QA, lower end, FHD+ OLED or FHD+ LCD panels
> 
> Even though all three panels work with "edp-panel", unfortunately the
> brightness adjustmenet of LCD panel is PWM based, requiring a dedicated
> device-tree. Convert "x1p42100-asus-zenbook-a14.dts" into ".dtsi" to
> allow for this split, introduce new LCD variant. Leave current variant
> without postfix and with the unchanged model name, as some distros
> (eg. Ubuntu) rely on this for automatic device-tree detection during
> kernel installation/upgrade.
> 
> As dedicated device-tree is required, update compatibles of OLED
> variants to correct ones. Keep "edp-panel" as fallback, since it is
> enough to make the panels work.
> 
> While at it moving .dts, .dtsi around, drop 'model' from the top level
> x1-asus-zenbook-a14.dtsi as well.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> Co-developed-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

I'm sorry, but I think the order of tags is incorrect. You are sending
this patch, so your SoB should be the last one.

The patch LGTM.

> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |   7 +-
>  .../boot/dts/qcom/x1e80100-asus-zenbook-a14.dts    |   8 ++
>  .../dts/qcom/x1p42100-asus-zenbook-a14-lcd.dts     |  62 +++++++++
>  .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dts    | 133 ++------------------
>  .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   | 138 +++++++++++++++++++++
>  6 files changed, 218 insertions(+), 132 deletions(-)
> 

-- 
With best wishes
Dmitry

