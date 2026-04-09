Return-Path: <linux-arm-msm+bounces-102560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4e6BOKsW2GnzXQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:14:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE683CFD67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D844F300A116
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 21:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3437374185;
	Thu,  9 Apr 2026 21:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kz7dc2Aq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TiNlvEEH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B2418AE3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 21:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769255; cv=none; b=JvYzOS0JKclT/MPGnSKuFphZgVMhmEAEzmmBKCITH1tRipxoqtG85dc7t3nlfZ3SzpTbIQymLW8ngkCASOkxDcwFdsbrttPFRfpLNC8LUjx0Ltrtqjgmv3Z1tKPgp0ao4fxvVwtOa0kj3hDHKr29DRxyFxhBwgWqkM2c+6mGC4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769255; c=relaxed/simple;
	bh=fl4nGN4lCESvXQWVBOIXNbs8beARKP8jJmEhq8ZQvtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9pgU8pSxwHpLCQHgBF1BouJCN8Z88HGMhICZwO4CKdbIRPxilqTiH8TazQ+/jY9aiEHObBPYzHb3Uu3pySLSj6FdkA4jXejZvbWltwh2+rEZHqoXiQUBYOpePG1rL5cFnlHlqJJWmSn7F+G4XtsYZQT1phAr1RWKsjnmTRTLB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kz7dc2Aq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TiNlvEEH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639JFOGs2866294
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 21:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71bx/GMNtE6R0JOiEcxGItTozs6PCdIMyyDmKsMoGNI=; b=Kz7dc2AqlffxzAgh
	cdh/3LtvfpwHCe7rSWC0Wldi7NbRmijlA9Sf9GouOVHCKU9yBzRS3ISBi9wJpGgQ
	qnfNmlkyPHDfsKbfBAda4+AKrx+4I5vj/AsMOHcItxVdA99VajhrZ7N4VOsLUGaB
	zjfrFaLt6B8Q0SzCj03gDfr/GQ8vcibfyXUFpavDPh+EDjrmMWSLZJALXEmhxW/o
	CtImuz5AnVs45OKk8Uw+CaKSMOb0Jahf4F1I9+BkrqtiuLpsq3gUDyW1cEEr+O+G
	NkW8aOABPN6XpOvK2f8NdSHhx/NmzAvZSUwi27/s1zfsVvw83aZcSDZJEsO3ih1W
	Qj9J6g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decayhtyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 21:14:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso1872209eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 14:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775769253; x=1776374053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71bx/GMNtE6R0JOiEcxGItTozs6PCdIMyyDmKsMoGNI=;
        b=TiNlvEEHNCs1oIx+PUkLA5G1lkM7Pz7ARE3O+XzoNUXHgx+Bcy5Kkwzhof5cJqPUnT
         yCRzVubMhcCQUk91ikAp3uCtxIqPclmZH5eO+cpS7FUkiScJZE7mziDU5hfkxLO5B/sm
         TWsu+EXS2X3Rp6cvJr2rkAi9RPmyx1uTag5o3PayrFLGnSpEGZZo+Yl16PJLLUDmzhM+
         YDCxgmf74djOUg+FPYR4PfSS/3HpoOwjPMLvgw8dIkk+AAP8K7vk1BcfmqMHTl+6co6d
         OiuzcgYZL9ZwhwALHI8URE70CQLL8Chs95MnQu5NP4/b959+pylDDDH9/9JiDqM4wsGI
         cpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769253; x=1776374053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71bx/GMNtE6R0JOiEcxGItTozs6PCdIMyyDmKsMoGNI=;
        b=siZkAm9yzzoJNg++CN/Z/qoGsQLEiSYp73YB05NN/SZL04LzanrKZWnVSKU4ID+1E3
         EDPjGbIhUOBPaeE3v4LTHtn7GHNs2KgBHryOnuu1w92GpqMbqceV+nr0r5hI9baI16d0
         cQSVftuh0QfwisqYBoqRygNYDCEDiVVYT/12HKICLQRuCRvwcJFYoWxCJbiZYKqqlocM
         5GJBxGZFFmFEVD7reIbCCxJgzG5kdA6tYCtS9dgaYJSikFugP9V6uqtSBOK7Pvc03jC1
         mZJuozVYpuOTWGpVeW9Gqm2Trl3A7XlkrmZebLyWIXowSn/Uuphr3YJb6NimbILn1n0j
         9Bww==
X-Forwarded-Encrypted: i=1; AJvYcCXzckTsFT8gyEueDUniv7Dupni9zz0XJIoICHMsyv5fHqjQ1vkNzvdgeNuhrpHUkLalyCLD8yM9EMcy0vUA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9VwdqKnnW/MjaJPEfh+ZhucgW28SBDpmmkjjfa6ALy7Lw1Rdu
	DZ6UoZ241LZ5j6SGGGD8mJurHlSMzB9zSsY5slqYBFX9HCxptpgQ3Y+mGA0jPJaBcBoz3p8gDGo
	xCxBHMdWAIAMiDIloiUbhyMQTnEQJnXP6FyCCXnP8Ag+z2KrohFXmQp/xk7+HXj04+NNi
X-Gm-Gg: AeBDiesjfsvleUcdLMbQq35hqU4QkBKuNHdSmLWT30FYOafQAZ/J7eSEDmIcAQ/6ZJd
	Fm65/m19jOqlTT2wnPWRkVR6XGzehe3G0G/NAWyNfUdU29gV8sEjhTlvxXAyT3lIgfPAuZ2df4y
	l+3ZcVQSWeoyTS0Uyfq8dH7XRB+QU7YNfj0YkYnnu8Z488HXgkSYG6Nm++Jr/JRaHhumpDQeULE
	43L30ich24QcgeVHsC0WOWchjCs2Sz/VjBKRQjyUPKkSZsm7llsZAyv8SgXDxDP/JLfAaWDpumN
	UocQwe+vtrXX9YpO0svKu8X5khH1yXhjarrmUXp0R5fIyk6wyVVcR6sLcIQO/077mutF29JO8JX
	5Jp2vDq/15hwWqVYe9XgiEJjzo8giHEge2ANf/3b/hK5OMwgiBBfPc2aBsX7X4aFf4KQzjtO/61
	4=
X-Received: by 2002:a05:7022:419f:b0:12c:2dd7:9099 with SMTP id a92af1059eb24-12c34ef6d62mr423009c88.30.1775769252621;
        Thu, 09 Apr 2026 14:14:12 -0700 (PDT)
X-Received: by 2002:a05:7022:419f:b0:12c:2dd7:9099 with SMTP id a92af1059eb24-12c34ef6d62mr422975c88.30.1775769251987;
        Thu, 09 Apr 2026 14:14:11 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c698esm1454478eec.6.2026.04.09.14.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 14:14:11 -0700 (PDT)
Message-ID: <65985856-0a01-4856-af97-56caed5430b6@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 15:14:10 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] bus: mhi: Add QDU100 variant and image_id firmware
 fallback
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-5-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-5-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d816a5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-PYeUNOmlN0cYKBwraoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NSBTYWx0ZWRfX4WGvH4sXXviJ
 E+ezANULS+plprEXWkaD8k10BVOEDQcuMdlLBA8Uhqh1jcRzmu1kTyZVMquM0+J5W+qk9a2c2RI
 XlPtPYg4PnA+vzA/GiM7aXG36xSZTZWVbIMtj0+lyrucyhLsRSop+4zVsHnI3YO/0uNdFhDQ6PY
 VJlfcB8yh/r+eTsmTF4U2Nd38ziqsHmsKvb4z44+TPBUGfpIRaYvORigmFgbzJikBXqd3clxL/x
 6zk57MyZKBdxJVFHq5EFRSgUcsm7sbVmDMgmh7gQC6DKNHHfQhNvFMbGC/aaDLblFP5Id4VvCzP
 lyOnVwC1TITX4nXh2QyO+S3vUacnpDuZfn6TvZwKVFahuWl6rntFfpNonqEYwcdpzKUQPDHtRgQ
 PjQ64Pqx7TBUzz94ZpE0ik+pX6Tc6agaZmb5ALo0C8cesUmUX7ZPD139XuGnur7R+3s6F++lN1c
 FZ7vAmKItl1wuTPNl1Q==
X-Proofpoint-GUID: uSeMBSHjIFP5YuD9T5iqFgUKLA1RRcJw
X-Proofpoint-ORIG-GUID: uSeMBSHjIFP5YuD9T5iqFgUKLA1RRcJw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090195
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102560-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4BE683CFD67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> The Sahara driver currently selects a firmware image table based on the
> attached device, but it does not recognize QDU100 devices that expose the
> protocol on the SAHARA MHI channel. As a result, the host cannot associate
> QDU100 devices with the correct firmware namespace during image transfer.
> 
> Extend the probe-time variant selection to match the SAHARA MHI channel
> and associate it with the QDU100 firmware folder. Add an image_id based
> firmware lookup fallback for cases where an image does not have an explicit
> table entry. This allows required images to be provisioned by the platform
> without requiring device specific client drivers or additional registration
> mechanisms.
> 
> This change only affects devices matched on the SAHARA channel and does not
> change behavior for existing AIC100 and AIC200 devices.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/sahara/sahara.c | 77 ++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 72 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..4ea14c57774f51a778289d7409372a6ab21fea60 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -234,6 +234,36 @@ static const char * const aic200_image_table[] = {
>   	[78] = "qcom/aic200/pvs.bin",
>   };
>   
> +static const char * const qdu100_image_table[] = {
> +	[5] = "qcom/qdu100/uefi.elf",
> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
> +	[16] = "qcom/qdu100/efs1.bin",
> +	[17] = "qcom/qdu100/efs2.bin",
> +	[20] = "qcom/qdu100/efs3.bin",
> +	[23] = "qcom/qdu100/aop.mbn",
> +	[25] = "qcom/qdu100/tz.mbn",
> +	[29] = "qcom/qdu100/zeros_1sector.bin",
> +	[33] = "qcom/qdu100/hypvm.mbn",
> +	[34] = "qcom/qdu100/mdmddr.mbn",
> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
> +	[37] = "qcom/qdu100/multi_image.mbn",
> +	[38] = "qcom/qdu100/xbl_config.elf",
> +	[39] = "qcom/qdu100/abl_userdebug.elf",
> +	[40] = "qcom/qdu100/zeros_1sector.bin",
> +	[41] = "qcom/qdu100/devcfg.mbn",
> +	[42] = "qcom/qdu100/zeros_1sector.bin",
> +	[45] = "qcom/qdu100/tools_l.elf",
> +	[46] = "qcom/qdu100/Quantum.elf",
> +	[47] = "qcom/qdu100/quest.elf",
> +	[48] = "qcom/qdu100/xbl_ramdump.elf",
> +	[49] = "qcom/qdu100/shrm.elf",
> +	[50] = "qcom/qdu100/cpucp.elf",
> +	[51] = "qcom/qdu100/aop_devcfg.mbn",
> +	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
> +	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
> +	[54] = "qcom/qdu100/qupv3fw.elf",
> +};
> +
>   static const struct sahara_variant sahara_variants[] = {
>   	{
>   		.match = "AIC100",
> @@ -250,6 +280,14 @@ static const struct sahara_variant sahara_variants[] = {
>   		.table_size = ARRAY_SIZE(aic200_image_table),
>   		.fw_folder = "aic200",
>   		.non_streaming = false,
> +	},
> +	{
> +		.match = "SAHARA",
> +		.match_is_chan = true,

Theres a half dozen non-QDU100 devices in pci_generic.c which expose 
"SAHARA" channels. Considering those as valid usecases, I don't see this 
mechanism working. Everything non-AIC is now going to be treated as QDU100.

> +		.image_table = qdu100_image_table,
> +		.table_size = ARRAY_SIZE(qdu100_image_table),
> +		.fw_folder = "qdu100",
> +		.non_streaming = false,
>   	}
>   };
>   
> @@ -278,8 +316,21 @@ static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi
>   	return NULL;
>   }
>   
> +static int sahara_request_fw(struct sahara_context *context, const char *path)
> +{
> +	int ret;
> +
> +	ret = firmware_request_nowarn(&context->firmware, path,
> +				      &context->mhi_dev->dev);
> +	if (ret)
> +		dev_dbg(&context->mhi_dev->dev,
> +			"Request for file %s failed %d\n", path, ret);
> +	return ret;
> +}

This is a pointless change. Drop it.

> +
>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>   {
> +	char *fw_path;
>   	int ret;
>   
>   	if (image_id == context->active_image_id)
> @@ -292,8 +343,26 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>   	}
>   
>   	if (image_id >= context->table_size || !context->image_table[image_id]) {
> -		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
> -		return -EINVAL;
> +		if (!context->fw_folder) {
> +			dev_err(&context->mhi_dev->dev,
> +				"Request for unknown image: %u (no fw folder)\n", image_id);
> +			return -EINVAL;
> +		}
> +
> +		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/image_%u.elf",
> +				    context->fw_folder, image_id);
> +		if (!fw_path)
> +			return -ENOMEM;
> +
> +		ret = sahara_request_fw(context, fw_path);
> +		kfree(fw_path);
> +		if (ret) {
> +			dev_err(&context->mhi_dev->dev,
> +				"request for unknown image: %d\n", image_id);
> +			return -EINVAL;
> +		}
> +		context->active_image_id = image_id;
> +		return 0;

I don't see a usecase for this fw path search functionality, and I think 
it breaks the documented firmware loading guidelines.

>   	}
>   
>   	/*
> @@ -301,9 +370,7 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>   	 * Only the device knows. Suppress error messages that could suggest an
>   	 * a problem when we were actually able to continue.
>   	 */
> -	ret = firmware_request_nowarn(&context->firmware,
> -				      context->image_table[image_id],
> -				      &context->mhi_dev->dev);
> +	ret = sahara_request_fw(context, context->image_table[image_id]);
>   	if (ret) {
>   		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
>   			image_id, context->image_table[image_id], ret);
> 


