Return-Path: <linux-arm-msm+bounces-73972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16875B80FF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 18:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F6001892F75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E111B7F4;
	Wed, 17 Sep 2025 16:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiHXr1VS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FC9229B1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758126598; cv=none; b=ZI+kQPpo1KHJmbqTE1oXeAKueHIFS/NkmHlu0+XWErzwtmZ42FpygxoMG9VblBmmPLE2H8u/+/TAGl5ig0n4qJYfPxnKnovpG/rhzWP296S+47WEQD9uM0M4wv5KTrLiMEO7JwdbOs22C4mUU0ZXbU7IWyw75R8/wI9Rk9obx1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758126598; c=relaxed/simple;
	bh=j/kIpr44aITpYwfRH5MGrbeYBzQDUseVMB6E+aFtzw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcbXvUncx4hzUAf50KEM4KE2B0b43j7meAW7jr1Y+ofXvWlseq7hpvdGtLXqT9JtrNb6BouYifYiWCyogvovS3oKfAA84KE1erGls6j5ujeVaQR/ReSU11GHxyIsdjjxLuXvhn2c6dh2PiodBXkZc6b7xYLgp7l40jQ9tFZAQe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiHXr1VS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HG5Ikk010769
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aPbliOpcCjIzayrMLkNw1FIe5VlXIVH9kvQijQYZm20=; b=ZiHXr1VSwLPkG2/M
	uN4aJnP3sUlNJHPGAh3ELOm4kQ4P2lX+AdVXRyMYk27T7PcAAhrVYwvHjtwZjgHF
	uhuOh6Vaga2zVy0qbAVoknjr2A8srxFLICJWEY8Az8eL8D26lVz1ipfyB/knPy+c
	Da0bx9l7qK2KqhohTPupv/taCjPhHh+M1NatXt3JMlxX+kA5Jm3XcYilL/PrlDlP
	9BYLM72CjrJBhFMpW4UwRBQNImIzZL4c+7a75wZVGjDypcZu0PitzLFjaTDDo8p/
	hxNDhMB4Xd2wobqCu7aH/QKoK07FdCpEX5kIu1EemxR72AIlYDL0IDdA+8s9lCkr
	CVrLBA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxu418-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:29:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77cb7607cfcso69585b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 09:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758126595; x=1758731395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPbliOpcCjIzayrMLkNw1FIe5VlXIVH9kvQijQYZm20=;
        b=dWrUYxeSD/6oEXkSqtzzl5mdX2R1npAbQQiHYBa3+V3I6QrpmtdzMVkn8JH4fH1lIw
         Q6QWXXzM087urJ+p+iZd6cZVCLqrg2YsdFYhx24HuxuGk8RkHeX7KAzmmE0TJLOWyT8r
         3av5Yi9wJnGva3R/1f4SyNTd0PZjW7S8Cht/T0VWWc9xqYJUfwzxPvNlmLIR92t/KfIy
         05LTG4kcDUuNzUT3B8EcYDQH0mXBo+PMkEowDETDRe7Lxo/YFhVziKocn99rhhBK8Hu1
         n9Q5+xry1/vpWG7NpmqSbOmdTnWeNzf1yR4pkqovbYmZze3g91IeE6oAmB/psEloFHnH
         G0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhyK3Xie9YyLYBO+M3oVX6z1geaC8r+1KMUgMnhsB9nUh6lOJ/qvQDZaa2Zvv3N2sJAEWZ4XxCjB/8Z+h/@vger.kernel.org
X-Gm-Message-State: AOJu0YxeDLIXKwXmZwQjDAV4rDVjArMAax6j+yrWxO7Q+JmQOaePVE+/
	8YPHzYGCfFLCCUlcNIH3LN09QmhBRApTqr3PJf73oKiJMFcbcuiOib2IaOutquHQDsXppjpUSkH
	eyyLGCXSYHZKlJ8lCnEUrQQclFI9eFxJ2EHRxu9MO60sVf8GCIoblmslcIaGwDt27iSnX
X-Gm-Gg: ASbGncsT60FK8TDjk1RuYf4RKzShw3DE4LOTlryryse+DmeqI8i+y3C7emgiFLG0Ksk
	/mwm+KuN5oY17CWHDy0W6YGERejmZi1sYQuHQ56ww0MteDaU/safmxOtln55+OZtWo5+z/2ELzW
	6rXBS2t4Hp0yGa9UkASpjxbLrCX6NgeP82n8DEhliCx0XspNtlpXvx/OjfLN1F5DHgC0GB42t8y
	NspDd6WKTQDYu96auE6Y8CVTrU1Sqi5Wwl7041Cude5cOSIl/EgtS5MZIwPNWY3Rb7L+8stAeYh
	XQ6y4eOZnrWVseTWeSmq5umbt50rgj7pZHXLMjHs5iD/KJ9pEecWD/NOwn7hZt8=
X-Received: by 2002:a05:6a00:8d0:b0:776:1f45:904f with SMTP id d2e1a72fcca58-77bf9268104mr3162354b3a.28.1758126594831;
        Wed, 17 Sep 2025 09:29:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSAETCbSP3vIIE9VWiyL8Alz3IwaM2MYDhGvePBLrTzg5i1/2OcH9B9+r9HC87lkyc+hFW4Q==
X-Received: by 2002:a05:6a00:8d0:b0:776:1f45:904f with SMTP id d2e1a72fcca58-77bf9268104mr3162319b3a.28.1758126594363;
        Wed, 17 Sep 2025 09:29:54 -0700 (PDT)
Received: from [10.216.34.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b3603asm18872680b3a.84.2025.09.17.09.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 09:29:54 -0700 (PDT)
Message-ID: <3c56cd00-770f-019a-d93b-5ebaa6b9374d@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 21:59:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 02/10] power: reset: reboot-mode: Add device tree
 node-based registration
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-2-37d29f59ac9a@oss.qualcomm.com>
 <in6bqvemnscvuxbumpxogxiiav7odmsc3iazktifninh6iqen7@qwhrhdidcx7y>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <in6bqvemnscvuxbumpxogxiiav7odmsc3iazktifninh6iqen7@qwhrhdidcx7y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX67pr+2CSjf77
 IRCagQlUcChZ0Rnk7QhpeLSbFn8l7wvfx4Uu3dpyPwU22WhRvlUNMMDtkuxVjRWWqixbujtDXuk
 JZ0bl3PLO37dZT2ZYcAdBBatGXOberGU02fEo9jWivsWhHYqEhYGOE3fNO0c9D+AXxCQ9LnxPo7
 6GtG7HRiIuoVeYF/6txEN1/+A2nj8Nws3528631xwgl0yiSFKIlE+pboujxJJCzGp1iOSSPENFV
 4I7A2Q0UxACL89sJ4eLlAiTiEeWp0wiRCXLrjBFHLTCv70nOEUegq0bN6klC49S5GBmKLAendOX
 tSWJxLW1/i0h8lxCD1ejSBsor2w87rz7AA98/jHa+H1WVhbnONU/eq/+fuDwqSc1uKDbMshNiNZ
 L/pa5KF0
X-Proofpoint-ORIG-GUID: Ngkc94vZYdemzgo2L2UvTDHWVItCE6aa
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cae203 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6ImPWgPuv615vBLeUzsA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Ngkc94vZYdemzgo2L2UvTDHWVItCE6aa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202



On 9/17/2025 12:18 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Aug 15, 2025 at 08:05:07PM +0530, Shivendra Pratap wrote:
>> The reboot-mode driver does not have a strict requirement for
>> device-based registration. It primarily uses the device's of_node
>> to read mode-<cmd> properties and the device pointer for logging.
>>
>> Remove the dependency on struct device and introduce support for
>> Device Tree (DT) node-based registration. This enables drivers
>> that are not associated with a struct device to leverage the
>> reboot-mode framework.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
> 
> Please use fwnode instead of device_node, so that the same thing
> can be used with non DT setups, if that becomes necessary. Otherwise
> LGTM.

To be more clear on this, have one question: the current unmodified
design of reboot-mode is dt based:

struct device_node *np = reboot->dev->of_node;
and then parses the node using for_each_property_of_node(np, prop).

We want to refactor reboot-mode to support non-DT setups by adding
support for fwnode-based approach (struct fwnode_handle *fwnode)?

Can you please explain a bit? Some more details would be helpful to
make the change.

thanks,
Shivendra

