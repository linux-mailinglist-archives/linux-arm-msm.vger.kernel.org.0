Return-Path: <linux-arm-msm+bounces-40936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C33D49E8921
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 03:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2E5F163808
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 02:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B872D381AF;
	Mon,  9 Dec 2024 02:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jnAUi6W4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1239474;
	Mon,  9 Dec 2024 02:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733710298; cv=none; b=e0Y9TVwbArdOAjVpHI9Wl4Qz1OxSSZFab43BSRbCuntavmH+ucUFLlA6Jfgt7FP6r6vqROrHsy+QOR1Y9PcocMa1fdaSifHR8+pPY/1q49apO9oiGFxE4QoRURkL/mg/4cBV8bm5QXxMvyCQ0c0yUO1Ot1K4G2iizMAuxVIK0C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733710298; c=relaxed/simple;
	bh=qNoH6ad1R6gJiGGjyTOv3BRKQVUyf0XZPnOWgEWq0EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pwmmLTWric3yCQez7ghHyDDVqZ89x0cjO8jE6DnKoAzc4j5GUyuUOQ+w9hpG65cUXHwlPZUiT5Eo0yVJANeaLbNJSZu7BYkGUTQ+kU+G6FCIGe/mblSSStmikrel8ZwF1hBj0stfedeWtIxtwKo+CmY9ADmbyFLM7C5iNpj8/Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jnAUi6W4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8NHuJN027535;
	Mon, 9 Dec 2024 02:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVYLZ7+oGDKpJ6s5sAlwjVecCaWFGCditgawfVlZgSA=; b=jnAUi6W4F4k1GWOa
	2WeJK4YDSx7BMUkdsf0P46l9LUFrSEIi6T1W0OzwRidihPMIuGnb7n4W8W7xxYwO
	+90+WlGhvE7EX331fhRPuecdingeUmcUN/K0Jgi6x750TESO7Lu4Fl+c770wS0da
	dnGyjKHdQohMrhe9NexO6oL+LfYvRGIep+2IHo/oxD1wXMSADWbhTE9tRESjz2wp
	S6dJB+dqU4pvae+Xyw7+HHsmHg9GskE0QA3s/ZxZKPLWy7rpFLS0p6ytBMiEa0tC
	BREVg5TrdRNxIuO6J59d0+l735VuNup46a6eUm+j9d6gLUdokL4C4l+acimczi6F
	SezMyQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdxxb1um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 02:11:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B92BTKl028115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 02:11:29 GMT
Received: from [10.253.11.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 18:11:26 -0800
Message-ID: <441f37f5-3c33-4c62-b3fe-728b43669e29@quicinc.com>
Date: Mon, 9 Dec 2024 10:11:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
To: Andrew Lunn <andrew@lunn.ch>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
References: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
 <20241118-dts_qcs615-v2-2-e62b924a3cbd@quicinc.com>
 <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
 <89a4f120-6cfd-416d-ab55-f0bdf069d9ce@quicinc.com>
 <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>
 <3c69423e-ba80-487f-b585-1e4ffb4137b6@lunn.ch>
 <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
 <75fb42cc-1cc5-4dd3-924c-e6fda4061f03@quicinc.com>
 <4a6a6697-a476-40f4-b700-09ef18e4ba22@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <4a6a6697-a476-40f4-b700-09ef18e4ba22@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AyuOOpTBvZOEp_uonKIrjZUxjH_1zHuw
X-Proofpoint-GUID: AyuOOpTBvZOEp_uonKIrjZUxjH_1zHuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=705 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090016



On 2024-11-29 23:29, Andrew Lunn wrote:
>> I was mistaken earlier; it is actually the EMAC that will introduce a time
>> skew by shifting the phase of the clock in 'rgmii' mode.
> 
> This is fine, but not the normal way we do this. The Linux preference
> is that the PHY adds the delays. There are a few exceptions, boards
> which have PHYs which cannot add delays. In that case the MAC adds the
> delays. But this is pretty unusual.

After testing, it has been observed that modes other than 'rgmii' do not 
function properly due to the current configuration sequence in the 
driver code.

> 
> If you decided you want to be unusual and have the MAC add the delays,
> it should not be hard coded. You need to look at phy-mode. Only add

Are you suggesting that 'rgmii' indicates the delay is introduced by the 
board rather than the EMAC? But according to the 
Documentation/devicetree/bindings/net/ethernet-controller.yaml, this 
mode explicitly states that 'RX and TX delays are added by the MAC when 
required'. That is indeed my preference.

> delays for rgmii-id. And you then need to mask the value passed to the
> PHY, pass PHY_INTERFACE_MODE_RGMII, not PHY_INTERFACE_MODE_RGMII_ID,
> so the PHY does not add delays as well.
> 
> 	Andrew

-- 
Best Regards,
Yijie


