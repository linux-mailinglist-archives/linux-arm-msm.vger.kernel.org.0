Return-Path: <linux-arm-msm+bounces-56710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E698BAA87D0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 18:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4767D164367
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C8A1EDA35;
	Sun,  4 May 2025 16:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmuoZrem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5801E9907
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375226; cv=none; b=ASWxDqM4rq2n05VbLpA2u0ne9U9TFaK7fq6Kf2P9vN8XPBxiZ+V7txujJnN72HDEaBYIeo4KfL2zyZlgFKmQCkufi8kdYGqLZyyoyoKqYZeIWyz6qRqnmFkU8fqKhnBXkuFuvy5QOU3qOolLgO7ngzxh2Dmz2ojkDiugOcOay7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375226; c=relaxed/simple;
	bh=O68Yf4MVfSbvrTGnH2tyPtJDd/D9PTw/7oag6m4b3Hk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nyiFz/ZMk7mhzLtkK/ot0YP7BJfHKGtW7g+Kkh7OFrHuRScwCKVSBEVK9rPhx/HEO/qpJakusQu1X8/FolPcQSfxfOhoIGj/HFIRDYk70eLe8VF9KqTMAZqgMIAXiq7ifyW0pIuOyL6qxKEMIB1v+l5gOPspFwc4wCMC5u5fEkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmuoZrem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5444vxXl002483
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 16:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=; b=KmuoZremEiorgmv6
	hZ8N2J1KRhkxb3L9zQJbG+Vwnt1Ki+ZvBh8uLNPQ3LzBeVueVVb2dCfIsvhQ/T/m
	ZXJs4Z5p5W5H/Q3Ikmk4H3EjF5dSmGJ9aI1NU7zXqhBc/uIDsa088TteaElE4RQX
	dc5iUulHFfafIrOBKhwzXy0gWXSUTDXJAVTcJ7/hmrfWe31Ij7qU6WHk9ARh4DJJ
	jkGwtA4HS8orNBfiW9BB6Jlf61e9njSAzEl/fppwE6QYxxMiqFlTgtK+BgRj7t7A
	8RmJOKvzpLGK9aSIzsvkgX6a25X0wk+5fjH8OB7ouNjlbj+CoMsbTpCCQmmkuv/7
	fS1NCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rt823-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 16:13:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c543ab40d3so4821585a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 09:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375222; x=1746980022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=;
        b=mOId9z+keMh6di5TfnUzr01WWmHwSaCJY+67wGXBDAsWUuCpV7U2oGHnNcp0QSX1zN
         QsDzAH9kEvE5kFVm6/hPUqGKlw90P9o3JptGmTUdie3SyuzKTbG24Mg+Cap80AwEwWKv
         4QiU+s8RNTh0v5BRhxw89rVqjaGT6IuZ6TXL2YDiZRn58yKaUKjYhnTxwmJjg5nlrP34
         23sRU01UswrD9GHpD46Br5NE18Y3otlo7jSksgHS590E/OzAioEJ7T7o3SxfvRkOazNL
         Z3TevghrNB1Vsg6wSEWEM5/eBqq0dX9RugqCUY3Jok55e7w+7HidnWrMAvSIetccunGe
         qbFA==
X-Gm-Message-State: AOJu0YwXSFr0DqYip5lIFp69NXBx61Ngdv8vG1/Wbs5nlzeYPFnXS5ZS
	1v0C8akxjKbRUwLyJ8cZpkvDF4UDtj8myoSKOohtlv5NAiPzwLHjDxLvnv3ImY2R9/hgMf6M4bA
	PuSA/VcoovhudOcqCNr6daoLd2hhzE4gaVNzzM2FD2YnC73y4FZO5mn9EQL+2qPhC
X-Gm-Gg: ASbGncs315kO/sOa8Ut18dHKvXLj8G6AtunOKPfliHzv3KCK+NNBS+d1pYO6sm2tkWv
	2U/AoXdyAuyEpJGu57xPMKrpZ986LbmQJa8pXkyHEvaLTCDQfgNnWsXcJsx2wkXdzwcpZrhfZPD
	m1uXNKRSURlZGIejmgL8acHWQpsJXBhWYy7qLSYGjA59X4eo6ozUZX2etzXdAg4Puwt/ncFA6u1
	kbAr8L/MXD7gtOvIger20cQlpH5ZFOa0SpLUTCh7eHiuKESe8p68qeoMaVzNxSrYIRuOE7us9Ab
	TPDFpc/zWOUAQpNZz8YZKsMKVgIav9rWJek69B+Omhogj6W+P0lnu68DwC3xrhY8UCl6+wWJMdw
	htkyWfumBsuBIwTIR3DfljokS
X-Received: by 2002:a05:620a:bc5:b0:7c5:a29e:3477 with SMTP id af79cd13be357-7cadfeda15emr898763385a.53.1746375222400;
        Sun, 04 May 2025 09:13:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9jh4HRhFrjaplPP4DWWTXh3MXHXCDhI5cVsnoV7jzD3rgGA1I0X5J69xbTqyP4ckpUfqShg==
X-Received: by 2002:a05:620a:bc5:b0:7c5:a29e:3477 with SMTP id af79cd13be357-7cadfeda15emr898759485a.53.1746375221999;
        Sun, 04 May 2025 09:13:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/10] drm/msm: add support for SAR2130P
Date: Sun,  4 May 2025 19:13:24 +0300
Message-Id: <174637445761.1385605.10286310480029078025.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cwok0p8vUVDf0vdqHUYkeB5IoBpuABgt
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68179237 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=iEGPaXCqe01J9_RIJz0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: cwok0p8vUVDf0vdqHUYkeB5IoBpuABgt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX30mN/78wOVaA
 xM5kYIsATG3E3jwRp0TMyNZQtbwFiVudHB8ZUIt6LGUEb7Qj/9CouSzsxH//AghsAR350T2lJyJ
 2oq44WREW6LGbqOz6DrQSvFzEtLaWAFFXW3Nnt2KAlqzOKwsiwgwKtr5MdKhM45hYSKiXnv0+lS
 Cfm2HTkw1s1f3uBO/lv5MVBiZp1MXke/q2XNOjzUzFuuZYUoAdDW6mt2fstzMgorNfxbimMPe4h
 Ocavl+imqlI68h6GnfFoOOgH7lsqu9GomzxMA7Db9lSpRPtzukJK7wIcBuUdfwTshXBnOmouvI6
 MSo9ilwttAlM4R/YF1fs9iEdRcXamIl5fpqJImbAus3ko37C9kae2k56mj44Iyahrt+cLGJOQrv
 WtsoWOuQVw31UuX+nolH9LKJfWT8TlmafGn1Es4huToFYgmX0D1hAmtIKCUcFfx+G7nq9Qzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=868
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


On Fri, 18 Apr 2025 10:49:55 +0300, Dmitry Baryshkov wrote:
> Add support for the Mobile Display SubSystem (MDSS) device present on
> the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
> features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
> controller.
> 
> Note, due to the technical limitations DP controller wasn't completely
> evaluated.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: display/msm: dp-controller: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b341da1172fe
[02/10] dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3c70c9d0a99d
[03/10] dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/262650e71854
[04/10] dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/759fe7181723
[05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3096209b7a62
[06/10] drm/msm/mdss: add SAR2130P device configuration
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1e7cbfea6624
[07/10] drm/msm/dsi/phy: add configuration for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8e63b2075e01
[08/10] drm/msm/dpu: add catalog entry for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/178575173472

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

