Return-Path: <linux-arm-msm+bounces-115338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LeNvLfiJQ2rXagoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:18:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 682556E209D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:18:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Whmv28Zj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BjHz+qHy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115338-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115338-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CF05301EC4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661BA38425B;
	Tue, 30 Jun 2026 09:18:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F171E379EF7
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:18:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811123; cv=none; b=Z4f9//lNtTYIL/u642Hlq1DzhOGZxPJ86GscdLmaPIQw+TqKkWP9T4j+QXd9OrxPvu6hLHbjxF1w6e2TmUifgnGOXm44yrs6k9iievjHrddoRdylMAa9BS9q73i38lwNoeJvq7LZrRVaCeRrxTnYv0JPPlT8CjWoJ7x5trl33rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811123; c=relaxed/simple;
	bh=h97A33tgci7azywR6E2y9jr3oVS1b940BBla8v0DIXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iw6JTN8okqmYlHWSmyhxXKUxfHb4ssMsrfc/bEqVD5Bj+MiNC9KKTF3D0EY6iGEu4DYIXQclNwoWZyoxnQiiwsJqcYd023/DphaQhNnIwsUOMluX6QlSu8HeOxrE3UUy7NZarcrZdm4fSDhraP3lubhUTcLQu6WiuFs3KgCd7X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Whmv28Zj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjHz+qHy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6Cata1056728
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E6tpa3uGi7z+z4oBK4fUuFDNYQuQX0L5/yhDANu3P/M=; b=Whmv28ZjTyrUFq1P
	zQy0+p+3yW6cE6vcqJfLf3EYYrW8DzVL0E8FDRWuNIarhumnKg3mtRogy3AFM/So
	xChkGt2C2PowfnKmwIdBNvHKiheSeT4vfFMdf4QS1zrFdc16JgPmEd+PmHbNMTUZ
	GRC1KETyyjJNw9Ki3y+0GJGWoUYG17Srh1a07DSpjxa2hsAPaePBoBA0thElSfji
	uAXiihgKI/XryTcBkycYZd0VhGhfYenwTqLm1+vTUWcnCYJCRZXXlyPVRyJYdjoJ
	fW4Hqmn1cUwFcZODg2a+C2ICxuGljcrLqUVbWIJVcV5lIJr5LQGHBMXMaZjPJSCX
	SO44QA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46861brc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:18:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e566bae1bso38265885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782811120; x=1783415920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6tpa3uGi7z+z4oBK4fUuFDNYQuQX0L5/yhDANu3P/M=;
        b=BjHz+qHy2qz5GC8ex3a+kV+D1JaG+h6xirij+rGpbXzb/pFA7NPWmX6HCWessf/b+E
         fpMYQ6XPPsCIqmGgDGV8istm79sybaAAP6db0HueV/ADB+6B719WYG6WbDYoA3KixLlx
         64gXUNHsgrmxhMVFZ43dDKlGReXP/RkoEQO6H1HCXSwPiOMQlMz4ItmoIg+LGlsfipJT
         t3gFJuJ7ah8oayT2NdwpSdoL5DHa3/S8ptWyxBbC7ac4hntTw2GEd0Z1qtjHcFGEQ8iK
         MXf1H4iArTrtquFQvFl6MWgIFiOH49vQW6kMM5ZvvGbgB9wXM4NT789KKYSNv1GCWD2i
         F5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811120; x=1783415920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6tpa3uGi7z+z4oBK4fUuFDNYQuQX0L5/yhDANu3P/M=;
        b=ixDak8p7PYB4fT2aSMrkMOWShEFmUqdANhqDP6foMi04S0bhy1MAHqYVEpASoQEBPz
         pEjju1mt09DcQcdJUKlVdiF5U/ZUiydDFpfuKdKuACM7K0NyQFFAM292TqBtJer8L4bj
         EwXWtSI3Qg+OKwc49eytl7ESJNq3vCbpRM3LCz9QRqHZMuEjaltXNr4fAM1919YyblH5
         1GOYQaaK0TobFvZ8TiLwjW2uk1Gdo24PpQEzXtg9yAYgXs/OIopCmmIJzQ9kzqQ79kDA
         T/8j9zaqBoNysuVFNTXYpSguJe/I3I2QAZctaAHY4p81iDhYhoPEitvde2V1FagCKTaA
         A/HA==
X-Gm-Message-State: AOJu0YwhNNPROoFSTLjZnS5D4PjH4Ayo60EQYKAJVmUQigEM/UlC1CEo
	fLKP5wwiycLRZBc6w3WVpgrJPqvx2eQ8SbBIYZ8vVusKpWLLKaq9ovUgU40v2+s7XR7TFQ/a7OC
	xpAiADO0+wUMD1hxjuzzh88UK7yLKbBFDNgIgx9DSdT7CDHZafUpRRJBoYG1pqAQOKcXD
X-Gm-Gg: AfdE7cnZ9EsK2Vg8EPZHPmLcztu8wFquemqEvdH5kKVRjfSuNjWNfHSFGuHF69TpQOx
	icXIvTLTYq4g7reUiXHNHnbP8RPxF2IqzkbeBxuC0IH6x0Rq0pbdFwqM7LxvGekLizKwsSTnXmC
	6vpn6AQTcpgGnLIRiUzRg4pJfEOjCCMbjIVZvkC+3HKxyWFmw9B2ywQUpRnuU7Ilb23lOIge010
	zpo21sNBx+d1gDeAzKuM26RBZWowo4+T5X8QNTkJ7XePPlVr2fSulp4UKDBkEfigvIp7PuCK+2P
	+AFBEUuUZVA1A+2J6OTmhm5BZ7MmJqY3pTfuTiv4wSOKnS6rFux5KLCAPfMO3Ka3Y2bZSKbZak6
	ptS+Ed93FL++moQlRRIPO+lcR8wESIvc8caM=
X-Received: by 2002:a05:620a:2589:b0:915:7c1a:1388 with SMTP id af79cd13be357-92e627e197cmr302560085a.5.1782811120361;
        Tue, 30 Jun 2026 02:18:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2589:b0:915:7c1a:1388 with SMTP id af79cd13be357-92e627e197cmr302557985a.5.1782811119964;
        Tue, 30 Jun 2026 02:18:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ef53sm91941666b.7.2026.06.30.02.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:18:39 -0700 (PDT)
Message-ID: <f9c24109-f480-440d-8658-84033fdcf9c0@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:18:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630042229.277799-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GOFHAHBLmPYv8by90Cxw7E56s2chbnSm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX9/viRiv2pNTA
 aSu7cwGjgU6jjIvyc3GOK1dU1jeyNgzqYmxaegHVLI1fxLa/d0FI95tcw6uYTX+sasc2OIMATXL
 jkUnKjBsMtdpCR2HxeYQXR2oG0n+3IBb6gdk9gyM4P8zZFeJc1X+Ba6ccvy2uFxDiSpUMwDWfcn
 G3ZvrrS4J4Hz4LlTzt5OrV6fxSUtznr3ij/YgQspaUspYlEWWRaNSOKZgmDNuAUORBiPwzx/R50
 yioDbjcdp8WPCa/jdntMd243KujYpnPYKyEHlT097sJvCZzz6a9o3smgtI7QqqfnGl5+xckRI0g
 sAfn03pagBnfjdZcX30Mb+UZqvtnNo5RtoWyBPQeOtOjbfUTGQgpCL7BxtNZ+tEiWpy6Yy1IT53
 YGVg5R46hv2c4S/wYqYhiS3ziVv6zGG58t3BVMhocJtfhAS22CJjsk7/HSw2pOL9mnGZN7UFr6P
 OruAGjaSsucOuYnNuDw==
X-Proofpoint-GUID: GOFHAHBLmPYv8by90Cxw7E56s2chbnSm
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a4389f0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=IGLo0CcfMTApPXQeF_8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX1GcdJhg3beR8
 Roe26vj0pouUDLQTEyYRa5QR2L4FwAumhIXm86wVdmtFweN/ZUDvhKxkwZbD5IBX1NMsZrntIDR
 Gv76umqLrwJm/3zDgCpMAuTTRnknN4Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115338-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 682556E209D

On 6/30/26 6:22 AM, Pengyu Luo wrote:
> DSI panel driver have been added for a while, so add the DT node to
> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
> describes the wrong, no impact after manual disabling these wrong
> supplies.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

[...]


> @@ -616,6 +663,9 @@ touchscreen@4f {
>  		hid-descr-addr = <0x1>;
>  		interrupts-extended = <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
>  
> +		/* TODO: set post-reset-deassert-delay-ms */
> +		panel = <&panel>;

So.. are you going to add it?

Konrad

