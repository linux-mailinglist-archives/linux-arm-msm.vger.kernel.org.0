Return-Path: <linux-arm-msm+bounces-60989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79168AD57FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 16:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55FC23A4638
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 14:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E27288CB9;
	Wed, 11 Jun 2025 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJy/RFzt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CE4280A50
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650735; cv=none; b=NBVXuRtadCxLnxKsCnWO3BO3We/V8r2nGqQJD79SZX0qLziT8w/Y6Sl3X5J5v2PzYI48FLjyTxiZHLOLFdngfpsnk4cN84g6HCOXSK/O2MXHFrk2+zw5rmewYf6j8lR5tdSEXqH2dl1JKcilfFOAENv1rSzFVvi8E0uUawdy+SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650735; c=relaxed/simple;
	bh=6G9tui49Pl6t8FhP304AnRe5Leht2tjw78tlBb8NDg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBwkSvvNw/w0Aaa6muIuj2LTec/KwoV/dOu5MuJLvm8Q7Hl2ntl/9aIIshdh0RRNM6VXC0roa+lzyNPa3m9CK0Ihdjv8eDXnJAUIpyxPDFp6AJ5+BZfIbJXUQpWMKu1wdyygkMJ6pLCNN1rTEuBpsl5lKL2a0zCA/CviIyVtjZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJy/RFzt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DMK1029379
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Iob8U7YD7MEMiWqzIOI3EZ7da32JCzTnZeJI7FMOQk=; b=BJy/RFztREifvkwo
	DWm2CpYTJ1Y9NIR0hzC9mPX32l0eRoPB3zi/emMldy7IlVNIYsJWG9QlvtN32yEl
	VwhcOxnv4ayZJIhFOQ5K6PyRoBgFAWRd5b1nCtzQqGVcoscFDzytgglPtAU1FKdV
	vT6ftCHz48QWboVq12qi/dyeziUuAuFy44ShNiVa4MSSfsfeJ0PtZCEl/5nDUu0P
	nYoBFbwEI6loxQ6PVhqen974OBIm3BGQwFlvTmJDI8qenwva4RIsB+OQgpO0cAnf
	dTNB4A8VFy7ZAaeRbi/7L1zdRuDmMeiP4pzW0GAiRMaB8Uycp+DQ33oXpDO7a5ka
	V7R8Qw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6d5f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:05:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d094e04aa4so19111985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 07:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650732; x=1750255532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Iob8U7YD7MEMiWqzIOI3EZ7da32JCzTnZeJI7FMOQk=;
        b=FPJP+KCvR1jlInyQAD+1/CYhRYruyC34UikqjGVHyR5qf8GFacSy5RUdORQQjdOkYI
         GdAFDsG3EXEQBpVaVGL5HAPwtxuhZ1aeNZzRGneztdkzKAqw/j0OoZ4ozvv6snJ1WWsH
         MS7skoGzTlQREJ5BO5AhvXpc4TlzqH63wAgsZJ05hg37oOtyzbzMgh5SFXgJ7vzjT+H+
         CUrgSAh+U+NGtgHaxFXyszyjPTs+0CL82TAsMasj5e2LVxcj1wTSV+j3avn0aa0poUQV
         lpgsOWPgypkgbJdbvz1ctz1OdrRuo7PdG/6h31ZPT2sDdgOHnVfKf4U4+MpPTZb3avV/
         pxvw==
X-Forwarded-Encrypted: i=1; AJvYcCVR3C/8QMEmgxXVGKUsPavjU6Fu9qgyXKJf7HH375maQaO48exGZYphwfFsQydhaXaY2x0tF85Dt4qioR2F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3LKLAhCLePcyqJeVVOnOZT9epc6JHSZx9gknyCF+xXcbQAEng
	1rr7fyYX0+KLJo/gT+wvi0CoVqRL7DVet4rKWIboGX9BrnvUhwaZ9Z/ecTM+QQCphwR1ab8bFwl
	/GeoRIMu6GCqPBbuQcVAHH0GwyLqdZZDVqAELTa54tqhb+IujYf2ZY4x/evD9DbTbYrt8
X-Gm-Gg: ASbGncvqy4alIwPWb9HDqSc5zGZmnjgFSrXt1sTUDQGVBc0HtzF0yPMEhqzJRvZrIX1
	8HzL67igvGBAfM6J0/Dx7fkddPfPi8WptKzsRsxDkzW700eztphcp9hQW1ESb61yhemCbEpVm+C
	7uaK3ydZebbp1RWKHWiiqug06PJVyV21V6FpboE1mb6XH3uT/aT8mIUKXbBRr7S13MjsqGlvWB6
	bYbFBVbnpXMW6649YujFomkNji2wCeoFTSQHp7ENSbyq5mXNFNhlOwpArnuptcUodYGhgHYzP4P
	EklRQAHJ20ZcY/y8kVx+zY87ABg856Qrq06oj2XaCGu5Q5EqD3URWF4xtd6oVAEYD0nodGzFuQo
	RCrM=
X-Received: by 2002:a05:620a:40d3:b0:7d0:a1da:3a3f with SMTP id af79cd13be357-7d3a87bfca6mr202128285a.3.1749650731724;
        Wed, 11 Jun 2025 07:05:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsjWsY1cXUFTQcF+ifXByM9+WwgbDrztbt+NRy9N//FCfd4BglmorTmESm5A47wcPzSWX2Qw==
X-Received: by 2002:a05:620a:40d3:b0:7d0:a1da:3a3f with SMTP id af79cd13be357-7d3a87bfca6mr202126485a.3.1749650731259;
        Wed, 11 Jun 2025 07:05:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783e6728sm7502889a12.77.2025.06.11.07.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 07:05:30 -0700 (PDT)
Message-ID: <a848f4b3-43fd-4225-a2ef-9c1b29c3f306@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:05:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs615: disable the CTI device of
 the camera block
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250611030003.3801-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250611030003.3801-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDExOCBTYWx0ZWRfXyPoliCxitrA2
 iyfUkcVxRPLJVO05RVFy5JA5uYwH7Gq1ZxaMSWxaLOHDWk0F6seLAuk2OLncUqu47lUUjoBgESL
 VDsmCW+QbQfkedS0n87YBrrMH1sIiz3IrwCs9j22lncb207M9hdZnaE3EMkr6LPuMftz/2BEE2S
 AWq7xipGX1ZnlhEbagkzSumcZyu53zlqOOhrHJgsze1e5qaO3TYt9bquEao9UcNu/GwNF9Fu8e9
 jTNUk7ZCTMLE9FqmuAD8SF3bTnNvS5LCi38vX3zDNB6V/fxqN1VAuax5a9e5cZv5aFYqx33o9zU
 dNF4Cle0sLtvqoaN+S2UN4tXFR8Z/1OOA7g5OJGPn217CZ4tTHFXsSfo4DKtcwdep57wTcP4PkD
 AQAV5Z7VA9UXE5NTMcyKtOrXScFt8g0oK+t+ZSXdgNeVoYeFUfNgUgWrGGLTxwcqRLLAQq2+
X-Proofpoint-GUID: sDYQAOasnIthJ0jiJd5y9sTXDRiuCm84
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68498d2d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=22OTyeyB-Dq4f2GHltIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sDYQAOasnIthJ0jiJd5y9sTXDRiuCm84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=677 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110118

On 6/11/25 5:00 AM, Jie Gan wrote:
> Disable the CTI device of the camera block to prevent potential NoC errors
> during AMBA bus device matching.
> 
> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
> through a mailbox. However, the camera block resides outside the AP domain,
> meaning its QDSS clock cannot be controlled via aoss_qmp.
> 
> Fixes: bf469630552a ("arm64: dts: qcom: qcs615: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

