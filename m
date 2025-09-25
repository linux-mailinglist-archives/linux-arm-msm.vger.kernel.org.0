Return-Path: <linux-arm-msm+bounces-75213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3962BA1B46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A93438627B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40B723A9B3;
	Thu, 25 Sep 2025 21:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpaBbqkK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4074027145C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758837358; cv=none; b=fPpE9axaJ5FyYsMjYN6k5aCbkECbmTTkUGfSYJ0HWJ4+OV0CD7WRUB5Rp2GAbMhreRzqpJaQcm85eUplGiqmbytTQn2BzL2MMZL09YFrRnJNtM7VPkgUdBJLlKmuJbMoKut+nFkzlTyW1GhpOj9T9Q997fm/NiJ/fq9cUm2UADY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758837358; c=relaxed/simple;
	bh=3m92Yqle0P1klnHDM3h+RYJoZCOb72eoZFr6yQR+E98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CY9TYLNFs7oM3e1jCoskB9PP0LJ7fok6bFRCpngMGhVY5bEP9ch0CXaGM9GpUGRK2e0EQySIBCfOGjv21SSOIg7EnQuErrgJB2UJ1y8wZpaQUZwb+kQnYLdyTHU+EKGk6DZsuwX/P7bD65v4fOMHN+v1cz3kZxeBZ5D+bZrmgt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpaBbqkK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPeeb011374
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a4ka2QLj2dY6T1dJyHEA3YJ/
	IzOlBv0wCYfphXRfYzY=; b=SpaBbqkKOy16rASA7DbdkbFw3KD6rcnU0gSxUHUF
	lY/Q8ztIO9imzJT/UI0c7DxYFgUtMxMUa3zjSpivmlL/bSpUZECRbouC6DOA4NL/
	de9raH2ZzvwUBijW9Ss3lHS62mUtu3g7pCsSoJV8Wu1yAcbaJL0/iO6Nbqm6Z5n0
	FG/11qrHgE7sDjnLZTCqlO3l8ZHirCqwPtyBbV29wHC04gOPtLhxm0dj3iYDF7VX
	J3dmjhvAtjxDFwrW/bnSIvYq3AHKvwBrOj3kpzPK5vJ2jhNCa+0QCMyJrHXQH8yf
	4XV1I1a9AUnBQdh+P+TAfH3jkoUyuifYye5PtG2iHJCuyA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0gem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:55:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4db75c7fa8dso26084151cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758837355; x=1759442155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4ka2QLj2dY6T1dJyHEA3YJ/IzOlBv0wCYfphXRfYzY=;
        b=a1K2MJZP1Sx4MrDTrQEenLWlzS+Jm1nrdMTKHimjPhD19R8MuDrEVxfmwab/0tN15x
         /shVEWQaWhIXDnU7pkCA+ase96OlFS1vLycYK5usJa4MiLsEu4O2itKfmdCOuAdMs69B
         R64Wt+C2yMye67q0ng+pllku0hyuW9HENEfa31d2p4D5dB3Nn1pw04l68lGmTIxmcO76
         xy2LCwJypUQkkgTusGh47IzsKFQ608I3047MH5QfribrZKcclK2MVZLz/h1+0JzBA4Vd
         iYAswqVzSfu6ccPfHeK+Z9vGKTWW9jntMgY1spVTxLdU4pFJAruLB5WX6CEj/VAz12TW
         vdWw==
X-Forwarded-Encrypted: i=1; AJvYcCW3HFVWwTXh0z3G5iSN94La/N1nvsnc752ESR8JvU254+cDf7XgfLQpqKdYlZyD4GIeJ0pVSNIb3GoRux+s@vger.kernel.org
X-Gm-Message-State: AOJu0YymM/7hJ0UZLyCFNiOUPL3CctjQmQ/CmF/5xUHv5V+0qh2Z66cN
	x89D8Fpy5VJtpQEtojXQ2y7VVerGYDXGeSDZhbMPyEiFY6vQ+vm/WJUtvOa0v/pUkX9a0PwqbXH
	EYK+tLx2TTsTKdgIOhjwMRg2JEpGewQHgy8q3zkRgCoO19XwmPSGF+VbEgJScUBaJbNk6
X-Gm-Gg: ASbGnctpQdGSE3IqNVOnsvqpGZPLOTU+NFV2b8RQ6WK2fVbgkNMPXANqMZ3kcx7Z9kF
	FrvQXXcr9C5d/3DVWjZ9FnrLnBbvmg98QCZ4s4ah+ZD/83rBppW4heEtZACoqwOi2iepiUtPyAQ
	HPigBXGQfFN5onbZgWmc7ZCA70MqqgXRHEKNbjaoe615pz3pCxfhpz4PLdmZyAfeBc1lZwxLS5p
	of/hF9flT8xPS+X8QJng0/V65qvHOcboLBjSiBm64k/Cq+BCIg9Z/aTVHW4HGFtRRbcMvjz/8Ai
	H5IVGYO0TkPnpYOwYUvXG2JtYE3eQJkxz/+ZzHX2hNH/jOP4FYCSZOpRVTZRosKKZdyVqxAIpu1
	7QPbVPnQ8r5ds4efv4Y41K9mznjQbZm/+A/vW7VoAuyQNYMRBMiV9
X-Received: by 2002:a05:622a:7717:b0:4dd:7572:2165 with SMTP id d75a77b69052e-4dd757228f7mr2467931cf.35.1758837355043;
        Thu, 25 Sep 2025 14:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYntiu6xF3k5Ru1LTdNfPxLb5elSDEpGFN8h/DlxytsTv6aBQLG8p6laJbBjAkaRxRB3PDog==
X-Received: by 2002:a05:622a:7717:b0:4dd:7572:2165 with SMTP id d75a77b69052e-4dd757228f7mr2467661cf.35.1758837354550;
        Thu, 25 Sep 2025 14:55:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665624esm1154346e87.69.2025.09.25.14.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:55:52 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:55:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v6 10/14] phy: qcom: qmp-usbc: Add USB/DP exclude handling
Message-ID: <af7y4m6pcaeavwyxmswkjwugya3na4r5uaq2hi7cevt4bu4573@3zzfjxpc6t62>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-10-419fe5963819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-10-419fe5963819@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BPXm9emI61TlVMVvsvYVhNRfA-_s2N_V
X-Proofpoint-GUID: BPXm9emI61TlVMVvsvYVhNRfA-_s2N_V
X-Authority-Analysis: v=2.4 cv=aZhsXBot c=1 sm=1 tr=0 ts=68d5ba6c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7a1U2GcbA96CJLvzQ6EA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX859Jt9q2yB+w
 YMfjzuXSQtW794qJWJOwwbfLDckADVMADpotrqgQoxHJtI347NdNKSkhpqtAz7uKb3tNLnfxKqt
 x5YYk7SCXPm+fK/YKwpXqPTM5WR19eEb6YC0bOSLXMSdV+/3EJugW+yKkzo6iHb8s8TSQ+IeMrB
 jUbV3o3jJbyfqbaZ6CX1F5ny933YL6qE27cMWKURdEH8hpjBkZ4Kk1uq4C9YTcsp/XuhNKlWGNM
 mkiho7/U/a/bxW9PxtpOehZQ8P5bNHElIUwborWwgO/89IiaTmytIWfGE1rWBeixl3W55aHrvN1
 E994MXo2TfvaGLdQqaFZrNEfr03CD3sG+8Yry0p3fBh6IWtW4CFpxVqRlkN9Gt7CakZqcFu4zW2
 t7jlCBpFCrWZaMvFHEVEs5hCqRrlGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 03:04:56PM +0800, Xiangxu Yin wrote:
> When both USB and DP PHY modes are enabled simultaneously on the same
> QMP USBC PHY, it can lead to hardware misconfiguration and undefined
> behavior. This happens because the PHY resources are not designed to
> operate in both modes at the same time.
> 
> To prevent this, introduce a mutual exclusion check between USB and DP
> PHY modes.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

