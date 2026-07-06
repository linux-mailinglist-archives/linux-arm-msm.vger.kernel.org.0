Return-Path: <linux-arm-msm+bounces-116833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 36UYKBKqS2qyYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:13:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE2E7111A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:13:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V3ZlMb6M;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZkPFFWHy;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116833-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116833-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0EBD30C6570
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BBC35AC24;
	Mon,  6 Jul 2026 13:02:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C79420864
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:02:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342961; cv=none; b=takupyqEb+W4S4IWp1q+7cezmBKm6avcXVE6ok7JsZHqXMOkisLuGHsKbE8TtvLkBAElp22VXl4wxM6tQxyI1/qKmSvSJqPL8cRM6kSLNndLnlTtPTGQt/1q8wuggy8LbOQYhM0pQmV4BKtPq6PeyMfwZwnBVd7+ocIz3jgNqk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342961; c=relaxed/simple;
	bh=p3CG1Zonxb2OflphE4a0BdEYd3gJ2MfWN5WFks8BjzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmvpAjb6OmsE6hzHnONCkKgBn5LR0tkORH3NtWD5R9urpFbcKpT+a+0yBFVWcgY4P4Yd7PjSS05WGuN5PSsr2WwJcU4Qwd4nolXqlSYfmwfAYKWLuhWj0q7YVXGWt9r7XwcG9GVNC3jcvwdVtFvuTcIQe5JnEdOjqgfzU3pp4X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3ZlMb6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZkPFFWHy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLcp218452
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HfL25x2ygpCa85pWEtKxsyGE/MeM0+yiGzibLmSqsIY=; b=V3ZlMb6MBVCGEzKQ
	mF5EdBrhT8g+i/UukXHh/eczl1Kn/WduvT+58ONUVnIp5WLDimGeFava+Y6ys+We
	MJadqlAeABUP9bBBqffSehTuMPJALBTcp++Bxqqp2NJiYh8HCi9NcGC5TigC/Kgl
	5tEhH48StT2N8Cb2p1TbrMXe+PbPziRfVnUHGLYDhltD7ph1PS69Pgl1f0T68L7t
	eoami2jja75qb1b6RkhLPSVh/GyYtbB5cqq6mVg9TkE4V7tFfA5WzY1C380fQfSh
	lWANYnJW7E6Pr71jOqh5WX/qnHkj06UJVNguXijIh+sCNRv192pKCmpvhOblKGbA
	vbus3w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs95p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:02:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38105cc58e1so358218a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342958; x=1783947758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HfL25x2ygpCa85pWEtKxsyGE/MeM0+yiGzibLmSqsIY=;
        b=ZkPFFWHySM9mXTyK1ZcbKc/DMmP7erRWHGVTtKLm6mwltPJO7q4PB9/p05geWaNW+B
         ErHjLJGDE/ojBTrS7UJabLh99Ygktl3rcr63FQaxAYHiocHALook5wAx7pHPcypqI+Q3
         iUlGQ8eJTbwbBP85cnl4T5fD92zWgjyrhoOql2PsrOwbf+/VH+5K7oWzPMY+BTFakjb7
         pCOmz7Kca6T3Lupi+/N1DYbdRYPItsKTBi0cUPGhIabD8+o7UctZM51Dr6nXhMk8Oqtp
         mh7NJm4YQ9NMvW9XZtLKq7X/Mm3Eek45xhOCDUaUP0HcR9RhyrJHKQ50hqcT48JsvfJB
         Re5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342958; x=1783947758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HfL25x2ygpCa85pWEtKxsyGE/MeM0+yiGzibLmSqsIY=;
        b=hn9WA4yCVrsvnZl4de1Q71jFx8SacsG+ZBCbmVzoMFZ5LxhW91BSDwpXQU8kQSf/RW
         5BbqVQfVjy/wM5Le6rpo1E9jSR1V1CHo54Z59DEr1wLwzLPh38IIN6IDIJP0NrggD48E
         JggTbfGIlMR2XPvZH28/PrtWif+0VUXxmN+eLwbvbyqIFRfmQ8XzyPUYmAioyyUfaysq
         Fr//ZpiSSN5kQHGeu+NXeQd0nTTyMIQSMNgXe2LqXYnSNfrZ1yrkYTBYUJiK1UNuL03E
         JEHF1SII+0wdh6Z9qx2XVFXMPAJDb+qoPql8DH/BrkqOuU3x/AtiQFdJ2lfX3fDCSnCk
         0zeg==
X-Forwarded-Encrypted: i=1; AHgh+RohCZAQpZVjFLE+pgZuniSnrPJu0U0RYixgjL3e9F3sRKZrd9bOIpClBHf8MnW3GwUKx/xq6htx44IgIfu+@vger.kernel.org
X-Gm-Message-State: AOJu0YyuY8dEavlVMFy95yei+NhkXMBl66utr9bqrsLk8Vl8LTdTcUI/
	HHGoaGwJmcd9nRTyJuw/OGy9yFL2P5MiXRGfdMbi7gs7MACInwjRVCxqXoYKq7M7PEFQwIPHo/f
	+3ZO3xnFggS9lS86hyxWgataB8vxEDDMEYNOWJ3FlPdaRP4y+MRHh/HYrOzoYUxfYtxDj
X-Gm-Gg: AfdE7ckavKqmPnYUxRQT/AdLoyCyivveMJJyI+a05ZSbJemvyJnu8Og2A1txyblaZTm
	keY23x8Bb9jaliTX/Aj2l5RqYHumUrt88NeSFXODZEY1NcXcOrgAti/eC2DpkAb3jZNIMCuDO3o
	jysU/jaQ/BiHefgYjb320WU7toKSqmrBQbP4sbbpM9g65CrUxtih6oggUk5OfF8HcxoOAji3lYy
	8BnCYhGZOLb+7gWPIZjDyhMlUIBSpj/eoaujgFY9K3Zl068Mwo1gijh1ti0BXYwZr9ApxR4k3ep
	Nw6P8VzouYsfN75Ay8wfJIo2k20vQPeTH9I2GSOWQ4OzlM50UkIauFUcN0XlM99YMPsaVDBIMPB
	zTH3Q2HsfFSk9XigKHH6pa8QQpDFRuMgleuw=
X-Received: by 2002:a17:90b:510b:b0:36d:de94:f31 with SMTP id 98e67ed59e1d1-382a05aef5bmr5830382a91.7.1783342958563;
        Mon, 06 Jul 2026 06:02:38 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:36d:de94:f31 with SMTP id 98e67ed59e1d1-382a05aef5bmr5830305a91.7.1783342957847;
        Mon, 06 Jul 2026 06:02:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629a1d4sm735844966b.39.2026.07.06.06.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:02:36 -0700 (PDT)
Message-ID: <fa75f61a-5bd6-4002-8f8e-6d63b1f94222@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:02:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag
 for DISPCC and GPUCC GDSCs
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-10-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-10-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wuat7QNdu2gg7NjdIuYhHKk6F8dbCqsd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfXz+r6xtzTZ4G+
 2P8VWV7hB1YzyxTMVEjQmLN+S2d+CLv6GesKpXkuQJtpnkeGx7XT8TVOjnllOP4G+pjkki4Nye7
 qwBZW3KCfleacxe0f3XyaxL+cr/Qgz+sbMsHMWD9HEnaC++IyuP3JZrr4sRWkw1F5/Vriz8UluC
 NI8FpM+BzauvKrt2Vfj+13N8rQCs6BKYFaqzts6VfhdFXWfE2NkMNFUd8cY4n/E0k30hfrYutDN
 Xrdm2XkUl+eoQ9LGBjW1fpJ3X/ug1GXVzuWl53AkklEiRh1tzi1C/9XWpacc4l384mO5/mTBI54
 KRgAm8oMvVhdj93TGHwzwTqrK569UImE9Q9iZJKGwc5XEpUfLL9OVy0s6ubPX0JJzZmvLpMNcIN
 nH5Hb4fH3OrGqclpOWJ2m+67bvS+vgA/WFhsZsh3U6+scUqY9Ul+wki1TzvBtuMLf2EoWrn1EnQ
 dfArA2xWx0l+xhzdzrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfXybNpB57cFb6W
 /ZpCouapZApoquIhd8C4mwmclLgBMcnTCtAp7GOKIOV0BPhxxaKRopNhAyam0wSSSrtcw6nE5K2
 pvhZmRcwquVDRDbBVT7Mmg/tqZ4rCm4=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4ba76f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UNExni0xwCPDFZk4GtsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: wuat7QNdu2gg7NjdIuYhHKk6F8dbCqsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060132
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
	TAGGED_FROM(0.00)[bounces-116833-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 1BE2E7111A0

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs on QCM2290 to retain
> the register context across GDSC power collapse.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Downstream doesn't set that, but I guess it shouldn't hurt..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

