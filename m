Return-Path: <linux-arm-msm+bounces-112850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZJqOKe6nK2oXBgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:32:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A277C676ECF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:32:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dpe6NC6L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Dj+W//k2";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112850-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112850-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3FA8300720E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 06:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48D02D2382;
	Fri, 12 Jun 2026 06:32:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B32923A99F
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:32:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781245927; cv=none; b=e1S74ok+gy5bFrHhsEP9XA9E8wV8NF7qLdkIuxnL4iC/+wrgDEqLLH07v5ZIFrM+UJqFQFr/AGkRxr+fg3+UAcBqjg+1bZD4zqis+/zfCXVDGUk8gHVZw/nAbgzI+y2DApp71kG2KSvIDtSvC9U/MgasJjrxo5s+1y3CN8uJRNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781245927; c=relaxed/simple;
	bh=mb7tWdKfsGUfdPHeTYpqc1X64RTpGWOLTtT45E4caUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioh9NwkuQr9G2Qyh9i/WO4upQXaSDwx9GE/PH7lIrll2tTLrGCBELTaqanzeWG/Ig3TW9/VBpPeTVEQ2+VR+Iprk5ZMN20UzRQk1Uo25JzPikgDSaWyAkfm3y2kmk1OZvJ8lSMT9Nc0Ia+H6nvOAZ8ql2xM0KvdaV4oWLjTUdgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpe6NC6L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dj+W//k2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Cmwr2507575
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dCxCpUJ9uOvzWEit/S9cKtrq1+bIKVK0gCosCHYI8M=; b=dpe6NC6LegZCEKLf
	huINWtyLIGvqGFM+SJ1aZsLP+XN4z0DT0wjE2uFEFnG55Z+NYNs9a0l6ld2UNbgM
	S3jIs2zI1uPmlagBhgglUgKKFZp7tOCpsl6J2nceZbq4CuzYbUu05R91CB4STALQ
	MDdWMXeylw7tGty1G1OCp1VolZDP4t8VKvTjMlPUHOsAnwsdNv78Ywh+VfPyRfFw
	O4cK5E8iyPE4At/eG5vPFnk7gekjUHNOXBpZBmKqdr6BkhDAl8MjHDBedrZFGmjK
	7rRSlfQFgu9RTTpP57OV5N95bBDphPYJvq6tVpKUMQDDKBIU74O0KY+9VK/1esGb
	unWI3w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbjc61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:32:05 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96395e5f46cso579529241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781245924; x=1781850724; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9dCxCpUJ9uOvzWEit/S9cKtrq1+bIKVK0gCosCHYI8M=;
        b=Dj+W//k2wtY6mX4eEwBVgAVBjmEGsB0AA7ZHIsC+IGRmU6/jb3Lp4M96wgf56kRjOU
         gQQUDx5cHLhcwnnSTX9zLSYjExLsmQX6Q3gWjZ/q8fYKPrXYQpcjsdNUB134aWA4V25j
         /qydBpeP4YTl/6vq1BTZuyLv7anEtK6xZEhVKwnmUUYh3uH1kCMwWxk0853MxV8d3Xy4
         R4NoqUOnUuVCUE+g02o1n+u4VTmhyHGYHMviDSmecoJm7kWW12JogUkbJHUvVxm1Phtu
         M0qwMLfeedqkplkstXjvxTNxleZAmeoPGHmvoB8YIbUqED7CWh32QrBb3yliHw+QwWl1
         80fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781245924; x=1781850724;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9dCxCpUJ9uOvzWEit/S9cKtrq1+bIKVK0gCosCHYI8M=;
        b=EMXX/qxC9bP14LbpFAJeNWaY5M3LRqvyXT7FdR9QM0uhpMW3CU3mtl+J+9jcQnoCBo
         x4+SK4FUo8Wu7e4KdbB+XPlxugiVpuHcbe3KwaAmZARJM5mcER1lnkQ45pKt1H5Q9i2H
         ZrryXNF0MDKJTUUKEUnvGH86NCNVNqAmDA11LXwMsA03+StD2EgWFqU7MoQ/XSoknvOC
         UT4KlpaQMqErEmN0EPMRNLYaaC5g0cBurezESXOrPiXXlOF5zAY8nmD4fDB3XeNIrGpZ
         tWgXscBXZbXrtBz8FOm1KfQ5xThJ3oZ+TLtCCvcRZvvqp4WuG1EiJK9bYwtuK2juKfLk
         fZXA==
X-Forwarded-Encrypted: i=1; AFNElJ+n5ELsKDmt/HlDHqcyQRNFGXhgb9DiD14IEOPju07w6ghizN0GyFEIAlpMRQhrC5/a377cIaBbf//jhR+C@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhg3JZR4r3Vxen85zTLBZvodhUpO+PaPqZ8qwiwTyrbypuoI0D
	VWoynqlcEjkJiq9h0UvcFUCx4MhGGQTSJGFctYx8k+tKnOPdtvCVpGoTuk3yE/8KHZVQGQjYynr
	zw97fKd6Km2IXsbgN1FxgVZ9WjMvZ+Id2ygNIl+VYN6NXiw8ECDyR0Fd8odmuii3vQKSX
X-Gm-Gg: Acq92OE/p382DM+1VNUTeVA/VQpYZNwM3NjPQfC9oZtXWqptnXruw+lJ1VXEiAOu62y
	gOXHO+1Pcft3CmnmfxxKltFB1IACD8WIC55GNt+FLbVWcYa1ASjhn+Jq9Ywp00HekVKq9n/+35S
	eBG4Ajp3IQyQjt3a2J/irXm3HMzpcHO3qws/fxWscuXsGIu6uMgW56Yfjvg5jLhqAJE0fG2ub8o
	2V5cG0PWlikmU9U8Wil85M8USOL/xicpclZWAdgc/QhX5EpzdSHl2b8+r8IHUk7b0wZGScFCQQm
	MJK7hHON+09o74Qk0TlKXTIC3jBr57z32sQntVgTtaRSOBlomyw7ji1TD3Ekv+UrueyxnRmmJhR
	2avE5LEtG3OxE0O2Zh0NqGWsnWDcuWiEyAv0JrpR8n2jUdXkbTH+RoJJqec0T0MZeb1kyVBgBKR
	HATjCyGv/KUSLb4Wy5AKt9fMSxS+sweZA2KM4=
X-Received: by 2002:a05:6102:cce:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-71e88e25533mr716366137.17.1781245924538;
        Thu, 11 Jun 2026 23:32:04 -0700 (PDT)
X-Received: by 2002:a05:6102:cce:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-71e88e25533mr716350137.17.1781245924088;
        Thu, 11 Jun 2026 23:32:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c29bbdsm3650791fa.8.2026.06.11.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:32:02 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:31:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
Message-ID: <dhwkw73psklj75zjufudenn4zal6w7dxo6boxkusz6b3xmtrzd@xztpsyhu4yjf>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
 <upcLoSPzJejUNhFiNYlTVH4d8Sh_Pv2o9OZfXsY-CMCDKw19_ci2gL9B3ZwqL1hV1pQeQMLDL8tNLbPzs0JIIg==@protonmail.internalid>
 <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
 <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
 <amL4e4IHe75_j1HTIsmqE_GyurvudlyHQCPW14zs7ivHz0UnalN-yoknJwzaVRgHTT6ftSRCqDyCodh6ABCLxw==@protonmail.internalid>
 <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
 <639c94f9-6f62-4502-ad7e-5ae60f5f6d02@kernel.org>
 <10c2e008-74fe-4dac-99bf-194a1767bc16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10c2e008-74fe-4dac-99bf-194a1767bc16@oss.qualcomm.com>
X-Proofpoint-GUID: 4w7hJwK-AOjVDaMqSwzErhJP5g7vor1l
X-Proofpoint-ORIG-GUID: 4w7hJwK-AOjVDaMqSwzErhJP5g7vor1l
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1NyBTYWx0ZWRfX5C0FRDv0Bxkm
 i76IRqCR1vwgDOegfGGMcsBvBmdRFe+WDsBj9V9Sm4S9nn2gsPhb1Ss+YeRm4Qr3tfqnsOsL1P4
 vHpWoWTj3VOCLsjAKtyFlTBzeXtFr2w=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2ba7e5 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=g16n3pgl6Qv7JtVSE6UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1NyBTYWx0ZWRfX+8o1rUSK9EDV
 uMHVsRbBd8Q05os2TGLSYEr4POLezeu3M2Ahnt49AubNdQB8kN9tq3DA/XY7PJqJlAPsrtWPIJ7
 Bt1xkDNKizqIBne9siJzaEFOLwX62q296Z7oRCIl2D4p44pLQhb5nBRAYVbfKkELxMU5VN+mSiY
 GMVnzw+HB4SWfNiHqCa1FZ/R52Hi8HHkK9VtlSiEhlwClyQT4JfG+k3CGeWLFigjbgwf7IU67cF
 F1o9p4t1gTZ+y2Pr/rCTpW9AbS2+i1qyG7ymqINQjO01Yf6Zz0xGrrON6xmsl3UYY5jzaUL89Qr
 +SI9oAqRDPmE6PvOPbPJZOxb6fOuFJSQGx3HNFf53ATUYT6hoe3/tQZVOIwMmgJOMKorT7pLjbI
 /Q04d+jkA5IvD5URvGusInCDocZ0vIDXVHIQlAYz6hwL3YP4gF/DrlGwj3jTstsXVXQgU7nrVuC
 16Gao4HtY10vz2vt+bQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112850-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bod@kernel.org,m:jagadeesh.kona@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,xztpsyhu4yjf:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A277C676ECF

On Thu, Jun 11, 2026 at 10:51:21AM +0200, Konrad Dybcio wrote:
> On 5/25/26 9:49 AM, Bryan O'Donoghue wrote:
> > On 25/05/2026 08:06, Jagadeesh Kona wrote:
> >>> That's not in your overview letter so generally I'd advise to include things like "did X because Y" - "didn't do Q because Z" anyway, how does it make a difference if the values are static ?
> >>>
> >>> They are no less magic numbers that way.
> >>>
> >>> What exactly is the resistance to defining the bits ?
> >>>
> >>> I'll state again - when a vendor is submitting something upstream where that vendor 100% controls their own documentation - there's no reason at all to be presenting magic hex numbers - even more the case with generated code.
> >>>
> >>> Just update the script to enumerate the bit fields, I honestly don't get the aversion.
> >>>
> >> Hi Bryan,
> >>
> >> There’s no standard interface for these bits, and bit definitions/fields vary across PLL types.
> >> So, common macros aren’t feasible and would need redefinitions per controller. Since these bits
> >> are not reused elsewhere
> > 
> > - Asking for named bits not common macros
> > - Reuse isn't why you name a bit
> > 
> > , IMO directly using values from the hardware documentation keeps the
> >> implementation simpler, avoids unnecessary abstraction, and makes debugging—through direct
> >> comparison with the hardware spec easier.
> > 
> > How are hex values in upstream code easier to debug ?
> > 
> > Without the spec you can't change or understand hex values in upstream code, which is the whole point I'm making here.
> 
> I get the 'understanding' part, but regarding change, as I said
> previously, these must remain as-is - any difference for a PLL
> impacts every single clock downstream of it. Some of them also
> correspond to specific electrical properties, just like with PHY
> init sequences. The existing values are a result of tuning and
> silicon validation across presumably many, many chip units.
> 
> There may be updates (very rarely post the chip going into
> production), but I'd assume these would go through the same
> testing procedures

The discussion makes me wonder, should we drop various _mask and _val
bits from the struct alpha_pll_config and use .user_ctl_val as it's done
for the new PLL types? Using both potentially creates inconsistencies.

-- 
With best wishes
Dmitry

