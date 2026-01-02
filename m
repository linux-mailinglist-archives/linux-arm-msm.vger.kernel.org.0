Return-Path: <linux-arm-msm+bounces-87224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0264DCEE697
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FC0C300091D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1288F1DE4DC;
	Fri,  2 Jan 2026 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHefxxyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f1V65wAt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994E730DEA6
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354328; cv=none; b=TZa97OYdHXYxs7GFc7UfaBE/LB7gojx2ahJbHu4zQEkstD1R6wWnkVPj+vVgZlrRG4oqqoVWWNslgsy26Xu8r/rInE9Kn7am7bmH9GrZlLq2W2YDPvNBvjBsSI2Xg6Oq32t3Vqua7AfI3o09BkHMYp20rgEb1CMo5rqDK/Kxsnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354328; c=relaxed/simple;
	bh=Lamw3DKXd+EDOviZ694M+MoTo/Zzuhu3p+ZsGdJlG3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCtNHr98hlUA6Osx+DFYCDwtIFrCvwsMF7BAEX417Hlrqwh1XhSaYeaV7P0KY/zQXf9svD3t8+YOVx1VeaQBDl6v85KPiQx+SPn++1ILs1mXJnbX04TmAwVtio8p+uPKCo2KDbRby1f8tXB/017TPfNCrk1u3OOpuzAGil+zT68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHefxxyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f1V65wAt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WRSW427885
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 11:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIO0EifCFwMkzSgGMHO+rCSEYMs7exKLpIp2wnkEVM0=; b=dHefxxywzlSevP0J
	7eFgtmERywp2yfD/gg8h9bG3eYaECvOT+/gAYoD/dkoFUMy2jeme2Ug4LMobT7oH
	xYKjCZTXM+DCtjmQMIb0++ySxvmhQJspuOVjutYvW4kMrMDUGNU4GynicWYcMg0k
	yYlkYPR0mPDHh9IFnsj3wAyfQq4RXA5zKhZXe9jBQB+iNO4e/1VUdIBGjQHbEFcf
	IxCyVNUvHMY1KBuPv1/KtsbWG62++s/U554ZEg2Xgu4ojuiCdZF4WqrDiWtOJwUg
	dS0gU1hFCAPdSPelF0DYjBykmW3Ws2d8zEpFithWVoQMiadx80W/1tIyGMN8J74g
	lVSYcw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjru8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 11:45:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a1383d3480so44433985ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 03:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767354326; x=1767959126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIO0EifCFwMkzSgGMHO+rCSEYMs7exKLpIp2wnkEVM0=;
        b=f1V65wAtj8LZ4+9nr0Nf3bz5D1UUbMSsEDKTIBgD2T9gYlNFm6i7+VMsiZv4YG0A9Y
         ZG3kxC53IVoYbU7LZBpxJRsK5b9fYwIii5RzKImmaY50TQDoWwbm7pK1l/v6gQpw42Z7
         MPiR7Z2psVz2LwN0kESgY5rCBYApzx7gHx+kmL/ncXax0aDCKqZw/foi8ZaUicQPS7XE
         YnkY2uN5rs57lAg1mbckMhWh4bOfqDAjlJGJclWBjBrvUDcAgriD8hl3Aeo1LxrJljA3
         3U9/Z+e+4M9fxoRDAIw3BMGDS+oObSGOCXm7lYmcCxSzre1YsEcMfyQDsCNJm4oQvHnY
         Ddxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354326; x=1767959126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIO0EifCFwMkzSgGMHO+rCSEYMs7exKLpIp2wnkEVM0=;
        b=nxEKyQxfemkwnq34LrDh356ek8jpTYOV2XtiPR4dEpUG/gJHm1RXjxqAB0tBY6frB9
         5Pz8S2IfhFskifrPjBs1OektcwaTngAXrnHkSq0kNztuV1ieGVjYpo6ezk+1RsUaZ7H3
         P7XAYHTpslOVVYRj9gSMX9hGir59foTiVd3rSE70HE+1q534xPgmM2gurW4ps83/walo
         gUZVLGP5hV+zrvQLNQT7SXmKxsEQHpDd9Uj10LpbEr2STA6oj+WLasnxpCIBiatb3Jxo
         expMILm/7/fp4aqp8/SvGydYxJNaTJ50hfUt1EE0DAHgOy0VEWhCkus1gXIoYOlbzpat
         aDhQ==
X-Gm-Message-State: AOJu0Yw/ciwSBjpJKcSuPNi+lIO7moctn1vzsjTIP9bFQEzH12f4nA69
	ZC0BrZI49f4q56XLQpCzooyx2qWyz7mRJBw5ElrLgpfBcwZHwUR36lnu5H30+Nlc6pGPTwQ78Js
	zbAfbYcRP70/kyPPnsXTzq7mAeyny7RCvXdHMsW1Y1fPFUW+XPCTYvMO3uhBW2XcDLEtqiEN6Ro
	Lb
X-Gm-Gg: AY/fxX4nP1RQHrzuiesWbDLiG1yqLtBTCrWzyDIKu1FoYLWA8qE4jKWqnqQCldc3T7s
	oNLCoGmS66F/XNKMmCmjoK6STbRN8LXS4DeFREz5QgpXXFYMStYDmwSskAryym5ZuPpXIYn5DYR
	G10dDsoHzTA99aGB6RUjU6g+uKtWKj5OIVJzM5eLB7pOF82sY/zPUJhhzPCSco2lh5NFzj1SfEW
	ruOlxZU3Qh4hu/afUrkGlhAqoQWbalYPhqI7aqmKBUPpAsWd3VZwpnz0V+P+jFUxhfDcJ2jyb+U
	UoIwC5TvavR+Pt2XAK6OgjqRKtw2aMA0rTHE0YuPk2su2svvzIPe/8HNuJizdTMcV2ve/9PUXr7
	0/mV7lpCt30rYS24MmrlgRxq6b6zlm3P/ecu3wy7OEmQ16ef6FCmIW7fzhogEJrRgog==
X-Received: by 2002:a05:6a00:94d1:b0:7ba:13f4:a992 with SMTP id d2e1a72fcca58-7ff67f507efmr25991215b3a.5.1767354325884;
        Fri, 02 Jan 2026 03:45:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqC7FQ6GbGdskiziKH9KoPRNUzbvPPHDM7UoIxaE7VEz2xVwqVZu1iN1rEGBXjnHPl0XojIw==
X-Received: by 2002:a05:622a:4d:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f4abd30b01mr485697951cf.4.1767353999041;
        Fri, 02 Jan 2026 03:39:59 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8350268f86sm2242554966b.16.2026.01.02.03.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 03:39:58 -0800 (PST)
Message-ID: <500313f1-51fd-450e-877e-e4626b7652bc@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 12:39:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
 <a42f963f-a869-4789-a353-e574ba22eca8@oss.qualcomm.com>
 <edca97aa-429e-4a6b-95a0-2a6dfe510ef2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <edca97aa-429e-4a6b-95a0-2a6dfe510ef2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=6957afd6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7LOYavHzeLgoFMqDmi4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: y7IkwCWXy-C2Bai2KeQHU4sj4ijDnvnp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEwMyBTYWx0ZWRfX8IThxcETBV+D
 7Tl1UJcMPHdVtxvy8SiaRMG6QyFeH+2U5PF/bcfqb7ox0gt71p38xqLz8A/yQthiPTgVxvt5rUA
 b1CNmzYsFqWGiWcWS8xUQt5PwuUllrwt4cJDXmZ+iqxaE81QFl7ykzyFaNgnqA2IDIoIBzXX6WO
 U/Hg9ONCD0thd2UeoOJ2JG4ZU6wF+QIviNjjPsyzGP/TAhgnqByH0itdmxn8ZOqyoPn/SHpja/c
 NH4Ed5cKzX8uFny9Dr/7MSCCMleLU9Tsw7CIFGNyXyE1iMCwmQCXIxs8S0LIvlOCOMJjC/zHtV6
 brE/Zwb0O9q02ZoVJdeNHKJKMgyJgaag8IYy95AgDPHcrAjfyXzwcE/C4qozFn+CXp/ZCcezfpY
 8gXwrFvqtcmYWP2rPT4+5HVsMU53MGA+y9MOXKa2e6Y1P6f6IVSfDjnlWAGWK/2fnmc0q2mTcO6
 ydaFvp3F7PBeXeFIJKQ==
X-Proofpoint-GUID: y7IkwCWXy-C2Bai2KeQHU4sj4ijDnvnp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020103

On 1/2/26 12:36 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 1/2/2026 5:04 PM, Konrad Dybcio wrote:
>> On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
>>> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
>>> can happen during scenarios such as system suspend and breaks the resume
>>> of PCIe controllers from suspend.
>> Isn't turning the GDSCs off what we want though? At least during system
>> suspend?
> If we are keeping link in D3cold it makes sense, but currently we are not keeping in D3cold
> so we don't expect them to get off.

Since we seem to be tackling that in parallel, it seems to make sense
that adding a mechanism to let the PCIe driver select "on" vs "ret" vs
"off" could be useful for us

FWIW I recall I could turn off the GDSCs on at least makena with the old
suspend patches and the controllers would come back to life afterwards

Konrad

