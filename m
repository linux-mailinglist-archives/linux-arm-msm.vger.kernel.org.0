Return-Path: <linux-arm-msm+bounces-114463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id En8RLsLgPGrFtggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:03:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F976C38C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:03:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AqIS9j1t;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AEGvldsS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114463-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114463-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 191B7300A612
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 08:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C408533B6F8;
	Thu, 25 Jun 2026 08:03:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE2B23E358
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:03:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374590; cv=none; b=awOLawgW6TADV7PEsXlqDeCJsVWcl0tLQ3/hy4ITwFsVx/Z0eSNY6uufs89GhULL88VvQa7n4Krg9YeZ+1jWkQt4RrEMQFFDHzkJqxNUtqK3EtdhGuLWyqVOTXeiPsmmLx8LKOlUIxMhlzY0jjdCro+vCytpaLTKNk294od9+pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374590; c=relaxed/simple;
	bh=+LeUK2W5WFxMKhi1pUwMIkmIdcqHQRyIWqYHLGd/T/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzzR+6/YT6aA7fjLoEQybZ+EhD0SAztkfeVYOoCIM4ViicyNR448rKu7v79SKs5jdM5rVFd7UiyZ5Gr1dh5N5rL7lPI9sCmTaN0jEZgyu4EQypqNcV1hKoTUui5YwzYzyJ6cqpztFwioYiboXDv7Do8E6yTWUgUhViTbn9NlWpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqIS9j1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEGvldsS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3e48w640104
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rO5FCGXsOoFHvv0mUd0JcJWaoLBN4ynun7BHL8hKdy8=; b=AqIS9j1to+afer2w
	TBq4LwesK9SicCLGAyGSt08s7w0zPebsw7YZg0wTrIa8NQqDpF2CSvLrOXzh1nK1
	vwaNumsxuvNfWr+X7k0wcoTa22j8ydLkGKabfRLryANYtODU8Tmbx7oPyb/LxLFs
	SNNse8jCF7jR/jxa38+qzk4X7y2HLWd8KB6R60skirMK/VoJtCuJzyfYch7Q+gTb
	zQgdD9V9PGVtkmlsQ0EeHj0c6DnHINfFDF7siO9XMm1o5YnzJZGh3uZAsRfgJEE3
	pA1cvXx/ezBX/dX1RgfKIF8/9u/ZW43exOYR/4dEBrLEcWau0zPWit3kyR9rUSBR
	ds1/WQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbtmtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:03:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59c09345f05so63849e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782374588; x=1782979388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rO5FCGXsOoFHvv0mUd0JcJWaoLBN4ynun7BHL8hKdy8=;
        b=AEGvldsSKfHU7MuVHBGJyXthXCQVM9RC/a6LBzhnlduPif/3pXJY0bq/tRFOZABg3/
         na7BYBdKwOm2+/gHr/Yi2Exa06G2wq0rQu/rALgxuKbIkIL0aczAHVXVDpmZmjK2o/D8
         agdcCJkfhZ1/5n3QVSp19i5ooPODkdzskO8lwo2eturfTx8HyznS9CSIjM9ZM8PkHjve
         jxcVNGS2Y6wZlJ1/QulpjIbys2iY+xQLzPomUjPqrofwQwfAwT/3Ga/sjKra8q1OUBcw
         4RWeGRGs8vTCwebhbe6GzWMx46b+VqqDFHxWCeUZm18muSgnqG7h4QrdwUIfz9OvckAe
         R+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374588; x=1782979388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rO5FCGXsOoFHvv0mUd0JcJWaoLBN4ynun7BHL8hKdy8=;
        b=sLx9EKv1avehPa4qDSGeUa/Y/SgJDJCPL+daDu/2FnfxxjwEihJRql5wim3vTtJbrD
         kwi37Krc75UBQpYjKcO5EocAVROs03U6t98R5B3fVG5F9qKyb7KwYUOqWBBxSlY9cPKM
         ySE1NX/NtalxV5XlYDbGHgiW5iT7FpCHNgrqkSVkCigVTxdXR9QYqzWqfxBRWBN/DOa7
         cmbYSP8BfX+BYdH3hUf+yorgZ/lCzICSJ7xcEtKYk2XifBYjZEtF6GFjiy06vZ4DeaNG
         QXOejZ9u7dZFSWFJL0yBK5oQ4AXEaqgKFQbx1kOGiJPD6OXKcrIXHuSsO35BX8JPahUT
         RrtA==
X-Forwarded-Encrypted: i=1; AHgh+RrMIReYURVBKf9UoJWmU8znWoRlz8GJkBTZEBq17QhmhuNjTG4U13yyhkJ7Q4m6hQd9kKO0UG9Oma1aZZBq@vger.kernel.org
X-Gm-Message-State: AOJu0YzWXXvRtjSxZN3VhuojvyzU+kR9cYixa82PE2dQpwR7N2hs/Dkf
	BIvm3GxS4VTQV6JyL6lWmgLaE0WiIg6ILP9YMbLcQNJ0nRroQSDVa+zbjs2HAzcpUUQdoCKgz3B
	Ovq9DsooH1YzT+ksiGUMa+jrMxTuc8P2KUT8DyN2LIcM/kQCS8byUGfFNprEHeA3cxlot
X-Gm-Gg: AfdE7cllgKjyAr1QUcCEGOeSCI6D9Dmq/01y907o11rFi4S587NbhEcA3gVIj7+Z97Z
	23yLpkjQSUDDmnX0ef8GCVHc1Y+1IAAJBkx2uyOs9eDWTFkvd3JTfUODN9v2TUucnT2ttmflzf3
	5ZWIr943A1XJAIDLi5zJnwUU36xMkHMHMcREcjIZuLFT7hlDaHW/0VBr7mTkaYDT7w2SK3vjzlp
	nxqYZP+E1dbFcUyyOlkHAHcVhwb5yWuwX3SH4fwxWKWBXhsT7p/BMWcdk4o8/WqqHFoDhwzBDy+
	81UJ9eJQu7NgdwdvsMCRmQSE3q6RoG1o/n0spnQM7bVmdpQV1wyWIiNjqNbK9ou7+PWBQi3QB7+
	eFkqH8XA4ZgpwxB/Pb1xJx91bYgnmEwwRsM0=
X-Received: by 2002:a05:6102:548a:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-734360a285amr157872137.4.1782374587927;
        Thu, 25 Jun 2026 01:03:07 -0700 (PDT)
X-Received: by 2002:a05:6102:548a:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-734360a285amr157854137.4.1782374587428;
        Thu, 25 Jun 2026 01:03:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe59504sm121399566b.43.2026.06.25.01.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:03:06 -0700 (PDT)
Message-ID: <1d26c917-917e-41b8-ad52-8c1f3e306ce6@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:03:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2OCBTYWx0ZWRfX413bp4uaNKCf
 GYnY6d/P9Fv6zULnNxxs17vJBGFsUBps20rCSn0Zkmy1LJhEyJ6FJrCpt9PVXO+B8qzQP+dF6ql
 jI2K0/4AOhHNBkRP1Jm0XFH+PTOGbqY=
X-Proofpoint-ORIG-GUID: -GI_7VkTG9FEvMyN3-F5WzcTD63H83ND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2OCBTYWx0ZWRfXyfA7jZxjvff0
 Lo9mPhQmEeU4J3h2eFyOquypQmWf5/CnpJJC1pEAwwXD7ZJ6BLcfJNostqm2behprao6h4mFADf
 SKwLRmpSuGgj3edEZx/7WbkTCwBwWLWFu6VKlinhjpRiQN92RoWQo64DiOCMiwvI8QjoOoSMAys
 qAa7CFfiP4s0gmnGc+xhPYLQ2+t56xPZXZDpHCA4rkbeuU4ucuOl85WdkzOhFKdBZiaX1tQ5F8Q
 G0Qbm+mSlr183U5xrLdqFzJVP16j/Zkg76NHWIe+U4xI+7viP5J7AXRMR07KWy0bLWao8kICyCQ
 qL5DRKMn9m5pTiDQlIWKhISxjwsNs7WnVCCbQ+WLggPYbN1dr6h+XENHJGRVLUUSnuRzUz5ehtk
 OLByqCApHusrZXp/6SM3HP7zSqmKICZoWa6X5MfJ35TOB3u64eAPXxFEzqfMyABDW/DIbuma0P7
 dfsHSt6Zlox2HgcdPvQ==
X-Proofpoint-GUID: -GI_7VkTG9FEvMyN3-F5WzcTD63H83ND
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3ce0bc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3l1M8v5O_xJZoUiDCkgA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114463-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56F976C38C3

On 6/24/26 11:08 PM, Daniel Lezcano wrote:
> Expose the Lenovo ThinkPad T14s EC environmental sensors through
> the hwmon subsystem.
> 
> The driver now registers a hwmon device providing access to six EC
> temperature sensors corresponding to the SoC, keyboard area, base
> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
> are exported to allow user space to identify each measurement.
> 
> Additionally, expose the system fan speed by reading the fan RPM
> registers from the embedded controller.
> 
> This allows standard monitoring tools such as lm-sensors to report
> platform temperatures and fan speed.
> 
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
> ---

[...]

> +	case hwmon_fan:
> +		if (attr == hwmon_fan_input) {
> +			int lsb, msb;
> +			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_LSB, &lsb);
> +			if (ret)
> +				return ret;
> +
> +			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_MSB, &msb);
> +			if (ret)
> +				return ret;
> +
> +			*val = 0;
> +			*val = lsb + (msb << 8);

'+' looks funny here.. although t14s_ec_read() only reads a
single byte and assigns a u8 value to the u32 that's being passed
to it, so it never *actually* breaks..
 
[...]

> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info t14s_ec_chip_info = {
> +	.ops = &t14s_ec_hwmon_ops,
> +	.info = t14s_ec_hwmon_info,
> +};
> +
> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
> +{
> +	struct device *dev;
> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
> +		{ T14S_EC_SYS_THERM0, "soc" },
> +		{ T14S_EC_SYS_THERM1, "keyboard" },
> +		{ T14S_EC_SYS_THERM2, "base" },
> +		{ T14S_EC_SYS_THERM3, "pmbm" },
> +		{ T14S_EC_SYS_THERM6, "qtm" },
> +		{ T14S_EC_SYS_THERM7, "ssd" },

Makes one wonder what happened to THERM4/5 - may they be dedicated to
the 5G modem, perhaps?

Konrad

