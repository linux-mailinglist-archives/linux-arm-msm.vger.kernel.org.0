Return-Path: <linux-arm-msm+bounces-113420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UlE0J4RNMWpQgQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:20:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5458F68FDB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:20:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="G0/g/S1F";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="d1ws/Hsl";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113420-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113420-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E4BD30237C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6838F314B62;
	Tue, 16 Jun 2026 13:18:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D9F2DF3F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:18:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615921; cv=none; b=HDIvEjEpUAJrK0rQveswoRN554uqnRt2aPX7fmWQrcI2yBqzMgI8z4PyZvKK0jS5Q/C+KkyCezXhIIGOR34eKNLQlfZnVsgrBv3wS8qnQHqX2G8Tp+VCgUDwxBeaokd/GEyzFrLgIvLoFAvTQELEmP9C31UO2OVMN/fJYVNxBu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615921; c=relaxed/simple;
	bh=9HKmJxmZbh93QuguriSz9qxa57OuUO38rdnI+Tie/HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KzrKRommmvsRRZ6arwI+byh8NzmMiFlaybpTIzlYLVgYMPPWZDqiKVN75ZutuunkoIl2idyXLAuBkEMxb/Yw4pW4rk1gvlpHmwcHau3FsQc2Ra9riXRWKtrhsdNzgDjxHNosWaOqltWd9H8zqdoo6yzILehflfdjpLrETJ0yXEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0/g/S1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1ws/Hsl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9QUp249149
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9r9d00/B2qPIrDcuZ6MLi2lkTJhfEfUMswMZ94qwOYo=; b=G0/g/S1F3RkQ2tG2
	nw8qT2t0cucXgZWclNl3UHINwKevRrmD4TavQdkQiwAoIxXJjhM2FzE0oWd+FS1Y
	7FCEwE6K1f8B7UV0L2IhNvMhvaVgSDBgGDYMnAwYSBUgk5EGqFbGlMiAm/QOsIM1
	IggCqDKuBO5enz2+gkwjuuRLB28My7fI0A2NI0WlPzjDthg9u7496ydS4u8Pistd
	CObDyhABaGph0GqLu6fieH0RBLtbp8opSLsVCNrQxU3crLO72R6R6naZa5S7Y4Mn
	StxInZZsM9/ooqgPev5zKOkOGnCEsrcaoTJLiynw/tBpnNVNfgRR9OwHD9/xZQ7w
	tB6bdA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs97cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:18:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9158ecbfbc2so34861385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781615919; x=1782220719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9r9d00/B2qPIrDcuZ6MLi2lkTJhfEfUMswMZ94qwOYo=;
        b=d1ws/HsljIVmpx38xkw/y/5RbFQNujtRffm1Gd8jx7HtEU9fPcIlS+nLNgyCK0kMNH
         L2XK171qBHpHx0pGN3DjVfCTu9bQysgU2RHEw771VGX8SLmkghnW90myFXzqxJqyxXcv
         HG78eejYieKUON61JqC1aMu9xmq4qlFb511kXXzoGVONuBw5LiUm1OTtVg2esStmaiqT
         0Cg+Eb1poCuKszneOveGkWH3p9NvwRfOp2lt2FhpbwPggBAmg2y9EWr7dzS3cLz1MzJp
         zFEk91z3RRWOhB6pGGwnH85LienID9oyue7ZK023sxk6MR/JPaOZWqWMyapyeZZdgyNz
         1FPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615919; x=1782220719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9r9d00/B2qPIrDcuZ6MLi2lkTJhfEfUMswMZ94qwOYo=;
        b=UY3F6IijztkEJCJoghPZRZgXyfbyfPfLUIeI3VPKOLc2R57UV7fPu897GxEn8W/550
         PbtZib59JD1F64hKuJv2gmN1GBPb5c7vVdePbEf78VYqKjRV90M3F9F5kY6UvVoz6qYW
         mhEfeD/6VdeIRK6SqLDLPScKA6ft4ET8unwWjpOwUvOKnQG/0uYCs+s+bR2TejwQySiw
         89XSiUbyiYXC30BUxs0g5xOW3haETvv1bRxf5HqRPeNCrBPCrufeE1JpfndSBzrhTnaZ
         SDvmNMFDMtSuhRbO0gTJvSNnZeNwb0xTuN3UU2su9SrXLcXs/lJrsVjPeWmhDuFiD3iR
         +ZgA==
X-Gm-Message-State: AOJu0YzgFfOjTalFM8b0UXB0P11ZRW5lcSvHYLGp5juWaXuUkqUCJnW+
	/BaROU6fHZA0gJmF3Knt2/vHJM/N07L4p2xTSa/FJRpvcDg3yLfMknjjCNnsJUWqtGFvofZC0wk
	XSiCf7h61i1kNxfPxY4cW5ZD72LgfSSRIPByUYHMyLF+td/ke38VjwRYgmrR2JuCu8Ltx
X-Gm-Gg: Acq92OEypXxqnuRBBAISvos24WUVSutyS4a42Y4eZDtGciDwpyjplq8ZaQIXXtCd6rd
	gYaoHOuOOVwY5splagE0lBdhCzZi/r3a9qyiCtI4ITtIdI64ZeabmsrskX43l0r/Zhcl0JQxbdG
	8DWo09dRLcLU1/M0y26XxyS6RilYwEWcJ7hbVcHROziazJTk0uPIJwrDTpq5q0pcOxwsaEdrWId
	sYxggKb+RyL9RdMXoNLJZVI+IpICQlSNYADXxhqahRcEiz005T0SmEnvKGSi3qONzj7UmL9fOVB
	6tgCpuHIrwx7FDRqvsWGaL8CcUS+Z6vydmgcRQ2+rD2zR4pbHFWbM3icr9KuUCoHb5JZxY4DSqb
	8KDi2J27Wmi4K160qVLZ3GrFd+0dNL0CXSxwn9oZRYpemkg==
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr382850985a.3.1781615918693;
        Tue, 16 Jun 2026 06:18:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr382846085a.3.1781615918102;
        Tue, 16 Jun 2026 06:18:38 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16a0fasm3532627e87.20.2026.06.16.06.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:18:37 -0700 (PDT)
Message-ID: <e6dd7006-bdec-4669-acbe-2c06e87cc781@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:18:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Add QPIC SPI NAND
 controller support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        sadre Alam <quic_mdalam@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-ipq5210-nand-v1-0-cbdd7492e826@oss.qualcomm.com>
 <20260514-ipq5210-nand-v1-2-cbdd7492e826@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-ipq5210-nand-v1-2-cbdd7492e826@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BlUr28akcG8T8zOdaUVMy_41twfPIHIy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzNSBTYWx0ZWRfXzU7/CUILAYkE
 I0AfoyblboJh6GijZfYicJfQ2nQ7BA74im1uubD1o84NYqhmIMDvSd/hpRQ5lorlAnQHjdq1Kkz
 mZzqCk4nYH34w8AnCXFXwLdusmcKCmNQOC3j1V2gWn2xMAO8V/mpHnRT92c/+nf026B2h1IAxQs
 g1HsQjzmjepbEgJuZRFvKM5nLgBZ1h/cXQBoIbkm6AbLUD78cF5K95C24GXjuSjl8//1GJ2nybx
 lgukrelnUB6HrimCeHSNUIcfWOVzxp4gSD/vWX0a4jACKMJ1jNbEP/dUrQuOaJAO1J4DHsHQhY4
 pWqvck0TZ+IYyBmnusiCRDmAEMTTdxmN2Mzrtm1v71cPC/fylKl2fBztUKdr8TMFSr9htPL+1nE
 5kTMvgBH4bv9eI9pZAqsGskg81Wnzpn4oeO7jdlUNs7of+tnqY3QlzrZ2BwGz4NIKXRxog0r85k
 ZBf9SMdIDqrc1Wcrs5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzNSBTYWx0ZWRfX4rgd/Zv1LADv
 Ji9FxAydLKjA7Mf/5blGNvqnhT0feerfIpaZM9R2iDjopF/4sePayIkQeT8gDReSBGRw/l71ygv
 cjpN/B4axK8GTbosvctuZ8eH2IOBfD0=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a314d2f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Ju4C-FNr2R-pDinXp-kA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BlUr28akcG8T8zOdaUVMy_41twfPIHIy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113420-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mdalam@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 5458F68FDB6

On 5/14/26 8:45 AM, Varadarajan Narayanan wrote:
> Add device tree nodes for QPIC SPI NAND flash controller support on
> ipq5210 SoC.
> 
> The ipq5210 SoC includes a QPIC controller that supports SPI NAND flash
> devices with hardware ECC capabilities and DMA support through BAM (Bus
> Access Manager).
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 42 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 29 ++++++++++++++++++++

Please align with your colleague's submission for similar platforms:

https://lore.kernel.org/linux-arm-msm/20260306113940.1654304-3-quic_mdalam@quicinc.com/

->

- separate commit for SoC and board
- is the BAM host v1.7.0 or v1.7.4?
- style: clock/dma-names, 1 entry per line, please

Konrad

