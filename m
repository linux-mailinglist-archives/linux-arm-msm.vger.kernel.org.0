Return-Path: <linux-arm-msm+bounces-81878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 173E6C5D9C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F1594E4E7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC41E325498;
	Fri, 14 Nov 2025 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onGjc7qK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/FKVyu7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453D5324B34
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130397; cv=none; b=t8Dpuv+BzmxEZxM/Da48QwwicB0CaKogoCIYnDWmJjDevFvXnnoFk8KTM7UUCxnrXkQJq2auyzV5Z75EdSG6e8nQXV3TMIWHj4msuW5t9rYklzsdpRTfRzFfiw5zORGpLSDt5B0QCus5gRGtj/noOJT4lLfg3dXYPZv4g9qiv9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130397; c=relaxed/simple;
	bh=9f9+RKxUrAQbjdf2T6XhhdD4pu7xMfYe/GD54lP0aI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TbjRd1AqSViUFi51D6RH34nptfxqy3v2W2t3TDabV5YVQn2Na5BnHeSQAsXhbFX09m1PLNc1gNlU0rQXypVHrmR1s25/UwqaeofBe1EIOcj+MwvWO9yxB2ueMwwKTwx9B4fylJTWpeHRP/AOoqo4Ayx649PZ+a+QhhbDZcxyhyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onGjc7qK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/FKVyu7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8MFRT1585454
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9no/0GxZu07rSqXKlYIfPnkQay7eVZlKqtoBFEi2pc=; b=onGjc7qK7k480p0+
	9xm/ydktUD61A5FPyRVnxcyvkkUEmSezTIcdhaqTu1ES2CI77dsomBXbBPqNRR4z
	x/9Eoy2WPml6sskYOZhjw3q3k4xY+c3/+LLNY3YmkHj/6nZg6Ws8B/Yil6MMk7Jj
	Y0Ad1c0M8K2ixfIJMcv8TyQWpvzMKkoPOZWEw8lGz+oNXoHXZi20lDnJWq2HLlzp
	sPniywPeDgRsLlQB4GMn0u2G5wnh8dueM5BhOgRJd8WIInrexXLUG99zASdOiB3+
	Kjvqlfp7XaWmlmZpMe5rg/XiYavJxbJKjJW2OJ1/eVsy3HVsrY9F8tTOKwafco8F
	gOpqJA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9ftewr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eda95d8809so45603321cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763130394; x=1763735194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9no/0GxZu07rSqXKlYIfPnkQay7eVZlKqtoBFEi2pc=;
        b=a/FKVyu7y8sbBY3A7YKE2DAQc6w923bj49bDciSEENC/wBtoT5fiSM5ytiBX9VHbZN
         EZkm2S3s/paAp6kTxWYz7xWbriG8eBdB5UtaIuaYW6a20HBWeOaQT/vZjH7YFbTZVAij
         A7UsgGMywgdE5XqbBuVHWkLP8+R/yC8XQvzfOB8DisHn4oVcp/NW1TH53FTafF/5ZQy2
         dv+qh813f9XZ861OCgcFTjK+pvO+s74ursLrv+Ln006Tlg9z4T//kj+3tWqxeNQMRNZV
         IajaNwa9IryMcuBfs+2bcYwKBWkG/RzdjlsJSEAj7C36pT1cA6gjS8RIOfz/YsKaFjbD
         7xZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130394; x=1763735194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9no/0GxZu07rSqXKlYIfPnkQay7eVZlKqtoBFEi2pc=;
        b=PavzLcNPVHoO5wfiokdH2Q9O9UcbhW3StzUfuIZ89YV5YDpihpV6AnKY5ELduqiNCv
         hW4CWxJ9IkNwaXl6kVm1zWXpl6mUGRlZjP0umtgGQGgF2PPWIj3QekZ/i+Mu3kIZAL0X
         pqL/wR6v3W6a9YiQofyOLsRIamvb64B9jB7KI40bb4mJHh/NJfnYyznqEcvhgoESt5NU
         +ddrli8ZJFaMUSzO7o3Rw2rtFkiTu3JwMci3dgvi0eYs9kd5dx3qhIf0IjeBluzrJfZT
         vPVmER6LbQ+YLVY4KSTQujUB9+YdEKDcBkQEHNj4PSyQ4g1QYHlG+4qiwUdIRhl5dZSA
         uWWA==
X-Gm-Message-State: AOJu0Ywu4CvyxlhrSOxiRgJdVXjeza8lxlzwt90uSjt17ICociQQImrC
	RXFpatE8o+1bdvWbg9vhTaI42rgcoeHSYvz45htcU4qJRCK3nX3jo9l0FuNDcztsGrdm/I7kPSr
	qvUGSsT5uvGJUUUhANjoEzX+o1KMzvsEgnPQWi+ntoSuA/Scjj0cB2lcTBJTKcP0EQ1h6
X-Gm-Gg: ASbGnctejNgRSpRYgQuTTC6XKSaLncmSDiJ119RP9lXnYbQdFOiufgpilIx4P8Jw8DO
	WlgzsUeXMeydqr8ROQeQYVwNNxx0whgHWgnGPQYLQyXQfUD72Z0ErG82fwIMbpe6LyqPrZuN0S/
	mGmZheIKwYocPntmo1zhIIs10D+5WRKorlpcxWPQlpmOtiLPDFd67qkBelPQ1dnoRkzRst3h/mb
	EOucuki3HPJ93hJ6vhax9OVDwi76SKFVk4t6zVWC0gRN8dQ1LNMP0aHd35FJetQl3M4+yfvaeTW
	VOT5sDpxs44x/xfq4hA99oXSCQj3DW+U76st7qgAeevnY9qYq/Xjav4ilMYub54xR4BUt4tYNKv
	DfyBCeDV0RNVjjmw+n2Gtf4zppgVi79Y51Go8jj60cmPlpFbbOdJduP2H8bFUjz5KPPqn7HX9mZ
	u9PYX61R1UhTSJ
X-Received: by 2002:ac8:5809:0:b0:4ed:1948:a8a2 with SMTP id d75a77b69052e-4edf212af38mr48477241cf.40.1763130394369;
        Fri, 14 Nov 2025 06:26:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHscNoHLm1MuydPFCmacZaAgfo0Tvh6OgbQ4/hlbC4OeYTE54MJSZKbngEqsl8733UCg4WVw==
X-Received: by 2002:ac8:5809:0:b0:4ed:1948:a8a2 with SMTP id d75a77b69052e-4edf212af38mr48476551cf.40.1763130393831;
        Fri, 14 Nov 2025 06:26:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:26:33 -0800 (PST)
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
        Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 0/7] drm/msm: Add display support for Glymur platform
Date: Fri, 14 Nov 2025 16:26:27 +0200
Message-ID: <176312947284.1737000.2080843930887893997.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=69173c1b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=c_IYe_yHoYF0OweyKxMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: DkMj0kRiWOeO8Kvmf_KbYhcPMolY2pg0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX0YtgdBOFR5bn
 xbvtU8nh1QQCYq7v+ojkW7M+8n1MzGH3g3Us9Z14jZjU/i7wWSWchQbA5Ck1CMq+ZXp9P4k2o6C
 e0TbJB965WXBVG9eY3tmsC7OkfFvcI0CjSg0ywaJTpysT0zfOTBm3DAQ3a74Pq86ELdsQ6Q4Qjr
 ugy/sOnVMaHUyyqR5rh7XNENZZJn8xwVV9Nh6r67kDqIiPJfoX6nySmw3GnVNnl4uRs2h01S1Yj
 ei8xi3wXkJysRwLjzQxH0rkDUPEbfbYIUbEA7BtJFMqhUk2kt5hwwDnlo6RhFCKhkqClQXsTCk6
 qbyZmDa1jswC1vWboY0hiN+ZboNUF1/7E3fzQtKROUGdLIKYNuNBPYBRd3epNheGCByrKAO3Qv6
 t9NoN4xg17oYrzYb3e0qS3W7xjBd1Q==
X-Proofpoint-ORIG-GUID: DkMj0kRiWOeO8Kvmf_KbYhcPMolY2pg0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116

On Mon, 27 Oct 2025 16:59:17 +0200, Abel Vesa wrote:
> The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> version bump.
> 
> 

Applied to msm-next, thanks!

[1/7] dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
      https://gitlab.freedesktop.org/lumag/msm/-/commit/29deccdb0927
[2/7] dt-bindings: display: msm: Document the Glymur Display Processing Unit
      https://gitlab.freedesktop.org/lumag/msm/-/commit/306305f38cd5
[3/7] dt-bindings: display: msm: Document the Glymur DiplayPort controller
      https://gitlab.freedesktop.org/lumag/msm/-/commit/144a3862f626
[4/7] drm/msm/mdss: Add Glymur device configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/401388017c14
[5/7] drm/msm/dpu: Add support for Glymur
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d15c65a4645c
[6/7] drm/msm/dp: Add support for Glymur
      https://gitlab.freedesktop.org/lumag/msm/-/commit/eaedeef2b9aa
[7/7] soc: qcom: ubwc: Add configuration Glymur platform
      (no commit info)

Best regards,
-- 
With best wishes
Dmitry



