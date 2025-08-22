Return-Path: <linux-arm-msm+bounces-70252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 098DAB30F84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 08:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A962A18884E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 06:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC742E371A;
	Fri, 22 Aug 2025 06:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpypsNBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4984923B607
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 06:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755845365; cv=none; b=gbKOy5wQdQUjNwVmd7nR4lW3LXrBN1Rt00uGBJkDWHxPtDNP/ch+b7kEpA4eNh4EZUbvZHzheMZsg3Inh0Gg+lSws/bdlUW6z3N81N4iK1s8eRPCL79kD1GmnF7b2gzsqvJXfGWgRQwomH7q6qj9098GoHTHSa6ZMlV7eoUuj+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755845365; c=relaxed/simple;
	bh=d51gPt9fVVIQrlb71UzF3auHKTHOiR8lyyNLgba0IKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F79DctCvD5Do7Ke8rCghJLqYXRvJf1ocbDjs141R3d6tbTAa5D1zeapNUuJIU4TTTzL/11mIf+gThGhcrTNDY/Rp79TWSIOBfLkRL5PPDoN7WNWFDV/uNMH5wnazPXHbHzWbkdmYTktomMeEeSLSRHZJ1h24+ZfLNndiZbWllng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpypsNBc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6Gc8H002961
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 06:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PAelQyATkPA6YSXiRQaF3kDsfrHXJ4J/shH4gx5CIb8=; b=XpypsNBcuyAp/E9l
	cMSqL9doPX/KQeFqCC5fdM4wqiI1J54UThwJttpQCwPqaSWuP3Exn3DdAtl6z7nH
	dxunfAwgv4QMLgEo2clVv8ZtS7Hl5FjHMy2ujAsTDUJYY0jt6qtfMKI1xgZMo7fr
	K3O//G/YQBO0uqeuP83fdJl+g5dwuMzWisOt+OYY8y37rekTc1VPy0j5gp0cuBBE
	G1Hse0gaaU4//wDwBnX7+uL17KX0/EKFzABR9OY79PS+8tKi+f++eLP3WmpwMSEv
	1Gcl+sbQ4IP9+x+gdEHHa8m3Fc31y/QIxHm42aNykv4nJRwADxGei5WViPKfh+J2
	5Aso1g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdny7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 06:49:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4756169c46so461032a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 23:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755845363; x=1756450163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PAelQyATkPA6YSXiRQaF3kDsfrHXJ4J/shH4gx5CIb8=;
        b=T3UIVQse/uw/2bKtdr+tYnxpLIucVSCRaT0Ul/Usx0JZYYf3+PGluu016BczLIKAvm
         +KqiE7DaYV4PVIpmtoUG7nMKuBRKQCrNQR4+jFfFAD9vY8rLQbRtytWUHUgtAnsRi7/Z
         ku011JlLBppEP9pxcdIU7tg/DXkNEXe1qlfHzxmZOAiD+0jWfxsyW4BuILzYEveEEbMf
         lLD/rmdavhm0BjCaRZlNzyELUC38/JMwb4FM1kwnun6GZd3MTjxg1ReqCelrKn2kzqYz
         OYFyad0sUG8PMqzlFM+JI/Vqdkfflfgl1oSbpYUaphDnoOVD/UzWFWJevkHV0jGC2gGM
         HHxg==
X-Forwarded-Encrypted: i=1; AJvYcCV2sBNU9BXrzB+BpItNrtZ6bgl348wsVoPtQLaFptOXCLY3tx8/LksXJT/q/JCnDRJ2+AB4ZsEVFcUvYfBa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kZXkG+n0D+RtQ9dfPZe/ObNBWHes0HKqZAfjQ4XT4AAMgIOT
	5gMXZMDyV5eeNlupPwRa8hyXIa6u5aAVsLdlIE9FbVh8oBWDnutK0HcynKCc6DqwfdYb1BMYRyk
	5n+TRlyI2qJQ9VCJkyVJeir/F2WPoddsAV7pPtxfuRD1Nfq1aqXbidIGIZjKAGNhkaU3D
X-Gm-Gg: ASbGncuQBVzxiMXvmrg6osmDF/7FkXyWAuVpiAodhfsK9cLlMrqk0Giy6xCqvPqmp99
	l0eailJlurTZC6cIJc30XIkSQUJa253L45WfHUDko646odywQOHpSlB+gBNvFELun5dRUO9zQN1
	zE0gZS90W+g2+53369lbt/NjT5x5Eqeok9R6MIQvjnKY8xh3xw96Dc9/yaWuykJEKrJ8X9Rn3l8
	ypEDIXKbvBCZbSm1jvareejdLXB03EC4wq8TRtAkPtc5nyec2MnPzBIPpPfnOf7SDGfGZp4SmQw
	hg6Kd5tvbvn9cI8DFBaSojSa8+LIhP/4R8pMyd2+ow9YC1IrOJ3a9+RY0syrakRcKRJkhFlcMu6
	lhG4J684Hk9rZ0fVhhkI7eDrgIlqzdw==
X-Received: by 2002:a05:6a00:4b16:b0:748:f854:b76b with SMTP id d2e1a72fcca58-7702fc0b4b9mr1451099b3a.3.1755845362728;
        Thu, 21 Aug 2025 23:49:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGw2XinJYhFdfeOr2DKaBI1LxvJNvXAx1nbOyA+a6mHNvNi1D2KrOEAJ42/+JTdElCmxHO/Qw==
X-Received: by 2002:a05:6a00:4b16:b0:748:f854:b76b with SMTP id d2e1a72fcca58-7702fc0b4b9mr1451069b3a.3.1755845362261;
        Thu, 21 Aug 2025 23:49:22 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdd6sm10099827b3a.29.2025.08.21.23.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 23:49:21 -0700 (PDT)
Message-ID: <d21c4c74-a36b-4f01-9c22-44bcec3c20eb@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 14:49:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] phy: qcom: qmp-usbc: Add USBC PHY type enum
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
 <20250820-add-displayport-support-for-qcs615-platform-v3-4-a43bd25ec39c@oss.qualcomm.com>
 <cueyo7huj2m2yt46sjk3atfktft6y5slhhtslwmi44r7h7lxbn@5zvwxtdmk34t>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <cueyo7huj2m2yt46sjk3atfktft6y5slhhtslwmi44r7h7lxbn@5zvwxtdmk34t>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a812f3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=LJgbN-Jd--P93uwsTkIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 2B3PasB2j1M3pshHQ34TchPJi2lhJomY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX2brl0JEjjM2O
 ev5yWipkzLasFmOLNE/8JRLIADk5cc9b3qt90E/Ueh+sceHcjP3A6AIRtjpv2o3PxJPzAf5X0rm
 QgBElBBBY/XHGEKy7moWOx0pMCooPDfs4XVyut6Voadp+/EzvLKldrZ8hY5br6rewaCOOaDiwqm
 wgbdyJB+eY8aDIPLsZbXNn960jaKkl+e8Z2HUyO73k1son4Nmv7mmpWgUa+OhdjnHLKPaCg3y85
 4IU/zhr472Z2jkl+3iw9D//yjfXgOo/fSQP+MARWhypKP2XlAt4+ljyZ4n8/mlReHO6PYaVTDe9
 fNwsCF6cmz6lmm9Pd6PNzjpmm0E8ct2YhKDo9iOwgtUsvmTCw9LHJ/iJCA082x8a2AUHJ9d1tg0
 f47CD4CiiqwOiIHebEwXjDL6ljr5ZQ==
X-Proofpoint-ORIG-GUID: 2B3PasB2j1M3pshHQ34TchPJi2lhJomY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135


On 8/20/2025 7:34 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:46PM +0800, Xiangxu Yin wrote:
>> Introduce qmp_phy_usbc_type enum and a 'type' field in qmp_phy_cfg to
>> differentiate between USB-only PHYs and USB/DP switchable PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index e484caec2be20121cfe287c507b17af28fb9f211..5afe090b546977a11265bbffa7c355feb8c72dfa 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -284,6 +284,11 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
>>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
>>  };
>>  
>> +enum qmp_phy_usbc_type {
>> +	QMP_PHY_USBC_USB3_ONLY,
>> +	QMP_PHY_USBC_USB3_DP,
> Drop, you can use presense of DP offsets in order to differentiate
> between USB3 and USB3+DP.


Ok, will drop.


>> +};
>> +
>>  struct qmp_usbc_offsets {
>>  	u16 serdes;
>>  	u16 pcs;

