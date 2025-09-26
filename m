Return-Path: <linux-arm-msm+bounces-75323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB34BA3FA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 15:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F3943A36A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39912F8BFC;
	Fri, 26 Sep 2025 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hg2wO8C+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA452FD1A1
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758894793; cv=none; b=PSj0i8BOnQlNBfMmY8gxoztG1CYHAmrzGaqSVO3UkltNd/tNM+ZqyUdfT02eGBsh7o/NMJOT1HYOghfwYQ/rNJtoUM7evgqiL2ubJBwvNDvaBQWhwhUgvNRqox9L/532RLY2yHL12eFzFAK/JmFVUROvLpLjUXt4Y+zjxUEunuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758894793; c=relaxed/simple;
	bh=cyvgMnnP3LY2SVnviOoMKhwzZV0UGO0ZVHTIbpXE9RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlBaQQV4xGBbLavYlnIqm1LF9fjqc+9rJzdFqUV4qca/hntkhNq3yTMgZnJ7fzEBOSCSD8Q5jrFC+SJgX7/hs6h8XyMtGugHvGNGu7xUPNrxedEqnAlnd82GpQrd5/HIbgfTqk+iaEtgWgZsBOEsLldgfmf4cPcD84Qqg2+0FyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hg2wO8C+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vYpB028368
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nj2RnivyVd0n/WCOVEL7yqPG
	a2Dwqhx2efpqU1IBZH0=; b=hg2wO8C+R0urRtBfZxtj2aG7BOq4ov0hngmLSsaO
	X5KuzdguO8iTvI1k6mXqGMiRPYJhwB94qyXgwQWNc541Kz9d66RpEXEz0bjCYVXT
	0GO4tHcML2p8xnAtjveHkOLeCRCbY/FFYtvoNPnggr3izeH0iDy8t2Iumh6RbF7Z
	f+jLphKHo8upBAAeyGYNhpDo565cesigtjO92ZjDLPYo6Ty0WTGD8Q+uePLX0jVh
	ZWCSJmRKCMrSHOMcC+cFW8ZleEqi7inzPWqClG4zSHQZmI0YUPF87j0ciz/qN+qH
	vyYAXw2tlmrzlvWE1AbAXFTf1CEqoRPvQRhuba1yuwBANw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q3195-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:53:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7bb414430c2so64756426d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758894789; x=1759499589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nj2RnivyVd0n/WCOVEL7yqPGa2Dwqhx2efpqU1IBZH0=;
        b=IGOO22gcN/lZ2GOXyt1tW3h1NLZCI/QUt0bizbj+MbXcorVQuUsWRFf0DrM6AP7eDv
         mF2VTDls9Xh3TUlzH41LPOV3WJjqH1+ShQS/knL1vBdGpVWN4RAXCqWBWAHj6msjTMbY
         McZ5/gcwOoNSRX1f2QO+6TkSkShm0RWUkiKeTS6vNIXVengHHbiRhmGat//ZW/RuIInm
         ofxgD/mUtyqgABm93EV/u+alxGtCcqHMekzICHsKseLH7HnabQRIrcro8ZDMSUaMKXHK
         SEdqGFRn+012lUOHKCFLTW5vgKnfvAB8R1r6Uzz3b4Bi08NAXzblsPOaPZ7DnzbRxHmV
         fR/A==
X-Forwarded-Encrypted: i=1; AJvYcCUwP3BmnZcLGFCp2v6BxMtZCqmvt+jrspA+LAFLmYsdxbzHiJPU2BRrW24plQWajuGigsrcj+8RdFc7ovP5@vger.kernel.org
X-Gm-Message-State: AOJu0YyvxSAzck4miMibdX394R9+5xxTpdwFKw2AZSjA0FvKikMyjbu2
	7MfZwudlONBKhFNwFyVcWw8BDM73vnBVKUPvrnodIRYV66eCRjsaZ1/EyJlWEm2I9dXdrv+wfZa
	RMygz9uWHzKrPJWGkAiLOIDGBPgXEIFn/uGEA6/GX4+IYIWXXMVCsnnMx8jlPBTGihTlS
X-Gm-Gg: ASbGncucVz2ku3bpi3aPoDioWZAlht4AWSJia+W1KpTxWLta5oaxEdMhd4Iti4rxaFv
	+/tZCoByeCCa1oDSvEJxeqGNRze1KGx8muJUClHZ+F8qVkf6BY95Givmn5fX3p13QUDC54QYFSr
	COuywWRtI2OcDKuUScD+K4YgFm6mEk5TgAELxrkejGvUihSUTzxfStVDdOAmSImqRgAqP+jZPcc
	Pj7wlCTVdk/ZppAh6CNboNp7aJL+OrddxBtMuLTz/+aTtkt7UucVjBdaiDBY1t9GhgboRI9jl14
	ajQL5Xt9CMhtu/f1Dmu6aDzd4d7NPoE9Q837kxsnheO6tlL6GeWo8fvsHw18FlVUJhQU01giobR
	jzdkRxN/iUllzBkEZ6sjQ/FD9RVzEbJuYHGMw31ru5HSACXyvaSFS
X-Received: by 2002:a05:622a:1389:b0:4b7:a1b6:cf29 with SMTP id d75a77b69052e-4dace86b1e7mr81075451cf.41.1758894789325;
        Fri, 26 Sep 2025 06:53:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMoJDS8aWtbyVs7IfWYIbTpQ5DxMdjd7gKuy6V247TUGZ3bJClP3qwuMmbDr8kW0U3F2DuOg==
X-Received: by 2002:a05:622a:1389:b0:4b7:a1b6:cf29 with SMTP id d75a77b69052e-4dace86b1e7mr81075101cf.41.1758894788737;
        Fri, 26 Sep 2025 06:53:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316ff55acsm1846590e87.129.2025.09.26.06.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:53:07 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:53:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
Message-ID: <kxy6p3fj656utoubj37ujzycmmszebmwb4c4u7zkb7t46ddwuk@xwg3xht5elj4>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/tpiqTrk5hJ/
 qzc0Issoyq3bEoJL4VRslpls7JfEPO0gmue2hBw4uJggvHQH8+1wFjX3wXELPNrRsahnMVt2w3K
 WPYA9sg96G9XeK3IoWt7vIdaVhdRAULzbF2TQQXG/e8uRmliFCvPcj5hg5+U4kQiIjwVd7Cysqu
 IuwZh3cmmcKZjj573wsn84cGBwvtzXUM0F5GH/rALsgEiGKpCC6U5YHvVEAiSI3MapnPy6VZ8Fj
 MS2vfxd4i5wlcGny4gezJpx/vQih4HgLXQBHIsw2VEoYb/Gvc1l+nVojrJ7i163rUQHYNBgJnfH
 rNuMU/jKLLXCfkfzx9QicgP/+MbhsFz0NASli3if/jJvwq9fpbU7VWQgOcefquYkGOCPPz+QZas
 dXgXQ5g1+RzNK4QB7NulvRJSdQ3DtQ==
X-Proofpoint-GUID: -oflR7nbFSr215hPpLTmK7j4A7lKr_7I
X-Proofpoint-ORIG-GUID: -oflR7nbFSr215hPpLTmK7j4A7lKr_7I
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d69ac6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=jz6_z25kcqxLI5rURXQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Fri, Sep 26, 2025 at 02:29:54PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> with their corresponding PHYs.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 245 +++++++++++++++++++++++++++
>  1 file changed, 245 insertions(+)
> 

Squash together with the series adding mdss1. There should be exactly
three patches: fix for DP, addition of mdss1 to the lemans.dtsi,
addition of mdss1 to lemans-ride.dtsi.

-- 
With best wishes
Dmitry

