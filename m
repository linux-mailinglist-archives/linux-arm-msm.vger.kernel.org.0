Return-Path: <linux-arm-msm+bounces-104986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ir4LMWm8GlAWgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:23:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A9A484C95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 292083031CEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0112541323A;
	Tue, 28 Apr 2026 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+xZbf2g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuQV2Qja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E5C410D3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378701; cv=none; b=Dysgn8pk3vpfh454mCU7vjQhhSwrDlc0Jg2xckX+V7g5DK3eExaqsqXfN1sX0DpES8tsf8JeWjUyCBUyONVHEZvbFfSNhgFw8dbZtSlk08K+l4Bz5Ca8EJO0cd1mxBDhHeHmupWYZjh9zg9qZRFE0zql0bkEsQn9NAWmwAhcBv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378701; c=relaxed/simple;
	bh=7Zso9KS+gzl6tIHrYjH5N3xNODteTYkq+N/ntXUkUb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LdzFSyvWMS2qsMZ7Wfppe6c/wUegPwVOjDKRe3YrOBVucWImlQ+xeAzI0SPK7dSPVBIxtKZew4herQqH91/yOxWk/xkIgfdpjldu1LEA6x7UqUCMbJYohWDZRWX82AQo8GJqeCdqZIHYOJKx0LC8IG3HK9fpvtyWeIFpS8dR5dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+xZbf2g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuQV2Qja; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7Kiqw440853
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5kFeqYt/6hoO6aGdTKf3E/wifl3FzIvEDfFJxnGaXE=; b=A+xZbf2gkylFt81o
	x+cSbgpkgy2MCYpYlbrhyfOtVlk7k/QVjPNC8dY1doBJk0mHmknvWTQbVpjICUeu
	ryCIKDN6nBNLuxQ0NXTzDPaWJuKX+i83c6bN02soMKSaf/MVKUGnCIvRireT6050
	Bbe2yXPQKyLJDW56Exk1kG/78wtLIpHBraPeluatU0U4YFwlx0HXV59wveMu+7it
	929B3DQxTIVZr5jibBm4YO4rb+/GDFOs2lNM5ZhelSlENe82AjHHjAtGj8p3r0WU
	9lXompbtVmDjPFB7w9ADopV3I9BeACDcnyg+ICxIuR88hD6fQYHxnQwPFrf8tZUw
	2zD56g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac44c6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:18:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c79907d4c57so3953629a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777378690; x=1777983490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b5kFeqYt/6hoO6aGdTKf3E/wifl3FzIvEDfFJxnGaXE=;
        b=BuQV2QjapTtvNWxtPEaUba1K8fAnS6x3c8oHGhqlxxnHzomZlKlmDOEB/UJrI3WCiZ
         ImpNbwQdrWwsUYEOU3mgPITP7vaVP0ai2uhTHpeoY55YFrh+SzuyYRko1As3npyUOTln
         owlI6ZQgtJJsK1U2TDNVCpbDQe3BffhvLNa81Jjo6D20Oz5qwJ3EBlGcX6CyjBhxq/CB
         CebkJKDR9EG/uX5vBYjCo1cAzAt3yyJM5IriYovUtuQWVl4rd1gJ3lCyfAK7Go4P0+ED
         EtVsDXu4GMilggJd7eLCzTbJ6X8EHCxM2oe6O1fDptTmU9GbLfDV4jPV/+56ohQ11+Od
         +7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378690; x=1777983490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5kFeqYt/6hoO6aGdTKf3E/wifl3FzIvEDfFJxnGaXE=;
        b=ppygXwfpaopvOZh2dH7qXDXhYODK55xk3aG1Xl69/Y3e+x2/uXXBXDOuSFpygjYpva
         sxAojx+MKzc1QFyaaSWzvEqEVxHyh98Dw4Ay0s7oHoohycc/ugsIKJ1F5GcX/WQoQ3mw
         +4pn5TFaHoOKHmoDqzVPlIpz30qo8+73FMs+fmjv4u7AvaTmbwxqKwJJ07o4oNkrm1aq
         EkWayxjtl7DkILOoZn3ZeDFoM9rEbOYDaYVYyrE0kZN2R4hfGjGz+B/qsNaZtnnvmcpl
         rtt5mhcFxT60USPuBXIfmS0zJh7wr9rbRv2ERODNZyEyw9vycSN+2aNklyRPi4y9mkAg
         jpJw==
X-Forwarded-Encrypted: i=1; AFNElJ+330ULzRnmY8JpMUofFd+tNLv5EpdU18fQDSeycW035rUIiaoViYU6v6IHVcrZVwe4Ka4IUhU+oKTSXEH3@vger.kernel.org
X-Gm-Message-State: AOJu0YwcPJvnGarsOiCh8owBcebYvwkrxwALLSPU9dxBIb6kAqCPs7Jd
	RKIeyATCLqVIjhkZLvoq4zVof6W8N9NJjeYTT7bvbw0rKLkcnYea85HAC9y2IEckpjlzbmMUpyS
	TTNCLW+kOB92UaSMbxg128iC711M0QWisJJH6H+VO7aKWb6stPgtBCVMnSyhRcNysNcjw
X-Gm-Gg: AeBDietGe8RXXH4KxRxkJaZ4pAmlaLoEfwdMZDbAcX6+IQQnHLKgs7JMqPz8CTxMV10
	G1hakgfWiOVgm3tMZkDrpYemFj1s7ghEf/ANnTRjYBvn3u0OtXjDjcV2/fMROU8TQU8ekJLAnWW
	Cmm8alIZc/X0pJdhcRMp5haS07sjKWuDamwJrLoaD0TAMGuGNfgFCQfsx4Z1IwCBmUZpqh3ZxHi
	/p6sR4Qr5MBK0QLINmPauAQZcOH3O1zGyRC/qjWNsHWGsgMWCOsC9btotodNp/xkzVwuZ0n4+Vn
	4bnunmCoMm3Qe1iP1SM6oZk0OgFaJf4pn/aTcMM3dFiECuZlxTRIqd4H3aQ4Fx6dDmFL9p/CQb5
	HcqQSjCxw8yeqrHBS+MU+zjfDljGW3HtVkDTd26MM6U8aY3UQrRo9IilmMGyJtezyLcY=
X-Received: by 2002:a05:6a20:958f:b0:398:7830:8a40 with SMTP id adf61e73a8af0-3a39c0ed8c6mr3526722637.23.1777378690290;
        Tue, 28 Apr 2026 05:18:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:958f:b0:398:7830:8a40 with SMTP id adf61e73a8af0-3a39c0ed8c6mr3526670637.23.1777378689785;
        Tue, 28 Apr 2026 05:18:09 -0700 (PDT)
Received: from [10.219.57.134] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc6015691sm2244868a12.18.2026.04.28.05.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:18:09 -0700 (PDT)
Message-ID: <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 17:47:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: Bartosz Golaszewski <brgl@kernel.org>
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
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fpv-3qxQPY7S7lGqEEtUQwM4T_iszE8r
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f0a583 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SHOFGYX_daQPcY9Fc6gA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: fpv-3qxQPY7S7lGqEEtUQwM4T_iszE8r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExMiBTYWx0ZWRfX+MVqWa3jeM8k
 ook/vrQPK+/Y7yTPzpVxKxIkZ0MA+0FjTQG2UPw0K6tVKaX0pntoVDcuJv1Iu6Mj5VgmRflWflh
 aaWSTXXknZgdcO9aoFT5Yt+/3Fxij+0kA53qsogKIHQ5VWjY+Otu5yvQJPJodVhXjJEHkKPkq+p
 LIjMGYDANmObSPRSkg+8dDhSbsRXCpTnz5eWIWTdpaHhMyhhickFExRuqAAHx/JTHjMxhNw1mpF
 3ItxSlCq6BTCmGbBM2pRqh/7JkjrCq0hoK5g2r2pTlst4Kf4WqAKtFThpzXB8bQZ5fxYVBxrPYX
 AYQ5QwL6nEk4Mx0jgX1tU+KiL4Czoi1zyFu8So06Cjy5RPlVcN+6NUm9xrXvc5fEFpq/Ft7n8k/
 9QWMoHa7n4dKsMKPXPuB8sWMIapuLRmuE0hry/UOwoafNh5koUuiHoZdR6ZiVjvACMcOVXWYNs3
 YX0Fa0PNOe9FRUn2tTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280112
X-Rspamd-Queue-Id: 19A9A484C95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	TAGGED_FROM(0.00)[bounces-104986-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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



On 28-04-2026 13:33, Bartosz Golaszewski wrote:
> On Mon, 27 Apr 2026 19:34:48 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> MFD core has no way to register a child device using an explicit firmware
>> node. This prevents drivers from registering child nodes when those nodes
>> do not define a compatible string. One such example is the PSCI
>> "reboot-mode" node, which omits a compatible string as it describes
>> boot-states provided by the underlying firmware.
>>
>> Extend struct mfd_cell with an optional fwnode pointer and attach it to the
>> child device during registration when no firmware node is already assigned.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
> 
> In the following patch you use this and violate the supposed constness of
> MFD cells. This also mean you need to modify the mfd_cell at run-time. I would
> prefer introducing a field in mfd_cell: bool use_parent_fwnode which would
> indicate to MFD core that - in case no fwnode was assigned from other sources:
> DT or software node - it should reuse the parent MFD device's node.

Have one doubt on this, When we fallback to use_parent_fwnode for cell: 
psci-reboot-mode, at psci_reboot_mode_probe(), pDev->dev->of_node point 
to psci node.

But we want dev->of_node to point to "reboot-mode" node. This may need 
an explicit assignment again of of_node?

thanks,
Shivendra

