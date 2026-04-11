Return-Path: <linux-arm-msm+bounces-102783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCwxMPhP2mlv0AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 15:43:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF7D3E025C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 15:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26D6F3018AFE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 13:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E11327FD4F;
	Sat, 11 Apr 2026 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9iGiH9w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TsWDB30n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C5B27E05F
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 13:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775914989; cv=none; b=faFquk/LZ4NIYOafbhuo25VanvcVvIuWZ6+hOcMbBVgiRkyi6qXIWa9N6zLN571cj4vbXPQ1yrzbEMt8/EBrdYRNBGM3XSIJSNIqIM79TGfRNfB1zt8LmlyVoDHjySpOwS7AukhJS9CMybq2+XlaLqpsw4mbk6IxR9FDuDV1yYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775914989; c=relaxed/simple;
	bh=JyIewGYPt9jhNA4Rfo3r/BCePd/6bb5X4WwamqK+Tdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NynIf8z7v9+sQwcdoiVXdr7KDBCRRa9JrbXwPES9L5XtVOCfYaNRJT/CnUTZnbcLiXD4srzqlQsvq2DekCWui3Pv/rwLHt97GQ7zwAzpkiB2kgAHL5rj68u5cZsX5DcWroxj+FXkH6tY5w5hrbPd0VB+HEnmBd/tFkrPG7IknFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9iGiH9w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TsWDB30n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B47lEe1200648
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 13:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1FM6PxlKeuHV4NdVI59ngZh8BnaIV4nhG/SH9Tn2maM=; b=U9iGiH9wWFInLj2V
	cfk6HoVjL78QabUj7IaDd1ObJEPPtvk+f22rkVPS3B+Gav9Z81/SoxT/jKxuGr3J
	IA/3klDMFSVj5pFHkNM5AM+uPByJwdIlmnuQCsLbPhjgoUurLiEhOQCaq+llmJCW
	ADjtn6t8vLvSl1b0Wn2KvTns/B+35XLAzPcrma0Ihkq7DlunQAfXR8aurLueI7aE
	Z2mNi73ke/BGG5a9ugFZGtnulAaSkxp3psmMKk4YRBC9YKS1jdQ/Ki2aC3FpuHP2
	T66j4C6Ed5/MbzsitxmwY0XwQMoIGbsP32vATWzXp1Mg8h+acT3UQ5ELu8jRBHy7
	e/kS3g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jrsc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 13:43:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da86144daso3609957a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 06:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775914986; x=1776519786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1FM6PxlKeuHV4NdVI59ngZh8BnaIV4nhG/SH9Tn2maM=;
        b=TsWDB30nAMkoib4KOIRaMIQ8VyZz6iiFBWZIBJpNS7X304i/sMF1kJE0oopqsdlcWq
         URKw0gMD7Ybn1Mr/mYxjW508qPKqNQD0v0JqGVvMinB9nIcD2a29s7QEn/EV8f1Tgzgz
         Bc3mXJjO9OTqu3PD+3rKbRGFHlr8c1wV7AyUkegstOdIGKvYrDK/d8gwrsMtNuoSWumP
         FLjV3fkAKRz0J11xmBYFa50h/Et1ikRo9hIS99p0eP24Mq6Z7Q8xJEjEfAxkpz2bNpNA
         hP3NEKpKeTb0p2CuOq7U6YaAjhDfdw49o4K1jMcNn1LC4BzeixSq9Qck7PWr7bYZaTSX
         BAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775914986; x=1776519786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FM6PxlKeuHV4NdVI59ngZh8BnaIV4nhG/SH9Tn2maM=;
        b=JktxywQRKjwvuIW0HZTwnSHuF2MPo9wrpjfYl3SSIzJ6tbhWFQUniKun9BCrsgLCNI
         uNbSFJeydzWub4JZ8AM3NUX1M9Y0nH8E4rK5sxfpmBy/jhGda02+wIz55SyhUIwPEncB
         C4AMT9QQfjDdF6w5VqTetD6yPfMYm3CudkPUSvdoHw5O0BAFUa2RnapEbSVuSOkzAq4M
         1ZSRnnrldlxkEt8rTMGtIALVkpGa1CXqHGA2zWi5KhRELO95yk7OfiHf+O+1GR8W81zK
         HiC+yyChUmXnk8boX1axNjbinCRtf1j/2akBZAlKvora8uLGDlicfMaAFW6PayxidUNf
         3Thw==
X-Forwarded-Encrypted: i=1; AJvYcCWST6cOqfkK6LNKfc7RiMYWDRLNl5uZQ+auf4/p4xMVlRRVsbDkSPJ/1LHIYdBskeq4C5PiYd1Feig35uMi@vger.kernel.org
X-Gm-Message-State: AOJu0YwFEx5A+maE9wwXFPmK7L3iK+xLQn0vju3Wk0iMvcU/rF+m530/
	yUx1NpVORkJwCEcXBnlsZckUE3pfY3vP7a0OlZwvL61ppJ2vAbOthPge86yQPm+9UcUiAQT9cYt
	3OtBKDUglGOngOlAt4rn5c4A8C5PVZEcbrwyKAiaq16TtongEogR84nWgBMBGWy43/tqk
X-Gm-Gg: AeBDieuIpZSmTHvDz64vAZl7BZjxjLz+S95DpZvEv49nIpyA/R17kQeRTLkiL+I8lwV
	ghJeka4iGVeNq11Y6XO7Q58r1kDou67mmnoEkcASL8/XZfnIx9YaM0hd7Lawcs0hd5Irtp5rz1E
	IaFUroLTTxDoXKEitpBEQ9vNqnktBnnZOZj2xkqa6Zko2FRloR7UfqffUlaqjUUNRmmV/cj/tDS
	WrhQBhLiYHnjabQhavB6fDDIvKDlLUIdj6JjZ/FAMEdASCOfjuevaytgeCzTVfqG2Ee7mlV4ZHz
	LSZhNe+b2RslsWbKg6AxUcf4g6lpAs+m+PvDiWf5HC8I6ZjrUp7YHJFlXD/X8m1KkwZ3z9yqWfB
	9aSCPKOwbvwasZ7df2zW7LTamzrei4ZJ7ArScK0A8cIXbkTtViInuMfiwlQZCgNRv8Nb3BrGBbf
	WWMEcufet0/Q==
X-Received: by 2002:a05:6a20:3d87:b0:39c:1871:7c6e with SMTP id adf61e73a8af0-39fe3d0dcd4mr8121068637.16.1775914985753;
        Sat, 11 Apr 2026 06:43:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d87:b0:39c:1871:7c6e with SMTP id adf61e73a8af0-39fe3d0dcd4mr8121042637.16.1775914985223;
        Sat, 11 Apr 2026 06:43:05 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c793488d824sm519547a12.16.2026.04.11.06.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 06:43:04 -0700 (PDT)
Message-ID: <4b0c24ac-65eb-4861-80f5-2b9c9239e719@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 21:43:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] bus: mhi: host: Add support for non-posted TSC
 timesync feature
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
 <20260411-tsc_timesync-v2-2-6f25f72987b3@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260411-tsc_timesync-v2-2-6f25f72987b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDExNiBTYWx0ZWRfX7mmwKOZJL4jG
 iicFqZv7CCMvw1y3YCo86zlzWi5lvLUXfcJpzEipe+8RsCChzbn1OZyByNtrEOEPG2x82VbL3Sv
 B+JUca5YNhIay7Y9Np6IHWtffdYFXDzsKXa4izz35rzheAvsS7ROu6+TXiBsT2XUSfDX/aluSY7
 RzRDGEPbUEHEm8y+FIqkXiI9fVGJyEQEOYg5Vpzgfn4T7/69Zz2lQSIRihxF0BgdHhQVZ/FMcuU
 mwhqA16kAdTvsZ9xwbCXk71BeuJdDStxzqvFRb9d2eNse69ZT3Pc5Q28XR5/tlbBCvWfLDD52D1
 qMEhDVHPTPqDOCKblliVKN+GsqqoZttbxIfwjk1cFV1MBxllnTAUsEyT41ilNbrlfpN5ycrgfzL
 2mk7R36vH/CMyj/xD33rhhnMpI7L8o2QHnxaYb2JperbisdF09G11lnKFfWNoVyaddvXlwzLFyu
 kjMeNg9UgX5IwL6vxyg==
X-Proofpoint-ORIG-GUID: Q8LYEPzkLSLGPq1-sx6NBTVOdWZUyB35
X-Proofpoint-GUID: Q8LYEPzkLSLGPq1-sx6NBTVOdWZUyB35
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69da4fea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Obl49t-0RtMGbK0jPykA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110116
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102783-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BF7D3E025C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/11/2026 4:12 PM, Krishna Chaitanya Chundru wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> Implement non-posted time synchronization as described in section 5.1.1
> of the MHI v1.2 specification. The host disables low-power link states
> to minimize latency, reads the local time, issues a MMIO read to the
> device's TIME register.
> 
> Add support for initializing this feature and export a function to be
> used by the drivers which does the time synchronization.
> 
> MHI reads the device time registers in the MMIO address space pointed to
> by the capability register after disabling all low power modes and keeping
> MHI in M0. Before and after MHI reads, the local time is captured
> and shared for processing.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/common.h        |  4 +++
>   drivers/bus/mhi/host/init.c     | 28 ++++++++++++++++
>   drivers/bus/mhi/host/internal.h |  9 +++++
>   drivers/bus/mhi/host/main.c     | 74 +++++++++++++++++++++++++++++++++++++++++
>   include/linux/mhi.h             | 37 +++++++++++++++++++++
>   5 files changed, 152 insertions(+)
> 
> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> index 4c316f3d5a68beb01f15cf575b03747096fdcf2c..64f9b2b94387a112bb6b5e20c634c3ba8d6bc78e 100644
> --- a/drivers/bus/mhi/common.h
> +++ b/drivers/bus/mhi/common.h
> @@ -118,6 +118,10 @@
>   #define CAP_CAPID_MASK			GENMASK(31, 24)
>   #define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
>   
> +/* MHI TSC Timesync */
> +#define TSC_TIMESYNC_TIME_LOW_OFFSET	(0x8)
> +#define TSC_TIMESYNC_TIME_HIGH_OFFSET	(0xC)
> +
>   /* Command Ring Element macros */
>   /* No operation command */
>   #define MHI_TRE_CMD_NOOP_PTR		0
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index c2162aa04e810e45ccfbedd20aaa62f892420d31..eb720f671726d919646cbc450cd54bda655a1060 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -498,6 +498,30 @@ static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability)
>   	return 0;
>   }
>   
> +static int mhi_init_tsc_timesync(struct mhi_controller *mhi_cntrl)
> +{
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	struct mhi_timesync *mhi_tsc_tsync;
> +	u32 time_offset;
> +	int ret;
> +
> +	time_offset = mhi_find_capability(mhi_cntrl, MHI_CAP_ID_TSC_TIME_SYNC);
> +	if (!time_offset)
> +		return -ENXIO;
> +
> +	mhi_tsc_tsync = devm_kzalloc(dev, sizeof(*mhi_tsc_tsync), GFP_KERNEL);
> +	if (!mhi_tsc_tsync)
> +		return -ENOMEM;
> +
> +	mhi_cntrl->tsc_timesync = mhi_tsc_tsync;
> +	mutex_init(&mhi_tsc_tsync->ts_mutex);
> +
> +	/* save time_offset for obtaining time via MMIO register reads */
> +	mhi_tsc_tsync->time_reg = mhi_cntrl->regs + time_offset;
> +
> +	return 0;
> +}
> +
>   int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>   {
>   	u32 val;
> @@ -635,6 +659,10 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>   		return ret;
>   	}
>   
> +	ret = mhi_init_tsc_timesync(mhi_cntrl);
> +	if (ret)
> +		dev_dbg(dev, "TSC Time synchronization init failure\n");
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 7b0ee5e3a12dd585064169b7b884750bf4d8c8db..a0e729e7a1198c1b82c70b6bfe3bc2ee24331229 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -15,6 +15,15 @@ extern const struct bus_type mhi_bus_type;
>   #define MHI_SOC_RESET_REQ_OFFSET			0xb0
>   #define MHI_SOC_RESET_REQ				BIT(0)
>   
> +/*
> + * With ASPM enabled, the link may enter a low power state, requiring
> + * a wake-up sequence. Use a short burst of back-to-back reads to
> + * transition the link to the active state. Based on testing,
> + * 4 iterations are necessary to ensure reliable wake-up without
> + * excess latency.
> + */
> +#define MHI_NUM_BACK_TO_BACK_READS			4
> +
>   struct mhi_ctxt {
>   	struct mhi_event_ctxt *er_ctxt;
>   	struct mhi_chan_ctxt *chan_ctxt;
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 53c0ffe300702bcc3caa8fd9ea8086203c75b186..b7a727b1a5d1f20b570c62707a991ec5b85bfec7 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1626,3 +1626,77 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(mhi_get_channel_doorbell_offset);
> +
> +static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_timesync *mhi_tsync,
> +			       struct mhi_timesync_info *time)
> +{
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	int ret, i;
> +
> +	if (!mhi_tsync && !mhi_tsync->time_reg) {

if (!mhi_tsync || !mhi_tsync->time_reg) {

> +		dev_err(dev, "Time sync is not supported\n");
> +		return -EINVAL;
> +	}
> +
> +	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))) {
> +		dev_err(dev, "MHI is not in active state, pm_state:%s\n",
> +			to_mhi_pm_state_str(mhi_cntrl->pm_state));
> +		return -EIO;
> +	}
> +
> +	/* bring to M0 state */
> +	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&mhi_tsync->ts_mutex);
> +	mhi_cntrl->runtime_get(mhi_cntrl);
> +
> +	/*
> +	 * time critical code to fetch device time, delay between these two steps
> +	 * should be deterministic as possible.
> +	 */
> +	preempt_disable();
> +	local_irq_disable();
> +
> +	time->t_host_pre = ktime_get_real();
> +
> +	/*
> +	 * To ensure the PCIe link is in L0 when ASPM is enabled, perform series
> +	 * of back-to-back reads. This is necessary because the link may be in a
> +	 * low-power state (e.g., L1 or L1ss), and need to be forced it to
> +	 * transition to L0.
> +	 */
> +	for (i = 0; i < MHI_NUM_BACK_TO_BACK_READS; i++) {
> +		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
> +				   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
> +
> +		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
> +				   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);

ret is assigned but no where checked.

Thanks,
Jie

> +	}
> +
> +	time->t_host_post = ktime_get_real();
> +
> +	local_irq_enable();
> +	preempt_enable();
> +
> +	mhi_cntrl->runtime_put(mhi_cntrl);
> +
> +	mhi_device_put(mhi_cntrl->mhi_dev);
> +
> +	return 0;
> +}
> +
> +int mhi_get_remote_tsc_time_sync(struct mhi_device *mhi_dev, struct mhi_timesync_info *time)
> +{
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	struct mhi_timesync *mhi_tsc_tsync = mhi_cntrl->tsc_timesync;
> +	int ret;
> +
> +	ret = mhi_get_remote_time(mhi_cntrl, mhi_tsc_tsync, time);
> +	if (ret)
> +		dev_err(&mhi_dev->dev, "Failed to get TSC Time Sync value:%d\n", ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(mhi_get_remote_tsc_time_sync);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 88ccb3e14f481d6b85c2a314eb74ba960c2d4c81..f39c8ca7c251954f2d83c1227d206b600b88c75f 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -286,6 +286,30 @@ struct mhi_controller_config {
>   	bool m2_no_db;
>   };
>   
> +/**
> + * struct mhi_timesync - MHI time synchronization structure
> + * @time_reg: Points to address of Timesync register
> + * @ts_mutex: Mutex for synchronization
> + */
> +struct mhi_timesync {
> +	void __iomem *time_reg;
> +	struct mutex ts_mutex;
> +};
> +
> +/**
> + * struct mhi_timesync_info - MHI time sync info structure
> + * @t_host_pre: Pre host soc time
> + * @t_host_post: Post host soc time
> + * @t_dev_lo: Mhi device time of lower dword
> + * @t_dev_hi: Mhi device time of higher dword
> + */
> +struct mhi_timesync_info {
> +	ktime_t t_host_pre;
> +	ktime_t t_host_post;
> +	u32 t_dev_lo;
> +	u32 t_dev_hi;
> +};
> +
>   /**
>    * struct mhi_controller - Master MHI controller structure
>    * @name: Device name of the MHI controller
> @@ -323,6 +347,7 @@ struct mhi_controller_config {
>    * @mhi_event: MHI event ring configurations table
>    * @mhi_cmd: MHI command ring configurations table
>    * @mhi_ctxt: MHI device context, shared memory between host and device
> + * @tsc_timesync: MHI TSC timesync
>    * @pm_mutex: Mutex for suspend/resume operation
>    * @pm_lock: Lock for protecting MHI power management state
>    * @timeout_ms: Timeout in ms for state transitions
> @@ -401,6 +426,8 @@ struct mhi_controller {
>   	struct mhi_cmd *mhi_cmd;
>   	struct mhi_ctxt *mhi_ctxt;
>   
> +	struct mhi_timesync *tsc_timesync;
> +
>   	struct mutex pm_mutex;
>   	rwlock_t pm_lock;
>   	u32 timeout_ms;
> @@ -795,4 +822,14 @@ bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir);
>    */
>   int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_offset);
>   
> +/**
> + * mhi_get_remote_tsc_time_sync - get external soc time relative to local soc
> + * time pre and post using MMIO method.
> + * @mhi_dev: Device associated with the channels
> + * @time: mhi_timesync_info to get device time details
> + *
> + * Returns:
> + * 0 for success, error code for failure
> + */
> +int mhi_get_remote_tsc_time_sync(struct mhi_device *mhi_dev, struct mhi_timesync_info *time);
>   #endif /* _MHI_H_ */
> 


