Return-Path: <linux-arm-msm+bounces-83576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBE8C8DD94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 02D0D34BD94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AFE32573B;
	Thu, 27 Nov 2025 10:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0jYeD/H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PN287aA4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA6817BA2
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764240921; cv=none; b=EmwRSJ79I6Fle4m1yxUQBZzqIabXYHS2y4vvpLjk3S/p2fPx/6Cmwizh/byygKPSBeiLOwiqQ/q3e7yJGgwQD+rUraZZJ6nT3HJ+h4FNIfAds3z8uilkl/yJgYmI/u6u0ZtmP8eS1Z1z4stwfP4M+6OxYObZehlv4NtXWzro2Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764240921; c=relaxed/simple;
	bh=fv5Fh2RKoj+Y489woLzpEbj7gwcHRZz9/j0V4OT4KRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1EPDSlJ5epKzLrkKqYniiFZaiXblQcdl9amufdXwyOHTQsf4NgLZBjIhF+zBs/U4VYTyiaePPtDiPxAvu5BkV2KQ0D/KFAneHqVdeOYu0uOpsT2oXF4EbwgEo1hd3FCd09pAuWTqj6kj4sboX2n6Td5rr1c/7ZRqNSNDKts+p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0jYeD/H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PN287aA4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9Lfsb3332137
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2YDfc+p8Tt4b3hwPmgXQ52xlaEjaZ+Pst10I0/9esY=; b=o0jYeD/HOY8n/6S/
	TBdpyY9j8E0n3wks6juFzCf6fPiNNzVKGP6vHkJcT4l5Xe0mPuOHglZODiYoRiMj
	EKV+c/x1aMGuA+M6BwKZO65za1wAuoPnDxj/JdsIi7OL7o5yqP2t7YIyr8pt9kFs
	hFlltci2AspWhzfZbNqV6Tyxtij1x4LJi3O97OolUCgQXPrW6l6hx9XfdMmXtbB/
	W1DRXilaIuyQtVHwSSsMHNFQG9Hy/fUk7eriSVygH/fNvmdLKF0XFVwV6o6nDycl
	MM+w8grabjDZYhZcdFT7hIambkczo5U/4kK5nUk3Pgd5DO03TIAF5K5vfU9su706
	fM8Okg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apavs1rmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:55:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b1be0fdfe1so23695285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 02:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764240918; x=1764845718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c2YDfc+p8Tt4b3hwPmgXQ52xlaEjaZ+Pst10I0/9esY=;
        b=PN287aA4AAVbLhlk8GPeSDkc04smqTdD8vmf1wfOrPlrg6K58WALyJ6+axjETm6cgM
         In8KWliPpgiZgSful6KK4KQTJMhTiWHuuxaEcQAzRXucFW7wSHzsCnqJKw1d1ytCh660
         i5GGxxRCHGY5H29K3U/HuSX/sl9trnow6yNtq0WXVIvGfUBwLvFh+0dlfIVjTPXV5Cbw
         81g/P7Y31IoN0QTuoxtZYhoMH2O9sA2K2WyVOrzzWaS0ZJwNDnPqoeEnWKVNyamFtfPW
         lmpfWQKfidqebH8cqga6tsH63zl4GLzwxSllEvhTYat0oiofOQNWU3g2C+21crHes8EM
         ne7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764240918; x=1764845718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2YDfc+p8Tt4b3hwPmgXQ52xlaEjaZ+Pst10I0/9esY=;
        b=Tp0PIdRM2pSccHLw4O+EPSjm1GduJK5amF8pEHA7cNAwfRZyxaDJYwlQv+9MlAXWqD
         YI/Wi5AKPNV9UNk9zbgF+B5jYQ4S9tUKdzUx40uBWpJRSceBFcOsKRpT8c+5NNxtR4Vg
         Y58etG5zALX/U77VQr3PN5w//P7PSQyyqaCY2TTznilq/jz6dyha3TwqhpiwJeYfwzFB
         /litvlV2IZmvGMNbCbrUrdX6bTuZruoOW6Fh0HTFuADpa0Q4dSF5oUDc1al/JYAyYjrx
         p1/CmnCYywMzdOKVkh6Et75mjQJfpVv/plyDU8CJHtg8hdd/hJkmQW3bm6a5uftmnmPQ
         7mHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEQLrlgEHs8BmpZAJbwNLvE72VEiVREusPfcyazKMEht1vvOVRFeLQ1beo7BtC4iKCvavVioLzMRZIA3vj@vger.kernel.org
X-Gm-Message-State: AOJu0YwWBGcf9J8idKkjLj0I1ULa0C38X85IxVHUnQpMEw2flahrbf/D
	ay3bUKpEMFy7We44sfc+JTG3NSHhixkdzO4vZkUbj37eTu9Wt452RbhtMqCP9MfT0YGo4SK/32I
	+ObBnu0lqUyXV0S4YaQrlMyOqdemZWT4D09M7WJL7SPYjap2lCf4nNOt9RJmlSUEymKZN
X-Gm-Gg: ASbGncuDvFXcefAe4vX1qxaDLnpGOplpxLHqlJzrw0qyXFwfl1qEkKMrMM+Kj9EK+Ry
	2UFgdvoPugGvfHqKFLR59BSRC/6A4BCclQIkTrAKbyUfEe+Yyc3yzRCO/aeQuINZITxu6LFcARn
	R1tVFnZs5VmC2KKFXe+vuWXIMPxiwMtxAiLXx2a0ZioaOraX116LnLR+LGBp/B8/ogUrexl+Dzj
	nsqvhRMk6/HEaNmMf42qNxnIw4HEc2v4ulsQA+bUb+CiiVKH0HwuUYhoBghwKoYdu85nn2IYPnZ
	CzltjgmOfmXxSQO6LL4X+c0cKkRy7jfzGdsHr+uM2GiP4/GW44r0eubsMiuJCACVSj0CZH6ywUb
	Y09m+vvxDhx7bC2OU0z65rwtfN3+6vHYDMnIuNf55uSNFhijMrcQeL9TP5qiRgOBxsE0=
X-Received: by 2002:a05:620a:1a24:b0:8b2:1f04:f8b with SMTP id af79cd13be357-8b341d19712mr2153434485a.6.1764240918287;
        Thu, 27 Nov 2025 02:55:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAINkQldET4/FL4YwiT5PaRN8/2dvHPKux6iQuu+XVvy/67Et+F4hY8Vw6Tycdb48e79a8UQ==
X-Received: by 2002:a05:620a:1a24:b0:8b2:1f04:f8b with SMTP id af79cd13be357-8b341d19712mr2153431785a.6.1764240917827;
        Thu, 27 Nov 2025 02:55:17 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f4d533f2sm137904666b.0.2025.11.27.02.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:55:17 -0800 (PST)
Message-ID: <bcc61dc3-80ab-4ac4-b9a5-7fc42cff9ab5@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 11:55:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Clear ASPM L0s CAP for MSM8996 SoC
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        bhelgaas@google.com
Cc: robh@kernel.org, linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251126081718.8239-1-mani@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251126081718.8239-1-mani@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kKAN89AINWGnwm8BYems2oet8T9oG3ZA
X-Authority-Analysis: v=2.4 cv=PYPyRyhd c=1 sm=1 tr=0 ts=69282e16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=69A4WOKrWbd8LYLoJcoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4MCBTYWx0ZWRfX1hWNWp5STj8N
 CvntS0dASJgGq2d7tDaXw4L+drcXBtt5cY8Zie2lTNm/Ikgcd2/0+zsGI40ENrdkW6PCgcDw8OK
 eE1Xtpxd5BG4CCiwZGUuow/7WW522xGAv1s3qwp5Ymuj+B4hqd9M60bF46P8bjjQILq302SHdo8
 gwIE8EXFEH1ST1+g4tizSD3DGK+vMWotM/GO7od2R70tO+gVm2gNfkGloCXAjHMOBtsA5lhrYLC
 MadRWVV8WhDeL6eejG1Pud8IPmtJ3DSMAd3gXv2YA5Napjc1PEC5X19hofKMPJn2Awrdhfp2+Rj
 DSBeECx19eI602hG2px02QuX197VooaQJ9viDquU2GxXT0dPsOxVLJq7bOoeetAa0yAXdeaCJs/
 N3TqAy2MXJ00uPGwXtmg8suBw5LAow==
X-Proofpoint-GUID: kKAN89AINWGnwm8BYems2oet8T9oG3ZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270080

On 11/26/25 9:17 AM, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Though I couldn't confirm the ASPM L0s support with the Qcom hardware team,
> bug report from Dmitry suggests that L0s is broken on this legacy SoC.
> Hence, clear the L0s CAP for the Root Ports in this SoC.

FWIW if we trust the downstream DT, we have this hunk:

arch/arm64/boot/dts/qcom/msm8996.dtsi
1431:           qcom,l1-supported;
1432:           qcom,l1ss-supported;
1586:           qcom,l1-supported;
1587:           qcom,l1ss-supported;
1739:           qcom,l1-supported;
1740:           qcom,l1ss-supported;

But also funnily enough, msm8996auto boards specifically manually
do a /delete-property/ on those..

(there exists one 'qcom,l0s-supported', but it's NOT set for 8996, 98,
or 845)

On msm-4.14, this became "qcom,no-l0s/l1/l1ss-supported". This forbids L0s
on at least 8150 and 8250.

Later, both hosts on SM8350 and SM8450-PCIe0 (not 1) forbid L0s.

SM8350-PCIe0 sets 'qcom,l1ss-sleep-disable' which influences some RPMh
things, but also prevents some clock ops wrt the CLKREF source

There's probably more platforms affected, this was a quick grep.

Konrad

