Return-Path: <linux-arm-msm+bounces-75217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5680BA1BAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 00:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F9E11C84F05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 22:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28E5315D3F;
	Thu, 25 Sep 2025 22:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTArokZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCF22EA46E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 22:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758837816; cv=none; b=oDc5g5jElyGa2VUXVOfoUANkbOI35puyItjP0EQ6KB9SjQjwOgbyTqkQn3l4LAbiHPfOafyQ/3u761Lry04zeQihC2fWGfzQsFytSEdeMlwu1qlxeur8Y0SU6i5pIkobvXEuZOaN27a0waHafGbRYK1rgKN7WCl+wx0Sw+4VtOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758837816; c=relaxed/simple;
	bh=SimrJAsjo/U76oBFMh2wp+ZHY0z8eJuP215NvjC5L8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okAg29q54u5Z2Yn0wunW5Ryixc6fuyzW1TtieiFtrsheT1ucOZqE+jbzEBqqpCbrFz8D5QTSKSd+sNiyJRtqR2+tdlnoSL2aCY+v+qfKiDOw4joTFRylqa1cAinDYL/f3/yZq6ikHpq43b5aUjoachcGco36YHvRfFv3sD39l7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTArokZv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPqTP024171
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 22:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kyKnwB1YFtbc3XyrNI6dEPy9
	Kx88yZomZncunczbfcQ=; b=kTArokZvPkyNBnSUBZNdORv/icUPiZZuXGXxnf+H
	+cf1y/O+bEQ7MfJL+EM7bI2KVC5tvKFLp98NMuW+ovWiwyf2vXV4cwHXyttrnnPA
	+zdRhNAlqrhb+uHCZpq6LJ7T23x0Gz0zj/3RONJP9LgRKR5CfSomzpohHjNB28Yy
	t91xz5SaYpIroEFvLcEkjU3JZzyazldEmmSMLItLhdNLELuicQKvNWhPwZP8BQqG
	bjdvoSBpt6CinR9ieuemi3IryPHLaheSfG2bB0Npwifm2ylGJgisTvN6NSQ+kwKj
	WUg+4kJcbgZFq8d6BGfJoSfAgwbEbB/UzmHwuNW5Ay4k6Q==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qrh2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 22:03:34 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-785bd8f1577so2173963a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 15:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758837813; x=1759442613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyKnwB1YFtbc3XyrNI6dEPy9Kx88yZomZncunczbfcQ=;
        b=u+vP1w1e5TbEKWU/ddjt7MNMnTbfZMWiTyNDBVtSgB/8xDaF5+b9rTZQfFQSlm/2Dw
         8Pke8XvvJ7cNj4qIDNzf83DEIyCHd3vAY6DDiZHYpv4kPYxK73IOpgfjBdI+b0/OEEet
         grJMC3O3YwZryibawA5ELBofUF46rhSc0ZIYRgXWw9LJh+Dd47qbDpEx1q6ExjIcFuuL
         hArghV0daeCuRppWAPkLKD6Q2S5AwdKT4b9PaU2Q/iMXmeLOTPAJZ4kBRZGaWq23UZjz
         mAJUzbyexnulP+3b7GzJrv0G89H71BicXF1YPsCKR8Lg5J4Uy4rqhcWeIQ71pdMLtCxx
         BM2w==
X-Gm-Message-State: AOJu0YzQ3Hep8tqtA+dzdiTgqxAliqm/6ajfWJxXnAq3KcqFusQt/i8T
	QuaEmrt/uNIKE0coNZrLNQSx1/q540UYTNEplo5OLix5RFB+A57Pw7/Bu0Xh/zDTywRQnSrE5tw
	FOr+6DLkCekXWWZtlSYSLbba77pJ1xEw6xxqlFeBINREIWY3gV+3YhuTLLlyEdXw+fVsi
X-Gm-Gg: ASbGncuhENV73xQsZP69IuJCuxfHw51Y/ywWhdKYngrqsHOffV20zFtnN2gC8ia5zAx
	X6jwwzxBak3TrqABgHpa13krvHGUGQzAG17ftwE0YU+6475hmGMbVYtPE6s6YuuG4LKBZ49ZC+L
	K9VgeKGGL7iOXoIZ11MTGuUCJ8bc8rONljXUrsuwmhI1A17eXKYqJswdr2ZsxVsaPP3yMrabTwM
	K0r7pfrMldcZ35mBjBYI+DUY5DGiPIIaSJeIPc7Juradw/9vfX1A/7GFGh8tHbLrENjtIKSOc3t
	pxPlcePPSEQrzLxvaibWMa5iG7OOyioqKDWSdRpRFEkaUFYwzh23N8+xU7ymcS2lZXTZusMlnaW
	xVCcqSYQNurKN3BHi+Lo/AVD4R3575GhsTSjxzAiJXKFHiU4/k1W8
X-Received: by 2002:a05:6830:82d8:b0:745:5123:c53c with SMTP id 46e09a7af769-7a06016b533mr2209266a34.32.1758837813298;
        Thu, 25 Sep 2025 15:03:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMVYQTpwJaNnmccgTZ5npi/eB9adT6V58QHAXjqd3PsqhBbecByebxJS7dc9agoabjKnHZVg==
X-Received: by 2002:a05:6830:82d8:b0:745:5123:c53c with SMTP id 46e09a7af769-7a06016b533mr2209227a34.32.1758837812878;
        Thu, 25 Sep 2025 15:03:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430be5sm1171344e87.28.2025.09.25.15.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 15:03:31 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:03:29 +0300
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to
 DP bridge node
Message-ID: <oim2rkt3xczehmgg3sszmgobrqs3ov4rxockseqgddzlts6paz@ztyakecujcsr>
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-4-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925053602.4105329-4-quic_amakhija@quicinc.com>
X-Proofpoint-ORIG-GUID: iZhvUBBlG5jKJFKyOrjxzBKMig6XGxgX
X-Authority-Analysis: v=2.4 cv=bJ0b4f+Z c=1 sm=1 tr=0 ts=68d5bc36 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=En4R4P6zDXfLUnqyaIQA:9
 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX4vF4H/oIvdLO
 PgEB13Tw26v4hku/+Xl0MsXtpquHF0/pIKOeRe6hxNbQadZNlXrk1FDEmIRzYc7ey587x7+Tdxd
 ZtA2/+LxbMoYVBBu8t9cj5AHFR+b9W+KB+QgQ4uwoc4lqyDLN9SAV4CQGpDSY0D+A/oE3m+OcCX
 Dfo5Do5YNOlIcb39/RAfAn5dw5i2XHJ76ZmvjWU0JqbDbaqpQxXnt3pb8vyX5Tt27bpNKiN18F/
 XFTisP/kIKDuSmmv9hBA+5Gxtq2kTIgWIHzc8sH94r/KuQ/6oh+14QkJq/eOOvX4zMOFolr97pm
 b6x0M0b3gHo2DJrq+ycs/nocS2WGfVNrjedwUsbgtEiWuaXM048NSOX5I/pCb8KcbvHx+AlSzCt
 +gK2/7XT8Bp7D8+FoidCyRMeq9NxhQ==
X-Proofpoint-GUID: iZhvUBBlG5jKJFKyOrjxzBKMig6XGxgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 11:06:02AM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device node.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 170 ++++++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

