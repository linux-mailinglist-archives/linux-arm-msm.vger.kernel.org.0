Return-Path: <linux-arm-msm+bounces-86386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC1FCDA14A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B74FB300FE02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAF82EB5A9;
	Tue, 23 Dec 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ea8i3MY8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YEikY/oO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448CB2D47E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766510398; cv=none; b=fHvvdZnNNwlxjhYZZv1uHPNWsjdyNmiwS8vnlkcGEyRI8u5VNvm3uiX8yszH+qkIVH0KuIbeSUw/1Zdl2Rr64XcfFi8zAAvUJdhr/2sd+KeCibpzRpTwFsp+9tzFsMGI9R6SxvGSHY9adYayaMny4fC/IqSFzTWPJUnpv+XVIXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766510398; c=relaxed/simple;
	bh=C1OMjNE1rZ/jPlnTlN+6hQ1VYATSUBei5WaxZmV8184=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NUO3sds2NhHWRFDL/Fe0xPNlj3Nkr0H/RqfUdKHSv2fC12shlYDKT7cbwbVxO/jYt6qrI5oPMKKsWUmgDpOJXh54fyszpYQdki9D7t36asa8anlVuyka0qCLOFS32p2s5EAi9ndjt2UAOsXEnqswtIO48ysgQhl2N7zXKy+gyz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ea8i3MY8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEikY/oO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNCQdVK1901934
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oi5KUJIs574ShB+gUaGqSOAx2WDzEm9uNz3ACfTW29g=; b=ea8i3MY8y1ekktpx
	Xe2oUhNAga4SZUck+DDWOEuHVQawgxreOF7dEB8tJR4ea1E+wq9Ft/DQmprL6YTt
	Qc7ymTq2yqPWRWakYT882Rd4oY0IwaNIs3Q7ISzO7rDM6e/0vZ4Af2zWVjmcYFE8
	VKZQQM0kB+yq/MrMpSR2onskNB/bVm+H2wT1oGSoPi8Tt4yB8eRS2JaLGKZqeOAd
	AqIUxXCl65ed6vFSIxo3zQ5bhghs5eDUf6CYtd0t/yQh3LGP0LsgBsTVsghGWoY8
	x9CVtTyg+eZ6iQFV07pxjzIuT7ANdLP+MmBQMg5KzA5F/wG2Osroy/fKTiGFmkPe
	7AZFHQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8ktyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:19:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee05927208so21202141cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766510394; x=1767115194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oi5KUJIs574ShB+gUaGqSOAx2WDzEm9uNz3ACfTW29g=;
        b=YEikY/oOdEcaSInbvIH/efK0AW46gJ0nmz+bIAFcjgFfemZo0tFvPeROQHp6DtfIte
         6p35/bMo92pNzE5tViohewRzP2VnTWS93cZFQPuPNnKgJHsNniy9oDA7cpQr8MiXmhKo
         //nxOwVYWi0kLrilF3asBPz7SyUvsN9p8vsFKsexKuz2TrHsnwwEUVEz0O/SaiSsHypa
         2yufHRI/iHaZN1+z8ddYVUcWS8hPGizoWskL91QtTDXlcnLOiMJWb507nvJ21BavyjJu
         PPm6HLYuU0d27u1AX70VQ/ujq8LMfjykmmoMoqZTqO1CbS9fVVrXJ9Jb4FfP5n093MYI
         cUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766510394; x=1767115194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oi5KUJIs574ShB+gUaGqSOAx2WDzEm9uNz3ACfTW29g=;
        b=pLDYq5VcKb3qR9YeqhA7YZ6F+XTmArqKRLdB90C9idun4XhqY1BJpsssJuV5Ay/HmN
         uFB8EKGGus6glTx4uwaR1DQHpPk+jHgL7Hy3a/ubVEoUWW23h2jXI60L5slUtwbwvhxN
         Lkh9w6gYWttFdOcixPOzoQH7K0zvcDTISPJZWp/hfgDHjVDfQwXGrzQmEcbf9VpvNkpk
         TTS2c00WtBArhetcHIRGC26/ehJii1w7GffRXU1tLFxK2qxjrRXq4++XF/vykPp2+S+m
         EU1Rtidux258SD/7Lzutf2yJhQx/qjhEIzroBduNp23nD0t/cxeUlW67d1yONFVQvrrc
         m7iA==
X-Forwarded-Encrypted: i=1; AJvYcCUPvpWhnq5K6dy3zEMKFiuB/rBQD+3dWgikFSTAZ9K7u2qJg44x+wygrca+rsKB+l9CdcnRozU6+uUt4n++@vger.kernel.org
X-Gm-Message-State: AOJu0YzCTJ+eAOQRvpa3kzwyLtJKL0ubG1rWlcW9xd4U5vOK6jMQBnsa
	S1ckHZNjytgxYUehCvU+3P52+vUtYXWI9ixt+SYwBF2gQUCzBizLCDdrHL2S8opMjwl9FZR19Lm
	Epi+IYtrO5F21tz+fHwp9BeMVQPx0rck11Ljn/IzVCy7aPvznvJfjhlBVAhxPSXtcV1qG
X-Gm-Gg: AY/fxX7dL7tZyOKwdxfOuc14PVtTp63na2fTcKoJMF6Ef0dx6JbCflDgnJPnaxDRWyZ
	Qyyf2YyK4DGNjniN+26V7NuvRNNCtqXrL4nLlVEflL56Z830APP5tDDPvx2zlZhTtk5IL8cWkA/
	XWeJZPrGmhuGFAHrAuuGlP2ll7xRwUvMFAbxpd72eQ/P29PwJm8eJJgNKOc4AR82SpyPpZpljtv
	RPYGnVuGYIZJMIWlz/Q5PRITituHl0xiM9MhjhBKbN2QE0uwlXGMaCtot8+Y/CImx0seNByWHyB
	A18/xlJBfpGlD668a4+wzN4apavTpiew0y8yBAHFJbSFdHNgEws3FFXrkHKYNUBrA+VfvxekDRG
	oE9w+RhH11NFY2WlRbCGKuUXletcZzLNY/YYzYm8s3PsbU1nz1a4apcfn9mRpIanclQ==
X-Received: by 2002:a05:622a:189c:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f4abccb8aamr166332411cf.1.1766510394244;
        Tue, 23 Dec 2025 09:19:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwlWom8ySpQnll7taE0C3O9UAKXozgi8TYToul7Y/+0lazBOIpI26CjfU5F94UonTZypcKsA==
X-Received: by 2002:a05:622a:189c:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f4abccb8aamr166332011cf.1.1766510393847;
        Tue, 23 Dec 2025 09:19:53 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de11e5sm1438806566b.39.2025.12.23.09.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 09:19:53 -0800 (PST)
Message-ID: <700e0aa1-2ac1-4829-9469-0179511982e8@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 18:19:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: Add the APSS watchdog
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
 <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-2-fdfc6ba663e6@oss.qualcomm.com>
 <3fcd274f-2502-4b3b-8a39-daf5e1938bed@oss.qualcomm.com>
 <ms4r24li6bk3dvyjas5sor442jvkptz55yisdnaco6qdsyvsda@dt4lv3t366cg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ms4r24li6bk3dvyjas5sor442jvkptz55yisdnaco6qdsyvsda@dt4lv3t366cg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MyBTYWx0ZWRfXwmOt5hHEKhMa
 JTLxIAMQ5Pznawo1djPoNVcn4Bby8/c75vJoyBu8cJ4s6AHXCuk7s1fjGQE3UG4Jlcj1UuLiyEW
 7DwgoXJLRGX2JTXLJZiS/B8n8HWTGSbf3RmSKCJZI3HbGBi5M7xxh3hwKykggx7yslD/JR9y5o7
 JT7xgfRwHxq4LSQB2kdGljABcXLDhALTrMT/eWIiTicU5VoTFxxown/jTCZSXmq5cc1cxaXGPaL
 JGjvvxCTuoJxxqvdq60501E4/H0wRMNwUCGDAoncg0oEyx5/DnPgXrYqVHrpnEXCCORNLioxRot
 eMNqFDAUziFGZGB0LAVJzFokrUkuvpdAbCGAbmGzwA/p4Wh04w6Y7heEi8PxaMg167WfT3dFacU
 j1ZqCasaTYREzpdLIBYFyaIthCqwbTZmpxQjwadVfG053xPXeXK3VHQzNUEU+U3HMQefs32Ktfj
 zVba/U3AHxGvqUZxEhQ==
X-Proofpoint-GUID: 0gZoLIBk3ogqymkK5d0ZGSn64HSiiYel
X-Proofpoint-ORIG-GUID: 0gZoLIBk3ogqymkK5d0ZGSn64HSiiYel
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694acf3b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Oi0r6S5fsAI7zfWUd3sA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230143

On 12/23/25 5:00 PM, Abel Vesa wrote:
> On 25-12-19 13:15:00, Konrad Dybcio wrote:
>> On 12/19/25 11:00 AM, Abel Vesa wrote:
>>> The watchdog support in EL1 is SBSA compliant, handled by Gunyah
>>> hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
>>> block, same as older platforms. So describe the APSS WDT node and mark
>>> it as reserved, as it will only be enabled in EL2 overlay.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> index a17900eacb20..b65dfad71c2f 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> @@ -8302,6 +8302,14 @@ gic_its: msi-controller@17040000 {
>>>  			};
>>>  		};
>>>  
>>> +		apss_watchdog: watchdog@17410000 {
>>> +			compatible = "qcom,apss-wdt-x1e80100", "qcom,kpss-wdt";
>>> +			reg = <0x0 0x17410000 0x0 0x1000>;
>>> +			clocks = <&sleep_clk>;
>>> +			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>>> +			status = "reserved"; /* Accessible in EL2 only */
>>
>> This is technically incorrect - it's not accessible if Gunyah is
>> present, which is only somewhat related - if you run a different
>> hypervisor which doesn't explicitly block access to this region, you
>> can still access it even though Linux may be running at EL1
> 
> Fair enough. But in the case where you have a different hypervisor,
> I guess the EL2 dtso should be used.
> 
> So, since AFAIK all devices come with Gunyah by default, it makes sense
> to mark it as reserved (or disable it otherwise) and then enable it in EL2
> dtso.

I'm just stingy about the wording. Perhaps:

status = "reserved"; /* Reserved by Gunyah */

?

The patch looks good otherwise

Konrad

