Return-Path: <linux-arm-msm+bounces-54392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EF4A89A84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EF2A7A983B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4317528B50F;
	Tue, 15 Apr 2025 10:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maSGuzDI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69CF288C84
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713746; cv=none; b=dkyjFtBapIZZpk97XOs0doJTacTLkIupQGhtx0NW+kwnwtrvB9TS+CvLJowpMs64a/b4PynyZ26/tLhh5lXFpagGNHqce/lCMf/hb1oY1sICekXatVCJrZ4zBcnNts+aIFGRFnp/IkY7uoBxHMW/KWvLyo6U5o3hmkFa/4rA024=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713746; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wq8CO81ViVdJoFH7SJg/1swCH5KtUghCwYexTjoRMl4K3wf37D6oC/F+6IKJ5P8EOAo0I5HK+VVIZw6Hh1b21S+w7rpy62IhDrhF9X5MzVsBPPfTt41/hSEi06DhjoQ4Ejo9Umk/2tioYhQ41EzoYpduZnl+ZPB+w1+GuL/0ukM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maSGuzDI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHCg018902
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=maSGuzDICpKBrtd5
	L84f7kovllrJ2iJ47Ej8kJ0mSAkeEoSUEEIrL5Ue9wf9AQKlR6TCimMoGphPL5uh
	Cqkt7EK5jkwHJ4c/vJg6VhR5Y/oH0lb45zAgeXPZAhDMsTd6OHpYlfJqPfEIZGt5
	U5ZC8RZOTMjZLDUrxGzTpJHMP8MNaCroSodFA+4izxMDZbjPrZCWEZVbP8scxhhC
	PixTQVGGPo4TwKW7oY8HUb1d/rebiN6qiIFQqULOpJE+SciRSsnD6BTJc5icRTbX
	vwaTuB3uGEtJBMK+gCpw9AMe0WHKu70sGmS6PjASJH75Bekv7XK6+YP5BVsmtM2C
	ZwE9NA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjfp5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:42:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8fb83e15fso10946076d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713742; x=1745318542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=w4SG6IdoRLXPApd9oD/mOBZuYv0SQWSkBXu9ifmk0ulxtcQa3N3mXdMbTGp2QpFPMC
         UWaLx90XxkUA2swxzjlrFWpL7MgTFjsxGhqlrkKgm4mcd9yeFYnog2xpWsI7OhGFtR+a
         hrsDmFk9w7C50uhioVLziHGrC1sEkEKejHqTFZ+koRZOzEMbC1YZR3fZFTQGXaxxqKEn
         CdAjcxKfVk6T2qZg3KGOsDU9C0e+YtpqodXIo1eiuzOPOcAPhwC6W37W/1mPNjOSv5+F
         syGh6w9bfFAtiRLFfKACWq5B3nFE4hLVsylzC5npWTgnMtqKqL+bU01mkj4kt956sNoT
         PsfQ==
X-Gm-Message-State: AOJu0YwQvBkBtdEiq41Cbnhir16aILa26A+YWGZLt8XoMSgpIHWhdinM
	yGJ601gb4sCsERL/k+O+GL3POTQuTw6sOPel1gKs0wnQbOUimCFBLqAx4/UyRIP4GXWDtovobLM
	jwHsXLF8RKbUkOhTtncaR1EUgXOlrdDeKy/xvZGW0MZharHXBfAtUwBC1jluZg+Di
X-Gm-Gg: ASbGnctLHFZUu5Wmw9Vq7P4U8vmOdECQ7KgTzQF7Egu4o45hRQusGd87pd26mQMX7mn
	7HRBhDvYbqVL/VydFrJESKAwHUlM4PdpuhyheP5M6SuqHXGRhVZ8ZC+/EtD+5MCWV15T1+N/fdI
	wbkzV+AObS/lEcnOzVtEtdXHGUIo/p6cn4NGv0thcCD39Q8XkB4AC6mAOfCPqxPZQf+gvpdV3Ih
	BbSjMVhWHQwEBPzF04XbS/KG7N4vlB3zH7yHZzI968pLm12o2eGeRjloL5UcRaZxqHsJgy1SQJA
	kxmnR/yrS59a993VcdwKCtxyANOh0Xj/o5AgikaI8RKpMxUJ8F1QR6jpqjsdEKrvsVg=
X-Received: by 2002:a05:6214:e61:b0:6c3:5dbd:449c with SMTP id 6a1803df08f44-6f230cb6fb8mr99132086d6.1.1744713742658;
        Tue, 15 Apr 2025 03:42:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGelcEtBJf3FeAECtvsA0IW3XDUNMkLauB3LmX7jlbzYLrgC1yDR59WjCB5y4K46faIx3ogRA==
X-Received: by 2002:a05:6214:e61:b0:6c3:5dbd:449c with SMTP id 6a1803df08f44-6f230cb6fb8mr99131926d6.1.1744713742367;
        Tue, 15 Apr 2025 03:42:22 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb40e3sm1054619066b.122.2025.04.15.03.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:42:21 -0700 (PDT)
Message-ID: <6d462775-fea9-4583-834e-37b9ff4f7b04@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:42:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] arm64: dts: qcom: sc7180: use correct size for VBIF
 regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-6-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-6-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QPXzFhRsm-fNlKMGS1_fC4yK6MfgbBXa
X-Proofpoint-ORIG-GUID: QPXzFhRsm-fNlKMGS1_fC4yK6MfgbBXa
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fe380f cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=630 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150075

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

