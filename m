Return-Path: <linux-arm-msm+bounces-71775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF56B41A17
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8AAF1BA36BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24FC23D7E0;
	Wed,  3 Sep 2025 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQebEawf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165771C8611
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891892; cv=none; b=SUPQYeo/LXvtmOh7HgFuT6z6yZMiyCDZTtUzk7DE36h2cW37f2ghPjo3AHSleZqPCuBVwSlEucO172IcinpHOqLVD5XxOjgQf77lf+jcQmFXVSt7aPtguRfy1bzdm/eIrS32g55j8H/V1nE3KqtcAxaCu5zgwnqXXamGkyz1xGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891892; c=relaxed/simple;
	bh=6Rj7ZCcgFaQLZFfPj+MoHP0Ic6ExqyawNXwy1Rm5OpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHxKtGnMDdbJAEiNOhgKitHiN2wSAthVP1dURMnQA3hcmnDWgC3d1oJeuM+XlX3Q1kDloSCRn7eo6XYDH0IZubDTi4bzYyCecbLBuQLtaOdCgD502yRdogWWjq9BFwB00kTzczoyKoagQaROr7hPhn47xCN/Gfa4qfR5VJVLjLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQebEawf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832I5O3004336
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 09:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R11J2ZPvgur12OjpaY/ZBN77+0uB5Jyxu+Du4WBbtJU=; b=nQebEawfeJJnuXoR
	oYb9e0BDMX88zWnTCjsF7RF6K4CiWoG0eQaks94P1AOzf62xoxfRioKg//b8fT9X
	fP+cikewvFXxRHKyqCKbk6k9DsvyB/DbI679LULgbnnA5SDlCQvQxR2ywD+EtRFv
	dfdRvo4+psm8oJqYiISEjExTEU2olybDvUQT+EkvatX1rAakhNK+aFUDlaHAxqgS
	eGnySm59KpzSp98H9OMWwvs9kKvidnq3ZHMIMTDmWxRZzcTh7+XO4FilZw08cXEe
	g2sPvJq5lY6Q3oxlKed6nJ5bG8voYlnRsi/0MOfmZ5IaHVbDBalkp7eeI2Cv6uBU
	BBhlYQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjk02t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:31:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-720408622e2so31233756d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 02:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891889; x=1757496689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R11J2ZPvgur12OjpaY/ZBN77+0uB5Jyxu+Du4WBbtJU=;
        b=oKg0gtZ0jeg2F0uuPxkjsPwIFLr2SKz8HIb46zieLTml5Vw4fIIFnidyiEbdS8JxOQ
         QXLpDPWdzd7qgA19y52mT2CGEsVa5iH6tlbGbeUSIZBk/Tio/jVZ7nhoKMlQLgesWSbN
         wpCxGtEquKqznhTMYlTrOAxKt6Ce4PwAo0wCjwxXEF6gwiSfemdXlmEqo7HeqRrtxTkj
         RF+zsOfAzXsT4tKdGkO4d0oC/CKUVyt+yxl0mLW9v1qd7ulewDvLAyvBbNhH6n19MSx4
         6Ke43pd9FGYA/k+ZuhyPH0HxZajfEL1bgpOTzgs/jpHjEvzS5u2FOH2+P5xDkRDnNjvF
         XneA==
X-Forwarded-Encrypted: i=1; AJvYcCU99HJjqdzzYJ9QS3V2mOLL9lkx+oTYr02iKjpwfAQ5A61dQ6fPBig7dgXdTAGKZ19B3MrhtUrq/KeYOSlM@vger.kernel.org
X-Gm-Message-State: AOJu0YwamV/pSlzO2gfsTGKAeGAMzfbxsQDZmsOc64XPH2hZ2lDU4euQ
	ZYstle/rR6m/WjHHTulxIYjTVXjjsZjo4roJlVPNoA39lD36yPio4+to8TbE53LxXLRANktQ1LZ
	9jYutogO/fnNWFHRmK1NYAG0LmTdS8gNyEV/DRlhoZgPDPKIPOsu+8x2GAwo9337HClr6
X-Gm-Gg: ASbGncv++KjjS4ek92ErToOwZJQub1bPwuAnnQGEo6wddCjQkv+Ky5rp5ykCBZGUP4h
	MEkoQvNIwEKxpbOK5Q1ds0Dl/3VQI536T/QDDYQ00vkr1bqiEPxyo/OVqcLMgGw3uwldQkN4RVo
	hKUpXSb6asZgAoaRIhwxBMNOpSGi9cjr+ODi5Wmn9FxuxyPiUgoHE4SEk1YEZvZV3/F+Qwqm6Nd
	4QVb9Aji0iMPKLAK5bL+EuDPQZxMwDzC2ZmLZzWPDWRDYAzlv6WZMpFAa0WLhRlBJrdYLXShQou
	VyWP6nvXluWO11xmliLJHL0e/OhPN2YwlrGGEd+tw1ZvNomZcooSQ4Lvmtn6saBIK7piKldSPkx
	souVb5q59Be5UCWefpWr1mQwCFpVBvaGGNAzFb1pkk2OtdGkz08Bz
X-Received: by 2002:a05:6214:d87:b0:71e:d4f7:b43c with SMTP id 6a1803df08f44-71ed4f7b6fbmr81039226d6.18.1756891889155;
        Wed, 03 Sep 2025 02:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpn1OxrJPfcU6oHH4NoCR91bC/412PrDtsPmAKHu53l4V9VVcrDS9TC7zY3OUCJn7dGPO9ng==
X-Received: by 2002:a05:6214:d87:b0:71e:d4f7:b43c with SMTP id 6a1803df08f44-71ed4f7b6fbmr81038866d6.18.1756891888652;
        Wed, 03 Sep 2025 02:31:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50b0e98sm9071431fa.60.2025.09.03.02.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 02:31:26 -0700 (PDT)
Date: Wed, 3 Sep 2025 12:31:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: Add GPU cooling
Message-ID: <tjdqt4pgagy52xncrqk7dkjjpsfqukjbthrgpddjatfkd3xd6g@7vglhah32f5x>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
 <20250903-a623-gpu-support-v5-4-5398585e2981@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903-a623-gpu-support-v5-4-5398585e2981@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b80af2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8h3n1EBGBd86Ebf8828A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: TQQGDx4usZ-yVGEslCLtH2PjQPjswRhd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX23e+bbrtHAtR
 F4yxYxP6lUs5JZmu7UK+jyv9CE7cV8hAufy3vLkV7/6XINF7zYqdYEJV27AzBPnkoCPh8YfP6s6
 AA9oVYtFsCdCNcMU8mMk5rjSWneOvJA3zsrzx/4JFIxVtkjGSNe5zXeFjTTHQgCCJkjS4BUdD7Q
 2BVdbQnv7LKLLfBFhIiyyLY6c/dcN4FWByf0Z3cYs3WE+0n3jHA6zx2cxHf7/4FUXhtYGIHRIfa
 sbf//Tbu5tfkLa3zAFeydvHrKjIbbRupt8HPBouprhHBMCFYMsEEhpemBxDajOHhCYkz4xc/myB
 rVcI2JJM58qbFiUbykVdM4JDZAcr5VRPwO0R4KPD2cvtJtyP0nCxGsL8iWz17iHOWxAUVhOnlY4
 ijxX3PQe
X-Proofpoint-ORIG-GUID: TQQGDx4usZ-yVGEslCLtH2PjQPjswRhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On Wed, Sep 03, 2025 at 12:49:55PM +0530, Akhil P Oommen wrote:
> From: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 115°C.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

