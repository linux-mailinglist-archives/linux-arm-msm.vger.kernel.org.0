Return-Path: <linux-arm-msm+bounces-104414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN1nE3Q+62nFKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:57:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9EE45C9A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FDA5301C6FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D6335B657;
	Fri, 24 Apr 2026 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCl2OeGH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hW+VPIxB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B026359A91
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024595; cv=none; b=jCnT+8+2gMv999cHewLdPhpRvEyjibMacW9saPBl+mOMaajyvH5DojY3Fnuqqqa4TRc+zjUEVNG2fpjeqh4efA/AiRDeoM+3uJF3mC5mt0ueXJ1eKB14H5hZjTrBO801O8XKrcTEAZr/qURTfRunjjzfbTSqjKb6BumzDjWsdsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024595; c=relaxed/simple;
	bh=OxsY1NQ2q3ZtwcrnbLGAxVCWFAFAmaNt08c8i3cUUX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojmS3vY4P/ey8o6RXRUm1e1psjIDyO//gBUQY/IiES4zOiYomfWIq+7KmjIfTCqjwk+EgUKRHNy6lKf2iT3GdXyE3oYq/UzvJ0kgDlBUYDD1tiD9NUavqTqfMVy1Uk6zgoydX1jn90p520z6QvvCtHqNCwZfcOIwgAzQMl1zIX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCl2OeGH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hW+VPIxB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7ZAJs4167708
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qi9Sg2XsDgjEFJOWv+3J51hYfzFPN6QZcVkOSlM1zUQ=; b=PCl2OeGH9MzWTa3G
	TFhkOw6DRSHsxewKYBbH4hwHKqp1CyqNW+Iy2yoMLa9lBqZZPpGCRJs+tznDFoEo
	0NFZSmQ4Tg7+wk6Mzd81/8VDsrlsFbZnIUDrugcp6sZ7CM8paBnIA/GnqojsGQlm
	l6vFFsKz2CKzZ06Qiq9it2DF3f9R5acK1gYFO8M+LuwJ2wchWhYQ+u6j+aKE84Uw
	3Nf2de7oUp4DXY3XaaCPPJcvO/tkKWnMQmBOrBaLQuQv1FiIuqm2xUFqC+a7pDJ2
	p4uqAJNZ1ik62+e9jKrhL3xG68zYQy71P7ImGw7QW0M7IwZKl0lA2Mw87XuHO632
	6Wofnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n0nkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:56:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eec753a7bdso112210985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024591; x=1777629391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qi9Sg2XsDgjEFJOWv+3J51hYfzFPN6QZcVkOSlM1zUQ=;
        b=hW+VPIxB1uXTwkZ6NvgJqa0Mtv8+Hye0ADtdVcaEpjEHdPcB0laR7HlWabb+b6D+R6
         Kt9NxhMxKtDNE0m9GSk6vdHkG4en6KKHEGeHi92SFCcSa16AKQARrFXQzoZ0dEA+WW6w
         wJKb+duk0s8pC3kOuDndbkMserTMPgl9PN/PYpcKqobnxcQzYCaG/dNwSQG2CbSTT/2d
         za5Jc5Pcv/Y+E+w54ImO60+Umhp0ajVsopcyzCNOFHYSxIAeuzcsFgyxA5wjKmcGxeqS
         Ajy9NQz+kGGEMuDuPWNOusIv9HFbK/Kms0fBo6AfinfPjF51MxU+ptDK8CTYxgv9D6Xq
         FeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024591; x=1777629391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi9Sg2XsDgjEFJOWv+3J51hYfzFPN6QZcVkOSlM1zUQ=;
        b=GEyoflauDOBYza8+f5mvABc00aokWSwemmqnS20DXe1/NhZij9Obf78c/LbM1CRb0B
         PfLwOFx+w/jzO3oD/+wbztblif+gqn3SJKdinLInSalax/qfxWFQt3q3r3GvoqHZNLgc
         hTLjt5YwveR/eeGaK2Mm6KyBHkNsS4FZmVE4PbZgig8Zr8/WmSyeKzdlw96oYIKvcCf2
         30V2FcBMTcpikYpavjf7+1gcac0PJFg7iQwi8DJxM6bTzO4XA+gbU+y1Bfws3PGlXine
         is3ux4EAS/X+tvF6timA7U67GbahiB158JejbTKrguSRgYT+lz8OQ7EFB0khADwOW1jP
         asYg==
X-Gm-Message-State: AOJu0YzYfNtYQmUigDskWGHHsUcVSfOJgFIWrfYm013Gtgnr1HZ0aqp/
	pk5EhX7P8d8kR7cE9aos/QVlhOcG8+dBLBBof4urmMkSaknE665omYaMlttpPUUKilNX3X06Swf
	TuGIf+92GkuS8Qo6U40N0IsiWEOiIQHgTSx+MdSOZGwqMbtYbSWEwLxrjBEOpyygbG5bb
X-Gm-Gg: AeBDieugOHsOBi38skIZxX36l7Rcp1Q9LImKEolraNXvx8XNYFOa8Ef0GPIHfjL1xGk
	2PPekyBRHovdeqfZQomCKe6BmWfrWNrLhBjFyP0JJLXGWE7r7c8NCnCsqQs5WodS688VJxqfLhE
	UPBEfc5xQ5AsOyY0jhD3fvi3z/L02cK9zWvVLjsTtUgKlNWXxy/XMQO6qeKx4nUrinQAKFgnCau
	9TP223qFT/flW7DuY3XVErgPLhB+DFF0DJaX1BMbTGhM1xP4ZSrAFqjRdyKIi11xx5zU8aETe/H
	njFmt11eV+IrtvpHDVZbNh2pfWtMWOSM2TXCDISG3kc8wHySesYIreoi2x5cZqj+puGcwMwAwr8
	yISx7CQNKhu33LjXcdyrCdRw5b1gJBpDWMB39XjVOLWyLP6bLbNrOu8gMPcyGfFHMjVR2Tav8Qi
	cDtm+Af3HnkHeYyg==
X-Received: by 2002:ac8:7d14:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-50edf3b0365mr188100071cf.8.1777024590697;
        Fri, 24 Apr 2026 02:56:30 -0700 (PDT)
X-Received: by 2002:ac8:7d14:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-50edf3b0365mr188099771cf.8.1777024590144;
        Fri, 24 Apr 2026 02:56:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455926c61sm744881466b.63.2026.04.24.02.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:56:29 -0700 (PDT)
Message-ID: <e1246f0a-f205-496b-9105-8308ffd68fad@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:56:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: add SDHC4 controller node
To: William Bright <william.bright@imd-tec.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ram Boukobza <ram@imd-tec.com>,
        Tendai Makumire <tendai.makumire@imd-tec.com>
References: <20260423-sm8550-sdhc4-support-v1-1-93fd81fea5d9@imd-tec.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-sm8550-sdhc4-support-v1-1-93fd81fea5d9@imd-tec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N4lcr3BF0EngTsCrxBLnYRI20JyJlJ9Z
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb3e4f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gNcS5RXMAAAA:8 a=ue3Lulql8caq2XOSR9AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-ORIG-GUID: N4lcr3BF0EngTsCrxBLnYRI20JyJlJ9Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MyBTYWx0ZWRfX8LLFlKZqAdMH
 u1pk9nAlxQ+ZUuuJ///s7JOPsuZacn100jVijiRXqGmUpRYYBjo5dHZr3D6YapRsZQTxR14J7tr
 1LJb7ua/qmu90nvcgfZ26DDvja6LoNL9cQIodD1yGLffxfMLru3Ch6ixYcHn4MVtGxbqAtMt7/z
 BJcsaR0HB4OMoV7CdQvbYeCD7hF+tE4fB5IG4dA2pvoXQc//UFMpX2+ymoLjDCi73eaTsx6kHbV
 LAvjPzsPhDDzb2CJSEzbQrxfk+a2vpGWZRaoYZ71hnz2VSQbWNEbyZXFLePfEoARWGyM9ZPv4Xk
 RZnpyLlJtja6qSb83qgG6ZW4voIi9b23NiLtN/JV5KEdY491rm0ivHOje+kXog/7n9LLOEHuS8k
 EuTuPRoKVLdiMQW50GVZ4HhloWtwq7uRsPlgvl/DWmByHNWa4IQ2qbUKIIgqr241MFl28SvmPTI
 rrsw3DJhS7l+BGDrg0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240093
X-Rspamd-Queue-Id: 0E9EE45C9A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104414-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/23/26 6:50 PM, William Bright wrote:
> Add the SDC4 SDHCI controller node for the SM8550 SoC.
> 
> SMMU stream ID 0x80 was sourced from the UEFI bootloader IORT tables,
> as SDCC stream IDs are not documented in the register reference manual.
> Unlike SDC2, the data path is routed via aggre1_noc, matching
> MASTER_SDCC_4 in drivers/interconnect/qcom/sm8550.c.
> 
> Tested on the IMDT QCS8550 SBC at high-speed (HS) mode. UHS modes were
> masked out as they failed to initialise; the root cause has not yet
> been determined. This board is not currently supported in-tree.
> 
> Co-developed-by: Tendai Makumire <tendai.makumire@imd-tec.com>
> Signed-off-by: Tendai Makumire <tendai.makumire@imd-tec.com>
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> Tested-by: William Bright <william.bright@imd-tec.com>

(we sure do hope you test your patch! ;))

[...]

> +			qcom,dll-config = <0x0007642c>;
> +			qcom,ddr-config = <0x80040868>;

I think these properties are invalid for this SDC instance (i.e.
should be removed)

[...]

> +			sdhc4_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-19200000 {
> +					opp-hz = /bits/ 64 <19200000>;
> +					required-opps = <&rpmhpd_opp_min_svs>;
> +				};

The only entry for this specific instance should be 75 MHz-low_svs

Konrad

