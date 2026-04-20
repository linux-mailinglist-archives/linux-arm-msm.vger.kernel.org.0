Return-Path: <linux-arm-msm+bounces-103775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMdiOsI85mnPtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:48:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA3842D7AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73AA23193927
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6326442EEBD;
	Mon, 20 Apr 2026 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqFmSSkN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3Sm3zS8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF8242E00E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 13:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691781; cv=none; b=OjrEHkyr3rM/yaZdg1s4P/PsHNQdd3f6thW6INGog2HWnybS89Mw5u56ezvahw2pmNizoXyDMb5wDzBSuQDaA2FyWPioGO88gpqo1Yufkw7wZMzIE+R2m7JtkRNaLqq2EczgfBbqZg8o8NL1vARSTKs/PonfgtxDy93A8RQ8v6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691781; c=relaxed/simple;
	bh=ahYXe82LNB/jI5V6o4BD6wPx/eb+NdBlno0wL2x2glk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEjIHnjIEuec9tx1ALqmJSgD1nItb1EbJZZ9lKa64xyO4R2dgDAPR8g44+uZzaVkHsOhaVQvgZbXaB6MFXAL0r+R0SaZejVL19qtILasO8Eqc3YbGRIDscWj6U5H94hKuhzzv2bQLZGXQGvMusYmZaqIh/0Cdrzet54Qs8giCAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqFmSSkN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3Sm3zS8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9J5Rt785558
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 13:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fO6Bv48GlQW/gZ/cujzOgLlpdMteDsrc0v7DT/6Qj+Q=; b=eqFmSSkNLdnqkFvo
	aVaADt1cwOCjtltureMzK+4Bwx0NCa1vP4tnB4xxDm3DJXoGbSiMia9wMTt9+JSF
	Ou5VYJfNCmI63gRZHzNUfiIrmKsuqVuuq07GwcHfAKX/I3sJ8/L3f11M5f+TbK0S
	j/TdN7eRiG8IyUUGX4Li/cKuV6YH/bsmjxA0n8MCFd2oBFD8MYOTPdOy/GiGzFG1
	5EodhUF6iUV64YaSP0rBmgckn9pV+++obLZXURolL/j8eUV++n3De8iy6NN12+KP
	i78sEuVhZzJ7GQJq8UO9AW4uf0ucFwMfeswQK74Ab9pjawyGqrVe5OcA9Fm0S+sq
	IIEAfA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhdhgtww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 13:29:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9e67f6dcso6165985a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776691778; x=1777296578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fO6Bv48GlQW/gZ/cujzOgLlpdMteDsrc0v7DT/6Qj+Q=;
        b=T3Sm3zS8JZwE0XoQBVkVomoE+KuqBX+EC74UBFQVKYbqp74brizWfukvxlrSGkli+K
         Jd/gCDWoCtNQjxotomsBrHmo1Zikb2SQMVtrUa+ffBYGbbLMtabyWuycOMGGI5NuBoXK
         Iu0FodM9mHxMNVw4mj+RbxLDrebhl8Te1ahvjyrQXd6umEPivLwn0kanWUy8NQljniCv
         cgFIwJI3dCoH6xLeKpM6fny10UNs5j4eVnBO/AX5q17mNleJkhx6quIYl0hH4qCICcBA
         /7vkgttHe3m0pwLi50plwnyZGw5OKiPiDJA6FLJi52Wlupr/0fFqxJ2Uo5Mb3v4bZ8ws
         PaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776691778; x=1777296578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fO6Bv48GlQW/gZ/cujzOgLlpdMteDsrc0v7DT/6Qj+Q=;
        b=rso3qvvIPh6d9lUMDEQDlSFRwBXzWnhGOKmKzxr8DoRy7OIB7ri0Y+/SwUc7XZ7IGy
         qj2dsuS73E3oFbxNDzF38nsBXjoL538F/YAIZEJDJxObLCVyry7ULoZf9BfCipsM30ac
         T5Dzfu2zH+cUFOObmcQ0nsrNQ1Y6BKbWjprIbcGkfYX7sAlCcoqS7vLbk36HC5O08ugg
         6/WASM7fhzQvcUJ3pAAf7ZJun6ccka7wmdZbhZNTQsv2S62E80SOqE/MxsaaC1dqchej
         yJOT6ABBT73uvBBBok9OD7VHyh3HiPkOVFDfvkx4Nw3X8XQ3/lVA6I/6fXSktUE7Kkvr
         Yi/A==
X-Forwarded-Encrypted: i=1; AFNElJ/KPL4u+vhLM7S/V0xj7IqeaT5Sr/+cet/dECp4Rc9g3B3LHYcvjLlrhIJPk2hz0flliNh5VOsavNNyYEli@vger.kernel.org
X-Gm-Message-State: AOJu0YzyUQoAkH7Km3joaugrsO9N16PSgpcAtPMFdcQSOFwXhv+hNSv8
	esf6xKoWKarYEgaava7nE3FNh5ztzgKFXtJMd7XqO9bOQCnOmRtrCExtmrvi0zWwrtCaG9VcPUq
	IK8OPXNzG5UyhvHyY52mOtgCMM/0DU63ST7eS0I4vY73qpLb3P33J2DFbOUw/cSxKszz6
X-Gm-Gg: AeBDievrjeD5UZId5RPuCfmQUYwfCEc+hiJvrQYixMQYlfBEVbvoihpuhKiYoXO9Bvv
	NmgnEzL49b75mSW7cRh0U2JJRyFbEZ+4Smltp6rDctAWOBOhrSC0gRVfXr7eqqQoxQIcXpfHMaG
	9HckEfqIAAXgmNtD3M9Ven8rbAajL/PeB9YJtmK0w5TrpvjU+rnLfj/cfVR1QWtzrAuHukNURsR
	JB+Mdj1QNbLsFRc4axO6mrz6MqBGOOv/0Ifx17oXnAFp4pPEKCYd1DlQlJvmnh5LkBcM12kGY3a
	ihkROec1qE0hi+BRRVx2C0HfaUskBiW0GvC1z56pd+JQoFNofeU2fkO454eTp2RtUfwl3ehjAXF
	oBfs21WZNQEU1xYipiPfqKM39fKUDA1rD+zwTcoVLGnK+pGNWjUFJPX4VPrLpasp+pft95BcmIM
	2Fv0SOuVlUyTZNYENyGMOI
X-Received: by 2002:a17:90b:1642:b0:35f:b107:f1ae with SMTP id 98e67ed59e1d1-361403adbcfmr13890629a91.4.1776691777595;
        Mon, 20 Apr 2026 06:29:37 -0700 (PDT)
X-Received: by 2002:a17:90b:1642:b0:35f:b107:f1ae with SMTP id 98e67ed59e1d1-361403adbcfmr13890573a91.4.1776691777015;
        Mon, 20 Apr 2026 06:29:37 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fe07c7sm10502749a91.5.2026.04.20.06.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 06:29:36 -0700 (PDT)
Message-ID: <488faf07-3d22-49f5-af7c-cd27d9bc87ec@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:29:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 7/7] qcom-tgu: Add reset node to initialize
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <20260417073336.2712426-8-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260417073336.2712426-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ly63Rfl7p5uz2JuugNISv1_hwZOymxrC
X-Authority-Analysis: v=2.4 cv=IMgyzAvG c=1 sm=1 tr=0 ts=69e62a42 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XEOHbNyQ1_GqabX02WAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Ly63Rfl7p5uz2JuugNISv1_hwZOymxrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEzMSBTYWx0ZWRfX5Nq9A/KBzWeZ
 apZEIRXUHslZFHqj7CrLhwEDM9QmPhHYULJyzYtcxXTr9TlCx8eC0fduFSfK8hHU2iQpChHM4Wj
 QURdXJ8ocorXJM/W1r/igt412eRyLfbewLY6y7lJ5c0qzTUpllkPXiG6LyeEkwMRp6hOtGCWMW0
 WLJXB3FfNmlF+otrIjRK7EYnp+akapTm59rwFLoJx74mCRyCT6+uN7UEvd1tvDd/kyMRsGzmeSq
 EUU3BJEkgfXP3kfKkxZafGhCwPLxip4oVWYoMR6HRWCLACRFfTpqSUcQQLVn1h/UphfsBxE94xi
 DSly0kpPq7ORdVfG9QBCMDmNLnjtSkpziZrXXwXPSmOJC95iM/8tZjz7YswUwzxihH/OR9M3uTH
 Bh6ALZOkpp3gwrwDthBT3rXhVd31ok+tZeZHkR0g8ays5utFAtC/xtzm62E10BeJH3U6dfofumJ
 5EFvAKRKNB3jjwJt/uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200131
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103775-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BA3842D7AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/2026 3:33 PM, Songwei Chai wrote:
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes.
> 

LGTM.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>   drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
>   2 files changed, 81 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 7a3573e03e27..a6b6019c8ef1 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -42,3 +42,10 @@ KernelVersion:	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the counter value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(Write) Write 1 to reset the dataset for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 6d5bf2621cb0..9fb51f2a912f 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -420,8 +420,82 @@ static ssize_t enable_tgu_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(enable_tgu);
>   
> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
> +static ssize_t reset_tgu_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct value_table *vt = drvdata->value_table;
> +	u32 *cond_decode = drvdata->value_table->condition_decode;
> +	unsigned long value;
> +	int i, j, ret;
> +
> +	if (kstrtoul(buf, 0, &value) || value != 1)
> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->lock);
> +	if (!drvdata->enabled) {
> +		spin_unlock(&drvdata->lock);
> +		ret = pm_runtime_resume_and_get(drvdata->dev);
> +		if (ret)
> +			return ret;
> +		spin_lock(&drvdata->lock);
> +	}
> +
> +	tgu_do_disable(drvdata);
> +
> +	if (vt->priority) {
> +		size_t size = MAX_PRIORITY * drvdata->num_step *
> +				drvdata->num_reg * sizeof(unsigned int);
> +		memset(vt->priority, 0, size);
> +	}
> +
> +	if (vt->condition_decode) {
> +		size_t size = drvdata->num_condition_decode *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_decode, 0, size);
> +	}
> +
> +	/* Initialize all condition registers to NOT(value=0x1000000) */
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_decode; j++) {
> +			cond_decode[calculate_array_location(drvdata, i,
> +			TGU_CONDITION_DECODE, j)] = 0x1000000;
> +		}
> +	}
> +
> +	if (vt->condition_select) {
> +		size_t size = drvdata->num_condition_select *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_select, 0, size);
> +	}
> +
> +	if (vt->timer) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_timer) *
> +				sizeof(unsigned int);
> +		memset(vt->timer, 0, size);
> +	}
> +
> +	if (vt->counter) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_counter) *
> +			      sizeof(unsigned int);
> +		memset(vt->counter, 0, size);
> +	}
> +
> +	spin_unlock(&drvdata->lock);
> +
> +	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
> +
> +	pm_runtime_put(drvdata->dev);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_WO(reset_tgu);
> +
>   static struct attribute *tgu_common_attrs[] = {
>   	&dev_attr_enable_tgu.attr,
> +	&dev_attr_reset_tgu.attr,
>   	NULL,
>   };
>   


