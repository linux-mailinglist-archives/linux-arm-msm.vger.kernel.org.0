Return-Path: <linux-arm-msm+bounces-59506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 685AEAC4C52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 267EE17A47A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 10:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FDA2550D5;
	Tue, 27 May 2025 10:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1Z8B3PT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7912824DD01
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748342192; cv=none; b=p7xnRaP7T1IoBPALBI54zaJ90vDm2Wn3+N/+SrQJ48jdAvNELyyoORnLq407VEQI3Z1bZI8X3daC1URGn9oxmUomVOJnXET/Y3NIkxKRVZGpa/zSB903kHILaJmugKAaTuBTRy1ye5UCAzGSr1yxQXwMbgxZVkf1pkwaNGIFsSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748342192; c=relaxed/simple;
	bh=95YD43MMSNqaK5LMwdPF8tp+FZ+dyamPivRNhheSkR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9xGN4x3VIE6Eu6pnHOilSgm+Os2rALrxzDnkHS+NFZ0NakppZsB4wwwCWsPNW9T2cM6HOj9wNslbXrjAKvYXzJCzaollSA4jZ1JV41Lf/A8yEytSr+C+helg4iOu5qfdJ4cjDErgv0zomoc4sqFfKBDQ5RCm4ud/iC5VL7TdHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1Z8B3PT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9cDog011088
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ft8QwZ0sa4EuuX7mh+a4pQA1Ub71zPC0fRpxDZpjuQY=; b=k1Z8B3PTu7cwO/An
	zSMjX58N9s/zHNyHpypRgK9zxFnjor704xYy2WhTwdHAabuqNjUb/rED6lNz0YZp
	IfDNYckh/YTEHZbwbDKMarSiC81QIS5IGXvcDukiTM8vKhyYfk1o85oI4nuYisxz
	nmaerRcyCqhnf+oXaTuczw1jY9NnnM6pwiHGuZ0oZfW2PY+iJqjUG+PsBa7S7Yxj
	ckcZbPqty9etM75AxcSmZxCJrCpcaj0DaJfa/EwtTt8IG/swxAHgGiCdiNNcERFM
	Bl9N71NMv90J+KMfTIaMFp+2QGzbC+DgXHP5wfQ3QheMoq53p3MYduTx9xOhch+A
	YBuLEQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5pm2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:36:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faa2693638so4112286d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 03:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748342188; x=1748946988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ft8QwZ0sa4EuuX7mh+a4pQA1Ub71zPC0fRpxDZpjuQY=;
        b=BaPiP7+KVVs4jLcKq0k2kCAaH21XloSQst3IWOVWxX2mLpoa7kXcVCY6tZ7zoOXVxX
         nsTwIzfmOwLygnmG5Vqsa+LfLPkPyC19frKZj4+7cfsU6N180DLQYn8WnUUvb94hmAMQ
         D4eK8ajalhhWoTMU2GHyYo+cqdqnF6H37IbATeU8zjtXZO5jh2RXcI0D9Fha28PY8+KH
         K7UIIhDsn2Rx+x5SGFwep42LPv+282LR529ew3/KOLZYtyX6RrM+6f9GV2ywLIgZzVxf
         3IDZOfe+G54FVy87kODTNqMVC8xujtC4Oj/hVgDY7V16vhVkvY3USTSfQSkB0p+5Rf7N
         jySA==
X-Forwarded-Encrypted: i=1; AJvYcCU1u3wZce1sdOULt3bHUpbgyN+esb1tMFZe0TqewdClGJDUavWnnI54U5aqikLdeHJd/vfTtl5PKa6kolAT@vger.kernel.org
X-Gm-Message-State: AOJu0YxFasPU93kOhf3BZz79501e6q565c1cTz3XpZlj1Sk8Zx1WhCZM
	w4ypGHqMIIHL8vbLlTRDCBv/taCj8HHZK8WzuEjTPtS9WnF9edMCE6mZDruCgZ+wcQSimgE2mvB
	LxrEORNho6lOSsORcep9Fb6a85AtDaKiMDtbVyseOQ8TP5MmbPuHlIQgwGtcguk7FT0ax
X-Gm-Gg: ASbGncuNCBxSEhD9wRQyWFihSJRrLIrmbgdg12uNF7Yj4lPEUjXEGzXXfj/M5CgjFJx
	MVnluU53g8OnnXZ8bSU1m2C5hY2ss4gFNKn4kA38eHgdDbjyYLVjai/L44xJEVP/lxAbpNVUXfa
	KJmzP6lSqWknkwyBtJ3XUl/3/eUiLTQ+spor1N4Ft+0D/t07sfl0PHfG9fWONBzW9wNHJjGLDxj
	kTIBXiZRtcatROmY0kk3UA1Jz6xXvv9Upb602vkBzCJw1YC8FGBCnW2Uf6CDXaDwMQ8pcdHycmD
	m7OjfqLBEHcfyfdDIQS8XJ0te60IrA3csRJs5GhxRDH+OLuxZQOcpdobTcLU1mYCZg==
X-Received: by 2002:a05:6214:2586:b0:6fa:9b06:99d3 with SMTP id 6a1803df08f44-6fa9d34820fmr72068076d6.8.1748342188356;
        Tue, 27 May 2025 03:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRa1Y4Koar63eOa+CmHZ0wuxOPR9FIR8wrbdrkAW5Zh1e7ttEcc8xkpvvR7wWXg0ZSiOKx2Q==
X-Received: by 2002:a05:6214:2586:b0:6fa:9b06:99d3 with SMTP id 6a1803df08f44-6fa9d34820fmr72067856d6.8.1748342187980;
        Tue, 27 May 2025 03:36:27 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4382ccsm1815593466b.118.2025.05.27.03.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:36:27 -0700 (PDT)
Message-ID: <0aef1687-0158-4d7e-8e3d-b6eafc38d049@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:36:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
 <20250525-update_phy-v3-2-5b315cd39993@quicinc.com>
 <mcmpmaapzv3vbiynlrp6sijdjvj6a5j3dxzoixz6b4cxqsvbsl@ecljexn3zg2e>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <mcmpmaapzv3vbiynlrp6sijdjvj6a5j3dxzoixz6b4cxqsvbsl@ecljexn3zg2e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=683595ad cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=oxSCaEAS-4EJenh-H58A:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4NiBTYWx0ZWRfX9fjpqQh+iJck
 SujfHhQJ/wI5msBcColwbjs7qUvyl48bjJEHuf0bsL73xxeso2gEr/FGoJS1NYJ6wsLw5r3FV0V
 fgFzSQkPCP+QLVhG9N+Lx4HMGN8HPGD9wI3a2V8kTFSrSy/IutOz/7QVfNoTNXTbv+o435F7XFg
 06h12HYDnDftkUWZTgfoEN0Qk5jethm8YPW9vmJS8qN4itjEkvjfQkAyGsfzZJ445k1dv93hg2o
 Ja86D7vVDctVpSr+7fjxyH34ehyy4pKVqTSdwugcGRWqKa8MKbVoxxv8qqaGSVGwl64gcWurNzw
 d15MBHYZuFqYtZNGzjgTOOYQYTaMvUHEqKvNVAM9XrmA+Z7G4BHt0GtHgBAUgrbpDSbJxqbkq5K
 fH8REsFDdPo/fUmLi6yZwxvk6+I2wGQik9dm++7IgxOXVZYm9oOQc9fz/nyTDysKk8/2GeN0
X-Proofpoint-GUID: 9pzEhkuADjmeOzdzA7AAFdYEPeIZuev2
X-Proofpoint-ORIG-GUID: 9pzEhkuADjmeOzdzA7AAFdYEPeIZuev2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=754 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270086

On 5/25/25 3:29 PM, Dmitry Baryshkov wrote:
> On Sun, May 25, 2025 at 11:27:18AM +0530, Mrinmay Sarkar wrote:
>> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>
>> The maximum link speed was previously restricted to Gen3 due to the
>> absence of Gen4 equalization support in the driver.
>>
>> Add change to remove max link speed property, Since Gen4 equalization
>> support has already been added into the driver.
> 
> As Gen4 equalization is already supported by the XYZ driver remove the
> max-link-speed property.
> 
> "Add change to remove" is a bit clumsy.

I'm more worried about this node not having these gen4 eq settings
(i.e. the part talking about driver support landing is true, but it's
unused without the presets being explicitly defined in eq-presets-16gts)

Konrad

