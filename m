Return-Path: <linux-arm-msm+bounces-105323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOiXEe8082nvyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 12:54:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0FF4A114B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 12:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 683ED3019C84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971233C1976;
	Thu, 30 Apr 2026 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anWNTmEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nzp4Zo57"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416BE3BC665
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546431; cv=none; b=PQTOQeN+a6pDRHmnGw5JmRFsa3+CQZALCDKTk6UKDPM3KbJcqBewRM/SOIRaGGaLwynkrawWq+o+xNAWePKDy2Ji3e649EAE5Rw4ZCFAmzSWoOJACIDY0AGCzWaL71D//zAd5OGslSrCqUCb1+7/q0RurWxNW4l3F99eBia2PU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546431; c=relaxed/simple;
	bh=kYdI5l4GBJqpYn6R+hCQX/thjSx8hd591kFqo8rU/Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRcdqCJYBmP8o+7EgZ8pfi16Rgmbq1gN08yyWr/PxfxVde9hp2dnfSJjO5ojQMD1AhZzY4quAgMSv1BTGK6B3JjtaVNKIkIWU2YBM14/roJzImamiuvfA2ePNxvWn7WkLX7UxHRtk/hgkB9dj4W/SFMY2ITncrI7Kc9Lsi7Iig0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anWNTmEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nzp4Zo57; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U5sGv23992790
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 10:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VvQoY5V0MZI8XGYTkLu2HUsdKc19JDiJ99j4fREKgB0=; b=anWNTmEuJ1B9AugJ
	Z0a6hWJFWmn8nIzaeD5P5rEXiS+JQhHdnlnwWtIOOh8BkmZcoJnWqgghu3nXguDy
	mXGMLDLCUZsVdNqWrpVcIYLxr+A/pXPfB7Rt52yUfv8uMXLPTNmf25qaEGb0dMMU
	Nijqiu86J8vMBcw/eCaZYrW/sibQj2Sl/JOX76S9oBvfjr7+sKOBgsXFWbYmk5f1
	3xgDmi0Lmz1RG1/K26tWl0e2lX40oqD8UnbQX+ZdQYU7R6QYYPBXasjNTm0WFGzY
	BQU26w+Tj6aa0l0rEtFjQ8ny38bx0U9MUObfiE48mTJ/W+7leD83AWIyT45zmjIO
	GbMfHQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx94nhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 10:53:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so12925055ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 03:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777546420; x=1778151220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VvQoY5V0MZI8XGYTkLu2HUsdKc19JDiJ99j4fREKgB0=;
        b=Nzp4Zo578sWAv3nqvSrHU0s/2Kqa2B/eIKe11+MdBmZr3sQcWqHE6bF3998kzvDkSa
         Lyka2dmohbmgmENC5MaVoKBezVxrGqnivEnrQFnIfUbPbc16vINGAA61kdH0bQYBycDD
         uhsjmCaJKrkstYFW6PIHkEq+IX3ai4HBbWAPuAPVb8x4sxQdnNLbjbAjDr99Wf+37DJl
         Mz0LNyAOxXHmQ2NeYQhx0O63QKgkjgxTB428TxWh8wwC7HWKfDq697W7egYS92XAhakv
         uYc9NRoQ63su5m8lyiroGULMm8kqnkgGMAMnQL2ekuZcZJ6/sU5OgjMzmJch/+X6on0/
         7Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777546420; x=1778151220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvQoY5V0MZI8XGYTkLu2HUsdKc19JDiJ99j4fREKgB0=;
        b=ediyU0fPPWTbBZn0Y4oag0yV06tRgc/LcnEO845b21Mxjpjq/TqmkRPXeqrGw23pB0
         hpGKbz4Rmpv8+kjJ7XeC6bxXFYdmCigmhCSMN6pBkjhN30pP2bpk1gd+vf70j+j3Lo4+
         WD81W1J8WCu7BtOmVs/7ubL2KMu0KSYFxEUkaIhKRqCgG9Vm8mZNKelq6RxsbHt7P45n
         PuXz6j5Fz/aIuaHqBw6nWM9TMuQr3bqhw0yIkqqq//syTiXP+nMuVVPoZsYsBLSF5ujK
         iYThFDpNp0l1ilYqqNCMWcvMM9xy3oATEPmC3aei+hyWl5sU2PBPmkLj0hS2Pyhq7nJC
         +KBw==
X-Forwarded-Encrypted: i=1; AFNElJ9PQr5PhtJdhi+tqitEfPRiG7KHNWdYXeSfN4qAuqpCy9gZjh31D44pcY2oosA//GpVzEfcI2pKagzvfMCK@vger.kernel.org
X-Gm-Message-State: AOJu0YxtFzc2someXVudc4bBxK55Hh6rMnMjU3Aoj9t3k2cnzT8makRi
	It1IfjAxjMk24tLWjAw9mOH3BBfOKXtuHidzkMkPSGTIaNZP1uXyddYsFOrIzuuroQJBEoNQxWa
	G/o6C5ThFL5DRVASWd7waeIjBPxX2cod9DwByk9wEI2Bp7GX3nNnVToIt3KjGN7wXG57z
X-Gm-Gg: AeBDiev/rvpfphYAtS8eAjp6ruVHUE7rYTktrWWXB3MrIb4ozCpOJDqKZ9eDcrVk2I+
	Hh/HnTfmBxdKto+eTJBE5AD19fqGCLqq59GOizqEb63jGX+Y4HNEgfOoRqfOOF5gYWiHBNoxg/f
	mUMDERyFE8TvT1BNKtlD+YZOwX/Gop/ER184g1Ax0tbXxrtAUI83PIWTgL7Pv3BP21DFrjRR6OS
	80kQXylP2duyN3cgFzHgWg5/W82qxPvUH8YqT1r4yqhZaSBozb+DrjUeRrnn5uSdL0cu3PPpvVr
	Us6yWSaBCEFDRMJGJX+0YvaPW+wROxUcdm6dkMwLhCenCkm1tIbxXuci661mtyes6cgf4iRJkxO
	Vl+2ufboq7/adJaxLIvEaPMpvIn8vdOuIsznVrwo8/gf/VLWTQ0klRvWCW0lBpX0=
X-Received: by 2002:a17:903:368c:b0:2b7:88f9:9c3d with SMTP id d9443c01a7336-2b9a232f847mr17204945ad.12.1777546419685;
        Thu, 30 Apr 2026 03:53:39 -0700 (PDT)
X-Received: by 2002:a17:903:368c:b0:2b7:88f9:9c3d with SMTP id d9443c01a7336-2b9a232f847mr17204605ad.12.1777546419204;
        Thu, 30 Apr 2026 03:53:39 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.229.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f3e2sm61448125ad.38.2026.04.30.03.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:53:38 -0700 (PDT)
Message-ID: <09969567-b791-2502-4028-46cae13db3d0@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 16:23:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 3/5] media: iris: Add platform data for X1P42100
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
 <20260429-enable_iris_on_purwa-v5-3-438fa96da248@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-3-438fa96da248@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDExMCBTYWx0ZWRfX2dZLU8RbxVjj
 r1cNcn5Mnm7Nb02gFznqGjG8FzJckMHPSV3NhrMRKEvpJQBlflFdF/3Cgy/9VrLkx4CG33FsTIN
 zzxP9i/mK/facXEXFabzA1btB42kDyEvVz3NJDmqq1ZDmN6Odbn//Wlkr+LWglbZqp+/TpB4G54
 tDETxUYopGH20kaRasulvBrpk5WZiEgeD/aeR7mZycdm8o5+82IKcKHZD+wJ5KY9n0B0ir7SbQb
 ofy+EGzfaG52xyXbBlK5kdhO61QQKUNjJXf2Q3++kG5wYflgfuVpIyexeAcbqLhQ8COgcvrIrBh
 j+QmCXy+SsVYfoLT+PXnyk8pyKTZ4Q5eHyqCuYouJEJwFGF5E418USW1usd7dUDNY7fT58P3PpM
 DVwlHVTxLX7LoK1bzQX9j2v8ugmvZ4UqpTL2FEb/8okQe88qSTTbu0Hi64yGZQupftvDucM6uVE
 BBpm0KTm9mZoxzc90Ww==
X-Proofpoint-ORIG-GUID: N75ciOnDdGKBCQGU-bP5Zg-uk6xBxr38
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f334bc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=sQGdqEwRzC/zEhaLYLcr+w==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_kvchVDP8_-l7kQr3B0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: N75ciOnDdGKBCQGU-bP5Zg-uk6xBxr38
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300110
X-Rspamd-Queue-Id: BF0FF4A114B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-105323-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/29/2026 1:13 PM, Wangao Wang wrote:
> Introduce platform data for X1P42100, derived from SM8550 but using a
> different clock configuration and a dedicated OPP setup.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 97 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 +++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>  4 files changed, 124 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580eb10022fdcb52f7321a915e8b239d..2e97360ddcd56a4b61fb296782b0c914b6154784 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -47,6 +47,7 @@ extern const struct iris_platform_data sm8250_data;
>  extern const struct iris_platform_data sm8550_data;
>  extern const struct iris_platform_data sm8650_data;
>  extern const struct iris_platform_data sm8750_data;
> +extern const struct iris_platform_data x1p42100_data;
>  
>  enum platform_clk_type {
>  	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..e8b1b92a6329266d22b06e84c47c477d1a9d742e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -15,6 +15,7 @@
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
> +#include "iris_platform_x1p42100.h"
>  
>  #define VIDEO_ARCH_LX 1
>  #define BITRATE_MAX				245000000
> @@ -1317,3 +1318,99 @@ const struct iris_platform_data qcs8300_data = {
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };

Add a comment to mention what is different from sm8550 data.

> +
> +const struct iris_platform_data x1p42100_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu3_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = sm8550_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = sm8550_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.opp_pd_tbl = sm8550_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> +	.clk_tbl = x1p42100_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
> +	.opp_clk_tbl = x1p42100_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu30_p4.mbn",

is this the correct firmware? shouldn't it be vpu30_p1.mbn?

Thanks,
Dikshita

