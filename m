Return-Path: <linux-arm-msm+bounces-73325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1791CB54CD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 042A5AA6DB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B45305970;
	Fri, 12 Sep 2025 12:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lt+f6//T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4530E305977
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678460; cv=none; b=oyxTIOi8a8Jk+t9hUKHdiyt/cpLnwQKBlaikOH9LQD8wAY96WYRCCNmaKBE3lG6CV4RsvA7q8DG5H5Y38RZJ2FVk7HPidF1JQDOqbtMnd/TxoywHwnZUGI3qH3KPSQcc1V7bMkoztolAq7VxgilXW8qXslWArcu0DSkFFcYCoDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678460; c=relaxed/simple;
	bh=26UCG6mcsHCJYK7t/iVJ83hqO7D3+2hpEfCS2ouqMi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfioCSTYV1NvO1koxY1QMFvOR5gdBgYt5vDkbyncmbXSMjcfA2B2LKiOcw6pflbZuYiFMkLAlS1Z242MgBJxHhJMqeuvxUYn1BfIz5x81uBjlrqn9pwhIYD9Tg4ugd0iYSoqWhzLXBsR9ieJBgFRToPi3jyDQ6Plc+VwEl55k1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lt+f6//T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fLBx009110
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8MdWDU2Uyypxys9C+gGfTrGxJ8Ztl4i13k8tb6lf2HY=; b=Lt+f6//TKAvf+thd
	4RoLaVi38xbabaR0TvVfcaC0kLc9G720+QBnDakbquJ3gwVDgPtZL2dK6bLQYssW
	kBX3Yh0xE1GeFrkJeiaYwLN/bgMSJg1WzzGP++TI98hXn7/omCxCxIK3wyluLgNk
	qtOXTqvCYOd2B69u6zogxXTGldX4SiTHSRQkgCJU0m4Vg3GZGSqL4iQl9sZUF1bc
	Jwc/LmwvppGZkvZbcE1cPrs/k6aSaDTHzzNIGuOVAliYQloikBFzK2bsOtpYWRcb
	ZTNXwzwtevqsW/AqNlTH+c1rIbGW9eaGpvTp+/15L5QeuwxdKuxfO6BxfZ7t4DOr
	U1kC8g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj13gwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:00:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5205f75e9dso320525a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 05:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678457; x=1758283257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8MdWDU2Uyypxys9C+gGfTrGxJ8Ztl4i13k8tb6lf2HY=;
        b=RuLLYgLBILYnmN26ASKk5ka3q2AYetCh3NSExj/i+mhG1fHx5ttnQ0DvqC4Of4OL74
         y0A9zqDe4xcdyxs/RrlM5X1YnxQHWFiV28YCvl33hENKsTmwds2+75snsr8kT4HRT+q0
         OJNGjcdWgFEZcsnVdyi+byXe2wbm6tFF3x4yGe/RhqETHn2NLkUjny2gij1m7kUTRI8T
         OSdeYvlVGR1/isD7eS2yogkTqfVf2/AsHtGP/xciFeLcBNk3aRDcYK5NdxhwodAmzYGD
         wGEx6zM5xC/hmtDsyS+DaW2DDUIgXAMIKlP4Woz9Ph6ucSsS9Jm7wbCB/oNFiocEBz0x
         /x9g==
X-Forwarded-Encrypted: i=1; AJvYcCVVFTI+/eeP4ibOFF/r7UlKG8h5g66YMDq9WWtHORzbnAxqK2ltL5p+nrQthB/ftlrT6xCwl6fdMC0gQVB1@vger.kernel.org
X-Gm-Message-State: AOJu0YypVmKjWquxL361+WBe1/TDHRBYphHNiH32M2emiU2z5XbBCKYh
	vQOqfipuGzjs0k89VGCyfOL7XjXSVa8qqpWd/ShDaEkpvtN5fnILkZVInZmd5zU1S+h7ShBUA37
	5xuTjZjmV/kBmIjGP0O1c0yvh18vksomTkoIm4DcTap24RX0MEYofw6hkh/fTOr3IOhSc
X-Gm-Gg: ASbGncsy71TAvpQ+oJnt2yPzFahs42AwxMpLMA3DfVXVYJcuCwpVuXEUTAXx11I+Yv0
	/hrgQe+68KRefB0wR1lItQtyiQ3LMvjPuap/HFoAmrFbcrP/ARFuYad8Aoln7XHlMLqIF0WaDZH
	1joLhl9xjF4o0IFrMZD4fBTAUvVsbqMJ05T6Mm8WdqwfH+Ak9wE+F7Z5iLB1FnIxcTt02ubdQSa
	N5zpQZX0gFg59rxfBVQdfK6Ah+crA7qXlM36uttv5kB/pAqKrmvXIQEec0KOI1fNaphPnTVobrQ
	K/JOrR4esAiXU+9SMmKtLLBhgb2R3RqLQjGJBs7B/lbP3Ow6hPm2vMK13VFdpPrnEkGI81qso5d
	4igXISsWH/ouW6qpH8uCArCNLLtupKQ==
X-Received: by 2002:a05:6a00:39a9:b0:772:29be:e006 with SMTP id d2e1a72fcca58-77611fc4e71mr1825317b3a.0.1757678456682;
        Fri, 12 Sep 2025 05:00:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyWZ/RCwH5uoedcQ8POSwjS4P2D41yWOMHKovMkWcY5GLr2xHum8zhLBWbP5bd/3+H2e7PZw==
X-Received: by 2002:a05:6a00:39a9:b0:772:29be:e006 with SMTP id d2e1a72fcca58-77611fc4e71mr1825274b3a.0.1757678455923;
        Fri, 12 Sep 2025 05:00:55 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a48c19sm5291497b3a.36.2025.09.12.05.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 05:00:55 -0700 (PDT)
Message-ID: <11fd5d7a-e084-4ee5-9f34-2ec0481a1d46@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 20:00:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] phy: qcom: qmp-usbc: Add TCSR parsing and PHY
 mode setting
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
 <20250911-add-displayport-support-for-qcs615-platform-v4-9-2702bdda14ed@oss.qualcomm.com>
 <x6p3hgatsauguzxryubkh54mue5adldkem2dh74ugf6jf3ige3@cb3mmigu6sjy>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <x6p3hgatsauguzxryubkh54mue5adldkem2dh74ugf6jf3ige3@cb3mmigu6sjy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DEvJmicocjbElM5-wdq7488v0b0cUZYo
X-Proofpoint-GUID: DEvJmicocjbElM5-wdq7488v0b0cUZYo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX8kQMxoPmL15E
 iJeMueJVlDeYl1lizyXZh63SaG6o6aprQlMHIE0CNdY6qZR3TvUYXfLk+2XRrL1PwkMEJLRLzHc
 Dki7kO9LtDscUPx0o/CIxiwzAKmGzlLRQqlO+EnKwPfGo5eTjYrgafV2T6EPviQbg6CvGeUMD0g
 FKxX6XaPH2pRL00TwEiAIhh1RkHhBmZsNCheSiFVSui4TXIgBnzsdQMulbI11Yu8Dbc73D4aXu7
 sLE4oqrm9Sh9XfpCdAwWd5zpvbp+Np4mqhKCzZAc/8Stcjmnd96sUgSAW34tJJzRgsNSKRlqmtn
 IQgh4lFhjOD2GvhGJdVClAeZ68CYe4ya5zNOULdNfmp699nuq1890N2qibF9nWvMhHw4Mpw5frF
 MotGiuM1
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c40b7a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1bTgUAhQIaiSlqBNWd0A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024


On 9/12/2025 6:20 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:06PM +0800, Xiangxu Yin wrote:
>> Parse TCSR registers to support DP mode signaling via dp_phy_mode_reg.
>> Move USB PHY-only register configuration from com_init to
>> qmp_usbc_usb_power_on.
> Two sets of changes. Two commits.


Ok, will split.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 47 ++++++++++++++++++++------------
>>  1 file changed, 29 insertions(+), 18 deletions(-)
>>

