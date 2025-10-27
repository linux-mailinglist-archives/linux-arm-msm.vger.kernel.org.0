Return-Path: <linux-arm-msm+bounces-78899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 393A7C0D8EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 88BB64F99C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D055C2E54D3;
	Mon, 27 Oct 2025 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvhJ+CqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DB83019D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568150; cv=none; b=aDyixFyNHyfPUB2XHMGbNCqJtAsTuRFKKeHom6tgk4lhBQXX0fhn0HmF9Q0oAGJe14zWNDDHGGGUFnO9EMliy58oIC2MyMq9xD5vMzf+PfcxEIxPNNQmsTN9JmIB2lJDzyt3CwsuVIYsF6FKYCi7fLhpuVSZ5Jw03PaS67Gbujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568150; c=relaxed/simple;
	bh=lII6u1153jXK7yIvSiss2MRwBO0uCHE+B1I41RCrf44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5H98z6fF+oulyP3q1UuoijVfdJnQH7h+tzFM5NPiEbBncpxPr+8IDu6qvzWtOMTFvSN2Y5m2QFsSaRS+ele8FYw1MQIE1XNnjTjRTi7QG+DmT+szfHefT/gOwkr+tWxdG9gX7s5QgLr79JXu3S6FpMXuiV4cSNfGrXnhWfgG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvhJ+CqQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8OGlX858653
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/rsr7uUBm8i8kH7yFAmBlcni
	G9FofbwGslfcQG/PTJ4=; b=kvhJ+CqQOQkjPo2cVAGfDsuL4HWLYOBffmy/ZTgH
	Popr2gHEwj4bIx+0dYTh3nhDAn17krh++oEtWs8VQsk9oYQ2HNgJtgRdwd5j1Sgx
	6qJmwJynIz4z4Xj9dkazjaJmK1pEwMKfD3d2KxAippn78mA18EW+ZNyB+koL0Tg6
	WwHLnn0zwUpBaltFe5uENtOWBoYPVsBZp/Laf/+v1N+DunkUPbsJpgY3YJWb3zlE
	TFL0d/zeKdgvuNcruDqa8BbVIQmVFx7NP/Orb9h51nfAf1jj3GUFuSSpLoxD9Jo9
	8SDcaCpND7fmYiOH4kaL01O2KLjz6qGqkJhvWXVkRWxf4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnb4kta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:29:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ecf4540bb6so29567211cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568147; x=1762172947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rsr7uUBm8i8kH7yFAmBlcniG9FofbwGslfcQG/PTJ4=;
        b=UxhRJgHwIAQfepmjMnrUThsQI7kxoYZjPBO3jXd5Bai0qE7tad8N5YdZ17lvNmp7QE
         XmMfoDZdEce11iOTPgFqc/AtbWQ2pxS7ojfWSVAxH+wZ7T8IXe9QYonxYluwwULcohsE
         NeRZu7ANNyl/A2fKFgQ7C2Odi9oJ39sTJ7QcpgZbIVFXNklasU0skcO4grmXdyV/mbUd
         CRPgE7cZ/UeoEaA3s2Yh1tgwFokp6ObRnW2awT7GI9WMIDeeVYpf0NSb7VPaoKV0/2Vj
         X80ik/5LpJrpffJYR5tNLhAl2yM4/MqFsQ4p0p9Zf4TT/3bds6E8p4Dl/cK2M3TEF7Z8
         IJ8g==
X-Forwarded-Encrypted: i=1; AJvYcCWKzspwijBb7dib+MjDBXcR5f97UTTl6Z8Sd3ZUPNZZwoxqonzjWwgtwDNe0qkIIqxI0HtN+CHhOUaGjJqB@vger.kernel.org
X-Gm-Message-State: AOJu0YwcBL7uJj+b/VW8RcNcpmIzhMpk0aHo4nVBzClOqREpNrjVA8G3
	0BizxPAo+8C02Gism0eKD7h8e+3BJSnmkFBDqHi+S33LpXaV4qCqJBFx3EqAFIBgcbY/KRjgFfs
	AeVk692pxPFWV/X93xvHcWJ7JW3nWdDnPYtQAOMOyAiG5zVNGtlCdry5d+HRH6wls86+1GA2EiO
	KY
X-Gm-Gg: ASbGncspdqZJm9Y6yHEMnxH3utSvqQRQFPXReLfTCJ0xCAuTgyY/Sc5s3OvpKdZzG2w
	fn5dcv1Q/AoSUw5N9X2/2IWxk+q+8gykgvRszZvbpWTuHVgW3aOrS8pwxsWn98oiJV8vouba0nQ
	AHFMube7/CFoIuwhESSEF/tW6Wl1avdigRhVFIgs6Jy00KB8dOqPu0wYdbTA7Uu5GH8LwbzSFC7
	ufcxpy2p0+pw5H/IA1UeTsEX9rwRS51qzfUFMoLVi5d7OAn8GLQbEl3CHmoVAvBatb3YBoi0XRI
	kC9HiIR2PedaB+cWRYsLfsq4stkBe/h3iYdhmIvTnxIvHX/3GsKSCJZzROv6FNuJ3SDTwnZtTIe
	3QMgRk/AZAwa7Xz4TD4e3mxWiryAv67ZJj7VnmvLFefpZPALyD/t0TcEqQrPeBlJGwd/R3yc9Ts
	sSi8ZAHzvmMDrS
X-Received: by 2002:a05:622a:5a98:b0:4ec:f3ba:ceda with SMTP id d75a77b69052e-4ecf3bb1e3fmr44759831cf.65.1761568146680;
        Mon, 27 Oct 2025 05:29:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbAPmmSvzR7IiPpq3HlUcctfPxA/tqwPBS9g1DPUfBmIKxr6HJf+bYxHzHjkN1JS0U1LBubg==
X-Received: by 2002:a05:622a:5a98:b0:4ec:f3ba:ceda with SMTP id d75a77b69052e-4ecf3bb1e3fmr44758051cf.65.1761568144757;
        Mon, 27 Oct 2025 05:29:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0a56ccsm19486411fa.22.2025.10.27.05.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:29:02 -0700 (PDT)
Date: Mon, 27 Oct 2025 14:29:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
X-Proofpoint-GUID: DKTt4nyk_Wj4GZ1HEtjKCG-LGkM-PEaK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNiBTYWx0ZWRfXxRkoSshVrAOs
 SMpjc7QKqUcdHUApRIf+PVzVkKocwHEaaMDZdE+hNErP2jpdp7CxCmRl2U8lsrpFZjrBQO44QiC
 izslCimOfT+tA9dClizla/skmBGax6eIwhjyr6Ajpu1rWgcrAMIrETLilIoemrBeCjNKfRc71NM
 PxP2DtcQUbBbag0pTdMERbolBPZD69E4jcnusZtdrxeCOjO4KnpY4ugoXhJH6cY68pzijbvgk5l
 d4LGnNt7vHAK8UbAmQUlOqsfdK0Myxaih6CBYax/umTeFk0Y5WmL7SOqCITvHhinPTOQtbxKfUG
 /4l+lwTgIaAmmy1c2xkTjG6NJGivdJY+gb4vjErhr/CQH6999eHZs9IK3zInTGbFFAbtLxfU4FX
 ceybcsDcarQLK8qWVq5epGdleFu1Dw==
X-Authority-Analysis: v=2.4 cv=AJoZt3K7 c=1 sm=1 tr=0 ts=68ff6594 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8
 a=rYq5acLp8HI6pBODZ1gA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DKTt4nyk_Wj4GZ1HEtjKCG-LGkM-PEaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270116

On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the new Glymur platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Bjorn, do you indent to pick up this patch on your own or would you ack
merging it through the drm/msm tree?

-- 
With best wishes
Dmitry

