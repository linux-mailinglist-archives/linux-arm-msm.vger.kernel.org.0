Return-Path: <linux-arm-msm+bounces-89442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E16D336B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 17:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7A7C3084D00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB13342526;
	Fri, 16 Jan 2026 16:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LwtjwEOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHh3C0rE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A726ED5C
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580011; cv=none; b=ZL48hLTmyVb8Lk2Wlx2umbdvp17jDK0CEtbKi3R+DzaPo/SwPE8piypVXNczUkk/6v+XYnZLrMuk/KWd+iJDJsGv6NcGZEILJjeC9yUiMT+ayde6YIMQGrEiw5LTgmNDujGF3WhKIGXPoMf8Kxl4p8FtZGBOQgmA/37Ww9jPNvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580011; c=relaxed/simple;
	bh=h/E810/CTY1XFkPzarACCiq7c1ZDlBl33zyKw8u34j0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXjleBCw/XN5kE3XX4m6WhG+jhpoiBvOcHo0a7089DQe58EHaiqdR78p/qdfYBZXFs79PvpeDRudJHSz3zzwcpvtFw4Euaqr4HnNhS6A+ZQCKAlS2GLLhZ/FJw7WfZ9YbEbyrZj1efdyGaqUP1agEA1vpBKTnBPYXnhobT8RnO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LwtjwEOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHh3C0rE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8BYTF4015687
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OnISaKeZPEtPqspPW3GnAYb4
	P+w9H95p9ol9sk2Y1Ek=; b=LwtjwEOFF3xQE7pWnTpfjP1S3D667uIzgDEEzPe/
	Af0uXOUde99Yy9GCpztpYnlmfStTpt9QZO1Mi+l8ndWZV+G/UKbsvlyqa/QHk4WE
	MfQkOrnASq7DV6xw6szDvO0Ces7kwXZipO1cuHarDjTgTWdq1s2xKy5KslGoMs29
	bKYgaPCxprvGuLvcwVdeWPNxZP3HdG66/1d83we0hkDDVGYtQsJUcKujuA0MyOCS
	JPZT5Xcy8X3OwzJURMoTtpd9UBIyAvjSNvggSxqkKPkjVffAt7Hu+hsHMxVEe9R3
	5ooeVPvbyZZiHj5yftQTTS1Nizy6EOospBddKAKKXu1VHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98yar09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:13:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c53919fbfcso537026985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768580008; x=1769184808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OnISaKeZPEtPqspPW3GnAYb4P+w9H95p9ol9sk2Y1Ek=;
        b=KHh3C0rEnOgKC8CVZwUQ6DAZJ9SlPzK4ECv4xZdwbywIoxruXSH3c6OIjfOjdLg9FP
         Sn3da9O6ZJDI0Pu71vIQPEwQ1j2ifclzsETtx+I70L7TEHSwiRVGh0FisUmBvk4FxF/r
         2GRbQYjZDsU2lJm4NB2L/fhGF5LJoIpuJA0ghny0dy0xqc2q1/puIY+xVO0KxLrfBvOX
         eBbXPGfNrSrdoA/xwjmaZAYQRS8ipdj27wvlBON+IFaYLd3eLSul3OZgQQr29BOBxfZa
         qkM28tiIKB0Jn2ikJUa45lmF3MK5yAdD1E1IWbgHxuAUFO6AAOytswNVTDNnmZ09hbS8
         vodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580008; x=1769184808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnISaKeZPEtPqspPW3GnAYb4P+w9H95p9ol9sk2Y1Ek=;
        b=f7x0FUeuAOeeLhm09UlGgZm/eBIL1X4rvkOOpDqKUj2rZ9GTYj5vJlJ/rcsOOb92Rr
         A7qrREXNN/v1R4+yrLJxEc5Ie8gtpYhiPKYfhHtJGH8i7NawYVOBq2cLlbEK6BkYuZGx
         r40dDhZBFMVjS6+KayuuEYo6ftVbZ51BTENQiF2wS9DywVIXBS5F0Fe5DqBSux87ale4
         9eGSPxUyAMsz8KypOconMZXzb5vuUHjCTXz7QBNKTh4UOC0ZnGOjZ9Hb79cbYkDRD7rn
         KulEaq/6/kJ7kBsFypH5Osr2VUeF8OJCzX2XyT5x/XETiQGnNcwWRfyXlvx6ixJG4IM4
         hGwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjwOWAQ3DODrcdUAecFpoOwM0R2TQqWM3SbnnyGN3fix859QJ/iXaHcUmjJmaBPGQquM9coHJ9++4wUifh@vger.kernel.org
X-Gm-Message-State: AOJu0YwCrUirLvv7ngB3g5IbJoeYSzI7apGODC7oS0mCxMp9Pfhtkoo6
	nRiO8pO6NsMOePFjlPRjwqkW6BiAtlUyDyxKwL/jrx6S7Sj8X0bpyi+ptxbFEQw13I6EDvPwmir
	MUrdbZwUtEt8dPmg8nXjhDVEzMQWhdniy1gUkJE/GXxpoVZE7a+ztGMNWbp2iWdP7Umt7
X-Gm-Gg: AY/fxX7vX1afpkATFFoVT0m4VzaDWyrdbfneBvhT7mRGt5PRnpSaUKbgXMuqNSNHvEB
	L52lnvsVWBRW7NMAC/Gyi5zbk0SIA9rWyT4QYTuiNBIaSEMW4oakMoZAWYgLCo2HPH4Yq0RbD6F
	U3mHruOlFx2pTE9G0XVsqlPHEf3QRPhz1K2aA1gJI4niT00b4gHDL6XYIbHFAxLpDp39kAvlMEO
	S3kZjuliQisjO632RREzBNMLR5Q8KNEdWsuOUn2Ex0oUtR9evfD31mFh6NCZngSDathSRFZVJ3q
	4TnP95ZU5gj3Eu/mdy8NA251yZQF5ohG6WTHVWLAi+G0woW/r2OkgskvsbUhYimQyqvHQc2/3hK
	dpVmZhbfhR/ti2TwQZr4EE95JyZZkCY8DhTHHDpFJQC3rKwga/5GRGmVaR/DTvm3zn1uLRBifvg
	OvhXGZDGn6BN/Lnf/LXnk/uuQ=
X-Received: by 2002:a05:620a:404d:b0:85e:24c3:a612 with SMTP id af79cd13be357-8c6a66e4bcdmr468242685a.32.1768580006786;
        Fri, 16 Jan 2026 08:13:26 -0800 (PST)
X-Received: by 2002:a05:620a:404d:b0:85e:24c3:a612 with SMTP id af79cd13be357-8c6a66e4bcdmr468222785a.32.1768580004787;
        Fri, 16 Jan 2026 08:13:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976fcsm880180e87.65.2026.01.16.08.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:13:24 -0800 (PST)
Date: Fri, 16 Jan 2026 18:13:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] soc: qcom: pd-mapper: Add Milos compatible
Message-ID: <hwndiywr4x6tvqh4k6nxyfqf3cumrjhdcxtm4w7h7wxtsmucz6@f4yutm4kfkuq>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-1-27b4fbb77e9c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-1-27b4fbb77e9c@fairphone.com>
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=696a63a8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=zGNnDoXLyRuJOFJG0UgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 7qMX4N2jzfU5PvgbMCN3rBB-jB0U12Ji
X-Proofpoint-GUID: 7qMX4N2jzfU5PvgbMCN3rBB-jB0U12Ji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDExNyBTYWx0ZWRfX6aeHaawb4Fq1
 kybZmM5CatDxdqSgdrw6G+B2Ya61NNdLX3J3TPTP+u15OcWkmWbTjGalcxLlNYEcns1Lsb36nDF
 u/xNmeiJL4LtI/z9lHb6qZAU3zf8A1mBSW4j1iyhMKQCHmIlulo16l54lxv+mIL+S5TREeU+t7d
 yJ068HeDiYlYSEatfKzO+3kg+nKuHWfIhZDxOE63IaXQLefydc9njEOVZbXBsI1hNsDFQqtnQRX
 6FEimViV8Sp5w5NEEDGjec1HYhwW6+Ybl7cr5hQBw8FuY89r8T0yLbUArctW8ZUhJg8dHpKJmvW
 HsCnf9SwhLLj6929cZgvqBVWOsK4VFbJZ3pJXUKSOTTsuEMHa7IBnNs/ABVN84P/w/dZhx27vdE
 Gb5U7Jos9CDT00Q4VBbraDBX55GduhzhcnuG/5z4gsPWKrRgz+CBGUICOywQjc2Pg9ezGC/nF5W
 Q1gnRcslPdaRVgX9uvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160117

On Fri, Jan 16, 2026 at 03:50:47PM +0100, Luca Weiss wrote:
> Add support for the Qualcomm Milos SoC to the protection domain mapper.
> Milos shares the same protection domain configuration as SM8550, so
> reuse the existing SM8550 domain data.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

