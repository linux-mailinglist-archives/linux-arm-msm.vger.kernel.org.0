Return-Path: <linux-arm-msm+bounces-53962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CB2A85725
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 10:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 273BD1B62CB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 08:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6622980C6;
	Fri, 11 Apr 2025 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nrx0jzYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B213229616D
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 08:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744361970; cv=none; b=CDAah8sbZdJ+TfkVyJnIEbNbTeusWZk0c7cIcP5oXYseQWm5mCQu7ygVdHmdkb31OQO56c33UOu0IO4Es4if+ORJ3hMnEob6p4UHCkT5SJOI80VD/eWXK/XnELoOuREuTxs65eX255njhTivPG8Xa08nwXdBMiXvHVo0NEarKfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744361970; c=relaxed/simple;
	bh=Q3ST2MLjNprt8W8DwVtbdvSbW7Gy41vP2tT3BIUViE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtXhyXpGMytAhPcgjrz5XRc+ph/VE7MaekLFfIT/0fSB1fltvEWCqP5n/x+xM8R9HcQ0/b0udM/vZ5A0pVGfHac3jWb1tVVAnnofZRM/zpg5LcRfPyzITij4uYiZdjol+Xeb9H+UZ46B/fUJhsvqN7ZhP2QSgBfuA8iE8w2nn3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nrx0jzYb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5eNga000340
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 08:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/RuMAy9msHuh5tqlxCLZQdr2TbbASae7QFdHD+HliU=; b=Nrx0jzYb38liETmz
	nu9EEKOtw7AMJWhT5yBpjoElMqx8GDbuS41u2XQkRBLa09QrwZ3e8TSJqAvwfLcB
	rIxHywIvG1fSGGPUtslwbPhy08/GCBp9Um3mopyShIGmS06WoxAphw+y2K9f9HA9
	D4Ew+SuJqPaGS6d37rEO50ujeWm7+ZrOCQarwuZ10kQ27P/w70xBAJE7nauN4/4x
	2qVeX81u/YjFD1nxoIjJP01hZIkQQQrxJPo1DGQqjRmONHAoEa8yXI+8KjArhLFm
	xkkK+9oCdyx+yewYZdwv9ykFlXgCBfJvWuEv35aiPliD+KnbLapIWoiJlQlkwXWJ
	V+XbTA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfksmnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 08:59:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736c135f695so1310035b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 01:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744361965; x=1744966765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/RuMAy9msHuh5tqlxCLZQdr2TbbASae7QFdHD+HliU=;
        b=p4qrvIwWYrjRE2auxg+zY9BemzHed+HyoBumdhlNKNUFqJzfOi0gPlXV1a0G3YvvHX
         NNttrukqWE6EUIVaiylgh+kuIAWqGUzosDQgl2V1ZSKxX0Go3DuNTjkkflpv+0bclb/c
         4MDqKljKG9velSFPeVwDDyh+S1w+iov3K+q+pkoPi9paEjV7unKY9zMQj+ZzpKfkCtaX
         LveVLBf6bVDFSrrI3MWQtqdMBZ5cgtyih8nNjaxW7r3y77wO89V8sa3VfZC0EuKJKFkV
         UutR0TZMt0URqimESZzmD+jmsLxt9VoEVofquHmrOb7zoc3Y6Q7sAjEmg7RAOFWGxAiB
         N3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNHOKiwp3K+v3kR6kKlzqq1+M11tojTgrBYQdec1Il8QOLhJYLp+eVB6qLc0mBwS2htzAF3u4bAnnqLqfG@vger.kernel.org
X-Gm-Message-State: AOJu0YznhfKLYm7M77xZmtOTx9SQMoAtnYbanheQRT6z4qTuIYwaby2s
	kuZ7LLnndTc0NuMF4FChSJdp8XGz7adwCtncpMGN7d9P27NoCLed8Q59SoJMWBVWSN5x66wl6bk
	9Gv+Z0myuOs824rXrhXV3NQKrFHWlA2i9eA7r/4CMOXJ+n6wwBm4Tu6R4nPYyoeH6YC5mpjn9
X-Gm-Gg: ASbGnctE+3fA1p9h2moQhyqOEEt1MdNJSN98m2mDZZGVMC80+ZdvklTiuh3Yjo1HsYC
	tHousc1skaJnLZOkd6FBf8TFtvW82EZ8ll9HqIkxoIHRpfZegvFQQ6VKViqtrbilmVpALGHUqZK
	5EqQt4TWXcqVyXfZ7rSBgORfBp3E1yOX28+9dpDcNLzlwBCvE7dn+AITyXcwzi1kkocbEFFxZrN
	6lAK0xpB18s/2H8DMnbd7p9P2MNB1nR8A6FZneBBSpGEbkjGTh+bCqyDOn/BqnA2jSZnhbqBnjI
	3J8/d581UHeSW/LARbTQZhq+MOYxqWldiviosN4zlUbL/ncCXGci
X-Received: by 2002:a05:6a00:4603:b0:736:6ecd:8e34 with SMTP id d2e1a72fcca58-73bd129b43bmr2796392b3a.18.1744361964953;
        Fri, 11 Apr 2025 01:59:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq3Om89V3BbCVuLa01tYbUYAYbP5OVnWoVWe3QAtTUtuyYrDH63vACK+b6upU1gLt6/v8bnA==
X-Received: by 2002:a05:6a00:4603:b0:736:6ecd:8e34 with SMTP id d2e1a72fcca58-73bd129b43bmr2796362b3a.18.1744361964496;
        Fri, 11 Apr 2025 01:59:24 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c4e25sm968489b3a.47.2025.04.11.01.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:59:23 -0700 (PDT)
Message-ID: <734cf70a-1d96-4a87-bc7e-c070c1e7dc8c@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 14:29:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom-qusb2: Update the phy settings for IPQ5424
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com>
 <Z/i+6k6VseihdQ69@vaman>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <Z/i+6k6VseihdQ69@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cM2MegFX6HaXLCks-wfIpihqMOAsT8hD
X-Proofpoint-ORIG-GUID: cM2MegFX6HaXLCks-wfIpihqMOAsT8hD
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f8d9ef cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Mlon7qBrsPBlpjHfUrMA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=858 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110049


On 4/11/2025 12:34 PM, Vinod Koul wrote:
> On 07-04-25, 19:51, Kathiravan Thirumoorthy wrote:
>> Update the phy settings for IPQ5424 to meet compliance requirements.
> Can you specify which requirements are these?


The eye diagram (Host High-speed Signal Quality) tests are failed with 
the current settings. So design team asked to revert.


>
>> The current settings do not meet the requirements, and the design team
>> has requested to use the settings used for IPQ6018.
>>
>> Revert the commit 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for
>> IPQ5424") and reuse the IPQ6018 settings.
> Why not do revert first and then add the settings?


I thought of submitting it separately. But what-if only the first patch 
merged and second one didn't due to some issue, it will break the USB 
feature. So, I thought it would be better to keep it in single commit. 
Please let me know, I can send V2 with 2 patches with the merging 
strategy (both patches should go together to avoid the USB breakage) in 
cover letter.


>

