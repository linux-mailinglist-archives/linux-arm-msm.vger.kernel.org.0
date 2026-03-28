Return-Path: <linux-arm-msm+bounces-100527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MayEXh0x2npXgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 07:26:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9791B34D80E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 07:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A9B13023347
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 06:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA2E330324;
	Sat, 28 Mar 2026 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LK6QF+H3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGgaIJjd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD38222D7B5
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774679157; cv=none; b=XzLIR72gRbjxVrs/Z453uAT4myaWeEKahp/727md/rv0zM4dcZk6RyF/maWTHJQ6QTADGCn19YYfdKoX9PVaZkKtizPJcSwzpDRYl7TwRDqcl6MwAa95wBg1dbthFpOIRsCJa/YJjOzmw40t5+h+qmdZDmJ0x2KG5dNhQNR739s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774679157; c=relaxed/simple;
	bh=x378TmYIvCw7bbd+OA9uXgGesY3LGv8GwqbJTuA6yyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLGkE3sIsBa2xuoxwZDi8zUGb6r9SV48EEtTbvgBMU2Tgfad8cgksB57UV2j2xh7mymwH5C8T/kOad961LHHVqTvRKJW0MWiESOGqJU0Fsrbvr9pb9zdeMmBOZcgqQVPhZvE8aqbOhsGnM9ONQK6XIFinc1zWnqjBw5rMao5do0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LK6QF+H3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGgaIJjd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S0gZqi4034630
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 06:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AnmAY2j6WsZg+gjoAQiABlVqqmlC+uI6ln6mUZFTiOA=; b=LK6QF+H3ZTL8mBSm
	UNdL1oSaq3P7IvYciyLIt397Z9F7QwyRxFChOajUg0PFLYxLDS5GgiTAqoVHOdNp
	x9HRbPuXmRQrnOv9d5qT4Nri8OSopIB3WK9zAPyOLjgMjtkfw7zdsNMMeg3fFvin
	SCCXDa9jAeUYRNJTdEGBhI+svsag7Pax5nziwZA4moFtBDFcLkbyE7j3yuac4ttg
	bwv9XpCDLW2ZD8UMwdOONXO7iCqnhcfbuRbAn1OQnHN0Nhwx74xb3a4TJHKjJKNn
	dPByVTiPAgfKnCn23dHQzIv8NAY7ihuXjJmTwjWFYBM82/S6QA+ozSSFnfE1x+KN
	5A9TcA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pd8hr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 06:25:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so1648368a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774679154; x=1775283954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AnmAY2j6WsZg+gjoAQiABlVqqmlC+uI6ln6mUZFTiOA=;
        b=GGgaIJjdnRx7ypN2QX+rYYjcw8EU0ue8YeNFtolEmzJwlEscs6hEBYzAZUzXPZVqpA
         37G9l8PM4QQJSCv5xxwoUesa40Jcd56N2+/IXHplvcfxbS6vXSL+O9ouTcBkw5+MT0Ts
         1OFdwl1wI1U2hL++oDAO1nOB5OYwVP/RXQvWTm38KwHTVsUxrMliZw25vcStB5IRRj+B
         r3xH2Pw1iMmtPrBIo0U1FazAzKXEn/SEsLMQ3BC/KQ+J5aT3d6eMZZVQ5Ik93afDQzrT
         uxZdQIHCmxCU4LUDT3qM+XT0AT66nsGoQbIGpa7VDtLfq6IMgkbQtTVJKe6usB6LO2Wc
         QnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774679154; x=1775283954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnmAY2j6WsZg+gjoAQiABlVqqmlC+uI6ln6mUZFTiOA=;
        b=Ibm3CPtqUqGfWpCdHwL7O3q/HmYwelKZ99++eiE7KwfQSkdQBYrJRjSidG8RsD+vlz
         htpQWzQQ+H3mAYMSRNiv8YuwIE4iQcItVo9GvD2UaYy/bA8s3KoYcAJ4XreGnU7LbhH8
         VhDab8pG3Vc9vNg8P74dfxhXvvCnOKMJqs5a9noO4lwdFqGSHZithgKC89uTeTIjP+U2
         v0H/KeqrFxFDXad7c8WiWtCbHufHtWxqWz7TxN/3voc/Fg2RfRNmoZ4N4d9LNWEHlAS5
         k+HCpKPYly95na3JtRlb0WrQSK8ngTTlwfZtWIEVmKheFdlFMMAkX42W0HktxGcuGM2l
         4H2g==
X-Forwarded-Encrypted: i=1; AJvYcCVDdYXcUNh9rtrUUQ1yDh7HtVlbqJCb0/+LAIK0WpC6OnvfIdce6O9dKi2D+Ywoy1p+eQK+naSJhDIWfRGN@vger.kernel.org
X-Gm-Message-State: AOJu0YzBbs1LeFJG3WWglBkMa8UWahLSJwdkqZfsAxgKP4o3C+/K8C+l
	+Ie0jE7+tbDTm3hE12i84lpiHc12zR5kX6w9djwjLZ52lGpA63MRIF15E+abrP2Ul6DyhOInJYB
	0FgYCp8u1SEPJz6pk26TZp+/N/TUmReNxGx5ThKS6GAxsE/aLXoNP8h26GxW9aiJq4hJK
X-Gm-Gg: ATEYQzweYZaYsWU7Mrn0e3dglFXUMKUgWqIfG4TNePSXjZ9oXQL2YTc6p2u7hl8k+VI
	J9sX0UJos5+uxIxCN2G7U/wA8/4i/dYLG2Hzq3S2M9RelVMfwRWYq16P3YDtPVySUxxAPS4SVM5
	S7SzKsjM/GeLB4IIVbt4T2UTejYd/qKRVTbE7mQCLSlmGINEwtpyV6KiY7shVUDRaNtcsupNgSD
	p6QSsz6PqDPRNKChn0ywDMrO6N1S30MKmvOFVVpX81r3uDNeJ3quGvvL2qKqtWSZiV0ULlMpZZ/
	2gRB1m/KumRPZa/19UuUPqBGPKaolCZZkT6KQ7/FrJhyVcCOyq9ox7xvBHmPPdRKxNez6NbFl2x
	eadq0AnkeYgcrl5o+SN11FLkTJYU5vu6oXyuHOk159oJGPVd8gOzdyg==
X-Received: by 2002:a05:6a00:4517:b0:82a:75d2:73c6 with SMTP id d2e1a72fcca58-82c869c5f49mr6718340b3a.18.1774679154221;
        Fri, 27 Mar 2026 23:25:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:4517:b0:82a:75d2:73c6 with SMTP id d2e1a72fcca58-82c869c5f49mr6718322b3a.18.1774679153709;
        Fri, 27 Mar 2026 23:25:53 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca86307a5sm1071769b3a.60.2026.03.27.23.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 23:25:53 -0700 (PDT)
Message-ID: <3fe34754-e691-9fd9-7fab-1c81f98ef534@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 11:55:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v10 11/11] media: qcom: iris: extract firmware description
 data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
 <20260328-iris-platform-data-v10-11-46b92bfe7b52@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260328-iris-platform-data-v10-11-46b92bfe7b52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2-KFnKaNd3gQ5IhQYVY_fG8H_aXf7y4s
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69c77472 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=n9i7a1ABM4vdrNuulSdbnA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1XFNu35YfRq_e6hXo-gA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 2-KFnKaNd3gQ5IhQYVY_fG8H_aXf7y4s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDA0NCBTYWx0ZWRfX7/EAYGebeGNF
 pwcjXRzi4offaREtbmRLuSv8wGmt4LprrEJcSCDDZQpC7SNqfzWlPLTUwX7c/WeAdO4C4raL8Xe
 Mz+Se/w2ce+Y05sldgDx1+S7rwo1K1wjCmCpjMa6gDMagAnvp9RtdzGd1izAOOdMoL+X9YN4C77
 QTCpW//+XDQW1SKvGAPbBJkavuIVB5njLKzkgmjXKrrof0iOGBi65RG7Gcw4c5sbP5yo5XSrtIX
 YhWZszS0nRvR3oTcVYepYEhuAgHNNI7AHEoDhFyAEj+cnfAseotaHl0zo/biQZncy3Lgm/UPIsj
 1gFD4w2VTI9Grl1xtfSOWztF1yY791TbmVoTpbOq8VKpmh0UkOW0uVelWFG9Nx9zW0v0BrQlC1X
 WdsS8qSKGpqiwKC52dyasZE7EBUZb1cC86n3FTEONuRWwZNL0TqBDL83kLFWqaykKzotkaloMER
 +VEa+HC2a0bRkvvZNeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603280044
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100527-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 9791B34D80E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/28/2026 4:58 AM, Dmitry Baryshkov wrote:
> In preparation to adding support for several firmware revisions to be
> used for a platform, extract the firmware description data. It
> incorporates firmware name, HFI ops and buffer requirements of the
> particular firmware build.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  2 +-
>  drivers/media/platform/qcom/iris/iris_core.h       |  1 +
>  drivers/media/platform/qcom/iris/iris_firmware.c   |  2 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  2 +-
>  .../platform/qcom/iris/iris_platform_common.h      | 15 ++++----
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 20 +++++++----
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 41 +++++++++++++++-------
>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 +-
>  8 files changed, 57 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index fbe136360aa1..ef7f6f931557 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -295,7 +295,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
>  {
>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>  
> -	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
> +	buffers->size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, buffer_type);
>  	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
>  }
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index e0ca245c8c63..7f36eb65dcbf 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -99,6 +99,7 @@ struct iris_core {
>  	struct reset_control_bulk_data		*controller_resets;
>  	const struct iris_platform_data		*iris_platform_data;
>  	const struct iris_firmware_data		*iris_firmware_data;
> +	const struct iris_firmware_desc		*iris_firmware_desc;
>  	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>  	enum iris_core_state			state;
>  	dma_addr_t				iface_q_table_daddr;

This is still missing the doc update I pointed out in v8/v9 as well.
With that fixed,

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

