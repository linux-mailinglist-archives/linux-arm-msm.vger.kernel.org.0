Return-Path: <linux-arm-msm+bounces-46510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC2BA21E26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 14:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB7CE1641C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 13:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA67317A5A4;
	Wed, 29 Jan 2025 13:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZ5grChY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6AD14A4C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 13:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738158484; cv=none; b=XaJZKnYC4kDti/uuyILjrkrDDdY7oiV8dKEDb84XXmfh61RsBy/AaynG2Z1SHYaloQN75679nJgE1BNYNk4kRHF+lMMTZlS9BPIjuEEaZ/tXjw/KjvTITPRTvqVsCWPryAXzUiBKH1ejkuiR0r18zck/5H5Mx8c0UYL+3RtSsHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738158484; c=relaxed/simple;
	bh=CXXkaINHKcgPgFLIAruxbqB9w0jLUsI5+chyZUYz/I0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2bmnphDEDIbYwaPK1WSW3OUAGG8JPS0zQny5aDHyCAYcJuBxwI2oam4VdO5vXSuOcVJSkrokXNOKly3tXlQpBlFCjL3zF9HJmzpsphBbkESblno9ayTGiJ7Fzoex3WqIFb6O4bUY8W/GeqzrtbXos3F/2DUSaKC5UO/p2Lib+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZ5grChY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TAbsqV018965
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 13:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CXXkaINHKcgPgFLIAruxbqB9w0jLUsI5+chyZUYz/I0=; b=VZ5grChY4xCgY1pm
	dRkYVU+FTl5n/WHYwbV9dnP4InkwvmKsjLHGMYbSHShGOURfh5PkDvbHjtsZb11U
	pMXOS9lZqaoZ1qzHviS8mi0xeWv3J0OHsr32pZKqxp6YVIkNyBNDito4C9cJOpHb
	uXYSP1qV4gWlgFOpyQU6Vi/OyFbCOBJwlIVHdWbK0cNdqCBBNek024Y+QUN299ew
	Px9i+rD2ufz9CQ+4fhZj9dKJygl/xobvaVbTFs8c4/47Sh2M1Y21dsZiHDooSBxE
	fOC8nlHC6dsP86gLryYwdYF5tETlqTejvGpeBL37DKlTeSSmY0phIPyGoeWzfqPp
	LKRrMQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fjr90aub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 13:48:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8e8153104so11580046d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 05:48:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738158481; x=1738763281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXXkaINHKcgPgFLIAruxbqB9w0jLUsI5+chyZUYz/I0=;
        b=HUpQj9L2LtUltfCBY1Y2oQcOe9k0at4RrhM5jMS70XRwgROL51FANoVko7it/d23uC
         nhtmBEDOs91sQ58glwudciIYA1mxNOrelU4dyiGIfNiEw+JwK432aDb3DnGDBPdaFylV
         6LSOCsz9flpjFC0bmTNquw42108NXsIMrx4hA3ed60sZbIRFMiINHMiNcQ+RJhaoh7xh
         fvfOqAcWYns8j+NkaZpJbLiXza4GNXeLtDilhbkAy8arpJgQzjYmUHJ9setISE105EXF
         2sJfl+tCC6XLZj2tlaUbeeXAgO7QryHkiNUM91X+Z/tx3WQWP9y/N/XnPGCT+pSRInLX
         BRYw==
X-Gm-Message-State: AOJu0YyThBfesgEPWbnz4ijleWIidzDD1sWU3CjuHuS4Jyitd9CWLIhc
	03OFhvO4Cgq8IGFt1wyPYeHGR3lxn3k4R7ccD/62MmVr/nzhFgjPMTrcl6lhAxUzIIvZu7Pcw1W
	AWa//bAPyxLBlNZkwlhbRDMSYh+x89hZwlOSrI7dx8D5JC4Ds/MfEJGcvNoX7CZwp
X-Gm-Gg: ASbGncsRRhynNzq8HZNTi3lAQ0uxhjisOSeZjKEB/s9Dvrz77U4IBebnle/GcY9hOvy
	YcT0ItKinQc5jI4Wxf0ujm7YOxkV6pfLYHqEsFTrlKq3alc1nDdDoKrs5PpWB6x7udAiFZd28PT
	JNeOzq+l22IhSy6Tg51rbq58UV50EywVL/GIBnfthkVenxLGDNE3RpDqhcK44a2j5P6JOMM3QI6
	HtHYTyfi7pHL1YIvIFP39LrhCekDViSpCvV4iFOukKF4nPvXkoqpQtOIEIb5kJGcZXZ8qMwW+CM
	ZhpBpWhR67Cd6jBu0JME94OHFQPxw/9Mi+mcm7DeGkSJAEA/AbKqviPlSzM=
X-Received: by 2002:a05:620a:1921:b0:7b6:6b55:887a with SMTP id af79cd13be357-7bffcce582emr193213485a.6.1738158481081;
        Wed, 29 Jan 2025 05:48:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB8E/u68ugx01I51kdoUqadvvqxHqiqJPuElKkhVEjYIOIGHL4R8gUbiUaf6Np1jPrF4xShg==
X-Received: by 2002:a05:620a:1921:b0:7b6:6b55:887a with SMTP id af79cd13be357-7bffcce582emr193211585a.6.1738158480732;
        Wed, 29 Jan 2025 05:48:00 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc5f64d1ddsm1158319a12.35.2025.01.29.05.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 05:48:00 -0800 (PST)
Message-ID: <3d23c903-fe11-41dd-b79d-1aa1596d1712@oss.qualcomm.com>
Date: Wed, 29 Jan 2025 14:47:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: add all 7 coresight ETE nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250129-topic-sm8650-upstream-add-all-coresight-cpus-v1-1-96996d37df8e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250129-topic-sm8650-upstream-add-all-coresight-cpus-v1-1-96996d37df8e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YjAM58hdXz_bdCjTAoWBnjtfjoonn5wi
X-Proofpoint-GUID: YjAM58hdXz_bdCjTAoWBnjtfjoonn5wi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=837 clxscore=1015 spamscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501290112

On 29.01.2025 10:54 AM, Neil Armstrong wrote:
> Only CPU0 Embedded Trace Extension (ETE) was added, but there's one
> for all 7 CPUs, so add the missing ones.

all 8 CPUs or the 7 other CPUs

Konrad

