Return-Path: <linux-arm-msm+bounces-87172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BFBCEE0FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 10:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 74D53300090D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 09:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405512D6E6F;
	Fri,  2 Jan 2026 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RZVRLh7X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E621F7580;
	Fri,  2 Jan 2026 09:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767346178; cv=none; b=n6jg6e+jPhw3IJ++iXsIu9IaW1KKoaakgcZRj3BPx3NTo+88LDS7Y18DXEVvyZWNfKs/5cx8zmP5vSViAebd1E/9yw6Q7gsIsrQnBWwcPxpJQqvoeM0SWxbKBGe7COjc5UCDFoJmpJemtopp4bmmpLqYE56qq3aoZvVVT7cRfm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767346178; c=relaxed/simple;
	bh=bfvc0nsDaqL3faZDfWl4JZOSetSF4XhQ++l5FyC/mY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TBVgZR2AYpDO6GA76byQKmG8w8Z800fz8PKgd3xqhwu6j6IZr6l+f61blwKMvn7j4+VJBUCxSVRHwHVvod2lm5wDEPAPfrFcaqmINQa6lyGBAD4HtXlGDqMTPRLOUo03Pyl44q1gvt4Dr+FWZtB9hklrvM04P5tAv7VHa/MpKug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RZVRLh7X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602894JE035910;
	Fri, 2 Jan 2026 09:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oaW0Z6j0ZPnwG0r3uuBK5kv3RVSJzkfV4NzktJbSi/E=; b=RZVRLh7X4ntl8dfB
	tRQ0x4n5v3aI1mKFBP4ymFSYVg/Kgz+lPoPYML3uJ0k3SKf1I2GT3lzsuMwnEUIW
	RI5vvgJBfWsaGv3bKlaZx/RctV1RzlXnFsqJ3M9gO0AjtfgE2cARuIckXqZa07zZ
	uu6iW7eypk14uyq+iGn/t5kEICxXWX8+5TltRfJ6ZhowAMpIO0JL4SCnB2/9Ll82
	1vYohLTQ7vV9JDdF//iifyvE/HrNKhizH5oL6YnDkdg5noaNpvKSH1hmR+8XzLz1
	30XOYDob4FkFMGjbU5XBykF+0DYkJP+7rpl4Ok2gluoblTR2zAEKK9+8Lyq/7e1U
	QTO3fA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74c48q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 09:29:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 6029TIAB006914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Jan 2026 09:29:18 GMT
Received: from [10.216.5.234] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 2 Jan
 2026 01:29:10 -0800
Message-ID: <58b496b5-2847-4af7-8a34-e227e4324deb@quicinc.com>
Date: Fri, 2 Jan 2026 14:59:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: display: msm-dsi-phy-7nm: document
 the QCS8300 DSI PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <dmitry.baryshkov@oss.qualcomm.com>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <andersson@kernel.org>,
        <robh@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
        <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonathan@marek.ca>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>
References: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
 <20251225152134.2577701-2-quic_amakhija@quicinc.com>
 <20251227-doberman-of-radical-variation-d30aaf@quoll>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <20251227-doberman-of-radical-variation-d30aaf@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zYsvGjGcXceGOpTB8rFMlvFOrGNmFuGV
X-Proofpoint-GUID: zYsvGjGcXceGOpTB8rFMlvFOrGNmFuGV
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=69578fef cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fWUcj0S4klb-w0UgOPsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NSBTYWx0ZWRfX5dJyz1g8G/Ja
 2vXNwTFU1hMK6ZsyFw0HozPYioy/cwffwIZRjGX5+rdMsSjFgGH5vq9tHbzBVGrJG5pJYjZCbA5
 kj6vAih44inI5tN0KPlYRHSG6xFDDzovdJMy6zYYSnMdeiKoi/GZvBbo1TtLogKn1bjtEAlJL2x
 pkafdL6lEskRwffpmi1u2msJxkDDD/vV4HQjBi6vURfLFaG6YdZ6nMZtpZK4xXD7ijVnfUjzkoU
 g+4W6k0JQBzr410vBvBvt6ek9xQCHoG7U+OHtgNDdjBhzqYREdaFQVEt6GZG6RXxrVpUPhdB8sN
 0bQ+VN2JLFopRoyVC39lJQtIFDGzRBjDHDTgIlF6U0gkZPAO1YdyH23DGrtdwIbo/pJngKyXbxF
 4M0Y2T27982MvE85ECWMuAHFpG/G+L0EnLIk5ZnSNPCaza+QlL6IxvcZXb8MOXc4NTpncRFoe0o
 q5D8BKIPNak2Aa+voyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020085

On 12/27/2025 4:43 PM, Krzysztof Kozlowski wrote:
> On Thu, Dec 25, 2025 at 08:51:30PM +0530, Ayushi Makhija wrote:
>> The QCS8300 MDSS DSI PHY is the same 5nm PHY IP as on SA8775P, with
>> identical register layout and programming model. Model this by using
>> a QCS8300 specific compatible with a qcom,sa8775p-dsi-phy-5nm fallback,
>> and update the schema to require this two entry form for QCS8300 while
>> keeping existing single compatible users valid.
> 
> Last sentence is redundant. I asked to explain the hardware, not to tell
> us how Devicetree works. Write concise and informative commit msgs which
> tell non-obvious things. Not what you did. I alreaded asked this - do
> not state the obvious, do not copy the subject.
> 
> The only useful part of your commit msg is first sentence - two lines,
> so 33%. Remaining four lines, so 66%, is obvious.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Can you please check below commit description is it appropriate  ?

QCS8300 uses the same 5nm MDSS DSI PHY IP as SA8775P, sharing an identical
register layout and programming model. Introduce a QCS8300-specific compatible
with a fallback to `qcom,sa8775p-dsi-phy-5nm` to reflect this hardware reuse.

Thanks,
Ayushi

