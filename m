Return-Path: <linux-arm-msm+bounces-115563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GWmFL8F+RGo4vwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 04:43:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D11C66E9493
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 04:43:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JfEXkNZr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kuDH6dZl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115563-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115563-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9244130234DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 02:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4BC3630AF;
	Wed,  1 Jul 2026 02:43:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF593630A5
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 02:43:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782873791; cv=none; b=H68N8H/9pQQKV8rJgISJVn4JZlBRue8ATMsvCpt4BoQ+E+hiNW5cE6Ns39iXpynHC5gP4sX0V8BKR1fBtlNVmoPhOCoKGwCB2DIsLH4sRYBUHhXNBA342wS7Hd8WhscFOGmvOG8F1zuANE02HQ8cyR7MPo5g4CJBgMD+xDIGocg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782873791; c=relaxed/simple;
	bh=FapcmhSDWdIbfGDn7d2E074RgF70uLIGNaphnZUIFUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVCgXrmPKg0eYKwrZ/CwfQ++KxhhQnd735K6ZCZokqkC9Nq1H0CyKJRnWVaFVQUrU6jj2tT2jSLK/c4xg6RA7C4ox4q371+FwmgXG91+a6t9TGuS1sPzFYosqmPWhk3YCSh79C/YSnh/52m+zd0DQEnzMMUSPbr0hyYS6iC6o7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfEXkNZr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kuDH6dZl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNMZnh3485384
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 02:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	22j6kvPQxvDqX/JKFeoFPtRFjXD2z68YaP+Kr9Dut+A=; b=JfEXkNZrhlpEGX6c
	wORIgFA1wnP0W8g/y8VSm+xA/UUCGVvga9IabRKuC3pmLvPOFfuPiFdounGvRkzm
	nQaEU/AO0r4nJ4x2Y6YIv0KXx6b268iy3ohlNwVRRg6uxjHtfMMXhEXfjmNxh+hp
	Cz3GHu0TtTLk4uScfm8xhf95x0Wg6K7VXYmt3zcoFrWZHA55dmybAZw7X6e7jg1H
	o6UM08W76BtJlV7VuAZom8CHk/1lW5QKQv9A3EkAU9AOHevBXAfssULeqq4nU71G
	DENXYq0EyY5KsbzXYqqnHUw78DG/OiaXUBdzw00ceM9DqjpYr8LjjOE+c7jA9coy
	V7xt2g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0atc0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 02:43:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso5747365ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782873788; x=1783478588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=22j6kvPQxvDqX/JKFeoFPtRFjXD2z68YaP+Kr9Dut+A=;
        b=kuDH6dZlxiSQcOFW/kOsBIh8iirW3fXA6jTmEbz940/TWDLMUG+vOImjKmzAUfR6yB
         x5xj9HWwGUjKS2RUXzvhYGfiWFX85kK0WYsMw6ickeN0mN080WXDAleiBakQMnvEy293
         wMCU5THc4sEtfVQ9IFHJWrQv0WHwztdbIiWiUx1dg3NQGfey7B0Qxd61xp5Ut52weyHm
         8vjhozY3NFZJtolzBq8QNkaUDNlbaq+7avkzQJA+5s1498WNCj/REwDeu40twedc0vdc
         dVDcOa+kKspfYuaQYpIpKXuL25M+PGerv8XPF0JyvsNFp3jt4Ud/4vuMSHv0Jwzw3WTU
         BbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782873788; x=1783478588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22j6kvPQxvDqX/JKFeoFPtRFjXD2z68YaP+Kr9Dut+A=;
        b=bZ/VKoAroPDqnffM9PZFj3D5TbqoYd9wgtYsZt10ubFUvoyPj+rpdpHMRtXDJeBjg1
         Z/sX69UiOzg8P+ZLOAAv5JdC0sXHKj/vAldylSpSufw+xF99Rr6ZjV1flfpaQvk4sfOx
         zxA9By+Mm4Y63zVQOgOmCONhXlsIz+Nr6dBYuWDBrbI2tiNEFJ8xi8hqNszHSwe/lfzD
         mXUjRXvIFQb3gNF5WMCLA7VWqnRpeyrSUMns6q44XMiFKxoKlMGMEzoQvgtTBYEhcDGn
         sVE3P/5Qd/SHBeNDkku/Zd2Us+9NbTal/BoKhgEEOnTocYe+G9IWdAVi6fPExFIGnXax
         jUgw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5e3Kdo17NFDM7z5REiJGoJWe16GyImCmGP97DQhusMWhKq8AUZdY+z2UM5+rVAP/v37HSBtlHulPVU7bi@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw7Rc9NuFt9llbFWhl5YnXuf+ROrJmay7MsMyBR5KSh4JF+xl+
	BbPbSUcv+vXdoPnQb6Y+xGtrdw6t3dvCLnO9CYfOcIH4qz8udbxPzWPOf9oIoCbNar50K8SttQu
	LLCPBBmTid1ZWsOrMbQ8hdj2Vj6tl/tlfM/hpfDRZ4yj0zqBqi9nMV57s9PH4n9SQ/6rY
X-Gm-Gg: AfdE7cl67fsL7Sp1yZlivlP17hXMWzNivZHnIegK/xOApVzM/MG4FR7MlfOOGyBvc3s
	fnILQiXlxMd8b4sd7A0yY/gBYvHNH3uc3Nl17q8xWzuTnrbTnS6u2HYOyCxzOydR01R39B6ExOw
	lOaZpKwiqK8TGB1SDH4iPGmE6mvQSxBpphjXi2WBkpQEvefIeZoiY6FsgFD9/JSIZnRNQ2NNHoJ
	fZqtKGydEoyKqB19XXvU4s9fZ2GPQ9guNlxS6nYJ4Ov8y37hLdp+Iu2GnsGOh+o9LbjfAHS3uk4
	k5Oc/3TtXW+LH573En6jGBx8usLfWIRzVDgaMhwXp28qPzxOhoTUA8OM+Ksu9xrV5uBknv9YG+i
	SafEQV4zB21mi5TIx15blL9Dfy7BuLycNerOFwWk/j5jkvg+TtPvBto+ZhCG4gRy5nbBAUrUGBL
	GKPAg=
X-Received: by 2002:a17:902:e806:b0:2c9:ff83:41fa with SMTP id d9443c01a7336-2ca5a61025emr29556525ad.24.1782873787741;
        Tue, 30 Jun 2026 19:43:07 -0700 (PDT)
X-Received: by 2002:a17:902:e806:b0:2c9:ff83:41fa with SMTP id d9443c01a7336-2ca5a61025emr29556345ad.24.1782873787318;
        Tue, 30 Jun 2026 19:43:07 -0700 (PDT)
Received: from [10.133.33.85] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca4bae1e2asm17087495ad.73.2026.06.30.19.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 19:43:06 -0700 (PDT)
Message-ID: <e807f4c1-b489-428d-a29e-186fc64eb542@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 10:43:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
To: Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
 <4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt>
 <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
 <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
 <vmk6b6cd4jolhisfphgai35eznr5d5uwrhx2qktdwd2qayxwm5@fb2js7bw4dca>
 <837dc7e2-4db8-4a7d-a19f-e53ddbcc9cf6@oss.qualcomm.com>
 <4edaf745-d24f-4ce0-9605-e3971f067b68@oss.qualcomm.com>
 <ao2bl4vzgb3mvqnk2kgvgqnifujbvy6oyzuj4rnvjrv6teyrel@56txzbrtwm64>
 <c0478a3b-dcc0-44e0-abfd-2c86f24db733@oss.qualcomm.com>
 <88b5d0e1-4b78-4b79-b9aa-d6438eeced9c@oss.qualcomm.com>
 <eb0e7827-2893-44cf-9251-a12747fdc0e2@sirena.org.uk>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <eb0e7827-2893-44cf-9251-a12747fdc0e2@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a447ebc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pB9SGBul9zH5g0KS9pAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: BPxqaeLQKeYn6qJ4pzJPs8MUigAMJxcf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAyNyBTYWx0ZWRfX9UkKX5Hc6dyT
 DIefcmWn+q9faGd3ZAMY9sLWWSUZHni8XrkrUZXO1JFULxVNo4vH5igSJK/sNGPLcb7nzsMWg4o
 sd1Iom3ESmfxCfhLTf9TjxPJ7oUUB6Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAyNyBTYWx0ZWRfX/kBXQJiCPweq
 rao4G2ofb4V2rcli2X66UHd7+XPdix/nSJGUiMwOt+WVEj9HgHxF+tACUspduGgzyZ2zYcqNJ3H
 zg7NEQO7/ZnRrdj2WH4bV/+/GahTK1YtCRhbuDt8mn/7Olr+OHWM7BKGF1QlWDssIOXNF5YYRW7
 /Xj1W7eWhhkstgzdz0SjMSWAkOYkIGJbBsEO3l84rcTGoJdomQVNTvAPFtRK/MMEreNbWRSWiEu
 mH5mszheIf/QR1bHGboL35p9KOHq5WEaef96BIU8FV1srDqfZ4cNE1cdACnJXRplWL/xJGwUeBL
 Bss2IqZFwqCkVOetUzwzsmaEg3L4Wrfy6PFhbgLyt8WTrsvwcFvV5Q4C5pkh4IbVO1NfQ9wQtEm
 kRcIpbEQOeohFk4ycriikplg3mvPwFgnk+JOIwTxE0wRYP9urNMBgBAJ3Q1VvBwTwk4W286kUYS
 QH8S6+47p/q6DUi6Gdw==
X-Proofpoint-GUID: BPxqaeLQKeYn6qJ4pzJPs8MUigAMJxcf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010027
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115563-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D11C66E9493



On 6/30/2026 10:37 PM, Mark Brown wrote:
> On Tue, Jun 30, 2026 at 04:28:54PM +0200, Konrad Dybcio wrote:
> 
>> +Mark, would you accept not-quite-a-regulator driver?
> 
> Probably not, but I'm having a hard time telling what the problem is -
> the quoting level is rather deep and multiple levels of it don't use any
> word wrapping within paragraphs so it's all excessively hard to read.
> Frankly I very nearly just deleted the mail unread.  Could someone
> summarise what's going on here please?

Hi Mark,

Please see a short summary below:

Qcom PMH0101 includes bi-directional level-shifter (BIDIR_LVL_SHIFTER)
modules that act as open-drain voltage translators, mainly to support
1.2 to 1.8V voltage translation on the I2C bus between the SoC with 1.2V
IOs and other I2C clients with 1.8V IOs. Each module shares two physical
pins with two GPIO modules, and control of the BIDIR_LVL_SHIFTER module
is centralized on the AOP side with 'XOB' resources so it can be shared
between different subsystems.

When a BIDIR_LVL_SHIFTER is enabled, it needs to send RPMh commands to
enable it and SPMI commands to disable the related two GPIO modules, to
make sure their circuitry does not interfere with it. For now, the
suggestion is to write a new driver for BIDIR_LVL_SHIFTER and place it
as a child of the rpmh_rsc device, and refer to pinstate nodes to
disable these two GPIO modules. However, we are now facing a difficulty
in deciding which subsystem the new driver should belong to. We expected
that the new driver should provide following capabilities:

1. Enable and disable the level-shifter at runtime. Consumers, likely
I2C client devices, will enable it when active and disable it when not,
mainly to save power.
2. Allow sharing the level-shifter between multiple consumers, even
across different subsystems (currently managed by AOP).

Following are the approaches that we are considered, and it seems only a
regulator device could satisfy the requirement the best but we want to
check with you if you are fine to put it in the regulator framework.

A. Using the mux subsystem: The level-shifter acts as a switch, so it
fits the mux subsystem physically. It can be enabled/disabled via
‘mux_control_select()’ and ‘mux_control_deselect()’. However, with
multiple consumers, a second call to ‘mux_control_select()’ is blocked
until ‘mux_control_deselect()’ is called, so votes from multiple
consumers are not allowed and can’t be aggregated.

B. Using the GPIO/pinctrl subsystem: After moving to a new driver, the
level-shifter doesn’t fit the GPIO controller or pinctrl device concept.
It has only one pinmux, and each level-shifter works with two pins.
Also, both GPIO and pinctrl frameworks require exclusive control, and
couldn't shared between consumers.

C. Using the regulator framework: The level-shifter is controlled via
the RPMh XOB resource at the AOP side, which was adopted from the idea
of power rails sharing between subsystems. The regulator framework’s
APIs and reference counting fit the requirements for sharing between
multiple consumers. The problem is, the level-shifter isn’t a power rail
so it is conceptually not a regulator.

Thanks
Fenglin Wu

