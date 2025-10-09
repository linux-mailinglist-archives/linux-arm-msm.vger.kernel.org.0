Return-Path: <linux-arm-msm+bounces-76540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EFABC77F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 08:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2D4633513AA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 06:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05524291C3F;
	Thu,  9 Oct 2025 06:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyyqkTsg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5678A17A2EB
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 06:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759990233; cv=none; b=siInszE+bgpN4gFDkn/n77f/NxFFEK27n2+daJ0qYhwkWu8L/N6PeCg+cWdnbTjKhdwZS2sEQ7aqp/8nC0F6ymTZdR950m0tqgxMA/POehbDvjch07YoDU/AYAOy9VGvquB6tg2Nm1/mk31VUfjh5fevrxo00uS82sskHpck/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759990233; c=relaxed/simple;
	bh=R/eXAjaMfHdpAwS1lvKHXiIORX3j2EhpsuOSE+5Ua68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r28dnoVlOh0yPoDp4Nm9GoLhNqm8eEuJjqfBPZgwUCCZhAO26CyaLdobSlSJjkzyg+7P5Q8QBg7VRxubprrWMS+jA1cw/jU624MQBcwJ+eRtBn7JhfERcmD6f3x3Qi6dc1G52qgfG11+g+Qm/31rRlvYLGXsrIMhMgiI95I8i/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyyqkTsg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5aG7002372
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 06:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ivuytCo7LdhVv/zr06HOBGWhCc5t1GjdXmjjonLePS0=; b=oyyqkTsgK2g3uJ29
	GgteAff4nJDB0bLzte7q/sT4AIEFyh/u5Mq4ujFTg9AxbubCvOBPEkmI8W07hCYj
	w5P46SarHulv3dAp7nkY2j9GIG6ohTYxmXrjGHuve3Kbz1XEIMkbQs312yhWhWxB
	X7yTc9vsRf3kUJTJpm5uJ1uuVTt2YcwFKMjQiYIg6/JMLrNm/7xW3jUeih777dyV
	/MPphLVd53FvI5q0J6GTAYGEybkQqFzfMOWBlamAQ8OHc0dRq6JDkTdd0RH9uTh0
	Qq5oOUDUfV7pI3AlnBfKV9awwV3XQH+LLmU7GX5A/WfyEqD/zmV4g7MC8a5NCo2k
	g4KDJg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ksp9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 06:10:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78427dae77eso843757b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 23:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759990231; x=1760595031;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivuytCo7LdhVv/zr06HOBGWhCc5t1GjdXmjjonLePS0=;
        b=qtDnr0KDh94qzQGz28Ms3ggVzBxHMHoMluS46+GJad/AIJl+64EyoaFOwL/BeVbpGA
         JIhXJY6dj2ctXY9tvsUTbZXQF445ekfsg/YTHW2bgwxJtFXhxBcH4RKIJ7FNWp5KUYtD
         TYaeotVdQHYkeYV5DT6OIh5eHaVp30BzIR/zKdT2tycQM5ZLZW3T5/w5LZ4swXtySh78
         Q+hAvC8nqxyjIKh3lU5w8LtK6llOPu7vsDxfWkP4lixro/u4bzBw3W2usy3mbIBwNQ46
         bC5bKbT45eOODQjBepuBJcZz465oezr9krFEnVj2rgRWKnaGzvsHSmoGCjk5CMI0Qd93
         Bm0w==
X-Forwarded-Encrypted: i=1; AJvYcCWYeeMvTBvY0uvnyUcaK5PNDmexxEmIwgnbvLrs45b5G50IjIeeOTYCrWI1dzPJqp5NUaUdx53Doq9EU8aj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxul/fxkutRYK1BGtFWONOFIlygIWZnQtEJm54GnFcnFhqjmW5L
	on17+Ly5XI/lDKmfvTgtt5BALM2PKgtKkkWBBrgUn+5pzeXoPeITvE8paVCreuqlj1omchZPzTt
	MJV8pYyNQallPpc+yk6mJ8l4r6RGmEfe4NhiJO3C3A7zfALA+XaXZaC+bhbqT61O+o0Jj
X-Gm-Gg: ASbGncsRfal1AiO92E0TEvYk2DE0sk14fJqxACcuJ7EOxXdw1a0pPN1l7GMc8DHV3Nv
	EfBZpDOzG7I5xXDjFngLYE1PYaeLHnF3RZkKAkgI7A9TTxhrBIb+rflQMaehTGeu9OZXkvlyiVd
	7u249BocxhBbjqGURg5lmj1Ss3Y7nhUpmq1LLpqJG3XcfeFKrnhUyiJDvtmEFOWdaj6OaokQbBE
	iCio3wzR9OWPq/xYurf+m5s4kbkb6yEpWLsLfyyBT04dC+CNrojOsh0BwUw6pZ7WaYLFPel7XxA
	iB+Xu/XJoR2P5yYQQhB1r1xpfIkFY/8GfRymRLohVdySFzaSlPFkXjVm2XOuISwYPfkLPurUBW+
	8kw==
X-Received: by 2002:a05:6a20:430e:b0:245:4181:e1ff with SMTP id adf61e73a8af0-32da8130c8amr8959307637.14.1759990230532;
        Wed, 08 Oct 2025 23:10:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5r/qNCWsxiulxREssg/rKy9mYecqFg1wGhLqe8k6wn9pxBQuJdPqZTt6pMXVlxTHcmetRJw==
X-Received: by 2002:a05:6a20:430e:b0:245:4181:e1ff with SMTP id adf61e73a8af0-32da8130c8amr8959274637.14.1759990229985;
        Wed, 08 Oct 2025 23:10:29 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b510e904bsm5592569a91.3.2025.10.08.23.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 23:10:29 -0700 (PDT)
Message-ID: <b7eba4b5-1189-7506-4767-0ef3234fc6f2@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:40:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 7/8] media: iris: move common register definitions to the
 header
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-7-def050ba5e1f@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-7-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX061qyOqCycl/
 z1+KeRGbCDOWlX71vUOLVnHWwHJo6CbbvGocOPbYIYlSpG3+ezYXKD1uH0OpWIWjkeeOypzqvHn
 trvHIK7VrgGrErk5ZF5hMYjlelFR2wP1DxU6NKnF4lcKiHBFrvUZAl5TgBDOMa6HpBJi4ecAogV
 tS4IFESN2P+zkQE1PcMeimZLJM3Wlrs0lP3USRkwKA5wntF8AGgsljS2Mo51z8lU1nRJpFbHu06
 HExQMXAdkw/T6A5dSkjO1JVUmbUU78fFEDNZe9vqZXzGEv5wJhpxhCbbL3Xr81xIB5S10PjS+pN
 qhLeSNMEtGGjcBfa5KHRCZZ110TTukhe9tXaFxYd+1+q1mk0ker52YZ6GU9juzTCjvZ7Of1ymgO
 C2g4PAMoSZLeJb7nOWrWdWmqtdxNmQ==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e751d7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Xv1zr1GVMwzzYKxCC1gA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: W-J_B2VrGi0JxjIbPLJu4AfdY-idN06a
X-Proofpoint-ORIG-GUID: W-J_B2VrGi0JxjIbPLJu4AfdY-idN06a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 10/8/2025 10:03 AM, Dmitry Baryshkov wrote:
> Simplify adding new platforms by moving common registers definitions
> from VPU 3.x and "common" file to the header with other register
> defines.
> 

Similar to
https://lore.kernel.org/all/20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com/
?

Thanks,
Dikshita
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 35 --------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 43 -----------------
>  .../platform/qcom/iris/iris_vpu_register_defines.h | 56 ++++++++++++++++++++++
>  3 files changed, 56 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 339776a0b4672e246848c3a6a260eb83c7da6a60..78aede9ac497abafc0545647c34a53c63c595f72 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -11,48 +11,13 @@
>  #include "iris_vpu_common.h"
>  #include "iris_vpu_register_defines.h"
>  
> -#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> -#define AON_BASE_OFFS				0x000E0000
>  #define AON_MVP_NOC_RESET			0x0001F000
>  
> -#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> -#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> -#define REQ_POWER_DOWN_PREP			BIT(0)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> -#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
> -#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
> -#define NOC_LPI_STATUS_ACTIVE		BIT(2) /* Indicates the NOC is active */
> -#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
> -#define CORE_CLK_RUN				0x0
> -/* VPU v3.5 */
> -#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
> -
> -#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> -#define CTL_AXI_CLK_HALT			BIT(0)
> -#define CTL_CLK_HALT				BIT(1)
> -
> -#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> -#define RESET_HIGH				BIT(0)
> -
> -#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
> -#define CORE_BRIDGE_SW_RESET			BIT(0)
> -#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> -
> -#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> -#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> -#define MSK_CORE_POWER_ON			BIT(1)
> -
>  #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>  #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
>  
>  #define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
>  
> -#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> -
> -#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> -#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> -
>  #define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
>  #define SW_RESET				BIT(0)
>  #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index bb98950e018fadf69ac4f41b3037f7fd6ac33c5b..2d6548e47d47967c1c110489cb8088130fb625fd 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -11,13 +11,6 @@
>  #include "iris_vpu_common.h"
>  #include "iris_vpu_register_defines.h"
>  
> -#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> -#define AON_BASE_OFFS				0x000E0000
> -
> -#define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
> -
> -#define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
> -#define CLEAR_XTENSA2HOST_INTR			BIT(0)
>  
>  #define CTRL_INIT				(CPU_CS_BASE_OFFS + 0x48)
>  #define CTRL_STATUS				(CPU_CS_BASE_OFFS + 0x4C)
> @@ -35,42 +28,6 @@
>  #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
>  #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
>  
> -#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
> -#define HOST2XTENSA_INTR_ENABLE			BIT(0)
> -
> -#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> -#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> -#define MSK_CORE_POWER_ON			BIT(1)
> -
> -#define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
> -#define CPU_IC_SOFTINT_H2A_SHFT			0x0
> -
> -#define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
> -#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
> -#define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
> -
> -#define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)
> -#define WRAPPER_INTR_MASK_A2HWD_BMSK		BIT(3)
> -#define WRAPPER_INTR_MASK_A2HCPU_BMSK		BIT(2)
> -
> -#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> -#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> -
> -#define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
> -#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> -#define CTL_AXI_CLK_HALT			BIT(0)
> -#define CTL_CLK_HALT				BIT(1)
> -
> -#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> -#define RESET_HIGH				BIT(0)
> -
> -#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> -#define REQ_POWER_DOWN_PREP			BIT(0)
> -
> -#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> -
>  static void iris_vpu_interrupt_init(struct iris_core *core)
>  {
>  	u32 mask_val;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> index fe8a39e5e5a3fc68dc3a706ffdba07a5558163cf..9955367a9f8179d2e364c41dcfe8ad445a0a13f4 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> @@ -9,9 +9,65 @@
>  #define VCODEC_BASE_OFFS			0x00000000
>  #define CPU_BASE_OFFS				0x000A0000
>  #define WRAPPER_BASE_OFFS			0x000B0000
> +#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> +#define AON_BASE_OFFS				0x000E0000
> +
> +#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
>  
>  #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
>  
> +#define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
> +#define CLEAR_XTENSA2HOST_INTR			BIT(0)
> +
> +#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
> +#define HOST2XTENSA_INTR_ENABLE			BIT(0)
> +
> +#define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
> +#define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
> +#define CPU_IC_SOFTINT_H2A_SHFT			0x0
> +
> +#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
> +#define CORE_BRIDGE_SW_RESET			BIT(0)
> +#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> +
> +#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> +#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> +#define MSK_CORE_POWER_ON			BIT(1)
> +
> +#define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
> +#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
> +#define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
> +
> +#define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)
> +#define WRAPPER_INTR_MASK_A2HWD_BMSK		BIT(3)
> +#define WRAPPER_INTR_MASK_A2HCPU_BMSK		BIT(2)
> +
>  #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
> +#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> +#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> +#define REQ_POWER_DOWN_PREP			BIT(0)
> +
> +#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> +#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
> +#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
> +#define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
> +
> +#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
> +
> +#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
> +#define CORE_CLK_RUN				0x0
> +
> +#define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
> +
> +#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> +#define CTL_AXI_CLK_HALT			BIT(0)
> +#define CTL_CLK_HALT				BIT(1)
> +
> +#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> +#define RESET_HIGH				BIT(0)
> +
> +#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> +#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
>  
>  #endif
> 

