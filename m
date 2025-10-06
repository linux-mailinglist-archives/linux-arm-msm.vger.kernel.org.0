Return-Path: <linux-arm-msm+bounces-76031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 544E6BBD9E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 116B44E0660
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F1E21FF4C;
	Mon,  6 Oct 2025 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfI5ule6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC16220694
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759745309; cv=none; b=W0Wu13NmenXhCx/QLCkh0hEAcAb2kGLiOOpx96dGkcjqx0B08XvmSXVvFQrV8q/k85wbKXbh3FOYKMXpnkRbtkMJYZflnzRlt8f43k0fsiCos/ZL2IA17WFSJWYNWW/epQhFfZwc5VQTCDJH55WNUjWbUTb/6yC2WPpm6aYD6hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759745309; c=relaxed/simple;
	bh=rrCYAYkIIKFxZzj6px2XfJmTeYXc7E9PYfMHKcIzPW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKlb7D26l0bx2yFfpL5ZLukcDgY08a5futxeq2mr5+HxYQl/2sXPz8X2CKRNFjhiJUYSxB6TyMWThw1F+B63mVYjWn8q6/DYVg5f+Ux9kj4iYmG8aZIB/0rnY5mYAveAiWJM04o6TcdZBuTIZ/qL1rd5TDwhWoFrDhBDlccG654=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfI5ule6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960ei3K021746
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QRxl7sNo+3DrrqfT4zz8oVLcU0vJGKPO1RsVS+CbIJY=; b=YfI5ule6kP9JUqOq
	0V/aCsHHGfHDFgLPWiT1BFjvA+8l+1xEg/ctS3i2cfNI02OmWr79FINs0Gno9zKj
	4cd5/aUDM667tNjkUpsYHgR27f+SWOWeV1Kge3Go5an92KPh9RfDNJ0/4OPYwaZU
	Kf98yaYEvGnA57SZTC6DeneYK6E2NMoAr3vFri0t3EIg7qGrDBnKnmIleLdJ1t0a
	e8i5wDGJhkCrZ940YaV9yVQxVTXudAiibMi5HKgr0wcsBoOjTN01eCSycVdO3TMn
	Eao/YWyzXKwN8h3F8ktg8U6Ro7lWSttMiuxcZuBLFumk8THQ8JjCaID/s85kvio2
	T8EumQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6ufps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:08:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-85696c12803so205760085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759745306; x=1760350106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRxl7sNo+3DrrqfT4zz8oVLcU0vJGKPO1RsVS+CbIJY=;
        b=k3W2QorSC8tsfn3V9T9TPyyTmaL8c1t0LGtOarZOBaYAQ2Bkhi9YFSXVoDmzzrHW7D
         Uq6Tt8+vuct5QSr318fMRwJwInp/PO8RLaLtDtXROwFOBMEuyc/gwQP+z5SV2NLzCUaX
         iK3Ze2bfDuARi9pBvrUXiojbS3IErZXUltf/eZ6xxNHWutO2VOe5aLuYY25s0rALpxjT
         CBAcKC46PM1gQWPkMV5QdLcfcKh6LbR12wBGt0o3eRq1/b4TlfFjceDPu0jAUEPQqlQf
         JIpANLqlv4A0NrJefc324VU3iTSh992YtWP8/oVcfMRqQzVEDrGCkQ/uNwRSfc03yoTz
         Z89A==
X-Forwarded-Encrypted: i=1; AJvYcCXl62J3jgaCuMN25f8iSaVbTgv+kfO8DovlTWOTZT/RqfjArGXR2OVb1WIxofZqFFV5o2zq2LAq7FU5UQiJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzC+dm4PDpJxhRm9wVPvf6P/+VP0IFMzUVJbF7JrtfgU6MqqEHH
	YldkgBugaATkbqQHgPwIFMtddgXqfHN0eyyJw4bppdZNIQwHseJ7K+o6UqnYVLmyeSQ+5brE7Gw
	V52a0upJNZrIlnhpJ33Xa6xEDGgrYT2eu8+MCSd+GOAICtbcblSefYBdIgSgK+MstxZYk
X-Gm-Gg: ASbGncvlppMryfe89zlNSqEX8id00C94LLFvsu6t87iTsdjFKFkWMiN+SlIz2t4i09j
	IfUa0bQ30T4uQY3WuGRdQL6xg3cXo5zOpp4IkB0IHB3lRKwHphzJd7LhzBOqYLDqMpPeWkieU0j
	XjmhNdQ81NBirMgOJL5ZIm7K1XqvXRc8uYXyDz8u4dkhwqpVgt/ESuTsEuHzTvrECe3iApwTYmH
	0o+DlkUllkzzG+6vZejMe7iVoraVYYuRgTDELkLySaNAzXsOVx15yZGcsavc5FH8AgEVwFuvIWL
	nLAckNlMjanfUUzDXnDTj2EdS2Ks5G5U63QAdwiiswsUoJ09Z2B7F6oKmgjdEuoV/sx7dulC1lD
	lG5nQRadjjDGIPv1QdjTR77ECN9o=
X-Received: by 2002:a05:620a:4546:b0:85a:dcb:a0fc with SMTP id af79cd13be357-87a3808f27bmr1139716585a.13.1759745305983;
        Mon, 06 Oct 2025 03:08:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFimCYf0SKFbzC3NSXsI5tRolyrinxggfXfZDYyrYmKlPpBtRE4B1n+BKu5V1NHf8AkVOgEQ==
X-Received: by 2002:a05:620a:4546:b0:85a:dcb:a0fc with SMTP id af79cd13be357-87a3808f27bmr1139712585a.13.1759745305366;
        Mon, 06 Oct 2025 03:08:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b5acsm1107908066b.60.2025.10.06.03.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 03:08:24 -0700 (PDT)
Message-ID: <74446713-15a1-4706-b3c7-801724467575@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 12:08:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
 <20250930-topic-x1e80100-hdmi-v4-2-86a14e8a34ac@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-topic-x1e80100-hdmi-v4-2-86a14e8a34ac@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e3951a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=eg4Xx4S7Erm8exKiWv8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: krTRSm--39RHKEJ12wSJYqE8QhLHMG61
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX7gyFDbfRNtGg
 f/sYejyO2JRGOEBTKR1dLLfDct+oPCOYCFHyH1SgZvZW1liOoYLqhdS/u+TWL5LTfiP58bC55n9
 SMiTgFLkh+xVJRg1CGL5bTBOa3aUuAyuuEQUO7cWxcA3HrtsjSM0/5D4MlwkuI92EYTrRbzpwHE
 hLyqfBGaenAvw7/agjn7kJxBeLmgUMS2rs1pQdh7u1nxjha2EY2tCCLW9/DkgbEAqtJkPTdWb+P
 rt8Y0rNyyI2C2a5ShUuQhkKpoGPeGbtb5L8wRAnTsmLOqLrNMY2QUFeC9fYXKaimHAi9YwSa5Vt
 EEj8N6lNQX1fuPCbwCuJ+FKGB3qZZZj6BUX1O2B7KbEMAxK/ZTgv89FOYsYD2j+CvN+oAUvd4sX
 ZjIV2H9x4weUOXWnzToP+rb0o89MaQ==
X-Proofpoint-ORIG-GUID: krTRSm--39RHKEJ12wSJYqE8QhLHMG61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On 9/30/25 9:39 AM, Neil Armstrong wrote:
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 2 DP + 2 USB3
> - 4 DP
> - 2 USB3
> 
> Get the lanes mapping from DT and stop registering the USB-C
> muxes in favor of a static mode and orientation detemined
> by the lanes mapping.
> 
> This allows supporting boards with direct connection of USB3 and
> DisplayPort lanes to the QMP Combo PHY lanes, not using the
> USB-C Altmode feature.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +struct qmp_combo_lane_mapping {
> +	unsigned int lanes_count;

"num_lanes"?

> +	enum typec_orientation orientation;
> +	u32 lanes[4];
> +};
> +
> +static const struct qmp_combo_lane_mapping usb3_data_lanes[] = {
> +	{ 2, TYPEC_ORIENTATION_NORMAL, { 1, 0 }},
> +	{ 2, TYPEC_ORIENTATION_REVERSE, { 2, 3 }},
> +};
> +
> +static const struct qmp_combo_lane_mapping dp_data_lanes[] = {
> +	{ 1, TYPEC_ORIENTATION_NORMAL, { 0 }},
> +	{ 1, TYPEC_ORIENTATION_REVERSE, { 3 }},

This is not corroborated by your bindings change ^

I'm also frankly not sure whether it's pin 2 or 3 that 1-lane-DP
would be TXd on

> +	{ 2, TYPEC_ORIENTATION_NORMAL, { 3, 2 }},
> +	{ 2, TYPEC_ORIENTATION_REVERSE, { 0, 1 }},
> +	{ 4, TYPEC_ORIENTATION_NORMAL, { 3, 2, 1, 0 }},
> +	{ 4, TYPEC_ORIENTATION_REVERSE, { 0, 1, 2, 3 }},

Would it be too cheesy to check orientation based like:

static bool qmpphy_mapping_orient_flipped(u32 *data_lanes)
{
	return data_lanes[0] == 0;
}

?

> -	ret = qmp_combo_typec_register(qmp);
> -	if (ret)
> -		goto err_node_put;
> +	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
> +
> +	if (of_find_property(dev->of_node, "mode-switch", NULL) ||
> +	    of_find_property(dev->of_node, "orientation-switch", NULL)) {

of_property_present()

Konrad

