Return-Path: <linux-arm-msm+bounces-119194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g7NdIWJVV2q/JQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:39:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE19175C954
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:39:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l0HhCGOY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SYNmD+6T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119194-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119194-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 986C5300B634
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22D53C945A;
	Wed, 15 Jul 2026 09:39:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD3143A7E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:39:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108380; cv=none; b=PLh1mdP6iIGu0q3UOiCczV10a1TD58EG0FAzOM9MeY/DVDAYYEaSCLI6IgZK0e/9W1XvFcJqZuVo5KU0QOzeqISleZIynG1vYLJgdwsmRN+IiOq/o0xYPzf77bGibsuATUCHfyHylCD/GWmZ06g5vTTpoanMNYIsPLZr7iJpwwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108380; c=relaxed/simple;
	bh=ixLEFnjEUnUP/bMh43HQcEjBt/HPh/e2iF0OkDJb3II=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHh8ztmrikHM35WbcYcE6uLDVGbzNFnizm4wAja2OW/Bf8C43QIuoOqHnlt3WTRE4K8+AEtH1jJu1MR3tvgQMSdk2PsrMVRHkt1J4u98k8//XtYoyfHQVOEjNzE6s1sT1PlaOW2XCV1c12tv8tlzXevllnSBw+bKXW+k3UKmVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0HhCGOY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYNmD+6T; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F92kjF160772
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LZXf3ywPBCU19wa73bCd14XBEQ1wKxA94809Eo2JXI=; b=l0HhCGOY6WxYSmH8
	pjPumVNADQd1h2MWMyWzUBX2JbURI9Ce0FaLPOd8AodZ/DUlbSKHyAey7r3+yiCk
	W0t0VGCM+SpQz31gr9+xLg3qIpsVwEF7dG3l0XlUq1ZBBxn751ypJAIaWCqrgrLI
	BrQe3JdzcBHVcbHoqqjA7qx3E2zq9g+INTdx0ZPELYYGNKW3eylgqhBkYFUzPpu6
	+dFT+jDEZ0tp06U6cYKyYIDoFEuxX+pglKRS8f4C1tmIbYjVVEoUFEo/mSUVqN2o
	HLDp/6w7U5kegfmSVjFxYlGcwQ/Kx7eCzeLTydMZVzjpZNZMemdOwqWxZaREGiqg
	ic3KaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wrcp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:39:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ef7c6e9b4so67010185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784108367; x=1784713167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LZXf3ywPBCU19wa73bCd14XBEQ1wKxA94809Eo2JXI=;
        b=SYNmD+6T+sIYCMhF51ZomncJt1AnbCsbc5oIrpuV5qZvnz3xiMjOZJ1l0o1HZnZRgS
         4oFJXPh0bef2pZUzVUO/yPfmgApZomX0EQ7T5s9a0d0rDBc2bQWkpJ67rxRl9q9dwbMm
         FgV0n6YZCe+rVC5NcxpjcG3oviaPQFJUN9OFsa6FoEHIDA0NtmU7b89649M1ui2drlOf
         OMbZkQlDTb8NG2Q7g0FC+0nmwvCQjaTWxfmAm68B6oOOAZaluikhR7Uw602/FOo8XgDM
         wucuVIjk3+jrDOEZvSZnY0VqjOdjKx3QgBX3f+CST8cCoSS81Znfwx9sFv/E3+2muVAy
         SDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108367; x=1784713167;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LZXf3ywPBCU19wa73bCd14XBEQ1wKxA94809Eo2JXI=;
        b=fnWdHxwDYtFLxeLhlVeuoYnfNBLBb0xobP42mrQShUTLPaENQGjeb94Kd8T5JqrUCC
         CIVvFy5ZEXRbnsE1NSRljsQbu76kU38Y8THKI6adsFxGsS5c4L019QzVNOtR3QHb+k2Y
         ScV50/X6dg0F8iJ0SogXsmOZsY8seELSS5fulNnqFL6To2FBK17Sd2hCHUl8dgRIG397
         7+qq8FcsX/uXpEB9jGKgZ3tEFQ64MWmu/IkdnLWgwrlBRLFSAFTfSg5m7/el97L4JeRL
         x/UATV/vXafgDHL+bBjhEmLDpTY/8sYtxCHiFD+kUKejGasZe/ZjblzNOIauvdIxvJ/Y
         R/yQ==
X-Gm-Message-State: AOJu0Yw3Kf5exTcfZXKETN5GnyKFGrv1Cy6XoSjl0AU8UNvGKaXx2jCg
	h/nuUFUEvFinpM8UPBdMnJj8+rO3ASu9JzTlU4pKlSoGx0DUANXjmShfojB9SCVFZyE1QZnLMJb
	/XTuOvI4HBiy7nUiw8sYn1QB2qpG9x71HsVfSoMdNQotLxCjv8+oHhW8RGs5XiHXnUrxk
X-Gm-Gg: AfdE7cko0hgTS4mAAXCTNe3KbI2BOPv5Pg1f7uS8pmfxfUYYwPMKgaxsPEgY5Be5UmX
	KItI3jwofdLAxjYzychLTrM2D5Tp3aL7CWwUX170HDzO0fUEudAyCUdaZvi5eJXQlkFmjFSKbgn
	HASTJYZD4cGTE/2YNrnY3s+5LnJwvZnK25MAfl5KHuKIf38F4XjjsDSv/uOGuVi/AsXxB/3eXYR
	9woUXcFiZTvdQxUhZdTt5mb9MND7g+J95lPfpkAbam4/lJf4TAzp5N14K3j5tKUWCGYKPgb3PVy
	0Y6urudGv3gvnVXrdyCiFp1TQcicq3RluHNo2OkMsfTH0V02I+HybRpjSph8lb43/osF2MenQD/
	enOFIqzhW+JHPJL/6P32T9+4HHUoy/dyTsgo=
X-Received: by 2002:a05:620a:1a15:b0:915:6433:2599 with SMTP id af79cd13be357-92ef2b10cafmr1314738885a.1.1784108366834;
        Wed, 15 Jul 2026 02:39:26 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:915:6433:2599 with SMTP id af79cd13be357-92ef2b10cafmr1314737385a.1.1784108366425;
        Wed, 15 Jul 2026 02:39:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f272141dsm862326366b.59.2026.07.15.02.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:39:24 -0700 (PDT)
Message-ID: <b9bd5d63-787f-41c6-ae7b-8543a7b6c4c6@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:39:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: enable ETR and CTCU devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xx6f5P0HO2HURUtvlu4npj7wo7JzMqRH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5MyBTYWx0ZWRfX8E3NoEtwZV/J
 PObaHHt0CZJRtrAzlz/ybDcN2Mr5oXEZWBco0ryJvZv/67UUh4IbTwIB6DL8r+80XouI3AWa6jA
 q+o+cw8o3pBlQBrN0MDyp23QB2i/1QpAvWXmFJroMh/HSIEsMsxxwNG/tSADMmuA00Ym/XcKW7g
 rmmP2RZmtuB37UjD0u0A8QzAKygGqUSHq5tyS6/ThQIMku/5ho2FX+SEzXHtDsF8SqC6hrSwhGy
 wFfqKw3tpwtrlyKWZngfNOB21CX3V4Mt9STeouujfN9De0kqcOlcjqZgHZz7Fg44cJd6HVhf9/9
 s52YCx3uZqJ9zlNMzhMz2y8TPa3l/ttPtiCCsZ/m0onh6E/KMmQfyqbcCKlm69g20at2QFAm4Nq
 L0gdsdpll2UW7ccRtBG4BNfKOFwWuBIw75hpFDPI+H+m7GC7zbEpxb+9QFG79ptp+WAK9dtqA0x
 MFJ3uBo34CfiNA3x/BQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5MyBTYWx0ZWRfX9TuJDDS1t0It
 DslUcpXO5RtXmIFQ89dgZaaaghlmwodSjA+04NE5Kw/YdCXkv7t/3POxIxS+NYgnxzbmcD4hnsj
 8LfIAKyQxDiB06fpM78/DnDdJY8BhyA=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a57554f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iWN5h_POgodqhNU-qcIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: xx6f5P0HO2HURUtvlu4npj7wo7JzMqRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119194-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE19175C954

On 7/14/26 10:05 AM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

