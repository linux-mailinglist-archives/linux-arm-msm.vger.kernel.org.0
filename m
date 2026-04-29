Return-Path: <linux-arm-msm+bounces-105249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Go+J3Qn8mm/oQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:44:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 032FC4972FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F0DD301AD00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B55388E49;
	Wed, 29 Apr 2026 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5m88xAs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIGeSk0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A143859FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477034; cv=none; b=jNZaYwHB/f8rKz+oD+hYEQUrz+tSfV9C/wlmtolNIW6qK/XOQO2xI0OI2BvC9YdJP6Le6x7uToe/a51CBHt9tJA3WUcaQR7eGau0+75fHI92IefA8bhCj6fQfPZ9yZoolncBy2FnoSCrMPN6TrBDRLqnwP3DVaXtDJ284iqY5O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477034; c=relaxed/simple;
	bh=ZcFypg/iBdGOtUJoMDDi0uJSfpc3s+lAHkhP9pI2G5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGBs4+aZwT74iPJoVTqXff+o7B1FDL96xh14f5LObThbmDH60VeUHXIqXFI8kAm+Kzns29qYV+ZhaTWM6Fz7jAxqLWv0IA81S8h3wJz0bFAHInIJpzFSzDIrdM6r/e3izBzLhvXQ4ll2rQZYBzb9oGz9cFeyn1wUA3ghvRLAKl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5m88xAs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIGeSk0v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TF1iM12095332
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QCzJG1U3gtHMSyMO3pqR881GCcha8Uzwk+QlLR8h4Tk=; b=B5m88xAsD6DN57Ez
	E7h6ycOi5W4o29U50EqZau+EFOpZBC2j9Wue2s8g0/W2viCCnwlRfBKBAbrZ+AOd
	gE/wtdb+7byiot1ef5T2XCYAK7h3fF044Fuqnz0bawQcXb5knbDOH42lWcTKkno9
	EPe6M7vuUoISg5qxLb4B268EI3wBrGBT4w8p3ksz0TjjwZ6CajvwGnMnObvg0Yec
	WNvsWJt/7gxUi0kdHXMQ4UQrS7mtx3AERg4E44ITuoJlBGQduTBWdVBstA19JsEG
	f5OAz8rdV2Xa5pvCfPlqUzlIYSa2Y0d04bqzLEfbi68V3PIBv4C3FRMRv+Cx79sx
	b4MymA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3t03n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:37:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso16142339a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777477030; x=1778081830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QCzJG1U3gtHMSyMO3pqR881GCcha8Uzwk+QlLR8h4Tk=;
        b=iIGeSk0v1nQ0GLNmz3k1j0ifvnYahfucy5Zx9G7veg639h8luBIpltBgRN3VMCbUBf
         UWtSAWC6EO3KyOA0ykeZBpWuaORfkTXNoB0QG8EgEDSg4ahNZtQf0cS+v/dKkSvbHQmS
         vynhmyihqUen+QopX6AKigLUu5dlv/spmPALIghETdD3ysIGNPNnJWvBpwTDC0catfsA
         XqI3fi8XihsiQlGYa+Rn4VmWOhn/td3/xSuBge6TszA2RyfGOboI7Ompg9IaKXH+aHEp
         k2EPzjHI5QQAW0GvajSR0iSi5kRfYZDO55KO3mcg+TWX54Q+cXq57L7gxzEU7G4PDmzW
         sP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477030; x=1778081830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCzJG1U3gtHMSyMO3pqR881GCcha8Uzwk+QlLR8h4Tk=;
        b=ih268JUjU8eKQadEZxlilSpFa5RFTF8LbTrkrML2hgTDlFK1adu6rpuf2EfxwdBqTx
         QxZrypSDn3GqxrsPUzkm1+sVMkOtC8Q2mSQSrW1Qzx9k/4DfZ9p3Z4iuH3AIJpdU1zHt
         UnvkPrXEodJ0tf5TGTXixeJZy2yZ5658l/+RMegDjzFcuQEgZPgM3j2pN0Qe9gdCZgxd
         29+VfTfN3p6JQ6Mc7AekVdft1CgBIZhVjUoJXTk721WVWeExXpINHr2+IwIfuo535v2Y
         P7b9MjdbCBdvBLzNj8EFxfnZ6w0ksq4SmAqC3f12VXI240RM6BavxggRSVI4gtg/qlPy
         obFQ==
X-Gm-Message-State: AOJu0YwdE/ebKgT06w2KN/7cFvTikDssYhWLzLxZR+oT5DC08wO2sKsL
	Ea9HjgmeTjyQDxUa81dJonypOkomLSb3Ynt6e6N9QMnIyUrTE2nXbTDAO5dcb4fMqQK1mSWDhPY
	QDmEh/Mxs5PXQrr3WMkC2BjPaLLnP6H6hbe4ZQRhGeJfHwSQHB/UuwZYlFgWGWClRT/DL
X-Gm-Gg: AeBDievvyBSJRvbTPn7GU3p/ANJHW5PebHEeSnzWwQJFX1ph3QDnRR7C7S5fWc0+DfO
	WWbd9dHQyo051qz45F5rT3gixCv2/vXPECG/8jO0DFjRlnICPBF9XkJ9LctiZw7oIJssAKDB2yI
	M3wcUSrTBTC2lbCBOQBX2a15IxNaNh4Qv+EJ9lhLsIA1V+Iv3myiMLqXPWPWtVQeOfuHEuu6DG3
	g8EMFj6/QZagbqZz5BnRZkJiTWOXEK5K5tfyQoTu4r0qlPn6TaKRC2hE1YRjrEBhOnDKWx4TdGr
	jEC1hbt07TkJJGRxiOKmWPU8dzhWZK3uAl+aAKN4s8L9x+TeM9I0gMrJ6krOUi7XQwDpPkYg3n3
	WMsP86svg4/g7OJ/mrgDXlZLzHFWinFwIaAOlTmym/oYYJRCdu43ZYZJ4MR2WZ5LgAdSSf80tjX
	Wf
X-Received: by 2002:a05:6a21:6da7:b0:398:b178:a53f with SMTP id adf61e73a8af0-3a3af584611mr5355585637.40.1777477030134;
        Wed, 29 Apr 2026 08:37:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da7:b0:398:b178:a53f with SMTP id adf61e73a8af0-3a3af584611mr5355561637.40.1777477029676;
        Wed, 29 Apr 2026 08:37:09 -0700 (PDT)
Received: from [10.48.22.70] ([106.192.167.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506e51sm2868800a12.26.2026.04.29.08.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:37:08 -0700 (PDT)
Message-ID: <5e2a4d55-49a2-4813-b497-367487174e64@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 21:07:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
 <20260429-ipq9650_boot_to_shell-v2-4-9b0dc3d1f3a8@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260429-ipq9650_boot_to_shell-v2-4-9b0dc3d1f3a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5RNYmxF66eqSIM3cM_DMSJnKaUQJgwHq
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f225a7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=zcCrjwgepsyxNXemSX8evA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=LsfjrspxSUTcLO_nfy4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 5RNYmxF66eqSIM3cM_DMSJnKaUQJgwHq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NyBTYWx0ZWRfX/BreVA9Ushx1
 +Th1TNS/IqEqgVMoiLuMxhqj8CWmyPVX2llUA71+RdZZb/NJx+/+8zWGNnHMjwkqIa5GLJ8M84U
 7H77DqyCoz2MkyJQgZRUwTzml5fkYuo+gxckhV7WNyw3Y0KYhf39tlHsYYu6e36RXKMl8zNdInB
 4rG9N4ZGxZrsVvGLfXH1DHCI3qDzHRI0QXk59MvXxRH3VOwhHdtQkWeuJkHVhqttFGIw9rac2SR
 Vsp9maMgc0oxNScpwjXya9V/94ALS0lDXa5OJ5dBTgs2HA4zEitoTlbz7CXPwcSis0A9UQneQdW
 AVvBx5nR4dLCYu5V01kWOKfFt1ccAtPY4M5FZc/0BKAeZpFRag8TLBy5/AwpoRkuhQ2zhaaRD1C
 lrkNlsIpRNfQaSP3at5oHiXk2LXezMbLroNh9zURuULdf6f4QmDaGyUfmjCkzOm1KjxD4SXMbMq
 +Hs8ZEs1YS9cFfpvY/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290157
X-Rspamd-Queue-Id: 032FC4972FB
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
	TAGGED_FROM(0.00)[bounces-105249-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/29/2026 8:54 PM, Kathiravan Thirumoorthy wrote:
> +		qupv3: geniqup@1ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x01ac0000 0x0 0x2000>;
> +			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
> +				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
> +			clock-names = "m-ahb", "s-ahb";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			uart1: serial@1a98000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0x0 0x01a98000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE6_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH 0>;
> +				status = "disabled";

Sorry,  I was careful enough but still missed the \n. Will take care of 
this in next spin along with if any other comments. If not, can I take 
this up in the next set of series?

> +			};
> +		};

