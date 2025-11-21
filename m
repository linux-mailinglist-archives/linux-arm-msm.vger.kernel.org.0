Return-Path: <linux-arm-msm+bounces-82854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96645C79AF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id D8D3D2DE9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF5B350D70;
	Fri, 21 Nov 2025 13:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XC4IgcGQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcubMNZb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE6A33CE92
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732818; cv=none; b=G7/v9ShqCONOcoyDeugXHCd2L5wTJYkBMWV7pn3uu+x1MlvuC/kuHm4KGFpRY5qCXySqDfjawTuj2C7iwFJuOzUgStBRO4advt9eH7Foj+AyfiIm2Gpu2iv1OpfCRLRSsVMRjUmpkkfg4Q5ZhUGMbITBD1wrYE/apOxbvuO2PBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732818; c=relaxed/simple;
	bh=+WSh/nrOulGAjXJGC0pDYRfoXLb6sCiD5Gc02jtCuTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YS7CkcSW23QMLMyNxkAYVzK3wzpxg57dk3O+s7LQdVL2whxSlBYM8TnwBMs7fLgJTqdHBlKXUpP7Fu3kiu7DubG54K98eVvNBV0VJAFgXk0pJoUpqx9ZXwLboI3QYscoWroIqIb/HGz7xm3fDKxf3kfewOl3lZYYbz0SxwfG34M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XC4IgcGQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcubMNZb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALB49Jr3911311
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+DO9BekeG00CRw1FjqoZ6sLkEuK+yJJGU53v8nxNZk=; b=XC4IgcGQxhnMoFwW
	AJMvAyCMqowJDywOL1vS+Vpl0Uw99bP5Hh4MK6DTDa/d5zCE6cukp5mleKA1y88w
	O6cSeSFlPfRfBX3L8zUrSBXDVmdbP96rRKoXFboJsT7bE29rP93OilGaI3jPU/H5
	tdcVwNff2HeVA5Zuz2asiBQcvkm0BzjMwws6iYyf+8pKgaO2nvXy7h2BeHzv0aiv
	WQN876VSNAplyKIPr6UEu6u0i59QWOA+HL2KI6XY1hcDN/BExJNJC851qZyO64ap
	wgTyA1E9l21nVyV0+geBYCYWJ9g8QeKpyAJCrSdee6CK16IeG9cplA1nvX8UdnAl
	bcVydg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajpvsge8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:46:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed5ff5e770so4178521cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 05:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763732815; x=1764337615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j+DO9BekeG00CRw1FjqoZ6sLkEuK+yJJGU53v8nxNZk=;
        b=JcubMNZbF5mjAja4WcDyplrRub5z2QIj3rhAm8nRwL5Yw7SySDJSHbI96fl3v5dGes
         kZatGuDyTBwhSRF1REXm5D5OHH7nR+HGk3ZZT0XK5+57gta6caux8SeO4E/b0n9Gih8z
         YU250YXEHkUA68AkhlSRFJ/dN+GrUGIclmELfNTS4TckGnpUi2sfHv2M5xK2F/JBsK8r
         mOHoFQmAuIOp0UPYtDQ94WJYvMw2HAbbWxU6P6JFgO6VN9+DZY6IMsCQvZ47zEMo9399
         En3rotmOa/7hEMUtu5B4C5SdXgz2uCZrabZmfbtAesqA9kJDerIan//Ps/GHXYSIsx2t
         FBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732815; x=1764337615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+DO9BekeG00CRw1FjqoZ6sLkEuK+yJJGU53v8nxNZk=;
        b=lynzYienqiF91q5X+m8shiuV16w66GvsBgGBJdLxaxA5LGk25gMFmDHUvH3WB0tSkG
         iNFH1N666i2Y07/fCsR+g9zDo+hiFbsLYR57wTZILALpXu7+i8jB7zNr7uHROGYMrqpe
         aQyppYTJLS+0WQ986PKQgx6ZrKHhj24dXXGryuC6IfYTK4hO9cFPPzqyVPuLte+6xbWK
         26nLPYN8goywgZSI+fmq8cNfxaXE+hk1RBAyl+tKQOv5lpCB6Yy+Fcx5fi++bMq5jsHb
         c00btAq976iaU+VlX47pVY0YDcJVEJN+hFymut3tD0GXC8vmZJWDmZWpnt6HyevbC59M
         clvg==
X-Gm-Message-State: AOJu0YwleG3zpTltbG7v/UpJeDMeI7R+zKdndl4ak6/lYCCp2z7vYUCM
	6Kiey26zF3jMFYXSAIRqoq1FLQBaCTb2H4XQE4HdkHm6WgA9P1IeT5oRlUy9G//Sf5/ZY9OFAdv
	hPuz/LmHpXNteuEf5Tznj3y94V5UhatzB74m7LM17iNHlCv83/3PPzKp241WBbhj+eGna
X-Gm-Gg: ASbGncsua6bLpVJcOmhpbH/fRVkyMxjZa4830oQB9g592w55ZspsS7DP5RKI3Z1JD7C
	1/Md3o7yEQsRqvXQOVTPUFc3YqQgpIV3hloNVyEdIvOAGj2Xi5xQ7wUO2uZQAfW0Z/URODSLSGZ
	wwVhk3F6jbO/IvbVgdqc4rJLcGt4RTNy0dWCS6WmiUvqE4ED++YbjWt2dhtabOLLv/YHuEveuX+
	Pc4PnrlggRkyd+EtbaZE2aNaZIK1nGZu9Am/s8SB+odTL5uLivVq5/Hjlo1JcsxC7bpPWkKZf20
	iJ6x3pqc0wxTPLH+WhjbVfqlA2fPX1oHW+EeIcDXkSAhCfuykQxDRsmoAZk8t08/0MNp8TlVSgQ
	yYiMkgoakUqkdwn5eijhCChGFC0pt2qznqPiSpGzkok6M1Ddu6vgn1Wj3brw/UnCzoT0=
X-Received: by 2002:a05:622a:1184:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4ee5895624cmr23133071cf.11.1763732815245;
        Fri, 21 Nov 2025 05:46:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7DtYkRqUxlcO+pemjw2RleQ5P1i+dCdeHRUXrMnmyJnA8E8Rx1MkOitI3BlsemaFfVRZ7bw==
X-Received: by 2002:a05:622a:1184:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4ee5895624cmr23132801cf.11.1763732814788;
        Fri, 21 Nov 2025 05:46:54 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdd5e0sm496933766b.1.2025.11.21.05.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 05:46:54 -0800 (PST)
Message-ID: <c04cd051-b6d0-4d98-ac2d-4fc7ffcb4301@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 14:46:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com>
 <20251121-enable-ufs-ice-clock-scaling-v2-1-66cb72998041@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-enable-ufs-ice-clock-scaling-v2-1-66cb72998041@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: STQrYHv5_ilE4wcXAulsMUXOuE3doGSe
X-Proofpoint-ORIG-GUID: STQrYHv5_ilE4wcXAulsMUXOuE3doGSe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwMCBTYWx0ZWRfX1gE10r0Q236h
 LQ7+/X3pn0YiqWWsh5uIIHyFfexHQDcqkayAeAl2hr//Kt753yk7uTBig6iLzdFXLYYKv+boH+Z
 tFY8qH00m10L+lFjIJMaXpn82q8hyZeWTAVrg5mAZ4Qg48fI5qaYbSnRm06EKXhpyzDNY5UzI/B
 QadUp+7qEkiCGRDmAijWVaJU/KPKw4c05vasp6chMN5BBsSMiwejk1hYRw6MNIUW8OVgQQbkAQl
 l606DuLN/GOYW9LsO+r5mRAYF3S6Z9GkcdRXlg2kTk7Z54ILj0+IGeVW67SUPJc6/1jjck6RAQ8
 8tNvW8sXCWrQemRLXdk4QP1h7UbGYY6qC4UsrPtCekxMFhNVGTCwUSxbnHo+Dtaudb0bN/CmteV
 5wzhk5O4TyJPXTnUVh+0i/i73/PQQQ==
X-Authority-Analysis: v=2.4 cv=MqFfKmae c=1 sm=1 tr=0 ts=69206d4f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=DINW31QT5aIcAUPt0q8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210100

On 11/21/25 11:36 AM, Abhinaba Rakshit wrote:
> Register optional operation-points-v2 table for ICE device
> and aquire its minimum and maximum frequency during ICE
> device probe.
> 
> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> core clock if valid (non-zero) frequencies are obtained from
> OPP-table. Zero min and max (default values) frequencies depicts
> clock scaling is disabled.
> 
> When an ICE-device specific OPP table is available, use the PM OPP
> framework to manage frequency scaling and maintain proper power-domain
> constraints. For legacy targets without an ICE-device specific OPP table,
> fall back to the standard clock framework APIs to set the frequency.

You can still set a frequency through OPP APIs if the table is empty
(and one is always created even if devm_pm_opp_of_add_table() fails)

[...]

>  	/*
>  	 * Legacy DT binding uses different clk names for each consumer,
> -	 * so lets try those first. If none of those are a match, it means
> -	 * the we only have one clock and it is part of the dedicated DT node.
> -	 * Also, enable the clock before we check what HW version the driver
> -	 * supports.
> +	 * so lets try those first. Also get its corresponding clock index.
> +	 */

I would argue *not* setting the rate on targets utilizing a binding without
an OPP table for the ICE is probably a smart thing to do, because we may
brownout the SoC this way

Konrad

