Return-Path: <linux-arm-msm+bounces-84910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D2FCB35B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 16:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26F65300EA2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 15:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDC51F8AC8;
	Wed, 10 Dec 2025 15:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q12QHbkD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X84+AkV3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ED2199237
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765381684; cv=none; b=otGOlbn315pQBaXzaDj50oxwXFEKZRhgC7xxy7R2y1BE9JQcGW77qO49H+iy3kkYB7BXOByhpyCJEa54e51zojWB6VApEsnZsZG08sZ3kI/99JULtYs3Z6j9tIXGVTZ3wAz5qONr7LtuAmtPRhoOccYyEUQwAwutIuOTq0no+Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765381684; c=relaxed/simple;
	bh=zxzWHkHdlNOMeXVncXhQukYbqBLI1caIuljfXw/kOX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWL/1xot3r5UGEDcARc3w4kHzbfQbw++0CXUAe1uw2ucyjUlMjcoBo2JklswYzgGZzK7Ws8PAUnG8XkEOuQffQ1KaEsiYAXBgQPlJjqpPILl3SDLe9+NT31qgpWxPJSOF0Hav4P8T+PMPJnXhaj7sCqAbNxUCISGXCQL8yN4zFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q12QHbkD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X84+AkV3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAFSRN53360856
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 15:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qk1oxQfFmW1j0BGoNAZUI72PM8JpbvA0GKEGOSMYVA0=; b=Q12QHbkDzh8vdiiX
	mUAdJvIjWkpqvqb8U4CZm86VLnMJrNpg5tZbgPfjZKRY8LJoC0eAL9OeQxp+UO5q
	DcNnYg+de4lKr1T9nLEzIekiPJgTQaDEoHGG7lqJSd2foiV2j5l8b42lP9jZ0J/X
	ttUcvg5OgRXp39kTDu88XRxEdfeh6M4VoozB4im9obttfl+CE3Qs1mj5wCh8MLcu
	Vf0DAqs7aH+/ykIJbINBlVIJOwKzF0rjANRIToy31t3YgSnxNK4xqvLnZRrlOCoZ
	fX1XeHM60qpwGSvfdmyZeZAWs1qdYLSCv6my+qs3c3G3ut7MGAp23g0zEuqa5eKL
	FW4lSw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhp83q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 15:48:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297df52c960so33815ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 07:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765381681; x=1765986481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qk1oxQfFmW1j0BGoNAZUI72PM8JpbvA0GKEGOSMYVA0=;
        b=X84+AkV3g/fgZHuMeUwR3yKuYxf2C3M0DOyt/7t8BhNixsJxCayipskvsb6B6C7XMl
         6C0RHpR+UsgThpExNm9EZ2Qq0mbv/c+dmVl//v+SA0rAmnDcc+34IMy+voKmIlq0fbh0
         9wSAchvJPUO2HxR2Z9q6E1/UQnZzrXax0M3zLK2HdEroh4v3XesW1yZetlVG3Wrxt8li
         Gx7DgDIp7uHyllN0jo8ZAdo52aWWEYtGbxo7gT1AyeWCpKaLz+5XkdDPtOSyvfH8z5ht
         pfCq+45lmocUQVWMgr3vSidungvFjDZJOb/gqBfnCf36od9WJOWcMmNciHs+sPCRv98i
         zC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765381681; x=1765986481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qk1oxQfFmW1j0BGoNAZUI72PM8JpbvA0GKEGOSMYVA0=;
        b=GI68gb4+ZnHLLx33bQ8+l9tYWhDVNPZhaoWKz2EMESxRz0xkIPMId9I7uaCzMc1LM3
         5rluhjSxnNGsY4LuQO32Cbfeui0AZKSZGCa0ke6G8lksOOoheGLFBl3wW5giXq5BX+Bn
         hhxcN2mWF2uCsh1lEudhvOoT6yxf0nQjOrLKC0W9x/X8PDJ9J2a1jgGZK51zSi9733fV
         hZWGu7mQZYECt43FUd3hyktiYYbh9H+VQyfA4/seR2L7bDWliCj3X7OX+abVxOOj5vdX
         1feqGQGJi6ZHs3u3XPL3jJJi/5Yj7NBT4VZgSs7qc4b0USbvgI3lOuceu8Wx1XBj7Fb4
         BoWA==
X-Forwarded-Encrypted: i=1; AJvYcCXdg17K1VaMbdSTySAON6rZtnsXTkLG0YlP2EY7vjedODVFCz+jvI3lq8ox2mk90a+R+u24Y5Fp/OFuUhw9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9xLesRRxAGruwSGfWSdUCtfzv+C89Mlz08kKHpO8ujf72qgCg
	Haghr/KmoseJVEf3Bm6hSj0mITGCShS1/YdEhLANVW5RYMavysb74Vt67FFik3gSKGS9aVpIM+0
	FJQ4ZWZjhVhuLT8UhzLE4QRmBpfgaEfWJhaPWPhyfDpsrKaNKBzEGV9HzfSKsBXrJob12
X-Gm-Gg: AY/fxX6rjEE78DO0x6Xj2P+MupFtCXWYerZOA0121YoTDFTtKZnmO00KY5WAIU7ciDm
	D/bRmP/pMmDhFsD+Jb7WBFX0p4z/TsD2js6rwwCxcTgL/k70hjOUmTcmNJRyktyz58XbtmxhqYi
	sFq36MzjvTesqVXsb9FaY71ZDPUkhrqODxI6JcROz2JPnXEJoU41HLXGVTGq2qKwp/6riUG9wEH
	XIwo3WOz9qgaOAM7qoL1tVb7ozt5AE7ay68+Ax8dOjyw98RnzT36BwjpKx2wAEhYwGbVrmWa57X
	K4qDcBXzTxNGvhFI/aG3F8BYa2emP7xp+JomnLfrtqJ9kFu3tpJrDwx+/S4wsM0c/dwV90C7JhX
	WrSVXzdGkEYPbeVIJS9Lxf1Y264/3iT69LvoLsn63KEEB
X-Received: by 2002:a17:902:ea05:b0:298:68e:405e with SMTP id d9443c01a7336-29ec27f9101mr34852975ad.59.1765381680938;
        Wed, 10 Dec 2025 07:48:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjaz47RPM3BTgq+t2/uAuzI8RhqBQTqzjbVQ00bNUJHKcVw/21DQ6pw9tCiddYKcvs3IuIsA==
X-Received: by 2002:a17:902:ea05:b0:298:68e:405e with SMTP id d9443c01a7336-29ec27f9101mr34852465ad.59.1765381680496;
        Wed, 10 Dec 2025 07:48:00 -0800 (PST)
Received: from [192.168.0.171] ([49.205.251.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf9acsm185291845ad.28.2025.12.10.07.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 07:48:00 -0800 (PST)
Message-ID: <4411f6ee-478f-487e-8f95-bf0959363e97@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 21:17:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] media: iris: Move vpu register defines to common
 header file
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-4-8d11d840358a@oss.qualcomm.com>
 <4pxuzfdcwr56gtt4rjgodvtmf6cgprpb3czyrqjktx6qk5kryb@njj7xwtnnjpi>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <4pxuzfdcwr56gtt4rjgodvtmf6cgprpb3czyrqjktx6qk5kryb@njj7xwtnnjpi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEyOCBTYWx0ZWRfXxGZGB3Z5F7I+
 477UsF27OjUlCKTOXNve6D4WKDzK0YtBgVuYYAQEy1XX7oMP2gWxWm9W5AwBzIogY/c3PgORdvC
 O++dxZxgpbmnrMp+iEWQZoJZyJJMtuH45rOJ97PWx3WkwomKv6WL7bepeDygPzUXeHft+Sa5gMz
 2DdSfKzkxrq0Z/cpJqUzCqliOZQWtEt5Q2uIrPxXfqNONJgiHu/IL/yn9wNeLT0JXf8n7+rmBGJ
 wEeXFVcgYXIx0x+TURWM8H2+F2N6gFe7FwUsARCuHVjh37ycZ4dSa3ogpNDKuYFsXdv+PMKX4YB
 gF1ciGnosPg4jLGhkf/shqjcU9VRgBHGnbGEa59N7LfBjXdIQ7nkoUJFrs4l112KiLjmDciaU6X
 5decks7L8MKYjQ/TxOMiWP62oeENLw==
X-Proofpoint-ORIG-GUID: QPqIfRqPY7sElHKg6QfVUmWcwc5nbA9I
X-Proofpoint-GUID: QPqIfRqPY7sElHKg6QfVUmWcwc5nbA9I
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=69399632 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=oHgmLS9T6KHqMfKxrEeemw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=9GnT8YxiTCS33XBb7xIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100128


On 12/10/2025 8:33 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 10, 2025 at 06:06:02PM +0530, Vikash Garodia wrote:
>> Some of vpu4 register defines are common with vpu3x. Move those into the
>> common register defines header. This is done to reuse the defines for
>> vpu4 in subsequent patch which enables the power sequence for vpu4.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> You have missed my CdB / SoB tags here.

Sure thing.

Bryan,

let me know if you can add while raising the PR, or else i can send a 
new revision.

Regards,
Vikash


