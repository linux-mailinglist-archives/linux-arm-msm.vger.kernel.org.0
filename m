Return-Path: <linux-arm-msm+bounces-77593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3437ABE3C9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 15:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6CBA1354127
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 13:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5606D33A039;
	Thu, 16 Oct 2025 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4W2Hmky"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E1E326D70
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622437; cv=none; b=YqUtTwk/SSJo5xok8mc119Y3mADxXezky/RB9pYknO9yIGkbq6JUkVDR01FKgYimXqXWJKe5Krk/WOPVbdzMXZeCgFe1DMzVdARgyf9F7/CKuFCtAiS3nZt4PeEMQlXOA0EAuCBO10M5eU11UIjGiasO+P0dboHKNUeaiTah8D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622437; c=relaxed/simple;
	bh=yVzYk7iAXOmZR4zNr2Idxx6CcOc8TpqsoVAJ4tELSJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ctss4jDbDBV2Q9516/9L9xYTqYxsKcfvfdsOXcNteqozLoBqmZa3Q7ZMwlSyA1m6q601foAELn3cYTOHz9bM+8R/1VjNrOPrCszx46bdbs7LT7NNcj/RcvXHImEZUzB2qUxY4FGfVXOItlAPwr7r/asRvuZxMV/lkEyniQty6vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4W2Hmky; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G6cxnK003693
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zoz0VeVMOnao2Q3x5RK8NlkU
	vHUVM0E1Vb62tgX5qWM=; b=K4W2Hmky91H6D1TnGKbxhU7H02poQyBkNxSVCgpv
	sYgMZgZNLQq2xVTRw04gubXtKab4DE7cicImLqWgMPM7eh5p5HqhaF3VMUxKalP+
	ejeHMyvtJSDm8lXL8odER13AyjjlWZeWHyQ27l/Ek1skZLzijDJHJKtsH0bDdj+O
	monB5/VFeuVTjOQqQ8Roi2F0Qmi56n9YrqFU/6dXk+MeEeS/3MagIhn6x01QZ1Ys
	b+SE13AweIZeBtRMp/aQgdLXxY4BA5aKVMHlxH5Ghjee0qg2vYbwP6zceCj02CVE
	bOOlmxK10SdA0Aj5npH8xjZkfQYgPpWoD4S/1mG5T+sxFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8q4eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:47:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-89022a2981eso93360185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 06:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760622433; x=1761227233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zoz0VeVMOnao2Q3x5RK8NlkUvHUVM0E1Vb62tgX5qWM=;
        b=JiJZTATtHaYL9RKU47oM+QVxd7h+ZWYfg478LbuospmjWoQmatONGNcSoaLN5lUZ0z
         zI6GQV3XVyDKlaOaYrOpqLc1+JQKGa9Tb7FsVrrdCI0xYMEoJz7noj/Ih2CxqYjPBMMY
         Z0wQm8doZpBcoD0avZfsddAdePKTQ1ONGNDp2PwgV9d6aO4tLc2zmfUKNxhz91fburDk
         3cl9DCqyFxKul7q1dyQCA2q/TuwpYkhkDxh4z40T0BjlBu/OuImqJ/GTEqIJrGK5b5Ma
         fPMiBwXU5SBEQgpwVrvdluhVGCEJx96T4YetNm9EQXgzy/uCW61jNS8QzOJN9/doxO+Q
         f2HA==
X-Forwarded-Encrypted: i=1; AJvYcCUOau+1kfzfypWlaBrEinQ8v5LhlOnlXI7PTQx/HEdsxWtKa5av14iCQ9VqQfBvdBNk6b0s6O2dTRg4o/OC@vger.kernel.org
X-Gm-Message-State: AOJu0YxOCG5mCviO9eSw62vDUbsenU1I9QLRg1v28QtYI22SSQ71eh2N
	E3qGfnYpzTAOP/aEwynrMygXgIsIUlRKeLQnSGSe+xBUJrNwskrUvxOI9mxS6z8tDWTy0TOvG55
	iyiKVCDhSSXmL8HHGwsh+h415rx90Yvz7QeipTT9eOY+m95YH7e9I2df9NKRXObvtxZn4
X-Gm-Gg: ASbGncvXmLEiG3pNKo9NoCnsu5jh4WbtrLCtmDK8hqee7dnbq6W4keQ5DxxTyxthFw3
	dYpIrHid8sS5PVPNV8wSPfNBEvjJ9J4juAf1cKug+BmKoaPLYuSWtbuf+W+oppSDI3rnWtWu5mq
	wnDY23f7wOB+R0PjxqakUD3DmXWL/otvywMbPT9E8lHffuESXTz89CwuKhkm+0NOgELzUZEG6U1
	BG8rjyh8DqJY5wem08yNYKSnpzY2P4TzqMWaJ3LWKNcnmeaoFqJ51uUK9re0yZI/ehvmBEBDwRK
	MXQ7Giha+VeT97nfw0dTg17tLrcq2tFgF7bKEaKqGls3h3z2iofqkvxp/okH2LPg0U/G5fBw3qq
	E83TucpKaP+kGvzaQGXe33VUIid95UczMjWoQaCQllkQdK/wB7KpZXxHzW1/0edLvroMiwPnPM7
	p+uh8UNCUVqcI=
X-Received: by 2002:a05:622a:1895:b0:4e8:8b6e:7827 with SMTP id d75a77b69052e-4e89d3a480emr2310571cf.66.1760622433262;
        Thu, 16 Oct 2025 06:47:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcyJKmhQOG7iLkOgrsKwRaHI3ZRlEBKHgfzUT0aELnO1brTLqronfq7nvUhIamhy1jgjHbNA==
X-Received: by 2002:a05:622a:1895:b0:4e8:8b6e:7827 with SMTP id d75a77b69052e-4e89d3a480emr2310211cf.66.1760622432779;
        Thu, 16 Oct 2025 06:47:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4dd6sm7088908e87.17.2025.10.16.06.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 06:47:11 -0700 (PDT)
Date: Thu, 16 Oct 2025 16:47:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH 5/8] media: iris: Move vpu register defines to common
 header file
Message-ID: <gbwjh4tqaoxq2ng7moytv5vtalxpajdid5capjfqzare6dmphz@cmnv4p2q4eov>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com>
X-Proofpoint-GUID: nitBZsJfMr_NG1ja7bhCsyBy67QR7bXI
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68f0f762 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KXxo3aNfgb-G34jaDLkA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfXwe26EVqT6str
 FD+GaPxLUjGPowBFifI5LfcvOPcOvw05RxW71vHlMC9cApRCxWVizGlpvKUu7oNFJla88DqhFzI
 cE/2E1EOqnXro+V/U2bU79wKe6Qa3d8CzFOQXl4OWt36jTWWj5gUtJa31a3tlG/Wj6BFhVVtXOq
 sg+Tgf78c42T7ZlCPkxY9CkwxsKQH9RcgLP5zbesBoD6gaNJJSh/WCmhQzex2pUBzhrJFIsZxP7
 Z3WFu4hBMxLyOkZDpy+eUA4R8M5AAhemrWywFdFHLOytoW0AKNvP99BsM2ucKfqlmwJwLi7YLzr
 nJbkJ9Ixi7nKpuQOpI+R2sqHKkX4B7QvHeJYdIWS877EaTmGGqBslRc9WGhey7RN3Se+nMjzNMf
 eVDtw3DltpD8hy82oNC/c9AqTyZLAg==
X-Proofpoint-ORIG-GUID: nitBZsJfMr_NG1ja7bhCsyBy67QR7bXI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

On Thu, Sep 25, 2025 at 04:44:43AM +0530, Vikash Garodia wrote:
> Some of vpu4 register defines are common with vpu3x. Move those into the
> common register defines header. This is done to reuse the defines for
> vpu4 in subsequent patch which enables the power sequence for vpu4.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 36 ----------------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 --------------
>  .../platform/qcom/iris/iris_vpu_register_defines.h | 29 +++++++++++++++++
>  3 files changed, 29 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 339776a0b4672e246848c3a6a260eb83c7da6a60..0ac6373c33b7ced75ac94ac86a1a8fc303f28b5d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -11,48 +11,12 @@
>  #include "iris_vpu_common.h"
>  #include "iris_vpu_register_defines.h"
>  
> -#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> -#define AON_BASE_OFFS				0x000E0000
> -#define AON_MVP_NOC_RESET			0x0001F000
> -
> -#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> -#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> -#define REQ_POWER_DOWN_PREP			BIT(0)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> -#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
> -#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
> -#define NOC_LPI_STATUS_ACTIVE		BIT(2) /* Indicates the NOC is active */
> -#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>  #define CORE_CLK_RUN				0x0
>  /* VPU v3.5 */
>  #define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
>  
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
> -#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>  #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
>  
> -#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
> -
> -#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> -
> -#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> -#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> -
>  #define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
>  #define SW_RESET				BIT(0)
>  #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index bbd999a41236dca5cf5700e452a6fed69f4fc922..a7b1fb8173e02d22e6f2af4ea170738c6408f65b 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -11,9 +11,6 @@
>  #include "iris_vpu_common.h"
>  #include "iris_vpu_register_defines.h"
>  
> -#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> -#define AON_BASE_OFFS				0x000E0000
> -
>  #define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
>  
>  #define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
> @@ -38,10 +35,6 @@
>  #define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
>  #define HOST2XTENSA_INTR_ENABLE			BIT(0)
>  
> -#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> -#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> -#define MSK_CORE_POWER_ON			BIT(1)
> -
>  #define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
>  #define CPU_IC_SOFTINT_H2A_SHFT			0x0
>  
> @@ -53,23 +46,7 @@
>  #define WRAPPER_INTR_MASK_A2HWD_BMSK		BIT(3)
>  #define WRAPPER_INTR_MASK_A2HCPU_BMSK		BIT(2)
>  
> -#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> -#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> -
>  #define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
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
>  
>  static void iris_vpu_interrupt_init(struct iris_core *core)
>  {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> index fe8a39e5e5a3fc68dc3a706ffdba07a5558163cf..6474f561c8dc29d1975bb44792595d86f16b6cff 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> @@ -9,9 +9,38 @@
>  #define VCODEC_BASE_OFFS			0x00000000
>  #define CPU_BASE_OFFS				0x000A0000
>  #define WRAPPER_BASE_OFFS			0x000B0000
> +#define AON_BASE_OFFS				0x000E0000
> +#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> +#define AON_MVP_NOC_RESET			0x0001F000
>  
>  #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
>  
>  #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
> +#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
> +#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> +#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> +#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> +#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> +#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
> +#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> +#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
> +#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
> +#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> +#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> +#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)

Registers here got totally unsorted (they were in the original source
file). Seeing this makes me sad.

> +
> +#define CORE_BRIDGE_SW_RESET			BIT(0)
> +#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> +#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> +#define MSK_CORE_POWER_ON			BIT(1)
> +#define CTL_AXI_CLK_HALT			BIT(0)
> +#define CTL_CLK_HALT				BIT(1)
> +#define REQ_POWER_DOWN_PREP			BIT(0)
> +#define RESET_HIGH				BIT(0)
> +#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
> +#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
> +#define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */

Ugh. This mixed all the bits, loosing connection between the register
and the corresponding bits. I'm going to pick up this patch into the
sc7280 series and I will improve it there, keeping the link between
registers and bit fields.

>  
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

