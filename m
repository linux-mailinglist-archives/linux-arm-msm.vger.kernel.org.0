Return-Path: <linux-arm-msm+bounces-81882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 94227C5DA07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F093D4E12FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444643271F9;
	Fri, 14 Nov 2025 14:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIYQGygv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPAXaMtJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96734326D5F
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130405; cv=none; b=KI+ibbDjQDNvkQalPqnrY834vkYuvtyookYZ+EsZ4Fl1t4CqI9qmEKZFF7si3CwhjRpTt8sfhfX/oBelUYOxX2fpqDoLub7qDoAUxj88u034S64FJdbX9AJjRA8T+nZJuxe5mANN4PrSmWcUizPSpyl6G0POWWM8Jehw0jhUywA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130405; c=relaxed/simple;
	bh=6Eb4Xu8UDDYSjYJiMv5R2UAL1/PhwS6fIyXTlU2sZ4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TK++VdKk2Au7TpPov1heubAMvgozwGITVwsrqQZAeNcxp8W8tPzN86Iq/eu/pOuk9K1rcD5bukjI2HhWVivgagxu831uIapvS9D449h3wxrK8Wy33cbRgLfW4VKE3tC689H2sdcPNy99S+0POSDx20CACv5bHFBxtC32/Q5uHts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIYQGygv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPAXaMtJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE85h4a1502022
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6rBuAvDgDvq4AbHe8l+9Pt7RcFzQYhXMqhsWOdMPD4=; b=QIYQGygvUIcBHrgT
	x2CsLyJcWPf5DnNtRFAz1YYZQ6UJMTqyakWcJgPNf7Lznyur0N0R8d2jReQSVJH7
	M6YoD1Ovj//zLdS6dQl531cNgeoyYlrjREd50di5XXA3wI4qqyA8FcKJFFvfheCT
	knQCF7GvYs0M0ZonPcFKOnxuSYPgCeUmhNWExhC/NJwCOsY2mDOOMbYzOtxM9PPw
	44Ua2iBAiYt9xXK65V1pQLaL1+HZlPf4n7XUhELEUXa4xtdOYlwpieOdgnzfSNvw
	1OwkeUYFs1sxaYd39rNaVKv32I1C9amw8w/5zI/2R+zm5QPCyA6nYpFb3o3Gnume
	BVAu1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hte98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edb7c81e0fso57056731cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763130402; x=1763735202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6rBuAvDgDvq4AbHe8l+9Pt7RcFzQYhXMqhsWOdMPD4=;
        b=kPAXaMtJr7qQlpqKRDfaYoANKUcN7u40tV3XAex8bBqMgu7FzYJ5eL1uTPL0yeu97z
         tRpW5i2wOaGKW2S4L2/FCTVVA6rzWQE/aBv5glRxx4s+AZ9rSaxrSOxu80BKVN4m1PHi
         mHmLJlGJxwlnQ4HHREqZQBYmvYqM+OVmAU3UWlltKlh9+ussKtrbf0xsUUloY2u+Bhbq
         Ud1u4MqFXDeHERNMzrvAPKNJnY4hjlyubQYOlvdLaH8FFGvFxDlkN7fL2vAnwFJ5IfNS
         cH5Ui0yw9QCNSYx9vzRVHSTgDwE+Bv8I1rb8pDEFU4YiWGLGJXZGe28TgZ9Cul55xvdi
         dECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130402; x=1763735202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g6rBuAvDgDvq4AbHe8l+9Pt7RcFzQYhXMqhsWOdMPD4=;
        b=i/+At50diOk1hIe+BmmoMrOX7iZ08PTf/XXjR2OD6/9iLp2HpGLoU1KvwmLbeWwgZ/
         LBF/rNMsVU13hPahLxG379KtyLg4+0znI42+x5AW7lItr4A5QW9F2VfkMYpsdbHH+HNm
         cpSOtNFUEzY0ppNuys8DVTnz7gH6RhW45c16l4XyLbzkwC1lV67saCtlD9kiQR4EAQN9
         ZH+AzVnxp2DY5lWFHP8O5Y2/LoCV+FWHts0m+zhjMYFj0XLgoukyfEeVLg+hS4Z5xDBg
         b42lZaVVaef8SpZXUh2ZZUoYFbHS67ZNnk34YwV7IXx3/WIubrU7pv92C0+vw03i/V3L
         Ouww==
X-Gm-Message-State: AOJu0YwvjlNmmotacTezQ8rbPCANCkYoVdd7kKWCJrYWlVFJ+kbIygrw
	oJYG7tntByk1s+9kMSwNosnH/fdSNsXVhTfFEOReaEosLfEc2qZ2dECkMDLPJb0vrvFA2xVHJcP
	E4PyuwMm+hxqcCs9H/QTMJJ8qg/n2bkh61mcgAEQdH9+ldzdLiE9kDmOs+MDtaCiZQG/T
X-Gm-Gg: ASbGncv6b+4+K0CXjpxqfhg/kXgQYhrRTgQrgUyWtsSlaHE14dfkHYQl4xR8YezLVVZ
	1pxKP81oAEkPrAe4Qvw8M4xcr02wqxMAhsbRVs8GTVJQlzScx0iiRVtLtMgHEshAjVfkTiB9nSI
	z/Qmj26kCcWtlqb5tRVTkIY9Eomxh6+fdJ0S2n/Yq0Vw2FCdmUbo4gravrzsFK7qWVrUMcIR8Fc
	/LiURVmFdPPkDda1rpojKxapcQcteEyQ9T42sEeW2XHWc3T/Xk5clBDhL4PaMTSBLoostIJLSrB
	3z8fM2FlwpIFPLN+v17/6wX5Un5hVUgM/3Vx9p4u2DXsBIkRWFh11YLAWonBeATq+akzs6aBTSt
	tb2I85IyRFDCiK21ghBNCe0UkGWW63JpfJNOxqUNYtx99DdlbknsRg45grlCKFiKVCvb5fSrtMN
	HtS6fOVLUP3bZL
X-Received: by 2002:a05:622a:38f:b0:4e8:846e:2d8b with SMTP id d75a77b69052e-4edf2068f59mr43986511cf.28.1763130401828;
        Fri, 14 Nov 2025 06:26:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEakUAc6N2fCqGU4wm/QqwFYrmn+RwHY7Pqe7u0eTPXZmmoSH1fDCDFdg/tANn/M1o7MNtAow==
X-Received: by 2002:a05:622a:38f:b0:4e8:846e:2d8b with SMTP id d75a77b69052e-4edf2068f59mr43985831cf.28.1763130401240;
        Fri, 14 Nov 2025 06:26:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:26:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] Display enablement changes for Qualcomm QCS8300 platform
Date: Fri, 14 Nov 2025 16:26:32 +0200
Message-ID: <176312947279.1737000.15103747115099944303.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wbp7kJNJZBMIrIZu7c7NX8qkrgWPNnQP
X-Proofpoint-ORIG-GUID: wbp7kJNJZBMIrIZu7c7NX8qkrgWPNnQP
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=69173c22 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=2BC_VhOQHQuvYBtrr_oA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX4gBszj/j1Eey
 D7I582NRihr/HNeTKLn2HPQGXYU+wXqnVqs1+zBoPbQffeK3hc38OmMEEbYxwG3uMWRbbNDrGnF
 exSPqhp1o6rNOpVDi8Y/DpXqLWIMbiWZ8Cb6EQ9NrzVSPkjpFOUTKEHM1CM1tJZK5D7A3wLL9pV
 45yz1huI4LWSwIxw6KC77FgNB9OFpZFiWPKMgYD/4w0JC5FpPvnRGpxtNXk6q8VJ0Ud6j6aMspw
 YIIoXLDsLzqsnvXwTlz9DSqcWsEmWz80yMIwYu7S3wz1UUhInzxVl4CHl9csnAz6aM0qSR/ZaYF
 78lQwMJHD/r6xaIwwsKTnaQmHE/RsKYRPqjQAq3Ow0OMJsXU9cFvwrC283ZZWyYYWrd9J7CYkRb
 Vkhci9n+Tzxfcg0CZzk+9FC7EimvtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116

On Wed, 30 Jul 2025 17:42:25 +0800, Yongxing Mou wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
> QCS8300 target. It includes the addition of the hardware catalog, compatible
> string, and their YAML bindings.
> 
> 

Applied to msm-next, thanks!

[1/5] dt-bindings: display/msm: Document the DPU for QCS8300
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0e9cff574436
[2/5] dt-bindings: display/msm: dp-controller: document QCS8300 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8a6c62490d77
[3/5] dt-bindings: display/msm: Document MDSS on QCS8300
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b420fbfdd62b
[4/5] drm/msm: mdss: Add QCS8300 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/628fa5529762
[5/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
      (no commit info)

Best regards,
-- 
With best wishes
Dmitry



