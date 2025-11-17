Return-Path: <linux-arm-msm+bounces-82158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 520ACC65A9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 19:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 850BE3445F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE03303CB7;
	Mon, 17 Nov 2025 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTDQKjET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ImWKMEPc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D022EF65A
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 18:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763402760; cv=none; b=jnDL9T3ZWepWj9a5bNXMrU6iBM/xWdAAM+kv0R0XpP8QSl8FafcTgMYnMpZ1L+djVY/VXIuZRXTFDved3d0Gf3NycBxI5tiFyH5SNDtipLC5/5hShyvk9EEkAZPngB7dL29BeNIme0ALWtDoaA0+5lg0dQYPpvZC5UyffvyuJpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763402760; c=relaxed/simple;
	bh=Utq/o/IsaQ+xiSfOpL3Pvg0/iShuD4xCtX9S6nlhtRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9UT6ED7CTW4tYin9Yb6vaE2kKCuXv/YkBTxR7To5gg7r/vkVy6LO/OcWatsEFMrD/44dh1+bMio08VSYrXcrONcyVn653yK0U1ZtJYjG4+a8iE7Q1X7phOUeXudUR7/XPRlfwnLBjdGExBMWec1yWXN638LtexIPY5Ls1JzltI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTDQKjET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImWKMEPc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHECYTk4166688
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 18:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CtZqmPr4nyYBtMaWQ9GcC5E+xfZSvgBJzThmf7k+gIA=; b=JTDQKjET50SCW1Ui
	2G6vRyZF3EW34cbIqWWvbI409nB8iUc9TBezeNNXtx+sW9mNfncu9wHBwdbKY6zA
	D6uFMrak8wA+qh8exAIQLhUVMArcrmwPIPcpVtGF55YzRgGn0v9jmNrTzoofLyH+
	NOFi+wnMnsL1hgtyR+oAl6NRg58p1dr954j+DAoOD/0ZOCE8/V9nKHrbGWs7kxB4
	eI1PymZzhKIIp5zTFNCmBzOXZq2Ok7c87VkFdY02RyDGBUH8s0vmni7nPki4CrCl
	88OuGDxfFgeZFYzcQrDr5Y8Ih7zlhraxATAdTcBI2iwTiRWhmVx+bEf+Ur6UMwF1
	Rsy8yw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag593rq27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 18:05:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340d3b1baafso9141456a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 10:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763402757; x=1764007557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CtZqmPr4nyYBtMaWQ9GcC5E+xfZSvgBJzThmf7k+gIA=;
        b=ImWKMEPcbPy3rE658lGjHCqPqDCO3rGo5+10eXYLoesGZrGgg5LUz68EuK9Zq68x0j
         MAHONPN5ALqwd2+AH9axECU+OIHmX7FrrAM02DWBZS+hrD2pelXMQCfwqKwt6jE3vCX+
         dbA4t7sRyBx7RLw4inRv7BWovf96WX6yKTIT3I74hCDJ/43clWTtHgkCqZ0X6w+Hhzd3
         Q55b/67S1qdsUB6SnyA5ZM04x86ROqkY3aam4eW/oEtMIydlIeoC2Pj3IdS6IkYt1DzI
         MvlcL4fwkqoA24Lb3u8THFAI9ssJkYsULo086Yk87pNU22RInRXb+k/hwDr6yjyE8Ir4
         dN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763402757; x=1764007557;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtZqmPr4nyYBtMaWQ9GcC5E+xfZSvgBJzThmf7k+gIA=;
        b=HkI9A/lHKp8FI8P/xTEpdAuhRsjk0I608bDGqbj4qwyuGenOW33y0grJfPcclDgmSO
         ocTHi0/OSDJobo2b7jzJVsQQChZgM+K3enkwn5NIK/9YDzQjCWypElmdNx4975r6liWt
         xzWJWbMiA2JGQUkTljv8HVwKLcIrXtWxXkwUIjXI0QbEp2u/hBZQKlalk16bmPAgPYbu
         mYvCcIjeLKNH+0v7Zo8GW+bhtwdh0U99Hl7Q6gH20veYIirNhJekljsYOndQn+dM97lP
         VI1i5T/pQJ7fzbFdudQ6l7+6vLlWKNtQ9vhEmUctPlC2zkuOHHO7EZcrV5I/3Ef8bYKM
         qW0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYHd3Wx0x3Iomg13igFO65Brz3IP7OrweLKcPRKCaD6VcCgF4ls5f1hYLuVyra3uvIqW+YDkmcS9NPAWF9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcx3UnkCf295cnP3YAHJHR3y8YN+nuOE9QQqWBy+JTvBUxDEq6
	zB3OkyzbcaWhGDy2s76dr7cFGGm0hvEDoN+go7gtbNvHpPIGiAJyKtEQ8uzqnbe+bZXBNwUVL8d
	RxLASn/TWlu416bYoPlF7fSxWWY+u+VPUK19s84wPZJS5jmFmC3kXww6iDLxoDwWu7fiw
X-Gm-Gg: ASbGnctLrS1fk6g4oY6gUr7slsAjw9SkSsu82qRVt6k7yzpWFXbJTtfpqvdLjWqJ9LZ
	olPdnOU3soAtepnbE0kK199oq+idZ3D60GQLzGU2rvBTNqi6FM8YI1VA+8VBmCFEE+EYVKDd53q
	+mxybzPmiNYA9i6DRa8MW/AYN4g/JCLxrxzsfJ4cg6kWmDJ2TTUclBj2m5ZE9yxhO2lNvplv5Hx
	jH3m4YqoGfIyIeWLEp2Thtp6yKb007TiUsU+XNTNgzwnmx+0dD5cZYJg4O3g7Ff68GAJGmY/iJZ
	+YgJA+GNQCANdv3HWYpKh/pkS1Z2dC9pQvrMSsetJMq3709Qj8G+o3v3VnFdVrG21HkM+OEXtQm
	vHUrQjtlKhkKy+KRJmU6dXzar7gvdhvL2Vw==
X-Received: by 2002:a17:90b:528a:b0:32e:7270:9499 with SMTP id 98e67ed59e1d1-343f99d60a6mr14245209a91.0.1763402757181;
        Mon, 17 Nov 2025 10:05:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjMctP8U/bJG8gfCxZTBmL2bEtbZ9moSbknYP6XJxJcZzkUI3X1sLpoM/QNqSYptxk6CUWhA==
X-Received: by 2002:a17:90b:528a:b0:32e:7270:9499 with SMTP id 98e67ed59e1d1-343f99d60a6mr14245178a91.0.1763402756641;
        Mon, 17 Nov 2025 10:05:56 -0800 (PST)
Received: from [10.216.14.226] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3456516cf7esm10918337a91.12.2025.11.17.10.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 10:05:56 -0800 (PST)
Message-ID: <8b6ba46d-ab64-dbc5-8f09-e810bdef724e@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 23:35:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/2] reboot-mode: Expose sysfs for registered reboot modes
Content-Language: en-US
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20251116-next-15nov_expose_sysfs-v1-0-3b7880e5b40e@oss.qualcomm.com>
 <CACMJSeuiL5XEZjh8mOSj7tUnR8wEYSJ6FfZA87v8TSu8xM8_JA@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSeuiL5XEZjh8mOSj7tUnR8wEYSJ6FfZA87v8TSu8xM8_JA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=691b6405 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=eCt-5-1m6m4SF186z2UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE1NCBTYWx0ZWRfX/DfZGaNp9mP0
 cYYixq3e5bMRO5FT2nwV/dTSbLtqvgA2Sz2Fc/9BHBkJYknU7hlc4DmXXq1tb++el7SW6PnrcWs
 VUdb5EKiQKQrDKMcZ9Z05hh4O8AQJbZ1LXJoFZsyHVyPBAlOMaLVagrRjOpLdEofcHzHYr/CGAd
 7RTYLz3mhxpPcsnm36aExkvK8+b288+6qcJQ2pogL3lCOnM9qo9ygoqprZf8Q6T3k+kqzKxIrGj
 3YU8eErLT84R62EsGG8iHsGPpWTzIT84OtnP9Oi7834fdr3v6W3Wwywdu0PDYaFoWN3JDI1o3+c
 i6Q12kJaU0Nc4jwbJYS+9+5YBGXMYVwyc1TPp5BfrFw7j827zhPD24GTMZsZvtTidzB1VtRfvrD
 3zDyLWqDhp6HcrcHtgizcnNAHpxgqg==
X-Proofpoint-ORIG-GUID: AMLS8Y6uPnCV1QVlVS4XWnbHh2YaGo4P
X-Proofpoint-GUID: AMLS8Y6uPnCV1QVlVS4XWnbHh2YaGo4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170154



On 11/17/2025 6:33 PM, Bartosz Golaszewski wrote:
> On Sun, 16 Nov 2025 at 16:20, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>> The reboot-mode framework provides infrastructure for drivers that want
>> to implement a userspace reboot command interface. However, there is
>> currently no standardized way for userspace to discover the list of
>> supported commands at runtime. This series introduces a sysfs interface
>> in the reboot-mode framework to expose the list of supported reboot-mode
>> commands to userspace. This will enable userspace tools to query
>> available reboot modes using the sysfs interface.
>>
>> Example:
>>   cat /sys/class/reboot-mode/<driver-name>/reboot_modes
>>
>> The series consists of two patches:
>>   1. power: reset: reboot-mode: Expose sysfs for registered reboot_modes
>>   2. Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes
>>
>> These patches were previously being reviewed as part of “vendor resets
>> for PSCI SYSTEM_RESET2”, until v17. Following the suggestions from
>> Bjorn, the reboot-mode sysfs patches have been split into a separate
>> series here, for focused discussions and better alignment.
>>
>> Previous discussion on these patches:
>> https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reboots-v17-5-46e085bca4cc@oss.qualcomm.com/
>> https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reboots-v17-4-46e085bca4cc@oss.qualcomm.com/
>>
> 
> When doing a split like this, please keep the versioning going. This
> should be v18.

Focus of that original series was "Implementing vendor resets for PSCI SYSTEM_RESET2".
These two patches have been split out of that series. The original series will
still continue to its next version(v18) after addressing all other reviews.
So i thought that these two patches can be split out to v1?

thanks,
Shivendra

