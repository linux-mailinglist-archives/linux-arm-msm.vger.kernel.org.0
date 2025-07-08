Return-Path: <linux-arm-msm+bounces-64055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B144AFCD59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF7C4565DFC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BFA1F92A;
	Tue,  8 Jul 2025 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6rnSQtO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEDF274FF2
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751984494; cv=none; b=txDrwCo+s26DQyZwxs3nuJu+uLijQSRwcyn8dANbCipMhIaov5ktSgS1wnLZsRO1kdtpU/Bdi27OuobP9n2CxqKM8nMnqbw9fwb0AnzECxAKQSjrz/+rEj1u33NiJKLT5sRrRV9t8TObSL6nJgvHJHTu1ry3tQpD2gR0/PbSuyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751984494; c=relaxed/simple;
	bh=W4WG1v9sXb2I/kGtWhDxlxKX3X37hHMOqHpkdeREnn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iDPja2diryLKlEcgAcrg10IPwUa8dyMwx+RXA3zPGO6rnzSqYsMbspvIBe9y3q22syNBs+Tb/4T9zXYro7qeeJCWHCh37Hk0YJ3gTLaC0XK7nP4r/6eySV+Ua6NzAAu5oHGUg2q08IDKWubwAHoRv7xkHlFDhIu+MApZWwkHz5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6rnSQtO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAPhr030383
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 14:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZ7nubB7WVGwzRgwv+MpJw9qf/qLTu1tPlRVviWppTY=; b=F6rnSQtOru257SeK
	Y2leoYkWhu7c1K3eh6DmuRYHYXTxZU4AbtlK6zA5UDvrHP5LdaYLSO9vQZUOGH86
	IA13GBjYBGzXHCl7bxYAgvYRt93N2OM25dH9g9IJD3YnqN5wmuotrPnVbvbYbNG0
	nUvC+W+Yd1L0+72XqnZSQLC0pt/vMinHqCfqUAC3ipVCgMphys6RSoA+kKbfD3nP
	s4yDHjKQ2KS/XuYYNBbFezPMwwajkUOfUl8STd27AVcXQOonP7c1yrqFbRTQoLS7
	c/K7H5fkW/PXY4ZFOocijwS3+u5olUFBBhftMB2sr0qTjeNkRJYbA00csDfg5iKC
	DYIAiw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0usmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 14:21:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7cfb7ee97c5so25476585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 07:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751984490; x=1752589290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ7nubB7WVGwzRgwv+MpJw9qf/qLTu1tPlRVviWppTY=;
        b=rPmezLMMHYqJwKOwOyGBLGUXZVgMxqcINeqdC26JiPLJzgmBWaXx0FgTYP4E441yZJ
         0JpYjZG5QHUfgZnTsiOOmmmhik13BasVLiyFrMWLlK9y/8KtHdJ/LMiX3WPfmnx+iAqI
         y2cIKq1E9I6g5IxnZvcjnTzZPCD5MLK3fi1FUuxCgGreUFkK8yHVIwrckMZV/LlZuKDk
         xGIenA6x8MOctgRrodwT3ObkAhcKO86f9J24hifqukGap/MCfjzRn6PdZsQ9/QexO4hc
         RYcJnKIQAAN6bp8VHic9ecbsZr0XYv+MBQ1TurhrIjULEqo2MWqI5f2nyRXnQAtrHdWt
         vV1g==
X-Gm-Message-State: AOJu0YwxkJUXEQRSqVJhu0Y2zHKVYCVIyGSQ52Y0qdtM6fktz1V1aOyB
	UeQDznEpiVoi0vjEyM7WutSpwevXKkHVYOSD2EPkc5ZezRKj62zcief9X2BJyld0OszwV2bckIu
	r67+5FZ3VYSVWRQfMx9i67PWFfjgjS4z9zAp1ULwtA7hJ+58B30Sw3ZPu4CmRz9cbT6GCv5nzUZ
	AL
X-Gm-Gg: ASbGncuXQa2HZxJHdjHCOCQFpoynySK5hqboVplKcM4y1v/+rb+qECS0VEY+x15rqYk
	7k8VnSVos9BjAF1LiipjyR9ltlVQR789nEGQfKGGyxbdTmV5Qa5Ds6lTC0qB0xyh+E1INqapfQu
	AJod7FiKo58e3OLDk8BgpmzxqH7nZ2bKOq9j9vceDEXaRgmRgasq5sefnbCVoTO+Dj+j7qw+YQ0
	VGkJMgB1hFQ6z/rz4nLj2F7FI0A+MDO1Pf/JgYGOYsfYLgKk2B+2mcrF8JYylLqeDoxF+Arh1vY
	V15186cRSZBINhJcbYhzsSk2FIWcaKeFxQDVnyEOacJBZ5b492ysJQK3f1s3vJtXF8XGYEheyXo
	8k3Y=
X-Received: by 2002:a05:620a:27c4:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7d5ddc71ca6mr869696685a.10.1751984490549;
        Tue, 08 Jul 2025 07:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvgYYz7XLm/4x4hZmgdO8MpRNdLKTE8PP6W2tPZyVwIH2dwlcYWFonQij2vtyzfAieaxs4Gg==
X-Received: by 2002:a05:620a:27c4:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7d5ddc71ca6mr869694385a.10.1751984490100;
        Tue, 08 Jul 2025 07:21:30 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6676a2sm7153168a12.5.2025.07.08.07.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 07:21:28 -0700 (PDT)
Message-ID: <29da8704-5369-4001-8a0b-04a5d1c23dc4@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 16:21:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: ipq9574: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
 <20250708-imem-v2-5-692eb92b228e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250708-imem-v2-5-692eb92b228e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686d296c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=owAxAYLDMf__z6yt7SIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEyMCBTYWx0ZWRfX4SUekV6r+SFE
 /a+LFlhVwYdlB7K4g43pGNNL5b9sS9qeVzpS/UN9y/Hyo4hyztE1sk5i2kwIBesTEPuXiHugj3Q
 IRvJYUtjQMxg7mIuVzcTAe0pwplH7SHL/noPR6C8+5hyNaw01WSiZUGfW2zDKmOn4fwbgBiKEtN
 3bv7pcYgsGIsJDKRrXjSnrO0c8XrAVempFD2KTmsTPjyzQjy5og1sQkrTkaufjIRckJ3RT0n5OS
 tvmVZKv9TIgj6K9kPu0zFq0jiTjUdIgAaWQf0ZRNGLqGh18kr1pZx28vd+Kn58Z70ncMgW2fWh4
 YANsxJShXCP0ATrfZN/5nAyQ4GnsSDuqwHpbFbu2/GDefLKo1v16BmeP+vJ8iTXmvGVLxkUrePL
 SIz0CLj05FdU/hICthm2M9kr37taT5I9Wf+o5e91ebCPFBAugERRBNVzEtZyJyuYXApNYszF
X-Proofpoint-GUID: g1F683DAuHyZdpHktyuLB6kFVzhAO4pC
X-Proofpoint-ORIG-GUID: g1F683DAuHyZdpHktyuLB6kFVzhAO4pC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=743 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080120

On 7/8/25 7:39 AM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 32KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

