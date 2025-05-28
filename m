Return-Path: <linux-arm-msm+bounces-59681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 848DDAC6808
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 13:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 038263BEA96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BDF279908;
	Wed, 28 May 2025 11:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgA0yIdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF3226A0A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430259; cv=none; b=SLoL4m2WfBelEZYTkgPJOXA/khdfXqyCFYm16kcOxNoJvjMZcB7OvFlw5QlQndJwUEMea3C6vAI7PLLRgAA75E8kk9skz7ds9ULvl0sQYHDFZhYlEXwBPyvNzSkVamRsl0RVgXuszb9w4LkVayGnqK2QIkoYJiTuOM+ctdSgRf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430259; c=relaxed/simple;
	bh=riQtv7nBcYcJJkZrsW58H8At7TEIUV7pDVxb2GsgEmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E01aMTZiUiCI20jnmzSEHXI0+kqPP3Dh+4PWO1HScFBXqLdTUOBKGAnzCqJHQZoWeJqk+iSTPCQENym+laQpsJjcqJ0eYOK9dhEKCG/m6kClCGcIoOFb7YuhVkxVD7hBKyskSVaJgLQQugQ/5XgU1v3HqkYw7EdHbhCz3qgChsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EgA0yIdl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S2EZ24003683
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WBsyeat3wl3WwBotOVfTmQNG
	LpvBr+fBrkq380ZI68c=; b=EgA0yIdl8RcX2Cj4+Lq4jHOnMqJ3ywL5nriTjlYQ
	Q+pA5n+d5CnLWOcXy2v0PGBCcRvB50AKkOBtq3dnO7DSX0Se8DRdUzax8ymWZ70o
	4f67tPxxKNVXVj7nyimPPcRM3P1nXo/PrlKcARAR99o3+ZJz26euxy/H3AKTelKC
	qqc6swMlt2VYZSXl1zQawK+B038ThJ0WhWbXKcx4FpFxog3lX5lNBTutyEYC1gpv
	vn0FNUNtGrflXeUxvQDfcTWblN15/BCgZZpxdD6buISDApufZCIusSHq1OD4FYZi
	k4E4LPeJylSKYVjlI3R2b3BpvqfKek+Rvf4MZ58NoHWwTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek1vrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:04:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c9305d29abso701616485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 04:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430255; x=1749035055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBsyeat3wl3WwBotOVfTmQNGLpvBr+fBrkq380ZI68c=;
        b=WZNiMLz4uGCC66Y3ID/XN7bzM/3UWx6wA5uqFZ2/Ar5vVHbp+dP6oOlSwYfy8s2sg3
         CTT5uB9joajVZ8pHZXKjeHF6fYYLjdDzLXnn2nbzx2qNBrf8OuE83mu4x1GsQ88BQx3i
         b5aKEJArlEHLXiRImZcD3DitDPh7hCdAMnKEEN/4t48uayohWBQoq9wwKMuyqocg8rOV
         lMgqrjAc9i5F9WLnYAHghJjlusUHU9A+s/2bpoK1NtozBDY6Nlx+suSyyAUO6OHzWrG8
         E3BJDP/tfQZ5bQ6GL/dTdBDNQhiPlFQG9mYcN3qIs+p3w1Fo4Rh9DFQkZ27J/WOe28LL
         /vjg==
X-Forwarded-Encrypted: i=1; AJvYcCUoTkSKxqZLtHBqRZTWpsiiQKMx3/3d3os46h3kI9elPcBdeW9MWC9I6MqqQOBo3dZoDIPeSjqNCmthU0pV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy77uoVG1SFQWsqSmPb+51NrBhiUl6zVmiBtIHVdvVfx5DvFf53
	Ylg0Udm8PaEd4+PPr03SYJp203k33ybh5EZ4LsEJLpBUwLkXP159A4yFxOKOe3mdss86fYDjvUh
	41+EVFNhXQCRoOUj8TgSGvL8Km1RgJd5H1Kbxx3N2tkSjBv+s58q80zuq9fAYNMl1ZPfl
X-Gm-Gg: ASbGncuE36iue2dkSCsbdYVNunZn4QvWOCYETTiiZoR3Z1bIMBW2NFTA6XD5gNTYndw
	xmYVfz5imF1IC1hIKcfnZsWMZsvBFB3dMlqBHwR49j6pR5pC+8yaRmAEGjJG3Dw8RDVKdU7EcN8
	eq5i8+X/RFCFx4k5MLU3qfo4FLKQFcB3wyH5dXq4knAlORASpyz7pfvW9MS1oW5F090OqDvkFJA
	FK/Kkp2oXfFs6L5EIv3EHFw2xX9Q1X7SfZQXQLDNuD2bqsmHHSp3kiXD0VLqfdg2JJL69PaBI5L
	SePHDea9L7XqitZZX07tjSZcrLRArd+SkhQYDBNrX1WJYkyGGLN1Q+T92GkLxSAHDnkh20/LTuu
	YLtiq54iHow==
X-Received: by 2002:a05:620a:28c2:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7ceecc2b4eemr2502093285a.43.1748430255222;
        Wed, 28 May 2025 04:04:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG10UZJ7QoYyXLSVHNCzvi96Bk8bbljVwgKTscsPit6mUHckIdBl5B8wYFznELJjPcvrLyuhw==
X-Received: by 2002:a05:620a:28c2:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7ceecc2b4eemr2502087985a.43.1748430254788;
        Wed, 28 May 2025 04:04:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f629746sm236497e87.56.2025.05.28.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:04:13 -0700 (PDT)
Date: Wed, 28 May 2025 14:04:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
Message-ID: <idc4476ibh4geraklzpas5536jnwvbp6xhjjaajcdcwxicorrf@myh7kyz77rxy>
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
 <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
 <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6836edb0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=DEnfwTRa2Hw7pMDRkAkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bLYNVSzj8yQJQOWv4NwT0z6eJUyuPCZf
X-Proofpoint-GUID: bLYNVSzj8yQJQOWv4NwT0z6eJUyuPCZf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5NyBTYWx0ZWRfX/xcmw49egFV/
 awGE3w82so3op4ILCMeIXy8e3hm+uc1I5ES10sRrOuVyDvV0q5p6rdvK35j5rdtBCZdCJL21R4X
 6JETwZCm6Npf3KD2e2KTRzNFg4NzS/JK/vbWTIF/NjyZ8duOdw5jQbbymYKl3wU7Mk1aRwfMo6t
 pywWaAhc4A4zCeNa0/mLuhAMBl+otdDLFb9ERcCxWMrj7EVFySlStQ9Udq6pnl1Q0MgOPI8tKgQ
 AgMW1UWkzbSEtau7CkEb968ph/7chs3MaGMNXsVUcqJ44t7LH90O0kfG3utaBJ/B8W8ChrMQKP4
 1Yd3HoqD3GF9L4pF2TAsLkqUJ09kTOqrMR9cTBGFjd8UPpqH42yw/8JWF6zFUZ/xTpLvxogsH+K
 nrnwnCTez72iU5E9TvyAcUlh7qjSjTzm+C9VqN94QmdqpYOddvdHeyzTYq3dN5wpPALPjg5T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=874 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280097

On Wed, May 28, 2025 at 05:13:06PM +0800, Renjiang Han wrote:
> 
> On 5/27/2025 9:57 PM, Konrad Dybcio wrote:
> > On 5/27/25 5:32 AM, Renjiang Han wrote:
> > > Add the venus node to the devicetree for the qcs615 platform to enable
> > > video functionality. The qcs615 platform currently lacks video
> > > functionality due to the absence of the venus node. Fallback to sc7180 due
> > > to the same video core.
> > > 
> > > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> > > ---
> > [...]
> > 
> > > +			interconnect-names = "video-mem",
> > > +					     "cpu-cfg";
> > > +
> > > +			iommus = <&apps_smmu 0xe40 0x20>;
> > fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)
> OK. Will update it with next version.

How would you update this?

-- 
With best wishes
Dmitry

