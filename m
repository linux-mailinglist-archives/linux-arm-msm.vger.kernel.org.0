Return-Path: <linux-arm-msm+bounces-98361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA1SLXhrumnRWQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:08:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB072B8AA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C32E30037F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E3937EFFF;
	Wed, 18 Mar 2026 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZuhnP2iC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTXSOPIO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E2733DEDD
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773824738; cv=none; b=Gmm1/sKq7yyoMsvgBM9VEWhFdK6GRexyXg0pLkdP2TNiBXoOBzOcIog9uffIplT6EXosasngOtaPNYXZkNRCa+nGsNmAvYOPSbtKbfqR7wg1Tqsyfr0LD7ifae+BUQuvDuPxJXXrgUYYGMaim43iXhRv+ypt9+FIKZGhC8cw11k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773824738; c=relaxed/simple;
	bh=9sLPdfZdOTRGWkdHWAt4deRhUQbSXz3/+uenBwBgRH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ta96CBnQAvGMq/4yu7QCnwDWeP+pljT0VdnYJZmaukJ4OoMAeaJL2Cxfooy50vcvOKbc9PvBgVPS7ePl6EBZgxJ6L2+DcP2WlDk5YehYAcghq3HAhkyAHe/nrOzTPbGcZui2BgmLILpEcs6iypifsT6yzXT6+x4FK8ABsfcrsuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZuhnP2iC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTXSOPIO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3L4Yu1145459
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMDtEQ0NH96TVBLji2qMk3/V2u0vd9jPzqt2rV4TdqM=; b=ZuhnP2iCJCvDVGmL
	DADwgaXrWKJVf0KgZV8BSCT6O4zDnbWbpdMPsZxHO8zJ+ceYk8ALdw7Jaf4x7C6d
	BhDJnY3I4UYHFOdkAvplecE3KrAaGvIgCfc0o9G7OKR1VaZcE/bB+n+YizTfvVhZ
	Ln/JdjckJ8Z2a9rO4qmXvdb9JbvLiC3+TTc9NJ2b0qCwBfh1zcaryo2l2Beyc2Kv
	7mcYjaRp97Gy5X34Tro3hnQ1VJu7j2mXAsm6LrXl/fi44smzzPakHX8t5zczITKX
	lC+TKpoSuDAHDuZiQcpxM6EaKo3kkyDWMVgauuqEyiujZoaY+yuygO9mXN9iDba5
	BK8VOw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3uggf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:05:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a90510a6d1so6785475ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773824735; x=1774429535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMDtEQ0NH96TVBLji2qMk3/V2u0vd9jPzqt2rV4TdqM=;
        b=PTXSOPIOz+9KLnubmnBmVyy99Kyne4cTV8SX8RvcFw4VP78XPwA2BjebhdbwoPPD6N
         vogiLf2bdbk7Wcj8xBhOHCAxCsCDCvkPEq6jw3WpvRZv/5kDa0r0/8p5C+HuVD3R19Cp
         SCe0+Q+cUDH6TjC0jihQVZG5n4Q0q4FVxmrMeZ+AoOEdVfldnSj8XSD5Z3eGA6ewtCEK
         4tVP3tetb04N4nCkd/VUTm7z8ECYdeResBt0dRDxsvdQfAkzHMoEcHTNHSBdKczNGU9O
         H4wNvfpxHnyCcs1ehT/v+NYv55JkaSNOu+qBfw8FZVkG994lv5OntiwD/CducPiHJZqp
         VlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824735; x=1774429535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMDtEQ0NH96TVBLji2qMk3/V2u0vd9jPzqt2rV4TdqM=;
        b=Rr6N3mkN7ypQzinPgGONhlM4d5sQShQsENCjrWaA/OTvJcnBklW279mVkJGBE0RDcB
         jCl4H5zsDGwRaXjN3m5x/Xkg9XneM04DTdyiDPIhbHhnNgmd/6ZIdKGIQfO/sFkWOTlY
         SlStY15sQzjnyDBxT8IHv25M5ECCPKE58fwrpLAe9pLiUlP2F1xSt+ZK8d/WxhXNIOec
         P3+fbcfZi1Z9/dp8+wWAAxtbi5r8qdzojkWKAvWWjKrWQEUCs//Y0b41iSN7l2O0U0H4
         OTDe41FxaR4m/grZDtgkCKrrZlxnCUVJnoCiUIk0EXcRjWiNfiEmPoIzhlB+3wt5bK91
         cceQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMj/zrPHsSSWQdDfupxEVUN3enUAiS7Q4zS/oKjCq3lyXFF7/lJ48+UocoEUh03mdCcyBImrwH+603lx5u@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7hwGsxzRx/4mcdsBmrR8KQDSK/BSq96w3veowtQFCFhgRQief
	A7AUD6GlejyoEz8GaNtlJ0DOnkhNYLFL7xoCuriudS2wGgf4zqXXDQ/VP7MPfPAZtullwCaI9Gj
	WY+OTEIk9R6gKJfHn3JTf2yFrt7Tjxhw0FBmdJrbQo5mx7G2GqwDyBip+zGgyFxItxC0b
X-Gm-Gg: ATEYQzzH7FuxwoMQL/Wpk2UqFfOxLBml5zlIivtdkMhkQ4qYnAMexwFcxiOdNEJz1XN
	cqNwaRzRjxqhcs0oc2rkatPLvyjCmM/zzfc9q6qEXKWiwp+90/QRNjoLpjAnZ5stLOxd9cV4j78
	Wrp554oV2eZpA7eFXBkJG4fnk0aVaGuQlgX6So+Q0CJDkqLYjw5kKYX6LAQOhNr+KY1ZJYHVroN
	udgil9sylrEhYm/NCVW5BZ+TuS6HgDUubWrTFDYo35xMkt7zWTvxB16J/IDUMmE8pQKwec6Q+fl
	2fmlgsBUR//DYE6sxdQ1t5FdVE8PiUJrK5LtC7rv3vAh40FF1jkbaIWQZx4CBGmJhVSbssdLgd4
	cAum1v89sQst6RMsYoO7CDEsfAhD34wU9JnVg7en/jjwL6jHAEJkt6w==
X-Received: by 2002:a17:902:7443:b0:2b0:6ba2:3d78 with SMTP id d9443c01a7336-2b06ba240a8mr22925205ad.3.1773824735447;
        Wed, 18 Mar 2026 02:05:35 -0700 (PDT)
X-Received: by 2002:a17:902:7443:b0:2b0:6ba2:3d78 with SMTP id d9443c01a7336-2b06ba240a8mr22924965ad.3.1773824734948;
        Wed, 18 Mar 2026 02:05:34 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm19944875ad.57.2026.03.18.02.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:05:34 -0700 (PDT)
Message-ID: <3ee87252-6b90-a389-0621-5b0b8d2f87ff@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 14:35:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 7/8] media: qcom: iris: split firmware_data from raw
 platform data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-7-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-7-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69ba6ae0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=RgczR8+8wRjDfzPIf2UjDw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lkyXAShNmXRLqkyLKQ8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 28H6EXXVPvlFPQvpDT13ZlXozpfh7dsJ
X-Proofpoint-ORIG-GUID: 28H6EXXVPvlFPQvpDT13ZlXozpfh7dsJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3NiBTYWx0ZWRfXyfzsSLTFZLY0
 N2KzoAPZbX04c0o6AW6lxZvHKjXTXy6qgrYvqqAJaM9IVVNGa557rGKAzbR5FFg6tGeo8Gs5+ne
 R1TJrVe/LGqpWmlMxXjPXLYRDBPZLZ1d9i8SGpHc8vbViMwibMNmxobwuTedTBfLwl/IBzW9a1g
 hO3Dfh5UwfNkAaPSvvvXT2BJn0WYSKeZOCeJyR5wNnrIxx7Qq/j1hvc7/joUst+MUrWp5+nXZns
 m+YfPiP60nETim7fvtR/V1knJrLUO9MfqNzhJIZ3Lkhu2qXlqymAvxrmJ8Dl/FXft8BaxbPiEWS
 NIJz8Vq2YEM/l1/aKchtY3ICgLy7ThM50Hf8GA3CI81ab7tyvlH14wDmMxRS2DAjzXr4uH54kJd
 bmAB3KaTbOtk7Mw0mEicVUDul7LWcqk2g8ZB6AeDCyFPgXajX0s9QIo+J1dDKVovTT87JrdLZlr
 KuX0k95/krMfP62huXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98361-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CB072B8AA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
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
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  82 +++----
>  drivers/media/platform/qcom/iris/iris_core.h       |   2 +
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |   8 +-
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 +++---
>  .../platform/qcom/iris/iris_platform_common.h      |  82 ++++---
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  67 +++---
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 246 ++++-----------------
>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
>  10 files changed, 205 insertions(+), 369 deletions(-)
> 

<snip>

> -struct iris_platform_data {
> +struct iris_firmware_data {
>  	void (*init_hfi_ops)(struct iris_core *core);
> -	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> -	const struct vpu_ops *vpu_ops;
> -	const struct icc_info *icc_tbl;
> -	unsigned int icc_tbl_size;
> -	const struct bw_info *bw_tbl_dec;
> -	unsigned int bw_tbl_dec_size;
> -	const char * const *pmdomain_tbl;
> -	unsigned int pmdomain_tbl_size;
> -	const char * const *opp_pd_tbl;
> -	unsigned int opp_pd_tbl_size;
> -	const struct platform_clk_data *clk_tbl;
> -	const char * const *opp_clk_tbl;
> -	unsigned int clk_tbl_size;
> -	const char * const *clk_rst_tbl;
> -	unsigned int clk_rst_tbl_size;
> -	const char * const *controller_rst_tbl;
> -	unsigned int controller_rst_tbl_size;
> -	u64 dma_mask;
> -	const char *fwname;
> -	struct iris_fmt *inst_iris_fmts;
> -	u32 inst_iris_fmts_size;
> -	struct platform_inst_caps *inst_caps;
> +
>  	const struct platform_inst_fw_cap *inst_fw_caps_dec;
>  	u32 inst_fw_caps_dec_size;
>  	const struct platform_inst_fw_cap *inst_fw_caps_enc;
>  	u32 inst_fw_caps_enc_size;
> -	const struct tz_cp_config *tz_cp_config_data;
> -	u32 tz_cp_config_data_size;
> -	u32 core_arch;

This can also be tied to firmware data as this is required to be set for
Gen2 only and is 0 for Gen1.

Thanks,
Dikshita

