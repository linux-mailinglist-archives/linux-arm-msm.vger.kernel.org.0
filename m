Return-Path: <linux-arm-msm+bounces-59253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D4EAC2979
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 20:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01A4E1C06D7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 18:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5CC29B222;
	Fri, 23 May 2025 18:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yg81W+1e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF237298C1C
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024301; cv=none; b=hj3dYR0cxCt3QFAe7dA17khcDYL6SOxgMzSryRPQvhJ3KoeVz/ZpURyi41BghD7M24Yp2QxuhaoREvotpT8KaDUsB03GE7S9RpmJZw0U+/2tXEyeKTA/lG2bbdb2Q2F2GB3WHA5jQKk91TMI4nYmjvFgJ6Qdpi6PDU3hS95PG4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024301; c=relaxed/simple;
	bh=BgjAMer4sBy25cvBdt4yVPcZycKJiNEnV1nfqRFJobs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OG3RL8riZp+wa0lvplbRG5atcGtvHKBJh3klkQPMKoq9eTfuY9BR6Ma2JmvnGZJv70l6hIXrQssBQD5SioTjVp4n/34+z5C+kr8eaiTzQm4qsKxPA60vaGZ4InjDgUoecAgIPG3E7Jj7h/taaWaxL/fZJAas2i4r7EvB+UyZbXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yg81W+1e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBvHqw029654
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V9nZ5LduKS47wlhyfgMEb7Qw
	5TuFpQZshDkakAX9jxE=; b=Yg81W+1eHFyyyKVUaS/d0IQRon4mr528HeaTbRO/
	ngncNDjc0ngAZVhZv5a39YpecHcUcJzy0zLdObyJm5hFiokCBP156uZtK5hxYwzY
	4AQILCwINFdepvbnoTYxMMSy17IfxxEWHrBXLjFM6Vr+Vbs58GdUVC8Gx0bac17W
	i7AdcKz6seqnVH0m06Y/5xjjhEHQLHYG15wiO5TQD2ew4LZ7i1l+ofbU06XvZUqJ
	KSw/u1vp1nw/sF/cCbnQpXmTFcX4UqTW4XuKF5J8KhGfD0KNwiJ4QYaMYgmeqjO/
	D6zXDR6vc7wx9JumFecsWvH8Rwb3Y8jSdyHha9YjXSQE+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4aydb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:18:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee990721so25375885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 11:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024296; x=1748629096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9nZ5LduKS47wlhyfgMEb7Qw5TuFpQZshDkakAX9jxE=;
        b=J4GBDLOlUVgnaqAJdj8YGfIgcCTjTv9hEAUaYd+n5U03YON4xu77SD9qg8A/8VFVXL
         /bR0XTGQFXATRlvqcSDMGKQ3l1TOfb1/INiBxELQWWGTTpakTE8s9mC1bkBl457M549S
         LHCKXQuU0oNFFhYJrn7/wO665rCMCVF8E6I34AcL8eA34HXQth00hvYJ+3faQntcB6MB
         8w1cPE7nuPEyh1QPm06BltZG1R8CXFaBYYLjQI5Rogif7EovAu/+sQUhRgvbwyNDJu/W
         pHgjkkAb53m7YX+U7WAwI8rRQW8iHoICWEriQn+DB6UEqAPaoLt2DvI/sga1l99TPao0
         Wxzg==
X-Forwarded-Encrypted: i=1; AJvYcCWXW/DYgqgELorRFbLczTfrPN3koDNqZ4FQZ2jtzxZzEvVDWuE/8hVR6/J+IEVb8rdNlFv8vNwRL7Oj3o80@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3W+vS0Fm0agIKCNiHXA62gYxNxED9zdwhjI+fvJ5ORPGtxEh6
	q6e3JPbfR1SxHJwLe5O+tDvUenBJPIiI/UAQi+6eOt5pP/CbAZDpGSbr5Gu3oWsFwhwqBmXn2pv
	f7EQuc5MK3tyST6xuZqp1/KMwFKyMxybIFdbBVBPLP98zbPDP0DQE+PQinDXnSyN9bKUvS5Au85
	AH1kU=
X-Gm-Gg: ASbGncvinRCcMemGw5rPKQDfqgA6r6LBEqn9QH8RikpWIE56k/7OXgiQqweG0x7UcZ3
	w8X2ghmm6QBnWEUmeKTuPu1MGJJ9Gv84A7zL/XV3egSX1TOdP1q5gqChmltDGycMNcFZ+vLKO1B
	eTHcWs1pjNzS6rrW4u+L7TaMnCRmsxZac+e6V1+rLfHeiIxJgYp2Qbgrz1yx+qvl/s0D1ar62bu
	bKp46ibih/wk19AslPaFw4IV+Qyf2AMW44COMRH5C9pyys6pjZYrFXSbXOn5lcTmU229Gfr8dL6
	8iUhB/5t9CwRy4syHqN44oX+wnoUesLGnlyGINEZMqlDxAjU5G2UTjOI52OO4i2ievTVTb06VPk
	=
X-Received: by 2002:a05:620a:3941:b0:7c7:827b:46bf with SMTP id af79cd13be357-7ceecc2c915mr28251085a.39.1748024296136;
        Fri, 23 May 2025 11:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBS9Ctk+KlpdqLn+ytgHW8TpGchLngqgx0WbnAgQSn8atp2AfEvN0QF84rqFI/UCbAfB1ioA==
X-Received: by 2002:a05:620a:3941:b0:7c7:827b:46bf with SMTP id af79cd13be357-7ceecc2c915mr28247285a.39.1748024295713;
        Fri, 23 May 2025 11:18:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702f462sm3976032e87.209.2025.05.23.11.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:18:14 -0700 (PDT)
Date: Fri, 23 May 2025 21:18:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 03/10] arm64: dts: qcom: sc7180: Expand IMEM region
Message-ID: <5yseir6wftotl6gl4mfovfv4hoiurs776a3hkvf7uxt2gjvonz@ztqmyuw65ycs>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-3-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-3-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NiBTYWx0ZWRfXwAxZf1wD1yHT
 Y/eU8zByecFIkRXwG7maO7m+HtMLKqEYr4JKV/gN5OvkJ5Sk+hLzkZXjcuaktuajf7mZeRw2KA0
 Px48pn/6z3DONDwxMOkRehU1+AoMVGjzsl0aejrH9AoN0Ay7UHm+OhpYYxyLMP/uLH9RhAicMtR
 p9I9dyK0N2WdKz/8yqd5XBIgzzCiVQORwlH5PjYRpy0IPwZh2ycv2jAzlfXGbdgCTEgMhHXUW+8
 TPMIoakWEUoo7TmZyeshceI9L1O/s5OLtXfwFEEuc03P3dDNDgV/OQVLJRRUL0dq3ALZJnXhm7J
 oSvoIpI3Pl/5g+9uUU3PnkFEbWQZr7NPETLK0p/GgdJvWOoaLhJFFsJmUtXehDtpCu9lY+me8CB
 KIsvnv79RJSwkh11ifWO5lDIYf8sbel72HxDWxHIdqEs8Jyz6zHpScaxnojS+2t5P02Ma3CD
X-Proofpoint-GUID: 7dTY7_Ov4Hajt_6-sHZ-jOPl96efThC7
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=6830bbe9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=3npRUmwy8-u2fLNlmfkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 7dTY7_Ov4Hajt_6-sHZ-jOPl96efThC7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=543 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230166

On Fri, May 23, 2025 at 01:18:18AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> We need more than what is currently described, expand the region to its
> actual boundaries.
> 
> Fixes: ede638c42c82 ("arm64: dts: qcom: sc7180: Add IMEM and pil info regions")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

