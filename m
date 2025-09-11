Return-Path: <linux-arm-msm+bounces-73149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 043D5B53658
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 16:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D433EB620EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C6C34167B;
	Thu, 11 Sep 2025 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1srIZVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F143D33CE8A
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757602329; cv=none; b=cTCkWwiSghCItwfCvkd3D8rGq09CmdYSY7mLZ/LKxFfMTYxBgkI73LgzEU6N+NMgcGHKvjxjGPBKt2nPQ8mO+9qbW43lVCZekNW/1dRHbk/PbTXDFnbYwmkADhMPaNeADi1Ihu3Lsuyu9CQoA7L8fRQT929sX0h7Tm/9d9Vr/1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757602329; c=relaxed/simple;
	bh=XUnWDnhmJUT6GLGLfZ8dfUraPryJil2OqonDHT4V8FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OgpgeObZOhQqCzxP8pLxHOoV8BdL/L9EtdNMHhRm9D5YEdhnxEyBR9jKoxBNE3VRqyxTIgud4dfi8rI5iOs7PAocqp8a4d/Kh9+ymAkqdw2+KQPCzCWk52Xz0z8LFkSUsIbBdKCM7FgLJoJqHNnWGSLp9hfIvDhF7TWniWpJMiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1srIZVf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBLdqP026727
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WojJDvsX9kdVKAnNSnxIU1th8+eZ8pVWigC6PBhk65c=; b=X1srIZVfXz6frseC
	6UVh+E42QctEW94Jng3VYLFtPsGhJRQxZ1/kA5u7hea2LzIlpzCxsdkFGSKCkIiJ
	y0NnJuSwT8mize+yh3H1ofS7h6d6GEzgCEaJLsGUcMLuL1XsoL8jqL6y95WEjrlt
	2/v//VyQKQzTha71IUGgaqZOO/YJjsXBA2lNdT+/OAAmDK60OkqYjWz3yVapU/x9
	Ov9Xmp4RH+xrjoLwYITHfp34X2rRBQMZxL+dSDT22TI434vHkksmBkOrm/eNwLD6
	AI1ToTY1zy63cW5AI+dH5KAILpeOj7B0HJ6NK5kx+hTcwREQmiy+p1f7Lo8QJC6x
	NeRLwg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h34m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:52:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-245fbdc2546so1791315ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 07:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757602326; x=1758207126;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WojJDvsX9kdVKAnNSnxIU1th8+eZ8pVWigC6PBhk65c=;
        b=KQk/948oibOkwnJreWdy+LFfe7qp6t4p9Kdkv0TootgsNAk60uzKt8BBMaiLN4CQNR
         iMUScmtOJjGs0Woi6tw18TNIrtnC+icVC6YesjyOdcA4sLhNdFMZ262VyHiyvF3/GUd8
         iD7a4WjeuRGmzOXEAhMssgFqRyTmHX3sZpoUta16I1YskGikq6najeKkYlAZ/cShWI9K
         WweZt+QHecXxa4vmXFMFDpEljyHijH5YcO3fk+Heo5FmAzM6TJDny0WAND3dpRhpZbTl
         YIiWBJVDo4304Dehh37Xj8BZzXb4BffdIeYJYo26XIJuw8INvqVmnlvaSe9ALKAeE+oq
         q05w==
X-Gm-Message-State: AOJu0Yx8YxuK5Nk24JaJN0IIeo6tk04BUSz/pVsJn9pFSx1R4kbseug3
	+MhnxY1EhjKqGQLTzuJ24ytEDaEZ/CKJFvNx44JDOM9YFVbEeoMaepWbfEKNnUgVh36zZFdGmJ0
	iSaQTD4WXXx0wwGYQeNnafWbg0je0AVrvRbmO1atZcOCw1Ai4u3UKF7NXsHtwQZ+H3whh
X-Gm-Gg: ASbGncuGxYD7l4C70vuhe7iyGZEbgZoQJhgB7bmblHMnY2hoxHjnEb8cbNWDXLwXfC9
	2j0fWYG2dk3ASt7CainJub8bA0IZ45BVkKFXRndZxSV+Qk5KEmRWROMdm6ULl1C/l4ovo2PJsis
	7GW/VZnBkZtN6gKtYRQZlH28cJwmsZdqCBz/9LePY2hz0nlfp8hQkjM5oaJx4/ueDud+MflAFDE
	Inpn3Ca6GRYz/guAhy57kB9J5fuIhumXqdyhk2mLqSz3Q7XHbzg/DxYlwcPTUAZ43doiAw28Y4t
	ultpnxe1MoC5K4M74ngAdoPieaQvrGTcQ5/aiq2YwKc2hx0rF1JNO/htS6J6Awz8wNVzWGyuujo
	oPxaYe/t4sg+FEPYjOqWWGkjgjAod5g==
X-Received: by 2002:a17:902:ce83:b0:24c:b36d:637 with SMTP id d9443c01a7336-2516ed66eb6mr141725465ad.1.1757602325778;
        Thu, 11 Sep 2025 07:52:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT+PRAiEdvkLjcRfWqdV9jt0LLP+pDcy5hdt4QkW8ZMuAA0nniD4jnVIYnBcIAtmyR2ZAHuQ==
X-Received: by 2002:a17:902:ce83:b0:24c:b36d:637 with SMTP id d9443c01a7336-2516ed66eb6mr141725245ad.1.1757602325286;
        Thu, 11 Sep 2025 07:52:05 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3ae28408sm21345695ad.109.2025.09.11.07.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 07:52:05 -0700 (PDT)
Message-ID: <33137dc3-254e-4a7e-9531-8d682692fe29@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:51:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] (no cover subject)
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-177348170c2d@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-0-177348170c2d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2kqCQF0FiD-bC42Gr7X-0CZH5RXUVEam
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX7eSId0gNEXsu
 Q+1Yq8xKxiA5F3uj6Wgam0znoSAEM7SHCClso+niG9e3O+/u0PIzZ2w0HLC2jFe0txEj+x206Zy
 pJyJ7gtQ7nWzj277aKZe3H0yQfeaF5CcmhIjN2ulWN8r1V8Ajxv4d56OgE40QQkmoEYzCMf3d5g
 YYLNFk8iZlIpoQulQFSk5TXSzzlJkAqmPwi7nia4BC7t2Q72BrHCRcZhaNesgbW1XtwVj7fqSh8
 YDOQqfBA5/KDjvctD2RIMuGekA6kahyUt9agajCWFBRWWuJh5qTqL1MWDMIhGlRybc1ITd1y5Hd
 y4renN7/KIx2S1UJTBKnrM64aI/i8yS0RNpJiHNveR7labOrwPD91KmkkY1P5ztpGlRBMsUv9ZU
 +w/QDOz/
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c2e217 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=BiXlWXQ3g7YhofqwlSUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2kqCQF0FiD-bC42Gr7X-0CZH5RXUVEam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177

Sorry for miss subject and will resend later.


On 9/11/2025 10:46 PM, Xiangxu Yin wrote:
> This series aims to extend the USB-C PHY to support DP mode and enable
> DisplayPort on the Qualcomm QCS615 platform.
>
> The devicetree modification for DisplayPort on QCS615 will be provided
> in a future patch.
>
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
> Changes in v4:
>
> - Drop patch v3[01/14 & 13/14], will sutbmit new patchsets based mst dt binding series.
> - Update maintainer of qcom,qcs615-qmp-usb3dp-phy.yaml to myself.
> - Add missing aux and pipe clocks. [Dmitry]
> - Drop second TCSR phandle; register offsets are described directly. [Dmitry]
> - Add USBC PHY series related init_load_uA configs. [Dmitry]
> - Drop v3[04/14] qmp_phy_usbc_type define and use dp_serdes offsets to confirm DP capability [Dmitry]
> - Reorganize sub-patches as suggested.
> - Link to v3: https://lore.kernel.org/all/20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com/
>
> Changes in v3:
>
> - Renamed qcom,qcs615-qmp-dp-phy.yaml in v2 to qcom,qcs615-qmp-dp-phy.yaml in v3 for QCS615 USB3+DP PHY.
> - Updated patch v3[02/14] to revise binding title, description, and property order. [Krzysztof]
> - Updated commit messages in patch v3[01/14] and [13/14] to reflect the DTSI rename and clarify compatibility. [Krzysztof]
> - Added USB3+DP mode implementation in patches v3 [003–012], organized in logical chunks. [Dmitry]
> - Dropped patch v2[03/13] to maintain full backward compatibility with USBC.
> - Link to v2: https://lore.kernel.org/all/20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com/
>
> Changes in v2:
>
> - Add new binding qcom,qcs615-qmp-dp-phy.yaml for QCS615 standalone DP
> - Split DP PHY driver into patches 4-11 by logical chunks [Dmitry]
> - Update DP PHY configuration flow to align with QMP Combo PHY implementation [Dmitry]
> - Update all hex values to lowercase [Dmitry]
> - Remove redundant comments in DP PHY driver [Krzysztof]
> - Remove invalid USBC type define [Dmitry]
> - Move lane_map， max_dp_lanes， max_dp_link_rate parsing logic to dp_link [Dmitry]
> - Add TCSR-based mutex logic for DP and USB PHY coexistence [Dmitry]
> - Drop patches 6–8 and remove related binding properties as rejected upstream
> - Link to v1: https://lore.kernel.org/all/20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com/
>
> ---
> Xiangxu Yin (13):
>       dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
>       phy: qcom: qmp-usbc: Rename USB-specific ops to prepare for DP support
>       phy: qcom: qmp-usbc: Add DP-related fields for USB/DP switchable PHY
>       phy: qcom: qmp-usbc: Add QCS615 DP PHY configuration and init data
>       phy: qcom: qmp-usbc: Add regulator init_load support
>       phy: qcom: qmp-usbc: Move reset config into PHY cfg
>       phy: qcom: qmp-usbc: Add DP PHY configuration support for QCS615
>       phy: qcom: qmp-usbc: Add USB/DP switchable PHY clk register
>       phy: qcom: qmp-usbc: Add TCSR parsing and PHY mode setting
>       phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP switchable Type-C PHYs
>       phy: qcom: qmp-usbc: Add USB/DP mutex handling
>       drm/msm/dp: move link-specific parsing from dp_panel to dp_link
>       drm/msm/dp: Add support for lane mapping configuration
>
>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   |  111 ++
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
>  drivers/gpu/drm/msm/dp/dp_link.c                   |   71 ++
>  drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |   21 +
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1089 +++++++++++++++++---
>  8 files changed, 1192 insertions(+), 196 deletions(-)
> ---
> base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
> change-id: 20250911-add-displayport-support-for-qcs615-platform-2f072e2ba239
>
> Best regards,

