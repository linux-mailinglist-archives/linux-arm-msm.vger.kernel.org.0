Return-Path: <linux-arm-msm+bounces-58246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1985ABA585
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 23:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C550A9E2637
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 21:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8181A280007;
	Fri, 16 May 2025 21:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jhcd1Mgo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3D823D28B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747432103; cv=none; b=C77CZMGIppJ3nMvGXxDAkIFCC4NG29vHhEjJ05FPiG0F5/e/LZ585rF9mI3GdXGH/DnVSrs01e+Bj2M5y2Du0YUKk2ijR6QkF34X8ik2tO7Su4Z2H5ILvuckDtW+KyrRs8b+rj0SveShgmvWZIBi+Yq2MykMFFJbyXwBxhCqDZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747432103; c=relaxed/simple;
	bh=Didp6KrFIhV1S/h6o9Ujxwv09t3ChwJ1oYFKdnaTwZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfxrX9tfEimo4i/fbSseyFEMb9Kf86vlVrCtp6DJxqNaAijBZd/YBXO8Fvq/jy7fQg/1nK/nnWp46qjLgY3CRaQcvYjJSK3bpVKrkoPXRv17UnkqIvghtCZVOJXoDolXNJe/0wJ01WHy8maNRYR4MR1JtWd6u+npiHalP2LbEHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jhcd1Mgo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GGrdZM029980
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 21:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qbltmRM7JlrmyGCBxvVyTbdV
	Ddga8Hd+DhpsvKXmjA0=; b=Jhcd1MgoHumhHtK9GCdBmVgx3RF/S0f7YchRDPqK
	P4UxFbbmIj1ZsYbNrl3YQue4BTy5Zwa+vmnRpEGJW9YADQVznGSh+LWOP57gKFZE
	PO10/VtiBZ9eibJ+MHNGwmn7YESnyfhz+vbfHh5JGOaY/0mCg53A+On3WiPbxGF8
	lhQa5ZRPGCaOKHCzYnSC57RY1Za6b73vniFO47QHjzN5+5ZqFCRbuvBW9u3DvMBG
	bjSFSExONikZWqEaWXxju+bBGe8x9Y3GXYFmA5UZmfC2SNuEbXCz3dyhKq5+zvoA
	GxPBVDThrXwjAouRXwL65R+jAa3E0C3YBhiDiHUTXhFFyA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p997gk37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 21:48:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f6e59df2f3so49213586d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 14:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747432099; x=1748036899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbltmRM7JlrmyGCBxvVyTbdVDdga8Hd+DhpsvKXmjA0=;
        b=f8X1LGs/0YuTPRVDJHGeukzmNLrWde0+fuj+OqrkcYydtZxhrn0pz6u3lYw7iLRWW8
         6jVv/yGiJdqd/YSSo4CTcdsvo/es9qx75yvo8EZOcfh9RgiifLSTIqqmqRHO7BTLrXWz
         YrUM6+TD8mg3nn0XbrpBp3mIQmwKXF1WLNZa+Qgxm0RSO+ZkN4hALYGt8CK5arXWMXmP
         pu+saXLDKmg7UuFmj1OV+xC2v5Tu3ZQAJRYSTqb4ifp5UV71q9FFzZkhKAmsNHAcIwlE
         kN85RmJzdD2CTLkdAMtQ9V1MkzJ2yw/RYy5astN/p4lpGZR+FRmBggYEOr7oHgARO29l
         pq/A==
X-Forwarded-Encrypted: i=1; AJvYcCXkMvFUYJudj243/jzIKALrm/iC9McbN7X4zlKoupLJZPekxV2t/rYgIJrVkhb9aCdYTsVtxpMWSbC7RRu9@vger.kernel.org
X-Gm-Message-State: AOJu0YxG1/TYoUwmxeQevOGX7x+19k3e8zS24ZCDVjTI68HRcFXzu3gV
	awX9AtLTUVVyALxrsQxOj24okPs+WEhOX8eTWjoGL47lTaZaOIGcX/jP8LzJ0KAPNMMYFHaixNR
	5DQrstG3v96mJg6R2Y+FF2+Pz8rzlDt3ix2zm+h4c9KiIVGp8EWD9SB5cwbPVpA1/AMZHZnYOWG
	wS
X-Gm-Gg: ASbGncvVg1Xw8WCLc58s8G8iHqCSB6AdF2TjVOYSzg4m6CkT+6Zzqkl4qwqq2YdY4Ao
	kpxGCkhJ9D9XfTZynElTWWfN3ukbqUjKGcFVtB+4drSSgDGfQqZCVfKncb+rpPluhfEXhDfD+LU
	lS6RMCOAs3G84pCqkgFGmFD7rltfPr+3xTc/ptUn3+h9eRZjXBBBvM1yD9z/iv2pF+Gn2lUdgQt
	jbidRe6dpys4MVtonLuFtsFPIdE5k7u7Wc7HKsJguXS/m7YV1H55efhCA6XdCVxRDjJfmeBDw/h
	EvJ3zik8mupc2AOY/8ik7LmOcrO4da/lslLgjpjSzwKnU7mmsCpU6mEA3Ajiql6w4gExCAegWV0
	=
X-Received: by 2002:ad4:5aa3:0:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f8b0881b41mr81864546d6.22.1747432099687;
        Fri, 16 May 2025 14:48:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAhaI3E9/IjY0nDQWubM4B54dueY0af/V9BHfJW4rhaZu/IU/g3HCb9iJtPMbh6FEdJl7WzQ==
X-Received: by 2002:ad4:5aa3:0:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f8b0881b41mr81864296d6.22.1747432099355;
        Fri, 16 May 2025 14:48:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e7a6sm606380e87.218.2025.05.16.14.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 14:48:18 -0700 (PDT)
Date: Sat, 17 May 2025 00:48:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7280: Add dma-coherent
 property for fastrpc nodes
Message-ID: <isvo4c2taozzlovqwqvgfu2v2tbvntkaw4bdpzmiuir64avojl@3utwffmzmhq4>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-4-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516110029.1637270-4-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=U7uSDfru c=1 sm=1 tr=0 ts=6827b2a5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=X77NXM8zCmOlsI4LSM8A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxMyBTYWx0ZWRfX1NYKULOpsaK3
 mdlLGGwJcBIPH9+clvJ6Qiw3PdG62UkvdYfuzaR7VWasWN08w94y9wyZWi+zmY8dcOAvOqLD1Sa
 dw9mR9One9oEqPFp4OpfWjxgMk/vDlZOvDxp2YBSrtTwytG6NBRKDXCBa92QwvlmBi0TUptFCCS
 d9mm9wijQvBDwuqLKnzYD3pODy6IRcRXxnoivak/e0ktWFdBPsjjModERdj4mGogmtwsptBlpG+
 8eRROrgBkdvXYMRvJDztt/NKQwEMZHTSu/dG4RASYGMptjkXW3j1D2qGsq//6dZtU6lUHPtHpVC
 Q0NzgLMIZW85uRV+ZVyIEO2Wi7AAQvSH4JSU0dy26YDlQeHMEvaRJfXJOhwnmHyTHsegb/AoXfw
 8Em0xSX8XEOqvMd9lTobW3w6+qqQoFpanOXJpoYVCaQ2WnPcnkrr7+90ntWD8Qm1pccnHoai
X-Proofpoint-GUID: qC7WA8StLsFk-Ni980PFubKHnJmZLHfT
X-Proofpoint-ORIG-GUID: qC7WA8StLsFk-Ni980PFubKHnJmZLHfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxlogscore=833 clxscore=1015
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160213

On Fri, May 16, 2025 at 04:30:29PM +0530, Ling Xu wrote:
> Add dma-cherent property to fastrpc context bank nodes to ensure that
> the DMA operations for these nodes are coherent.

Does it apply to all firmware versions?

> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

-- 
With best wishes
Dmitry

