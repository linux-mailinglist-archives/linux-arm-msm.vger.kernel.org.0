Return-Path: <linux-arm-msm+bounces-85336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55815CC28FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 13:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C81B63022D36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 12:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EA2355802;
	Tue, 16 Dec 2025 12:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgRp9V1j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmhLe93j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23A33659E5
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887042; cv=none; b=p5wJ3ZgOnMhPfGL5V07IvSIfiSReQj8XOwA1qkeVUjfCnrMs7NzKKueMQKv8togzp8m7sEXtF/91wAN1Pjn1Ok8S3spA4+csYhrMUQe7vdT9hisrVguYV4uOzzgHdwE5wUjoohKxS3RsdwI4Ag8X3tYcZ88gy1MAQkkuq9NsAbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887042; c=relaxed/simple;
	bh=43+lAu4/5WmLdRsHNdpR7bsrhDMq2bxfywhBh5ZqLa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iG0VXlAGSkSFuHD9WakaASp1dIyTOTR+L8Z22rNtLTISjyfXGzEhj1Efh9k77G04J2e2nmi9CnDUpmmGuh4v5YCVx/CYKhFmqt/+S7lkpndA8RZxSH6zGDIlY/vvLgj6P+S8dlYvfn2TXk6n5Y1e7jrzYIQ2ODY3/OiImBb47ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgRp9V1j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmhLe93j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGB8eU43872258
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GTK982GZBp1GOR2TR2xUNEEQ8UbFyBdxOqqUYpfZow=; b=TgRp9V1jqvXgyh+c
	sje5tWDieAyC359I3DrQ5Oi8WmbCnzxelUTsShF8/sYkMl3f9TBrdjIOKozaDwVz
	xF9oazJOoWLldFq6QJnNVnMcaAnICg82F6VcdvhtGIuFPhXa+jIL701D5IhZRMd1
	XiA3H54UWaRBNtnAKaR8Ky76K31r9wpgUFCHmjlRsJ5zjaZArLsUJt6IGrd9/wdK
	zES5qOtAKbmBIsrxTqqoKdB9CZwLU6Z9p/8N/3ryWqubr9qfU2JzcJcJFEHNM1YV
	8yFP0yh0XrWwO24FaTxzDriW5EMzXKdefgJkejKwc0RhWCYM1eDRFK3oTCuR0xfc
	upwANw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b369w876n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:10:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1e17aa706so12209121cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765887039; x=1766491839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0GTK982GZBp1GOR2TR2xUNEEQ8UbFyBdxOqqUYpfZow=;
        b=bmhLe93jFGL/u6yU0s6eEoRNKrDA44/QA9xsD72PGA3wuv/fRrY2tHx2IQ4rHxLEpr
         u1xUqVj0j+pw8RssN62XZ1lAzGdGljCA6RhLHHielO+RgpYUMcy8yobMYA9UItcZPtKL
         TZf8A+dKNTWjrsuQM6VVm2VRfuvIxh6jTJrzD5mSIfoMWlm9E8DgZChIJltaiB0LLdK/
         ws9ztwA87v+myvZ0vzVF5147rI2PYVMvWxw5A0iNz6rMXZOZWspxzJZydRL55SdtSBLc
         vOGfG2TSJ/Y8uZlfO2BLS5f1sFpBXZGb7+9kZsPHS+HjDuW7/804QK8yoEmrdYIp9alf
         bRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887039; x=1766491839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GTK982GZBp1GOR2TR2xUNEEQ8UbFyBdxOqqUYpfZow=;
        b=fQi584RMtYIslgvn3eqyoiWBf7KjhEPivGfLhusGh8daXLE4AwXTgiKL7p4UkiN+tO
         MXyympk4nes4nkFkCmMPvu78EL1PUWlJxy54gBkPL0YtMTb/d7KVAhd5WSDHKWRWKJEY
         CO9ble1Xbk0ebvm7Kgx88lRTl8vQJ8dybKmsiUKZPpWROoAd1/8qLw7wINdMWqZ408JE
         BkNIPkrghNNg5NvG4/nG/QFOy8uu/Reo5QcJtMoYmONR27Ppw+1JICgcKOlzgeDvx2Jj
         0MUUPcBMcHOqs8AZyCZl1UVddzwLACFfOxdV3f3TXsQ4kMqx5O9db513dKovpmzZbyP5
         Ls6g==
X-Forwarded-Encrypted: i=1; AJvYcCVhDeCJjICJEl9gkRoOCGIp3Rbu7E4jiSNs179BkjnV4ZZHvLKmBky36A5ZPuHm6CfN5U1+3+1QbGs8p3ID@vger.kernel.org
X-Gm-Message-State: AOJu0YxQJIj0Y0HSgP1UTljD+A8KuFh+dzGvf/47IPMNCw9Kbv36wVfD
	JB2wzoos3rZIMBxe14rRjWKgHvjSZceXtiokPYhQ6+/LfMZGVeH7mCQmjQKXVaUMV/uGipM3nvO
	XetYuPPhNCAfTXFrUFqdP+lIUtV8kUBnIOpmiCVYC1xJLXnTWtir4oQ49fr0JCU+tG/qM
X-Gm-Gg: AY/fxX6j07+U7k/HcwX3CMV38Negb8wr/J/x3Pb1f4VAZQLksyfioXEqpsOJcXR1uTk
	lotA91EpU+cWpxkA+pkB0eJ9iQlaUIZ7Xg0NBekwjddA+WeOpUbIykh1Xn1ngSbgSdfcPyOcvEJ
	l7OVF97p/b8iVBiZMBfqEVCFDCgpW9hpa/5UfH6u1ueeWBBm4EnW0BxEIwcVuVc9ra1kSO7+bIv
	+r4qOCrvGJicW3pLqO7BMWpXwppinSZG+pNav8kN0g+yQN8qFhQvbcEjNtZJ1TU7KOsHH975Z+x
	bSdv2SxsLF+K1e8IonuMwhOn4IVPjCixmHUVf6iHSxtlLeuLkQOvEqZ2eFaV7LzYs++dChF4y8F
	DMIuRGyqwk9Klfa+wrKNgPg4UwEYEfTDAZqvMtRHi7baL8ampAU7HauIgITtOdqvxug==
X-Received: by 2002:a05:622a:1347:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f1d047bbb4mr152409481cf.1.1765887039192;
        Tue, 16 Dec 2025 04:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5SKyHqraDstQKYfG+VACVomM10/dBkE94VnGiSDuFI8KaBQVrShZgqcZyy8XV2Gy0HK5RbA==
X-Received: by 2002:a05:622a:1347:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f1d047bbb4mr152409101cf.1.1765887038712;
        Tue, 16 Dec 2025 04:10:38 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29bea0sm1682686566b.8.2025.12.16.04.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:10:38 -0800 (PST)
Message-ID: <8612c8f6-659d-475a-85e7-4049586a5962@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:10:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI
 pull-up
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
 <20251210-fp4-cam-prep-v1-4-0eacbff271ec@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251210-fp4-cam-prep-v1-4-0eacbff271ec@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d8sGsi3pl8WMNrNDdQtug2KMhMtTzazW
X-Proofpoint-ORIG-GUID: d8sGsi3pl8WMNrNDdQtug2KMhMtTzazW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMyBTYWx0ZWRfX2/pPUriXAGJA
 JqYx9UkMeLtjx36IIgb6cts1fYW9THu6cyXnpAru9K1m/xSsRJ8Wx20k0o3aGImR4prfnE6QCvb
 K81OZ9UzSGmdoSy9nWwXjqHj2iDNu4kcZXDxRCr9Z8i/yA1QRPtCs+5XsdF+Lqfek7mH/t3MLD0
 1ITyi3RfN0cfYDrvMWbuX0hCHc2KZ4yy6AnUocOdLfrAs26tKuxTTSWD9u3N7VfIq61zB6BzncA
 Rap27WNemWrrfqgyKEH/Ce8dW1s7yYmypqflRkn2JA5a6Hb+7l2u+OyCbDCn9M11oh0mg8L81EU
 Pb+fQIpZFttFiP05IGl7Ex7mDq5yUUMDgUqHs8giKLDz1mKuHh+dtPLNFyXilDfsnVgXSnHa+Og
 f/oQTzxpx66GgV6vqwn5QGeqykXijA==
X-Authority-Analysis: v=2.4 cv=MP5tWcZl c=1 sm=1 tr=0 ts=69414c3f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=BzSMFxQJ_lGk4zzpiGkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160103

On 12/10/25 2:05 AM, Luca Weiss wrote:
> Enable vreg_l6p, which is the voltage source for the pull-up resistor of
> the CCI busses.
> 
> This ensures that I2C communication works as expected.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

