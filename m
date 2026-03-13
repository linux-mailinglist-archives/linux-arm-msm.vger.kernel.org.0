Return-Path: <linux-arm-msm+bounces-97448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECQrLdH9s2mWewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:06:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFEE282AEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9253302D199
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB463914E9;
	Fri, 13 Mar 2026 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vxc9qeBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yyz5WAJd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B663630A1
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403598; cv=none; b=Xyo1MnVYdQ+1dTqWL+Dwjb1+lG6ZEalsYCZvn2SLuBXxMeEGVl1FxtRIf8wEnk7NY231/nxwlKwYguzZ5cWCH0deBQMpEdPis2FBo1pmy+RIs8lMO2nsodv0RgCONlZVoDnZE2A0Buh12huaQcXEXBQTlA1MLApLJbzFMu/5WTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403598; c=relaxed/simple;
	bh=23loiSD4kWy17dc1xnugREgMOncTqNm+7+iUXu5avAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aU9spKxEDczWxCg9r/wnEJwnKk+4fc6l5YxhYUAtVQVq8BTi0DDryPmUw1fKkve0NMbuSQqoOXGudZXoy2bM2dwJuruHJaAzcOTFY0wsktcGnhi0QQyQHZAtllkJDC2fw/CfgI+hvEdER2wUXpkk8ug8TD1RQHBRFhdAYBoQndo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vxc9qeBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yyz5WAJd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oKc9792852
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mwQEs5gWC7r2dTr7np9eDA3UalN1FsvttnNPRSI0KI=; b=Vxc9qeBL//V13qZ4
	OscVAsLZcGyooEJpvN2Yk65B4lU/i2u89IY2TsI4vkdWBDDdkd+f2UsUPPIB6YrS
	ZNDXyyHQ0r6pJCEtYWbX6dVfc6zV1O7SPe1ZEuBdMR3Gpzi5IC1L/RwwdjekVplu
	NalS7C78oJI9UNo0oHMUrlV0Kq0LVbt+4JWkN2Lezgf3Pi9Pa0Y3SfSXS+84JLok
	VJilf7ZcVTjMuBoEQ3puQaQmXk3rEpALiGZ47/HBUtkHvaVMW0lJf6T5l+rcoX0d
	0kaW19TnA8C80yeB82ElXC5K076C6f+Eo/KUimZfAwE7MytJc7fnVeip8mYTQyGh
	cQFlOA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt12rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:06:35 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so361698137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403595; x=1774008395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mwQEs5gWC7r2dTr7np9eDA3UalN1FsvttnNPRSI0KI=;
        b=Yyz5WAJd2ooB+hic7HPLWKkXUyicIOZzehvmGaN12t6f5Anay6vJ6r09Uu8UO+FcQs
         HC1xQ+MaaH9xAjF/ZHGt0Ii0WKpWG5ErzbzpltDjCuFHpZcJIgtQpahrQmrH/Q+SJxtf
         CLMBMhflVfsuB0FUm9cMptTr4y3aycP/4/5AV0OLbEh+EyNAYzq/zewoPZn9mw8rpHQS
         FaZmYu9AJN1nQykcTfzFKE+fP32GmTh6zQgX0KCr1A3vaavqJ+sxNSH2884tdfl8M1iw
         JIOKrJ2YBQjP/TyFrYidjIGdwYZXWMPotQgwbUnY8mEAP7rQ0ndDuSXYUrYZLtwow41j
         lDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403595; x=1774008395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mwQEs5gWC7r2dTr7np9eDA3UalN1FsvttnNPRSI0KI=;
        b=ep3TrERITJWLinHGzEItQehp1TZfa5iBV27LELyAq9XVRT8UNzcUGM0MWg7Yftr+I6
         D8rvQkPClEwV28XlKmw87jrqh5Jkl8Z5s67v+MbjYsl+GotfQvu1i768e9LpAQDU1GYN
         IUAUVYlUs0rbjCcOlnrZH4ndvx9PdB+Ng0Q1vy658HYp43Z4U4k89BZgYhuWYMdBrC13
         Ow9Lz3vPvpDXoVJ1EXdmimLflPB0NRzQSB5ZySYqoy20HVGnp44rnOjHmeT1dJWRWC69
         fM5WjvZRyOmM/R/cPSmtiFh5cIbGSzV4AzDeWWMekgld8wiCD9V5UAyc+hFEneYq48iS
         5Q5w==
X-Forwarded-Encrypted: i=1; AJvYcCWI3uK19kZoQT6r6PH0V+IN6Eqg69hT3sy36xSD2wHigHz8BeWWW8qgMbefzqppwnJOtjDhjcCuJAPKtjUh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc3YYYIpQ0TfR4evdwU5kDjwGVxj+SqQkDSCvIjBbIQ5souuXc
	LBrw28jgQED3ihkSkI9vQ1MZmG/M+yVsBeTajj0ac6p2WZFJmYtXOnoI6AXQPpTPBaoxG4HiAmo
	kGNYeIISfh7qqhp8LpN1hQLT8lhNYO3sgIWNfuO2u3PDOZTcKwZ5BtTE9MSj6bQqP4AXb
X-Gm-Gg: ATEYQzzyT3A8kTFF8uGAfMRQJfps5Yss+8dm3R1QZC5J5ml1PrpbjlnQoKe9L9WP3CS
	hn4aDSWVxQtSCayjjSozl9DCpn852fvq0/DLAzDRmg7eOlyXbqTD+5DJNL0KlVJFhuCAtWw7bD8
	as4EvvtF7JQi6UjGcXY85pPQSdnlcDYNu1i89fgqG8nTzdoxhxaBfcldZ6rLE0v4RWCZPFnoUrU
	Uo9/OOsXIlgWZKo8s4BLZyowQZ0PsUHrXBjfMPAB3g5R3rvM0l9XSD6GJsowNX4mih6SCbQfRb/
	BMi8LzWfwa3QqjqJdMqYu5FbuFtHHjvGTtwU2ERLHO19M0mkTxe5MP8HiEUl/Mb81YfhCyTyhZ0
	boHN5ZkVgy0ZILepe+X8Eqj2E6kbnNNWZ7QnfstfyY/Zj4OU0Arl2ih/u69VOt7P2hFfVOt+w/B
	fksZ8=
X-Received: by 2002:a05:6102:2912:b0:5f5:3a57:1e88 with SMTP id ada2fe7eead31-6020e58864bmr524731137.6.1773403595011;
        Fri, 13 Mar 2026 05:06:35 -0700 (PDT)
X-Received: by 2002:a05:6102:2912:b0:5f5:3a57:1e88 with SMTP id ada2fe7eead31-6020e58864bmr524722137.6.1773403594514;
        Fri, 13 Mar 2026 05:06:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba6e96sm41623066b.2.2026.03.13.05.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:06:33 -0700 (PDT)
Message-ID: <70e9a500-3fbe-42b5-8ea3-87b417c16064@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:06:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Mark l1a regulator as powered during
 boot
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Joel Selvaraj <foss@joelselvaraj.com>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260312-beryllium-booton-v1-1-59c83ab91b78@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-beryllium-booton-v1-1-59c83ab91b78@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b3fdcb cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=SXj6t1vWLU9fDgigrtYA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: P6vkbLl5PGOUV-0b32tpVOwgNzXeRR2z
X-Proofpoint-ORIG-GUID: P6vkbLl5PGOUV-0b32tpVOwgNzXeRR2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NSBTYWx0ZWRfX+MmAB8ReS/qx
 nNeMUFYQJRrn0uFxfITXJYuzv8bQicAkQRzEJdDZzNnPETCTalz7Q8IC/K9SmHSBEhKz6q2qQG1
 4RdBfXFNUIU601P56DlfiVKjC2Dm5UG9Ag7KBcLucf81c1yHBzPYsAhPZbktPDB31cnLyP9ozc5
 4jvdfG8X8Fkm2fdr0B+ZNLiWmmUgofT0HdMHLc2PnIU7+BWSoc2JkEiGpUo5eadQnpXF2oJ4mJn
 rqxOtPFOZQYsGHaNmyfHi0LJE3RlhCTQrXvQq6Zw7bJU90D/pgOdNS5dUvaSFyN/zss0tD9/6p/
 hucS7IILWYsTRxMHe03J3bebJsS3eN9Qor/2Ay6/KdyhYU0q2xb2h8iWHm7zAQ6QV5h8fem5kZ2
 JkJ/XHO4J3sgrM/sryqP1dfsRxiwvLb3UT4zUBf6TpqzsYL2jeRH1gNEN2E4EF8Jv1HsViNACbW
 8Li7UWP6WrJEM3aEWgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97448-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5FFEE282AEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 12:49 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This regulator provides for the display subsystem, thus must be on.
> 
> Fixes: 77809cf74a8c ("arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

  regulator-boot-on:
    description: bootloader/firmware enabled regulator.
      It's expected that this regulator was left on by the bootloader.
      If the bootloader didn't leave it on then OS should turn it on
      at boot but shouldn't prevent it from being turned off later.
      This property is intended to only be used for regulators where
      software cannot read the state of the regulator.

While I believe what you're doing is okay, the commit message could
be interpreted in two ways:

1. The regulator must be on, since it provides the display subsystem
   [and therefore the bootloader had turned it on before Linux booted]

2. The display subsystem requires that this regulator is on, so for that
   subsystem to function, we must ensure that it's enabled [by Linux]

I'm almost certain you meant 1., but please make that explicit

Konrad

