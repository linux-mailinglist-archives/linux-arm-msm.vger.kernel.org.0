Return-Path: <linux-arm-msm+bounces-99107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM1IJHLfwGn6NQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:36:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1DB2ED1DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B65693005AE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 06:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D824E3368A4;
	Mon, 23 Mar 2026 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7JyucPJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FpX0NPFg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365A13382DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774247791; cv=none; b=Av9+3SUQA6ugDWOYLVc/3T7dDwGxEazVCE7QUIcV6XFd6Iw6fTLOgbq4IShDpJQAIyx6SM2Eh0DfZijPyTHr5iUaQ2oMevhI+K3cNKH2J/8rBbyjbV7O/Ju9pAVAvauifFJknRz1kOlfvN5PO0SN7XBIb7MOrTluO9j1eIkTue0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774247791; c=relaxed/simple;
	bh=SG55dzYNEevyi4u6lpN3KXChXwdHwXvdMoHw+IIIM/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GfqKhdiaufMM4nS4mo71SLa0C2G3FG3WL4R9013HH1mUf/r3pkxrguOa+zJDw+Dnl+R7ACKSt+Uh0avBaYAv5ulTYyIaZtEkSdnsjkgCZasfRG3oJnEE5sLKMYAWV/pqKv/ZPJQMbR2Eddk1PGXK6Renrsg6zJ34FchahpGFWoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7JyucPJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FpX0NPFg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MKengi194123
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i9H6sI3queRR62Obn9oreIe69+sv8Bk0hdBxZVqX1kA=; b=S7JyucPJ7OvtzENo
	6c+ZxkU8+BWC7ClUvpvadwVGLUYf/CphfDcU5qMDJztIg5FKsearzB1NB8+gp2gP
	ftXWyj5lG9ZXb+tAFh7UPJAVTS24HfCklSH5DAHreuY8H16yShSHwZGNsVZBseQh
	UebdX/X87BmRQZlo1xLT+uZFeTig97XSo0mMSzTkYcv4u59fKQfBAA9honcZWJjj
	R5QMAaNhkjyflg1FGzzO7VL4LLYx2NWWBTp9M5yD0qKulX8u8yGpF5JvseVhAM94
	DC5owU8bR3WrXFwGB2q8ObNaVdk6YZGmc7zO3hT2maAOaXVPWqYh0LpaBu/0+ZMz
	4T2vmw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1kxsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:36:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358f058973fso5553167a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 23:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774247786; x=1774852586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9H6sI3queRR62Obn9oreIe69+sv8Bk0hdBxZVqX1kA=;
        b=FpX0NPFgUHBklKB1YwVrorB6Ty50mUNCpbPrMjP7OPz2n6WIatbKS7mKFTbFltenIv
         H2GG2GXIeb5Lgi7XinqSm5oLg8N0HXlVzSgO97+iQTe4i4eEWZWZA6MGvaZHDSrHZRjb
         0gSTwigDQBXVRx/hHTIfthoSI3NGDOn71gP5o5aTnChCTQ/7wex+8kVLw1yQOV14NFgc
         JbKlrVNXRNRt8ALoFR4tLPRpRePQyg89bCSOYYL29YHBsIm7RMu6u4Dn4WMY7g0CJgCq
         qX3mowPNlr6Xi/nx7wJdUabtgFwsPv1wD0/ATItFv8qruh1JLLdhfac0lu3orNl2XNtc
         8Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774247786; x=1774852586;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9H6sI3queRR62Obn9oreIe69+sv8Bk0hdBxZVqX1kA=;
        b=Pbz+LoLviVeIXqo8fgKQLEq8dsNJ4EMR3Lq39Cy1eWvylwPxr/ZzQ64iRe/GOGuR2x
         2Wt9aPyUxywS8kRykRqI6FFt1oVRJjtBCr8zLIYbLpAA+dz9yhUavuFdINJ3vE7fwT5x
         cr9zQYgFJGvD4Nw2SF7w7xwuGCKK31gr+u/9N0S0NHcxUSw6YOrF2mihhA9VdkYRTFuA
         rkOUGB2aduRPeh3PdBgAnpdKzVEx+Tm6h4EIZK880lVJ2f5cTu2ymTKMzWfp6YHznM2w
         V+VzpbBJ0KKIkgOqs//9yZ07JLuO5+3ZJjpFKFqPIEV0YgiVvWeDXSZvmapHvdlr0W7G
         iWpA==
X-Forwarded-Encrypted: i=1; AJvYcCX2dEtMQQcHQYZUJCi0sXOfmra94xMHmSn/oXxnWiRVMNKOhWUIOBb9MFqr/w1+gW/gqQsmlDmo6pU/TSOs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3iPk4kYc16qa53gItWu9IubpeeJW8b4i5lJNnXTpdzyOW5MSf
	1etUcpKpq4tdXed7RoOgsvv3CD4ruiEmZnqAKhhx7r5lSGvwN1yjGN3qe097/dSRWvR9lJiGxOv
	lPCSxoeickvak5upecPwA2n4I7yrGUFUjlVxYZSWOvbLqQkeNhNOomPWxQ2LzBDzs2LPv
X-Gm-Gg: ATEYQzx60WPx11Fd2B1KSCJRvmqvzCuDFnf9HIa/XdKAA99HbAmBOu2U6URXrlGbFfL
	sdrffyeAhRlCCEUoSguGvQp5lM/EkgDNylF5Gj/UYPvuuAmxsTyDa5r7uZi9qnq4t4qlc1oYKmt
	cP5q8C0VTmGbDatV4nxRjJIyl7Zgeqni5BaWMRwJSqXbXgMdhYPDUJwZGk6FrKU0TXD/bQ0elwE
	QPOeCuTMFn5wCYcbSU2YCSV2e7e7Y44DHBDGjCY7nITHkulvnhrMDKOt5UDXxen0Y9msFo3zpNA
	krYH0ogbyRD8AW3dX4rks6mTnBbxeResrhIhxZkKrKRf3ajBdDB284a0tVpHwP8RE7lt4RLDnGq
	LwWaCOUt6BIP6XXm7RqJ0ezIGLWXwgX9cG1CAMuKiLvSWBL4Afk/ecQ==
X-Received: by 2002:a17:902:c405:b0:2b0:4f82:74ce with SMTP id d9443c01a7336-2b0827bf173mr109718925ad.46.1774247786513;
        Sun, 22 Mar 2026 23:36:26 -0700 (PDT)
X-Received: by 2002:a17:902:c405:b0:2b0:4f82:74ce with SMTP id d9443c01a7336-2b0827bf173mr109718645ad.46.1774247786017;
        Sun, 22 Mar 2026 23:36:26 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c4f1sm97059195ad.59.2026.03.22.23.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:36:25 -0700 (PDT)
Message-ID: <8dc65781-9a0d-6c26-dae8-74bf6ec1854b@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:06:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 07/11] media: qcom: iris: drop hw_response_timeout_val
 from platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-7-55a9566ebf60@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-7-55a9566ebf60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Wb4noR_jHRDJhrj5-4IT4KbxSE1lDY7q
X-Proofpoint-ORIG-GUID: Wb4noR_jHRDJhrj5-4IT4KbxSE1lDY7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0OSBTYWx0ZWRfXyM+yGvMZn15y
 0VGCY4Gfl7Hr+5vfDBp8+zt1/736oST2/3TSLgMoTW7eVxqW6+0vDe1n07E0AKzYumt32mOZg1j
 eYl48TvfcrCiNM4fBDo28dy7O0OMBuwaXtVCd62elQpjD+F/0OjvZKe7IV7crKESbZaFkk6DoC7
 5Z1vWHUExjEqjJmncEnO2p6XMbcWYP5UEwq/rOUH3WcbJdnEv5a+uULxb0IglY3zGfbss+7RVPp
 9Tc9Ia9/avOn2iJB1bWpdnYWZbPOlyQ8NNQGTHvy9u51I1VdX/ovM9G54rze9dZTzh/CZ4alqb6
 47f7ot13HfpDZnu799tU7V3j5dZjtS4ElYvwZjtxJH5CosVM+ogDLvwNVpYrgjiHxxVuzZ0/ctP
 0iY9NYmafSRacpqdSnSXwGAnfoMEHk+1MSWzQTUkrx906j2cr41jn5gtHZ4JKSFmvtky/xdpNUZ
 fZvoj7PKcuVQ/PWdiHQ==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69c0df6b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=hbzS8gabZINpAvasuVNEhA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ERqvkBjMsZt1UCBLgn8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230049
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99107-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: DA1DB2ED1DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> The HW response time is a constant between platforms. Remove it from the
> iris_platform_data structure and use it directly.
> 
> Suggested-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c            | 3 +--
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 2 --
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 4 ----
>  drivers/media/platform/qcom/iris/iris_utils.c           | 5 +----
>  5 files changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 8406c48d635b..e6141012cd3d 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -28,14 +28,13 @@ void iris_core_deinit(struct iris_core *core)
>  
>  static int iris_wait_for_system_response(struct iris_core *core)
>  {
> -	u32 hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
>  	int ret;
>  
>  	if (core->state == IRIS_CORE_ERROR)
>  		return -EIO;
>  
>  	ret = wait_for_completion_timeout(&core->core_init_done,
> -					  msecs_to_jiffies(hw_response_timeout_val));
> +					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
>  	if (!ret) {
>  		core->state = IRIS_CORE_ERROR;
>  		return -ETIMEDOUT;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index d1daef2d874b..e8a219023aaa 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -232,7 +232,6 @@ struct iris_platform_data {
>  	const struct tz_cp_config *tz_cp_config_data;
>  	u32 tz_cp_config_data_size;
>  	u32 core_arch;
> -	u32 hw_response_timeout;
>  	u32 num_vpp_pipe;
>  	bool no_aon;
>  	u32 max_session_count;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index 9925a893b404..6ed4c4ae4056 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -361,7 +361,6 @@ const struct iris_platform_data sm8250_data = {
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
>  	.tz_cp_config_data = tz_cp_config_sm8250,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K,
> @@ -410,7 +409,6 @@ const struct iris_platform_data sc7280_data = {
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
>  	.tz_cp_config_data = tz_cp_config_sm8250,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>  	.num_vpp_pipe = 1,
>  	.no_aon = true,
>  	.max_session_count = 16,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 10a972f96cbe..abe523db45c2 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -936,7 +936,6 @@ const struct iris_platform_data sm8550_data = {
>  	.tz_cp_config_data = tz_cp_config_sm8550,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>  	.core_arch = VIDEO_ARCH_LX,
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -1036,7 +1035,6 @@ const struct iris_platform_data sm8650_data = {
>  	.tz_cp_config_data = tz_cp_config_sm8550,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>  	.core_arch = VIDEO_ARCH_LX,
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -1127,7 +1125,6 @@ const struct iris_platform_data sm8750_data = {
>  	.tz_cp_config_data = tz_cp_config_sm8550,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>  	.core_arch = VIDEO_ARCH_LX,
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -1222,7 +1219,6 @@ const struct iris_platform_data qcs8300_data = {
>  	.tz_cp_config_data = tz_cp_config_sm8550,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>  	.core_arch = VIDEO_ARCH_LX,
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>  	.num_vpp_pipe = 2,
>  	.max_session_count = 16,
>  	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index cfc5b576ec56..29b07d88507e 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -55,16 +55,13 @@ void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>  
>  int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
>  {
> -	struct iris_core *core = inst->core;
> -	u32 hw_response_timeout_val;
>  	struct completion *done;
>  	int ret;
>  
> -	hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
>  	done = is_flush ? &inst->flush_completion : &inst->completion;
>  
>  	mutex_unlock(&inst->lock);
> -	ret = wait_for_completion_timeout(done, msecs_to_jiffies(hw_response_timeout_val));
> +	ret = wait_for_completion_timeout(done, msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
>  	mutex_lock(&inst->lock);
>  	if (!ret) {
>  		iris_inst_change_state(inst, IRIS_INST_ERROR);
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

