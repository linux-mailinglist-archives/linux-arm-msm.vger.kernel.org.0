Return-Path: <linux-arm-msm+bounces-80390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A198C33D0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 03:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 13DAA4E06D3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 02:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C65225783C;
	Wed,  5 Nov 2025 02:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESaHGw9t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Up8JH04v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DD021CC58
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 02:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762311430; cv=none; b=aZPQRsDSbGY+4wD6OyL9M+8HBu823fJGZek3+9ctYnjviPBTiUxnjXfnewGJvI6xNjoeUJINQwPWgXATvNghzThIz7uKmRWazULnBAjZG8d42JQ1slRFhUSfzrqnFUelW7hX0Lg1so1AvHstnWabeytFuFgGvjTMGgwDMmxd+mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762311430; c=relaxed/simple;
	bh=/xGLt1M8kqid+LM9NaX2QqSx9NUMXvIrQuDmRDm8RG4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f9+ZS5PoambfN4Ee9Y8ahgWwGOSUrbjtc6mvUuE3ef/fHNef70LIxsnEgVYS7OIOh9nvNG6o9AyW+29GsSCkWC9OFkC7+oYpytaK8XxIN+HG2/aUYem1Jp4MQb8VQ+e5yp83/k0zZ1JDMoSYROsgdlL1CyrhVn2I1wu9iEBBVmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESaHGw9t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Up8JH04v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KgDwc3086286
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 02:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Id0Enz3QtMwKYEBuECkWjlnGm5hIArkDcvoo96ONleE=; b=ESaHGw9tgpqQKC9T
	hkzvwioH4rQ0+QPyzXOTEoFQc7WStD3ljw99GW1+/MsdH8Rke6z0RysIqPh0G8GB
	/RqmXHcAW5j+IASLUa4Q8/EjkPZ+TP7gs/fVxuy4yYSAGkx3/r4b6KIjWPgiBnnS
	fyfDwJ8j3Nm7Mow06sg/AcHAynTL2nmb3+L4eF5zZGRBUH2hCepl6sDzLO/YOGa8
	GRiUsIUFZeycx6/C+5lg+vq1+zePMc3vT9DSnRWpErbSjfi7PKENhsvwYbpz6zSM
	Kbidsril2EdpEaIS+EUCxe5R1M3tS8Sdbh5Zyh35ZXZ3iRJnkT2dTNrxBNUxL7ll
	FOeoRg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a79jjutp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 02:57:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28eb14e3cafso119402095ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 18:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762311426; x=1762916226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Id0Enz3QtMwKYEBuECkWjlnGm5hIArkDcvoo96ONleE=;
        b=Up8JH04vyydkI51ocr1zFJfA/kfleMULrla98Ay/a/FOFnH6gbIQjo24TTHVLEA7/j
         +wpQkygM57gaiiE7llxi9XkwLNnveJzn0MnhmVPeOcM13FU7jlrgwSQct+FaDAROmMYi
         p6PY77JN+rjdcuNc55JXiDeWQ3bEDJgjmjyTB1X1SpO4CX/hqT/pl3RmvLUZ9Be+FgqW
         6g9IKAMHCIvjyMkIcP0cetwSeUkFxvNkiuDfQMWRV3zbsJpGNC7V7P5hpLm7JH67pUl8
         jHM7kmNF6JWZVuhQpVbiQLOgjdeKjDHgcma659ub55i4RZs6FloDzvF2KDWqz76HGJcU
         oE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762311426; x=1762916226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Id0Enz3QtMwKYEBuECkWjlnGm5hIArkDcvoo96ONleE=;
        b=qHxJlhR1xbaqOzC0ph/BGo58UM8huv9W3OujItux8steiBUERIhz4SO83PnIp0+mMu
         du0DGg0GoSNl7cbJIMZi4GVthjkYp0UngUEub7bgCbvhY5ve0UG8XkE1NT+sVWA5Pg+N
         WjsphRVsIZttyA979LW+9bBPTTGDBnn4nsAmBseX/32LbRkf/GxjiOcKNpQnqmk+kMeQ
         aoeZUmad5zCwZOzkqmS2XxbrkUOwO/GBY50c9VS5EQpSgjso958kAfVQ0b7wxGHX39D9
         fHP4uwgqCWTzseb1/dQEVGwukRmSJzd5G8PxmGN2QuO+FHbWdunjGHXDSQS2QcUTSxpV
         7EqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS+FqyKfjU/57nDB5JI8c0A6u93V93Nrx6uRsuFiS75jOnqCc/KKp8S1JB9JmSnBx2kiXkR2FMDxN7ot3f@vger.kernel.org
X-Gm-Message-State: AOJu0YxE2kCsQ3dfpNLh3oTR789RF/bhYF90BVxFQZtf/MIXn04Dq1Z8
	rlHPKDCUJCXP6E2KmISukIUGX3nYUVpKKi3485kh5S2YBeFRQh6wpZ8VCsEIN+/UfdUiXtEblGU
	qDjw65ZzRfuAfYD7hOzG3SFMMiNOtoGLK3SHe6WbNnyN8bwAlIDGy8GeVQjgMHNhCTy1N
X-Gm-Gg: ASbGncv9Xn0lYQbEzJLlAdiPK46hrzdOd7Wr1bOqp6k2xoeAKqfrx1i2vuMZT0JcAhm
	0i99GGUf267WYJvVUVLqsQM/rg6I8s3+zf79RqmGRl9RqapQ/4EvhV6wTOrdC92czlV8fKeE0fH
	YYlg055JZor7t3sNgEIx0iV8HvcInF3KrXkZwJhsFG2YMfqemHB2RBMqkeowcbMbQSeSH9yLkp/
	BBqWOAhgoZ2t8jm1Gt4ksr1nCI6fPzNmBKqN0/YteGgOpXVORllVmoABX/nB2FoIBm7IKPIfcYE
	ESuxpAgrHDW65rXcVPxWYdrLyAtUpepQtRfj6cIRxFlxbKXW5z+yozgjVtoFQNbIaOeKZpB4a0H
	Sdjrtz/+HviuHkAFkDeAmB/r8iYC261g95W8h+0puSREDaPj6sZQ1qqb4D42UVhOZ/NngIg==
X-Received: by 2002:a17:903:15cf:b0:288:e46d:b32b with SMTP id d9443c01a7336-2962ad1ef65mr22622295ad.17.1762311425913;
        Tue, 04 Nov 2025 18:57:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmn8PlqOZibBgWAikhbFKXMfNC3CBi1fZULnHntTnSKn2o8RRQsfXr3d5z9bpodnixlYrrcA==
X-Received: by 2002:a17:903:15cf:b0:288:e46d:b32b with SMTP id d9443c01a7336-2962ad1ef65mr22621835ad.17.1762311425118;
        Tue, 04 Nov 2025 18:57:05 -0800 (PST)
Received: from [10.249.21.117] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a381edsm43541075ad.71.2025.11.04.18.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 18:57:04 -0800 (PST)
Message-ID: <e924f9f9-88b3-4c0f-a326-80cd80abc765@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:57:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
Subject: Re: [PATCH v3 1/5] media: qcom: iris: Improve format alignment for
 encoder
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251104-iris_encoder_enhancements-v3-0-63b0c431b4d0@oss.qualcomm.com>
 <k3umzf0z69-Hbh7jbT-Gjp4pyquNAYVC3VfIXQcdVZstI5FTtcGU_NEgb8l796Z3Cr6Dz0DQ0BoVQQPd4fr6sQ==@protonmail.internalid>
 <20251104-iris_encoder_enhancements-v3-1-63b0c431b4d0@oss.qualcomm.com>
 <0735f540-8085-440c-9c0f-7ac23b52b838@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <0735f540-8085-440c-9c0f-7ac23b52b838@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uVGnTIqH58gdS8xmQzJ8JCwLyr3QgED8
X-Proofpoint-ORIG-GUID: uVGnTIqH58gdS8xmQzJ8JCwLyr3QgED8
X-Authority-Analysis: v=2.4 cv=TuPrRTXh c=1 sm=1 tr=0 ts=690abd03 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ozsb_Tqo4S_mXzr4DdMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAxOCBTYWx0ZWRfX1G3CshkwSyyM
 /Ubp8hDcNBkqgcoJwniEoD/l1vlm8ln20unpxzJoc5eatXIN4S7Z8SG1HymPcrV8uhv82iI2h33
 5dAVfG3k/2TzLm5ZhJcmL1evjhXZu+PW8Tkx2NybygHDWpGz3NlG5RzH8H9DXh8xJ8/JqvkuNYr
 nDXfK6iuUjZqjwI2R50xmWYAkH23y4B0hID2rcho+vjQO1Pt4qG1OWCVrOFBIu0wJGdxR/VaxHK
 Pg28k4C/Z9AgcjsHKp34rcvdXplZbuliTIWbd88XE862spCWu7qzYN2RnQ/X9zlDQ8DLPnoJFTG
 fDVFbto8GDwERU3HEopg7dG+fB2OEwsrgeQQCpZw11oKxut7SWL76N5cPXQU0WRDANHiOp0kdpC
 f8GHkUGazACdNumtD8hhn0shmZV3gQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050018

On 2025/11/4 18:39, Bryan O'Donoghue wrote:
> 
> To me reading this patch you seem to have three or four different 
> alignment changed bunched into one.
> 
> I would prefer to see more granular and specific patches for each change.
> 
> Please break this up into more bite size chunks.
> 
> ---
> bod

Yes, this patch does two things: first, it uses the actual YUV 
resolution for raw resolution instead of the aligned one; second, it 
improves the handling of crop_offset.

I will split it into two patches in v4.

-- 
Best Regards,
Wangao


