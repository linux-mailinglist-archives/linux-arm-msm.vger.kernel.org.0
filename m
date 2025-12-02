Return-Path: <linux-arm-msm+bounces-84044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEFCC9A5E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 07:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9BB303442AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 06:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8369E2FFDD7;
	Tue,  2 Dec 2025 06:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tm1x6u/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="It+dzifX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7E82F693C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 06:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764658011; cv=none; b=HSxDfCv/JiWQhSoQGv+WqxVUW8E0dnE+rDlVHtf3sgQeX96qpCaWD7NTKmDVlRIdy0LoQT3AIcoL8mbg9qdLiZfnC0KUFrkRL8gssJYPMfoSiMLJ8dOf/Lc8php9tMwgVPmYDFOtd3YKmQbYksm3cb6/ROTIOOMEZJNLEYg9/QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764658011; c=relaxed/simple;
	bh=HBRCs1AamNdIJF/9dI73CjNFCUcBUeRCCzdf2pPAELE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WSxJn2oAtBPgiV3ePMvCAaWATawmG+ygOz6l5zNPRMv8ILbArIWqoo+qCIfkBYgOk3gud8oWsT2gtZOZSzjju/BnD9UenfXg9lb9avanteSUr0D0nzMuHnDB4pAyoe/Su8pXGgxz1Pjzs757yxqhxJCK4bA+Xbq5ZTS/hIJEX5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tm1x6u/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=It+dzifX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B24CMY11591143
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 06:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K4hL37ryfKZooua5z1CIMJEWGLQg5OaQgwxCnhTYPAQ=; b=Tm1x6u/aa6w4lcDg
	9h0ogcojFhU5dCkdlzetBnZukGQtZGwOu5J7sVsDBCunaUBREyVzNb9qrOxqmCMG
	W34974+XqzaiyWZ3N8QcPK6JzgVOkFjq3J1CDCxb47hmf77wmQUtqvvg6h/Q9GQf
	57JN2Kb+aAI8CUD5hP097QBAnA488r8ykQR1pYJhDBzL9hh47MJN5bYNlvqyWqmR
	nhQbqdHXFf1unmHFxgGrWZkSmS5FbcTKNzJHGDnzrW3zadNy79m/axS7YJeEGe5Z
	BgINIHr7vzK29cqiAvISKzY0f2Zy2fwhikao4BhDZqzZGAXsdfbTTC+A5fb41TKZ
	BVLkPg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asrvr8d8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:46:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bf5cdef41dso8209967b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 22:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764658009; x=1765262809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4hL37ryfKZooua5z1CIMJEWGLQg5OaQgwxCnhTYPAQ=;
        b=It+dzifXmUWnxFa1GAtdvcI8G8l0K/Cfrwtj7OPDXvBtuGGtHEnicXIAZy+6LCp6C0
         oPitYusK6SEmmXhAK3F0G4Bhhkt3hJq4qqBLSnJ6ZWRoOfZyAb+SpCnNEm/FAXjxNo8Z
         VhKJRZBNNQ5PH9okG18NNIFyTrbShTipmXlOKylfTHW31aWi06CjtbWv9GKElbQVo1Vo
         vXEY33waInM7qwNWL/9yzzlE7CTaIKSQDuG6gKzuXoXmXWtSM1mkWRCtf3WdqjAyUZ3B
         a64zJsiNH1YF7phok7VSCxV8gvDDIZ9MuF2AGvmvvdH71TdcqcIRT5PDxHMZcMQaJLbp
         cV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764658009; x=1765262809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4hL37ryfKZooua5z1CIMJEWGLQg5OaQgwxCnhTYPAQ=;
        b=VJJrJnThwNipC5zY2erCslXtC9Q1lvyJMY5X6kIeTAHVczf7YhxX8Ujjl6T3ozRgto
         XFuy+eeNM3Bd5WLzRttvuRhD1q65RAupDJbXo1NoarA80BLxiYhuwSlOI53krnuMsCMR
         92pCq+JlLTxHyIQwUDgQSawsNs6LALCL4tSofSV3CWu5MIoE4+rgBQ5nmuzC9U9KJbBE
         Dv6KySrC9z8ey5iu/sHh6WPYgfgZQ0Ceov9tK0otc+3Z8xvypT56Okg247e5oCcfmeOQ
         amLHzNEsRQmBCtZu59d+QOJzxafHFo7YUqLn4dX1U0PWLGMI30dtEBjgbzYGOOIYWuNM
         I7+A==
X-Forwarded-Encrypted: i=1; AJvYcCWpig2cB19RoEEQFIID2+wsp9FHD2yvMAUhBeWrCiohP2vJyLIxo5o/OOowfWJcMNcaNAA/NXS9BbsDfFKJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzMdTK76/2Fhjrw0dG5CYnOK3pVxXsl5MZS0LOa2hmKr3t+QB5+
	zCiEdsACh5L0txCjiQkVc7Ml31c5BndPmNHOX3JS5IB+TJAsKdEts+SMS7SvX18wjn9Slcr+Vec
	d5KDuBW9Q5ZdroteAdD9zHUK8Zh2wVGfQQwsOApGVpwSiwkCFAL0463tx7WBI6vrHukYK
X-Gm-Gg: ASbGncvDwvoCxGE0xpvQpTGxDs8w47+WxgOGjzIDK2HAHRXZ9itQ2KORIRzDJtigC9F
	2okPvLEDzdJNY6i9cLf/TgHYh+qptSMoDYtyrFF8PXM5DmO2qf20OLOCmTuxrMUWK+5MOci4GYw
	kZZ+ZMpGtwf8+3F/g3oxZGAq8SZ3plT7aVTF/CGOsBy7giqfR1+mbHLjB322saprNNZrIAjMvVI
	h+3ljyvQeq5vg7YB2CqhrOCkOWXkQweU4lmyeQxwnui0a4/jC8BqKLueU/22yOGr/98PQrnVRUL
	ek2BuMVwOCQXpgjW8UCOG/QT9ylYVyq8lIbI/iNethKs5Ianj0WhS24iYgZO6PB1IWTsLUeg6f8
	8CkCyaL0ntpGGPd+3Db8uIrpajYSSqBjlM/Zg72PgliUO2vkJbCEIGSHNWUKxbjUbTQREc3z5Te
	uBh+I=
X-Received: by 2002:a05:6a00:2d88:b0:7b9:ef46:ec70 with SMTP id d2e1a72fcca58-7c58e50c16emr36985260b3a.23.1764658008637;
        Mon, 01 Dec 2025 22:46:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBuB5Wxg4y4+7oDbzkOmJUFvZwkaOI7FxujqFNERmdby/NSN70EoNA8ohS8Y3cBB4eywIjsA==
X-Received: by 2002:a05:6a00:2d88:b0:7b9:ef46:ec70 with SMTP id d2e1a72fcca58-7c58e50c16emr36985231b3a.23.1764658008157;
        Mon, 01 Dec 2025 22:46:48 -0800 (PST)
Received: from [10.249.18.58] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f17877dsm15596931b3a.52.2025.12.01.22.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 22:46:47 -0800 (PST)
Message-ID: <820ea981-2fa4-48be-9bee-8936804bfd7a@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 14:46:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: qcom: iris: Add B frames support for encoder
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
 <0RpTUQpD7Q78IUmEj6-bUEv88YSaTJgDDRCijfUjARogqOhmeEA_EwzpNqYcEPUgHGaC7PfHqP51IBfGQCilfw==@protonmail.internalid>
 <20251127-batch2_iris_encoder_enhancements-v1-3-5ea78e2de2ae@oss.qualcomm.com>
 <a376aef7-2cbc-45bd-a0d0-745238681b4a@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <a376aef7-2cbc-45bd-a0d0-745238681b4a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D5VK6/Rj c=1 sm=1 tr=0 ts=692e8b59 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=k83K-hkaxLq1U7NWHuEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=7jBqKnKQzRwA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 6jNlVboZQrRs0bUzjD-fvvGumdLtJFDU
X-Proofpoint-GUID: 6jNlVboZQrRs0bUzjD-fvvGumdLtJFDU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA1MiBTYWx0ZWRfX9haGdO0mLFxQ
 uzHTNofCi/waRn7vetNbjPjCiLMiO8BSUo5LM7l/1NaNTGblHSUGbpXuCgvg/ZLu/1dJxDTxJkC
 vPfD+m7uu3wVWghxS856ZtrkLfzOXcE5yobJXJXTuZdJOXz1637ingnAORcG3N9tMvp97HqnjWZ
 UXGVQxF9v/dyzmFF4YysVucLb+qE71gwM475KXSzAC7DNxvsS2/d240k/eOBmZK78YYMbGiIig+
 /V4GeKRqZFp5LIkYDS5iWK5g1AWOkAOd7My3lj001D+9XD8+zszH1cPBS2tDuGc60onsxXgBPek
 BbKfOGF/U2S0bAQKEhuoxasyxZQ7lWmRlnqeMJH8sSCcl4ymrjeDo7zAwwOIfNylf7TY815LXFm
 XXcvo+Y7MQAWsUCQ+pTBPpfJ8+z2WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020052



On 2025/11/27 18:43, Bryan O'Donoghue wrote:
> On 27/11/2025 07:44, Wangao Wang wrote:
>> +    intra_period.pframes = (gop_size - 1) / (b_frame + 1);
>> +    intra_period.bframes = b_frame;
> 
> Why do you need to set pframes when setting bframes ?
> 
> ---
> bod

intra_period represents the length of a GOP, which includes both 
P-frames and B-frames. The counts of P-frames and B-frames within a GOP 
must be communicated to the firmware.

-- 
Best Regards,
Wangao


