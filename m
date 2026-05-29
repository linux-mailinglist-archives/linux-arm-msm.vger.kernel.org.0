Return-Path: <linux-arm-msm+bounces-110252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI0KMB9vGWqEwggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:49:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A69E601114
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D0BB3114848
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88ABE3CD8C1;
	Fri, 29 May 2026 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0ab7liH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYZFlikT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5A3CFF6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050967; cv=none; b=KuNWheb47SH9IsrUe7e2Azb2lTu6w8A/jS0+E/838uGFx+EWH0dkZenTioF4vbY10oyLbGB319N+LUD0k32Mq29oYiaTd6NR3V0vFXiU/Vg5bq7Fz0sOnJ9i+ABembXI747YQK3H616UOtdtfcj8hYDikhwoU1OGqc5paxtktAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050967; c=relaxed/simple;
	bh=+9rpX/DFxVHZeYFPP3+WLKNg/YmvRkw2TGkdsj27Rfw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=S44tNJ+g2Z45BzQroBQldZbCgYjuRGuLCLyatW5eMtVPRDb4heoUQd7sdYhfIn1Cdo54nwkKnp3v+puKi6kJ0HFSvt1aQZfOgmULWty9Fv4glyAq4Y4Kc4I8EbjBB5ixxDwbAWBUI4zYE3TA0FDS9+CWLBgmNgRCe38XZX1XTI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0ab7liH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYZFlikT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T74xrR1829455
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRJVV/3vf2KXL9Zksz8u3vSgFjyxnFTSi1sl5HNmlWw=; b=U0ab7liHAi9gYGXR
	RyeT+fGAHqfIMsBw02GGTcKmMq/z9F3srBjZWLriOkJa680ZOeoUjmX3zOgnvYw2
	/35nMySicYQSUFTKjESEpuEtdmEwsS/pByqNGrBOb4SVcAI1QSzHU4zxzWW7k4hG
	afN8M6k6Ep+LQPafKe9AGfG7nMNxMvRgg5LQKqqvEXd/JVGnmTYKchh1w432vno2
	jWZrGOECH08xK8BDyHDnvKYkv6BbogDVnO8jWyXsUt+4R3S/Edkuk1yQWItYWUrt
	8wVDkW+w9k7r5fQinotWoBrUH//+I98+KUttnpcS6OW6TTuS/sgpXiDT/7WitAJD
	xSa12Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m2uss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:36:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3692f395339so14120088a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 03:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780050959; x=1780655759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRJVV/3vf2KXL9Zksz8u3vSgFjyxnFTSi1sl5HNmlWw=;
        b=AYZFlikT8EqrfN9EpXfxrocePMp4NsmqOkV+CAamrhvmVrNNrvlBKHmbsbVgw7P7AR
         34sQybl0UrD9n8cb06zvDPIumcVyD1lGhfVvwqdq677q/eh4eM45K6ukRixnbb6+3lPz
         KRdpplntnVxvAsSC+7YTxx96oBClcOELcBWhWW8KO/74hAKBWnD8LUH1FFuxA3/qHHL9
         4Px90sXuAijU+RA/4LROIZcj8UD8ipGJj8UhkSee7qzyWcOUudfvTYGcpTCHIHe6mep4
         q1BQjTeHpgWE4neqHk+hRTqAFefhkhMDPUScMZvd1g6MSBG0Mx6VbpuaVP9WSiQtGjXw
         WOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050959; x=1780655759;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRJVV/3vf2KXL9Zksz8u3vSgFjyxnFTSi1sl5HNmlWw=;
        b=UiVWrNzFlCUKQ29yn/Vbc8Zyfd5QYp3yvrlmQu9NWSdnvLJq+uoIW9zONK0LecNr1p
         egfkgW481LaUGP2npyIF56R7EdEgzGskNzuxe/uulgCfBrWO/lfuCL2wrFb055tL/dNh
         Ez9l+bVDESdUM1QyG+j6quCwcyLiv4U89ek132bvI30BEN9v8vPKfH7vhlAe/AVPXotB
         cTONKuAkaNABRwqtzLoaVKp/0aHwZZK6nAtn8D9nGtFO5KX1xdgQU1+lZyb3sPRZ/3Ue
         OoBt5rJDwnGvu9+7S8LznY9MJKHfrblYpZWPq2UwFJdQDcVBxcOz2SJhN2COE/mVnikp
         J3yA==
X-Forwarded-Encrypted: i=1; AFNElJ9H5HBsvb6GM28j8TBOaxDV+C5As0+HQ22+gMHbgVL2Ad7TmtEp6Ly1hies9m4h13iDBwlK+Yif1nHbbhyd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0flEtGflg7JfT+EBd3W+kzdcHF4i1sQUiVP7Bbox4IF1MZlPc
	00DXNFGG5Rnd0KY3QHzvUPGWl8Jz9sourDA1TCdoSrTW2/IVgwffNt/WSiLEkodWOrGkj3aqnA+
	wBhrHySFosEZ/O5W/dJ4dFBO0tpts8OK7u98J/P2NAj6xDfFnFNk3N5erjbijnG696Unla56Xqa
	j0
X-Gm-Gg: Acq92OFZHkUrNi6jbZrQphK5EQfLu7gIBPgfyNfljoHhhwUnT3wqzc/xInhDOIL34OJ
	U6icRaKKp+0o2Ts0343zJPTj6jvW0bMTagkCSeWZRhWJinUtp4JQ1eqZwpnG/Sp8LfsbTK4dGnB
	cZpbUEhf+5wBREsb6QH8AoWKT6rCgiGPmJQVoe1TpkJwG1yCoSzDijzYE41CWwlDP6m3n8GjKi1
	f7XdmyniIWOjln+3iewHQBNGOfECSEgcBqVQOo7y2xDAwCT1jIAyLon61AWcx8wzX1FLJ42PBDZ
	OgoKXR8smsN2BS0RlMwhzIFP1kGD7PEPPNqTALiAu+DCDGgFzS23VTHLy53gpHS8IgqeY3kXcop
	y1ZYdk0r9jCfyH76wbj3Pqh44v1OyDMgdRPPDddpqjuElRAv82hV0k39IeGpP
X-Received: by 2002:a05:6a20:9e0f:b0:3a3:171f:6aff with SMTP id adf61e73a8af0-3b41208495cmr2710160637.2.1780050958861;
        Fri, 29 May 2026 03:35:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:9e0f:b0:3a3:171f:6aff with SMTP id adf61e73a8af0-3b41208495cmr2710126637.2.1780050958362;
        Fri, 29 May 2026 03:35:58 -0700 (PDT)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8577299738sm1296707a12.18.2026.05.29.03.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:35:58 -0700 (PDT)
Subject: Re: [PATCH RESEND v4] mmc: Avoid reprogram all keys to Inline Crypto
 Engine for MMC runtime suspend resume
To: Jie Gan <jie.gan@oss.qualcomm.com>, ebiggers@kernel.org,
        ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260529092612.1749752-1-neeraj.soni@oss.qualcomm.com>
 <e9cdf8dc-40ea-49f2-a655-b99ed0707a8c@oss.qualcomm.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <66caaafd-cea4-b624-57a1-f2cd04d109b9@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:05:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <e9cdf8dc-40ea-49f2-a655-b99ed0707a8c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwNCBTYWx0ZWRfXy7CVNuQQLej0
 Ee+GCOWXPpcn8c5PhDmTFCkOKRnItEUJFmUVGzMEF2wVM1QqnHD+wKwEEuXlzJctACjYia5XHLN
 Xxup51iHA+ctMGAMSbopbQ9zfMWaiaYGPqLyVYiAQynhHsSmB2VUh8sZN0k9I7TAvS2BQ7uSPq4
 HCXndTTYVACdL6Zoi9THZQQrbjfnAqE24UxRHk9KAsf9jmojXQ+08RS4qwAYFDlfmO/zS7VVfSq
 sHrgOBeMeyDy5ggIJzZLBgpUrvYQk/2MKCe/qEoE181qtFRxl9APQBa+SFZ6Jfv0MGl89+XrMTV
 jqNaStONOgySwgH6XmSO3VvOFCZxLS4JfNhrTfrJ6B+I5eR/ZRaRGo8+IiIO8TvGdavvA/ldou1
 XvUcSLNgeG6gFoT8/lsm5EirVXh+ENsC4+9telzwAHqZSLtSHigQBoJ7rM1GDGFaF+IIZ3dHwHn
 28bRNaYaWdrOMijlHVg==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a196c10 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=W7MggzNdEW2vEdTu41UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ux3pVKfTx9Zlw_sPZ9ZD9euLplEOnhVR
X-Proofpoint-ORIG-GUID: ux3pVKfTx9Zlw_sPZ9ZD9euLplEOnhVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110252-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A69E601114
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/29/2026 3:49 PM, Jie Gan wrote:
> 
> 
> On 5/29/2026 5:26 PM, Neeraj Soni wrote:
>> From: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>>
>> Crypto reprogram all keys is called for each MMC runtime
>> suspend/resume in current upstream design. If this is implemented
>> as a non-interruptible call to TEE for security, the cpu core is
>> blocked for execution while this call executes although the crypto
>> engine already has the keys. For example, glitches in audio/video
>> streaming applications have been observed due to this. Add the flag
>> MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control reprogramming
>> keys to crypto engine for socs which dont require this feature.
>>
>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
>> Link: https://lore.kernel.org/r/20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>> ---
>>   drivers/mmc/core/crypto.c    | 2 +-
>>   drivers/mmc/host/sdhci-msm.c | 6 ++++++
>>   include/linux/mmc/host.h     | 5 +----
>>   3 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
>> index fec4fbf16a5b..a5a90bfc634e 100644
>> --- a/drivers/mmc/core/crypto.c
>> +++ b/drivers/mmc/core/crypto.c
>> @@ -15,7 +15,7 @@
>>   void mmc_crypto_set_initial_state(struct mmc_host *host)
>>   {
>>       /* Reset might clear all keys, so reprogram all the keys. */
>> -    if (host->caps2 & MMC_CAP2_CRYPTO)
>> +    if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
>>           blk_crypto_reprogram_all_keys(&host->crypto_profile);
>>   }
>>   diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 4e5edbf2fc9b..2ccb63dde9c1 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -1949,6 +1949,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>       }
>>         mmc->caps2 |= MMC_CAP2_CRYPTO;
>> +    mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
>>       return 0;
>>   }
>>   @@ -2526,6 +2527,11 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>>       usleep_range(200, 210);
>>       reset_control_put(reset);
>>   +#ifdef CONFIG_MMC_CRYPTO
>> +    if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
> 
> Always false at this point. The first set of the host->mmc->caps2 is later in the sdhci_msm_cqe_add_host.
> 
Yes for cold boot this is true and Crypto reprogram is not needed. This patch addreses the use cases like
runtime suspend resume, deep sleep / Quick boot (DS/QB) and suspend to disk (aka hibernation) use cases
where the runtime context is preserved either in dynamic memory (DS/QB) or in secondry memory (hibernation).
This is tested internally on SAR1250P chipset for hibernation and DS/QB.
 
> Thanks,
> Jie
> 
>> +        blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
>> +#endif
>> +
>>       return ret;
>>   }
>>   diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
>> index e0e2c265e5d1..2fd76f966e24 100644
>> --- a/include/linux/mmc/host.h
>> +++ b/include/linux/mmc/host.h
>> @@ -457,12 +457,9 @@ struct mmc_host {
>>   #define MMC_CAP2_CQE_DCMD    (1 << 24)    /* CQE can issue a direct command */
>>   #define MMC_CAP2_AVOID_3_3V    (1 << 25)    /* Host must negotiate down from 3.3V */
>>   #define MMC_CAP2_MERGE_CAPABLE    (1 << 26)    /* Host can merge a segment over the segment size */
>> -#ifdef CONFIG_MMC_CRYPTO
>>   #define MMC_CAP2_CRYPTO        (1 << 27)    /* Host supports inline encryption */
>> -#else
>> -#define MMC_CAP2_CRYPTO        0
>> -#endif
>>   #define MMC_CAP2_ALT_GPT_TEGRA    (1 << 28)    /* Host with eMMC that has GPT entry at a non-standard location */
>> +#define MMC_CAP2_CRYPTO_NO_REPROG (1 << 29)    /* Host handles inline crypto key reprogramming */
>>         bool            uhs2_sd_tran;    /* UHS-II flag for SD_TRAN state */
>>       bool            uhs2_app_cmd;    /* UHS-II flag for APP command */
> 

Regards
Neeraj

