Return-Path: <linux-arm-msm+bounces-113357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K9cWAHcdMWpXbwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:55:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCED68DC14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:55:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CbxBq71T;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WKOMD2Bm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113357-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113357-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CC3D3050A43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E360A42314A;
	Tue, 16 Jun 2026 09:50:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7331421892
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:50:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603433; cv=none; b=S3lDzZfkN8a2OI5lBJQ7/7nliIQLamCVMgXml7JZBcd7G/HD6w7/R14TSXeVkV8JvG3A8aLIXAnPh7L9k428Mko8nlI7baXtC4qtbuC3HyUw098rLNNDVh+uRUQoEd5ogEypW45MBU66/y/J/M32bCWeu53wPUJgpUR8YMxwKes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603433; c=relaxed/simple;
	bh=eoMATAuaff4rpJuBp0jfLJflfpP07L2+HWCSQU/Or9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7dy/6zdRlWNMOOk44VeqfPLNlKaQQuzRsqEk8KRwRjLP6EaGMSGNORR0SKG8ZZ6XI4T4KFK83Rwr5QFihcZbnGapU8gzJRx3RpEYIKUHpLJk8ts/eRhVY7qerJ3ut7ThrYxnI6IYHQH15CoHA5tWSgta4hG5RN0lcRT2ZX1xoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbxBq71T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKOMD2Bm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G66hKW2893889
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NQiZZvuAbKBvUjZbZVVninjgYcEiugRsy2ygB3ZkJGs=; b=CbxBq71TeX+Ekoak
	Lr+ynkoEdj1zcqidsrSn38QeNLWeGOhqyeLtPPjgMaB2R7oPqTHWJYcZLW3g5Zrf
	Bezo7TbiQ7gA9HopG3BD240GOrzcfZuqT7DI3buVjY4QRP2BlezHoorSJZGSwR3q
	luNynNWBCKe/zxxZdDg4E50cctV5BU4udfdG54GgR60x1tI/vy8vTLAhRhpsnDL7
	XyZKFran3CkRogVc2cBZCFg5MEg5EfU1ARnuWUXtYhB9RtlvBaZPRCJ/s3EAeSLn
	LM+xmccP7Nq+UCBdD83Am2bCRq2EKl7LAf6Gm/zYP7nL07hfelo0epnkHJrUrRIy
	+228jA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhnkbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:50:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156dc90fdaso102198385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 02:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781603431; x=1782208231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQiZZvuAbKBvUjZbZVVninjgYcEiugRsy2ygB3ZkJGs=;
        b=WKOMD2BmWDmjOJeAwZQC/XfARCm9ugAHfFDp/Zsf6KooblxTg3EXb5cipNZ6G7B3+Q
         k7/eAmwddxf6DiKp7V5bhbLrc6/ZDz10uP6tCPyCT77uI4sGyk/9gH8u1LF8MUMnidX5
         QhIIsuV2fRI5SS+R1YLREQYa2xCiT3Xc7DlVTtYIDBE297ac2WlpNHXgHc+2Ld3XHRjk
         hEaPHXjaJ7/gNXWa5J9lJWD89uuFCGcLiXYb+IIFd8YubX8NfNCioUY8t2QTEryS/WwR
         yAfbqmytgsH45yz+58t7/mTT6zt7t2Qd3xXFjuQCcA0ujae1r2v/Imiqn2Mld0Xx23+F
         v8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781603431; x=1782208231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQiZZvuAbKBvUjZbZVVninjgYcEiugRsy2ygB3ZkJGs=;
        b=a0c/LihykwysnbEpCjTsVUFmzfmN9uHkYZGBkupjCpnD3MJf/AWMLnK79UloARsIqE
         hHoieMouAFco2c6VlXoDaVGBf5FGKYk+bQnq+5CTB2/0NufnMbYnC7cPw1UjkFP0G+Eh
         2vt9a67Ka6g0hX7RYYxUkNEs0GWkeHD48BZDoFUy7oWvL1j7jbv69e8q8cx2L008mnwO
         YG4hh04YsnClWZbJ9rdm8Xs2doHtV4oVXrWRDaQ5sL+uqLb5/yR0H3zM/Nnxyisa/pzY
         LQISxxQm65SnrAGl+WR3F/zGI1q0VaN+QWHj8aZzQH2hXwa5Ggda72TfMv4h30ceHDr3
         ebIQ==
X-Gm-Message-State: AOJu0YyK7Lo0Xd9pVmjtuh2KhZO52/7vD9YvH3cslClReLqFz8VjVdYq
	mfb6wGrIEL+Z9+Wuud/VhEUFTgGSXzuP4frhEwW66tVzSt+e1SBBTrRtZb1KNBJitnhZ0slWtli
	cDdLs8mHZ7uCESQYSDy3dnNbWPWgb/ZK8JVpQHB1IjgTstVbXbZhyP+ilq4FGUNeEBGceRyOTrY
	Cj
X-Gm-Gg: Acq92OH99rSgfXcO8dDqSMx+LrdT278hT+3SBcZ+zCivPwYSdD1q90gHzjQ/QQwW1Vp
	AArEFlvigq3Su9GhTUpXtaFU4uqG7F/sKSfL6MfhkHkADyEEoFY5QURuJNnDA3d9sxb/vYfIXUj
	yo1SZXy5Agt9kxEEWRCik/794pJNMH6iXYMDQgU0dOd5PNydo5yZxcscbEn3qGIjCqQZX09Om3q
	fLHuUNgvst+oNY5vD9m2WRhkG6Bzd2VfXlYNjegN+cPAbDvQ2IBuqnTgygH8z0s3wMtXPwW3huX
	cZ4iIW0fRHVDN5ip9qmkEKs7hIaC+qt3WGe435/GBAgQ7Z+fcr7Pe/WSJ1DiEm1d1MMVTnu1bey
	bQwwrN2tnO88FxgooIxB199OpL1S4x96n2kGELRZjCjFkjQ==
X-Received: by 2002:a05:620a:710c:b0:915:7a64:cb68 with SMTP id af79cd13be357-9161ba94318mr1786716385a.2.1781603430918;
        Tue, 16 Jun 2026 02:50:30 -0700 (PDT)
X-Received: by 2002:a05:620a:710c:b0:915:7a64:cb68 with SMTP id af79cd13be357-9161ba94318mr1786714885a.2.1781603430509;
        Tue, 16 Jun 2026 02:50:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b22136sm630904566b.15.2026.06.16.02.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 02:50:29 -0700 (PDT)
Message-ID: <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 11:50:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable
 ethernet0
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5OSBTYWx0ZWRfXy9ColOifBpUk
 9XL+q1yRem1H/jgXNtbXl/GR77kGevkKH/yeEj2kQPdXIZq1Ux/3WPmjLjcT51dge9RHuFVFd7q
 GJIM6w2ZimT+ynNlFwMtSeTS2HdJjOs=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a311c67 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=w1iEB-1klUxI70mDNfQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: mmWUGV1k9qE68_1TYq9DObPamYn5yXZ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5OSBTYWx0ZWRfX1V2AsqTMwBBw
 CMFzgIUeT4c4uNdtUpV5Lq0aJAX0HQf1c6LM7i0QADco85xGMk3gV4lZkq2gGvY6qOyknLjO8KH
 KlWWYhEgYl6ynVublkQtuIos+U0hiZ7pNYV6Cg4oroZMaQQcsVdooSHOSmTLyFAf00T2wX10jzQ
 p4/ZKnJelsfb8LMNLvT8RPaDAPs+BHWHj87Z/KKfLKeGsBVbmv99nN8Lw6WtV5PG6XfszmML3m/
 OcyFJ+hxpPDQdFpFOc7yGeHJ9nlxHDRCr4CIENUfcrvJfyIN4ZmZ7W3IQr88KohATHuHAF80Ro3
 wiCfYkHAwIfc/UekNonn7x30X7ZsjWxw+Qz0CJDU2T3AHX8vwocf/RCsTMwQOLzSolvAVUsgIh6
 5gFJ4iqiAPaRRXAqODYpDt7qOyiaRsTdtLWAiE0oaHlCftPzqi2fX2kgizkobJVNfkV0+xzGDor
 B+v8uMvf0I0h4r3rKqw==
X-Proofpoint-ORIG-GUID: mmWUGV1k9qE68_1TYq9DObPamYn5yXZ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113357-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BCED68DC14

On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> Enable the first Gigabit Ethernet controller.  The board layout is
> identical to the CQM EVK.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 119 ++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index 26ff8007a819e46bbc9ffa3dddc6fee6530a4a7a..1f2e4f6dd7cca436f62ba9f09cd328e5a2079095 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -7,6 +7,7 @@
>  
>  #include "shikra-cqm-som.dtsi"
>  #include "shikra-evk.dtsi"
> +#include <dt-bindings/net/ti-dp83867.h>
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
> @@ -60,6 +61,92 @@ vreg_pmu_ch1: ldo4 {
>  	};
>  };
>  
> +&ethernet0 {
> +	status = "okay";

'status' should go last, with a \n before it

> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ethernet0_defaults>;

property-n
property-names

in this order, please

[...]

> +&tlmm {
> +	ethernet0_defaults: ethernet0-defaults-state {

s/defaults/default

Please move this definition to shikra.dtsi

> +		rgmii-rx-pins {
> +			pins = "gpio121", "gpio122", "gpio123",
> +			       "gpio124", "gpio125", "gpio126";
> +			function = "rgmii";
> +			bias-disable;
> +			drive-strength = <16>;

Let's move drive-strength before bias (that's the order used in other
places)

> +		};
> +		rgmii-tx-pins {

Please separate subsequent subnodes with \n

> +			pins = "gpio127", "gpio128", "gpio129",
> +			       "gpio130", "gpio131", "gpio132";
> +			function = "rgmii";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};
> +		rgmii-mdio-pins {
> +			pins = "gpio133", "gpio134";
> +			function = "rgmii";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};

> +	};
> +
> +	emac0_phy_en_hog: emac0-phy-en-hog {
> +		gpio-hog;
> +		gpios = <149 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "emac0-phy-en";
> +	};

This looks like a hack - what does this pin actually do?

Konrad

