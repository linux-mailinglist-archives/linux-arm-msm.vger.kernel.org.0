Return-Path: <linux-arm-msm+bounces-84560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 161B5CAA077
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 05:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2B6830A9565
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 04:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A55F27FB05;
	Sat,  6 Dec 2025 04:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NKSNEV2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAzcGU0m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9E71DD9AD
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 04:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764994386; cv=none; b=L8g9SClya/ImMywJEyns4Ges/2csw+au7lkoaX7PA1sSwRaGUPe3tDEF8ghCGSgJ7G88Ai3kkHILGUGE+Ahf2oT+wijsuD6v1RJ4qKkWvoO28NMjHxqZxpabhe4lhBo7NAwIghQTj5PG+Q2r/Sj1aevLgqXpniBLwli+hk6MFuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764994386; c=relaxed/simple;
	bh=CI9OQmR6bO6fBvEL7pAivSNsXX1RDFYeu9p0jLmq0BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4o6ndI3HQNvE38W2n5zFlJGhRmwuAVMOvxrfu7c/QN7hjkNQE5fJWos87mYpdXD3T695gj/vIkDBK66joUGc06U1TRA8vQIqx9wlFDBQspMuS0F5q+zmfcdM4APHdXsRZj8bXJ6FGNOCFPz8si3osk+67oQhAq3NZz0EitlAMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NKSNEV2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAzcGU0m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B63V4jD2401128
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 04:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tpDwo3AVFEqyo8uW2zQ2fAN5
	CJka0mLD3vVFUxIz6Og=; b=NKSNEV2sPW/NLZtegux03RPcUB7WqOXPXJwnqVh6
	NTx5LrFkEIpN1fpObwbVlyv8atVfIccyswvVv/fFmDUxBHWVw41P77kHAnmDgjc5
	U58G+ymvzAcY7oft2+LqPIBcbs6ktwmgTKLxZ+q3IQ7hqZobOrLMDxAHYusmzPFM
	r4Irb+SP5FSnF/rIJgOW52hv3hMpXlPAYDZX6ZDJDvmuLCM8aAYuT8ddzXrjGgDO
	akKPhIPpRM0fysBZggJQH3/8yphmo8yoSHXvAkAJlBPuGK15Tzf7jAw5odn6gPDh
	1STmBUwXgyv+Yww5UTuRp95/0FqHe3ZG9JScb2WRgmdo0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcndr1xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 04:13:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2d2c91215so626326385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764994382; x=1765599182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tpDwo3AVFEqyo8uW2zQ2fAN5CJka0mLD3vVFUxIz6Og=;
        b=DAzcGU0mIm9H6v8DCORQfhQx8g3++mQtl+vVJPEgbf+Z+vf+ea4zHouVXd3SSxe6ZU
         MQAlA7NpYOWp8SrIv5scgaYKEjuCsJ9QG44HMy+w6qf7RXwOKEHE8eGYBbSMEA1Wz4JB
         wBGWXAZNeEZfvM504YqiTqmHxD3qaKm29tyUV3yvXUzLWpmjngBjY8EC8efDbRaxDRrq
         Src8nDPKKSP6QFp4dO9786PZ4xgxxfm1a6eYXZToqLDXT8xQ7S9dE0H0mszitp8HjkCm
         kJpHeSbw/GXTuZ698o6xgzmML+L1XBVrtfUmckWa3CJET99u1yXmnAvr8fPFuEbLcdO1
         y6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764994382; x=1765599182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpDwo3AVFEqyo8uW2zQ2fAN5CJka0mLD3vVFUxIz6Og=;
        b=miyqpUJrzXwSLOEmma6gn+yq32jDJbsge1vsuEukhrF6Bm/7rBdpqhWtuS2fBgzNy6
         sM3srpINXhmUxSDMn+1poLvg+AEHZNQ/w+yv9qgQ/g1Da6f1OpPZfX6R/j+f3lZsc0xh
         Aw0v1FEUGk7nvTcisB+A3Y5jh9I1Caftw4JEYFjmGv7uMCOp7nYSnYxni/C7XJ67uE0j
         2D0LHY6kvv2bAjdvmgZ2t3E1849VrGk6CONIm76bVwUAT1b3idPgce5Sp5QAa8/ABM/N
         oUkcrKg296cMED9mzCvNv8VSaTbZd2zubL0zWXlNx16TtxGg9HKuZ01GWj1ZFJFjc2lc
         0vbA==
X-Forwarded-Encrypted: i=1; AJvYcCXYwQKq4hvxmTEUt9VuH08q/dI+64RHfynU8kMHh4gOtxDMyYVuJimOGIe9NeCg0JSxw+WsFPL36P216+j6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqeim2ZDcy3aGxK0yNH2BLbz9gWhAknkE1xEHpJfTcTNp94shW
	8Swwa/ns5xY4BUNo424/cXrHsl1dUSMrDZWf+0k60A0/IP7/nm+Wz9K+0HohabJ+RKYNxvgN6AG
	spNgUKHxfMqDU34v2aIaeKawHJ43PZ+JqTAAUCTtuoPXyR/UIPewPM7hNug/DLLQSzMgg
X-Gm-Gg: ASbGncv/nGsbi/mXK4rqucfm2Ng+LMe9xW+8mUnbdQvv6G4qXaF9nOTlAFnW2XDveJw
	kG3vbxmzPa8kH06IQfhtaB/CBtHdN2q28KuKzJFJBqXM/f9fE3b8wml12s39B/CtxA5cNWYlL0V
	dS4wxKTaeL/Nf92wMUxkO8YVFG9Cyy5z559nEzjeEmEO2+CwTjHv05FZHWise8KJZd3WPxMYkjo
	PjsiCywV5o9dcblnJdYJFsXcSRfSjhWTR5xJuMu35/fc3ohatclkU8H4bCDULL9aUkCmZXAlyF8
	Izb4TIHIUoPjcAHNahOJvsJcfUCH9cmmc5qX3SPVrBlT+B2wB4xagWq33FmwJZW1ATSXtpCooTx
	bC6xIS7jJELfHt+Mz76sQrHqPSPbOMdpk0NFyVlH9JxORo8TpbJzdx/jsbK5FKfaMn4mnhhcgBt
	0ym9BiFTILJXAysbgOLXVSiEY=
X-Received: by 2002:a05:620a:17a3:b0:8a3:c4fa:9b58 with SMTP id af79cd13be357-8b6a233151dmr187946085a.10.1764994382329;
        Fri, 05 Dec 2025 20:13:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpJHsFQhad/ybeRaGffC96lG7VG9syusgSlhnLEPrgLX+czXrCbZ/KXbv8LjB8hKejgBvLOQ==
X-Received: by 2002:a05:620a:17a3:b0:8a3:c4fa:9b58 with SMTP id af79cd13be357-8b6a233151dmr187944085a.10.1764994381843;
        Fri, 05 Dec 2025 20:13:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70595fbcsm19441981fa.23.2025.12.05.20.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 20:13:00 -0800 (PST)
Date: Sat, 6 Dec 2025 06:12:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 2/7] i2c: qcom-cci: Add msm8953 compatible
Message-ID: <2xnqccipxskew4xmm2rmmjey7g46lu5lcnormgucoyjg6ch44m@deu4g37l4rcd>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
 <20251028-msm8953-cci-v2-2-b5f9f7135326@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-msm8953-cci-v2-2-b5f9f7135326@lucaweiss.eu>
X-Proofpoint-ORIG-GUID: 0Zc5aVGoIy1q8X4_w0l-eIREnfmwyt64
X-Authority-Analysis: v=2.4 cv=baJmkePB c=1 sm=1 tr=0 ts=6933ad4e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=dlmhaOwlAAAA:8 a=SfhF9SiZLXNrBiBhEFwA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=DZeXCJrVpAJBw65Qk4Ds:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: 0Zc5aVGoIy1q8X4_w0l-eIREnfmwyt64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAzMSBTYWx0ZWRfXySDI96NfDD7w
 CO9pIHjfj/2SlsuXpULNLeb9diz/mKTOj3ADq4VVYjWESrgq+rw+X4TcPZgVnjq8pPLPkqSu85A
 dNXvWD86oDbLsAtM4yjl7d5GfqcgBjFO8D9KcVuzuxgNyTIm+yWbzzXp+Lk0AQM2TibG7SQ3LBw
 jWsJkfSEb9A8LsW/oVetnH+d3S37PUIuiwUv8xA9tMlkRBXN4Sz9QJmyYfI7QMNbiNj5dKxytPR
 k4TDnedNEbVrQ2HaCqTXfSjubw+Ibh1fkpgeNNAP9MQwpl5AynojRguhYGCKaX4Rq4a54mHo9k/
 3mjxoV1MxJwQc8HeXPtP+a1yQCxinYTCOSbPRhLNKCKg3PfwVL8g8Ur1dJnTFHkhKaC9hnABhVQ
 NgC/RBY/7bT1kCzdo1eumteiuq4EeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060031

On Tue, Oct 28, 2025 at 05:40:47PM +0100, Luca Weiss wrote:
> Add a config for the v1.2.5 CCI found on msm8953 which has different
> values in .params compared to others already supported in the driver.
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 46 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

