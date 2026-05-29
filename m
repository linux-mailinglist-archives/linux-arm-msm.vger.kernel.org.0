Return-Path: <linux-arm-msm+bounces-110248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDm/DpRpGWrGwQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:25:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A96A5600C4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B7D23167890
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A8E363095;
	Fri, 29 May 2026 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxQbYGoB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OyXl/ZdG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2995A348C48
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049968; cv=none; b=JVDqbCAs6KG+w76CTdpBUilzO9P8Itct2Q7E9cG0kxGy2C4UKa8btBPKgXCOtb4MEiHU2WvWiNL5R+aTuZ7+BVZ3Q1OuWTSzyD3Dah3Ermms1DcL+9PwC6FC1f6/bzHsv1e0492DXfLTU36wBW0biMeOYalMC/oUkS1piTNk9ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049968; c=relaxed/simple;
	bh=6KKnIYJJVCj8nV2etPjUel7tCqrSD33dBAHj0hh3Pwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjKqqX8YpcbO4BCWDqdaoiUG7y4ZDDhwHCEiA4D4oPZpQPVdNAbNKo2zH8o17Wyhw80XTgL3JnXrcmU8XDChrlQXM6rfP+cs+kU1okpRQK7wKZzq0aFfVwyqHj13/G2b4CSn6c8yqWpGLRDJZ3AjvDDPA8yWUQ19Sfu+DO/3Oz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VxQbYGoB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OyXl/ZdG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6Rg2A3252762
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M/Skb4l/nACf04TKh2rNhCpVjz/iy4wjGxm1q8IUBCs=; b=VxQbYGoBbsNdzfnV
	uXfmEGVBThJ0Dpqf1ZT0jXtvHO7CwiyZ+8TAGR+MbQXZdyNFXP5/Ehk5jyl188dE
	UOeNwV9WMZ3lxMBj3mvbT1yV8PkVgB+Of86VIjsJRc/LzJ7wbEGQpt8tkK5FSqSo
	OUksFcFNXz4FFXiRSMLfBREgaYSEM2nAxDzbMD5o/BA9lL2ETPHJDNazC8Ms/6bY
	b0MaNktl1aXWY80N88x3tp3dWCRiwNJd5wtbydg2NHPb60LasdyZf8TIPwKzR6jS
	mjaJYA7M3r/qK7rvSAuX4QgPhhWvka4PAIaXqFzUW7+JN1FHXDorRizIhPYan3dr
	bKYmxw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eespn3yuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:19:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso8184864b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 03:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780049966; x=1780654766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/Skb4l/nACf04TKh2rNhCpVjz/iy4wjGxm1q8IUBCs=;
        b=OyXl/ZdGeyzP9ZbKxgk0in/vjErQTILn+p2e4n0SjZkH70aXzlRycVESM6kpwIu/az
         W4PHlXNVTuQr7UXa30m44yu9kAOXo0RKNlk33SZGULbFfKsBY2vPRsfgEKk2RpOBqK6x
         4IEMmXzWE037LSIlRPdVABdZQHzotIWM82KPh2xExl26WAVuuLVvzkkTdCrOmoiwJuAt
         xqA4v/7lJMpzSL88PB9vpZGmUjV7/CVSuaFopjuUHRe9iBnakf3EXEtswzihtazyERkt
         VAausOXZQaM23QrskpDZ4gyN8VypGAhPoqPntNJd+5cArKuYgiwOxP7H1gnvGyACBn46
         faMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049966; x=1780654766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/Skb4l/nACf04TKh2rNhCpVjz/iy4wjGxm1q8IUBCs=;
        b=EjOT5lGHXqgWGKRRJ78UuONVR5cAl0sCXs7zwEVkRG5OL5obnxJq2gUdRnv1e+nvjb
         Flq/1BrFV/1jV5zwfcBfCO8ApqeWqcObqDK021h5TMrgISzarUjbFJFVzwJlM5qZ4Nw0
         JMe++yZiVqipk5NFGvLfTKMw1TXZ0f1wd2bcY7g38U0008d03i14zq65rtymPyxMgrPE
         umeKqBhpXjqwplEywwLfqtIxojXYQMY+FkD2zu0GKUyRJGKEaVeJjmzqm3kMuFX8WnHk
         oKep7vg01hseWP/DK9J0uNw/4n11oRI9dNeUf5r6DMSCxYw14MY4yVkeJ8FQgBc4drZk
         yT/w==
X-Forwarded-Encrypted: i=1; AFNElJ9YR6cbIhN7emeoBfhiMcAqk8eVYZH5ul1f+7lsVF4FC5S+0k/zNhYhOc10P8kczTiffQVpjW5rD5ImpeXz@vger.kernel.org
X-Gm-Message-State: AOJu0YzbONIX6zajdlYpJpHtnr/lIXZg3zhb3Yj9tIy77vrvh92eTc50
	AhUWiT1h1+b0839yWurSl4DADC0M6u5tb4+CgCYdcXHVi7J94c9QYDT39HIS2tG29wQvOww29hS
	MHF6jz84xnXO7YkJ/91Ka8WvJkS4hlRvnn2jdouNkERpk4mMfGjUcKVYmlk6aA/sFY54z
X-Gm-Gg: Acq92OGf6vE9nXsIMmnSF5erl5gpWclZ2fXbrOPBM85z1z3ryVGxDTHrr+JufCQ3y9f
	u2L4mo/X1bt/CZ3KwDyWARddEbD+xq89RlG2buATUfEmiboVnn9l8p4XyFavdxSZdgBWCfDSUJN
	Z/3UC8grgh0fSMKrogW56/9iPwCTOu/BOeFB7cP06HnHWIXtDbMMdNGPYi/u4dHcbUcN6wFXZNo
	7femqovsyW2F+ikQwtVbKTp/eD4+m4mBWvlSOZEoimOlBfy8imXx+oMAADYKHBdI7SE4y+Z3pYe
	gA2ZCwAWPzgPIww0DZJY+SmgnHHr0XvafNRp2Id7g8QIRFWOX3BbHhKsXuc1W0mynRx3zCy7jW2
	ERx5lGH7+2g/qPSiRboISciwd76utjB1d7qcICe0b9TNpF+rpouPAY+m9s8XGDLZL8wvSUflce6
	Qw6f4g1WfK5gqENycSiDvrOg==
X-Received: by 2002:a05:6a00:22d3:b0:83e:3050:d0b with SMTP id d2e1a72fcca58-84212ca312bmr2505131b3a.1.1780049965544;
        Fri, 29 May 2026 03:19:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d3:b0:83e:3050:d0b with SMTP id d2e1a72fcca58-84212ca312bmr2505104b3a.1.1780049965016;
        Fri, 29 May 2026 03:19:25 -0700 (PDT)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214d018fcsm1373595b3a.60.2026.05.29.03.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:19:24 -0700 (PDT)
Message-ID: <e9cdf8dc-40ea-49f2-a655-b99ed0707a8c@oss.qualcomm.com>
Date: Fri, 29 May 2026 18:19:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4] mmc: Avoid reprogram all keys to Inline Crypto
 Engine for MMC runtime suspend resume
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, ebiggers@kernel.org,
        ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260529092612.1749752-1-neeraj.soni@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260529092612.1749752-1-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uwh8McANk9LBvoZddylMuFiLxw7LabVT
X-Proofpoint-ORIG-GUID: uwh8McANk9LBvoZddylMuFiLxw7LabVT
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a19682e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=K10AMJlnD9AZVQnTPLIA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwMiBTYWx0ZWRfX7+qiL2HvH8Ky
 E8p2Hd8MK3x7/Es1q0FkMxc1OeIzLVLEHQMcbSnHPnpnCY+0viMZKt5w30lFN6pm+3gKe6LRj8a
 eabqramCUckziP30iou6r/kNxl0pEt/Sq6zgnwJczJ+6/SAJfMhcoVBw5i6uNLhPu0PNd94kzSs
 thaL2ATtud8M2CnaKMLF7diXxnee5yfVJknVa/k0xPwByUXEE3Uu+MpvncV21YMyX8/lb2tPFOB
 6N3rEk4XYq7dGxzuZmszDrv5h4uWTDfUQhZI2tx+7NltDJVposeL3a17F2I8q9Oy9okwwsNXCu0
 c5TLXkzKRZtvD8MRi29IahR++CZDS+ueCQmrm5mj5egcBbOEKJbSo13HT2zXtHIGMEK4aC35dPO
 T7QpS9LynEqmHLrVF9qfZtZ88xFN85tUZcZHbiBk2JUe1mZ01RE3xQD1i+AAF2kz0whWp7S96Ls
 HcjeAXmSj+VtgV9hsOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110248-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim,intel.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A96A5600C4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/29/2026 5:26 PM, Neeraj Soni wrote:
> From: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
> 
> Crypto reprogram all keys is called for each MMC runtime
> suspend/resume in current upstream design. If this is implemented
> as a non-interruptible call to TEE for security, the cpu core is
> blocked for execution while this call executes although the crypto
> engine already has the keys. For example, glitches in audio/video
> streaming applications have been observed due to this. Add the flag
> MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control reprogramming
> keys to crypto engine for socs which dont require this feature.
> 
> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Link: https://lore.kernel.org/r/20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> ---
>   drivers/mmc/core/crypto.c    | 2 +-
>   drivers/mmc/host/sdhci-msm.c | 6 ++++++
>   include/linux/mmc/host.h     | 5 +----
>   3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
> index fec4fbf16a5b..a5a90bfc634e 100644
> --- a/drivers/mmc/core/crypto.c
> +++ b/drivers/mmc/core/crypto.c
> @@ -15,7 +15,7 @@
>   void mmc_crypto_set_initial_state(struct mmc_host *host)
>   {
>   	/* Reset might clear all keys, so reprogram all the keys. */
> -	if (host->caps2 & MMC_CAP2_CRYPTO)
> +	if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
>   		blk_crypto_reprogram_all_keys(&host->crypto_profile);
>   }
>   
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4e5edbf2fc9b..2ccb63dde9c1 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1949,6 +1949,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>   	}
>   
>   	mmc->caps2 |= MMC_CAP2_CRYPTO;
> +	mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
>   	return 0;
>   }
>   
> @@ -2526,6 +2527,11 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>   	usleep_range(200, 210);
>   	reset_control_put(reset);
>   
> +#ifdef CONFIG_MMC_CRYPTO
> +	if (host->mmc->caps2 & MMC_CAP2_CRYPTO)

Always false at this point. The first set of the host->mmc->caps2 is 
later in the sdhci_msm_cqe_add_host.

Thanks,
Jie

> +		blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
> +#endif
> +
>   	return ret;
>   }
>   
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index e0e2c265e5d1..2fd76f966e24 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -457,12 +457,9 @@ struct mmc_host {
>   #define MMC_CAP2_CQE_DCMD	(1 << 24)	/* CQE can issue a direct command */
>   #define MMC_CAP2_AVOID_3_3V	(1 << 25)	/* Host must negotiate down from 3.3V */
>   #define MMC_CAP2_MERGE_CAPABLE	(1 << 26)	/* Host can merge a segment over the segment size */
> -#ifdef CONFIG_MMC_CRYPTO
>   #define MMC_CAP2_CRYPTO		(1 << 27)	/* Host supports inline encryption */
> -#else
> -#define MMC_CAP2_CRYPTO		0
> -#endif
>   #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
> +#define MMC_CAP2_CRYPTO_NO_REPROG (1 << 29)	/* Host handles inline crypto key reprogramming */
>   
>   	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
>   	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */


