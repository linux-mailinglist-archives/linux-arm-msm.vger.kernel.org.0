Return-Path: <linux-arm-msm+bounces-70277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCF7B31217
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EFC9AE1E82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 08:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2249F2E9742;
	Fri, 22 Aug 2025 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axp2p5FV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776632EBDEE
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 08:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755852205; cv=none; b=alYjJcn9/LQspETZN6L6iRQU9pXdfZX/M4MXNnJWl5DiEJutvTf6qTxaH6Km92gGrixfH8KD2xpBDVxwkpVn1OJZfjVIrmACcCYEtc+RhkWbdESoc1L2mVpJOKYRtj1P95j6Ri4IN9e2NQFpj4IYyOBR8Wutu2HSUrEDaumji54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755852205; c=relaxed/simple;
	bh=R5q219oQSBpeOcalKWFQBiSMO34ZKgzRjyeY80z0OQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pslaLAk/re3qULEPJ8guOerGrKg5K5D2GO35W6QvrwUofPqv//2yzvCztVoIoK7XNp2ByrCWjEBHXZwuO0tLGJ//quD9tgdbjm7fW55iJtjaMSkmHdInx2qdO5oAc+DIXgBo7YPxZqiZJElKGM3Dc9SU9NZMzYU/O7KaME6JuK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axp2p5FV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UIC8005592
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 08:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	prp9ElU8fS7+zbL7ub2mUXEAEbk0qpOcYYPRR8CM44Q=; b=axp2p5FVzEy9YAcS
	QpKxjbGkrARU1RbimpueVhli6iCQEpUDyqcg494lAA22Jsblt0Th/sBfiscGIE69
	1cMrxA9iLjFC8wqeBW3j+iVi4qMr7244u1I2nLm0h8ZcHGhRtGUE91bywbj+wAC+
	dS1OXqb5MHjUQgLEWmycT0onvSSvjEhCGo3MvcxRyatfJNxu//k0NhgqtqE48r/o
	IQxgsdFIhbVJrbr+U3VeiDUKJ6oh2ETrWciK8ez1kn1/YDad6B5nZdZUNVYnfMn2
	t4hhYkryc5kLI8EpPH6r4NFTYV4FS6Ojkiu8Keq4erueicN48lcstEy2lB1MfY/4
	iGR/rA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52drek2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 08:43:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244580538c3so4850005ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 01:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755852201; x=1756457001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=prp9ElU8fS7+zbL7ub2mUXEAEbk0qpOcYYPRR8CM44Q=;
        b=MUflAUcjnEqoAexPWCJSztxmRk6aURZf3M/QQ2Td2QSBQYfO7qJtb2wsQNNlvYm/uN
         FDajLtO3YGlTtUQHJgwkYYWRKjlNT4vISJXFmedeXg0nNozQEj2bDWfjUtAIsVJCBhZ6
         49j/8DyOcghQenJ8EQybSh/UuqiLRNOTn696QDMovlX+9fttcZqKc4QyuxkqS3gG35R2
         vWjFPNRgwMjnkESBcAeLaQx1/qIBluOR3VBeqbrq8iG/v3D6Hr4ty5hHSbmD4AikEt/T
         nSITxnQAsZqgPbTQGW2k6JzNGsezaNSP6XhEgQ7koygCZnB22fURjhZakQmywGWNhtJ0
         aDSg==
X-Forwarded-Encrypted: i=1; AJvYcCVbG1jzdn21uZz2DRQWfpnbr2BN58OUvd7QK82rOrUqw70ToyQnjNzIKDkdhO4o4mxpQSq/dJFu9T671Hcz@vger.kernel.org
X-Gm-Message-State: AOJu0YxPpXBVkeDLb451AbwEFAall+71VXUV9PiA0qJIMvKCYpCYZRJK
	FRa61WW5HVimIXEcEWm6rE6oA360GZZntLLVwtaUNrWxRhn8mJ/j478J3YeomILRlEfEtCrVSHA
	tmnawlaqKx/bBwoXQaLBIhp1XCp1jnSEAxXzfZG70ep+FUu9XbCtFNyyvk1ApbjWtQXdM
X-Gm-Gg: ASbGncs1JNfWewAWC/PoDWN2aTeIjzH2DpOJy/Qzbc0gU/Hw5hYEqvwF5H7irV2KROG
	xIodgEMQFUkCQNc3q6bQhnc0FbIyBfCN5E09uO08n64dTICSIsrv2Cij0AaEmdZfCI7XiXcsDML
	42pBW01RtymABJyKbYTBP+ajHBfsxava7eim5GPDY/jUa8jtpKKp7cnGxZ8YZSVSJqzV1qNp48u
	eQceDPMdF+VpXHGsLXIbcHu8G90P56mGn5c3DN1WRk0O1A5f+8L9ncOvV91PiLq4J6/joRQmE05
	EPi2ZY027LGAKx3coGIftFj0fCuLiUNE85eaXFtfqVmApUu0Rz/bsz41yzXwghnYtXyX0/DK6hh
	+mJS7toDvvhwRzKKlzqArgrVuRXCZ0g==
X-Received: by 2002:a17:903:1d2:b0:240:3e41:57a3 with SMTP id d9443c01a7336-2462eb662c2mr18144895ad.0.1755852201137;
        Fri, 22 Aug 2025 01:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEXolhUjPQKDUCRG284FJEb8zvrf0fcnVfDTTz3DHtqN0qA20e9P4wmEWvBmU3EEicTDFcdg==
X-Received: by 2002:a17:903:1d2:b0:240:3e41:57a3 with SMTP id d9443c01a7336-2462eb662c2mr18144665ad.0.1755852200709;
        Fri, 22 Aug 2025 01:43:20 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c7588sm77576235ad.101.2025.08.22.01.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 01:43:20 -0700 (PDT)
Message-ID: <2e3c1559-7da2-4c6e-bcef-eb1e8dfd4c31@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 16:43:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-8-a43bd25ec39c@oss.qualcomm.com>
 <su3zkeepxaislh6q5ftqxp6uxsyg7usxmc5hkafw7yn2mgtqeu@wua72odmy7zp>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <su3zkeepxaislh6q5ftqxp6uxsyg7usxmc5hkafw7yn2mgtqeu@wua72odmy7zp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyCqt+xuxN5mV
 MWtd1xNPzsQBlo1EZDzYBkoJPT3/mhn/A3dgoRA7+01KyBSoCLMR2PHV7Rp3KGLff+3Ewu8IxMQ
 nUssFIFdaUGmSwgWYIOz3lsMzuRIOT70/Tu126Ip5yGtJdRn8Naj81A7SDJ1DxnUcO7yNH2I8lM
 IgUmiYoa6bhlKwA97ST8U8bjMfVN94MO5vG2SPG37XIUMcHFI/YPC2HDIy2I5Hor39+1mJSU2OX
 s5d5Vxo2WGns2wSKe2utebVN3YvOULQf6+2SPJK5ZpQ56ihhUrX7cyetCt6S/kwx7PnV1THp94t
 2Jsr8cbyUB+klqNGs6ac9d/03VspcRJ0tMPQtFIdeGc0SUyyBVcknxW2px2aaSwuzkxGgnqhCoq
 gaibYNDdZtn1DfHDkwm0wJdCZPuM4g==
X-Proofpoint-ORIG-GUID: q8c4FF7VReO_IqyTrFxWnQ1XwT3jptqH
X-Proofpoint-GUID: q8c4FF7VReO_IqyTrFxWnQ1XwT3jptqH
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a82daa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=B0UfJI3MrboyiCAuw3UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013


On 8/20/2025 7:16 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:50PM +0800, Xiangxu Yin wrote:
>> Introduce DisplayPort PHY configuration routines for QCS615, including
>> aux channel setup, lane control, voltage swing tuning, clock
>> programming and calibration. These callbacks are registered via
>> qmp_phy_cfg to enable DP mode on USB/DP switchable Type-C PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h |   1 +
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c   | 251 +++++++++++++++++++++++++++++
>>  2 files changed, 252 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
>> index 0ebd405bcaf0cac8215550bfc9b226f30cc43a59..59885616405f878885d0837838a0bac1899fb69f 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
>> @@ -25,6 +25,7 @@
>>  #define QSERDES_DP_PHY_AUX_CFG7				0x03c
>>  #define QSERDES_DP_PHY_AUX_CFG8				0x040
>>  #define QSERDES_DP_PHY_AUX_CFG9				0x044
>> +#define QSERDES_DP_PHY_VCO_DIV				0x068
> This register changes between PHY versions, so you can not declare it here.
>
> Otherwise LGTM.


Ok.

This PHY appears to be QMP_DP_PHY_V2, but there's no dedicated header for it yet. 

I’ll create |phy-qcom-qmp-dp-phy-v2.h| next patch and define |VCO_DIV| and shared offsets with V3 will be redefined accordingly.


>
>>  
>>  /* QSERDES COM_BIAS_EN_CLKBUFLR_EN bits */
>>  # define QSERDES_V3_COM_BIAS_EN				0x0001

