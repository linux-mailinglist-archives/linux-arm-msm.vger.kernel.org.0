Return-Path: <linux-arm-msm+bounces-73842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D5FB80275
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC31A2A76F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 02:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6C82F2914;
	Wed, 17 Sep 2025 02:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJEr8WnF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A544AA945
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 02:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758075835; cv=none; b=t23ul8B2IOgVNNYLF2nX/MYKrAFIiWRBesNy2DU9fZx49mc2t6SWIlewbDRPPezE7lrUqIla/IwtAXQnjsNUpQrUpv6WvSF2dGy7Cr23G4MwCStrHnwG6HhPFeUB+tSlElmeCPbMUQT/uDqvmG139L3leLBhbIzv32RoJI1EtAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758075835; c=relaxed/simple;
	bh=JDu703gJi4SNHr8MEaA7gFNcyg73bIGejUOowGwFSGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZDeHgBJcEA2iXCQSYn0RXX+qMLaiIM6Z7yhAq1DponTOzZeN3imBZecv2BuDppPqOrQhY2RxxxyC8NiX9Yw7aCPFWc6fWsssClZpIcR1Yasi9LvBL2KFygTXPDvf3WRhx/yfo0hyJG+4fYL5FHoT/beUOYOrPwGQGzuaqBwovOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJEr8WnF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLaCxG016281
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 02:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h24NHOjh9CfAGdrmNIBn0f+X6SHiD7K8dLr4j2/9Zz8=; b=cJEr8WnF+WSbXdio
	QIU8SqkLnYn56mqq5S5lBq5auaKMHJLd3OjAEEWVtFVM4X7O6u3KAgqtrBLUAS/H
	SdVPx+FTZzyjGpJnWzZ/BFnayQnD4fPwzFnDHv5agx/k8q2tIjuVivzzbUtQOuO6
	/IKGXFXGDoPRPmITk/oQJN88lzzU36Q2WJB38H+1FFxmP7xr/TQW9FvvRunSgmA6
	nKQobfDbgZ2tEcKsUZ0CrCTO4kwj9bhq1GcL8i0OKnFcIkoLHxKBZwdOfI78NB36
	FejrhZIU8YaAuP+Ng+R0rnvjjEWF/HebvhMG6AodjZcpzxPpDQsWcvmEEZLmKGbB
	pOt0OQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxx8k0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 02:23:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b54d1ae6fb3so1964800a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 19:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758075830; x=1758680630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h24NHOjh9CfAGdrmNIBn0f+X6SHiD7K8dLr4j2/9Zz8=;
        b=JtfdaKhV4s4LMRzvnETeZE1+YXHTUixHsev+c47+CqkQ49ocL3FVCRFdw3YpAccI+1
         NbC1W5atmT4V3vVIYSCKx1qc/OX85LM8o4rsbXBCjfsZAx/6qtz3Dbm0G0bFJ90J8MrQ
         fufLbUhQgxrS+xBmPkhLGo7Ede/EVYlXBI0Aw6y7MOfWUrhbbX2S2ex8FevwRajvAsr6
         GfJcgh2Dto4DghxNme0MslxMUFHN53zrlv/b+5+8flunlAoiU7MwbFWjs7eGgaOclPv3
         ogQC1R2GShmHtsSC8Aygd7CnYeePEfANW93k58RP0Sl0kIP3rg1qJsJrgxUD/4ZNp+zb
         stfg==
X-Forwarded-Encrypted: i=1; AJvYcCUiBNDBxgTbQsJUY/mB09gLhp3EuReQllZZZPEvv4S7x+bBhmy1W8proFY4iReM2LbyyPdHSZIuesqmKyAl@vger.kernel.org
X-Gm-Message-State: AOJu0YzkcSSBPqIK3O/GsAjFPjRTK40hWwjUe+zMkQC4lWpA+k6mNY0V
	x3l+JnMGaZzgQUcTg2kGMDUggsXgvIzqN50Y/04uGxbNi+k9XVN97V31IcTveM0rmXGfq+MuJAI
	8GHzJybG4ydZgFHS4jARCypLD9121Nc3OhX7JgkfmGDM3GsvOJK1do/jSYRib8esv+dFAnnAMay
	UZ
X-Gm-Gg: ASbGncsRLJVslyovKFBt0fwlL29sFlhQax7UU019phoVmr0t+X9F3X/peDlWUckBJx1
	u1fhnlnIN7H/+SF7wXxz9Qr2SCRinMWaiJe5wqNuY2WTuBQ7F1ksQNykIBlqjZ5bPRigzQ8ZyBw
	npkMiBEcIwX6QBq1UpvCU0v/NI99pErBP04iZGanr9n4AatFTo3eGTS2QD4kG4FD1tyPpIZbKC5
	d7lvz8Hw4QWnwrddrLrjZQ5hIlJ31xfpfnQl9/jytVtKPAPonJCl++G7xNKIdjo23j6aBCxOWXN
	Ik1BQBS+xFf6qWTKqIOg+HcL/PS0twoxtZ6ZLxsrXbTj69tT5tpRqxOgyfmmTjgMGoK9mb41vdB
	vvMHxbsqAPyAYVlSY1oEu6FteJLXtn0WxmA==
X-Received: by 2002:a17:90b:35ce:b0:32e:4924:6902 with SMTP id 98e67ed59e1d1-32ee3e77a22mr630840a91.3.1758075830557;
        Tue, 16 Sep 2025 19:23:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY1YBqTy1MRBizc/p+yW2rG4Z6RYxx1hlDxK/FRXmTIxiFlffsuMnGhMwgW8FYwvbTxyKbcQ==
X-Received: by 2002:a17:90b:35ce:b0:32e:4924:6902 with SMTP id 98e67ed59e1d1-32ee3e77a22mr630811a91.3.1758075830045;
        Tue, 16 Sep 2025 19:23:50 -0700 (PDT)
Received: from [10.133.33.240] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed26a6ce6sm906637a91.16.2025.09.16.19.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 19:23:49 -0700 (PDT)
Message-ID: <3d2e8600-fee4-41ab-b8a2-9940a2acd389@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 10:23:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] power: supply: Add several features support in
 qcom-battmgr driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <r65idyc4of5obo6untebw4iqfj2zteiggnnzabrqtlcinvtddx@xc4aig5abesu>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <r65idyc4of5obo6untebw4iqfj2zteiggnnzabrqtlcinvtddx@xc4aig5abesu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _xnIc9EmG-1kFzNzoyu8WlmOmeVug41y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX2wBtrx7WPzM6
 ziJJVatxpaPYkvzZv14G/nDZD8gIlvujKbexOdTKSEzkM2SxW8IpqafPDeaX8yernjptHF1hgPM
 RhOXdMm6YIq9tJ8wjBf2CFGVtcZpG7VfWMQuQlcvMZyn1FJE2KHHp7yCYCRUEcw5avFHjwhdGzv
 2fAaxglzrriraW15TIotsdMNvc7hwQItUFPuCKPI1eHIUrt3Bgg5wVQE35VAuFz6tuVSi8HYqQr
 DfOohwDJ1jaBzBmYjw9ErF39jG4Wznmpb8zQw6E1UfTZVYyfc4tnQofEh8ApgHdd5uhRbw9rlKM
 4Ow9QuaGSaks7F2J2v/U2eAQPF81wHPITmDnipRBl9XYQTggMjTlfVBr1sG/79CGRJL33EiE6Mp
 ZOKYzyGE
X-Authority-Analysis: v=2.4 cv=cq6bk04i c=1 sm=1 tr=0 ts=68ca1bb8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fapJcwKh2RYohvRb9XYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: _xnIc9EmG-1kFzNzoyu8WlmOmeVug41y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202


On 9/17/2025 3:35 AM, Sebastian Reichel wrote:
> Hi,
>
> On Mon, Sep 15, 2025 at 04:49:52PM +0800, Fenglin Wu via B4 Relay wrote:
>> Add following features in qcom-battmgr drivers as the battery management
>> firmware has provided such capabilities:
>>   - Add resistance power supply property in core driver and qcom-battmgr
>>     driver to get battery resistance
>>   - Add state_of_health power supply property in core driver and
>>     qcom-battmgr driver to get battery health percentage
>>   - Add charge control start/end threshold control by using
>>     charge_control_start_threshold and charge_control_end_threshold power
>>     supply properties
>>
>> The changes have been tested on QRD8650 and X1E80100-CRD devices based on
>> qcom/linux.git for-next commit a679f3f6931cdb0c2ef5dc0c26f895ae3f6c1ddc.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
> Unrelated to this series specifically, but can you look into fixing
> the following errors (appearing at least on X1E based Thinkpad T14s)?
>
> qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: unknown notification: 0x283
> qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: unknown notification: 0x283
> qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: unknown notification: 0x483
> qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: unknown notification: 0x83
>
> Thanks,
>
> -- Sebastian

Sure.

I will look into this and fix them if I can see the same on my X1E80100 
CRD device.


