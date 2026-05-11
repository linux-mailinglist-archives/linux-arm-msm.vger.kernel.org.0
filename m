Return-Path: <linux-arm-msm+bounces-106841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6InoIvRzAWr9ZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:15:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DAC5086A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B99430013AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 06:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA5B23D291;
	Mon, 11 May 2026 06:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJoiUuKm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAuebPUv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA43A2C027A
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778480110; cv=none; b=UQstrOTnCMGKNe/ZiQVWJhjRufPqSy9fw1mitf5Ci9DxHthe7GkQdisilqgAvnsbqNaSYdKoa8p1g17jV/Jxso7BzTtu8vnNkgXdtkT2+xzVf5zwvGbX87hqDfsUlf/gZPn2tbyKkdn9AcEgESdefiueHHEiObyTAIi4d58s9sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778480110; c=relaxed/simple;
	bh=Xhm4/QggtVtSIk/ZUkSKW4bMk6HNUwYAZCQ6qZ1qW2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKLfxcWlMj6Q8DnuyB2n7X1HfJKUQnUmnAFbHqhIxbQ1RsjD42IB2cSuL7dWTsleUyDtmm70ByekYABEaTSpOJsT5NYuqNJk+2+8MFbbvoQ+Jdurb8YL0JuWOo7HgxdyZYT7USp5SSzOrFUdDj8t+wrCVMMtTmIC84QAzSNoUWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJoiUuKm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAuebPUv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64AMkvRc3601177
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoMHz/A+lBn+MtT7l9ALIG1gozQr9HocMIO5xiqHdEA=; b=fJoiUuKmldxj9O88
	CC5hM7XUkoRTR1R6W4eHbXduq6xlJeyx3J4/t4E6YMCk77dhMrVcALNLZ+KG1dxP
	GtM0KRs+PyHWa90NBfWdqjeHxu6KL9k/8l78JJJlMvaTzleBipbeuGyXpZHu1iRZ
	WO6horGCuuh6FiyJ5aatmS9kA/5YoMRioGrT5HihSYU9+io21q7KlaaCntKc3cFJ
	fNs/We9Rwbrym321NoRVkhi8jIIo6+j8LlSH0qlZCm4gsRJJfm9gmWRwJPww/gu7
	vyK3fPRaq/xkPsT67Dt6rwj1Xi9shVzakCou7UdcLFkj8bjhd65JGsy6mH/R35E9
	Asfi6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1uvsmvwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:15:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2babbeff9e4so45909635ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 23:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778480107; x=1779084907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VoMHz/A+lBn+MtT7l9ALIG1gozQr9HocMIO5xiqHdEA=;
        b=UAuebPUvd/ucOheuXK4QMxCzSILSwF9o8/vIO+GUdVWJWbw7tck4TH9IqMI105c+0S
         aW9cXuTQUyPKfUreUV4jrn0FcGf3PFiz0gLHhxBujslF4IRxh1I8F8kqJp6Re+ReYHYF
         N+bfhjzbWSzWnFbIeOFRBTTdXmiRW/QEgNKgzryJrC8LXAAl0EAKkIFv4THmHGOylGPX
         sRAJFvdUvQJywwopXMeI2mZapx2chZ73zhCRt9OzDmGiPa+/vqTOyhfP8E2Jw0EJeh9D
         QPJjRKrMJ1EiLDckxUGWD7yHVjLBMArs68U41oeVteEbJ2fnY57P2MhzWepElC8BSyap
         lXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778480107; x=1779084907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VoMHz/A+lBn+MtT7l9ALIG1gozQr9HocMIO5xiqHdEA=;
        b=m+zdUb6mwQPgtjT7qP6SxKIfp+3z+h1d/PGuXrGZUuERy/qKmYROhAUuUorPKjLPuy
         Q+KQyzqckkLUmbaXcCDyMGHg9DM8trCtmQfFiAwCLv93kIZ6IZAAF2YoBs6ciZ2Fpmbp
         MllOJhqN/cKRkmvbfKkiD+iq9LA5HrOuOUA5f7PpCcfbhP33GMHNRjhEg1b3aQ1BAHKF
         5UTMRUnajzoY9DR2VNILTSdrj5MGk4aUjuW/WCSPxj9n1BDKsyLqdbppabQNfuWlN8AO
         mvm0wflSu+3g5oD+UZbkq0g6xicaTydQepcHN3P8t3aI4aZP7/h9BrZAITCxJHyaJjHV
         7osQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kGgRBZaOJ5FnFqQ4qT0m/HENWbWSOGiqTU4UT1yR46f07PACjNLjZu6Bes0fEx+ienoflUO7DsskZ1228@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1FoZHsv6i2k2EdzCk60ajrBQVhWsQ5dfH4CKZPu1SmNlSOGR4
	NQdPICHByHBFu/mJfEYv+LMOUaMlSfGVGqOWU4wxB1bZ0AW+wMCZmJLbEpwZ+UeZ7cOyYoruE9/
	bz8N/yKTHhR5iTrATpZLifjZmdjFy2eCpVnMFKHGdFJ2oRu4NkoPbzwOJYo7WOmzuubYP
X-Gm-Gg: Acq92OHgyTyqRoXQZ4ZXZD1aRcnsni8GWXGCb09HbZyqFbIPsteqabNf9/3nOyb3lQE
	HUkeiKXa2imv6ut0YyO0FII4SpnsjkOKRupQW4N4rrevLKDD+J/E8J2eP/o9NCJwu2R/qRsHoiN
	tNA00GXwLQGKWbr5Fi+ifLn7j7m0uelll5jaX4y6sAHPUiHG2wrJx3foDjKX5DG6eD4bpLc7t+Z
	1PzeSLPwv0WtA4CqENJ5YLECxQy8v+xKu8UBZKp1KXSWpaY8vvlX8QejwFK1IvfPwDS5qGURMEB
	gdO5H2lgcOme7gtgMCkYU5VQ4RQbOiEvTkIZIOx+hqj/6ddO16g19FCARCDDfDF0L3HefBeAl/v
	fCUfLlQnsTBxMG7uB2z5DpvliXl94ncN3klLj4X0GaYOO0VpdsrSDeP6WKwf+20TK
X-Received: by 2002:a17:903:8d0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2babd4a475amr144705205ad.16.1778480107413;
        Sun, 10 May 2026 23:15:07 -0700 (PDT)
X-Received: by 2002:a17:903:8d0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2babd4a475amr144704415ad.16.1778480106094;
        Sun, 10 May 2026 23:15:06 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eac3afsm96611485ad.71.2026.05.10.23.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 23:15:05 -0700 (PDT)
Message-ID: <8b3e6cfb-cadb-58de-8235-34d56b011c3d@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:44:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-6-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-6-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA2NiBTYWx0ZWRfX13Y05jwrwYUW
 CM3PDmdBNd38iRIKI9hDFTH7PUWWyxtm0dOFKDSSYkA6f78Y+TFLGBkhLm0dYv2Ye2EXWsWXXiu
 00Wg32v/8JDkW94AI5bkKW26k8kiW75EjGE/a/y6ab1JkE54vRpyfpy8ducZx/dxaTg4x/JmIDN
 nIwBx6ZzM4M/GzbkO6LLEXaZHRq+iP9+Gqu1pZDGL/UcQSLtEHIPWhXHJyEG0o4oyES4DhoFaCq
 7ylT5mms4C/aBdX2JHNPuij/pU9B0uO5jgpUv4GqfN1xKxMobkItoTjqkNbJPY9um+JYfGt4ANa
 hEz9ewXmKH0L+bMDgLn5amQ4pUaK4P0tPMorjSzqr5u50ssg099QHc0vefEzBOttS1leuqEkN1a
 vUApOUmfmdbNRDAM6c1G6PWvuXzf+HoJisOKtdQ2Wk0kfbCXs3GPdpCkw5qcPMUZI1J1vLWJOM0
 BPgOp5CUlipyhFfjWrg==
X-Authority-Analysis: v=2.4 cv=dujrzVg4 c=1 sm=1 tr=0 ts=6a0173ec cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qEXA0ud_6SJ4FYFEtWEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 84_Bu6tzwmMnwQuFgmUTFFNCL0eD-ZE0
X-Proofpoint-GUID: 84_Bu6tzwmMnwQuFgmUTFFNCL0eD-ZE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110066
X-Rspamd-Queue-Id: 81DAC5086A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106841-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> @@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu2,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
>  	.num_vpp_pipe = 4,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 829dc37b4058..6e63f279efbe 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -17,6 +17,8 @@
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
>  
> +#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
> +
>  const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
>  	.firmware_data = &iris_hfi_gen2_data,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
> @@ -106,6 +108,7 @@ const struct iris_platform_data qcs8300_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 2,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
>  	.max_core_mbps = (((3840 * 2176) / 256) * 120),
> @@ -135,6 +138,7 @@ const struct iris_platform_data sm8550_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> @@ -172,6 +176,7 @@ const struct iris_platform_data sm8650_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> @@ -201,6 +206,7 @@ const struct iris_platform_data sm8750_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 59e4d68d042f..b8300195a43b 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
>  
>  void iris_vpu_clear_interrupt(struct iris_core *core)
>  {
> +	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
>  	u32 intr_status, mask;
>  
>  	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
> -	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
> -		WRAPPER_INTR_STATUS_A2HWD_BMSK |
> +	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
>  		CTRL_INIT_IDLE_MSG_BMSK);
>  
>  	if (intr_status & mask)
> @@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
>  
>  int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
>  {
> -	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
> +	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
> +
> +	if (intr_status & wd_intr_mask) {
>  		dev_err(core->dev, "received watchdog interrupt\n");
>  		return -ETIME;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> index 72168b9ffa73..4fffa094c52f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> @@ -41,7 +41,6 @@
>  #define MSK_CORE_POWER_ON			BIT(1)
>  
>  #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
> -#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
>  #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
>  
>  #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


