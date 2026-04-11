Return-Path: <linux-arm-msm+bounces-102817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIGPCvyf2mnR4QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 21:24:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FF03E17CD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 21:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A3A6300BCA4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E773BA24B;
	Sat, 11 Apr 2026 19:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxZvdNvo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6Jih4BR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7010F3BB9E1
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 19:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775935480; cv=none; b=rIQuaOlHbBGH5wWknxX/Q58s+RBLy9+LpTqGt49rpn1Adhv1hC4EP5nUqOrLEAojEB2vRSq3kWxntsFhpL5Y+HU63th4c8rsoZDcPvSen1Ntz/9gu7F4H45keGpLwZukNi+WBCNBCodyz380n3DYVL7PEGUVrkT9dxuELGlCI2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775935480; c=relaxed/simple;
	bh=SqfSWZGo3Zh5fHCTSozENe4qDnKcyLLUwyC3HaptIt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYvUhlmBBAtt6Wbykqrht9AU413XuLkFr90OG2is3GbWBIODLewtCYBhrlw1F76q8k9sEvMmR2ClpAAJqK3skZlMKC/SQ0Frp0d1OPkxdWLl+5RiWBTsyiKKBTB8EXrdCuzt23moO9+Aq4I7ukcwxZ+C2CsFDGbbaZtKEiH63sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxZvdNvo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6Jih4BR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B47iw81200641
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 19:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=84UcgAE8IEkLDuyxu5eeS545
	SDEHrHAhWdpX3MeZnHU=; b=CxZvdNvoJorZZMsJ1Am/zd2/dVNUP65Cd7hwPoNU
	LPwRy7GNbTrLtcMPyjPnXcJy+Mar7DIL6Ve4oDCPqsZzV2Ebi0MuYaJWCa1afxjJ
	yYKM8s+V6SiQm7/0ieZ0APJ4j1kctKX37HtR6dLNTiIP4OqFmcYRlMSyl2ZutLGE
	vD18IiGoZnZScUCaK5a7Ltm2ndlmvhUha/061brh1rJGqeA4m2Z/Pr4G8ypqOVWi
	hK1BDJDkeKbp0AKk7PK0EUq3mLsS5YxqgrJjWZeNBi/gzJhczAq0YfjDS7ZUBO0M
	zpUotgt5C1knVeF6k+W6cLcujc38b0vNBLOhaGdTz9JyeQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0js8dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 19:24:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso35491961cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 12:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775935477; x=1776540277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=84UcgAE8IEkLDuyxu5eeS545SDEHrHAhWdpX3MeZnHU=;
        b=j6Jih4BRo5tPonmm3PKVt3sCWqAM6jB7JtfrvPuTqD5spzdSWG//u68XELqvC+AHlf
         mpMYr6hx5VCL0af17kMBuGsuFPW2SFlFF2H0vzBX6UBIrI0YK8RxSCO2xd9igfk8syCT
         4xA4eSu2giiVQ1S+J95rFNWoh8Ak69gro+l1R7kbCTQnsx89yOaFAXbevxjxOMFZ8qD/
         6E4T/C4QZgaMHMIfmp8d+5RY5cmZ25nK2xpcOSr2ZoV7hPCnGq63UWckYjB6S3Y7TI5I
         L21O70/OEW23fnlcjSj/rMtPvxameNdA6N0m8lmP9nR7apo5Whda112QJHOi407Oge0M
         G1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775935477; x=1776540277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84UcgAE8IEkLDuyxu5eeS545SDEHrHAhWdpX3MeZnHU=;
        b=huN/bIAWr8yJuMipQRvOjp7qsBIFq8zIBIz6MAu1D+aVR30pJ+rTrmgri1t56/cMWW
         e6LvOYP28JEWMp0yz08XDxnyqgxzVKSdQngf+ag3xCo7M8Wnk6bSX6l3uI+ITezYbRr4
         ipBcPIP+yeYzTTpFzjmUNE1xYVA+J89JrYqsLkRe+K9/RAnk3RA6qSIwu5Ay0lcwTwrk
         kl9sNG/v+w7QGETQZIr4JS+c3OLx2tEZjI4UCtCWfR2E6hKAYEec1/PgMDWZmNShPpVO
         O1BSg8fnjZROw9heict0luPTrvP239LWMehOeTRypcjl41U899luN2h7To4jH7SFVIC6
         Tf0w==
X-Forwarded-Encrypted: i=1; AJvYcCUrp7jRyRIR/h/i8QsWaC1GoIJVcPpDTSIp27PfIXo24IzJYtStCC3QCzo6h3a0A0729GmylIcKlqMaM0Y7@vger.kernel.org
X-Gm-Message-State: AOJu0YymP3HGO9T2en3oLPEFN/HCwT8v8Pq6uOhiO3O+b1Mmhjl6llrp
	xXrHfS8G5um3bc/m4+8uive3vviFVMN7liUJMnO6DLb3s+I+CfcVUY+lypcGEFUmVSxanD4nMHv
	7H4T4GHfWBE52dm4rC2ZeqSvTXMi4n3rp7ElUcMN/OY+7vq7IW/FVkQ2WmOnfGNhIRKO6
X-Gm-Gg: AeBDiev7wN+TPE3PfI0jRYG7plcHz8y2Ne7ddJw9t7PL5wo6XsUsSUOgkTYT5WVZoIz
	8YmdHjLA55bf9ylr9CO1moh2U9n+nEqHmZJeEh7QqFzNHlU7MwK8bReXivtImxHpY3Trgg/9kQB
	4fj0BWL4a/uH6ZPD29szDP0kQzQSp1XhS01hm2VoOfc5TzWNju/FQ5iND7sFxA2QOHHSkUGIIDP
	GY79GUKysdYxT4ftA0GW3Leutf/5fdjrfM6PMgsDLJt2JQUKGpLoC2CB1Kmk8RKmfEwpeXbp28B
	4VQD3h/M6icKK0B/ZtHNrJJfVkXZqRXwHjmqDtIU09yYG1l2OhT4ioap7CZn0m4a/Ft1BtaacBV
	EvwbDXtLzocK29d1df0o8c4i161cZCLfvoZdk0IQ9nZGn06jRmsSihm9Bi3FpCrhbQ27/O8U4GY
	DjPydiP63GvYq0IgHpiBi3WXxM0Qqh7HV5qrM=
X-Received: by 2002:a05:622a:241:b0:50d:a602:1263 with SMTP id d75a77b69052e-50dd5c43411mr111031471cf.63.1775935477392;
        Sat, 11 Apr 2026 12:24:37 -0700 (PDT)
X-Received: by 2002:a05:622a:241:b0:50d:a602:1263 with SMTP id d75a77b69052e-50dd5c43411mr111031191cf.63.1775935476868;
        Sat, 11 Apr 2026 12:24:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef07991sm1592793e87.82.2026.04.11.12.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 12:24:35 -0700 (PDT)
Date: Sat, 11 Apr 2026 22:24:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 22/39] drm/msm/dp: Add support for sending VCPF
 packets in DP controller
Message-ID: <i6x7675n4neufglcjwneds6nehetclystyg3abosbdjkh25ub5@psdjsrfl6wek>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-22-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-22-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE3MiBTYWx0ZWRfX/ykUupR7Pwaf
 948MFyg++7ccs1b9eX1+asC/IGaYEnb1sohzO+NexgiHZ9LeNVkzEdwRlU40aPpGYQ54nhyx5xU
 oWd/lCQTzcTefa9LjRmR79RoZPmDuuqur2joOjF1iw05nbTtjpma7jPC7TfnaLtozvCfN0LB8Nk
 YIIXSFMV4/9Z7ioOoHzESU4vTYIha/DDDjJMNn+pGT9QyGzMFiW4hvordP99l+VzrzCTn0/koyT
 cCP3GOo8KMGR7chPYDyAbfakxJZ1NMv2ht+VY1fgeKiBLBor2twJXX9mj64FZuwwrwkSXzUOwNN
 R8pcgaJd1oyOrQLOcXUZAudUKLOqivshz443+L53txdH0UovpXT9hWnjcWajxN41uME5RFk8Led
 AMuRwwFdp37EMV+cmA1IHLGPUlnmTyzmkoNTefQkhx/FK1r1aVlCh/GupKriTWss8GMtqffLCTw
 nfwqsB40ABwP31+Yyrw==
X-Proofpoint-ORIG-GUID: -JPZsjs2ezhaUAudVaDvAipOs9a8nIS6
X-Proofpoint-GUID: -JPZsjs2ezhaUAudVaDvAipOs9a8nIS6
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69da9ff6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=5d8QvkXpvjy1hx8jmZUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110172
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102817-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75FF03E17CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:57PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The VC Payload Fill (VCPF) sequence is inserted by the DP controller
> when stream symbols are absent, typically before a stream is disabled.
> This patch adds support for triggering the VCPF sequence in the MSM DP
> controller.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 55 ++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  5 ++++
>  4 files changed, 58 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index e64f81bc8c36..9907f2e56e65 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -65,9 +65,18 @@
>  	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
>  	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
>  
> +#define DP_INTERRUPT_STATUS5 \
> +	(DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)
> +#define DP_INTERRUPT_STATUS5_MASK \
> +	(DP_INTERRUPT_STATUS5 << DP_INTERRUPT_STATUS_MASK_SHIFT)
> +
>  #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
>  #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
>  
> +#define DP_DP0_PUSH_VCPF		BIT(12)
> +#define DP_DP1_PUSH_VCPF		BIT(14)
> +#define DP_MSTLINK_PUSH_VCPF		BIT(12)

dp_reg.h, under corresponding registers.

> +
>  #define MR_LINK_TRAINING1  0x8
>  #define MR_LINK_SYMBOL_ERM 0x80
>  #define MR_LINK_PRBS7 0x100
> @@ -405,6 +414,8 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
>  			DP_INTERRUPT_STATUS1_MASK);
>  	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2,
>  			DP_INTERRUPT_STATUS2_MASK);
> +	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
> +			 DP_INTERRUPT_STATUS5_MASK);
>  }
>  
>  void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
> @@ -414,6 +425,7 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS, 0x00);
>  	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2, 0x00);
> +	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5, 0x00);
>  }
>  
>  static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
> @@ -433,6 +445,20 @@ static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
>  	msm_dp_write_ahb(ctrl, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
>  }
>  
> +static u32 msm_dp_ctrl_get_mst_interrupt(struct msm_dp_ctrl_private *ctrl)
> +{
> +	u32 intr, intr_ack;
> +
> +	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS5);
> +	intr &= ~DP_INTERRUPT_STATUS5_MASK;
> +	intr_ack = (intr & DP_INTERRUPT_STATUS5)
> +			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
> +	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
> +			 intr_ack | DP_INTERRUPT_STATUS5_MASK);
> +
> +	return intr;
> +}
> +
>  static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
>  {
>  	u32 val;
> @@ -516,14 +542,28 @@ static bool msm_dp_ctrl_mainlink_ready(struct msm_dp_ctrl_private *ctrl)
>  	return true;
>  }
>  
> -void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
> +void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
> +	u32 state = 0x0;
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> +	if (!ctrl->mst_active)
> +		state |= DP_STATE_CTRL_PUSH_IDLE;
> +	else if (msm_dp_panel->stream_id == DP_STREAM_0)
> +		state |= DP_DP0_PUSH_VCPF;
> +	else if (msm_dp_panel->stream_id == DP_STREAM_1)
> +		state |= DP_DP1_PUSH_VCPF;
> +	else
> +		state |= DP_MSTLINK_PUSH_VCPF;
> +
>  	reinit_completion(&ctrl->idle_comp);

And there can't be two streams wanting to push idle at the same time? 

> -	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
> +
> +	msm_dp_write_link(ctrl, msm_dp_panel->stream_id,
> +			  msm_dp_panel->stream_id > 1 ?
> +			  REG_DP_MSTLINK_STATE_CTRL : REG_DP_STATE_CTRL,
> +			  state);
>  
>  	if (!wait_for_completion_timeout(&ctrl->idle_comp,
>  			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
> @@ -2073,7 +2113,7 @@ void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
>  			return;
>  		}
>  
> -		msm_dp_ctrl_push_idle(msm_dp_ctrl);
> +		msm_dp_ctrl_push_idle(msm_dp_ctrl, ctrl->panel);
>  		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0);
>  
>  		msm_dp_ctrl_psr_mainlink_disable(ctrl);
> @@ -2183,7 +2223,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>  	int ret = 0;
>  	int training_step = DP_TRAINING_NONE;
>  
> -	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl);
> +	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl, ctrl->panel);

Which panel are we passing and why? It feels to me that we have two
different cases, one for the MST stream and another one for the SST
link. Can we handle them separately? (note: I might be wrong here,
please correct me if I'm wrong).

>  
>  	ctrl->link->phy_params.p_level = 0;
>  	ctrl->link->phy_params.v_level = 0;
> @@ -3005,6 +3045,13 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
>  		ret = IRQ_HANDLED;
>  	}
>  
> +	isr = msm_dp_ctrl_get_mst_interrupt(ctrl);
> +	if (isr & (DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)) {
> +		drm_dbg_dp(ctrl->drm_dev, "vcpf sent\n");
> +		complete(&ctrl->idle_comp);
> +		ret = IRQ_HANDLED;
> +	}
> +
>  	/* DP aux isr */
>  	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
>  	if (isr)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index c59338199399..cfe7e4496943 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -22,7 +22,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl,
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
> -void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>  irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
>  struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e0bf4dffa6af..e8028402f748 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1557,7 +1557,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	msm_dp_ctrl_push_idle(dp->ctrl);
> +	msm_dp_ctrl_push_idle(dp->ctrl, dp->panel);
>  	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
>  	msm_dp_ctrl_mst_send_act(dp->ctrl);
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 835a55446868..65695fcb48d0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -42,9 +42,13 @@
>  #define DP_INTR_FRAME_END		BIT(6)
>  #define DP_INTR_CRC_UPDATED		BIT(9)
>  
> +#define DP_INTR_DP0_VCPF_SENT		BIT(0)
> +#define DP_INTR_DP1_VCPF_SENT		BIT(3)
> +
>  #define REG_DP_INTR_STATUS3			(0x00000028)
>  
>  #define REG_DP_INTR_STATUS4			(0x0000002C)
> +#define REG_DP_INTR_STATUS5			(0x00000034)
>  #define PSR_UPDATE_INT				(0x00000001)
>  #define PSR_CAPTURE_INT				(0x00000004)
>  #define PSR_EXIT_INT				(0x00000010)
> @@ -356,6 +360,7 @@
>  #define REG_DP_DP0_RG				(0x000004F8)
>  #define REG_DP_DP1_RG				(0x000004FC)
>  
> +#define REG_DP_MSTLINK_STATE_CTRL		(0x00000000)
>  #define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
>  #define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
>  #define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003C)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

