Return-Path: <linux-arm-msm+bounces-114652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PxpzBEl0PmqNGQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 14:44:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF56CD1BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 14:44:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="n45RY/qB";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h0LF34Xo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114652-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114652-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3179B300A643
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE633F20ED;
	Fri, 26 Jun 2026 12:44:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822C53F39EB
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 12:44:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477890; cv=none; b=izosHdaCZajX/Frhsq4l0gFJUKsBE1Kk3uFuDL6Jwgr3mB/7+dGOEhRpStReMpT2q+zWMsl65I5vwrSETI4ttSexr1thkYfOt+1oFi+6o0qImBaM/sdvIbYjNi8Bn1xrdeazvWK0govtVyDcWKMC+lhZdmD2oTnISfMU1+mZA3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477890; c=relaxed/simple;
	bh=5ocgwha666hb1emqnCLiMPvr9KBVYGafjhTuybSGP6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oo3P4oV/XplCJRZNGP8v7wswzmR/QpwFx/Sc3aDW/P+K0K5G9BTw+TCD20r02dbnkArqmYF/VV7u5Cgm6muNPDK4mbV5yEcejlDgmn0eSDpGTyTg8T+vCMNA8vUvWPvfKM4BlxlkKEspQKJ3qicQUUNLcX3HS8PN7OSGQW6Wpnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n45RY/qB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0LF34Xo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcdjQ561396
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 12:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2kWKuth+1KwqzAoiXa5qvD4gDmK5gvceXurKgppeBc=; b=n45RY/qBbEjvRV1c
	IglFi/8pm4Azjh5+HkDWxwyY4n317qAVrrIpUxAdT+2judBrT5VpxMfyNvYT3jVO
	2rjVuSj+2daCR0wdpHKvaSJNMaAMwm8n7pR8Q+DMCmVzg2BEXEDLBPib2w1WixWv
	Oh43/y2B+ylvBQsT5QENCPJ8+FBxla03SHrxKZA7rhPdSgrl55iUON913An1nChu
	LwrnmA0iSE1mTB2wdAmL1uB+SOeezX/9Sl3/PSOwEmbT0UUkua/s7c6c6kkLB78V
	afRxErpGlwHgiZMFh9oRoWl30UxJopgkOfiqRYA4z1KUJzCGlKDZYkkoEG9WxvbQ
	D+xlVQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdtepb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 12:44:47 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9691c46fd36so16057241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782477887; x=1783082687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2kWKuth+1KwqzAoiXa5qvD4gDmK5gvceXurKgppeBc=;
        b=h0LF34XoZme0ddrlRQCec7ktm4C0gl5t/zXLrtJbq7RFnEMvxkaw2WXewhSHJAClWL
         YInplm2+pKZd4tq5js+cT+CyVdSXRzgaG4vQ3hvQyfZFKSdYmhy0UyUWQFLdgPqyLR+7
         GeO0rAH8gEzMQf0069ApdVYmAKwwAc7rOB1ihCi8FJFsM+mQ/84UzjRn0+MlqWzJPBUf
         qW9JhHFA0S/Z17Kr+IXHWfNXHFMZY77pAgxxMtN1mR5KTKCPTN4LetUX8N3PA7efdkSE
         v83Yrlwf0Zk01HgbmsTRxcxAyx0gbYDI4zLP0Z35Pk/1btWWsHgj5L7ZUv/DPzigeDpe
         wg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477887; x=1783082687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2kWKuth+1KwqzAoiXa5qvD4gDmK5gvceXurKgppeBc=;
        b=MYBUGsgLzO1HaABdo0pGEBRRnPj7Ihw5MZ42Pw2G5+/Vo8vS9EVxjQ50YcuN8dIYjm
         YzXEzq0+tlOxGTGaaW+BOTIWcTEW1F52t9Kcotic7M8y12JmLIXssz8Gdcs8tbqchaNG
         IQ0snHMfHkdVQWXh6JqGRND5RLYjyHILSaTQWtK0bhJLBoAyDQAQIIvSbWoHpXLcVZR2
         nTEeqP8OhgcJDMW/0WiR2NXMZWm8Saz4mS8FuiI76erhPcmRZIM1E2LYBQVbOUm5kVQZ
         dJTdaKqF78vgmu+ZszhqyvthBN3KgloXa5KvYtMpJEggwaQEea+qWyeN1sozSe584zHI
         7i+w==
X-Forwarded-Encrypted: i=1; AHgh+RrXnJcBfATi9Mn+ej1MX5pf5vWJg3A3KuVeuIUAMISxEbjJqE6qwynS1VN2LECCWzfe7KEuUSXL7QgezXum@vger.kernel.org
X-Gm-Message-State: AOJu0YzLm9sA0YXzrjW8iw8LGX53jk3BlGL4H4GXfzZQHbXv3nunXY66
	/QoqFwKAIqXV7T4VTgfe273U2gfMXABB1KSn055r2CvpF28AJKrJCR1r0p/Ryp78whq+J2scO3a
	Fud4iDe4WIkh8iR7B1k+QeEQ9MtMv4urtfkzcENHv6IVpIzltyZ0sBZNaefIJqQ4Ser4B
X-Gm-Gg: AfdE7ck1UVY+lXbZdl1x+iZXS4p3KZOuq03sV8sKTMR3C8vCfXeXdpTKzzqPq5wmLcb
	oOhBkNlU8YuaJx7mT6/m0OgVhCIjyqoZPhXO1uBc9MICIP8ByRFglq36dOk+xdJOCB1fss7E/XD
	D63RUMfn7pQJxe2oGkestQWvfVL+gW86AotaX1Ys/w8mtTZeSnJ83vq5s7Mqw8I10pZu2A9lIHt
	o5tTbF2muoFxR2dazZCmp78El4kcMTWaDNDg1TIODKi33caqUpWJR6Yb7Ezv2MMXvpIj9FbVm0G
	kXbXouOOWXVsoeUctH+1VMh6Z/cAN3FEbPeDEqmJVmwvMmdmQqWYc5TKbmxly8AF+FubIzZMQRV
	DHrJkCsbLGE3UCzMoshAGbd6SjyzpL/M0q4A=
X-Received: by 2002:a05:6102:304c:b0:726:c60b:e9d3 with SMTP id ada2fe7eead31-73435c8bb7dmr1118166137.3.1782477886910;
        Fri, 26 Jun 2026 05:44:46 -0700 (PDT)
X-Received: by 2002:a05:6102:304c:b0:726:c60b:e9d3 with SMTP id ada2fe7eead31-73435c8bb7dmr1118161137.3.1782477886463;
        Fri, 26 Jun 2026 05:44:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ae59f1sm2715096a12.8.2026.06.26.05.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:44:44 -0700 (PDT)
Message-ID: <fa55bf2b-fdc0-48cb-b865-58b7b6de7d6d@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 14:44:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/19] arm64: dts: qcom: sdm845: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
 <20260624190830.3131112-20-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624190830.3131112-20-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3e743f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eJDSHYLt-8gXCFyzMoYA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwNCBTYWx0ZWRfX8e15GIpN3v7s
 MwAmtvF5ojqSnVaYdlVZHFWh6UqpEekkRiODywKKm9wJMP7ULBMtfy4YZV+VP5s1CXziOVOLQ3o
 w8GXtTFe6Xp9AAe/bgxxKlNrDfBqc78g+sqCgUaXROzy8Uc40AVt9YHmJagzl+llFMR6+rP32ro
 BIr2qSBiwSZRS576YjZpFg9DQnRPkRQDCqHro3FQxW6S9e9b6wFeF39bCCRy8HjhOl7hHLMTCfg
 SAPDLbrcyZQ3OdleW39LVTx5G/pPR796RgxbLzF2TMSgxySibHl0gD3efvINSWo0YvkjDsIITwG
 KgjbKZOP2CvTwZ8wGs29PDg4+hcII521/JgsHGkUrNbKsyXmk1lI92LVWN1LDQHFqiQRNMbFOgl
 32DP+TUb5nuHSaWiXAdpgjNNxaWXc5RoIV6Kf+c2aPwMCq6uX6M4kVC4vMd9qQWmKfGOc3iUuDg
 xJ/xC9VrgBWZBpigWmQ==
X-Proofpoint-ORIG-GUID: WiLJ-fPdSTkXOGjHpYteo0Wikaa08z4Z
X-Proofpoint-GUID: WiLJ-fPdSTkXOGjHpYteo0Wikaa08z4Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwNCBTYWx0ZWRfXyaGNGv3KgllW
 ehfFZXP6E12WK5CD7ff1sDnunmWTyNYKsgx9rlku596qJxYMXExzMVnluRuBg35zAAYRTpOXx9I
 AXcCxZnMSOMirT7M6Hjm6G22AhGYRHs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114652-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DBF56CD1BE

On 6/24/26 9:08 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

