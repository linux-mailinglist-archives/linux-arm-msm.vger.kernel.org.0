Return-Path: <linux-arm-msm+bounces-58720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8B0ABDA29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 15:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 857318A058A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 13:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC4C244663;
	Tue, 20 May 2025 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHl5sYQP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9529F245032
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749272; cv=none; b=FGKWZrtf5Tn0nB/8NISc+6VHuL86DSSZwKvsCXd43qqIkEFTCKDXFckkP/BYZriXm3dOX7GFlGNNINyR2kI00vELS9YJtzO+jvHXCXNsCz4pzKmoWIhJM71nBW1GeMGXAR2oFhqmMWUFUdA8W+cAVEMJ5+De36zMhBjrh1wzc9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749272; c=relaxed/simple;
	bh=nXK9ufiKsqBXb3eX973WRoADBHDdVNJQzE5djvaxmtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=do8Hx2nUYCqsKvmRubuNXcVgLpz8hQn9PSAi0EhRHzRXtSfUgjJIBlCrbIIclXehRLgzxrMosPdP9EJXmNrfcX9D5a5SkuGFCQMhM49KvS9G/RJoi2WOu4Ul4VDzEjmUnw2RyKUJ/1QN7GkIbQIk0VFJVLTYyM0QB74DwUd4u5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHl5sYQP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8TvYa022845
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKyB5pkHo1C3gQE7vRQgt15nCqX3yuNMYU7agnp+0tc=; b=cHl5sYQPg0/JV10/
	3rVuyClkaI2rkhPPUikLP98zrgiUleoazGsclNslgvQ5AeO3rRz30+heuBuVXr6c
	xssbcRzYbOulUy2rALRy529WEvAy/DypSPx1b9oP8bGoWTvfFPDyxQ0HeY2djq+r
	HyMTJtxAilD0JLP31uAlw/lkGo+v07Q0+5UFAAptT8MEqxU3ZkFkKuGnHam9IQkk
	4ug1JQxYAPM/+bJ8NkmcZr60yM8Xfy02Yp6L4vhRDNcTNgVVa+hgCLWC4jLXqG5g
	TlUQg4eGDOr6o4bHrauk0AOMLr71iYsgFQ/boofEowemwxAym49x6DA9q7JKOLf5
	FdUYfQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d42sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:54:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c8a36d8eso63585766d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 06:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747749268; x=1748354068;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKyB5pkHo1C3gQE7vRQgt15nCqX3yuNMYU7agnp+0tc=;
        b=uNKkV+2sPAXBSOKfQ2MU/FqvyDHhYfosI5jX8ABByCnvVoc5zZc5nCAz3zPw8SnZqi
         BdLETuc4egNGjORU8/mvsKemFSm3+DbG5jrIiR8vahz9+3pxIYgE4qJcooIR2BZBDZy7
         TLe8PjbYXhSn5sHef9J7X01UfbWd3h7g6HlXgkF2gUJTERfTzzLd4j90j9X5NU/hu9fj
         9NAOATaMC6FVrh2MSsQhVr/IHtJaFjMnFlS1oXKUk5N/j2v2rv8HCEcnSj1KNKUvUhv2
         sfv9VBkHu2c4rGgaI/b7GwFj1GFMRUjG5usl/vE1VRw5vxIsQ9shDK1RHL/Q1F6oxVYh
         H7ng==
X-Forwarded-Encrypted: i=1; AJvYcCWAaUKRrLAg/vBioaMYetsvJC8g0OV2CgLLWwJgEM3pMUVhHOsKASEhfM/NRGA4hR+vDma6j44qwG88EShh@vger.kernel.org
X-Gm-Message-State: AOJu0YwnDkjLiK9wSojmwatj6WsgXdLZFFVvvlVNmEFlhfEMbEDMR4ST
	dcbE7zZ4Myi79Tw4+aOvX9CcU+hPs3FDoQP8MZ4k+jo1FBxe75Zj42fw3yjx4SxSBCVColuC1G/
	w0NIaCrkDZ6DR9xATV9eCm2HzHsJmRXSiFxKWJ//zd2On4dNjn4EAxziatWaAKhrwgxTw
X-Gm-Gg: ASbGncspZjgoEgOLLNS9Ok+h+ZIJ3Ed8BikzJ5Z5Oy+FY+icyoGTlYzdhF53kC7PvTP
	qJeDpTt3KCpOunybWLFmRraSbpqZ/pjwFN1PrNeu4Fb1+wosYUk8pyba2Ejh74zYWMfH7cnhZ1u
	/gs6qDoAj/SAzOD/tgEGqiW3bb2mHFwH5paVwyzJ0SLY9h+mA8JvsaRqZUz0apqDeS8fyxiykfd
	ah5zPDXsZtdQdrCTR9phljuwrucRlvZcg1+BhGWgMkFY4+IFpZyTeSFO8A/axQxwVItd3gzBYLb
	f3lklFReuWuLTyJdMDpMRNT/BflwAB8Qw1EjMhm7au/r4RoVqFiLjCyoxc/fLRlT1yV3OxmZpY8
	=
X-Received: by 2002:a05:6214:20ab:b0:6f8:aa75:311f with SMTP id 6a1803df08f44-6f8b08285damr273661246d6.9.1747749268393;
        Tue, 20 May 2025 06:54:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGomUSZPp4L/pimh93YiRqj+5vctgnj/TKj4nxkAd6dxpcpxYijLITd5pRdwhPZDWF5haTR1g==
X-Received: by 2002:a05:6214:20ab:b0:6f8:aa75:311f with SMTP id 6a1803df08f44-6f8b08285damr273660956d6.9.1747749268038;
        Tue, 20 May 2025 06:54:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6e38f19sm2391303e87.0.2025.05.20.06.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:54:25 -0700 (PDT)
Date: Tue, 20 May 2025 16:54:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7280: Add dma-coherent
 property for fastrpc nodes
Message-ID: <jlyq4byybki4cwjxjtjvr7zrjrr52ytu5qahvztva7zvxyw6xu@outa6whwpxa6>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-4-quic_lxu5@quicinc.com>
 <isvo4c2taozzlovqwqvgfu2v2tbvntkaw4bdpzmiuir64avojl@3utwffmzmhq4>
 <70ffec25-17c9-4424-9d0b-da6560f7160d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70ffec25-17c9-4424-9d0b-da6560f7160d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExMiBTYWx0ZWRfX9uE3sfWc8jyI
 n0kFX9Mc33HHBlZKpAe7Mpr6GM4j83vR7XEXN5MmzQwz9XqHi34AFAF+9Ee6OkDNJ7Ffi0G2xNr
 2RsWpV5tOz4UPjk0JQcBAsxs8GwzSlPDDiEOLFB4ThdpKO7xpve/QtERd4u+CRjtTM2K6NwMz+b
 K7Qc9G1zAFSDnrieaxjUECryvtAJRk3HuFZAasSkUQ9LlnR9FeVW0gZu+jhO04AQYxQnjH8O2GE
 XTuu/RmMSWETjp9qjygaAquo2JW8/gclJnbRX5Pv8v+Vgt7hu6subo+7e2Lk65jxTHnhfeGa6xE
 8QzKB9y8iVtn3S//fkSKIjRmflILht1Pfyme/t1zQvF6QSW7Vj2LPvMzlNg7qgz5wEhqJCRwQpm
 qJjnbffOaQMP/ufxmtX5Csw5yUEeLZux9Nhfb+dzomkIc2VYkjhwiR/QzBuVm73r7BfqEq5Y
X-Proofpoint-GUID: skeEvsStAODUxeLYPQ7QCcSQbIwEsDKQ
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682c8995 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=jUXpEXVJKfHLzrcEBIIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: skeEvsStAODUxeLYPQ7QCcSQbIwEsDKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=902 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200112

On Tue, May 20, 2025 at 02:47:45PM +0800, Ling Xu wrote:
> 在 5/17/2025 5:48 AM, Dmitry Baryshkov 写道:
> > On Fri, May 16, 2025 at 04:30:29PM +0530, Ling Xu wrote:
> >> Add dma-cherent property to fastrpc context bank nodes to ensure that
> >> the DMA operations for these nodes are coherent.
> > 
> > Does it apply to all firmware versions?
> 
> No, it's not applicable for all the firmwares, especifically for older one.
> This is only applicable where IO coherency is enabled.

There are enough platforms using sc7280.dtsi. Which of those have new
firmware? Will this break FP5 phone? Herobrine laptops? Nothing Phone?

> >>
> >> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> > 
> 
> -- 
> Thx and BRs,
> Ling Xu
> 

-- 
With best wishes
Dmitry

