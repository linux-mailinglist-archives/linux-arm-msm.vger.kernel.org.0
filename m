Return-Path: <linux-arm-msm+bounces-87102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6938CEBE61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 13:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B29A300A3E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B053126AD;
	Wed, 31 Dec 2025 12:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dETWGwMe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzC84GKC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBB1320CC2
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767182855; cv=none; b=oervYmJxFmrjaVOp8wMH/8pOHLzXgq/YulLXgku3TUN2EWjQ9H7f4c3qjymqJ8fuUh+bDBI0u06sO8ES9ixRiu96yv97HcAE9+9sASCRJTYh1QovEsAQGaOl05xwDwTgXVuSsvm+5cKlvS3FH2Cu/JZTD05bTuhP3XA/jVlAyWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767182855; c=relaxed/simple;
	bh=Ebrj7FgOfGB4Y+kPltqSMdTk435gtaE4KgDy3ASxAFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lu9PYLUmo4GpJiE2xHZ4MlXK2N7tdRjIB4Owk6cRBT5KvK4M4cudpl30CKkI7AH2em8r/rVnLV1WET0pyKhyFjwf1mkUXb/5cWG+C4jCIRAUmHAGc4U7R56OPThvlFv6n109AqmS3Yku7Bsk0eG5UIxSROWpo2Qp2QQ2yMMHnas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dETWGwMe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzC84GKC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUNO9jr2618396
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xwd9J0/7DDL1t+C6kRTwUe2pr4UfwNnjK2TEMmjygUs=; b=dETWGwMe+maDJg6A
	KDCiCIlf8zfgCwNkm9P7ZPfLfB8pjwsjQZCu5L8egpOH9A7Ibj4MC6n+AlTz8coH
	NmxWKy8OCzm0S255KkAUgQVB4BYolcMKmPzDKCZf1qXyU3V6izUp8N4R1BEgnJp1
	5rlyyVJJBycsVzhiae1bMuDl70A4bcQP7/2F/vwTnHfB7cI6Dy7Pixv8mHXOJNrW
	nlfCfcIRMoDSrYYrpEWWvKEXRLFrK660ApFarqXIXIDbzTpfatbXur/sheoWT+jf
	wr+n/9uaKBVHUSsfLiS9OxHHZbwKYjeqkTYiBoYeVMtNY0/7Zzho8vZAQesQsD9U
	1Dq69g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gvcfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:07:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee05927208so47704071cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767182851; x=1767787651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xwd9J0/7DDL1t+C6kRTwUe2pr4UfwNnjK2TEMmjygUs=;
        b=DzC84GKCoUZBtMLrR8TABwP3YSCdkgvv+fKWgm+ObOMMHsxtBbk3cn6Eo/qvGbQYDs
         6L6LIFNoAtLANQVgwwChZrz64sSVBBIL1FD2FGLE0A42dffHOj3CkR26ZJ2mVJpPpSuJ
         wsBNC/X1Pp1yvL32YYnsD/AZyWs+OMoFF5aPYVELLZNxrKYxPzl0ljIeXkZWn4e7HiK1
         rTtK8ijOQPBp9zouHSrThns2mHNEhajRKHbfGORYUlP/m+l1N9kSC4XL+Jom81+h4ia9
         hpt+mabGgAaNumEAjc1DMy7DAgmZE54oWL0vOmtLhfOO/umW8/5JYV4t3IHZN6fyTPvz
         38cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767182851; x=1767787651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xwd9J0/7DDL1t+C6kRTwUe2pr4UfwNnjK2TEMmjygUs=;
        b=ldchZFabOok04JQP/B23uJ0xEP+X7FTAfqCyWdZogIgryifOqESoamsl96UsFYntNS
         xhNw5durIyrD+im8N2xAUXD3pnlXJ5fBYf/s/6qeHXnahHobUqQf0RcpnG9PF3FerpOW
         hHogCWre0iPOgdijZ/PsL9FOZgYbzz3Mnv2w+9jCb6qIPhB9HXGWKR8BBvOxirmQ9WY2
         e1D/hJTm8LLtA/kWdWN7TeuRWRS5oWmo8PM86yA0M5qzm6qxpMUZl+6i2OkI3laeI/+3
         U9htueY9eFEnl2uL8x8M8RfcBXRPzf7vv3M5LsNNz8VZ123KRCOuWD+vsKg0u1h+NE9D
         CS0Q==
X-Gm-Message-State: AOJu0YxxeAgt9uCXc2xvyjT21EI38sTXEwT3bzAtDw+m9NSC24yeU2cx
	GPrkRRUmgSidKf4I6gjhTyhDgm4RM6v/M+kZ3HFKFJ7YImuJUiqJ1qzt4XBdjHhjomPTlUnszU7
	9Ie/f0YnnjySUWxTDzXeN6cy2NoNOadI/jb+YfBjZMCzo80RfrG8ZU4sPdfcdfvXpVPch
X-Gm-Gg: AY/fxX4yb3dySXIild5w/4I41MqIz7XcmvbHoJP/0aZj5Y543RiE3JG4TOYLQb1qQS/
	PNObxtd9Nn9sSITFs6eCaU/iaoiWzJrqlH6m2KhS8Yju8PqZwfXkfx0rshv0gr6PsDgC/9Dvme4
	oBQNzlJGN66T1SSMYcB+qKgD6L5CcZxmyU9CcggznTEh2nJ1OSVgNOD/d3w4MxVDBZ7sTIQ9DZG
	6bELQR9dcg+XtynZtmpZKrL6TjadRR9vm+aRSBNJCquW64ygVzMerF9xK/ZF37KvfiUFmgbqVfU
	fS8D5Iu2ktmDnYe3exWnfDSwAa1qoGSm65iTE/R2ED2UwU2fOGVhTXPvxkjn/Fm+MXZOzwgi3YH
	vq02UaKPVzugioI/YbbEGGUblbBvbRmywdFd5e1rkN8+F/q0UWiZcaAZECa523Fdkzg==
X-Received: by 2002:a05:622a:189c:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f4abccb8aamr395358681cf.1.1767182850785;
        Wed, 31 Dec 2025 04:07:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEECDEGzAJoOCl0rfUP6GBsO3KwpS8blNulJ+u+SXkREin+4W+m764nMSG1CDEYpWIXFGzjzQ==
X-Received: by 2002:a05:622a:189c:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f4abccb8aamr395358211cf.1.1767182850209;
        Wed, 31 Dec 2025 04:07:30 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f51a74sm4055637366b.63.2025.12.31.04.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:07:29 -0800 (PST)
Message-ID: <17211f57-0c25-4108-bdc9-50d0f96d3185@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:07:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ
 storm
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-6-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-6-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3XlW-Qbo7V8l3igkXK6l54npmE-cf7_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwNiBTYWx0ZWRfX6ptEA3mF5TTC
 fVfLLQIqwU8ZEdSnLd9NT2aadfaar7AYE4YFdvPVsrhKz+lGwy3L9GYyoeY+ZMNhqYjRmo9NeG9
 1m/D+EtO/a4dvIJb+/a19jLqEayEg/y4T/Qjdn3uZgabyvfEydadypwv1UE7UewCwRJAcPsSTJp
 1npNrDfMRVaMaR+xIflwlnETgLJWcWF6wK5dRq7AmYKeY7QYhHWcJ5NH0vmiRJBS6sVZWk17XpN
 tnyit+Y+O212zyAS26GKuXa+ruu8WRYGt0pZth77lTzTd2VZyZFiLOP19ogsILpMo9+jePrCjtp
 2j5rkFy1ehEU3NGv96EICZ/IR2RC9cUdustlJQ5CnOx9KP3X6t7Ds+D1SkcGX0/zDFqV2+46MDs
 Vafja064vyfHmYdwP8NmKEg9gsipORFUl4J4X6/HQVKLf/paYVHn+oqANHahUYCIcEVD2KN9EKS
 lMxPZoioMYs5vaiQPhQ==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=69551203 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_BXXzmC4fWfZa3wPJs8A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 3XlW-Qbo7V8l3igkXK6l54npmE-cf7_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310106

On 12/31/25 12:35 AM, Dmitry Baryshkov wrote:
> Follow commit 9c92d36b0b1e ("arm64: dts: qcom: qrb2210-rb1: Fix UART3
> wakeup IRQ storm") and apply the similar fix to the RB2 platform.
> 
> Having RX / TX pins as pull up and wakup interrupt as high-level
> triggered generates an interrupt storm when trying to suspend the
> device. Avoid the storm by using the falling edge trigger (as all other
> platforms do).
> 
> Fixes: cab60b166575 ("arm64: dts: qcom: qrb4210-rb2: Enable bluetooth")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

