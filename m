Return-Path: <linux-arm-msm+bounces-116825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gr3QITK8S2qgZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:31:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AD8711FE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:31:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="BlPtKx/X";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TjupSTf8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116825-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116825-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEDB636D707C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DC2437873;
	Mon,  6 Jul 2026 12:50:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AD1437879
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:50:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342251; cv=none; b=rDMk7MDxhH+FAKXBbFXrMbCWZnYL01poqiAguHYqprftKSuciTlBDs+3PuH66BlSsqVgsKN8e4OzS50oXzKRfAqtctThKieHjPL+iDmXr2cdmB0Db4QJGNCYOBHxR3X20duPHmlxUDiI9vVbI7RcEWK3XLI0C+ZEh5nv0sg/YmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342251; c=relaxed/simple;
	bh=3GUFbaWSljl9zforu3BuYQcd30BioHvA/OWZjXRh66E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0FKDKuTlk5sR6bg946JoH8uAOJ1ln41YAI7FJ7wvXaNJc3BZKe8x2wtK49K7mxaFHc8HcdfthXNAGlPvP2sXv25C27D1fiF6iBv/uY5KQ75IYbzQOCKmeaw5JcSnZrugaGoXLUCZbwizW9oZWpjqIWIUlWoFGxK/8YDEXgqae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlPtKx/X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjupSTf8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxVqB361600
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxMrA7grsJIjwwI6lQtydeWlp2h0gCGybnCqXGL1ls8=; b=BlPtKx/XxxpKK7H5
	qRgIwOUpdLlMWv1Hty2Ow1YqXT4FfZHu7hpaxt3FgNrKaijKp5c7KslEiHp7I36O
	CNqEEFI/DPhbgH6F1Y2HWyd6jLtmn/L1kM1O5u5jvbHQgRQKDLIY1OQkuUbQ3JHP
	kVBxE0ZbnGP3gUzi8dPDAkdEmZbnbaixay45JhQYWAYWUHC2JdK76St6ZRvOmN5b
	Y9gcAjZulsOMD+uI/eBcpuzsvnH/hoGRwmwYcWCYiVAiwq6kNDyYZ2yOAxoNgzgm
	rnOtAqgYEStA2gn5f92RmNhKEp59ndqfZCc2ax2GZ5pnbW63haTqD47OwMwxL6ug
	Y+qJfw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h5135u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:50:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so7169381cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342248; x=1783947048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxMrA7grsJIjwwI6lQtydeWlp2h0gCGybnCqXGL1ls8=;
        b=TjupSTf8K9OcP2BE6QRtzJNOzLViN5+TX2+ygGVQ1SShX8fAfkLwFq9ZGKRCFvIM1R
         kMU7dTph/69II2i6QravcZzzisLBdOOpq7I9qgRsUGXXQ23gHCSoCqt5bBbiIBSjz1/c
         /EW95IrEITKp7HKx4Q9u/TF1um6miPNzGEe7vWG66nHKJT0yawTklTWiKvJBiErtKAEZ
         Lobm3pRYA27QnMK1F+/hjlO87HEY5CDlvsXClx33v/XBUxfDTXyesOrjJ+EqZIZz9a8E
         tT7yrGjwiz5uBecOt8lJFXHz5/iewzGBZ1B4pMki05gS5fXsMxdRsRWsYqAfrTrNdl1J
         mgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342248; x=1783947048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxMrA7grsJIjwwI6lQtydeWlp2h0gCGybnCqXGL1ls8=;
        b=d1n1Fu4+8Dp/i3EtENtcvBFTmqW7P7OBZq6bis9GdW+uA/+0n1f3yF73McNGF2eOpn
         IZb9qhQDEbJzumgViOm8VJIPDmq/vhKcsh8+HV9OeGG+xNJSQNTb2Yz6xW5cLtEWDPdu
         KcTupnDtajOTdC9Xuk0xdHbJT/ujE0YDgFA/bUx/phW8ZbnYWy8vuDzZoY2r3G+R5b5b
         Mtf0CO8PKsMC+szF87YACRYiQuT5A9o+g3ZM6rwHUe1u9Xy2Xeyd4Ijpcs5fPFmkobCA
         ExWSz4lRAHVEgganxoyTR1ZRyY8LDKS3as0c9HYtPz6O+Y5nox72ND44tB9xrRoLH7Ro
         Kf9g==
X-Gm-Message-State: AOJu0YzDo9fFyR8oKkrCzxmqfR4gFnWMB/tgUX92/u1JYsmG6n0ImHLg
	/0ld7D0+UqsuLzIVbIkdK0Ia3Qys0MMsLo5m+3Pc13/Z1HQpayVCdtvw8wTLMPTtF/quTzLsctK
	GS6cv8r7NXfYCcbTY5CojRr3sXy2VaXBYjw3TRv4YPFt15P/EnfpkpX29H81VFjEVU10V
X-Gm-Gg: AfdE7clIkoe5VcaSQarIsY4li9ZUNHJ859aMh7hk0HOUpD8xANY35vJdNuZlWpA2mmt
	EMHVxfVnTfigsX9VQYwtygmdFxMkm7wgVJNK3r2oK8u87r5wqLZvSVOZbs8NoFjWhEKkKCC9F1/
	4DW+r7ZVXdEgbDY0XbWH2Dewtda93wDJtXyhXGHDz9MyNe8ObHbirvTVLbuPKJismflQjDJCeXT
	SBg9cHnYwNDoQBPKXKyPGK/c4ZY5LTk1hdpgSIinFxabt+kvKOVouuVBVsTGS66vxK6QdCLoa3D
	ko+M5Opm/2IfLP/ztfLJw7pxSLWkjO0NqT3fMIxMWjP8bWsMHVs6SpJ08F/MWDnDSPRgT4ubXZr
	EwI07tQMhlAw5Y+QNnW8Jlck0MqPc7GTfihQ=
X-Received: by 2002:a05:622a:38f:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c4beeb5e0mr87551211cf.11.1783342248554;
        Mon, 06 Jul 2026 05:50:48 -0700 (PDT)
X-Received: by 2002:a05:622a:38f:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c4beeb5e0mr87550941cf.11.1783342248080;
        Mon, 06 Jul 2026 05:50:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d79906sm4324196a12.14.2026.07.06.05.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:50:47 -0700 (PDT)
Message-ID: <91c2d523-206c-49cf-a368-1ec9f864bd35@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:50:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-7-776f2811b7af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-7-776f2811b7af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r6li3MXdJem4dGZU4_xa2EsmCqw0OjaD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX/LZmoUYzluhB
 0Ci9lJAWW19l07M6IEUhzoHmXDuBbsTodYIC83IWRZwIGtMeVgt49uspuMn/Zs7GqYPyWQDywjK
 nRotYl5EZylGWNBlDK9+VMv8Yd3YLP0=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4ba4a9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xUocDvRE5Z91C_HALZkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfXxqQN0NVZH0D8
 MC+1A6M2ZtaplSYqqQbSqV7badE4eHOhDKdEdjrwRvuO/NEIAr9KnKvoYALwYVz+Fi+TuEUCfIR
 LBn14qwiRRG+Q0S4cv4obHNePYiDfqc0AgXoG6CiP0i3/morg57mjFMjNTWj1s6dB2s3dcR3ZnJ
 Z01+UrZ9yBlK7RiPC63GezWUWYWHIxZwbOnt1Z50zH5CpyZZyy9ffUY6AHIGHZlB/0ezHZvTrxB
 FuJohBkdMQunnFCqan7ys5lEdC2ix3kOr92m/KoFAktcTzzMwM+XP/sQyD89aZWRv9vvN8yh5r9
 M4TTpCO3g+5eaXji4DUR3RzUEIDiwOzApjXu7vEreGQePhm/pp9wMA90r2unhkaRKGOJ8eGQql3
 Kvj3D+JWTriAAKX5P3SHBv1T6j/RAniAJkA+oEqAamCxo5yt8rmAxYxhYIpp3osGoIM27UW9r38
 OxZtoY0j0eIGoYgSIgw==
X-Proofpoint-ORIG-GUID: r6li3MXdJem4dGZU4_xa2EsmCqw0OjaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116825-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4AD8711FE0

On 7/2/26 9:36 AM, Qiang Yu wrote:
> Mahua has a different QREF topology from Glymur. Override the TCSR
> compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
> LDO supplies on the CRD board.
> 
> Unlike the other PCIe controllers, PCIe5 PHY on Mahua gets its refclk
> from the CXO0 pad directly and requires no QREF clkref_en voting. Hence,
> point its ref clock at RPMH_CXO_CLK.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

