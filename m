Return-Path: <linux-arm-msm+bounces-111420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wVpyLGLKImrwdgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 15:08:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26665648684
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 15:08:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m9PbrBrK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cZkSNFwg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111420-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111420-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F7173042012
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 13:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5553F4852;
	Fri,  5 Jun 2026 13:07:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895E83F4844
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 13:07:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664827; cv=none; b=YIw+RbRKDJUhwoVSspao5DNOXDNmTGzwlIbpUNRKDLJW7SpuanYwJlpwtLMVG4PgA4B8wyYYoj/7K5i9wERmvSHlMhCeAmr8rDTVWxf2W1zusXtjZXsMkv2F6HW9CDlxIhzOqbZYmpgo/0pqMFYAoX5NykLv4BWucznHpJzikv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664827; c=relaxed/simple;
	bh=BgEnJG2nNkhRJIZJeG8X561rJtevfoUEeD+oPlrNmok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0XOOHgteSSOQfrJGWPNm9Q2gcNBa/NXvHDIm0iJAuaA780b7MHuySgKdFFFREhXgn1q45cV0JA94WgqqfhDhykkg485ZH67zfh2S+Mk5kc5Vxuii3QRaCt6z/sm2uTTdBZp16Oyi5px7WXdEGCc8spCZWj+eHijNhLCUs4FUps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9PbrBrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZkSNFwg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6559UuM6823449
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 13:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TgQxra7IxxwKvFp5QOL3rJaDB0A8hZzWZrioo4dbSg=; b=m9PbrBrKrGeu/52v
	cGHEWwt3NrrI96XeLpIN4EnnsRJmm5zBC/PQIsoehQ+b/dqntOVY8siShvGQoNzM
	GipeUixXIQTHsv5zpWaw0TkL6X411nn+K01POfAhUfiMFHPG16QgYHpvhmGiG2/+
	OD+akoHPREx95uhbjPM1WUTWCsIZEC+b+ViPi7t4ny0vgrP3X2sFn4vlR9Lthgcm
	BzesYet1Y5O7vmgXt4BGBSrw2zyDdWSOmDfiNwO7pE5NVl2PHYJktbroOqaPXCfS
	YGFjP2q7EQUKdNopMuMshWWOYGCLdVd0l2Cx8wbguPa1e1gQCPz0N3H489v0rKPo
	KWfTrw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekncbjaej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 13:07:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso3346752a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 06:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780664825; x=1781269625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7TgQxra7IxxwKvFp5QOL3rJaDB0A8hZzWZrioo4dbSg=;
        b=cZkSNFwgHMdpRJoi6Uj8qlxtToePLCkYeUsrbBHj67o6tn9bz57W2EC6D7bUNqzsdF
         2bgc57+TxoxxROl0kDWCW/baAkSbhmtVzALpNrmB4wbWbLQPgujj+2734Iu2LQXTiXVR
         /8pl0AUDsEPHbMEQbm7IGchsdllFQgIu3PzcEmdnhei5OjU4l7wJVZaB+yhtBSRUvgEa
         t7LQ6bvEBIFG1m3V9s4xDYZXXW2CM2u7RHa9DSk0gx6VHvUtdTPQBhTKqoW5NkOM8rwf
         4bNrnrn5nf7R3VYZKuWk90Fibdgfdnm/OUXpPtT1lsTZp1/pSYQg2ZZvahZkhjZZ/7H+
         38tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780664825; x=1781269625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TgQxra7IxxwKvFp5QOL3rJaDB0A8hZzWZrioo4dbSg=;
        b=dz8TPeTC2qHvREkg3oOSJfuAJxRgtSMPhwhZ4Dn5b5WhFXzhmk0vPneP0v+BcM8lJ+
         YxyKrFdBki2EZ/5C4RA/PCEtuTfP3ewgYfnqN9ZBEN2FFtAcqDoMoZgmQjc6SjsVHXHo
         DoVBIQiivd4APvyi/Luxenz9r1bbRQhi4LlG9OmMHPdWYMG8BPIi8nRzYPh84kmTtEM9
         /rIzdfK1O78519vqD9sgLtzY9zf95fZN+4gGOYfmhkVCJYWbe1T3v9O9m7ZhDPys+VzD
         irdUT2oo8evWIXEldf0IzHnNBPotaYtHlD3iXRYHk9av60wtBDQdPaq/8OYUEGtIF1LV
         z36g==
X-Gm-Message-State: AOJu0YxLXj+6y1dcY0p/xL+hlARpyBJKFvTpSRzLtEDZkNEQAP3ElTFf
	Ag8IRiS8AOvA3FIYdJsWmpZTwceJVUBU8i987sskDoU9bsPEmSDpK/ZMgbJ2lbk3t85S/tyfTiO
	75kjsnSbm9XMQ2DFoFdIDLHzVv41Ct2A06CtrL39tfiXGOzTSN/yUP4HeDJUqg81KJdSI
X-Gm-Gg: Acq92OH6S5OBFTxDJyG8u/qjtyW6uwwBR0L2dYOVcKXpL8da1Z4pfSb/nL7GHpPuiDv
	/JH35KidwBI8C22FfsRRTApVh6+l4ODY+2aeM5IipRjIFP/6025fZWSzifga60+b7Sk+K/da2Y5
	ZDwc00OmD0QQvL8fNrRZX6LdVEJwB6HEXymeT/J/PVO+wMwgheIWi6hhlf8VNm8YCmC1wRsAN2T
	osV++IkmRG9YxI2lIFDBksuPkbk3k1z8v2kVhNxOlqHquyyob1EQrql/MsKdPbVRKbuSb9LMJ36
	hU5WNORnmZdvgfmPwEPUR6ziIUc20ZvkwV0VLyBYmmLhmpK/Qh8GtCwo3gMMYUoMY71zJ9pksqM
	u/TMbEbZ9Q0gEKKu5MuhcxjhwXacj26PZifHqibCjXo982L1+dMGRMNcLyr0156L8dO19BwgrAo
	/Xr0MIirMYTYDbB6/frqLXbu/KfpKUY0x/J5qUUGlUbJ4kH7dG5m8=
X-Received: by 2002:a17:90b:380a:b0:35b:8d89:719b with SMTP id 98e67ed59e1d1-370ee344da3mr3723660a91.1.1780664825199;
        Fri, 05 Jun 2026 06:07:05 -0700 (PDT)
X-Received: by 2002:a17:90b:380a:b0:35b:8d89:719b with SMTP id 98e67ed59e1d1-370ee344da3mr3723615a91.1.1780664824698;
        Fri, 05 Jun 2026 06:07:04 -0700 (PDT)
Received: from [10.190.200.113] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c6748f9sm6311530a91.5.2026.06.05.06.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 06:07:04 -0700 (PDT)
Message-ID: <53c7251f-0984-454c-a9fd-d6712dafc295@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 18:37:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel/cpu: Disallow offlining boot CPU based on config
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OauoyBTY c=1 sm=1 tr=0 ts=6a22c9f9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=W5qrNhqdD0BlkYEQxcQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEyOCBTYWx0ZWRfX8FsMdxbNlnWD
 cwv2RTZ+Isd1bf/LAMJ8A8NLDIdxvBaSisVug2J+C3ERQIZkeRxMtVT8owbOUPTJ3FILtmliRTM
 AhGJ/xV9g6WkL6fMNWfokQTNSSK7ATKQKV6f+GjrodKFhkC+owbbrj4PALugaimty5ouot/LMWa
 dyG+0nHZC7OolkWU7IqVZVest8p5yBSuiY7BuvoCRdAb07gK8ApDhmrQkr4e3wI6tJPoObhcqZU
 i0xlOg10SF5xKtop2/QYa9kof+LgldFz8GXLqM9NP2Uu5dthtg4fZLsD7tXzCt/vA0DeUKvY9T7
 w5ZDkS8D2N02gM4xXQP6xsx4wc7qjkRq+cjm24j0D9PIWhQYi+duS5VOvh/3u+gH5gwXsGGloMr
 P+JveDQD3Okv7WLANaDpqkZdaY581ESrTLgAe3kNp6/57RUnay8ECJ4vn1TzQpO7xKEi5zIRH4B
 AyJhoV296u2L+ahTm5g==
X-Proofpoint-GUID: 4KZz5hQe2csHe2Y-t542hKIM_jUjrMo1
X-Proofpoint-ORIG-GUID: 4KZz5hQe2csHe2Y-t542hKIM_jUjrMo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111420-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:tglx@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:peterz@infradead.org,m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26665648684

On 6/5/2026 4:00 PM, Sneh Mankad wrote:
> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
> retained.
> The hardware design on these SoCs forces a constraint to suspend and
> resume the system on boot CPU / CPU0.
> 
> If CPU0 is already offline before starting suspend to ram the
> freeze_secondary_cpus() picks alternate CPU as primary / last CPU and
> proceed further to invoke PSCI SYSTEM_SUSPEND.
> This leads to a system crash.
> 
> In order to prevent such an issue introduce PM_SLEEP_SMP_CPU_ZERO_STRICT
> config and when enabled prohibit the CPU0 to be offline.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  kernel/cpu.c         | 4 ++++
>  kernel/power/Kconfig | 8 ++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index bc4f7a9ba64e62d76fbb2b362f243c918defe5bc..1c878db1d9cb6df0e31cb55343851aab4e38a3a0 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1478,6 +1478,10 @@ static int cpu_down_maps_locked(unsigned int cpu, enum cpuhp_state target)
>  	 */
>  	if (cpu_hotplug_offline_disabled)
>  		return -EOPNOTSUPP;
> +#ifdef CONFIG_PM_SLEEP_SMP_CPU_ZERO_STRICT
> +	if (cpu == get_boot_cpu_id())
> +		return -EPERM;

Should return -ENOTSUPP ?

> +#endif
>  	if (cpu_hotplug_disabled)
>  		return -EBUSY;
>  	return _cpu_down(cpu, 0, target);
> diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> index 05337f437cca29da57864583166d7f9abd526507..0b342b3a4a5650a1927dc4805d1515e1d9e067c6 100644
> --- a/kernel/power/Kconfig
> +++ b/kernel/power/Kconfig
> @@ -401,3 +401,11 @@ config ENERGY_MODEL
>  	  The exact usage of the energy model is subsystem-dependent.
>  
>  	  If in doubt, say N.
> +
> +config PM_SLEEP_SMP_CPU_ZERO_STRICT
> +	bool "Disallow boot CPU (CPU0) offline"
> +	depends on HOTPLUG_CPU
> +	depends on SUSPEND
> +	help
> +	  Disallow boot CPU (CPU0) offline when the suspend_ops->enter()
> +	  has to be executed by boot CPU.
> 
> ---
> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
> change-id: 20260603-disable_boot_cpu_offline-eb4f55ac96f2
> 
> Best regards,


