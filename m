Return-Path: <linux-arm-msm+bounces-65608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC6B09E5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 10:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2E731C46B54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 08:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEC0293C6A;
	Fri, 18 Jul 2025 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/7lG6cE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3902293C45
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752828749; cv=none; b=IN2JlkO4RrUGR4IKeDguEORtQmYR+wv9U1sq2ZfGZMZs3rsWv4uyVxVLmQJQREhFbKZNfaO2sa3OJbiVMuptqkYHISI5vcnLvY7ElEtLI5iliApu/b1N7vb+h5bWf+7ge2bT+OWAjrzNvGFvlME2Qw7lmTBBXmJNfxsWgU+HY7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752828749; c=relaxed/simple;
	bh=7tLUqMMeWyUSVgHeIio6NZAqwLFuscFzmDiihAOR+Ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrR4RZVqusfkPkbRYSHJfYs2s2zw64JXnojsHcBQs7TrKagwW4VFRODPwYoCpYk362FirvFVg1XoOMnywqQJMuNbW/qS1AEP21QoGn3SV72Aqvj9D7TZwa0IGd4mVW2MPDt34uMymra5UJ7/x7LIJAk16gXc2VLApmOgE/T4WXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/7lG6cE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7ueV7028071
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 08:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12aFvAN8Kp4LU2nkNq4n4C57+tw4URn/SblrQcy62ao=; b=N/7lG6cEKR743O4P
	kOsmvxoV3V4Be35YVkAqtZpS0+HKcp8YV/eaXPs/YXhxy6wfLtR3WHnALX6XeRei
	41fvMOKM6ovFK7Ocf832YBKclvhSDaFbYZxwSeuFZpXXugZ6hQNfHmMMuDxMJASB
	pH81Ss7iFSgFiDPW00qDhXrPftd5ugAqTRziaPUGO4uuxkLW8NPab6YtGg1BNzoK
	bYfhrD2WJWqpNpqqHN3+kE9ydX9MZORdrkpTqs2dDu+AG3ia59x6XvZrZcRyntqR
	0Yhui/aFyfmft2JabWB3QzFG7T//9g0c+ChWtvIZtaM79M+aK66+xTjOVfcDkXBF
	oIRTFA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh63286-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 08:52:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab3bd0f8d5so2550671cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 01:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752828745; x=1753433545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12aFvAN8Kp4LU2nkNq4n4C57+tw4URn/SblrQcy62ao=;
        b=TXq/TlsM6Du94A2xlR7YiIYD5ak/epLCQQv+LzrA+wDX3ND23L2CxiMBg1GV9NT99i
         0Ie2qbyTHmTMdOn1vWwLKaWq5bO396NnoLTS+26DiwJ2z5hEYGxhGDCA8ep5REBnnjLN
         H3amH83Zl1qr2+L15C600DH5wKNgVkknl3e9LbC1XCq4th9S0ChrpWJlsKB+zJYSLbX+
         OTKzm6SfPlPpRFfxfGA0RhLPGSUsMDIhekEVhvgF8FHUMyQiM1hPKQsrakxaLpqdAibz
         oWUaQTNmQ0iebkreqzqhnS0j5m2VCduZauPx5DdmNfpRKkpgSrqCOZYss+QdShV6ncci
         p9vw==
X-Gm-Message-State: AOJu0YxdfjC0RQ5T9sBh0T1bNm1f6blb4wIW8EknRnXzH1H1OmqXcURD
	iXZRrB7+YJpz4TkCPPXGrQNh8wUsht2tcMdt2TrqgG8qXw2tizmBx2C+X9uuALnxlNciKIIpsL0
	w8uEWbacseDjWZjlvHzkBvQxd0wmehp0zrEGroQQ1fU9hUed45eQyI3OjsLQpYCByR6EO
X-Gm-Gg: ASbGnctodJ/A/dP91LYsUAdkpyvSkWwalqznUZLv4w53oG53DOnHwElw8kUUP4IpxXs
	LBXhCV5LFQH6Fd31CfugLKlOqDSXdYCTWa4eXLDJQwposgO+TASCC9HNXI6VasabyFKNAGjcTo8
	uHe8nwg+Pm/dTXUhRxvVFFJUhsU4L7YKbR5Yw80IpEdfbQIO03zJW2jp9wJp7Wnpg0/euyLX9rc
	Ijvb9btYstexTIqULkuutbAmdnt0MMa9oqVv3BLsIR9XFTyg7OxSLgvJqwwb5kI2U0c2FzPxi5z
	ZSm1uU1wVTBa57a7WLEsTSjqkIULwaylIzB6PtA43oAYMOGMUS/eXE4ZSk5FMPYSs+RuBfnW4n/
	ry+bcD3/K43Of9hkP1CcB
X-Received: by 2002:a05:620a:2227:b0:7e3:2e02:4849 with SMTP id af79cd13be357-7e342b41754mr492338385a.9.1752828745230;
        Fri, 18 Jul 2025 01:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyYtt2uQEVydMUj+p7jbJI8Tuc+iSxESKJDUyd5T+9D6g2gDd4+/Gf5X597HAoWT/iga1mSw==
X-Received: by 2002:a05:620a:2227:b0:7e3:2e02:4849 with SMTP id af79cd13be357-7e342b41754mr492336885a.9.1752828744783;
        Fri, 18 Jul 2025 01:52:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79b8bcsm82882366b.13.2025.07.18.01.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 01:52:24 -0700 (PDT)
Message-ID: <1e08ae62-9898-4a70-9122-5fe6a8d14f4b@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 10:52:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usb: dwc3: qcom: Remove extcon functionality from glue
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250718053856.2859946-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250718053856.2859946-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a0b4a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=gYDs5GclryXmtiFo2a0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: P5lZNEP8Qm4rWF5glX5RuMpPSdTTFBw9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA2OSBTYWx0ZWRfXyWPtwY1VIIzP
 npZnQaeUItdhXUoe+TYufLZ6z9+7FjCkfZm7oIXFUnjNKxEN9fHahd6F9Ca7hsZxWOrBGveswND
 KIlHOC0RdMrWB1PTEt6rtWlval6pS3UA5H1rWAOcGUnrKWg5wANVqpaJqGbsJO9MDRTFittHvFF
 wLEbGznzkyxvlopPZL3KkR4rXLCbAwi2ieBizhI3GlD5FeXZSGGDBkPUJ3HdjX4uwN6ecWI6b/E
 67WlD8BE7OO6LSaBQaGvNySmeLh+2UruJpj1+5lO9X1YS3hjVd1N1zmlKHXzsBNOoGydL6/Oj9B
 BOnm5V3bpMHzI2m43+hZ5kP233+Xk2lu6SFH+6BYWr/cPc7Kb33iu4vQlgpE7Iyd5q2mWf2kuOG
 WYhTjFyCNvl6C0GZRPcl50YilPduFwomAjMPCt3V3+D7I2e+QMTNn9oRD5QImQQqWErHBKwL
X-Proofpoint-ORIG-GUID: P5lZNEP8Qm4rWF5glX5RuMpPSdTTFBw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180069

On 7/18/25 7:38 AM, Krishna Kurapati wrote:
> Deprecate usage of extcon functionality from the glue driver. Now
> that the glue driver is a flattened implementation, all existing
> DTs would eventually move to new bindings. While doing so let them
> make use of role-switch/ typec frameworks to provide role data
> rather than using extcon. None of the existing in-kernel extcon users
> have moved to using new bindings yet, so this change doesn't affect
> any existing users.
> 
> On upstream, summary of targets/platforms using extcon is as follows:
> 
> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
> effect on them.
> 
> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
> driver which relies on id/vbus gpios to inform role changes. This can be
> transitioned to role switch based driver (usb-conn-gpio) while flattening
> those platforms to move away from extcon and rely on role switching.
> 
> 3. The one target that uses dwc3 controller and extcon and is not based
> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
> This platform uses TI's Type-C Port controller chip to provide extcon. If
> usb on this platform is being flattened, then effort should be put in to
> define a usb-c-connector device in DT and make use of role switch in
> TUSB320L driver.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

To an external reviewer who doesn't have the context, 'flattening' doesn't
really mean much. You should instead specifically mention the existence
and purpose of dwc3-qcom-legacy.c

Konrad

