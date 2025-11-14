Return-Path: <linux-arm-msm+bounces-81884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE38C5D986
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A0CE3B30C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10C732721C;
	Fri, 14 Nov 2025 14:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCxaXnq5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZSEpPhh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD52328242
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130407; cv=none; b=tlUaJv6GHdy3TCX1oa3NExjDTUYDW8d6Xayr8BwXzt2InklvxvOFkaE2gWJ8stzi0xjD8XdMHP5ndRU5tlOPkt9BfCyAR2S970P2FvzQUTh+U86Bibg89LbSFOA7ZXwIAVKNH2LLzNNcGmqeAWr1j1mnrRngU9/66iufUconEaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130407; c=relaxed/simple;
	bh=XZjtWwBnTJarvVpmLfN3yLNaEwxrZ5c4GVHO0Ty3FcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XpDtlXSLkerESZqf5MlO1Ozm11YPhbR36PT0J4fv3245GdPcRCAH3pGBXnaUwswfplMJDl1tvwMejVzMPfFyUpoqaZPbo5PCr8txWaNGXWG9PMIWu7KGSfvVm95oGpsCP/HvYDmDVVp2tteI9jL+TwuiBrWMXR0EcQTh0mNLEfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fCxaXnq5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZSEpPhh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEDuRpV4124143
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wm08Oj7Apo5HgrQPJ3V0ulymMOQiyCRSYJ12wElgY/A=; b=fCxaXnq54yS74FBw
	6RHBjpeXn5Qr39HTyXLbNeEq2ik9hoBiVW0ugwCFG3qM0vQ2RGwte7C50kqnKTpN
	IlNsalNlglxG4beIZDzeOzNwRi3SFLklmbqW9ueuwu58sEqGZIBpMeetfCDS097u
	yqoSmWjSFr7ilqZ/DpUO+SPzFt6b/p1tN79tLg5vujL3UQeK9CJ4khRDPUIu0mlN
	s8Prgdq3a3rsHtesDHTZQHzQe61/tiqJD1COuxhI2tSxiVND3Rx49rSm7XXhYaaU
	aufzXSRS/6Hw4FHdVNwzwRWwqqgw9dPqeVQzRG7Af63l1DG3wzOC48TM72RfPmNe
	2I0nEw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae5r7r2wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edd678b2a3so32771971cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763130404; x=1763735204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wm08Oj7Apo5HgrQPJ3V0ulymMOQiyCRSYJ12wElgY/A=;
        b=PZSEpPhhn6AaI0D72h2xiCF0dBUeUawqDUGilZS8tbhWGopiEsZiDnZcIyQA32PlxE
         RM8IXFl00cZnHMeihG+qrvp7CwT8IilzpLHyM8m+boGyyxXd53sqsVOZWbPY1hWSz85F
         yOtzBlhOeNo9DCROmhIUWlKOWaPfVBrdqqz7+AjOH2ek64d+pNNF3iAO7QiM+XBEbBlb
         +wsdrmV7YLrhHIKrkWJ54mw1Qou/RoBCRX13kTNrjryB5BvMsn+n9a30XO+87KcwTD78
         qJpHtkf5VyjrLfTyNYn6A0sY8uuJLlpXGpYDpHXWBDj314rLokoWPYu8E2p6i7iXagR+
         LnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130404; x=1763735204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wm08Oj7Apo5HgrQPJ3V0ulymMOQiyCRSYJ12wElgY/A=;
        b=N0Jwy8DT8XRjQ9uc5swek6YZsOWtcV09bS+AHOISCA6VyMROUSaB/Ac6LjCLI+kT3I
         guFiKuo4gLS1y/iaama1wTOYoMaXHU9K+Nr2JB5x7FQn6+qwpG2DEeGhoZDcUFICz6sf
         ShSC/xp+nNAgDbuYmMXkd8SeQ+ZNL6LfHAIQKeCT3McZMUgIQYp50JNlyPfUZ4zGfA1v
         nY+OqfgchUB8C7Ukhz/niblprrLe891qKl4i6PE4ui9cWaisnxfh69lK66iWCtYfWvjd
         lWG8n1R0QxpH9i2IPs+pgob2/WMssuit3OKWL6MnEulDBhzmyjaB2ezudxp4r2g7J62z
         1n9Q==
X-Gm-Message-State: AOJu0YwGfc99ttGXsu4U8LmHAhQ11RyZy9IZetrFhrjWXH1vGjmyG36f
	w7+k+oCnOoVBgLSSYpgn3LUL8/y0A5llwx/PKCRpBOGJ2tsdrLVvhQvwGF4RiC2jiNieZKy/YyP
	uCqEfAtQ4/kaUVhmJ6XlxtXRRS/PlxbyDMydjy2X2A5GndueAxe88lEvvX1oo1goRSrug
X-Gm-Gg: ASbGncuGqgT38Dywdl3FYAP+AYMBOnBKwmo91vsyjUgCnt1FZd5zYMol40eMH7P9op4
	PgtEhh/66RsPeiPVTXVtwKevghBPbgdDX7L2/VtWedwKTXe5CHnkf0wai82R9xqoWNtLAhxiOav
	t7c05QhF7jdbVhFZeTfwywSPnbQ2T7wtiAP8Q9wFbxxxAwGHVPMLwqRwyNQmXf16/XnmlskfQeP
	l/keHy09M7ukQkAtTjncXXhERPRcuUdmiMqE5FqD7YXjVS1GR3NVyZExnVLKTXbaIgSRBllt0yf
	7ByKUUEb0ueT3TtczxJVHj9CrjGBkobqSnvH9fI3AvuVOKuH4Zr1QeujLlVtJ3GDiIi/wgHQjtG
	IugqQoXD1t/yhHVIh5rHFNGkzPTaARX1/PR5aBKm7uUH1swGwVLMOTqp3fQzppydubu6pdpSbRI
	vYieCK7b5bSFOT
X-Received: by 2002:a05:622a:19a5:b0:4e8:bbd4:99d8 with SMTP id d75a77b69052e-4edf208a86dmr48912031cf.37.1763130404225;
        Fri, 14 Nov 2025 06:26:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFm90pluc4Y4JC2rHHO8mSgQitbLfLgaksRl5AUlSTdas0MjBH91PxBwSUSfWQtEunJDliLzg==
X-Received: by 2002:a05:622a:19a5:b0:4e8:bbd4:99d8 with SMTP id d75a77b69052e-4edf208a86dmr48911371cf.37.1763130403646;
        Fri, 14 Nov 2025 06:26:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:26:42 -0800 (PST)
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
Subject: Re: [PATCH v3] dt-bindings: display/msm: dp-controller: Add SM6150
Date: Fri, 14 Nov 2025 16:26:34 +0200
Message-ID: <176312947282.1737000.2726577602093999056.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
References: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfXwyFsK9Fd+hHU
 2yyrL5ZIjXnthcAdxNiNyhPnby8dKJifGeNPPuchzo8nZ9U4sbbCOnkLZBNXtL8YDqBw4wr5nu5
 mX2R/rlR1pF2PnlvzVfpVLUWuhZaOJmqG9G7zhT4HdI4CCe3ytjzfU3VLwckFYvcEEsGcIEqfae
 y3iJu+uWuxm7tVoSnKSvME+/UqnjZNeY8OntQy86Rk3UPyMioT/221xZy2vPPVmsrG9e0tI8yrH
 QKZrYNHPbvfV0AiF5cIULsMW8+lly9C4WPpkPENdJ4p9efszBwfYTTXcg/m8AS2LSGKrxYqs1Mi
 /8qeimepU+BDfRyqNy+FSCAPrzU2pzC+lu0dUMaxG5sftrRilJbjuNMnzm6aXT2/0Ezp++sbgDw
 Flwntp1R7AYz6wYoQWLuMIYO0DnKUg==
X-Proofpoint-ORIG-GUID: Tsd9dbsXDMCuI1MgwcaunQg9Vlr_Ffga
X-Authority-Analysis: v=2.4 cv=BJO+bVQG c=1 sm=1 tr=0 ts=69173c24 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=-ywfm2TNeMNqkeX1OTcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Tsd9dbsXDMCuI1MgwcaunQg9Vlr_Ffga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140116

On Tue, 16 Sep 2025 20:11:03 +0800, Xiangxu Yin wrote:
> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> SM6150 uses the same controller IP as SM8150.
> Declare 'qcom,sm6150-dp' as a fallback compatible to
> 'qcom,sm8150-dp' and 'qcom,sm8350-dp' for consistency with existing
> bindings and to ensure correct matching and future clarity.
> 
> 
> [...]

Applied to msm-next, thanks!

[1/1] dt-bindings: display/msm: dp-controller: Add SM6150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e56ff0888b2f

Best regards,
-- 
With best wishes
Dmitry



