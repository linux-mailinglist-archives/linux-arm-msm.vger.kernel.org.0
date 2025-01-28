Return-Path: <linux-arm-msm+bounces-46390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A49A20AE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 14:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11656160835
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 13:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC801A08A0;
	Tue, 28 Jan 2025 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPWSEeI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB7719D07B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738069392; cv=none; b=FBiByXAQdCDY5toNGVM/1BNmaF2dXgXDzPNRSiSQ6J2gGdA/wO8Oe2OLBu3x6/tBwYk0mSoHYoL34+zu6tZLwAJOXtiexzMrh3XLR/D8hU0HSN2g+zXrfL6vjtuVUTpBczMWyvasaCt7GupBs0yBTUPChniyDST+KZiYwwISF20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738069392; c=relaxed/simple;
	bh=CRNXz5Do8hA7wQ9Pp0drIPiIP/foc8Qd53Aqk3CTtys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1a0JEaw/a1crFP4064A8OIw7i156gvY+yoOhHteOjhBOy6mHyky/w8ckDY4tMMSiqkT+CWHX9SruBCGuwkr41DJdf2LBO4pblhDdCOfqHeOkZ/fuwW5vgfEleh2dTY9lLygAT9fOLwE5T3t/dbJr4V7vl50Se4cHgHVWwM4zzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPWSEeI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S1s3BJ032090
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SccPDJ7IsQUS8tZ1suiF0ums40XQ70V/e1OGN+43mpY=; b=dPWSEeI3rEX8iIWy
	7fCk6tLKHQ/pbbADIKDTnyUbFAQH7rcS1KFRNwBf95LxoLrshzw+oI/7ADr2kSGS
	TOk2cG8FKF4EjmgFtAmAAv+HR7j0LfKehPpZO4+ht4aLWGGiLVd96+6UPEQYG13K
	auRHGvCI5BBiZhokTOwmQzOB1hKNUF3HaVH/fl6kLq89f2+PkDMAndyReZC1wy7I
	xecZYvEMHpLmNvsKvggyUAZm+rMcePrA7GEBztdul6Guqp5+Pd0XD1FSwx4y3sEB
	WmWZNVLgKQevlHeOnddPst/U0+8pF58eL9BQZ5QZZFywspLPIiJw9snhLNgpn0Bc
	lat/1w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44enyq18tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:03:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8e8153104so9038566d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 05:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738069389; x=1738674189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SccPDJ7IsQUS8tZ1suiF0ums40XQ70V/e1OGN+43mpY=;
        b=If/rvL5zxdwr59pQQIJH9lqwoWrsibAtz2NGWcsLXPwdEDEvghkWz4/TIperiIAX+T
         tijbawTLo3lhKYJRw2c6LIiUasaeyWI8wOC4U6DUtQpOE+GSqJ146nXjKBvX3jxFCKzP
         XUl7jThxz2f5CNQ1fwhcVlSOwNVkQC4RgyG79WeK5imHB3rSCeYun+4WV/p4IMR8xzpy
         y8neaAue0jlsCxuE77HemyFnihopeZYy/fEUwwy0+CukdNkBKV10IJsQa5jy5clrgXkL
         EL+WM0ROwXVrR5pD0Vq4Uk4Tt59dt0ZozVdReJQ15LbTJfpqRKGTy7yuekMV4K8eRI9e
         KuIg==
X-Gm-Message-State: AOJu0Ywzxw9YWoeAhshkT3QNKJDc/+Wsxj2QFLlJBpD9QEY6gl9U4W76
	DLq9gXgILbwA56c/rOI14AIg47K9Ue66sfy8yZCzb/0aaYu4IvOhNHRXgDuoiQNfmA7cjLck5up
	G/VtnOFS6T6Yz+9aNc6jsRtk9XSNEsVNRBF/eFic7rAVvR84uCxHArNVDZ0gkzH64
X-Gm-Gg: ASbGncvnSmMFXPEX1rcjScQwpP7rUPgvuEAaKa7wonUTLq1mmaXkkPN13ll7LdgEd8L
	Gdcw1aAEqI9QSAxuLeUhpVV5VzznO4aHMM1HMs6zrnNfGJaok+evw4cSUBtgIjLEkw5riDZNbzs
	58NkqfQbp3QCx0erb9X+bADUvoZmwkmgUqxaYEPbcedJEHf+9Z/BXOtb96LfRVsia4pXVPwBUa7
	+pIvvhOtAAFL0fW5qjH8gvDBN5sKRAJqGG9eIdd3yGx1AtldQnx4wGJo2I9Pcf3ulUI+2NMNFR6
	n/fORqPMhoDb21QAywKvQPcDVwHJDNZufo3/2hUF0AI0DzyguS5mxSakCps=
X-Received: by 2002:a05:620a:4252:b0:7b6:d252:b4e8 with SMTP id af79cd13be357-7be6320aecbmr2259376085a.7.1738069388784;
        Tue, 28 Jan 2025 05:03:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHobxKrxfFza5mt8mBCNQxJsHHa721FQYalZldxdJgzQ0HAKK+gfBEy0gUxIiSZPn49zX3B4w==
X-Received: by 2002:a05:620a:4252:b0:7b6:d252:b4e8 with SMTP id af79cd13be357-7be6320aecbmr2259374385a.7.1738069388429;
        Tue, 28 Jan 2025 05:03:08 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e12199sm776861866b.25.2025.01.28.05.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 05:03:07 -0800 (PST)
Message-ID: <b6191629-a486-47a9-a6ed-e82fc51784f5@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 14:03:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] arm64: dts: qcom: sm8550: add OPP table support to
 PCIe
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
 <20250115-topic-sm8x50-upstream-dt-icc-update-v1-3-eaa8b10e2af7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-3-eaa8b10e2af7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Lga_Jks8mnJ1evfCdEmSzK79n2JLh_Ok
X-Proofpoint-GUID: Lga_Jks8mnJ1evfCdEmSzK79n2JLh_Ok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=909 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280099

On 15.01.2025 2:43 PM, Neil Armstrong wrote:
> The PCIe bus interconnect path can be scaled depending on the
> PCIe link established, add the OPP table with all the possible
> link speeds and the associated power domain level.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

