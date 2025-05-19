Return-Path: <linux-arm-msm+bounces-58508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E83EDABC408
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CB2F1B63694
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B092288C2B;
	Mon, 19 May 2025 16:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6ILHzI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22178288C13
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670798; cv=none; b=tmdRO7Vhrimm8aqxvUoB/nSq2BhAx3JHnLxfvvbXD4hOM4OqlgL2vcLPDor/KY6B3kADTkardwRrm56X8jM+/cKNTS6veMXrI/bikBrfo/DKXjREZ7CGdN+mHlGrtdKCdklEEDhQ64nP9D0rjBwJnbKJhydVEZAkqkXSpWvoTJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670798; c=relaxed/simple;
	bh=TluCJ+QE27SqsbEyuiqmlkaOj0JcS37taUo7hHpS8vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leBBdanE/avcphM4H2zCotbiEghAb29jzmmL6uG5UFFnXDHkDRroxB8Nq6d72ChteKrEUG/x33s/Kp4pyi18AtUTTAHs0oZcT1OVHY8WEwAcih2vCeSUfS50lcyEsyVtru+zF0iixZFzn5yprLe9RKpfUpYWegqByooDQhPWgJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6ILHzI/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9Q8oA012060
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pCInV1QBCyzl4b6q6TN30j8i
	Ig3ET3mzjESHX804HKM=; b=G6ILHzI/FXwbRN4wESyPXLnJftX77rHjbEO/llOq
	6tzTNktXbKIRbmyhExsSWNa1kCDmQLitrNK2bwNOhPhxYtrqdBeQViGonsL1vipp
	ZmwOxHeOk2IZa5pmkCpOf3bduSfB2uwCAsmP6VapJQV78jKcFBHmwxvYDRLZ2rvP
	Y4oUMhbD8rtzyJMlVp4PmwZeZeSbcKHLnOkhchfRMSFGTisemiBIxLTKGGLhFmz+
	ze5sNB9LnTJJw+vlW9UCJBW2DjWi6DqizyYg/CQNORc95BOni5p2NW7fkW+2TuZV
	d3ysm/dRaFVXCfLRV7v8J9EV3Y+eXvoNCsKsd++ztA7R6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9vwv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:06:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7cabd21579eso837965685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670795; x=1748275595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCInV1QBCyzl4b6q6TN30j8iIg3ET3mzjESHX804HKM=;
        b=UtTWXnFlJqFmWiizTVVWhJZuSpFpsr7OlJ9/PVvAHrJLSTy0N3g7D102xPbvpAlvuL
         7zUiH6a0ux7YjWHFtSSqVSjJVdo1Lj5SBOTzSUqe7CvF04ciwifb9ozwCuw+KU0iH9za
         HX5aoqQchd2XQ1oLTCtka6EA/y16xC8hDmGZ4QQJ26I4OVSoOwigH8h4vrzCmT0m4M+8
         ofiFoz/2k1quM6/mkdWIfpSGAFdNK3snhYe91ExhFmipDUO7mFDIyhkeHOS+2BGHyZAJ
         EWO1955BjNrn+SDEyEaHLIX3epgQVLkJpFszsibb0mx3Y0DCK2hr4ZgGqjEOAbDmsDXe
         EdFA==
X-Forwarded-Encrypted: i=1; AJvYcCUpmhUwLE3O+O2he8Vd4yPd+FfZm4q5cJgangUxglzEVlC2NmS3zYS0vwWZ8uYOLaNzr7QKHSw7wDfMtQx8@vger.kernel.org
X-Gm-Message-State: AOJu0YzxxWVSBxoI/MarTEZY5ZeGb/E6m4vbkT4noBGq9qT1TI94CtC/
	8DrUSoW4M2zQNcvV8bJEqq1Ov35ScSlXsWcFv9jso8IvoNz2l0zD+jqL+7yrWiu9AhVuWGsI6F+
	MnNpI1o0CKEwOpPlwvsZyw+6or1VZZ6OjtMPMBl/eQBrnjY8c/r1DxUsk0qEkIrZCiH3S
X-Gm-Gg: ASbGncvvaeyvSAI/LLt4cTv8WE1ciNHYx9XAUJpq0gPksnehOKi5EUm8x+cLz30dtjw
	R9pUpHB+ffz7Rhy13TIZXEocLqm1gDuXXGfuZuY0qdO16404Rcpm/rZ1Cp9Zds/Ay6tC3XNHbl2
	3cv3o5KwPz1xrQZtHKRv7ed0GsS3K9GL2Eu5vbkJV39p+xToK5pm9EQnvlYFrlaBHG2fr9H61Ut
	5/ZUeHspAP0Wx7mXMMUybOELvujvdePltlpmPKnkw8UbgPMYkmMIeIYqamHfhdhAnaVeApU0kae
	y2HGe1llZEpDjJoLKTy4mmMRZy+2J6cVkBVUSQJp9bPgWCvwvBPGTKCHYLWXHtQFLY60dkmJUzk
	=
X-Received: by 2002:a05:620a:5e50:b0:7cd:5090:3319 with SMTP id af79cd13be357-7cd50903498mr1489185185a.50.1747670794617;
        Mon, 19 May 2025 09:06:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMFw5Roez60YZW75hF5ZwRt982I58W/G/fp9+fvjelzz4QBS+enmm/pZaPsaXJOzOWO1lQFA==
X-Received: by 2002:a05:620a:5e50:b0:7cd:5090:3319 with SMTP id af79cd13be357-7cd50903498mr1489180385a.50.1747670794160;
        Mon, 19 May 2025 09:06:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085ce31dsm19233651fa.105.2025.05.19.09.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:06:33 -0700 (PDT)
Date: Mon, 19 May 2025 19:06:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
Message-ID: <t5jk3gmv6gxy7fhr7nbj6wwnutylsgenhepae7im6xqn5udys6@65ysrfzjakhv>
References: <20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com>
 <20250508-a623-gpu-support-v3-2-3cb31799d44e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-a623-gpu-support-v3-2-3cb31799d44e@quicinc.com>
X-Proofpoint-GUID: FtNr--MF098LKnwme9rbalYaIYltWCKc
X-Proofpoint-ORIG-GUID: FtNr--MF098LKnwme9rbalYaIYltWCKc
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b570c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3Gb_2g71upWOQPDw1swA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXzP63rTv8yI3w
 4y1ndr0tgIZ5wnabn5C5N5ldH7enYCs9HJWeUN9KwgL1Weay5QYh5lGbv5bFyrjhNsDc2rlUows
 CZFqnoHg5ZrVIxpjyJvg8Xvc2XfdMWpgv2x4KCrl9mcbsL4lcPNrPfB0IXVbW457bJ99M7g3fD+
 LeZtUHspmMG8sLx+j8Ym+31eVh9Kjasub/FtugGxB7rSBx9rHGU6AMEOJ+TJ1SUMgY8BwrlKTwK
 3Rb4xBCuCvQiENOkM5nWuyTC6Mf1MbM9ICiOzgep4wrc6GaCsfopqpOP2l25jfNRORzFKCCWviN
 tm5mz32kaYEQ7ROlRQMLh8mGYFn+DZDABQOk/s19rYkRJi4qQ3bR6nz5yK5D73QDhC49GMin/L2
 gWMwS49QVV+6hc5KXzYnn9yHKg7gFToFZfLVMx6q27llkP+vlB31XV7IyMhxURafqs4Q4/2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=662 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150

On Thu, May 08, 2025 at 09:49:20PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs8300 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 91 +++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

