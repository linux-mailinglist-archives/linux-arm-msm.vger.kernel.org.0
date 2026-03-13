Return-Path: <linux-arm-msm+bounces-97337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KtLMozBs2mEagAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:49:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 003B227EF9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 650CD30164BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BF732ED32;
	Fri, 13 Mar 2026 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNe+NcVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EqLvDkwU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569AE2D94BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388169; cv=none; b=ShVbQ9QZkl6gJz1XW1OAufYBHwnxkN3MkpsbMDNomdtSEyjwYLu8mVXwD6IR0vCc3T6nMZB8ceGHXfE45cVd3J/i7Da80Dpvq1zfu7DUkNPlX5OmATxLKR+2JFfZugleFDx9EragUHHkNGpWYq9r6sozbDpUTPM7iGRPwmmKRaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388169; c=relaxed/simple;
	bh=8f+tPI9jZgMtDebyi0ClkpmjIfKv3vSXtrYWz/gOJFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZusinc/7ius7UdeGK/gNH2qSm72T2nq6pCXIrIKPRQ7UIplgCVMIXRTrmp/7+HhDOvGFjDjO1IbsMv5a033kspJIEv1ELCG9BA7gm3g8H9X0FKLvFfLj3hDcug66avOvq/rZCVnh02TFmct9CCItpuPG7IK03a0VCj7P+nm9Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNe+NcVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EqLvDkwU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tdcd1574528
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0j8tN+Fi3qZTgh6e6SGgA2NkckaLxNXLtTk/aRCtdRY=; b=UNe+NcVjz8/d0+es
	PZ8zR6BaHBmJ2oaVDSUPQQv7G20frSh6VTdGhl/h++aRZMpUReZ/F43g6O58wMsk
	Y6orTDhnuyb7ImS9M3TVyEEbyV2eYLCcZX5cVk1cV/RIi4vq+6W0Ua9K4c2lv9gL
	Cm1oci15cDA4U5kxzqmuB/zxLcWccTdIMMZ9naGog9CY2+YQwB33/PYqFH64xMX4
	vyR237byscKHdPyK5j8gdFBtB/Mn04Tw5J/50aqlXCwYRWeUJdFJvQd2m2IF/jKC
	KoEkfddNMN6tGb2TrA6HbWF1lonrpPKClYStc1u+P79aTgnC6zNkrObRwvmPsoSo
	CSYpVw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53n2jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:49:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c738f71723aso1096069a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 00:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773388166; x=1773992966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0j8tN+Fi3qZTgh6e6SGgA2NkckaLxNXLtTk/aRCtdRY=;
        b=EqLvDkwUcEGk5xRiqTVt9sUBzHXEAPD9ug4qSX6cVqz3/KsK9PISrEhkiNReQi+eJ5
         QrjLC6JWdNR9SSkH2c0bCQ+BAhoJm9xqbfxsowKjKKNQS8YXl0tNIf7kCgA/ePAk4j79
         6eTQ9sP5zok3EeiQBPdCiKdPKpYY6H2KBGN2DhLEk3SM14YChvnv2B5BJA5I2qcCFvUw
         Gbspxt3yPbEa3rNH3TthpkRz3R727rnVOH72j0xDs2rzSVMGsqVrTzLeWTFRhz1BtgDv
         SPbkl+6sPpXXjz8uabRnc3cRjdIfLwmZE2bxCCxofzVGwHDDC3Bvye3piSBW66XXFDx0
         8fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388166; x=1773992966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0j8tN+Fi3qZTgh6e6SGgA2NkckaLxNXLtTk/aRCtdRY=;
        b=Rp/Y0qGOXm0iaTHr2GrMsrEBvETlqE0f/NUnKz0V0mHO75nljcOSk60341705RepNB
         KCakAuwDRacMNy3RoJwIYiU83R3Mwte5eo2gZLoSTcPdUeicM/IPTVO3l1mS7xZWZtz2
         Jd35vXSAiDVMe9Nv+t9EOu/zNqRzxPPjkFEXSunv+F6jOEnK5pWkKr4PHU3iFL+qwA4z
         zQ7N74LL47mRLZbphlnYO/GuLGkxB8uyJyagfTAPTB/ZBXNJBAL3b0GZds4Rvl115c1U
         P22PJpV+GBOsdcEsxj95LWxyBrFjW7S7zyRBuYwZAcFTvT5l5uXSma+E3v//S96EzVLQ
         /D9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsf8JrIxcXqMaFd/1EwYtdDIUBM4Qkb3kCMbDFPUEB+NLLf4CogsHIPBSHJljjraj7NlJrj6XyvjqfrIWT@vger.kernel.org
X-Gm-Message-State: AOJu0YyLV5VM6bin6/mu75HwX/uM7yOnFS/S9FuPOUVqZb7Io4syTqZo
	Sc5A8pz1AQVZaQ6MTMh2DWdGitCGCySCmO5DJRAfK0i9ByKlcQbToXCGgylFligHiowDET1A9xt
	wKyv9/iJwkz2km/Kc9qgGvlTkBRSjUj/3bv6eFu6xPEp3Y38oor5qWww+sAu5ouB8f1X6
X-Gm-Gg: ATEYQzy92pD2uLgTyGhr69DRI6YYnIQT7+fW6OXo8147Ti1tDqgbfRjFm+cBBIrNbD4
	u9qw06lNbHEC80jeVmngOW4ba2K1ArPkQ4ZI+fnEwbLrH7D1z7/OcqlZq9sLMrST4Yc+5Cv9Zmv
	6f9Sj7tUinG8rWGzVj2emZaouvVD+lzm+NTPErwxN5/G2VNKJzAB69gUj24Unw2M0/YcYjEpo0r
	X1siBMNEKq6rtNXoiCNOkY8uV8TiyQgcX3RCWWyFxH6mCquNoW460Z1hrHrvXcA/jTSLWmdkiqT
	b4SveUW+28MPCt7VFG5cIERLs1Fuk2IeTliFmaCCnwQAjSZ+p6xN2TYRX7sj+3hlMwgdG3TJaMt
	JCUJuxfI14L1uye4QaMyip6bBIltbxLcB6Jx/S55WrCFsKJGbaIOR
X-Received: by 2002:a05:6a00:2e2a:b0:829:7e6d:cf1f with SMTP id d2e1a72fcca58-82a1991fa9emr2047403b3a.51.1773388166222;
        Fri, 13 Mar 2026 00:49:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e2a:b0:829:7e6d:cf1f with SMTP id d2e1a72fcca58-82a1991fa9emr2047383b3a.51.1773388165755;
        Fri, 13 Mar 2026 00:49:25 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725e05esm6274985b3a.18.2026.03.13.00.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 00:49:25 -0700 (PDT)
Message-ID: <726439a7-cf5a-74e6-1768-1bc6fb907ffc@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:19:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 7/8] media: qcom: iris: split firmware_data from raw
 platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-7-14927df4906d@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-7-14927df4906d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b3c187 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ndT/fs+coltRyMHftQWjTw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_OmBk-8nbaCSedoOfP0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MSBTYWx0ZWRfXwUjERrfOI/EI
 O+hR58c2WuyU1etcZw05ymJG+N9fl6UiIJ+SAtPgu9CjEJULaXFFikjEx5kvzMCFy4VZmq3yMM1
 NV5SGxhGNpYXKqSJ58J8aL50Na6LYYIu5U7ndmhzkWmrHlFoYJu5g2upXvkh8Q3rVYCVihuf7sL
 q74G7ph5Z5DL8rZ15HiofrMmbfyu0TP8ovYxGFbpVe/58mKiOJh6kL+dXrjSkr2MWdKSl0AVLeu
 5dtq+mhxtdDhjiQPVHtK6FOyLENZFGyK75WCS4X+HnS84Nom3GzXqoqb9lSFnWN+jiBZPUXoD/H
 ZWA74qK/8KKxfvpnFWKZMZBSP9C1IcojYIbJWt0iek+X2BPZq5M70NI1fi97fw4VQdKidxDQnyJ
 RJsaDBHIGsKKbiF8V+qL8Hu6u4V2G+6HkENsrfOQPih4HykJSCnoggBBw4kw6YGmfMQwT8qvYKk
 ibg1Pm1RQrEGIa5RC8g==
X-Proofpoint-GUID: AmFZacy1XdTk-N7czcZ97ADOkD9IN-9j
X-Proofpoint-ORIG-GUID: AmFZacy1XdTk-N7czcZ97ADOkD9IN-9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130061
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97337-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 003B227EF9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
> Having firmware-related fields in platform data results in the tying
> platform data to the HFI firmware data rather than the actual hardware.
> For example, SM8450 uses Gen2 firmware, so currently its platform data
> should be placed next to the other gen2 platforms, although it has the
> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
> hardware-specific platform data is also close to those devices.
> 
> Split firmware data to a separate struct, separating hardware-related
> data from the firmware interfaces.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  84 +++----
>  drivers/media/platform/qcom/iris/iris_core.h       |   1 +
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  10 +-
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 ++---
>  .../platform/qcom/iris/iris_platform_common.h      |  79 +++---
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  68 +++---
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 268 +++++++--------------
>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
>  10 files changed, 246 insertions(+), 351 deletions(-)
> 

<snip>

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index d1daef2d874b..1a870fec4f31 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -201,45 +201,16 @@ enum platform_pm_domain_type {
>  	IRIS_APV_HW_POWER_DOMAIN,
>  };
>  
> -struct iris_platform_data {
> +struct iris_firmware_data {
>  	void (*init_hfi_ops)(struct iris_core *core);
> +
>  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);

I still don't think it's right to keep vpu_buffer_size in firmware data as
this would change mostly for every new VPU variant.

The buffer sizing logic depends on VPU generation (vpu2, vpu3, vpu33,
vpu35) / SoC constraints, not on whether the HFI is Gen1 vs Gen2.

<snip>

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 10a972f96cbe..a83f6910f8b7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -906,41 +906,15 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>  	BUF_SCRATCH_2,
>  };
>  
> -const struct iris_platform_data sm8550_data = {
> +const struct iris_firmware_data iris_hfi_gen2_data = {
>  	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
> -	.vpu_ops = &iris_vpu3_ops,
> -	.icc_tbl = sm8550_icc_table,
> -	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> -	.clk_rst_tbl = sm8550_clk_reset_table,
> -	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> -	.bw_tbl_dec = sm8550_bw_table_dec,
> -	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> -	.pmdomain_tbl = sm8550_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> -	.opp_pd_tbl = sm8550_opp_pd_table,
> -	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> -	.clk_tbl = sm8550_clk_table,
> -	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> -	.opp_clk_tbl = sm8550_opp_clk_table,
> -	/* Upper bound of DMA address range */
> -	.dma_mask = 0xe0000000 - 1,
> -	.fwname = "qcom/vpu/vpu30_p4.mbn",

Should fw_name be in firmware_data? as this can be change based on HFI
versions?

> -	.inst_iris_fmts = platform_fmts_sm8550_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
> -	.inst_caps = &platform_inst_cap_sm8550,
> +
>  	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>  	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> -	.tz_cp_config_data = tz_cp_config_sm8550,
> -	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
> -	.core_arch = VIDEO_ARCH_LX,
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.num_vpp_pipe = 4,
> -	.max_session_count = 16,
> -	.max_core_mbpf = NUM_MBS_8K * 2,
> -	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +
>  	.dec_input_config_params_default =
>  		sm8550_vdec_input_config_params_default,
>  	.dec_input_config_params_default_size =
> @@ -997,50 +971,15 @@ const struct iris_platform_data sm8550_data = {
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
>  
> -/*
> - * Shares most of SM8550 data except:
> - * - vpu_ops to iris_vpu33_ops
> - * - clk_rst_tbl to sm8650_clk_reset_table
> - * - controller_rst_tbl to sm8650_controller_reset_table
> - * - fwname to "qcom/vpu/vpu33_p4.mbn"
> - */
> -const struct iris_platform_data sm8650_data = {
> +const struct iris_firmware_data iris_hfi_gen2_vpu33_data = {

This proves my above point.

iris_hfi_gen2_data and iris_hfi_gen2_vpu33_data become identical except for
get_vpu_buffer_size, which forces us to create multiple “firmware_data”
variants just to carry a hardware-specific difference.

Also, it will scale poorly going forward. When we introduce vpu4 /
vpu5–based platforms, we would need to add more copies of essentially the
same HFI Gen2 firmware_data, differing only in the buffer sizing callback.

Thanks,
Dikshita

>  	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
>  	.get_vpu_buffer_size = iris_vpu33_buf_size,
> -	.vpu_ops = &iris_vpu33_ops,
> -	.icc_tbl = sm8550_icc_table,
> -	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> -	.clk_rst_tbl = sm8650_clk_reset_table,
> -	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
> -	.controller_rst_tbl = sm8650_controller_reset_table,
> -	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
> -	.bw_tbl_dec = sm8550_bw_table_dec,
> -	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> -	.pmdomain_tbl = sm8550_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> -	.opp_pd_tbl = sm8550_opp_pd_table,
> -	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> -	.clk_tbl = sm8550_clk_table,
> -	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> -	.opp_clk_tbl = sm8550_opp_clk_table,
> -	/* Upper bound of DMA address range */
> -	.dma_mask = 0xe0000000 - 1,
> -	.fwname = "qcom/vpu/vpu33_p4.mbn",
> -	.inst_iris_fmts = platform_fmts_sm8550_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
> -	.inst_caps = &platform_inst_cap_sm8550,
> +
>  	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>  	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> -	.tz_cp_config_data = tz_cp_config_sm8550,
> -	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
> -	.core_arch = VIDEO_ARCH_LX,
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.num_vpp_pipe = 4,
> -	.max_session_count = 16,
> -	.max_core_mbpf = NUM_MBS_8K * 2,
> -	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +
>  	.dec_input_config_params_default =
>  		sm8550_vdec_input_config_params_default,
>  	.dec_input_config_params_default_size =
> @@ -1097,9 +1036,81 @@ const struct iris_platform_data sm8650_data = {
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
>  

