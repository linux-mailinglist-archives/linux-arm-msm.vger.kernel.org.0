Return-Path: <linux-arm-msm+bounces-89794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C77D3C539
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2747C5A3D5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C87E3E9F9D;
	Tue, 20 Jan 2026 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SumFlsmg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qa94ikhd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5313E95B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904434; cv=none; b=L2B1F+NcuQE4rbGBE6vvOdFL1OFxb5MhT9rxSSmBX3+5mExK5WMWYWdm16XV3fQWcUUZrkM54KPuFP0YkduQuS8RqVUG4A79Ia+kao9/nPbGaRRPQX+u5p1u0TT/PKenCtqJghq2EIS7gXSX9TDfBtr2A9S1Uii3T0EytgxF8Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904434; c=relaxed/simple;
	bh=bSJbES5pqF7XxE3mRvHoHXslbCwJasW+SdiW4w8iBzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JnpcQGvuG/UsBbLfZkrTfdSU03O7mE0BNUKO6LQ3pgb+ljaM39xt3HLqf0TtKJjqyKTA5UFkzYhV2T+FhxFjUWn8k+ZQxOPScf1g6EtUpIkukqnkj6NK1lZzsvzkjOCxiIFtvGpAJDj2OGfY2gqQwBDZdAIAcGhrePrK39YwWDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SumFlsmg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qa94ikhd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KA1mi93807663
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSxIxX2ynBDeEf3sPU3u8qhtOsS03ktsjbhTV15qdlQ=; b=SumFlsmgv4xv7yjk
	PaVa6Sk23yGzj4Fvt1+2Us7Trg91jLTJsXQSh6HEGriHBf0w7ITLbkaNC87Pa9Il
	vWIuExwr0d3gwUn35xi+/u43CoAr1FOlxmwy9BPVa7EZKwUTerra24ddLrvXpaLN
	2GazU6c0Qe1Pram5ag/9pzeK9Dqa5Cj3b/SSWcIdCreL44Dt2Ig2qv3W3YiC93YP
	HJdZqV8OVbueXJcOlOvFnDeAW3gJgLdKz7JgJYVGvZ2no7Mg1XiEcVbiojipWotj
	UJezjyG/gEHsdKSjn05D0pf76Fp6y4bSnX8EiXtOjq2nK10s00ErAKma64LOzXxs
	igzHKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt1f897e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:20:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52de12a65so134582685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768904431; x=1769509231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSxIxX2ynBDeEf3sPU3u8qhtOsS03ktsjbhTV15qdlQ=;
        b=Qa94ikhdHaaYykjYMajffydu8JxJAT9wmn7Pla8Sa/l5I1AAChMU7n56W+a1Sf64G0
         TtKl76h2BXkXCJN8a9LP5nyNBzgCc0tb/D/pYwycQpyMyO91NMPdjYk9MP2OPkOpTfDv
         aQ1gSR1NI1S8+kQrrGveCV2eZMY9CLzzUA0q45M0WmJFNJHSF3gToujeldujb3t155+e
         Uy4i8gSmSlAINPxgfwEXdOutmyoM71Ve1UgE0sn7CAUP022S8L6K8uBr6osjKDtsJn3i
         v1FQVjoJjyqzaCmdLVkquNWOzcks711EXjBcRELBxOc9gCw+rh8ZBkVPvebm1NzC4zPF
         DRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904431; x=1769509231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSxIxX2ynBDeEf3sPU3u8qhtOsS03ktsjbhTV15qdlQ=;
        b=xPbh3ghHhnLGtM0Sxa9qd2rL2oCTdnTARb6Fyj1VSbTwf2DK7XXpggVp8ITMz8CO8h
         gvtABHFGWOEAoo+ktY9DhCFhusTk5xWW4rtgU9CBMCFzN+mXh0zhSWFosPZ+xlsRTk5E
         kbRiZKEkchsONillzYcPIpX8X2ZQSt3tZyrSq4IZksn7x4LNAWwjar/QRPz/sBcxvG+z
         8pll2SIUHoN/reYnXokFIoqpHetpn/Gy+qRed8OpYLsa5F8+jCauHyAH7AMb+d5eVxXz
         gq3wBxlKt6BhiqCwkY7OH+3ZDKFqcHW+Si1z/kHaqtjmigyEtpRHZxLkatGz/wwdkLU1
         AB3g==
X-Gm-Message-State: AOJu0YzdcT9aL6xYK+C5yDv4NDXTPgLuF1RBxI7ejfHlveApFUeJUPph
	vNKu9OLRBwReil40TCN+jGkHzl5L3EaNwP8umPQoLpgqckA1r5LNHgATiEf/nJX4aw/5jzMvx0A
	WAsZajM7ZrRdbX/nfgf0+HAYcwRq9sjCuoocmj+8a/HvqOK8L+VlNWZjH7Vvg9Xm2Kl5X
X-Gm-Gg: AY/fxX6mHsC7OaCoESwutHolV2iGj0E5kTwFCSlypozj26ADiR/oiZ+dsmUXRgXbbvd
	VU4CCJZC9YkzPnFEIzf03nfAKsPuTPh8HKP1zylCWi2ygNgeYXxj+OEm5uiSg+Kpb61ESBgChI9
	bRn0uMI2TLS89rgVyDq5DJvjVq3/b2UiordJhL8+cYc27/WCz/aKIFZmsE86z9kzpQCjQMn+azF
	Ried7P+WXOgZuxU/67Qz65Aq0sayG0TC/VWeBzGG0pGlU6UIjrSeLoErAh9cJSdJnidvQwaNLL5
	Lw8MMHHF9EDbukHVrJlm/Ivj4V95n09e2/DVtEDRUaG2b8cDY0urToZx75L8vchuTNoYrLE++yv
	kSQe6oaif3DaCrbRVdflSoWdCRDMRlpn6fzecQcWEvDQf5pMqHrdrwsNu7qWnsR0LgI8=
X-Received: by 2002:a05:620a:3186:b0:8c6:2539:dcda with SMTP id af79cd13be357-8c6ca3aa503mr254593185a.2.1768904431275;
        Tue, 20 Jan 2026 02:20:31 -0800 (PST)
X-Received: by 2002:a05:620a:3186:b0:8c6:2539:dcda with SMTP id af79cd13be357-8c6ca3aa503mr254590285a.2.1768904430752;
        Tue, 20 Jan 2026 02:20:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a192b6sm1354598566b.59.2026.01.20.02.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:20:29 -0800 (PST)
Message-ID: <c0d1c780-b90f-49f2-8cd8-e7e2f2e24752@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 11:20:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Correct
 uart instances
To: petr.hodina@protonmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com>
 <20260119-akatsuki-uart-v1-1-238f4da4fa56@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-akatsuki-uart-v1-1-238f4da4fa56@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NiBTYWx0ZWRfX6bMisEIeguuq
 eSpkRK7H69onbORx80rRqu+d4qsLvoOdY6aSLs/FJEcTMJTd5k0h1rBV63ZcdoqwGACCZJTZ11J
 5p+Y3KJg9ymCnxf3zYc6WZ2fY2elRkAxJhPS8jNMzjQjz3jTrTiT9/XJWN6PDL+yi4dDosB31xF
 XLJaJHHbpyYvGa01YhQSK38+XcOTNVKZ4xuYppjGi6rUaHns82PajjIfntv+o5AMxgwndNJ9AAt
 XX8f0WIAUis7/1YSkATqpVblhI5nqGNnpzW2339FMX972bDUJqsLy/APdqRKSMKyXrb760qDSuf
 c5j/MVj3XZ5WG5KKeI+RwieSAqi2Oulby7iQu5pYB+shGgudCKyFfdo82DWPhamd6crrSMM6aGi
 8+BF1Kd1Obex1yTQ8BrGzQXHDFTFuLVYVaMP8jn1ecZI3ActExwrIR6aY5fmai61kUevx6FbWJw
 CAlQw9ZUYCn/b7cBYnA==
X-Proofpoint-GUID: oa6xPOM2u-nd0WPmh9SGiYgky91XJ3Le
X-Proofpoint-ORIG-GUID: oa6xPOM2u-nd0WPmh9SGiYgky91XJ3Le
X-Authority-Analysis: v=2.4 cv=LdQxKzfi c=1 sm=1 tr=0 ts=696f56f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8
 a=2ih4SPTeAa9FiNVnbewA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200086

On 1/19/26 12:58 PM, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Change the uart instances:
> - uart6 is for bluetooth
> - uart9 is for serial console (available on the uSD pinout)
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---

It would make sense to add a note why this is a useful change (i.e.
most OSes would probably assume serial0 is the console UART and
sending that to the bluetooth chip is no good)

With that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


