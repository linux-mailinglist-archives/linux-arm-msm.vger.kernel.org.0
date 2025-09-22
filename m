Return-Path: <linux-arm-msm+bounces-74415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B75B90577
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 13:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4574E1892ADD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 11:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C716304BB7;
	Mon, 22 Sep 2025 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgGg0dC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E4C25DB12
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 11:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758540298; cv=none; b=cpwIZjQnw2dw5M+N/FAjrMr4MxOoMUV4g0U5S7/6gLrFlapUR39VP6RjO5VdVkgRbH9g6rvXa8d0cA1wWsYz+OUfV/rHVJH0e7ZQgHZQ+fXod5QtPjw7Z6EsFGBtd5cNZrV+dmOxhZkpRNU16kfs+sll0NuBJXclPTA2/Ow9fjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758540298; c=relaxed/simple;
	bh=igUJVoAn28btOF3Drs+Jwi38T6h4G1rqrTuYeaXV2n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W10OG357JBhPwUoCr2BIa8SMPtPDM2iHQRJdfQ8bdZEuXYmDCzwBz3N4hvZhT/2hKF62yagcLXfAFRuphir6O8sYKEzL8KED5knN1Jbkoy2BjVZ9q46GCzFMDckqUoYqq79hy+uuPPeeWeSyBaaw18fZlr0mUAO/ud3SwitzjQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgGg0dC6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7TQgv009739
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 11:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vhPS2DpVO5rMmjT/67K3Kgtn22q0loN6kh/+0Y18da0=; b=QgGg0dC6cMzJyY5V
	U4MIXE3SNPYSAo/GeX3s0AWO2iV/lZaMuwLV0Wp+fKBapBNp4ektQDDYmqerkttY
	if8+54j9ruF+bdo6p1HGdUhq+2gUwpJx0/pf2/F2OIQso1V9BQf7rKJUjjZK8TBM
	0VX71Cj4f2xbJSX9E1+Mli5BelOeuNLKtODYfkpmcoFGxuqHxnFkylKLSljR3CBN
	dz42Io3C3ivdvjik6hVWpJIKVCKDzbz8K5HX6Ek3d+0jZByGjxTvk/o3/oin5EtJ
	47qDlqVQ+pXDxj+FxFRrXJ29B3NrIF5dSBDPyxPem+71jcwg3T9suQ1knjYycfCA
	eSa8zA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyemtaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 11:24:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2698ede62c2so13782105ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 04:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758540295; x=1759145095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vhPS2DpVO5rMmjT/67K3Kgtn22q0loN6kh/+0Y18da0=;
        b=aoamsML3hmCi5b5k64JeXtFGhchbifKigJNbN0fXWgvylR7oj6EQCVXydPqLwyuDdH
         mzrMgJOv4vbKxWdqCqLc/cjP1HJWn4vh/btD1bwgQxC2fBHYBpSGjQcyDontMBiMVrS1
         DdheW9eRVNumTCGja7OJ0CVStxyAFyQxBSvSPhD1/iDQu57yHWe8FqKHw8HfAfzX2UyS
         BdsVwowsDNdCErr8dUSPCj9iKvdyzeSnb+dC9xXR1J2aYlpeQ4fT7sABIr2KInMlil2n
         7yVT1B063qImA1GavUfUI1Tx1Md2jBWXPBPFbfQUKjjoHrXwGZ/c0ZOoMlT1wyNlndMb
         169Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5i0g/YIN/0dgho9nh1dU42tlyDzVCv4m1qFcEiN4fxDDuk2YpmvMY0Ty2KJiVlJuKP8N+nwWY9uScua/H@vger.kernel.org
X-Gm-Message-State: AOJu0YzYA/w8xCTo5BlLmFDUNwq8s4viyVUDW8XLGBqi11OplEieRBYQ
	EdoSqXTIDJZ6ConGIqr19rw/1qaUhp+8yCNstb6RAoQvsN5w2OtvgqW2M6Ougt7pztX1BJxc+CE
	N/lMgfPg1yhdxLuTwXOGvnvgLVYJYLPwlO3LyGYzTg/g20umtM+JGwSDLryuAyxSrBqwC
X-Gm-Gg: ASbGnctMSKXeiugeoEBqkFYZr2VQ2eLoFiBtWCWosY81swUQAml3GqGsT9OqZMnC/Im
	3dumsTGQLk39G+s/e8aaw4krTu7+x+FF+IhOElfVqgWF4kg9wggH3rr0QSHw3y7ugcOeoEzqsqB
	hYyrAzcU6FdupTjIJQe65tPYvG4PrxiDEzQfx5KEtzuXwH+/XkDSm9dWdvtvWWWmgiJYm9KW9XD
	gcgdK2Yf54isZlvd0RfUD1HPV3yi5M6ebR/5FizpLJnpDJDKAzxz47fzEBjXiVOgtX4JAyw8FAE
	nUh6oDk8j9peyFPWwX3SQFRpqpywKfVRv/LDcIovEcNNXD572d1J4m/P5U6hG8+RaA==
X-Received: by 2002:a17:902:d4c5:b0:267:c4fa:e269 with SMTP id d9443c01a7336-269ba40a079mr100698085ad.1.1758540294880;
        Mon, 22 Sep 2025 04:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+c5b351K4AXCSVsRHuVDsbJ0ksLZK6y2QQ3N9fyfPYi1xv4nAje1JQyBpRpK9QX3Bk658FQ==
X-Received: by 2002:a17:902:d4c5:b0:267:c4fa:e269 with SMTP id d9443c01a7336-269ba40a079mr100697835ad.1.1758540294349;
        Mon, 22 Sep 2025 04:24:54 -0700 (PDT)
Received: from [10.64.16.135] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269803416a2sm127178725ad.134.2025.09.22.04.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 04:24:53 -0700 (PDT)
Message-ID: <f4a5ffad-ca5e-4a54-a39b-4ed69ab3a729@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:24:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
 <bfpgktxgo2hb6dpzy3i7jdr6w4de5boorx4n6qeapct2vre4sn@4z2mnppridn5>
 <14cdf3a4-714c-4136-8c1d-99392e7911f5@oss.qualcomm.com>
 <2ewxoe76rrii4w3n5b6wl32vmatcp2boj75o65cuq5nx4f2a55@7cn6m7oxzu6c>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <2ewxoe76rrii4w3n5b6wl32vmatcp2boj75o65cuq5nx4f2a55@7cn6m7oxzu6c>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8hJXCkFIl_-7ea5ZWe0ZcHQn-QXQhDJT
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d13207 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XVeZa78dugChcG7OFuEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX3VycezWmBjJn
 IHrjt/qI+JQRtaML3KLcnO6AuxKXfPmgPp1DnPO8Q84dzD7meLEjGDxwCZCDdxJDlsh0LkLsFbt
 wTmtLkHJt1Lt2SLjoPstTLJ/1qq8IU9CjaaABSQuWb515rTPkS8GdwnLYYfCg6+xEXB+2Vtg732
 JcD07ce0UMGoBYXMYjtzxvU8fyT6hTPnM8tNCLsheO1/q1upQ1tJXxuTSSOCYW2qjSQKoOoFmub
 rj7EzjakH+ouWurgEzYaWiVT235wDoRMjvdey+ZI+pXlZkshn8VWDUc6d3BLOMvUyyWJTiezw10
 /NoBihJC3xf94HpZhVVKHPO1imIetulBNduV/1iQFZr9uFReCnQFkpl9Paju9YRx8sv8+ZY/AMb
 lj2W5Bkl
X-Proofpoint-ORIG-GUID: 8hJXCkFIl_-7ea5ZWe0ZcHQn-QXQhDJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004


On 9/22/2025 5:45 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 02:58:17PM +0800, Xiangxu Yin wrote:
>> On 9/20/2025 2:41 AM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
>>>> Add QCS615-specific configuration for USB/DP PHY, including DP init
>>>> routines, voltage swing tables, and platform data. Add compatible
>>>> "qcs615-qmp-usb3-dp-phy".
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
>>>>  1 file changed, 395 insertions(+)
>>>>
>>>> +
>>>> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
>>>> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
>>>> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
>>>> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
>>>> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
>>>> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
>>> Are you sure that these don't need to be adjusted based on
>>> qmp->orientation or selected lanes count?
>>>
>>> In fact... I don't see orientation handling for DP at all. Don't we need
>>> it?
>>
>> Thanks for the review.
>>
>> I agree with your reasoning and compared talos 14nm HPG with hana/kona
>> 7nm PHY HPG; the 7nm COMBO PHY series has orientation/lane-count dependent
>> configs, but the 14nm PHY series does not. On QCS615 (talos), the TX_*
>> registers you pointed to are programmed with constant values regardless
>> of orientation or lane count. This has been confirmed from both the HPG
>> and the downstream reference driver.
> Thanks for the confirmation.
>
>> For orientation, from reference the only difference is DP_PHY_MODE, which
>> is set by qmp_usbc_configure_dp_mode(). The DP PHY does have an
>> SW_PORTSELECT-related register, but due to talos lane mapping from the
>> DP controller to the PHY not being the standard <0 1 2 3> sequence, it
>> cannot reliably handle orientation flip. Also, QCS615 is a fixed-
>> orientation platform (not DP-over-TypeC), so there is no validated hardware
>> path for orientation flip on this platform.
> Wait... I thought that the the non-standard lane order is handled by the
> DP driver, then we should be able to handle the orientation inside PHY
> driver as usual.


Yes, I have confirmed this with our verification team.

For the non-standard lane order, handling flip requires swapping mapped 
lane 0 ↔ lane 3 and lane 1 ↔ lane 2 in the logical2physical mapping.
This is a hardware limitation, and with the current PHY driver we cannot
propagate orientation status to dp_ctrl for processing.


> Anyway, please add a FIXME comment into the source file and a note to
> the commit message that SW_PORTSELECT should be handled, but it's not a
> part of this patch for the stated reasons.


OK, I will add a |FIXME| comment in |qmp_usbc_dp_power_on| and update the
related commit message.


>>
>>>> +
>>>> +	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>>>> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>>>> +
>>>> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
>>>> +			       status,
>>>> +			       ((status & BIT(1)) > 0),
>>>> +			       500,
>>>> +			       10000)){
>>>> +		dev_err(qmp->dev, "PHY_READY not ready\n");
>>>> +		return -ETIMEDOUT;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +

