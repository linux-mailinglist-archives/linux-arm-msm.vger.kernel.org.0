Return-Path: <linux-arm-msm+bounces-103267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Eb0BR9f32m5SAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:49:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A9290402D5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2794E3004D04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171F933B6DB;
	Wed, 15 Apr 2026 09:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcfNbZNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUf/V0A7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65CC33DEC8
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246556; cv=none; b=fF6cY9H2xWXUIUmOFogygbkScUBQ1qPIosye1ZvnIcANG4ggtK6ouHwogA1g7rGZElcdGNHX8IMFeoVvIc5sj3Lbzn8eE1N35CS9e/98Lb1Y6ZaScVayn7d38vlw/7kvCY9wePoNlHJ+aEWQiIUd5TASNKTQxWV0rBh1EFAPVCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246556; c=relaxed/simple;
	bh=QKpaqkhXVhw3e6dha4xFZ1hNG1rBhcfaP4RE9kuyYqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BL31Sdc9jv14QeHnhOd43Houb6s22GC63L4fNVEW8YBg7ruTDoFDojQf3hGG8eSAvVBPQ9MfezFQUb041L08qFgeiI0+wSTro0PM07FKSNKXZU2XdXPi0u/T9EJ3WR8iXfmDfbol9hW9U41rgDEr4GKf1BfPVdGLe5U12+M/g20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcfNbZNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUf/V0A7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8lb4G2005592
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KIzUYLQ0tR1nBOwCy/qt9ww/9VJu8w749s+dTlb0dVA=; b=WcfNbZNymh6KGA6R
	1kojeyZJ6XrqR+3UUXo6qMnCEgE/DZXEiVOL3AgFUxlL6cEWdzAYCvEd9CHVefbk
	FV/w0+6QYPqfuwXkMzCtM2p2RSi1fR136ZSV+Gv+mzGJxH+1r+xgldY5sXlSyA4F
	rfh2AzlRGLFL6UMC0V7A8aCxF6Pz2paHRwadfcrDt4x3fMPNppfHUnLd0eQWnqRh
	iVJSUW/3Jk15gpRhhIvbjy8qBPRfHOgaz2n7GRIQDgrBVNfLCRWfhhtFZyr+HKl2
	F2K8g3E6rgE72G0UdCd1y5qpDUz8GkuuiJYcyxiFFBvAiK9z46hW84M+xu3wH+HQ
	GSRg7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsju61f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:49:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfe29579d5so142629185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246552; x=1776851352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KIzUYLQ0tR1nBOwCy/qt9ww/9VJu8w749s+dTlb0dVA=;
        b=hUf/V0A7utTUW3U+e/FoRwfUpMrrL49zs7r1JFIeI6uVO6OCs8RDwkTi7fH67tIkGj
         JPosl+DrhQAQLi2riSiWyrWLW5V8k3WsFqHbxhBplZSmTD5Cad2GmqwuWXwaiYDuyRFe
         KBIjX7uAjhPKKG1QVXT3kxObdGnhMcS9xwY1sv2OhoirQNJve8QR9joT/Zol3Ox1fQkU
         qlI7sz03o4HHhQLjyujC7THcxiDxgZDo72EeUBPYeZYOfnQ4conhsv/GO8Ev14grRgO5
         7yF5TVguuEkpG9SRzG+LXlscM5lYyzxfmVv3cgJOX9l8M5vF+F4y4/meF6H1QYe+ky1H
         BreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246552; x=1776851352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIzUYLQ0tR1nBOwCy/qt9ww/9VJu8w749s+dTlb0dVA=;
        b=XZAjntMWJHSmUp9c2pNbGboe9ofvM+E6pgZjuGdMkA4ircHoVfAUILc4FnVDi8S6n/
         2nX4Gl/VPeolEt964+LOhja2g4dSktHJU3CgAaxqn7tH6kGNf1ghYqoQf5jhE1AgPOOn
         Fy5lauA8pAc+l09SB1cQbVs823KTAQVG3MSCv0++plO8ntfCqVbU1SO97esTRq1QGQsH
         9Ipsm9/J8CiqgoSeDk13eGY8qtjyHb+YFASqJasguHhvmou9wMGgpN+41mWBfXlB/Xqo
         iwMxy+MXavzbbJMekrLadJH/4158mI8kIN2pCtPiljj/M+8pPK6gryiC3EdhZuSuT98q
         GxSw==
X-Gm-Message-State: AOJu0Yy1aOFbVarWoasX2EZmKDVsuvzLJ5zcnX14FQ1fW4r2VWKirWqU
	Du1b4wTPGXev/bj3Cu0Btm7bIQVwAzoxL9V8wbIQq79m/UgHPkxaPjTHRRzSG9WBKmHqK/4EYnK
	FmUBsX6otgUnO5tGdpMfRpdtJ0KR3cxS4W8HUs2OzfCruc7DUi6pJ/qNeA+Fbitjjsv9K
X-Gm-Gg: AeBDievFc7GSI4vQF9Mu/O0wLgSsh6w2c/JOORehyaoxdzKvkf9tLmNOwKRwbcR7AGU
	buUEW3qsmXyewWkTkVg9xDQDlyUVl0pkVgI93XD0IJArEMWi3iXl84INnQq4niX5ZVBy1oSSe4H
	B1rS19pk4/XWkNsYJkr2d7qJdtYgQxhJZSWX7IE/dNxLyOCIbRZeTHEEhknXMUq1tj7khczq860
	LwWsoBadTDckClvv5coK6jzLWm5m6Eoc0GqL7aKQYBmD6JEijJyBp/6gADGY22Arn3nXqjOnifQ
	GlhDIvvHBx/ItOYT+oiH4ecVSbRh/UXibaJMiDSRVzAF+/xhX+pRLVFQ6KJonpxnWob7gjmKNsM
	xCKxG2VGKbouZpb+riF0265+2hEwZviiI2trZ2mtkWpbTWzdmi+FWaEak2GJTKvvoCYywfy7JzZ
	PuI4JiN+OoOZM9gA==
X-Received: by 2002:a05:620a:4511:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8e4cbead971mr170719085a.5.1776246552261;
        Wed, 15 Apr 2026 02:49:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8e4cbead971mr170717185a.5.1776246551857;
        Wed, 15 Apr 2026 02:49:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d79258sm283300a12.4.2026.04.15.02.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:49:11 -0700 (PDT)
Message-ID: <e89cca9b-e67b-4d5a-aecd-6c2001d079ac@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:49:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: talos: Add QSPI support
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
 <20260414-spi-nor-v2-4-bcca40de4b5f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-4-bcca40de4b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69df5f18 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mL5Sac-3cE_IzsZij1IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: lq-Kf8mgPYqzXD6G64dB2lLzHVNKYjNL
X-Proofpoint-GUID: lq-Kf8mgPYqzXD6G64dB2lLzHVNKYjNL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4OSBTYWx0ZWRfX+2S1GtMkgqbZ
 qTYRmw65klCNNOURYAh0mjEU3++obO2DdGw5r/gP7ZCpqLHPYfW+oZKwpvr15Upr/8l42fQnf9e
 kgA7cPRQBgvg7kOTnh4SYtNB6okNuVaWpuhloOgEw3w4zgJT/uTM2w6C9fvvn6Egq1HvL6nnqYr
 +k/TPrS7+19e/Kf4B7+Eab6xlQ7QXdwBS42/hImKOAoiiIIBGlZx8Epzu1hZAy+IE1rs1IcITm/
 4i7oOlZny1l+M5/gkCeGUx5pWtP8JeSJfPPbT7lcbWgDN65ro2rNflWBMjjJ8Zkazk84Zs9l5mM
 I1IG2wqjlOHAsIWIWFQhHA+VUFJl8T8+9Jr/eAyCbV/HrQ6t7Q7j7FQ7gtvk/i6L/uxapxfeqaH
 zgG38D3Ew4QszWQ/4ro1ilfHlUHG+IMsmZzzWbR+Iob5P/+qD1Ylkit+I9Cxat6+jtUuLV34X3l
 SbJ4v/NPncbTUeg2fXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150089
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103267-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9290402D5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 7:08 PM, Viken Dadhaniya wrote:
> The Talos (QCS615) platform includes a QSPI controller used for accessing
> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
> the QSPI controller node to enable support for this hardware.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

[...]

> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_QSPI QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;

The qspi-memory path _must_ be TAG_ALWAYS, since APSS may collapse
at any time (which could drop the vote in the ACTIVE_ONLY case), and
a DMA operation may still be ongoing

Konrad

