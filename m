Return-Path: <linux-arm-msm+bounces-105044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IAeLqvh8GmoagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:34:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6F0489076
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00C6531A337A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816EF30648C;
	Tue, 28 Apr 2026 16:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deOiAsRS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4fPpaHF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A082765FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393683; cv=none; b=tKjA49DCl9MpUeSXOhH3F8vGcbeGFqJlXS8BPwk6yQjv7D553WJPbC052rrFR4MmC6l/EFnPh/jxeRNF1ICeoe0MlvIHNnbIUMtj7Bdec1lT5gCwUgnBc90+G0/OAryP0aKT6bOwVn9zMuNwqoz7JjraQeAKzZz4HZB4KTnXcow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393683; c=relaxed/simple;
	bh=7o7xPybo0e/XAw1Dyb/YPRrdJEhxYOVGMyv9+c+tQ+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1uVVgGk9Ee6fXuuy64rZoMl/d4ExQxg81BxeM5EA3wFv2X2Rogebh2FSMrdoY14Kw6uWEnS35RJvdvN0VZURz/X21okeHMKjMNClO3WhgQO/bLm711WR7aoeMo9WdMKFHz4eS3Jl88nDvKJLlHMjDYJ4MqXdSsolB9z3dilET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deOiAsRS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4fPpaHF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFslVr3979504
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zYoXgcN5YmYoiapw5cl2FOxLA24GcaGELbu3+TT+7I=; b=deOiAsRSWPgxHeMc
	bY5h+d++hfvjFrQZVAHuEzfsF2GppwuUNK1ra9pnFULXPsOebAWenv78v/piTnrY
	cf7pbq1ReqIjRQ4MsuombIJoYgXWnC5sp1wZjuQ6Ek+azMQh0lArmZP4mb8WqD/+
	l6Kxm5kCXhOO6yLFvy5/+E2cu53VH6F5Az+QJUSvUj6uiNLlfdLO0ovAQDmKfKyb
	BnTnb9hkIFPRdxXTUFZRwjIqrHI9IfyzbIwRHekb8TvbMQWypx/Y1refLpo3HTda
	a0+QNgacip+8mLUzLAr6CUhPc6AW6mFpo7QX7f7sLrTeEWOv73yQkcR6ODjTcgZG
	ox0Z3g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsc0a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:28:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f07078ff0so8022925b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777393680; x=1777998480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zYoXgcN5YmYoiapw5cl2FOxLA24GcaGELbu3+TT+7I=;
        b=R4fPpaHF786MJ6IGeMXdlx1/8dh+ptWArNIyPOqr09M21LynP7fC7WEIYk/QZKFsSM
         uOl0TPNuXdY4FX5zV2YPlshbqYv4e1UNwGgJv2zYXlc+SVTAyNml6fhn4ISHDSGWVAaM
         xB1Dj9A4QsIHjWPDPslYuP2BjzlWcpi+1zjbN0QTMiLI3YuzWgqgauqMWIeY36XJkIgL
         PgnrGvsG/WdoN7QjdhZkEkJtIUJ+55kmkli0XPVZzq5GmxQSO8aWcYlDetBf99NTX8Zx
         eBswwb7R7HfQoYuCwy2QJd5XR9a5CBCyyOadP1gpz+M3YtfyFTmWh0Jdz4kEQXXL+RDW
         60DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777393680; x=1777998480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zYoXgcN5YmYoiapw5cl2FOxLA24GcaGELbu3+TT+7I=;
        b=k/or0h0nO5RggbprH09Hz1TXQD7ASCfkqm61Np55uzjITMnnh/OIv+l/HGqRt5FHEP
         pJo7okEVKLLzuVTqf9JPIiZkV1Pa1GXyhn4Yd+jO9VnEEuEx3sD+GLgpZEWOODAfAHz0
         v2v+ym6Ge3pOq2w0VJQGmdErQZHnC29PUTxSg/zHKMLaP+0nxRgANDs2j0NV3oQexA0C
         /V55f9yBzXetM9sEPRMgHQLUvEvvP29nTqVVrh2GnlTbfFoZhewm99ZhAmhG7neMQuGV
         6CPRF8/P08aR+vM5I9D8EvCtZSGtNdOnp79PgHDBT3VUrs/b6t/x3su085rqdWsZPJhe
         ms/A==
X-Forwarded-Encrypted: i=1; AFNElJ8fghElWPZkzXPz2dtew6L2TfEWrM2c5sNRmGJp/o6Qb2YiwzEhJayFIpL9nYftYwBHF2pvar7FhbGXpzHe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl0XVANv1J/TGyw2ecgVPa937t73FVypld5F/iUM1XdQmDZ9GJ
	wQ6eJRkdpNS6Wbu3El9q2UPTAyyiy5SqNgq6tObZ3rzM++IpAhnrG21TSNJWfYDfcnMKUYD9XW8
	gYdc56LZMLdtI1MK8/fLxbG9J+7U03aAaAoav21WrnSGpy062q2NHt6y+k7PHiADSHZF1
X-Gm-Gg: AeBDieurlqQTk6EQU0VLdVYaBCxmFNWiP9ZJKKBra3BxJwviY48tVy9KtatwwoKJlGk
	GSp65OyaWBJpU2IXUlqIECPP27EOGfvP3OuOpmQveXczBOWoyqQU4LTrbdTDHKzwWQLRp2RfXa/
	+ZEg2/zmj/Sg/vxIY/Auqvmh6nWgvLPbGhcxnDduawQSWwcEZBUSNIONJC9SCjeHcuCs8ys4fay
	az1m76Va7ULAovA7RHUk0FmefU3CP4k/qJuXAHBccVRGaymKbV6wvZki3JEAwjXN83VBm5zMAdz
	NYUJq+9PpOOAhR4yg2ovJ94XGWYibTOuNE26pAhhyxPy/pPhHcV1SKO6bkQBy+s7oIJ4fA7lVkb
	6MXG2P2QOnQh6YQ+tEG0d6Wx7KYn/NqcfCDZaKgj+B5CebIucWUMVfcBWaMjjHmV9R+aX
X-Received: by 2002:a05:6a00:4b0c:b0:82c:db50:ef77 with SMTP id d2e1a72fcca58-834ddc950c7mr3689714b3a.49.1777393679333;
        Tue, 28 Apr 2026 09:27:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b0c:b0:82c:db50:ef77 with SMTP id d2e1a72fcca58-834ddc950c7mr3689676b3a.49.1777393678617;
        Tue, 28 Apr 2026 09:27:58 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.227.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf69297sm2893898b3a.47.2026.04.28.09.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:27:58 -0700 (PDT)
Message-ID: <b3c36404-64ae-4a10-b955-ee5b2321b7ed@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 21:57:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 04/13] firmware: psci: Introduce command-based with
 magic
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-4-dcf937775e73@oss.qualcomm.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-4-dcf937775e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AN6k_rtGObVEgbJF0ZCXs4qnwvaN0AwN
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f0e010 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Gpg95E5bJKK5C7oRfY2+2w==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=219khkIK2FHepI9fHIMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE1OCBTYWx0ZWRfX+U4A7knlICdx
 g8Uhn2vukFoEeA4jiH5hF0SsQEhEiiASkT4L+QZXDZW7CXiKGG/yxB76K+8lV22FNX/Sx4R273y
 zljJzqLXZLOGDRLKxyaGBvu+lCEAD1KnzdMlGaVG168sCZGmJ+QD06oWH2usyUMVKHUxMSlJDRO
 /Tstt5HqjYYQx4i+uh5ZQXWtvf9pUOb2h29X2uthjJZoc69QQS+xB7itEDcGrsYWZOq0j1JFnpD
 PhnEMuWYMtDajmd3BgrO7qXoOvB+L1zbi5BTlB9wmSgIkdpYZCHxbxzcFOYf6kfn2rOwd596Wsp
 uJTUYn3bzWJZXgfeR86v6Jg1F9J4bLVdH3tcB3i+8kxbV2sZOj2vDJSnXE1314Rh1fxl8Z0G8Cg
 KYSf6ZCUOKD/YWm8D+9zkpcxM89iVz9NUx61hpZWfb7ambMm0jTOlnoyJHDI7vCGONqxiXMBtou
 uMfw/0O8Icf+qANtHvA==
X-Proofpoint-ORIG-GUID: AN6k_rtGObVEgbJF0ZCXs4qnwvaN0AwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280158
X-Rspamd-Queue-Id: 2F6F0489076
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105044-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Correction in commit subject - firmware: psci: Introduce command-based 
resets

On 27-04-2026 23:04, Shivendra Pratap wrote:
> PSCI currently supports only two resets - SYSTEM_RESET and SYSTEM_RESET2
> ARCH WARM reset. The reset patch is selected based on the Linux
> reboot_mode variable. The PSCI specification now includes SYSTEM_RESET2
> for vendor-specific resets but there's no mechanism to issue these
> through psci_sys_reset().
> 
> Add a command-based reset mechanism that allows external drivers to set
> the psci reset command via a exported psci_set_reset_cmd() function.
> 
> Define predefined reset_types - PSCI_RESET_TYPE_SYSTEM_RESET to map to
> SYSTEM_RESET, and PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM to map to
> SYSTEM_RESET2 arch warm reset. Interpret zero cmd_reset_type, for
> predefined reset-command selection via cmd_cookie. For non-zero
> cmd_reset_type, check for valid vendor_reset_type and set the psci
> reset_command and cookie accordingly.
> 
> Disable PSCI command-based reset by default and treat invalid reset
> commands as no‑op. psci_sys_reset() follows its original flow based on
> reboot_mode until a reset command is explicitly set by
> psci_set_reset_cmd().  In the device reset flow, psci_set_reset_cmd() is
> called in reboot_notifier phase and the device reset happens in
> psci_sys_reset() which is called later in the restart_notifier phase. If
> a kernel panic occurs in between these two phases, the reboot should
> take its original flow based on the value of reboot_mode. Disable the
> command-based reset in such case.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>   drivers/firmware/psci/psci.c | 75 ++++++++++++++++++++++++++++++++++++++++++--
>   include/linux/psci.h         | 19 +++++++++++
>   2 files changed, 92 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..cb37c39e2b4b1d99f0080f6a5cd6c92a070beda8 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -51,6 +51,16 @@ static int resident_cpu = -1;
>   struct psci_operations psci_ops;
>   static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>   
> +/*
> + * Encoded reset command:
> + * bits[63:32] = cookie
> + * bits[31:0]  = reset_type
> + */
> +static u64 reset_cmd;
> +
> +#define PSCI_RESET_TYPE(reset_cmd)	((u32)(reset_cmd))
> +#define PSCI_RESET_COOKIE(reset_cmd)	((u32)((reset_cmd) >> 32))
> +
>   bool psci_tos_resident_on(int cpu)
>   {
>   	return cpu == resident_cpu;
> @@ -80,6 +90,35 @@ static u32 psci_cpu_suspend_feature;
>   static bool psci_system_reset2_supported;
>   static bool psci_system_off2_hibernate_supported;
>   
> +static u32 psci_fn_from_cookie(u32 cookie)
> +{
> +	switch (cookie) {
> +	case PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM:
> +		if (psci_system_reset2_supported)
> +			return PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
> +		return 0;
> +	case PSCI_RESET_TYPE_SYSTEM_RESET:
> +		return PSCI_0_2_FN_SYSTEM_RESET;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +/** psci_set_reset_cmd() - Configure reset request for psci_sys_reset()
> + * @psci_reset_cmd: reset command encoded as cookie[63:32] | reset_type[31:0]
> + *
> + * Save reset command.
> + */
> +void psci_set_reset_cmd(u64 psci_reset_cmd)
> +{
> +	reset_cmd = psci_reset_cmd;
> +}
> +
> +bool psci_has_system_reset2_support(void)
> +{
> +	return psci_system_reset2_supported;
> +}
> +
>   static inline bool psci_has_ext_power_state(void)
>   {
>   	return psci_cpu_suspend_feature &
> @@ -306,8 +345,24 @@ static int get_set_conduit_method(const struct device_node *np)
>   	return 0;
>   }
>   
> -static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> -			  void *data)
> +static void psci_handle_reset_cmd(void)
> +{
> +	u32 psci_sys_reset_fn;
> +
> +	if ((reset_cmd & BIT_ULL(31)) && psci_system_reset2_supported) {
> +		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> +			       PSCI_RESET_TYPE(reset_cmd),
> +			       PSCI_RESET_COOKIE(reset_cmd), 0);
> +	} else {
> +		/* cookie part of the reset_cmd decides ARCH WARM RESET vs SYSTEM_RESET */
> +		psci_sys_reset_fn = psci_fn_from_cookie(PSCI_RESET_COOKIE(reset_cmd));
> +		if (!PSCI_RESET_TYPE(reset_cmd) && psci_sys_reset_fn)
> +			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
> +	}
> +}
> +
> +static void psci_handle_reboot_mode(void)
>   {
>   	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>   	    psci_system_reset2_supported) {
> @@ -320,6 +375,22 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>   	} else {
>   		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
>   	}
> +}
> +
> +static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> +			  void *data)
> +{
> +	/*
> +	 * Command-based resets are configured at the reboot_notifier phase.
> +	 * If a kernel panic occurs between the reboot_notifier and this final
> +	 * reset, ignore the command-based reset and let reboot_mode drive the
> +	 * reset flow.
> +	 * If reset_cmd is zero, there is no command to handle.
> +	 */
> +	if (reset_cmd && !panic_in_progress())
> +		psci_handle_reset_cmd();
> +	else
> +		psci_handle_reboot_mode();
>   
>   	return NOTIFY_DONE;
>   }
> diff --git a/include/linux/psci.h b/include/linux/psci.h
> index 4ca0060a3fc42ba1ca751c7862fb4ad8dda35a4c..c2458291a3faf5ac89b1528dae2c9b805a2dd075 100644
> --- a/include/linux/psci.h
> +++ b/include/linux/psci.h
> @@ -21,6 +21,21 @@ bool psci_power_state_is_valid(u32 state);
>   int psci_set_osi_mode(bool enable);
>   bool psci_has_osi_support(void);
>   
> +/**
> + * enum psci_reset_type	-	PSCI_RESET_TYPE for SYSTEM_RESET.
> + * @PSCI_RESET_TYPE_SYSTEM_RESET: Standard SYSTEM_RESET command.
> + * @PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM: SYSTEM_RESET2 architectural warm reset.
> + *
> + * These enum values map PSCI_RESET_TYPE_SYSTEM_* constants to reset strings
> + * issued from user space. When user space requests a reset, the cookie
> + * carries one of these values, and the PSCI reset path translates it into
> + * the appropriate PSCI system reset call.
> + */
> +enum psci_reset_type {
> +	PSCI_RESET_TYPE_SYSTEM_RESET = 1,
> +	PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM,
> +};
> +
>   struct psci_operations {
>   	u32 (*get_version)(void);
>   	int (*cpu_suspend)(u32 state, unsigned long entry_point);
> @@ -45,8 +60,12 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
>   
>   #if defined(CONFIG_ARM_PSCI_FW)
>   int __init psci_dt_init(void);
> +void psci_set_reset_cmd(u64 psci_reset_cmd);
> +bool psci_has_system_reset2_support(void);
>   #else
>   static inline int psci_dt_init(void) { return 0; }
> +static inline void psci_set_reset_cmd(u64 psci_reset_cmd) { }
> +static inline bool psci_has_system_reset2_support(void) { return false; }
>   #endif
>   
>   #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)
> 


