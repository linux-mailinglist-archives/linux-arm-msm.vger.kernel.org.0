Return-Path: <linux-arm-msm+bounces-64819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF31DB04033
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B83154A3873
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FDC242D6B;
	Mon, 14 Jul 2025 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oV8my4X+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2B61FBE8A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500152; cv=none; b=XAaM1LFfLWUEDa7qvO5LgyikWosjgn6OIOyKwKLEFRzOaNJHjPzbNjeUOokXRlsBPUzPoh6zljwWequ5FIRfz5+bhgIrvzscZCUN32f8ytfH+R5I2EOgmvrzpS0tmwCObrlGBiGTkBjN9svV9WlOq9mQmIsHb+gdGRtz2xNMm0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500152; c=relaxed/simple;
	bh=HX4HnZdbWWDzZBqTqjJWzyyZPowezPsUzhrBA2nh7tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgUdlHtKms0lrNVXo3bKhKQKmJ9wZSD3hr9MwoAzU+pVG+FhWzBus0Ofcx23NpzpC9qQvCMpZZbqr4PUOdAgcmslZCqBoJ4TCZf7vRz96y2LKfh40d+W5s+qWdTVO2hIY+7LTQsujeKqaPer+YApeMX4G3Rm1yU8E0Oo5fAJQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oV8my4X+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA2ojJ013407
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gtciRivL0hGQareYH+vHwh7auBC4PlZk5kqwLmKt2Y=; b=oV8my4X+12wuX5uR
	Udx9SzVvGQHxEPOCcn2P1pfhrowKYZziUEfTONNfGei7ecJYe/Hg8DgH2YKRK7i/
	5ZTFc1GkJMltahkqOYF/AcJPUQ+XVrZbQyqZVEuLFOeCg3jkDK3HrA0VyIBjG0so
	wlgZvgET0+/IyvndXjEEYXzNg936K147ZI0CXx2iQo7NoekKsHl0emfjai36fA6A
	/r44tTb/R19Wc1SgL7VLMjoL8zaCSQeoVHTQJrr8QOcAYIFkcEr8Fzm/Nzikx6Io
	i6DBsR/NCjhKgKRip06/bWp3UlXYB71acxBfW/h1itLnJLtTFVT7s8LaBJErDRf3
	iRn2/w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbcrsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:35:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7dea65840b8so35566885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752500134; x=1753104934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gtciRivL0hGQareYH+vHwh7auBC4PlZk5kqwLmKt2Y=;
        b=dbSlooWhmnPrR5g4NL22TNyG3X8StxA4Mn/GEavMjiReH0NDbdJjMFF2hlzbL+pl6M
         nM0LdxPtStdTgHE6oJibqEYIIZ7hdW+iq/17tFv3gU3QW8mZjf4/S9HPnaD7jmPxOM7s
         0/QqQKndOy+OGgq9I0OfEsNv2xpBnYzWn2KbmkOtHTfts1FAZqBbU2hNAViAqBkzg3g3
         mpbfBTDsoO7myccZPN2OxdhKptizYnfnuK/DLgMDyUWBxJSWGFWkHW5DzMQGi7mKL3Bf
         LumSLtBJ4ok3v10nfjEQGp6LcWFkyw5150q3DPe9FUcRozUw5sRAwpshG9iJXVxzTuYI
         6wAg==
X-Forwarded-Encrypted: i=1; AJvYcCXNNeWS/V6BgouftuJICduKilbqeLvz4DYpA384TJanZlzabtrZV85UlN83B4w3bFEE6Om7MnKAHo+Jwl0k@vger.kernel.org
X-Gm-Message-State: AOJu0YxdUKACBeJjsGlJHQT+7SxIv+o4Ed3L6+FQ5O0KGJ9sEH8MooUm
	DLyMBTMWROozKSC71lO6QnlpiaZLuW/2wEoJCHAbziinMG82YBU/YbCNqNfA0IVQvSk8jgrIHn8
	ovx9TANH7HUgDKRjrW+GLZE/Tq1qojNhEC8ebez4hnUyqtTOzE7o7g2DFEQpACGUnyQ7X
X-Gm-Gg: ASbGnctSFMRbN5BINgg9Qz4qQ2NGxDvcn0KJyHUa+XLOQKP7FnbmbB3JbhBFKjQiNP+
	mWgZN9CPuJJDpF1oYodfOGMRld5aWI1VnACh0wlTk+4wmC2qdfkfZfqSUJUjvmJEEgqMT/1Sqzk
	6pE8Sx1kGsUwrDCPvDJRdYlT8L9XFztuL+1xY8AU6IEdVXYgFA5HS6OzbP6vbIw/RINMqsx8uj1
	9msVyRcEKmf+jroHhms0YYXPRlBQJnRsCW8wHe/7Pb6+eX53ZPc8KH5g/tPXQ1XmktSS9dikTnT
	BRMBpGf00qoFmEmG33rnoV8IzX0sW2uKBCMksveUryb8TARRB0+mVHYdZkxsg6Pw/PMa4Bcw4Vs
	tr9/97wemsxP6vtUW3PcW
X-Received: by 2002:a05:620a:1a8a:b0:7e2:5349:7da1 with SMTP id af79cd13be357-7e253497f18mr211080285a.7.1752500133858;
        Mon, 14 Jul 2025 06:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHynt7mhZ223fLPVn7qb0shx37lKSNxcN3cADg/ymdAnLcvmVC6uNozrBQ1FGGm20vv8uErVA==
X-Received: by 2002:a05:620a:1a8a:b0:7e2:5349:7da1 with SMTP id af79cd13be357-7e253497f18mr211077885a.7.1752500133246;
        Mon, 14 Jul 2025 06:35:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90b09sm814711366b.25.2025.07.14.06.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 06:35:32 -0700 (PDT)
Message-ID: <301542db-2e0d-48ff-94d0-09acaa603ace@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 15:35:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Add support for Dell Inspiron
 7441 / Latitude 7455
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250706205723.9790-2-val@packett.cool>
 <20250706205723.9790-5-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250706205723.9790-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA4MCBTYWx0ZWRfX33aowI0wzFWM
 zVkT3NCDC8rjT7TCWgMLser1SqwzQULUqEgf22n34RPtRNvinEU1kJa4iVsLyho4iHvxwsYQlv8
 Rb9XVjIx5JPgseWPsihwBb0Y/napdhiuCFE6+ugySv6Cjx5kxbxYkejct+lV+Tt9uu8AL02eNF8
 kkGUc9wdclJ1+CCdqRl3U+5T+zhWn8Zm4tmcfDBjFaZt0x3AeicITB/l+x9XsQJgqk9er4ilqTa
 c8l1qOfdtOTEIS8eSq++IPe1Xx7ajZLe2BYPgHH7dnSoBuLwx3QIGlqO/BrAvaLJpkN9hbfjiDo
 Qje4nLj9HqxvJaRBCMYHJ47ZH+iC49V94WIx3HKwo/3J2iOb2CRNKLL7WvXUUR68Ol+N2tSw+ZA
 TQXVufAmpRM2asWPJlu7t2aTxtOmxxfequj4IOMV25+9zqY0lmmxm3B74KbEsyJkmTTOGIyn
X-Proofpoint-GUID: F2tQDSfgRKzmgrycEtL9tlcQMNr5a62N
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=687507b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=vswN9AVew7ZQbwbRgEAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: F2tQDSfgRKzmgrycEtL9tlcQMNr5a62N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140080

On 7/6/25 10:50 PM, Val Packett wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Add device trees for both SKUs of the X1E80100 Thena laptop:
> - Dell Latitude 7455
> - Dell Inspiron 14 Plus 7441
> 
> Works:
> - Wi-Fi (WCN7850 hw2.0)
> - Bluetooth
> - USB Type-C x2 (with DP alt mode)
> - USB Type-A
> - USB Fingerprint reader
> - eDP Display (with brightness)
> - NVMe
> - SDHC (microSD slot)
> - Keyboard
> - Touchpad
> - Touchscreen
> - Audio (4 Speakers, 2 DMICs, Combo Jack)
> - Battery
> 
> Not included:
> - Camera
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: Val Packett <val@packett.cool>
> Signed-off-by: Val Packett <val@packett.cool>
> ---

[...]

> +	wcd938x: audio-codec {
> +		compatible = "qcom,wcd9385-codec";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wcd_default>;

Please do:

property-n
property-names

consistently

[...]

> +&usb_mp_dwc3 {
> +	phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
> +	phy-names = "usb2-0", "usb3-0";
> +};

Let's not override this, so that the driver can still put the
remaining ones to sleep cleanly

Konrad

