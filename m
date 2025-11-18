Return-Path: <linux-arm-msm+bounces-82352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B4C6A34E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 1C82129DBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61D821765B;
	Tue, 18 Nov 2025 15:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9lpkOE1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evnS+Vmg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFC2328619
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478131; cv=none; b=Hg2KE6Tad8LdR3Ais8rNzy2Z0jVKl6Z8LrSu3PJuH55TIRbb5sTwZy0NFgy5NZck6PtB/JcYwaT57Idw7O1LwEJJL6ImmFe2QisDByfcffjfDZ48wQsPFtUf9lsKnS9qKTQPaoDQ3fcMbqE3FueiWEL9m0WpaO79039SS1LwuTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478131; c=relaxed/simple;
	bh=SBbZ8nM5bqtv/viWW1QPWBqWMd8EdQfarnXMZTsO5H8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3N6EDwzAEIYGfm/tyXW/Lkh+0/5EOIFddTesMXYgp6tdhYuASQ9r/r/2a3P7+Tg5XnYgYlrjflg7RDBOqneVF0nZW9lPLpcJdpp+/DzrBLIdo3njIzXovuamqIG1c9RbdKW3iNBrUxYC1fzTlmacTn5p0H6kckLmui+Wzpn0OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9lpkOE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evnS+Vmg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8E1Gg2194366
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUrNSJYTmXMjoKKQD9ZpQXQjK57lxOnUpWoKKuPXIJc=; b=L9lpkOE1wnySmBQK
	DLzhtmybslY8dr0oLi5h3Dvu4iYKrvMm/0dXzVYgMYt43Q0ZvNXsG4J1mn6sdMEG
	6JvTnz2ygfgemLAEMvMVSx/Wji+c8ZnzosgHCs6hTQmc/+D08O1VjydVzQqQpb5b
	PSsolpA7wy9hYa0+mwjvqEizvoF76yeN37jW7rQmhx5qOjQR63+9ypOBPJHxV20j
	5fYG5A8HP61o21ecoPoq0PaMl6ZiMfVOhSMJr/r6oeYjDDVOb3yVuDMIr6oyLmSz
	XfwvSjAvuWfLpopyhYerQpGOrAolpEgERyUBT3Joz7L/Vlgkz+Ru6SnENItyULuw
	yYCUIg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y94xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:02:09 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55976a7c782so680538e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763478128; x=1764082928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUrNSJYTmXMjoKKQD9ZpQXQjK57lxOnUpWoKKuPXIJc=;
        b=evnS+Vmgm5kbPVOr03j3QAY+6gFmN7MWY1zegNno2UglaeDfmHcd25RHOEv4bcAGzj
         zVs8O+RRG6YdrsHqOp35+Hxy/jcmxAzdSfQKK/Cd7nN6QUD0rls8J49FMqGGVzMdsoQ6
         /+BllhLdsW9bj0iihHpLf/+55nWRW24Zo8IqVoH0hquZrbbFzUVs3NzXYk+ytyGvindv
         Rk5mbM1GAnMZodrj6rQ3N3KWuhaurLt9T4ccf9GixhEZWkMBdOFQg1yLNgSQs4rjy0X6
         EEXYGxCbxHfCPfFhO+YN/FDljYKGVz8YmrIltXwk7JfF4TnPvGwgFIiRV8gFsxER9unG
         9U5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478128; x=1764082928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUrNSJYTmXMjoKKQD9ZpQXQjK57lxOnUpWoKKuPXIJc=;
        b=NQMPX3BY0n1HhP0nfiLC9ZYDiHG4Bn32xPMh+mZGOUtQfLKKME6CdHivZSu+pFAHxb
         NhD/d9qY9QCPdwQxRb6q8LYGSbar2KEqQBpqN6keRr+WUqLvyOJt56b6YDWRuL7XAsYq
         2FwHRfCY7O6BbsT8EFxHzCPHGrgejOry2esB6u5HFGMjiOwmXr+MAYF30f5tzpOfJr5a
         YmmggcEFImvap9unxdpYcoLRYhql9+VUN0NNzOEdFZICjwEOFdvjnVI2ywhw69LJTnT5
         APJR/OIvy/Pf5BC09rBIAnGeLSInklD3mlo+Z7hzi0AdV3q5AduYuAzOVy07D7IF9Qe5
         IzSg==
X-Gm-Message-State: AOJu0Yw+Xb38SFTJWtumoyXYlhuf4ZHsfNRKZDGva/pECnPNFOtzro9e
	URyG4qbA1NfMQYaulha2Uf2uBYocI9mxlHB9G5Lk8buUFoO1MZK2fBgjSmbGS2Aix0B14yed0GG
	z0gZkBlTzkVF3VlRHZMpm1GWgbp9FR63Tznvm8nwzxikjp33/2rfLhcqCBoDhsxLQZeFh
X-Gm-Gg: ASbGncu2q1U3DU+9iyZiHxn0Rrsro7+44pPGBXq5ypjsf9SYsxzvi/BR7kgJXqYG5X/
	Ci80pFnXqFyY81rdtXoL1G6xvtnAcR2muh2ATzukoCXC6LuYoL6A0k1eLC0HIQmgSsJMLldOzxx
	DdPeJ+RJnESPycCVj2WvQ9qCCMKvPRDv2imVNoJqz33UWe4QZrUUAGm4l7cy47C/YeuQj7KT2ne
	oSszv447xRLGqEiLQUeW8KxOCeg7uIzTsgpHcZD5fJdmLJ9uB5dd9CZWTLAHnRinVvctwd33/JT
	kXFTxD8pQxa7CmBN3QUzqxh9h+Uh8il/LMsUuaSUx5unDfuG4sy2NIh4xEeJ1hER7ZFqKYxvOBD
	6HspRtIL54l/xRuZCwd3mzpz+BiBEM2zV+TfMtAIS5ND2mqJXZfhiCzyXqFq+NJGRIZ0=
X-Received: by 2002:a05:6122:c295:b0:559:965e:f563 with SMTP id 71dfb90a1353d-55b6022382dmr294125e0c.1.1763478128173;
        Tue, 18 Nov 2025 07:02:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNdpAi9psxKjHYX6MDx32SWpcDAp7KKwR/Qhg/KcXuexIH+OyCn//NR5c0LhHORUR9Ji1u2A==
X-Received: by 2002:a05:6122:c295:b0:559:965e:f563 with SMTP id 71dfb90a1353d-55b6022382dmr294061e0c.1.1763478127363;
        Tue, 18 Nov 2025 07:02:07 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f8767sm13141599a12.9.2025.11.18.07.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 07:02:06 -0800 (PST)
Message-ID: <5c2e47f0-ba96-4433-b13e-9e819cfe2204@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:02:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/2] drm/msm/dpu: use full scale alpha in
 _dpu_crtc_setup_blend_cfg()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
 <20251118-dpu-rework-alpha-v1-2-293d39402b59@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dpu-rework-alpha-v1-2-293d39402b59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyMSBTYWx0ZWRfX5aZrGzaD9mDI
 pIw9pkxk+b0yxZC15LAKVLe6F1bVsMNqe53jfqfIBe8Sv7M/XNUtM0XFDjg3JfxO6TluXpfubtW
 J9bUUB6g8eh3zy6ONOAt+JxMiW6R/WmlKPY67NzInvo6ziKGWH5BOjet4pDqRTKpVAlrQbcYY9w
 ahYx5c93sNxBs3By5OEsRbBiS5R61mZK8vfRYNxcdmC9eChTS17T5t3g8f/suoF3uFTI48m/JqO
 d6LZIXOMzYI9vZD8l8Iv6XuiPchtfY39nmXQLDy0xN7Mnii2qmjcPxu329bPdyNt/iBdqAHHlhB
 /ULEMIsRoVOzGMTWvQ6HYvfxYfmDuh8qBSdWF5k4O4jWL5JhepwnZSo2KA51zcOLC/NkTCm93CK
 NK4P7E6suyphEmpenhY7sSzZOUWHfQ==
X-Proofpoint-GUID: 1hNL0t3Wos3cXA_OvbFjSvqWnJsKQfrI
X-Proofpoint-ORIG-GUID: 1hNL0t3Wos3cXA_OvbFjSvqWnJsKQfrI
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c8a71 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=08wX0RkXSFUxxunu3nEA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180121

On 11/18/25 3:51 PM, Dmitry Baryshkov wrote:
> Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
> callbacks embed knowledge about platform's alpha range (8-bit or
> 10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
> alpha and reduce alpha only in DPU-specific callbacks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> -	const_alpha = (bg_alpha & 0xFF) | ((fg_alpha & 0xFF) << 16);
> +	const_alpha = ((bg_alpha >> 8) & 0xff) |
> +		(((fg_alpha >> 8) & 0xff) << 16);

This begs for some bitfield.h

Konrad

>  	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA + stage_off, const_alpha);
>  	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
>  }
> @@ -160,7 +161,8 @@ dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
>  	if (WARN_ON(stage_off < 0))
>  		return;
>  
> -	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
> +	const_alpha = ((bg_alpha >> 6) & 0x3ff) |
> +		(((fg_alpha >> 6) & 0x3ff) << 16);
>  	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
>  	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
>  }
> @@ -178,8 +180,8 @@ static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
>  	if (WARN_ON(stage_off < 0))
>  		return;
>  
> -	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha);
> -	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha);
> +	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha >> 8);
> +	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha >> 8);
>  	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
>  }
>  
> 

