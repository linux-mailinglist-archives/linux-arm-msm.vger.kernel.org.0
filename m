Return-Path: <linux-arm-msm+bounces-112163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ySsLHtsGKGo97gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:28:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 337236600DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:28:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FXIGF+M7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Tsqvi/lq";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112163-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112163-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2108E307E992
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 12:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45D341362A;
	Tue,  9 Jun 2026 12:21:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710D2413D86
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 12:21:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007704; cv=none; b=V0rxRuDlDFvYfdUAB0sWA/Yckq5bF0v5zOTMVwTGmf/WsDf9mx5ryFjsxsReUSTcjC/mbw+6S/7y9zFrfDqk/5nNjhh2o21RT+zSySSkd2mPa54QCT2udiG0qicsYsBkszlv3nvQ/+DlPHWnsUXzWBDa3FAb8TIs5RBf37jNHuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007704; c=relaxed/simple;
	bh=Al+O4ZpsG/tKercA/jEl/ceexyd5wh9GxKJA5iW2SWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btgMDqL4fZGbDxG2yyqNJCTJYOhi0rauaWasZ3rCL/OS/9zd1TIC7jia8L9BrQvkmkQ/gTsrTOFg5c67oqUkSaKpgjQF6R3B0F4t4eNtb39K79mODGFF1lgUEdbHV8hRcwNp6Wr+pezWJWCfJgx0j2p4uAJMr8opciiApA9cM24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXIGF+M7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tsqvi/lq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnCZo2574043
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 12:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tA5KTvMfXzI2+w13xoj+haJfk2LLPyT/kYUCzPHF2/c=; b=FXIGF+M7jddR6ztP
	Jg1qfzQKf0wnWqNx94rsO50EHvAckOVh/w/0rSpnkRZSfaJwR2SMKJRHMHdQ7IHe
	Duc+ASZjmMe1vtbJDG7gE2N17Or6PBBOw5CDkjOZxAid54sn0hHaMWoeccht3hxE
	58qxG6lTVXLntwb/QFNn9ENm94sueJredZZmO1J26Etl2pFudOc6GAtzeU/WgF4N
	mfgsKffNnyf+xWHnwgUhQGmbq6H4jFYepxghD0PPXmUEmmfMsyWpPZV85emSa7dE
	BGlE+DhxoM8WOE3QYZ6F/2g7TbKvWYR6GgMO+7JpehrEYvhLBDITYnKNvmKl11U5
	/dYqmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt0whw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 12:21:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915737aaf0bso136402685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007702; x=1781612502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tA5KTvMfXzI2+w13xoj+haJfk2LLPyT/kYUCzPHF2/c=;
        b=Tsqvi/lqVLGFV6rbaLoAjo+gF2GAsllBycL7mSBZZ6Z0P1cvC197C9+af6ST+O+QtO
         cTjLwrADwBT+ARpuM84lPHAvfQPEHr/hmIsY1GGaTLag/NW/3fZnBKsFcafu9WGsKO/f
         GPzk0iexqo7h1BmQp3+nhOmOHXo5sHtfbgT/mfuNHW4v2a9Eu/WFjT9ubEMOW0q2nTaG
         w+krs6Qn7vBqFATGRsS9oWX/4aAHGEO+5woLUCt3lUYnKGEH2tCoMrkda5V0jS1j/BMG
         1SoadxaIT/+8yA15NKvzfh14ikDgpLS0QqSNrP4dLykv3snDVvz6/QKQMOYX12Zb6yNK
         qZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007702; x=1781612502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tA5KTvMfXzI2+w13xoj+haJfk2LLPyT/kYUCzPHF2/c=;
        b=egaofWB634M0/cOi/7m1IW/tyx9qC63UNm2IVLnrXWWQ2djq1HOeq60IoOPBggDcuz
         PwBMiPny9k4bG1q8PPP+w4S6RnODwE1jmAwT7smEAMKDrqeCSI8KPTebje9XA4NvSE+l
         ApY3FHU9Gchcjjc3FqVDWHqhsMeF4i7pUjLMOHpL2ZeBn74HiFKWB9XEc0QPI1TTdt8D
         /HVYoV/RQXZ5hUm1sLiSdG8MIzfD4JnU9HxWMLQCBMi2UB8mINvw1xXyxYHfam4KI4L/
         OWxnlYNqCCfTX0ZMETNIov/LHIa/aVn4DLkCoP2dsxb95JwYkxSO3evq1RcbNOp9W0h2
         /dgA==
X-Forwarded-Encrypted: i=1; AFNElJ/BqNdzf8TwrWZ+igA2AIQAuAX4t/u9RXjXXbhhq7yR3KijyDnnmaAbTULAh757k7iGXH6/BzniDchLeN7Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzBGEyQm4Zw3FvKgvL24oGdw0ALeX9lO8z06OSx9Nxc0OHznTT8
	RL7peQ0Jd/ygCc8TsDcqcKBXkmbMP/+KoQbXXMhAV01Yl4yjvdunFTR/pGB8H6bBfCZdWZ3LZVt
	gsRnkrXxIyQbC1syb/yHzDrN37LKO12z61QSA/OFNJHDbk6ovdbQjjB9CwdjgWYnrcmBA
X-Gm-Gg: Acq92OGDy0Wdbcyl/AZctMrn5cnO09z/MOkzUvAKJFhiVrnzzfGG8mh9KcBP83jLM8N
	V8kyQCKNF53sAjrCPmJtzzNJ0aN3z+Hozgq5RpXthl1y594Rtp08TGSZ+JvNa9Tntdx0nPtHdxn
	BNTx4m53oEMEe/ZnZvSkeIR17uTlkhQ9Jee5RdLo+Hdf3Pis9AXT3EsghUTpr5rhlqoesG1+TeA
	nyjgdi/Dlq5vWB2Rvqch/eNMvTOfjyplsri3rv60l2PblEaDM4ti/l/Hy4FiZeyiPS7fndAgoPQ
	/XOnfKle4SsqlB6dKHU5lX4TzHfB2dlQc1PHGYUrUKHCteN0gERLNE36chU/jkYF58XgOQC6vG9
	/n5ff49xon1ec84IhS4t/xqQNAOCLVhPUNilG2Mc6YSMV6YucihkJ8Lul
X-Received: by 2002:a05:620a:4694:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915e6d7a074mr264143985a.4.1781007701706;
        Tue, 09 Jun 2026 05:21:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915e6d7a074mr264139785a.4.1781007701248;
        Tue, 09 Jun 2026 05:21:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e05199sm1006369066b.29.2026.06.09.05.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:21:40 -0700 (PDT)
Message-ID: <1d15a420-7360-429e-a451-ec1f012a0346@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:21:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Py3pBO297E8CCPtZ0iBMKkAsiTUI1ncc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNiBTYWx0ZWRfX8afq8WGHmxUq
 fqoLinOot1ygLuEieiB3RCDutAAWSBHeivX1Ku8HcrnNW6BjL1hjjg6Xt6FHcjIm4GpLMzdwuGw
 Zn+2+SuibO0W6SxsY7w4cv7P3i8HQ9PRvPW1YfERqk/1ZMdfIo+DOJ4CCrGyzTbVJcsKghCyo4I
 tM10Mph574QPRtIi/z5F8wlGiPna30Uh6Yb7GXkzGnxfKRxkuJxG2xXwGwZVq25JivHJIfk33aV
 JKLVeWsvLJCUh7SSFqC1VcDhdOiK3tRdQk1yrc0IWlHeP4r5ydAtHjyhxcX/tsT4TvCU3CJGtZZ
 D7hfSq/dq0kk/ufrbGzvQgMynNka5CLzIzpFDIBjh3iJaVi9ufO8obN7Dx8r7vsskG0s40IVgdX
 XLxcd/xwABkURgIDqBTpqDOtm2Ov11Vz4P2u2nDAHFJvYQpVyTTQOkgxhdieafCvrQODINpPA8x
 GH/RrqIWPFJiDd3jz+Q==
X-Proofpoint-GUID: Py3pBO297E8CCPtZ0iBMKkAsiTUI1ncc
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a280556 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=wxLWbCv9AAAA:8 a=RM3L-PboR186kqoymW8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112163-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:linux@smankusors.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:guptarud@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 337236600DA

On 6/1/26 10:51 AM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> The RPM clock controller manages clocks shared between the application
> processor and the RPM firmware, including fabric and bus clocks required
> by several peripherals.
> 
> With the RPM clock controller now available in the device tree, the USB
> controller must explicitly declare its dependency on
> RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
> would consider it unused and disable it, breaking USB functionality.
> 
> This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
> clock. The XCVR clock is in fact used for PHY/reset handling rather than
> as the main core clock.
> 
> A similar issue has been observed on APQ8064, where missing the RPM
> fabric clock dependency leads to broken USB.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---


> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>  			reg = <0x12500000 0x200>,
>  			      <0x12500200 0x200>;
>  			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
> -			clock-names = "core", "iface";
> +			clocks = <&gcc USB_HS1_H_CLK>,
> +				 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
> +				 <&gcc USB_HS1_XCVR_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "fs";

The bindings change you sent changes the expectations - "core" used
to be the first clock. And I would guesstimate that the
DAYTONA_FABRIC clock is not really "core" - does downstream do any
ratesetting on the other two?

Konrad

