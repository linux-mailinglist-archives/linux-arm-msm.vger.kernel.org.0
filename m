Return-Path: <linux-arm-msm+bounces-77337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC10BDD7A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75FF53AF50B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 08:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0651C2512F5;
	Wed, 15 Oct 2025 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IURcAa4O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD2E3148CA
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760517945; cv=none; b=rA36xHovFBWCzrzw0+1556pe+AFiaogMHJKoFJ+j1Q8niL2+lRqHbGoUcTo3LSbzExjtiRpwyLR0LyKuCj3kFLj0ISq4ta6DI0wSTfCvS/mrE8welJAsuCG1ZZzzqlUUExQgNZkrRBtAJdTYlVICGnXTKOoWXakak1OWivtFwIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760517945; c=relaxed/simple;
	bh=u0ikA4MtFcf5qdBMLNH0y0YZHeQh8M8PZH9kzqqmUjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1Kc/tpVnl8au+kK1Rwzz0ITsX+HkthReqX4tLii4yJlwhc/CXdKE2zZM3Z/223n3swDcj+BkRuXpulVTfFg6lQ9LViw47KP/93jyHdWJ0H8ECHQoqM+gE6s2X+kSwrcJwkzXIIoN2zqnFToTtecr/6+xaSMZvVg5Y8pP+teT4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IURcAa4O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sD3g004075
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tT4lZcR4ZBn0xrtO1ZVUt8Qt1hpqfjpfEUFhsYPVrd4=; b=IURcAa4OWNIyJpVU
	dkvIYnvv9CxyWyiPfN1Ayf/7fdLEaBNrnnowSgk+6ysNQV+QAvov8bdIXdv0dlia
	OAy1vdwUHRlVqVzzY9eM7n2lZxup9Vp+xuTt3/oomYvLT5lQ3V5TMv0OUTzZtrBV
	Hjdayh/XwxnLQEtxIiUyN1F5M7JTVPcxQOK44/+Jj/KcKkVdCQbKJJfTJYuL15Ko
	ONaEosj0SVOYB2TWVJMG3xDith2hfUicyMOFBFVnDcicT8ECuoyp0yPWki/qzjqd
	YjBdA+V7mci9/R6qI3utMV5s0JFCBGZZ3cfz5xKgCOwSMT1XCvjqD/Rj376uPaLX
	bZ+D+Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg3k7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:45:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2698b5fbe5bso133388335ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 01:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760517943; x=1761122743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tT4lZcR4ZBn0xrtO1ZVUt8Qt1hpqfjpfEUFhsYPVrd4=;
        b=TlCHk0B7DEeg4lQosoeBZ+CjMBNcpx9dGhPtX+t2R+pXm9wgJA+kN5onhdoA3pSABN
         BtSoh0I3/UMMQ2DuKp+gS67gCZNlXInU2RrRE8v4o8gB4aEmJTpjVahyiAd3A4c3dv+T
         t/7eEC88AFqHzPKUSaetI5P4ZGVpCVMCUJjeLMSXfUCBSnraXjX7TDZ/rk6ijHUfw2/x
         5wDZ2cpwz2hFIIoUNGlbFTdKIOxBkbpqdaIuePQux0Ug/ZnIA4G2YuTxeRqtu6Q7KpHM
         y0x2tXFx2IIqDDQKIrkTLKnXjr7EG/aZ9OwKNRvtHkV/4tw/2NImiYyy4PfZAsD5mFQL
         OHDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZHfyR0Ccn7rMX09raGG0wRrd58BHTKC6p6dCLKQuffTL7k1l6kSuBK+3SarF/cDBwcSm59JgGOhQ9JmkA@vger.kernel.org
X-Gm-Message-State: AOJu0YzBD6eVV0WgCqTcifSa5Daz5O1Zt8LN75DlwiyTi6+qtqHc3/AZ
	zImsQ4npuGDP8LfL/TpD2OM1bnxIDWNiEqwmkyVe2lOnB4kjF6OpHyl78KhY9wX6H74P67sOB+6
	6CZHRjjzA7WlI1oqhCVfAj16aAqEhGyV4iEEmpl/qdNPtEL0n7A1lW/SnQmgQX+z/YIes
X-Gm-Gg: ASbGncvm7TW9i0AOQ1XH8Fns1Vp5WRYxgnGxyKJV1nddsRz2JeA8KKaOKyW5qdxfFTp
	j8Rq5fBYGUbQ8imXTU0RMaQkKkqieXucv4/3Gy7LPePten7jUrWseBEkbQFR9SJGfswFojvLg0K
	82BBAy48VPc9QdKuulWcJUfaNqtljsU02s1kCkwLQ1v7H3NjPn1tDm/QF5Kjy7UlKGAFXOC9E0v
	vSO2rKn74074ef212FbzNOzi9n5PZ2ktzI8fiVKT3qfkUfhoGNy+mehm9b2k7eER8IbxEDFQusJ
	uHjtltK8y7BC+WcQFl4SbmFFpbuS1aePXcLicOQJYlZ8yzLudV1n6aYDXB0KSPhI/Dta80c=
X-Received: by 2002:a17:903:4b46:b0:27d:6f49:febc with SMTP id d9443c01a7336-290272159d1mr366508595ad.1.1760517942816;
        Wed, 15 Oct 2025 01:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU68B7KHWBtJSF6bpxGSTAtxK+b0Uk28zSKf6ArLdpmJzPhB1kHcmTwbavGcRZRkHHk+Bc9w==
X-Received: by 2002:a17:903:4b46:b0:27d:6f49:febc with SMTP id d9443c01a7336-290272159d1mr366508125ad.1.1760517942284;
        Wed, 15 Oct 2025 01:45:42 -0700 (PDT)
Received: from [10.92.210.195] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f07741sm189006475ad.61.2025.10.15.01.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:45:41 -0700 (PDT)
Message-ID: <f44083bf-a54b-415c-8650-a57b3b482572@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 14:15:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 05/14] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
Content-Language: en-US
From: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX1Oyo1iiMqfF/
 OghLfr1gIfD+Ll+D0TB/jM73qhJvNZhaRQFug6fNzxy1RQxeIuw2ANkL12h4ystZRnsZ3Xi06Ze
 jzvUaibqIzkstEqbKItYXlZY2pdtP80yRpSAOXt9vNG1KOi/JexQ/rWR7rPUCaf4yHR0GHtURBT
 UQkS8u63EVES98nZA85u153Q5Gnmkz/b53kGHgnXiQtYXXDTHkja5ZKGjsrkPec9YP2jpQMhPez
 5PekALLF4HTxkSyy0MPE81muBX9/bULkuneV+FPm/NBAHLIWOBCUAz7wLIffBBCh5Kixznidg60
 J4Jfr8IFcdzn5d+CDAml8bRpVy/jZOeqGmS7mIcbjYdCwsFfl0rsQKeZxAsfS8s+5ZDPts9Df/c
 IhG9rPnqg88X8Qr3bYUiO11HGYeC+w==
X-Proofpoint-GUID: bbbBqfy5CDor62-SDBkp8Mkd72n6V1BO
X-Proofpoint-ORIG-GUID: bbbBqfy5CDor62-SDBkp8Mkd72n6V1BO
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ef5f37 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=obQkJn2dBRx5tTod4cUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025


On 10/15/2025 10:08 AM, Shivendra Pratap wrote:
> Currently, there is no standardized mechanism for userspace to
> discover which reboot-modes are supported on a given platform.
> This limitation forces tools and scripts to rely on hardcoded
> assumptions about the supported reboot-modes.
>
> Create a class 'reboot-mode' and a device under it to expose a
> sysfs interface to show the available reboot mode arguments to
> userspace. Use the driver_name field of the struct
> reboot_mode_driver to create the device. For device-based
> drivers, configure the device driver name as driver_name.
>
> This results in the creation of:
>    /sys/class/reboot-mode/<driver>/reboot_modes
>
> This read-only sysfs file will exposes the list of supported
> reboot modes arguments provided by the driver, enabling userspace
> to query the list of arguments.
>
> Align the clean up path to maintain backward compatibility for
> existing reboot-mode based drivers.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>   drivers/power/reset/reboot-mode.c | 127 ++++++++++++++++++++++++++++++--------
>   include/linux/reboot-mode.h       |   2 +
>   2 files changed, 103 insertions(+), 26 deletions(-)
Reviewed-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>

Thanks,
Nirmesh

