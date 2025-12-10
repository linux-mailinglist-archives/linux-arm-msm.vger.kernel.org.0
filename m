Return-Path: <linux-arm-msm+bounces-84867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B580CB1DC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 05:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E62613007CB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 04:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F03C30DEBD;
	Wed, 10 Dec 2025 04:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqCGoGs1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EgHtploL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FA1224AF1
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 04:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339536; cv=none; b=tJ60G4pVjQqB3hMjsCFTUpqGqknh4ax9MYlqIL84kiO6AVdhu9aHxvERUkSmTtiL09HZUkOUtaqsE+t0OiRabVGgbxds95Pj1t/leiz2GOkWpYLEicu0lRP39YXclhPNpIcDqt9VAQGqTjrLhb8G4RhfXF5DjzLowwHrBGxQzJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339536; c=relaxed/simple;
	bh=e+g3dqOZ2PcVFKzAealcv2hz8SQ64WuoXheOf32dpoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2+AvhM2qJ1siS6Qsn9uPVc4pxG2DO+38ibGgB2SACyLxpY1ucxWRuWuBZ29q3xOzKa5FtpzXAV52CE726Izv+S7Q5YTe8YX43Fgiy69MDDxi8TRq0paWhYM5yuz5n+3lh8GwLMqm6iiMhHwVD4IJ5og3xYRtNzF82G4n6DF/mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqCGoGs1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EgHtploL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LdSh2095481
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 04:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BaIaRANy3uqkRwMb/m3PyK/b
	+TpFVtVKhaShgO/WNgs=; b=OqCGoGs1J9YjOB6IR9+X/KbZ87o35AwVJOD40MOI
	ojMQm9YRXKf1GfNN6Hbx5navLzkS9TWpKrqeUEbPfmSJYUFQ9EPCA4do8btHVgGw
	W5hoXl74Y8HhrT8tAE1c8HXpHrolHCw1Ko/KEJCjlkmkWSjss2+bfn3v/Z8cvlRq
	btxzqFDeQnXeX1WyKbXOCojq3zqOFLrtSBamFV/E0Xb7Xjb+nhyF36IpABC2ITE1
	ey2D6IJYa/yvxh48cnw4JBoj9HvXi0e9dDbeyMxLyk/bbAbdgrGyjDqC/KzTNEFr
	v+Dnkb6l9/9ERO5qeGcc+r4tIK1ZgEvfs0DpUQoGRfUjSw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqu59wwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 04:05:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee3296e984so116429181cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 20:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765339533; x=1765944333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BaIaRANy3uqkRwMb/m3PyK/b+TpFVtVKhaShgO/WNgs=;
        b=EgHtploLIulnljaSLPxsrxUEqMIla7CnTQUlg+sez2tqm2WjGjhGiJgsaB+qJJuBdp
         9yDCwisToiV5Gh2bhxQBEs7ElP3gbBT/SiNW0c59NNatTYL6V8QQJTjYyY2HdATxvNeg
         Q/xXX7EemHnnG349pG97Huzoo3nZPEaS1vG3Wdu1gsKoLF8dLyTdys3/P8iVsue6ZMrm
         YdOBRN53huTwhn5W/l0W8njXr6MrOv77CQAQPpulgh6gHdZeR8uNj/P6kH+MQsogZ0qO
         pj+PsMD7WYNp5Q5/tpwy5h88r6ZqKoIl/+1xitSDhXOcvU4IkdLUaECwU4zV4fKdHwMy
         BuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765339533; x=1765944333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaIaRANy3uqkRwMb/m3PyK/b+TpFVtVKhaShgO/WNgs=;
        b=N9T+bcry/QnIlU7SdxSc0RwQwm/bjIjsxPUAR3D/vLJKSGmub4DCFdJs0BxpXhWcmd
         zUU8/xKjIURTPKMrEP3kh/zELoWgBu67emMReTlh2HiftIARv+28xtYvyc3Ov1Va06oO
         VAxf+oWF0djpMsyxwt8IGKrCHav10dpU5F42MK9N8C9nDIYCdvNa5ejykJC3JVAqiJjc
         aEY7dP6RZII6+eqRIubae54FwsdJo7tdWzllpcBEwoy2Z3E9PJ1fW8uEJytodYT5cLHt
         VDknw+hfX4t6tBOIudu+4rYnopDefwi3mEwCLjF3wVKpmxOpa8aAO/jwpZpUU2vhwATc
         aPYA==
X-Forwarded-Encrypted: i=1; AJvYcCWn25FW3LXNKi/diE6nMLb3pxPd/vuE2BmoM5DfkpTV0IBm76dZJmdtxsebJZWT3M2ZDboJYgB1XDaONChV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn8cxlETgxNQjjjNuPXjaMrnRP7RW12ZZ5k8XgES48rxFN0wvV
	tnEqgXTru3eBNOR7BVTBqfXiYk9q7Ic6ZmHBR9xcqjx2o4rRAJZ1cebKORe9rXkyRAwhQQVtjj9
	RKjPKtFppTQg3WPzW+MezTGYNb+iic5hwaXq6gJOaW8BHyEJUk9YMYB2PoUNDsQwuubLj
X-Gm-Gg: ASbGncsyhJLLMHWBZRO0CVnA4+psUPYLNCd+XMcVuXYNBDcZiM7cnLwXcVBUclrkTsT
	5Ukl7/L9ghrejjVeqcodzw5VjQtcKzvcdncgTydTp6tY46S0ErygRCfF1e70X03vWBwjPoTELy9
	aIAEgWvgGg0oVjNB/8UOJ5FWyRJUVMW6Sg7hwubNYQzOxuJCmEhcmeNfncPgAN63UWHKFdvb+Sx
	g0de9Tmp5GqRbepXRL+zsMzGJeqMGo4ZSU1gVhpXUYm5QTSrU5blkMXk+tkwUKNU/XmWojASy1j
	dfklkNaW/VJblzGjQydUxzL27M5Z7y1oA2Ekdb3CB3+iFQrw2wjrOK1+6+UWXkpq8ZB6nqPtVTr
	meMxN8LJj821N7Mp3aXwBV+9FEMazmGWIw268zVekbjQc/9tIBYykiUpe3cPYxVsdCbNQp4w4QZ
	9nOBJRYuGDbpDGUlFtJScAot0=
X-Received: by 2002:a05:622a:1990:b0:4eb:9ea0:cc3b with SMTP id d75a77b69052e-4f1b1a31be3mr13947591cf.11.1765339532869;
        Tue, 09 Dec 2025 20:05:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkHSfkrOLAxJ5L1yij91ofOJjggiNdYtSat5qOrz5N2u0warmpPcwiROaiBMBHLGo/LWAr9Q==
X-Received: by 2002:a05:622a:1990:b0:4eb:9ea0:cc3b with SMTP id d75a77b69052e-4f1b1a31be3mr13947351cf.11.1765339532485;
        Tue, 09 Dec 2025 20:05:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b24730sm5940027e87.33.2025.12.09.20.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:05:31 -0800 (PST)
Date: Wed, 10 Dec 2025 06:05:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, abel.vesa@linaro.org, conor+dt@kernel.org,
        vkoul@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v8 9/9] phy: qualcomm: qmp-combo: Add DP offsets and
 settings for Glymur platforms
Message-ID: <ukl7rhthpfz5pw7pdeacplnaybq7txrkcnji5v5md6lazkw5bm@in5q3lilm5ug>
References: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
 <20251209-linux-next-12825-v8-9-42133596bda0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-linux-next-12825-v8-9-42133596bda0@oss.qualcomm.com>
X-Proofpoint-GUID: a61ikMxke36S0f587d1vyka_It2v3PfQ
X-Authority-Analysis: v=2.4 cv=Y7/1cxeN c=1 sm=1 tr=0 ts=6938f18d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2SJS8p1ZE3BWaHnukEQA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: a61ikMxke36S0f587d1vyka_It2v3PfQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAzMiBTYWx0ZWRfX9f0gLk0ZI1xI
 F17BJhwRY4G80XCh7kpNaV4LcU7ZWPUtCmP+2OSc81cqU3p7/GnJLiOU9Ao+umaXRQAyeNwV524
 kWqJNFBnozu0lWFqHvKlLi/aSOs//u5hxeYoUk6EBCqKVFbanIzk2hoCZveD03vfnE6nC57ZF0f
 v6cWxiJ/5vhmqo/lKzQf0ar7Tmr8IZQmAt5rUaKYJjsuIn0RlPnFUjn/OCP+ZCYTYvkqQKHFndt
 RHUv1c4LuOxkVMPY2EfUxbKmtvPlMmmFrv5+zNHtWB9uIQOwStoV+z5m4/sy/8y55kwXS5IqpNi
 NsdEAt+xXfVXzU2HipZWgtalLCL5AhIh8bMzUdP74LA0IfH/cM58i14rHCcSgJJvE26VoPFbHre
 Zdjs2WiEGXZ4z/QwkLNnctQEkEiSbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100032

On Tue, Dec 09, 2025 at 03:09:45PM -0800, Wesley Cheng wrote:
> From: Abel Vesa <abelvesa@kernel.org>
> 
> Starting with Glymur, the PCIe and DP PHYs qserdes register offsets differ
> for the same version number. So in order to be able to differentiate
> between them, add these ones with DP prefix.
> 
> Add the necessary PHY setting tables for enabling the DP path within the
> QMP subsystem.  Introduced some new callbacks for v8 specific sequences,
> such as for clock configurations based on the different link speeds.
> 
> Wesley Cheng added some updated settings from the hardware programming
> guides on existing PHY tables and clock settings.
> 
> Co-developed-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 355 ++++++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v8.h      |  25 ++
>  .../phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h  |  52 +++
>  3 files changed, 428 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

