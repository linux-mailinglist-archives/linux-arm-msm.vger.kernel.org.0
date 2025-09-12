Return-Path: <linux-arm-msm+bounces-73328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4084BB54CEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 298273ACB67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A33C30DEA0;
	Fri, 12 Sep 2025 12:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlvPbLkw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0AA3064AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678622; cv=none; b=KOmn3dByNnI/vRy3OCrwQFA+QERcr6Tv1w5hBTWNeGJ23PTT7eTwTQQU6LvOK2HefUjQO068B92iihaPbC8JzQ9x0Oivy3Sfs5KNlgoVk5LvD9wYohiCjhELkbomi/eHhUZOnT1iNXuGrvTlAPedSNiZWkLB1IxoQqzrDrb8F8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678622; c=relaxed/simple;
	bh=zz8o30m9RMDywni5m0nG378AjKh7Tlr5V0xeoanNaAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T6xeLb+N8Vqbq46vXZDQUc+TdXUR5DlaCbNNFZM1gszjKiT2SFEQInU6n+AcVnFb/3dmeb4bqfZOKpfQ2x+8qA6zEO+0EyTfcKjEQ5c5NsbD5//rS8qakPn722J3/RrOb/d0z1SFba3Z72pEIj8PA1RRPKv+KWvoflUDfYeurxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlvPbLkw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fPrh017617
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OC306+JLRzCtQu+HZoUMCL3Oa/U1/T4cictyJ1c0fJU=; b=AlvPbLkwvvsKmqNm
	f6Y2S2TTjOVpZGfIGtO8m6/ajO2w8M79nskwbh+1y6U1BmaWpYPIhsEplNPCUy/m
	Y+qYCkgf/yRC0tNSp4uFEinRpX4c7Mna3R0cYelOJx16RnTOAUZV9++6zpfviV0H
	12NNz+qZqZJGrNUzKpdgttXqJIp1TOrxaPCINyMRcNZrLXLTogG2WYJNt1W1i93P
	iRQHAh25vUwksHjRX8E6DR42yQ+eROeGx9kNbYTua3AmD1S/pDcWJvSE7zxCaCSV
	ekNLDJ5cxAfNgmw4fCn9hGw9yVu60KbDODPCM/1VTOcTW5SkiKFs0qUoRDDzJRsJ
	+9D/5w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwskprg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:03:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244582e9d17so6510325ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 05:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678618; x=1758283418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OC306+JLRzCtQu+HZoUMCL3Oa/U1/T4cictyJ1c0fJU=;
        b=Mv+uQvx0teSw8ohqqAOuxACLRfsaM6l71cWXD2ARL4uFZpVtG72me3luJI1raBeMGV
         nI63+BF4ximbQkH4XzneY5rGk2cfi1NiOxATPU/NkGL/zGL7W53CtIryv1y+J5pRdyny
         ysa9FO5s/k5J5Fa7Z+b4dsl4ibhrgw9AX3dDh651lRnpTy9xwuitVt8Kh7PmMiPp7WUd
         7w0x2CylT+q7mnutB0p6FOqWnzW2u4NvMYfy/VMrKInuGDG7W/UtIO+047v1D5trNjgx
         GMS/FmMchUe7oS3Ob9i+tntyDtdOB5kZPCWU+gUfD6HJqgiOudjhgN4DELbEE9MwPQY/
         SZTw==
X-Forwarded-Encrypted: i=1; AJvYcCV8Jhl258m0QVZZeJNlb6KYUN2b6Dt7hYJ2keUDUNMFAIAwOJo+sg/xMREU0NeDZGSvnge4mm0Dij8IiLwZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxHKCw1Zwp7MWbHXOe0lu75NWAnOEEZl3aChV45UuoFVCKm/sn6
	pEeF78lagrY6bsDCqovRrKdEiXunu40qvgdNEhwR41D/VQuYzzgMRCtB9RT2OPgkhNTM8dAzH/L
	aNH5f6ydciXuMsdJSiczz22u3Sti27Te9IpX33bm2Jgr9EjhKURELr5KJVLFwO+qeFC/8
X-Gm-Gg: ASbGncuzGFrFd5SPn9fdRcHJzOpV0F9Pa3yrl4lIH+bhBpuDUFlXtcoBm+9i8JYuEYE
	5kYz1VIBsNdXTowrILBbhImFvmU++LHfOQzoTAyzh53fIHORa5SaLFRRV/ptgfVhueD+KA9p7Gh
	7DF8ARTol2VlDRxXON39k1i2zZSd51HWxOcxyPYKJS7/nYE3shMkVcNc6xVRxxH91DXfEJfxrsw
	kzg6JhyvHE7/cnjJ4oiDGbwV1I1dzOU61W4/+pKcx/H3Xz7+ItlhXC9tf5kb4Bs22WNVNGY1WeQ
	e2+VL2nZ2mc3zVemnbe+mYaIEj5zXniw3YrN8box4T7EfNXJVs5zJMQXeJNmyDBMBw44tSgFNU0
	tj1/ZBVKXd7yPezV3g1nO5Ju0LLS5jA==
X-Received: by 2002:a17:903:1245:b0:248:dd61:46e8 with SMTP id d9443c01a7336-25d25a7294bmr16547605ad.5.1757678617831;
        Fri, 12 Sep 2025 05:03:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0bcpdWZ5JtOcYfmEEQBTJNc9tzJlPspC8jR11YZhBs8DDVX3VE8+HBzzj6SRFPVGJrjwKeg==
X-Received: by 2002:a17:903:1245:b0:248:dd61:46e8 with SMTP id d9443c01a7336-25d25a7294bmr16547335ad.5.1757678617295;
        Fri, 12 Sep 2025 05:03:37 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84957bsm47241905ad.80.2025.09.12.05.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 05:03:36 -0700 (PDT)
Message-ID: <70e9d5a3-53b7-4e2a-9a2f-19e3be1e197d@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 20:03:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] drm/msm/dp: move link-specific parsing from
 dp_panel to dp_link
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
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
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-12-2702bdda14ed@oss.qualcomm.com>
 <4kajb4imv4mvpf4bdzoqfw7f4qoqxsu3ca4pbgsunhxnortfig@kmsqgsj547hi>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <4kajb4imv4mvpf4bdzoqfw7f4qoqxsu3ca4pbgsunhxnortfig@kmsqgsj547hi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Qe6zQo_EE-_2ykOg8ll7OrxZefPNxnja
X-Proofpoint-GUID: Qe6zQo_EE-_2ykOg8ll7OrxZefPNxnja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX1oQqHDP3sII5
 WKvtwIvPEgyjjZPOaRcIrDSnwaBlsMGbiWPJXjXbNJMqQnrMumO/t98+gnsvJ+ql3gcyBZLiqKn
 bdW2SP2StZHM5WrwBiLMyZkfpgKwiq/x3TorTLfWPU3dE1t1L+ihG+amRhPQV8RIG2IX0FdZ3zJ
 nvX2ql4sNxXfKUOT8E487aI8//44j1UcuAnQgZcbmmlAkfx4z8KH5vvfoESNXanTdcIalIMkdMp
 KSs5aE8w3aglV+6jdPuAWXMlzelExrq8KRH3AF645lDJZzesHirYGYbIxQael1nqaSM5V9jjbPt
 t3j4l30nG5nm1nk5ZVSScw1Az2UXljI9LTp0pHO46gC4gGRj8rpii8zgHFiJat3DJjuNBpL0bUM
 1/UZBIfR
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c40c1a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3J_imRUleR0CZ10obY8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018


On 9/12/2025 6:39 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:09PM +0800, Xiangxu Yin wrote:
>> Since max_dp_lanes and max_dp_link_rate are link-specific parameters, move
>> their parsing from dp_panel to dp_link for better separation of concerns.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> I thought that you've split all DP patches...
>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_link.c  | 63 +++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_link.h  |  4 ++
>>  drivers/gpu/drm/msm/dp/dp_panel.c | 78 +++++----------------------------------
>>  drivers/gpu/drm/msm/dp/dp_panel.h |  3 --
>>  4 files changed, 76 insertions(+), 72 deletions(-)
>>
>> @@ -1225,9 +1283,14 @@ struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux)
>>  		return ERR_PTR(-ENOMEM);
>>  
>>  	link->aux   = aux;
>> +	link->dev   = dev;
> It is only used during parsing of DT data. There is no need to store it
> inside the struct.
>
> With that fixed:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>

Ack.


>>  
>>  	mutex_init(&link->psm_mutex);
>>  	msm_dp_link = &link->msm_dp_link;
>>  
>> +	ret = msm_dp_link_parse_dt(msm_dp_link);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>>  	return msm_dp_link;
>>  }

