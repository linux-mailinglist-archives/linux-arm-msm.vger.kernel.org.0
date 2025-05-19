Return-Path: <linux-arm-msm+bounces-58358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B66AABB2BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 03:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2128F188F8A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 01:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADEE189F3B;
	Mon, 19 May 2025 01:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctYcmrJv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83F81448E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747616543; cv=none; b=RmuTeSkFN3f0GWbQcwW6xfT8WnzGj8R5vxOodyoqG8TsOig2qyVq4xyjG0rR5GdHKjpann6RPowkdI3usoK6kfo//EJQQMYtbAhddaZWpilccMqE/kX75j3Wd+JiWFXU81yq3+vsT+fsKkteT2Y+5lPDEabjxd2pxRWGbHWEFzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747616543; c=relaxed/simple;
	bh=Zi/b53fJnnhA35zfupvbo2OGQXR1VbpOLSmcMW36y4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRvyzcCb8jIu1tnG0qgL06f790n36G/rljES+Wdh4ZmleUryiKfjbw+8AuLVTVlQfibnTqe9eoBggZhRlgUG2GGfkfRGoA8l2iA6h4oS83ZDt5tAV3bD8kYeOInp20rk3yO5JG/eZz+y/dHyMvBiwcBIe3aeetDxmsalY467h0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctYcmrJv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IHwN3T031683
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8STRhgSicOn7j6XQwcVTZU7Y
	AVnVtOQI5907glRUH58=; b=ctYcmrJv9TFKbLahfFb6pG/57Y+XEF4KgOcCtgjQ
	eN68rz9yCh5qYim7QDWN4fsOAoi6p8QKNREIYbsQVjUnn0v/jqI8gT1nAKVtYE/+
	3rlsQpTi95yrgVhAb+tHfILZjwfKwbl9lGPucJwmuoPncbRZpa+NauvM+s6z5WqM
	A/ND0PGtCS3mzkr2i7o21LnB9zVedFBGUOt6SFpATKsBBbsk+102khI4iTLBMwTJ
	mtc/O/mAnBZj4jYf2NGoxszSN/xDlFYHcGPRmuEXyof3Dm5WJK6oKjRQCxVoR20d
	i5/3qlUDyn8dG/ClsGkZCyYOmObZoyzMWjaKmF9uVoB9ug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyjpfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:02:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8c0a83f9cso41883156d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 18:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747616538; x=1748221338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8STRhgSicOn7j6XQwcVTZU7YAVnVtOQI5907glRUH58=;
        b=bmMn8/P0zG/27TlVJ4wOqAEa0eX9Q9Z1ArFDpQHBVAFYcKByx08SsaHZkH6T36Qegi
         f3EMw0N21uZFC2j4s8aQ8CWkyx/gE7Lb7Y7wQZ7rux4RPKmJ0mA85ehAndhK51yAf7OZ
         Rzfc2DAhxq6oJ4ukRXlyCTYUYp6L4m0JqRJDOINVoODe+yhsEGaHXDh63r2n1FdP1Q+G
         ckAQELDTwZjS0tOquO+RiExItoxm2Yu8rgTFLVTGwJNeueMobA6fN8Vm25TwoHVWEEZa
         UGKfERHfZgYcU0mnf3uWLfcnU0K0jp0D5fdBwmomdm2n8p/I9gdS5V+DyEtPF3wpopCn
         TDIw==
X-Gm-Message-State: AOJu0YxQ1mY9JG9xOVXFiQWvhPNipWdLjGsGY1px1SoccqyMCWfaHizO
	RhMwR0wqGpi8rFlv/LKOZED9STPXxvzXg+Ep0qasmVcPwHlSYJ/VGRWYZYZSUs6yzNDbnvUah9A
	ys0pMm+L0+rmbuKPJrM5W4vi1ULgoA/J4GqBjLNuZFNRyuNMrg6Fe0O7vgmHFl3OGa5PI
X-Gm-Gg: ASbGnctGyJ05zvWD9g8LvJkxA0dhSvZGkUJmxz8ZKNg2O+l5zLHxJpNMZmC5mN79Mk2
	Mqvgf8ojlIMkRvR2z1ORMmGgNLZZl9IF+tXik824TLV6JM0ekKTVKClq3Ty7FgVfqA1yDR9RBfa
	CNby1rifb2OIL+WVioTqjHueYdOV8EgLX6hdJTObb3hi/irrZCPUe+aNmSR6AtDpS7iI4ep67CD
	EcWPAx2t1AEk2ui22T+/DFVLlUMtP8oSxmK2bCFvpicFDBDiL0gjt9s6pUxQGREsZL6LY0jezCy
	KheSxBpk5RIjvo/lXtcNdnVrU5rrap3yIU5p8q49+zdwbiO4Zq8heHHvTvJsJVIOPwuR6JfdtF4
	=
X-Received: by 2002:ad4:5f8e:0:b0:6e6:5e15:d94f with SMTP id 6a1803df08f44-6f8b2d4fa1dmr164141446d6.27.1747616538218;
        Sun, 18 May 2025 18:02:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSWo18mdSvwfxieffjfuvn66T/nACsrj+CCnE08zCXT0yroo0DlXEmo/fJG3GV1JDhV9D6gg==
X-Received: by 2002:ad4:5f8e:0:b0:6e6:5e15:d94f with SMTP id 6a1803df08f44-6f8b2d4fa1dmr164141186d6.27.1747616537857;
        Sun, 18 May 2025 18:02:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e70404desm1625222e87.252.2025.05.18.18.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:02:16 -0700 (PDT)
Date: Mon, 19 May 2025 04:02:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <amakhija@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
        robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <mlxlmh5zswt2n7jcmqvyvgiif5c2ch5gb6yq7ethh52aluo74t@ruxhcdvwhxbc>
References: <20250513102611.1456868-1-amakhija@qti.qualcomm.com>
 <20250513102611.1456868-3-amakhija@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513102611.1456868-3-amakhija@qti.qualcomm.com>
X-Proofpoint-GUID: AvT4lJEMiDanWW3qQc2CYMsrXTPLludG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDAwNyBTYWx0ZWRfX0QYqCSh2Zyyv
 d8j9v9E1aT6fHb6acJ/76wQKV9FhkmKWEz+v/gt/9iqJeF4qenxnOWmiSITFin8An2E0hbITVJ/
 wkLqex/+g3fv0nekgs05nSorCtTOJHLreaH/erqDTGAgNK3Xve1Bhbsy+8mPgE1W/+WxTZ3HKfu
 EAJGTRRdjtLvGbWpHL6eVxygN3EFJvJOHGBTaqV8cEwAxh34rxMOnM4BLQuuvHmdka+S2h2qf9t
 gjaCGiDbeNWTLOmSk6waCkVBwlS7vGWcaxMfhlAe9vet1k2JnTqmbdocBNgUJ0O2Mz/O27neqs9
 XSHKKphSGeKzlYCB47afp92eG83JTmspqMr5FtfCjHHpVkMyMLavqtwbLTJEFAuevEQARcyqY0O
 tj1nh+7iXKKoQo0I5qyoQMzw7qBL7Dmn/vSzgyi/nOopsl+YoA8iufFlrrV0HMkzdF95fwRg
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682a831b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=STMA3DZVbMtk4X8eXj0A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: AvT4lJEMiDanWW3qQc2CYMsrXTPLludG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_12,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=768 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190007

On Tue, May 13, 2025 at 03:56:11PM +0530, Ayushi Makhija wrote:
> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 232 +++++++++++++++++++++
>  1 file changed, 232 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

