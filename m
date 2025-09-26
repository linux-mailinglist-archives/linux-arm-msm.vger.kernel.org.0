Return-Path: <linux-arm-msm+bounces-75326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65870BA407A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 16:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18C723B78BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 14:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED812F5A3E;
	Fri, 26 Sep 2025 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LT6uGOFX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0179E2EE27C
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758895554; cv=none; b=EuylvrVof5uHZj0VbHeOg+DVwE41lHMN2M0kxLxjSlTu1EEFmKixZhKkTnd34cwN48FTg72SRNKCwis4Zy+RHuKkKZ0HhVOo0GzvwUoABlEQx7HHOqH6SPvRluKpbEj9bb7YLs+kIR5mNFv+RSuGc6Y1gmTAPIGmUzsvMM9e6g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758895554; c=relaxed/simple;
	bh=h8O3JMj2Nf43sk9ATCze+ZZOkp/rooCR8t3VS+9ryNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJZpOkJSfcQEMI9XVD6UZ2kpL2G/ejDxI8h7siRPkuCiG0VGTtq5rmthX6N4g4TW/VfyljgeXLIMGMTSq/SXDojRGaEDkEZ0FoFq1dcwfany6keh8iTHOTBDhUuFhXj3qYUcfW7nlPnxnj4B9TCnuEY0fZ1ceiUJFl0e1lU9Hk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LT6uGOFX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vbXN030586
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 14:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=584nrbDAdLBURaO0cgXzCKXy
	eOmRtZu/VSbhHT0wC+M=; b=LT6uGOFX0SR1QZQJx9bkXdGg/dXzjHdSfKJWmOwi
	ljGQn5xCogB1rQaZbF7TQjvv7rqySxM4f8vz4W6EG0xvvsZZrHZ9+SGW+CAxZouq
	jbIx+2yFc+TajvJYxuLkLkwq2r4AlML6lXHXq58vVNXIwulwRXy8K3dcrc5kAXs+
	bOSMYW4IoVT3BYgfwM5/aIuqPlfz5yfZrMNrlcqI/0JNMYRVd5jjoTX9FyXjEvgw
	+Ffqrkn8clA6GSCPx8HXzIAiH3F9NFhxq/nq6j4rNwCSs7yAO6X9WiITkQYpY45h
	lu4DSs0+DyP9uSx+QdYxo91+dHCp/jQYgSKX+pR25euFjA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u321j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 14:05:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dd932741cfso17634081cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758895545; x=1759500345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=584nrbDAdLBURaO0cgXzCKXyeOmRtZu/VSbhHT0wC+M=;
        b=OIVKMiv5jT63WgtTttRRcjr/pOh598DTktw9sO4kOOWJSjLKGbuToqfOWTJd4yipj8
         jhHgWDGoZnEKheGy9GdJqclB+4kRomAs8gmE+hjcImPkLujJh3YSYVPDEv2JKxUtiAFR
         n2GdPrTz5f7Q6LWfD1ociBBsTFrKlSw9V9zPhgzJcER5+ChqQG/4k0KtJATL1uEfjUOx
         vw1kvFJyGfI1squ2Le4w9ahtosCt5d4wiy0C9AUJPVRggf7USaE62fUPR2Jey23UBMUO
         U+6DEqhGfuyAs9WRe/jGto3YDJHmHgG1Avtvp9/OkQpzelomsPTpKg+nX9JCQtDSnSSy
         Ph2w==
X-Gm-Message-State: AOJu0YyBER3Nq6ePx9ciKBDPtaW3Gz9O5lCwTSAmLUE7jwDVzjHFS8+N
	nTiejYbEgFz2E36C3crH1r25n0DKacgObBGQmqZUnyqOyAjQsR4f0Ss43GBIULHc4IBeOEULbEg
	EO1hV4LVXpc/o/q/0FcStjk/O7bcOJarw6X4npmRV/39LG0Y9pCe4QTmV6K5F4/DM/bI1bi3YhP
	wp
X-Gm-Gg: ASbGnctbpOJGlbdP0qFvXx7Pr6eAcAnN3feOorZ/DKIZ8iIXIqrQxbyjf9Uq7Nk1wxK
	Lnw7s53BRmiNPYWGZ9Z+PxHgZRH1RqeJ0RRMh9kv16Yj5qZI9rgIiaEFfncmZRDwwo02RarvP7q
	XsJHnOeFXyCMD9TCs4HICQYCBgZuIGiuezZ9QO8C1WrOw2z3YC40BrnJ7gjDFRhWopl4/3gSnMQ
	q/EHlSpKOKtp2cr9AVmRfLmr/md0RE4DMGm/Ncf+JBbRJ8l6cMtI4HLLw9Sl0MI1U6H4FEPe0o9
	2+WZlcnurhc68rsbXMsMmFo3biiJUzV2Xs0BKSMqTUIq/eHPsFvLaQAi+32vNzHEKxzNQK8htWO
	n+VRmfIKX38dYTRkI16UMGOxMa7TU0f3UUwR4kPB6KWmNsvroW/CJ
X-Received: by 2002:a05:622a:768f:b0:4db:dd57:e093 with SMTP id d75a77b69052e-4dbdd57fb69mr58371511cf.51.1758895544714;
        Fri, 26 Sep 2025 07:05:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHltJA6GbWIV/+igvGWnl22Iv/P1bx9gnuRDpBgQL59uVz2fnVyjK+CDBIlVIjHHYtcOin3WA==
X-Received: by 2002:a05:622a:768f:b0:4db:dd57:e093 with SMTP id d75a77b69052e-4dbdd57fb69mr58370611cf.51.1758895543827;
        Fri, 26 Sep 2025 07:05:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7710256sm12274671fa.45.2025.09.26.07.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:05:42 -0700 (PDT)
Date: Fri, 26 Sep 2025 17:05:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
Message-ID: <5irzdmwxs2j4ppti35hc5235yxqq576doerrrk6fhcpj7f726a@eh5rl2jwb5kg>
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-3-quic_amakhija@quicinc.com>
 <vsty7sy7gi2eeyifokwcqpoycmarxietkijmlkymwrmzmdsfws@x64f4ulbc6ja>
 <8c248bf8-2f25-443d-a08f-6504c349b72b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c248bf8-2f25-443d-a08f-6504c349b72b@quicinc.com>
X-Proofpoint-ORIG-GUID: Q2oCIh1hotPn1PuODmznCnCEyPzpmWkW
X-Proofpoint-GUID: Q2oCIh1hotPn1PuODmznCnCEyPzpmWkW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX6a4olgRJSDSv
 BN0Ja7uMmFLMbGFK+EMPL6Jf7vxMiO7vFxi8/W7mBvaBcn5nmgDw+BDNFTfWLG77DTJ6ToRF/cW
 N+hvo3jADPl5JGjpDVlVdJdCkJG6h+cv1xThW1IBoe4VvUsfGY8HG8i3U0OtfLyVTkXsDATsHWB
 jvjnUJl4ADCK2cKrZo+NlKhvsA3m4PeMPp9zZG/pG9w5i403N/4OwyrJM9NTsbLodVOl9a5N8zA
 NG+lCRIX9Ok4cx5PzjHxZish2ba4PxJxRsBRbzqmqVBhbGACQukYTjMJe1IVSnqGd1WUBm0Myck
 c1RonzzTX5cuRqYzJf8PKhKkblvnCKoE+Xw8YZgJo0+1C1Sh+IU4wyIvJ/Y82kgx9mWVQg1wkGZ
 4XXFK/ulZatMeFrEcKKBQjRMK5tvUQ==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d69dba cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=fWuQbBWbtaeYDtlrs1EA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Fri, Sep 26, 2025 at 02:55:19PM +0530, Ayushi Makhija wrote:
> On 9/26/2025 3:32 AM, Dmitry Baryshkov wrote:
> > On Thu, Sep 25, 2025 at 11:06:01AM +0530, Ayushi Makhija wrote:
> >> Add device tree nodes for the DSI0 controller with their corresponding
> >> PHY found on Qualcomm QCS8300 SoC.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 95 ++++++++++++++++++++++++++-
> >>  1 file changed, 94 insertions(+), 1 deletion(-)
> >>
> >> +
> >> +			mdss_dsi0_phy: phy@ae94400 {
> >> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
> > 
> > Add qcs8300-specific compatible and use sa8775p as a fallback
> > 
> 
> Hi Dmitry,
> 
> I have one doubt, even though the ctrl and phy versions for sa8775p(LeMans) and qcs8300(Monaco) are same.
> Why can't we use the same compatible string that we have used for LeMans ctrl and phy ? what is the need to define a separate
> compatible string for monaco ctrl and phy ?

Konrad responded with the reason. But also, this question should have
been asked when you took a first look at the qcom,qcs8300-mdss.yaml.
It has two compats for DPU, DP and eDP PHY blocks (for exactly the same
reason).

-- 
With best wishes
Dmitry

