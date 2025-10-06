Return-Path: <linux-arm-msm+bounces-76104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A1BBF261
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 22:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F28D189B9ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 20:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB26259C80;
	Mon,  6 Oct 2025 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VeRrI5GM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F171A0BF1
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 20:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759781150; cv=none; b=dhKpzzFfr/lY4voLpatK+WDDxvvxMW8/Q0Iw7rl8MXJVC1TiBW87o1/Sa6+ZxDU45hhEf3scuZIuiNW+3+Ouw66nYqdxFKXSzSmZro0/WE9Zwu4tHo+88sIrEon1ERAiunQDt7WG067Wk0EHucrTRb9Zv17EsVnYyOpGfJDFid0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759781150; c=relaxed/simple;
	bh=q1KvKmrtO8bl9Jw2x350Fw6zDSpeopygAF+ufzxztlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhBjCKCL2uJspb2l0N5EjmZ44Ilb6nzBOtI6EXY4FAvZ372S6N4vns3LUQTXb6gNl6tK53XmjbyyotMV701fQsKjtvwafTVU/+r7dzMgl6Xma7fIvkQYuHEE4aLYuCYDw3H7MlnzUrGwvSIJRZEyDcOCZudJ05qu6j8KY2oNiwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VeRrI5GM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596GlvtQ028753
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 20:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VokQyOdAkrZGe951REC0SHkH8iGG4oi8Wa5R5hbvWX8=; b=VeRrI5GM/WX4BhQw
	JxbMkXd7ca6eCCteTDGZk7kC7jov9DvGCDFSi3RtYj0kbAi/vWuB+X4HiYZwyHPk
	Cem8ph/EbQFyvHIWUGAsJAjQGXqFEv6SbKI90o+brGw07iZDpCAZo30OpCSSeW2X
	wn9trMaV6O9z3rJA4ZEwv0hsqTuK7R5Y0OaqplXsBE5XESfXxojRGMkGgEoJDZ7w
	MpMLTmYwpUcDPE0LOa0MEZEIcux6b6J5lT8D7X7uKjGpgkmj/JLwilT9nVwNk57j
	vz+Jtk6PYIII7oJhkAPmj9fRiXmji2tVAO2Dq1rsF/U4q1BcmqPmq+MRGTOdGyAI
	r/l13A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgn3bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 20:05:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so7197236a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 13:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759781145; x=1760385945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VokQyOdAkrZGe951REC0SHkH8iGG4oi8Wa5R5hbvWX8=;
        b=UutSkkhIZHyrpyJ7bM/GX0aqhbuSzR4f6+OwAS5wul12cUMcOGJXXdwyKKt+LgwT6t
         SOz0SVbMJLg1MaC+cuujWRUZIJiqiLD9voaDMNm2GdXqRn+tcHC+cayXcygIgiarJ5Nr
         tuAw9pgQXz/hSek2QGceu2Ukkmt95goS8WYA0t11+NHDrzsUGbbJ6ZEBzc9ov6q7HcEW
         qsYuwMOmhdgiDIlY9vvZ5PflvzgPG9JX2XsRxZThNfze+QR052DRKiFONIqtJ1z36iaX
         hfxVq2xxIWmTKXLtqGDrV/Z6YtGw3sroSyu/UhXdLmYjTMdxLXgLCxrSNngDvRC5iFH3
         PTnw==
X-Gm-Message-State: AOJu0YyJ358OAL0AlWPGD56xdGhJL2J944hCuqkV+yrMKLI5hyUFPTum
	QLgfXs9cVNY/Olqidpcsem3b8rVaNqa+tGTzqIfmmLsxLyYs1Hirx9HndvPMH3W4Ld6LufQwKi+
	7JGo64TUALwr4f/YvgwfuS+AQgIqkMXSSocXh2h1NQSvh63WCoD43PNv3/UBgSV39+1sJ
X-Gm-Gg: ASbGncvE36oJD6ZrsWLnxWmKS0DqYjSj7PNH9F0eSLtfg5TEV626Inu4er/bVXV4Zm1
	nEidLx1pGsbFlc3OOP/7eXbTzh4W1FYi3mHgszBdG9O7TPPG/UzKcq/HZzftIYFYsIz/pVikdQm
	RX9UJWUCOVniTc4ydfswdSnIkP7/bxhxmg1Kqx17Y1LI6VqHnCMBGtBeAfqMC27kIql/T6y8Pw5
	PLGbySYTw0apcUJBqfVEWGorCmS1wI+19XDBpRWRLx8BH0LiJ0Td7qz6b0uhKaLLrwFx7RYMp3c
	nzNzCSOFXz7uMgeA1NNPMNgFPtDe/fyLFG5w5fTtHTK29pu+gsffwN5yu4J/x5n93yfkQs8OEpR
	ROe33a468ZXVgPmxvApY=
X-Received: by 2002:a17:90b:1c8b:b0:32b:65e6:ec48 with SMTP id 98e67ed59e1d1-339c2707c6bmr17476065a91.8.1759781145353;
        Mon, 06 Oct 2025 13:05:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrIzvI/Ib4q5OWm/SKnkikSDyMwUjwzWH6VNDAasyPGsw6dl537x1y+EL1bAHyFVRtexfFew==
X-Received: by 2002:a17:90b:1c8b:b0:32b:65e6:ec48 with SMTP id 98e67ed59e1d1-339c2707c6bmr17476025a91.8.1759781144886;
        Mon, 06 Oct 2025 13:05:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339c4a0c666sm11899960a91.1.2025.10.06.13.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 13:05:44 -0700 (PDT)
Message-ID: <cd8454a6-8b4c-4aa4-a510-98797d844d4f@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:05:43 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/qaic: Replace kzalloc + copy_from_user with
 memdup_user
To: Thorsten Blum <thorsten.blum@linux.dev>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250917124805.90395-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250917124805.90395-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfXxhCShKuw0LM2
 xpsf4OJPxMPb6lF4AWMMRsSaOuPWci6LJ5NiDcJP1eR4IWGpPfSPR5SZlyBbWyiIAYnGj9R9HoY
 xImGAQM9luWcWNWxXclijWcSJMjogS/0iXJWtXbrvfliIdWT0Iiuipmqn8y5cyp/dxWHqF3Q4C8
 2GirTrrq6bHYwGj9G/mDpH5BqdyOCa2J3NdaTF/XrrNK7/msam/ff9ptpjM4Cy1cQn97mViseZS
 2H/r8QRkS077oO/ek7ECa7LdhqUIpDVnpkrEcabD2+8ANQfjV3S8inHLBNMmGXECpqqL7p8+7RX
 +MIaUCTXL6TP42xqmUZxl63ETb8X5Md2spExOF8+XTAkYctpUPWuwhOO0iRqWsjqW9XsTWaMT53
 wULJG2oo2hYKXCvwCGgyM+OJ3ULMGw==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e4211a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3NveYEIoZWvbRhgcYaYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: KYlQDKzO9DlJzmFmPksRfjWp_LUh2CzK
X-Proofpoint-ORIG-GUID: KYlQDKzO9DlJzmFmPksRfjWp_LUh2CzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On 9/17/2025 6:48 AM, Thorsten Blum wrote:
> Replace kzalloc() followed by copy_from_user() with memdup_user() to
> improve and simplify qaic_attach_slice_bo_ioctl().
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

