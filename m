Return-Path: <linux-arm-msm+bounces-80571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C027FC3A3FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 11:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CC1C3B8DBC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 10:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620B026B08F;
	Thu,  6 Nov 2025 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9JVmeRI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rs8BYo+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0129C2248B4
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762424463; cv=none; b=CWSe/ExwuLpGTWj/tpkp4/LONUEURqbvtjSfPbzm1Z2/4gjhSBc+VFt49/0anpHdv80dzKhhpxY3eFlH8QQjS5u+opzQ8gEKQJldHJisLveKzPKkZFxVSl1ezf4WP9Wky+PZoymjGIF2eOP4yL4VR67/VTYHHRJ1kW96ktWqaPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762424463; c=relaxed/simple;
	bh=SKE309P5vzD4pMZXWCw8nYg2/N22ncl9XP5vSSLO5no=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJ+4M7xPUGQsoD4KYkaC1iIG4+xORhhDCZ12djlciGtzWnSiZkEurkvgn3m40uOudeZZ6IVgeaGEGtJ3tbxMmV9bUMVw5uYQMii/NfxwC7svesKZ0emBtgOFLq0CUDKVnWr9Pj6g9sBF3u4YoGbRyoneQr3Jk/0/kpgLT9nYIhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9JVmeRI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rs8BYo+s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A665QAe1688856
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 10:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WhBXZoFe7Hcg6gSpiw2G8HKPR5St1ckA/+z01wIesWw=; b=h9JVmeRIK90TZVFT
	QtK0eyuArJP2purjiK+4FDR/GrXg9NfJgjS1JEWicWYu9RMzMZC1Ru+qAHV12Kje
	ASAltgiyBYwv7RTF9IdzI7dNy0sXOTs9dM8exNOXygkRtiK01l1MTf7BK0aMWMpQ
	ufd3vcd0gRK9eXLYh2zu8bRF+VGheGRUa3UCKqbU5DA1vX+vHiJI0quBzweiPAKm
	hCOzj8bCqps4g8dn2IIHWp+vDNtQFuZHmmEocFeKZM8eiwT8xpkXihBivtsR+UzI
	GwMs+MFYzRdtGnX6Hd0x8jAHRvzghTZlh7zca2pAYla8vce6cOAVyCv3UV3MZKt2
	sC5JZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a88pjb6h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 10:21:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b196719e0fso22426985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 02:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762424460; x=1763029260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WhBXZoFe7Hcg6gSpiw2G8HKPR5St1ckA/+z01wIesWw=;
        b=Rs8BYo+sD72OJKdvyVQdakdm/KTbL44H36Q7s1sqwC+C2HDA8xkyOodt6Hb/vNIJrp
         bLLM5VBXNFCU6nt6u2w2ca4NS/GFYLh8E0bJGKoFWDkNzQgnPjrokNZRxtvtWcdUjduC
         5dQ2CXZ9UclbhKq4QRh28UzvWb78CE1iBQnrSXOCeo47FLdsc1lWihj8qg7alC3lAMF/
         CpDDK4z/ugfURQCd1oYxz0ni/lX6iaggNfzcKmaXo3tE40PeSiXaXLcs+qeptlVewkLc
         Up4R7qkTP2whhng9wcxxRBSq0R0uqNjQOj4RpXYNVPLt8Qagx0E4HPdV69YoOtmS3BhT
         f9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762424460; x=1763029260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WhBXZoFe7Hcg6gSpiw2G8HKPR5St1ckA/+z01wIesWw=;
        b=SqIlFFh4QCvSnVLPgrpYjU1euamFupOzwY7tmf6Dlxg0hrhDtfeYtS0RosRguO13Im
         CbaxXgFlAqI2hMX9hWeDni10IrPGp3kxBg9FFNZZTC4rYBT44C8hyxeQANuJn1pSHovF
         M8m9PN0gnCdBbG6HYyUn0292ZAT/tSyuzaZ3QYakVhndQz+FRoxQTJ3K2/lFwXoA7LIP
         KGAPXwgR9sIK/wyiN1NoqfF71tp/lzNX+lI1A4MN4o0v3auwk2ZRywn4PJJlTYY6rNJm
         wL9VglL5kibSlJHbalhYuG/aKdsSPvyduCuAmH7Y18E1pkmhdn7AtRy0D/1cXvvelIR7
         d7Aw==
X-Gm-Message-State: AOJu0Yxdvb9gtgw6qljyNmawD62x8z/ZFXuLpyfwXzi1KfA7V/iRRQlA
	t6+GvhzLkvZk7AHB+RFSTOMaVtihI09splU8YFjCwygnupfacqFvzL/u/hBDX510N52qbltZtT9
	2sTy1iHrfFOKPffEUQ4NtedshedLPUXA8Jy1muV6h90o7+c4sY7hDG8cTcJkVAIFUnROi
X-Gm-Gg: ASbGncvz5LmbacCVZTSV87bTk/GBiSxtxETr9fcMA0BZ60h7wikQHpFkDWmzahpkXSA
	9ycGZx5cq3Q0BkyAQeQ7I1vGF34CZouCRIhzMvvuhT86L8tq0cFgv3ljxpR6vQh5WbQEgnYCHeP
	6t1Q29jiNx1PuK9rgscVsmGEMJ9aD/aVLvCC17TJdv2nXGu+CfmsATvwrXluih3vVI62snAoLbz
	j/kJe9QR0kHqjNA8v3NHPwOiBfOlYCRZaBzXPhLpl6QBPcldTU/27381WQGwHvxNRJyn0a3nZbs
	J9swiRSnqeSTqZPgaKbvJe9eDZqDwXwbwqknP9vImTP/J1cKTbEiINudhtKtyYV0qPAqwVgYOLD
	BtrwPQw7uG5C9MHHo+R45UjaVMXKKco93jQjS53huSPa8vfPHod1jS/pf
X-Received: by 2002:a05:6214:1256:b0:880:4585:da69 with SMTP id 6a1803df08f44-88082f24070mr21110576d6.4.1762424460163;
        Thu, 06 Nov 2025 02:21:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGENdLTnbqe8qV6m3lzr0Uih0SmnxtZVhyQI6O0w4f6eSU5i0lI7OGbFbNFszMDE28ml7uXsw==
X-Received: by 2002:a05:6214:1256:b0:880:4585:da69 with SMTP id 6a1803df08f44-88082f24070mr21110446d6.4.1762424459673;
        Thu, 06 Nov 2025 02:20:59 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7289683783sm176948466b.56.2025.11.06.02.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 02:20:58 -0800 (PST)
Message-ID: <3b4fb0f0-aba1-4396-9dc0-e470fdf253ad@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 11:20:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add device tree for TUXEDO Elite
 14 Gen1
To: Georg Gottleuber <ggo@tuxedocomputers.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
        stephan.gerhold@linaro.org, wse@tuxedocomputers.com, cs@tuxedo.de
References: <20251105154107.148187-1-ggo@tuxedocomputers.com>
 <20251105154107.148187-7-ggo@tuxedocomputers.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251105154107.148187-7-ggo@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d2ZEwiG79lM3FfK2tisQbfjxGAfx_W-u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA4MCBTYWx0ZWRfXzFbCTMDHLeOy
 5CJTM+/OHFqgR17OUnrRz7qIBp8328GUYlLIL+gTY/BR6cIDp5pBsANSA1oRjD1hQ4P0tb94BZT
 FSVo51dpF1Cu8ULEZa7ScEP8o/0wWpDi+D6/fy2mP23QlO9KA1PQrhPWgXnOaDrylHlTxMt1x7u
 cnXNUYV78MdyTJsg7LU4Uuzs+3RJ46BgUPHthATmR0FFeVAGD0VqCwSHlIRBiR8c3DBaWMq7PHp
 2s7UEXzn6BCVF5u+9Tpmxsy2xl4psWAskvoeglYvmwN4XxYV26xxw1oOzLr2vxqX6kDtBeUZbCi
 mp8K9uMX7qQZCJDzXBxS/DrjMZulJkr23GdDLlNrkUmpQzBIXScgIV3+46CwgB04bWtJ8KGI/oG
 eNRvRWdTnu1etKe7XZikJTjR2zauKw==
X-Proofpoint-ORIG-GUID: d2ZEwiG79lM3FfK2tisQbfjxGAfx_W-u
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=690c768d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mU-DN6NyoY7MWAXVNHAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060080

On 11/5/25 4:41 PM, Georg Gottleuber wrote:
> Initial support for TUXEDO Elite 14 Gen1 based on Qualcomm Snapdragon X
> Elite SoC (X1E78100).

[...]


> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {

'co'dec < 'cp'u

Konrad


