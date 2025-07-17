Return-Path: <linux-arm-msm+bounces-65547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED41B095C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 22:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A43784A12FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 20:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861E91FBCB2;
	Thu, 17 Jul 2025 20:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7tc7O3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7FF2AEF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752784408; cv=none; b=r/9XZESRGK3VVkNSbRO9OQtmLbgTTzRlZTqW0/3KSA8oQhNIxCANjPvyLbSdQ5MnEMIQgNsN2AsacQyQAp/UrPr+Wv2AYcHtS0XHD+c9Eysd3jlnAVpXpjxJ1ZJ23/hnmq8P1vuNsyRoWcC91pC42ZUZOXd0V3h6lKyF0F9Bj8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752784408; c=relaxed/simple;
	bh=465kQ6yQTPhCxldTUvMEum0rUEyB5JyOVUpOTCjgfok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CE+LSeKfkg1wdmKcexZBpAwzsX6CXha2oMzsjRUA+dBVNPuDEQB+3Lf9THjacX595YxvFWsbCAK46rYyXKni16KCzf1xTsIYZrnq/FYjYNPAvhEkyAe4QEaRj1K64q46I05wHZa/MOsNEAAnxye7kDsVtrex8bu+BNrE34vEvMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7tc7O3p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCNLhC025212
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8nModRSVGZSsZ5DL7kr1DuhtFiXYpOSlYAQ311KsRLY=; b=X7tc7O3pUqk4qN7j
	RfmUHeG5JwOtJOe0lIIJrPb0H6dHfDakZ9Hdx3/4GAkQ82gUPKRNh+sNOsVSiIeV
	6IilwXAQZnW1kjMR3cm91DonN0vW7efrAlRKtYLmhSIxjYL/nVdAu72YZcZl5pb8
	Pm3WPV246TQECUTJwiOD80QL24MkfpvfqBN30isWBTRUYRn4QGEJLQKqdZz/I3uv
	gN322mKC/d3opYz4g6BTwlSu5E38BELG24Oh80N4LdoCm8JaYcVEi23mRGCBWoxQ
	ncdY2SgZhChbbTk1m9zqP9I6E2cDYPknO7/6FFeaDgHmAi/2wMVeJSbd1k4Zelgv
	jmbKyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqd9yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:33:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7deca3ef277so31481485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 13:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752784404; x=1753389204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8nModRSVGZSsZ5DL7kr1DuhtFiXYpOSlYAQ311KsRLY=;
        b=PcYBf5W8U+zE6YGPZ5sV9XWce3imMxzYslhARRdcnYQSgp7NJCE/HbmdDvibDyPpIo
         iUpCjXJXxXlQpbC5gKSTazYqidxafbYq9XXk6pb+0tDbZD4ymaMi0ycm3JQxSyAeRI0U
         7jQCrtzdXL10owIoT5xLuTc6CgnItMw+MNmuSh8zrVK8JES8rdVNoSrLwMnK06Y4RyfM
         6H2mVtQbCQNi2RPDeolOvGx8E2zQtuWfVGqIV7KzwGi34KU7zkcDjoedb3b7QoWUpgjn
         y5s9DbPiH5unmzD8LOdXt2z57hjzeOXHvCbXGQrRSIfM/k3jDRuCjT1me6k7m07YGBHw
         PLqw==
X-Gm-Message-State: AOJu0YzyQBO3mjRzzk1o3+5+7bRh/HRhfdepQOyTDxHmFFzmVhsjVD2b
	KtRrZawgxaQPbCznBfBbMtudIoix2IPyDKvHFjAPY55WSFdP2JRp7NO72noFhFVBFA4OGCDh2qA
	V3Qa8jZJGPR/+ZMZKJQyKyLdQTI9hxsJbQTQEwf0X+ryQDBZWXUUPmucyIK9prGnENZXc
X-Gm-Gg: ASbGncso9z6EHz5iNAjovA/9iw/kdL3vAiuioUz94hV5ke+qLLYwJZ6XlTwiHMMQUBs
	lOUsPIqCbITYqPdH73C6XqHg+78k3AM9I+Xf/INMPnhWxDSj51DaB73AkRIxObZige1/NgBzqcn
	mHWQy4FkD90R3zAWpC+hkVH+EPjVgBCgrYSKlgXL2GIFPj6bnjc1iFPp42u/kx3K42ki4zyNo78
	WjK+yFd0g556i0MN/NE7hAu0e4okde0gE73ikzYCP6LKzEDaQ3mSg5EdCrPalYBnx49i+bdb+Pb
	IfJSIvrRPahq4dySC7Y/jFzJRlYY/tZdUVPbXjMvfQvPRgvhYiKtiGUPZvgSd9gFaYYYXLMPLJW
	7IiJxEG8w2XSkCQttZCbC
X-Received: by 2002:a05:620a:2697:b0:7e0:2b47:bd68 with SMTP id af79cd13be357-7e342ad5730mr507121585a.6.1752784403732;
        Thu, 17 Jul 2025 13:33:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq7ne2sTqDVyAUeSU+0dYOV0hFl3hEPNgP0CsgwNgE6XNHuWeZQZvq7BCuCRpH3GkUIIYwqQ==
X-Received: by 2002:a05:620a:2697:b0:7e0:2b47:bd68 with SMTP id af79cd13be357-7e342ad5730mr507117485a.6.1752784402906;
        Thu, 17 Jul 2025 13:33:22 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82dee16sm1424518666b.152.2025.07.17.13.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:33:21 -0700 (PDT)
Message-ID: <37932b96-fc4d-4321-8986-8f975b0c1350@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:33:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: add glymur interconnect provider
 driver
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, djakov@kernel.org,
        lumag@kernel.org, a39.skl@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com,
        raviteja.laggyshetty@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716151535.4054172-1-pankaj.patil@oss.qualcomm.com>
 <20250716151535.4054172-3-pankaj.patil@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250716151535.4054172-3-pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=68795e14 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=2uCcKERadT1UtqjeBP8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: q0yKjRvV-mrASbU_ySPPfFg16-qgani0
X-Proofpoint-GUID: q0yKjRvV-mrASbU_ySPPfFg16-qgani0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4MSBTYWx0ZWRfXw2VbFocQn0Xs
 vDvzgiB5Fg9yXpDp9IAs6PqROajfo/6PUfvv7+tgPr5llu/YrVvJT9rGj0n3xnGE4zPss4sggBH
 opb2EdGRlVpCfJM6En3ITBHpjWen1/BIeLl51L05tORtPd17/GY6XkZzEPABOgtoJ+cfU26HzWV
 UXI3b/jvpx3KfwhnyHGHvnqv9qkvQXKSDFs/Hc8dYh7MfqJMVlDzAuMEn3T+39++VMZ5KjO0F5v
 rHnlAs7hQbxFxZLP5L/io/U43TiGUZto7JjL8YnVuYW7yjE1JrmvzPZGv0FqaPVqjjvMFqWTsnr
 UTUwcLtKq/qzwRvMupAJckQmMkiKtc0WgtTxLqKIey/TwZ5TECyBYzUv+WY0fehM38SL+9rdwjl
 UkdJyO30jve8OOYqHprSOPnnT0oJaibq73iILcKJvId+286VqJCnKycuqe8v/nm05CwGIzSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170181

On 7/16/25 5:15 PM, Pankaj Patil wrote:
> From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> 
> Add driver for the Qualcomm interconnect buses found in glymur
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

[...]

> +static const struct of_device_id qnoc_of_match[] = {
> +	{ .compatible = "qcom,glymur-aggre1-noc",
> +	  .data = &glymur_aggre1_noc},
> +	{ .compatible = "qcom,glymur-aggre2-noc",

Please unwrap these lines, i.e.:

{ .compatible = "qcom,glymur-aggre2-noc", .data = &glymur_aggre2_noc },

I'd also request you work with the author to provide the ICC QoS settings
for this platform (which would be good to see as part of the introductory
commit).

Konrad

