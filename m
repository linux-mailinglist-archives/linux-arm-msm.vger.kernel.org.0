Return-Path: <linux-arm-msm+bounces-58456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 652DDABBF18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 15:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A348F17FAB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA39C27A116;
	Mon, 19 May 2025 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7VCfql2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD81FF5E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661211; cv=none; b=ZCDP2lBoYa19o/4Onmt6BI6/miowT7A7zdl7Z6sBcrdVxGyLOgeVeins7laTYJkA7Sg3lz6jTGad/6XLPU1eM+0zmqkqyX5xgUDkiFroRrUuX27x8h1KnLw+F9vh5aUjmpDysOCUjNgIBYOnDhH0Afqbn6V3gaGzws+piIRQODc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661211; c=relaxed/simple;
	bh=dUKwwAuAnYppk79gB4Ni92ph+3QHQ8Ax2CcJHfIxNQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPDLDX/1tEWna0P22ITOICV8EFm3uKy9G3HRKYjJr82jCAOtZeoo6vOVY38yVbXylXQ2kJbjTp6tYkhRjjgDH3CnTSq7zQ3gqNi+TGptuBWu4RIxRDKw8V0Va3fJlJBfZJgneMmAYPHUELHW1FaLU2IQZ36xm2ZlWYOkb9ZKU9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7VCfql2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ABGo000361
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oGkk5uPJENlcrR8ExGnK93Az
	4FZA48X1UVpf5g9eL1k=; b=I7VCfql2kc7qjAhj9U4Ib2pC2SRvhWpc50xCFtgB
	FZEbxxfJw7SgxZZY3MV/GJ6hS0Qfq8uC388znSM6gF+ciCv++FeiWFZP6H+axZbP
	sHQCInrP5gs8hJBIK0M7tgN4GgofOSI8Q5fXWFIgA6P4cbNCRkRTPLGXH3cJbjrA
	8X47iE7CVVWug/XC7DOs8I7+cJfDrZH53KkwJHstRaMHM2r0O1Hefo2N9ou+OmPG
	zE69BHQp7mLZbOP9pcQxWsQos+tybqsG0Neot7lgA09Fs2Wln2+yi1jpxAtYB5sS
	vggNG1t/KHaPtgc8vQZcAjXL5qahu+8DEa7CmRzoU6UzIQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkymjtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:26:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c9552514so30263296d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 06:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661207; x=1748266007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGkk5uPJENlcrR8ExGnK93Az4FZA48X1UVpf5g9eL1k=;
        b=ZAkKjJREHTW0lwyvvN76uyjjXjj4aDJEzBx2JJRqekigFph2Ugmi5frWLt4R0sUosA
         U1l9p2OVVKxytHImUiObihO+1aa6s/UQTxepGyuMneF/ImZSjlQfjsevZocO30yFiwN5
         Ww2tD8SCx8W4GJCEhm+75/DjUmxGl+mLVvNPQ3AgDBgsiRfzHVCeWxQugmozES/VZ5YA
         e8LJoOqOoB7b4+s5hsmw4OKeO4Lnb2BcZCGSl6c3s4tSqvii0T2MNrGlbTqUfRUNcIFd
         5re3Cx18d+EYQDIGD8PHcmXEO2nWuRUUMHX6KDJw9Mq04O2nbLV3wYtylcZMK0pEKHNU
         9ilQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUUA+WJXFm3Bk28dOf52zk/vW/ofDJ5tgZ4OvHFWjqJoJCe0sO5mXmMJqQcEXTe2Mtm+WYFcAiV8o9/lBs@vger.kernel.org
X-Gm-Message-State: AOJu0YxS5C3ocj8zxRhUxOW0OK9oNlURRGwWwlYmxvj77hSPiHZudpLB
	2r4i9zagUJjcfcaHGP659gfjswGX1zA5YtlFRavfDD7LrwNIXOfdgV7aZWeQJ5nZh3ajPJudNAy
	49x/Zf/HnLjdD0/dh7kbQtvy5zPAAiXW0sWRid3EC1Jaze3LxcN9jnqWio9LQ6AuG+cfv
X-Gm-Gg: ASbGncvalEOHmzJuVXCpjIeHtayyP9inZC3558CGkAo9QPGiJyytSjvKvgvPYJczlYW
	Ok5IfZDpiJVQmSCH0sZxviUgTflgoFn0hpMZ2NUJAoUR4tT/imTVMmOgo8H8njvaXP+Z8+Ch5eT
	KLcxsuxlTbgJQhXqd4cfkN89vgLu2U8BLV5HKzVlNSEtTAtjW4WGDvhAEmwJoO5sNfRTljEqio4
	wrvOKlyKyfg0q3x3jaTv1eaL9HgN8FebUgUyzP0jryLw79WDMXqlpzgl4NrchP3LwBdaAbeaEbs
	WR3DyO6itxFfBVvIll2P+pdSzH2FWvCLvkjYOAPE1j2CKljJz7/vnR04cM29MVkSvgZ3wwoqPIQ
	=
X-Received: by 2002:ad4:4ee6:0:b0:6f8:c53f:48e with SMTP id 6a1803df08f44-6f8c53f0bc2mr146769366d6.0.1747661206748;
        Mon, 19 May 2025 06:26:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0aOVnc3nCtR9lGsacqR42oc4D8WjdNAyfE+YftMATKn0uQn4ucAG7wCIoSsvdjD5bfEC09w==
X-Received: by 2002:ad4:4ee6:0:b0:6f8:c53f:48e with SMTP id 6a1803df08f44-6f8c53f0bc2mr146769056d6.0.1747661206344;
        Mon, 19 May 2025 06:26:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084dd21esm18791861fa.63.2025.05.19.06.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:26:45 -0700 (PDT)
Date: Mon, 19 May 2025 16:26:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Ayushi Makhija <amakhija@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
Message-ID: <4cjz3wu3osafi7sffluslxea3e6vkdw45usg3djpclw5lv4fvg@ofoqbmwjdmjh>
References: <20250513102611.1456868-1-amakhija@qti.qualcomm.com>
 <20250513102611.1456868-2-amakhija@qti.qualcomm.com>
 <tjp2pfescczqikbu2tzylx4ecb3n6trixvhbdwbpz6y4jc52wk@fmkdxrelun3i>
 <38a94e78-9793-455b-a5ab-6283d397b759@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38a94e78-9793-455b-a5ab-6283d397b759@quicinc.com>
X-Proofpoint-GUID: cXZajq5cWYgP0jsy8SkFcf8DA5CL0fWU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNSBTYWx0ZWRfX1Y4yTJ5+QDD1
 8N8yONTfmN2ZEGeJB3PyrUZMPhM8MmK96L3HqOim88REXRAutrmFZKJTKziRWWyL84pKaA/ozFF
 /C7WYZU1BxebGxtqXK+3qmczOf5Jjh2h/ruYql4pYhRq1BJh90FYZF76ZAOEX9A/tHwHaX3FzBC
 NPUj9XFhlQxR4mKaLzOxTcPncJHq1p1VzUkL9I4IVtj0HRLqohkda7jrq+K9mUM+RxcaJNU8hOB
 w1CpM6KenMjHkYySLr353OCOzZ812CeWLDMNuxCcgN9GZsUx2QAqFg8M7nFE6akDF72NxqI5PWY
 T0VZOrBb6ZXjLOyFwOaXx9zRXj9ZT72ikZ3AUAM6VX/4P5dvt3eq+kRcGSg0UGzWisTMf6G74Lx
 WBSW59Wkwz15KlT8qyaN9fIMI3YSWS4yB7MelbP6VdGZfexpQfEgqwx9dlXACmn2yICDmjbY
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b3198 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vtArrIq1twOU848iWwIA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cXZajq5cWYgP0jsy8SkFcf8DA5CL0fWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190125

On Mon, May 19, 2025 at 04:30:55PM +0530, Ayushi Makhija wrote:
> On 5/19/2025 6:31 AM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 03:56:10PM +0530, Ayushi Makhija wrote:
> >> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>
> >> Add device tree nodes for the DSI0 and DSI1 controllers
> >> with their corresponding PHYs found on Qualcomm SA8775P SoC.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 186 +++++++++++++++++++++++++-
> >>  1 file changed, 185 insertions(+), 1 deletion(-)

> >> +
> >> +				dsi0_opp_table: opp-table {
> > 
> > mdss_dsi_opp_table: opp-table {}
> > 
> >> +					compatible = "operating-points-v2";
> >> +
> >> +					opp-358000000 {
> > 
> > Is there only one entry? Usually there are several.
> > 
> 
> Hi Dmitry,
> 
> Thanks, for the review.
> 
> In the IP catalog Clock documentation of SA8775P, the same DSI clock frequency (358Mhz)
> is mentioned for all the voltage corners (svs_l1, nom, turbo and turbo_l1).
> That's why I kept the single entry opp-358000000 for 358Mhz and selected lowest voltage corner svs_l1.
>  
> I will address rest of the comments in next version of series.

Ack, thanks for the confirmation.

-- 
With best wishes
Dmitry

