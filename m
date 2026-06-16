Return-Path: <linux-arm-msm+bounces-113421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 28tmAexOMWqYgQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:26:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8423568FE77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:26:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hYo9RqbM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ARvP5JP0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113421-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113421-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F02E33025B80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4869132D0FC;
	Tue, 16 Jun 2026 13:25:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565EE32AAA3
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:25:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616359; cv=none; b=ayfqA+EUyQrD3MkPNIooXfSs9kKYTqPF5O2K7IVe+SOt2eNLj/dGT/A8Qi0vKVbLSO8q7mnxfY985U/f9Ed9DwHnUE0N5Q2SaBDasx7QLFtwpW+NP7EUutxneQ7EQsJoMn6chkTgeOvYN5qMR6J4SfGv1qOAG22Uqoar9W0GBJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616359; c=relaxed/simple;
	bh=Ioea2Y3umLF6KJsfs6zmlpUj+peP8XvUMDhOYe7LilE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYupXCjOI6A0d1wTJ/YXZ/XaLJa1gK5FIK4m/6wvKBKyiGF7u5UhnZH8cKkX9h5g5Wg0SUTiKtj1mEegPcOz434vYXIp0RfvaBbcBw8V/98PwTKVNsfq1jY1tyn4M4eUNUSc67CkLu+JBIPlbRNjmAKCKNhEiMusfW4rhSkzOGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYo9RqbM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARvP5JP0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC1Yl3256225
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MwjvuYt5+PoE/3vS01HiYTn+yCCieemIIEOSQmhKM4w=; b=hYo9RqbMS797uCiB
	/BtjaAezFPZN+3L4jWIj/VY79XiFj+X27I/Toe8k0yupi2+jkIB+e7FqIbh1bsgp
	1Dd0lwvfbng5qskjlg1eUd+5FNo5ZfZPGz0khBpmqMl4XAdq5PjulXHtv6Kl2Vr4
	AcM2AW71p2HjfW08bjbEdBekSI9gquZ9+qg9tK50VOMLiq/lJmGJdzLHfuG2KhHw
	zkzWv4TFzTs3jpfdwInL10WvnakotiRvOcXOICIbmAbOQi4jVEzxl/cpAVn8AIAo
	n+wi8IqUL05KUcTHJ9y3Fa2rUK18bjuG9aHlKheT1INWR2lR/0bYEBFEXTplv6cc
	6JjjsA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9yhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:25:56 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c9239a1dccso153320137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781616355; x=1782221155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MwjvuYt5+PoE/3vS01HiYTn+yCCieemIIEOSQmhKM4w=;
        b=ARvP5JP0maEXTG/Xsqk4lbDxr46E8JLtMbIJVVlhEQoOpPe3+lljzOPLcySsc3YBrI
         g7YtMvrl3LM4Kt4E+84SYFRmhCGFTnp702CdH/E6uUCIY+A1h+J0XhP8ADe+RSZJlwsN
         MH0PVrjnIkpAEAiP40DXibmlzB2H2iS6F5hMGFClDaUy0h8SbRLj/UQVeAD7jrQqkM/B
         Tkt4uiZ5XfjwBy5OO8A7u3DeGm9wtJUHY6sjsgu05GcnuZmTEoC2TPGBB78xeFfDkxNW
         LIAecNkVxlQrDCgg4asMe08F0uFpmW9JxCIzRBvQ4HxjfLsp2UsqYLWRzbEI3XUmhRjz
         UHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781616355; x=1782221155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwjvuYt5+PoE/3vS01HiYTn+yCCieemIIEOSQmhKM4w=;
        b=BXjtb0UZBZyzTLVVZHNR6JIfSr4WZEX+XVsisH7eC771JfPYbWHo2qmRK9rY2/AyO2
         tLB/kPSzAfqQUaNcxYRaoxcWIuLrIgIndcI2sRojGY7QwtAB4UghaC6icDotolQ7rXYB
         P7qNMzH6URusTLL/8qLk0qLDoP3qWqbg1bYvyEv08ZKz3W6poklCJ23+tz0ep8deU5Ep
         FJeiS25GZpdngC4xv3mY0RlQrW+kJ3rBvy3PUGmUNp3zqnyY+5c4tbEOuu7/TQJbrQOx
         Caq2Ebiz4yArmZrZuN0ylmuJO4/0Hi0ANGO9aUy+nFyUQyGZZYCQQj4pQZA/Y1zUjjpZ
         7zBw==
X-Gm-Message-State: AOJu0Ywi186XBULTxyltXMdpnMfrxSIC3oidfUEtk9TXSeIWbyi2nRUF
	V/xlW+LcKz74SJyibGQIdX65s1btFv0lzQDD4YzBe7cFZKHuw3uYKSNykmHMqhGmVqlxW0pYimV
	PMB4qtsySxE/BfhDZYQUNdQhwiuzLpoo/KB1FJz9jy2ydrrMp3FvNZTz3MoZXq+WUFEsT
X-Gm-Gg: Acq92OE+JpeMtRpNulwKODBAyTvYC9TljCgQEg5X8qrU6M8vft/wUeqJ9vv7bk2jFJU
	rRZn/MrlHvmn5jYvrs7FmHcdJ+N1ORZu+tcBnUAGIPacfO8NTdoUmrx3mgBYngr+RnNt7fvK86d
	9LgtA7ardr3cG5rAj5XzYJ0+B2Ne65NKJl+DKcvaOFIkF6Lwn5MBS4SAM9UpBorZlfCCgAcaa/q
	Qh42ZQTS6BdftggsSNohRn7FYLxyiDSaBE/iZ8W1/+lQOAWXw8BMoHsR+a7up44ZBYiuZ++CU7s
	vMPCabsANAdG+QDZOSEOZOK3FGsKHsd+K3wGbmlxvE4k8+aOnXrgkYl9hwO+fdtwgwJ56rD7SFO
	DsxTAEtE9d+GWLLAR+bZE7lgIA4vG0HnR2pQiHSbwjzxtgg==
X-Received: by 2002:a05:6102:3912:b0:71e:1c56:e79c with SMTP id ada2fe7eead31-71e88b60f45mr3018649137.2.1781616355595;
        Tue, 16 Jun 2026 06:25:55 -0700 (PDT)
X-Received: by 2002:a05:6102:3912:b0:71e:1c56:e79c with SMTP id ada2fe7eead31-71e88b60f45mr3018633137.2.1781616355146;
        Tue, 16 Jun 2026 06:25:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb844060csm641401666b.46.2026.06.16.06.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:25:54 -0700 (PDT)
Message-ID: <fe3135e1-8d47-4797-80f2-e929fe59948f@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:25:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sdm670: add default uart pinctrl
 nodes
To: pabloyoyoista@postmarketos.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-0-c5d51dd96ca0@postmarketos.org>
 <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-1-c5d51dd96ca0@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-1-c5d51dd96ca0@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzNiBTYWx0ZWRfXz/3RNVboSv6F
 3n0XtUPrI9iE5aK6y7WUykktub+WtTErQyHImssND9wKHZjACMWkdJPc+ZgbpBPy2Y74aKNPOyk
 6kRFQWSy4QyeXYhhrNUatJ4Vbtp6d/w=
X-Proofpoint-GUID: w8cNY3iWptZ0a78cOSWmiEdX9IZinXOG
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a314ee4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Gbw9aFdXAAAA:8 a=FyMMustK1Au6H1ATeJ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=ODZdjJIeia2B_SHc_B0f:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: w8cNY3iWptZ0a78cOSWmiEdX9IZinXOG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzNiBTYWx0ZWRfXxh8bIPzEjiCN
 BR/KPVd75fezuRHlPR/gNi6EgzWgW1d1gCno9G7D/HBwjJ5dPpPZe3X3ruEsJQGFdEgK2CDpBDZ
 qxmXlluetuu6cDDWX50YzkowYFxzbzmtFJfKyuBiH2C6v/oSQfkCe6sQTF9R5HitApoJZP6f6Ra
 ecOl5RhlAADtNvGmrK6EqvSzV6iNFVnvz70/XUJF2px0qM4eHvtyLYlZpoqwFkXj27fWQBS+LK9
 PJ3SeJxzGQgLLE3PdBGIoJoVETdg0n5imRvtmghz0eXY9YiToI1qBevBJbaJGb/FJePy5CxtD9D
 bkYvwrXd6gBfsUxkHTgBMO1C+xFF7OIAGK3Z5VV5HVtSZ07wUkyZzvfjULnDvYt57E9bjVEqI3z
 zZyUY54pHc7jebe8WWvYbfIKGqOHMyy1hPV9rQA+1p4Nptert6wNEPkucvfO48bRN8QcaPhLBj2
 n4x+vZreFYgauCGMqHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.sr.ht];
	TAGGED_FROM(0.00)[bounces-113421-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,postmarketos.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:pabloyoyoista@postmarketos.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mailingradian@gmail.com,m:~postmarketos/upstreaming@lists.sr.ht,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8423568FE77

On 6/1/26 6:55 PM, Pablo Correa Gómez via B4 Relay wrote:
> From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> 
> This is a pre-requisite to enable UART in sargo and bonito. Values for
> the pins have been taken from sdm845, and cross-checking dowstream,
> where available.
> 
> Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> ---

[...]

> +			qup_uart0_default: qup-uart0-default-state {
> +				qup_uart0_tx: tx-pins {
> +					pins = "gpio2";
> +					function = "qup0";
> +				};
> +
> +				qup_uart0_rx: rx-pins {
> +					pins = "gpio3";
> +					function = "qup0";
> +				};

Let's drop the unused labels and let's bring the default config
(bias-disable + drive-strength = <2>) to the SoC DT, like we have
in glymur.dtsi

Please also cross-check whether the pull-up you enable in your
phone's DT is actually necessary (and whether it's defined as such
in the vendor DT - FWIW it's not in the sdm670-pinctrl.dtsi common
one)

Konrad

