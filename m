Return-Path: <linux-arm-msm+bounces-86198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14109CD5BE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 12:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8467300F737
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F1132D7F9;
	Mon, 22 Dec 2025 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EC9x/eFh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDDmqV0D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2009F32E123
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398455; cv=none; b=AQK+RbWdwEfq+Jv2NFDb8jaMQ5d7GZI5FJLlQNgWE94inNPdeI/gTcm0JeeeFnN+8FrxdiyyymbhjQ2//0yy7BFiyCVt2XpGIbFGhcMv2wFxThlPXx7k+4ayZFynYUEjp+sqIiSUKeF107brHVer2nXmf+bHQwUGRCRJis/fqyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398455; c=relaxed/simple;
	bh=La/brog8yeZT41fAJUkpi2KYsALtGufhwQWZsXNYNas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrAuILjoClANnuuWiwWDDlaBSM19WgFnv4fOPrPikp+mp/XgWRUFap5Rqvflvv4iATiSOYhHgTbgL+H8VJmv4NGWdjYIT6XThXve30ec6kOxzI0E7c+Z/60QRF4QLfEcANkpoS0g2mNwmH/A2fZC9s26mgoGtutUjLb9gGWJoQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EC9x/eFh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDDmqV0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8GNp73503848
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3V9BlQkZLQipKWuaG8qu9blXB9mSR0ZfVvmqlvjHZJE=; b=EC9x/eFhqo3CQZ1/
	M+Mu6ztAmnwIKUed0FrzOWQe/tn4hgX0JrFpaz3BgZ2s5x/V+eaeBgHaIyjIbk4e
	eNlIjr/qgyGcvrAz1Lps6GqFKUqkEYAySpXncopbZWwi/DHrdZiGBQbOzTG1lDGq
	sBqvszwQcDfg+mScte6SeGjFER33g/fojAb1lj/jPdUfLPKrt68kKeHo4H5nyjcY
	ig/hlU3cPB8MW1p1tmwKhkHm61gXUcW0nw7z7rdYAM/oc0X3+jQNipUinjh4Rl2Q
	DikNUtTQeAgM9ez3lRNwKP0qBKehMwFshBf76hmj8okL2tSWXJ6+gV3PtiUYHPZ6
	3PrZLw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqmnmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:14:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f357ab5757so15963221cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766398452; x=1767003252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3V9BlQkZLQipKWuaG8qu9blXB9mSR0ZfVvmqlvjHZJE=;
        b=JDDmqV0Dbta7PHAeSRHjCR0vzFO3ohSLKpqPeEcc4JczODmrHJ21crTzZfYLCTbj9t
         FnqBuGqYV0s2pkEZ3AIjE68W0CI8jB7QCkhulLXYgwyZIHktOMalDjy3IejjzcwxpPLB
         +I36b4esBcCcNMs8YGFWMZNq+nAEBZIShKrijgrLbi+TPX4vwJdtmp7E1ZUrdTIoKa9l
         0hiDBFoqN0mg8UY9fY99ARRTEcxNVyUCfqhZgn7nHTP9DCnhpKY9QNSmmG+sXCkkiGL8
         pUJGsk9o91GQZPHLTizTFbaJOCeqWp9uTObCzJ4GZ/8dLszGdawM8JblxWfB85TG72Qi
         gdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398452; x=1767003252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3V9BlQkZLQipKWuaG8qu9blXB9mSR0ZfVvmqlvjHZJE=;
        b=ZzOh7zlyRnFRtTe8Z7gxPpBxQr9do/pltBAJS/oPa5EZb/dDp07K9pvjBYeo1HMddc
         TehnwvCxBXpnb9NorSOiTFJgzox7JXRhg2C63kpDs9vCppjFhEDuOBSOO4Hchx0bmhEB
         qeopEerIwV+rp4tJSw+79RWcEvkwGiq0xxSB9+HU6kco4cSvdGWPiTEbBTpiAw1N7qu9
         RzeaCh+dp/8nWToIR8pjvna3lUUJFDkH878867SbEYuTMQS7ZWJpd2wwlLfn3i9AWAgs
         XlTY/2mGgYuS4J5LW+Gk/x6mUd1bIMmtvH1sboF1d0ynfXPeZ0GI+Ga0HVVe0gE0KqZ9
         QFIA==
X-Gm-Message-State: AOJu0Yx04+Ji+3kzg/0CWemJncHtN8ngKsCN6BO4zvlI4DfyJOOZT3nN
	wgJVV6zIM6OgSaUXJkghXsu9CPn5uAdsLThOndoD1H67CffUWfr9Vwl8mxdWw97BPqN9GQKlOV2
	cklpRZlRG6GKyWptygV8EZbSzPlTotuc8lL7FahVvhiGsVbIFaYhqdXvXsBlNp9oUIDpl
X-Gm-Gg: AY/fxX4LImjbWOBgl5vwR3wN/GSsEvKzIeO81ouwKp0ZqF4diQBBEczHCfaS3ZjRqo9
	HjAshJXDyPsBjF3nq6B4BgJjnCF9yYaO+1agn3meudyaT2SfSKFcreu7d+kS/Wg9wW48aBKNS96
	/BA05llliKxKRmod09OMBKjPabOWI329MGd9Oafhv39qnAHiwCHZSHTAuJrPk8IYbxXOFelA7ew
	nF4omUcj/4iR5NPN9MwjoTp6Ooa3Gu6VDwV5qaVDcsQakslF7TsdtLdfZGWzGroMxsFhy9iqxIG
	bDZE9tGxfvL+o/Fcn07/DgQPLbt1+jHTsAYS8M9N2krCnOU5D5DXYGFBA2iOOSp2mPzsdJGLwbs
	i/4By5MkHbBBnSCT6AUF0mzTHq7puehSJDGa8lcCgB5sZCB8D/D2rv3CgSWYd2G/CRw==
X-Received: by 2002:ac8:7c49:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4f4abde36bemr116179881cf.10.1766398452451;
        Mon, 22 Dec 2025 02:14:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpUW/VkwoTMh2B420Zn5LwR/JNf5B3JEYqbroYu1Ar5nKTjpDAYc/M+WvypJlROlgMf697dQ==
X-Received: by 2002:ac8:7c49:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4f4abde36bemr116179621cf.10.1766398451958;
        Mon, 22 Dec 2025 02:14:11 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de1421sm1051847666b.41.2025.12.22.02.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:14:11 -0800 (PST)
Message-ID: <e9c484b3-5c4d-4013-9d62-83b3c7c61ff0@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:14:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater
 tuning parameters
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
 <20251219173108.2119296-4-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219173108.2119296-4-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7S22Up8sq2olHXLjXksCgvb6sIRbHk2f
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=694919f5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TQMmuo1XrLmmHmFwc4MA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 7S22Up8sq2olHXLjXksCgvb6sIRbHk2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MiBTYWx0ZWRfX8af7up7y8kHs
 8YFfqRTfy7mBP+kVRkgC5hCe1u7TEzXKW2FUixFSAfYkGl0ikALVzJZldZVIZ84ZAruqtnpQ6zR
 y4lT8XbvuTQKpfmR0cQWtuYJ3dgeuTIv7swICIFQIVVJXOn7HXnTKeuTx9awqP8Ryx4niA8YQe1
 hUbE53fGn7aoxsE0UDRiPcSpHIZs5SJl5rRab561USxnzqoae+kWNtXXXC2Jtc42KrzVFImH6kQ
 JWaTpiTYauY7bdq90MDVyumwymit33iJJA9WViH0chK+WDq8FfBpsTIT6dGaiTKlA2X2tC2bRGD
 aX0o9qhjFX4Xis310lNUasct3tH0+Jth/MnmwjQ2eUOTroQ0AK/TDD0b6tPpuzknU70jxwNRnKU
 VShVnzwBEADUZ5c2fVyVpjvgAagT5pMPDaW1uOo++7nouBgc0KbQGhVqiq6M6biEk9jvtW6v/0Q
 YBZYblPQeF9pGI4RqwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220092

On 12/19/25 6:31 PM, Krishna Kurapati wrote:
> Add eusb2 repeater tuning parameters for MTP platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

I don't see this override in the random downstream tag I opened,
but I assume you're adding this for a reason

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

