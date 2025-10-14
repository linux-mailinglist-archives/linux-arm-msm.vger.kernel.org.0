Return-Path: <linux-arm-msm+bounces-77224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6658BDA1AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 16:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A6A5F4E9FDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DCD3009E3;
	Tue, 14 Oct 2025 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPdTp7s7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDD430100D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 14:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760452799; cv=none; b=jHYVDkO5GxjYcTjnRZD6zIZhBqJCLKy7uBScGmbKzJJmr6h/yZp99+wAwyCf8/3VGVrkWWQcud1/olMeKCDfhW2QTIitQX88ISJY3fKQEjX/kYY34UuLX6fqcgUMJgIt253CVq/CCyp+fJfzVyKoVeSNqgwZm9MOWaEUk6wiB58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760452799; c=relaxed/simple;
	bh=tew2y6xviAQy7OydrNVzHxjCiuUcH1z6UXelpKcclZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/51jG5RjRB2RHBDarXmKnPPETP1yDld0ubZYoMMnXYze4VsbZhMdxxwrPYeIGYHzqwqV/oSsK1R3FlSBgYOC6H+tz1rZoc3gqF1zkOLu9ZCEqCiYcWhv7zMbvyovpXClJr859vFWe9wgF5D3Ur6a2TAIJfo2ho7idO3yGmsTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPdTp7s7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59ED6NSm008365
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 14:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ULnRTYSsVts9v3XcRMWD8601G0J1/kMUydXq5rNhZ2s=; b=mPdTp7s7jUkcxREW
	2yV9S0ULJJ1B7//7aMu26+unJim0Zmn7WXihxn4f/Pc8iqekh6msnnepo6S9Darl
	uzwRRxk5RGTVIAPyW/qMGE1WyiqQY5/8eLvMbnPOOLZpTaQGyySHelO2uflfsGT8
	Ii/sXbOSp1mcE0mDDKfeYn0dz4xiEscYBDvtR4HszG0clzr1zQRDhDlvJA84TMJr
	uucbDeJqNSS14pYibCsyqdMeiJE1SRwpi/cqSY9aD+tLmuhjKunxccMLnwYhL+iS
	tfC7rcRJXCCV20taployI7Cbauw6xJcyYrHP2tvNsqTn41zUhiD45QN5zXx2GgQZ
	BK3pvQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0rua3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 14:39:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28eb14e3cafso169139205ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 07:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760452796; x=1761057596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ULnRTYSsVts9v3XcRMWD8601G0J1/kMUydXq5rNhZ2s=;
        b=PbjOdIAkLn/4kkJ7pM5HnxYWiI10uwlK63b7nDltqkKeQ+CnrR+/Pxc4yRX2rRhYkL
         Q43EMgZBEskkj53dRhBXQbSD8Rxo/H8Y6JB+BKa5qpk731zasTABJ9N5CAyrSTAX/Pv4
         UAl5rsdIvcUNVd4/hazCNjlP3xOMSwP9XpdyegPrEPI9DIHNXtDNz/IotxSKxwIBNcWs
         7TSccqKW+N7Vg2hstPgxxFivhpQ2D0ChyWRCZci6bL/qzU637LF+DGySIfAYWVjQ6iQW
         hnOK2gtRib+PHK26hMrN6fDcXy23lwDgDzYKhI0vcdrUmWtwlRbBSiVVYG146P8qzdNY
         wBMg==
X-Forwarded-Encrypted: i=1; AJvYcCXTRFD+CGk4DGnXKhyqMthMM8YAJOsONzIOgNRT46oLZ5+woTsn4R2lOxhYQu7TD72xpqE3HBBidgD4zmP6@vger.kernel.org
X-Gm-Message-State: AOJu0YzeUhF2jCE+aq0MW0BbRNenvtl0K4OYuEwAUbRBjuLjc+sC8pqO
	NRrj2Kr0qpPXM5HWX4ISyNFd0DNqKUvIjP5wUIMCnUAgLoZBZxS+XLtWdjoVIFkMYQgaXFnPr7h
	Sj2Pzbjuuhp8VXHxcnzhqj01JBuKsaLcygPnnzi79Ik21EY/6wJuH7uh9ohLH7oKnJKPW
X-Gm-Gg: ASbGncuzVAApe9GHHnhg6wfsQZJvjQgk7iIvkPWUyLLhpYnBI67pxcMcWQk65Tg3Bob
	bUFOn+/CLnYq94+EstZTHUf+RmEEFX7HQHRErjxlIk8mcMAvPyZkkoDiZGpkp98xGCoRpqKAIGN
	vTqYx5CoPWYD+C1vuov4KZ+eLbGxvjxzR9gVQIoF7ovCxlctyNWyBKEAtWJSRH/e/ZVXvGCTbso
	waTwFCiyMfLn4407LjJdNYnPzNcboV+hqQ3O9ocCSFEScpNBXrYc+ovhaei+BiioqeYT9bxo8g8
	/acayG4q7VIv7Y/YA7XbvMvFxUiCaDLnAhRfcDda0fWs6NPOxoPFSIuofc5zoYlLBapYYSxhAaN
	SNHnzR9wZdFPzPw==
X-Received: by 2002:a17:903:2408:b0:261:cb35:5a08 with SMTP id d9443c01a7336-290273ecaebmr341067985ad.38.1760452796424;
        Tue, 14 Oct 2025 07:39:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKq9vxO93TlLeulIeZOeTM879NjUW1wZDc1Bri7Rr0e2MzZj/xLBlQf2YeUS6W3UYIhS92Qg==
X-Received: by 2002:a17:903:2408:b0:261:cb35:5a08 with SMTP id d9443c01a7336-290273ecaebmr341063155ad.38.1760452789527;
        Tue, 14 Oct 2025 07:39:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f95ecbsm161292495ad.130.2025.10.14.07.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 07:39:49 -0700 (PDT)
Message-ID: <ec7426b7-c6a5-4a5a-b6a3-abe75fefbb00@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 08:39:47 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use kvcalloc() for slice requests allocation
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXzGAeFP03LkW5
 pMEG3WCWF/9QVaxYkY2/jlZB6LkkzcMkq+IQLzGi5n2EAlNFZ6cydsTKyP7/EJ6a6dssLUAGglU
 pUlgjPEzD6VQNmOp53BawTuFop2nM89bHUvrD65RTR0OqDlHAiS+XObznw96Gl09HlMcUKGhqKQ
 h7oHvLLVMuuJC0vQF5p2j2bOr2J0HNS39gS1ZQMb4h0iypzJMvlfItcOSeMLdG3DBmOIlOvldoX
 N7jEIxeV2UlKtT7BNgrSgDlg+YYfN5g3Zw+N/Zko0aEe+F+ujurK5ThINwRRqbkAZVhk03wObxf
 Tz94Ts7d5ugMmy/txMOoewRuj36Cq3D07eyugix7+tEo8HP+4MazEqx+JBwGS/FiNkx46esjiRd
 N8q8xWwm/EWtB+Phxl+NXPr6BX7I7A==
X-Proofpoint-GUID: CwcFTRdh94ZGvmvZezWmhiF5ttVw-rIH
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ee60bd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=57TA5eHKvZbov0TpALUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CwcFTRdh94ZGvmvZezWmhiF5ttVw-rIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/7/2025 6:18 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> When a BO is created, qaic will use the page allocator to request the
> memory chunks that the BO will be composed of in-memory. The number of
> chunks increases when memory is segmented. For example, a 16MB BO can
> be composed of four 4MB chunks or 4096 4KB chunks.
> 
> A BO is then sliced into a single or multiple slices to be transferred
> to the device on the DBC's xfer queue. For that to happen, the slice
> needs to encode its memory chunks into DBC requests and keep track of
> them in an array, which is allocated using kcalloc(). Knowing that the
> BO might be very fragmented, this array can grow so large that the
> allocation may fail to find contiguous memory for it.
> 
> Replace kcalloc() with kvcalloc() to allocate the DBC requests array
> for a slice.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff

