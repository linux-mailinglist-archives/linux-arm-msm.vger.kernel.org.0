Return-Path: <linux-arm-msm+bounces-74416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FD6B905C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 13:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F6E13BFE5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 11:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE473054D1;
	Mon, 22 Sep 2025 11:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1nb9aYO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0209305057
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 11:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758540511; cv=none; b=T/2uSVPHe4+rO8AaubM8g7Lklslep9phsHWxdqAFSCyb0lCC2AkxhpY9qqWba7jk15oefIkde+FU4FseWaaWAf/iEqeVENki/NrELcHTsv6Vd92TWRkPMBG3TLTcqT5AQC1dGx0jgcNA44JzAFaSAe63tPn8EKmHMc8yOZUi4qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758540511; c=relaxed/simple;
	bh=igUJVoAn28btOF3Drs+Jwi38T6h4G1rqrTuYeaXV2n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdmTOcAicn09J6imJu0KpXT8XCiDyNcQq+yOE4gyaBS1l/O8Bs/QRWVZfgqYT1SFrwpuggmUGjFj8QLX7JdNGpzAqilY7IfR/37NwIlWUSbsT3+WN7Ca8nhv2TajFdBc/OkhBb4lwy6d1UgmZtC+3LiIOuj7n6bDpjHqXsPab+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1nb9aYO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M975Zh002772
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 11:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vhPS2DpVO5rMmjT/67K3Kgtn22q0loN6kh/+0Y18da0=; b=n1nb9aYOq3EyHaOj
	c4UBjNTgHUM9vgFrThXaqHS1hfPu1iMbOUHCh6iKl/L1F1Zcaea+R2gwTtejObuc
	SOY3KNd1R+57NuGeHMOfpZ9wsghm0SlG05acoIW55/VOhHnL/SLGyOa4VOTv2/ac
	7HBMVoFFCaO7kvHLd2mLRdLYF2AJbRlpUA5L9VYsKJD9Zk5dbm1ORIDPBah/zBZq
	Dx6AJ3pO1SPme64NP9ZSHL9314yOKJW5pBmmiZuthVX6xzJRcTIorD9Z6uGcvH/t
	zu9TTWsxcV33O4NULgx1A9R5fFDtfujo1aS6CsNhVnOYA5uo/Uyy9uMmRtM4pUxI
	fM7q5w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98ck61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 11:28:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-245fbdc2546so9161065ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 04:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758540507; x=1759145307;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vhPS2DpVO5rMmjT/67K3Kgtn22q0loN6kh/+0Y18da0=;
        b=tkyoGmYbJPwxH7FB8Dw1B/RVCeIqiDXDBOON7AUhNS9JBBgJpBqbRXWbli8veg409p
         SoIAXLlZX7/CXFIbNuTrBQ/uICQ1C6aXt5uvwQBFffXhjR0oirZZyvPQMT5Jo5O0KkYm
         9rt8xmxN+rPtGsOY8VxWwzHFuasYWVDhnMfOvAyS+jQywiMayCnED0hxR0QVXYWsAvFy
         yaEL09h/FMCXstaNY3x61MXX3RV+3M2vHmY1gP6m3Yq2ysMXT40QLaK9ucPhl9qSZlrp
         f5gnRyuYSUS83bu4GX1JYjfUL3s1DBdF0qmvo/hTDuTbNyAUbPIU0DEhj++wniwLzJyl
         y+0w==
X-Forwarded-Encrypted: i=1; AJvYcCUz3mza2O5kTSas2iDBopfC3WBFWN5yrQUruXWeLgOlU0qwAt2s5xLDrPCv2uGRzhmxKkT/dZbyzXYlsEHA@vger.kernel.org
X-Gm-Message-State: AOJu0YyLwnKQbYupPClE7KS6VhlFmyjGhtaUScqhElYjhdnMkwmfqF1B
	vRF2iygMrNDMuZwhEtJ/P1Z/RtCtpeeKkekOyndK9im8YXgRQtfi5b42Eo7w2X3YPGl05Ewi+oO
	koV1Rw9Mvpp9epco8y71xazQ68ES5+d5yufamyC4aK5h/REJXsVAPUPXolMLA9gdM7Ohj
X-Gm-Gg: ASbGnctgr9M0y3dp5H2vhaTu3sN71KOk8oCtrtUC2bb0aIBYtDh7DlGy7l/+hUt5ZIp
	+gzRcCm5B3gn+8iNxQwnmSu60xAQ6TfxE7l6DccFm88EWbvTRuofpXZYpbm1wPO3ZDdkLnPsrCE
	f8dz3jxNCGVo6L0Ih8xVfvU0na7CiuCmL8/czH38ze3JGUfV9abTsRoidgl94lyNzF6QbrorVB8
	JPYylRXZ/RAzuY268IYPLAPN8VdN+Rpmfx8ODpshrI9bKKlzLmHLkCpQYpGHrXaxZtlmKs3r37o
	ot/hsqklvYKoqVODyG6cG3uWO1dGZRK1LoPTJ2yoMfTccbNTTUXz0Xme1n6T8i2JC0qqPoN2gKo
	tQhXEbIs0hWwKEsiCQtwHw61fAoFDobHyEVI=
X-Received: by 2002:a17:902:e751:b0:27a:186f:53ec with SMTP id d9443c01a7336-27a186f5486mr11582345ad.9.1758540506935;
        Mon, 22 Sep 2025 04:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbTTlEoreUEOX6AkaJ7bnWs6eRBLiaiABm7kGf/pBZ+bhPDPXyhXj4EX3Eva+nVibdWRmp5A==
X-Received: by 2002:a17:902:e751:b0:27a:186f:53ec with SMTP id d9443c01a7336-27a186f5486mr11582105ad.9.1758540506290;
        Mon, 22 Sep 2025 04:28:26 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306061925esm13230568a91.2.2025.09.22.04.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 04:28:25 -0700 (PDT)
Message-ID: <28eef277-c778-4ffe-94c6-2e90d58633de@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:28:17 +0800
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
X-Proofpoint-GUID: AofF_Bu3oFVczh8tk1UaB0AavngFoWa0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX6F0yteHY5fob
 vtnFt70AY6D/if7g0CecxqaIxJVVWRKvKdir9T7vFb6sdsGDQ3KIvLc0bn3Z3XGDzE7PhAVvWM7
 M7138P9eWuLnYFba8omOxnwzZa+Z66jNL2Dy+CkiHSOE8ay2GHuqeK7EoUd1X9Lj0X5Sjs9EeJI
 /6TsGEIBt0TcsnKOBiI9GCl3quMsFwsakod7ZMjw9i4JjeJI643mGZfKEJepjKvnMxYbDGyZrOR
 DUJu9Tg1CXZxPC+gw42LqYwvi7O9wcbRWTMWZhEYnMSKXGpPNs1SREDfccIjuBpS+greln0DFRv
 0kDZNQhgp4ylzTvs4gC3HGofyViuGesYmNRyWCGr5GuwVRE5mIMkbt1WMcrsA0hIblPrcEBEixD
 ibxPpvI3
X-Proofpoint-ORIG-GUID: AofF_Bu3oFVczh8tk1UaB0AavngFoWa0
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d132dc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XVeZa78dugChcG7OFuEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018


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

