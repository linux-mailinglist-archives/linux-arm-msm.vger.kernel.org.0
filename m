Return-Path: <linux-arm-msm+bounces-101276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLlBCOjjzGmjXQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:22:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2033777F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53133308DB25
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A623BA222;
	Wed,  1 Apr 2026 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ccgI/hhK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfE2xvVy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2B13B19BF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035005; cv=none; b=TwV4lsQyUJFhuYvTJIeaMcUUmoGMBjfp2XAAVr6nTtXFiZEKDAAAu6HgaINQJFCWObrxd5SiznIC7yl7MOnYaUPgNsbQsbV/hAzmw+rsrZ1Bdd6RB/WQwOOeDR5ROUGgOzSEF1CpPbDpoDpiNsgTIgh+k4WB+fV2H2wDrfZmPhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035005; c=relaxed/simple;
	bh=vxiPU/CghZ0V8l3HZJYezZsMM247sES4zEEMkAqZ8eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jiFl92h+Ukv/h+vq8p7/8tbgggmOky28kMZ9UcqSYNoBm8yzdDOzk/WAm0ztVkdNCYtfAy97CjFYVCoMxH5JG1RJT5Ilh8I6wjCotN/P0b5qJ0h/7DFDIjdrWi0OF52stT+qRazulR6rWH2NAJBUQPKJ0Ody4uDesbTTzi/VGvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ccgI/hhK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfE2xvVy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317VYxX1004515
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYLS9EyJfFCFWAF1/cQCFqZ3LfYNSZYdzW4EeWxH2xc=; b=ccgI/hhKYztpf6Rd
	Q4cHjKVPwTja9hvD+Vn2t4ZRzswb26NOo6YQvH9EEa66GYWl+A/a+mNr/1w8oh4r
	irSVYaSoI2R+HOl1oMF1yuySa64C7XnzGc5amayYAxZHagfocceA6Qhiue3rYYPf
	x6KQY95HdjT8pUX9qdxFR8a29KZF9sPSOSqHDM3yQAQCEOLE4darYTRe31SzoEYl
	KzWoZuSMKLaRRBNBE1dSKgs48/lEs0wpe2J9DjNItg8fzcjFjCSor3idiPJp/wmH
	ZF5hWYFIQ39b4guq5LagnnwGRw0ntDM5VNKAsAPflJMi/1imSq8OFmQQCs8op0LG
	dk/fwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjhh5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:16:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cff2297253so196587985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035003; x=1775639803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYLS9EyJfFCFWAF1/cQCFqZ3LfYNSZYdzW4EeWxH2xc=;
        b=LfE2xvVynn3L3iKrA91fA6JmohAorLxCrPOgYekaWTHACVi1TUzEAI5IqcwmFQ2V22
         +OJIBBDGr/KoSPUOU3XRm0vXispooNHov3xus/QkFagsd8rIdgTYdyp6S1pRgU7gP2JC
         CWmVJJjYcVXcNCDmNYSt4Z0vJPHt7n0V0+CyQ7PxoKMCWEdxustd1RYlDWfl24yKk4Kb
         bjyuu2tPrAvWNeSkguxl0m9r97mopwrXQCXcRayRs3vo8MxJeROzHjIlR/6n4gjShLCG
         UVPFjprxKYLC6gCVEcXTqLvDiz6jWpmlbeVm0BxMh5dmxBUHiAcdiKGUq7cwVr1QkAab
         NfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035003; x=1775639803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYLS9EyJfFCFWAF1/cQCFqZ3LfYNSZYdzW4EeWxH2xc=;
        b=EUflNVBslAIwptxKCUgQVu3YQgD9eiqX15y/mZUUK1mjDh8N6yttRsIqMtmCyeFJSF
         yk8lhWK8MKZaTFcJevMQdAYjIZvzPl5TDQpwO84RFabpeSbQXcXeyx8VB3R18rq9zvkq
         MNW2S+D7TBbWkpjEqxCGp74h83HaFiHMmCry21ncxAGnuB+gYRctV6C+E11msH9LmE3S
         1gzcTqua43Gq4yJrLqaGzSwWkahBfOs4QK0q6tLtAYA3adebvobOcck9Dona0h7QpX9M
         Es3coIr9JT5DTtfhAtcLSefUpdRT79MZBzVhTRtWsu5GXh5d5AcD/pTgHSetM859T/M1
         4XKQ==
X-Gm-Message-State: AOJu0YzEJR8Zp4WFXv2/u8qVLBo6kDQw6jIRcNKcdrlHTLY4uIHSpU/e
	Av925PCQSsUd2ZiBiVsFqUD7B7bjw0aJvMEcvPDUC/Jjc/3x2s+PwoHOCbgNod1AlXDXrD1flr2
	t0ogN48K9UbEh8572CDgr9PA9ccPpxZ44xFrX7wMj6oq485dJqPTg1quDiZjkI0n3++FT
X-Gm-Gg: ATEYQzx6+CisehIHOAdnbht7DwOgqmuH+WifWbjO8wW2M6yyj2X4/BjFXKLzJ/8UFFJ
	M0VrHGbz6Ruhcz40mzGfkijZKIVjD3Ifb9eaj3Ed/4TL8Ny2uXMCvi0AB0LJBwA8hC0GPncGrJj
	LcYNSTbq9QF67uKCapG46HQW0BA/J/1Ot1ggLB55aSBF7Maq+IJeIsQhLTi7EaJ5d/lzhGjU/I7
	EzDm3d/BoWagulGGJOFwW2iM1cM57Uacnt3TMLRDL+QfPf3d4rhCdHe7ug3qqnMd946Qg313HzM
	Bd5w0vobhtRSqdLervqpOoqPDDp+nEUW8NMZW51aRFS+rcJQtG3mBcNucbaDry5eKQi0ruXyk9B
	kk+L/SUgkHlksRLrDXyUHqF6cZ1rpCiQzFcQ6uh/OYRga/5y6WBxbsJkBE6NTeJmr3DR7Dx4r7I
	zJUQs=
X-Received: by 2002:a05:620a:460b:b0:8cf:d953:b4ec with SMTP id af79cd13be357-8d1b5ba9ddcmr320527585a.3.1775035002652;
        Wed, 01 Apr 2026 02:16:42 -0700 (PDT)
X-Received: by 2002:a05:620a:460b:b0:8cf:d953:b4ec with SMTP id af79cd13be357-8d1b5ba9ddcmr320524985a.3.1775035002201;
        Wed, 01 Apr 2026 02:16:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66bf3e16f80sm2826294a12.25.2026.04.01.02.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:16:41 -0700 (PDT)
Message-ID: <328acf2d-988e-45b6-9553-240108caa91b@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:16:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform: arm64: dell-xps-ec: new driver
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
 <20260401-dell-xps-9345-ec-v1-2-afa5cacd49be@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-dell-xps-9345-ec-v1-2-afa5cacd49be@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O5nb5lkxL_ZVGTK791CuWUf51YeEXP-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MSBTYWx0ZWRfX3a5QnWYvB74F
 zDdDCLVBabbIcla7KdC1wgwKR0nMhSr855gDJgZenXtB00+UBNtLkqW3OdhKqpVeeYl+7boFoEY
 c3AZTzM0bJeYAlt4PJKUrgtN0JYdXOAD5phPiOlf40GdtTNkauZpP4TCIZht1j3K4aN6HjaFkHN
 r/rgUFb4wQ4OjKmkBTJF6/xjl0nPBM3qF+UKfm5Mrjqxp7wfw379i14LqZzowHGBq/ZGqzTdBUd
 nKQyDmzf3SareOApkPiE84AqpQtICmtquPPNxZ0Z2nXMRAChI/p0h9rUpnMqX0o5goDKey/BMqc
 0vg6SYAaBMwXLDoMvvV1WihjZRxkpGL7nQic7gjiy8GqahTjixi3WJgh8gX38QD19rveYm0B6Oa
 xMSXhhvOZ78mGUT5V9Jja8uGhVWRBq39Iuo34U5z8V9VRyEL3ANaoqamEq8B71mjdX9Dnocoew+
 VjtHrdVXAUtTsagZURw==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69cce27b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=yMhMjlubAAAA:8 a=UHR3rlkMSTzHGIdMw-oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: O5nb5lkxL_ZVGTK791CuWUf51YeEXP-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101276-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA2033777F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 9:33 AM, Aleksandrs Vinarskis wrote:
> Introduce EC driver for Dell XPS 13 9345 (codename 'tributo') which may
> partially of fully compatible with Snapdragon-based Dell Latitude,
> Inspiron ('thena'). Primary function of this driver is unblock EC's
> thermal management, specifically to provide it with necessary
> information to control device fans, peripherals power.

[...]

> +/*
> + * Format:
> + * - header/unknown (2 bytes)
> + * - per-thermistor entries (3 bytes): thermistor_id, param1, param2
> + */
> +static const u8 dell_xps_ec_thermistor_profile[] = {
> +	0xff, 0x54,

This is super wishful thinking, but 0x54 is ASCII 'T', perhaps for
"Thermistor" or "Temp"?

> +static int dell_xps_ec_suspend_cmd(struct dell_xps_ec *ec, bool suspend)
> +{
> +	u8 buf[DELL_XPS_EC_SUSPEND_MSG_LEN] = {};
> +	int ret;
> +
> +	buf[0] = DELL_XPS_EC_SUSPEND_CMD;
> +	buf[1] = suspend ? 0x01 : 0x00;
> +	/* bytes 2..63 remain zero */

buf[1] = suspend

(since it's a boolean argument)


[...]

> +	schedule_delayed_work(&ec->temp_work,
> +			      msecs_to_jiffies(DELL_XPS_EC_TEMP_INTERVAL_MS));
> +	dev_info(dev, "Started periodic temperature reporting to EC every %d ms\n",
> +		 DELL_XPS_EC_TEMP_INTERVAL_MS);

dev_dbg()?


> +
> +	/* Request IRQ for EC events */
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +					dell_xps_ec_irq_handler,
> +					IRQF_ONESHOT, dev_name(dev), ec);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +	return 0;
> +}
> +
> +/*
> + * Notify EC of suspend
> + *
> + * This will:
> + * - Ramp down the fans
> + * - Cut power to display/trackpad/keyboard/touch row
> + * - Periodically (?) power them back, such that wake-up source still works

FWIW

https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/modern-standby-firmware-notifications

Konrad

