Return-Path: <linux-arm-msm+bounces-112380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kZsPGlgqKWpmRwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:11:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B7C667AE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:11:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BF1hBfsl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CBzqMZLL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112380-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112380-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19ABB3173C2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3B939EF01;
	Wed, 10 Jun 2026 09:00:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1D13BADB2
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:00:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082023; cv=none; b=N9S/u9GOaTF8Gj1s0LaQh18je9izjs+wb7FDrGITbaa27GcM5iIcG9uxPt9W7VrpeBFUo/GdhSSJk6mjxUUTSbgOCLso3drDm97HdMKUx1H532ewZU2UXYRQ4eP1p733O9klWASMaepZEaXA7dOUbCtL6Bf4F/rOcsK/FmlUNmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082023; c=relaxed/simple;
	bh=ICycYelyTZi3nY+V78Gg4m3GSErxZvhFzcb8ogzQ1lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MA9RGi85HoJ9N0eUZ+HlDAMBsdLf2alPXyv//gIqI984F7XYfMzjSaahkUfzJey3THLmYoygYw0VgtKeS9349ZMEjDdJYSxPDzB1agRHDU7EkwtJMrhOVSZXqp6j2iIwYtwpctgeYvxPHPltxAg/IaihxfzKl6GFWp3PbEeS1j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BF1hBfsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CBzqMZLL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i8jM3152070
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Le2eGaKqs1wrESVgHiR9tSpTeg0Jhf156a3O5bEximI=; b=BF1hBfslueaXt0VY
	P4FQx4bIcXcd4lhaSHSSNccxcX3o+h/Q30BWmOslrYYPt+4jLDpt8OfDJZEi8qK1
	Ou8uAobmtK/HlPDfcgqmZr6rL5fDwO9V9E+jPOheC742mVY957qhhUZxBFNr0/MN
	WfLcjLb8nykIg41joc1zFaFfl87dkF15WhrywqPQgBs44Yyp6c5/PYTpd+dLFKhD
	UduxC4onLnnsLDnFEOzpCBBtO50xZ+T0U0iNgw8SpQ7M8u70fjOHY62mWA4DBW9T
	fl6U+tjbn3JN1rtZueQjOaFufSWhGfRG1q/2LZnoQEjKgnCgMWQAqdpCvxc823CC
	EVwzOQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnesmsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:00:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915737aaf0bso148582585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082020; x=1781686820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Le2eGaKqs1wrESVgHiR9tSpTeg0Jhf156a3O5bEximI=;
        b=CBzqMZLLpx4XYrFH0JIYcP+A9wiOlGTNbz/87sbCbNZri17tTWo0aRxCZtiJySynSf
         JnD8FSDkzz/F1awX1C33RzJX5UuMKNMfmg4/kWiDhNb6sAGtFHVcAtkSOn3XuakQED0t
         Y6tKpcrjvj0Bq6A/4ZbJt+DRckkdAwCaSKI5x4JPnMQQLqjeDkK5tnnejpFF9gvGUqRl
         nbrsQRlvUcSgqYQaWpTsXURYqT2+O4Eo+kfdFrw5iqGiBt4JDmbMBnM8GQWjhHqid4Z2
         iodm1HihOko69Y2jN1KVDTUiy67cNvj+BHQhi9kEcEtrPuuVvd3lT91gWAzJ4t35eFRA
         bM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082020; x=1781686820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le2eGaKqs1wrESVgHiR9tSpTeg0Jhf156a3O5bEximI=;
        b=IVOLKUMi/WxI3twJ6hB7wTmurpcLW8Zt66XsA/F5IegrSHR45pozp/wuJdWliG8I6S
         kllEfsi77Lhi9M19aJbpNLisg/9Bb1aYLhqzC03xElTY5co0A6K0ffDoTzmxpvTj+yob
         e+nNSgpHwMjpDFiSfWLj+YQrCC2FO72lt/08rhQncsQcQ7FFmWh7gmxIoozz769J4pKR
         TXhjHxG6FZpusShM5oxa097crUgBURXq/Dw2trNZcg0EZlutTNSrbC5tmwvcrWGTEFsD
         tDnPOE7Syrxv2AESeYbW8azWvrPlPGpq6j8xSalQcIbc3xwsuzr06y4Xz3xBZY++6Xco
         2NjA==
X-Gm-Message-State: AOJu0Yw26lCFH2BoyoS/hVaLHILP6n2oM5YF09r6pxqo97YZdTRU0jWx
	tz/k5ABJU2pRszfFWGIiPTlf44BPn6wgq3FzL+P1Uz5pb+D7ZwAOv8YxiKtSjOkQg8mnOAj5GyO
	yU8T2c1J+Uu2sKgxCTEodR3rerPD+ZfQ4TuMRl+hhBEDZqzo1LWzIjP/Mm5Cp40hqHmz/
X-Gm-Gg: Acq92OF/ejzdPxsXXS9u763TwR6QDgAafuLb6etRlnJ69GQghy2eIn2wiOAJa9zTWaZ
	lkMh+GHlNQ+Bl7CmpRPxJa/u/zZ80xvT/TbqCfHLB5z0mKJ45I7dlKKpp0MIoXOOdgYjKi07ZBF
	cdDfpqJwdj+uVlLmvBs6hMKWcf2w+wWPBIUW24aUc5utkv/UvkwBDETyRsdnqjszoxmzLpsk34s
	BEHq4dpOI+xubXQIP1XdjifUrOVcrYdBq7PeCL52rNKuLl47mWiZf1Oz0/ed29wdkAJq/t2mEjO
	mGVBYykdJ3kyN8uUwqYmP/8oVhVQ2VmpFAWQm30HtyZuCFQ0hvWPr+8FVSVwAEhIRnk5L+uoxNO
	ikMIsd2mtzOCjtop+cWoIafFrPqwULNLcFqhsQZKSk2KhxCfaUf4yz+Nl
X-Received: by 2002:a05:620a:1727:b0:915:54b2:582d with SMTP id af79cd13be357-915e6dfa301mr618045685a.8.1781082020175;
        Wed, 10 Jun 2026 02:00:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:915:54b2:582d with SMTP id af79cd13be357-915e6dfa301mr618036285a.8.1781082019481;
        Wed, 10 Jun 2026 02:00:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf41f05041esm750681666b.62.2026.06.10.02.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:00:18 -0700 (PDT)
Message-ID: <0717e0b5-b252-4d55-a426-2cdb81b1ddb0@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T6X7JGg-5hE3R3XABTyxZfcJ-utkl3iJ
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a2927a5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_Y7Jz4vysGH1ZB7Bx6UA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: T6X7JGg-5hE3R3XABTyxZfcJ-utkl3iJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX6HrF478f/rgd
 2lwcPzta+TsXH3gpQMkbzjYyK2eCx7ywph3d9zlvcQEbpDJTYaQNyNV6fVem1xgzPdqnB5qsrYd
 ppvsJnfz4V6o88N0Qsv1me7OQqqnviTdkzpal1WpjFx0Hn2TRk+s2QuDNh1M76d38Rwh3g8RuCP
 dxTWjYr1FWglqHCpR1T4CPo457aaDQQAwIpMU4ml9yERCUhHsh6V19Og+3GnDDoGWSMpvGLYM6N
 vqapNDpp2Te8B9bnLKYLVPHJNJ80WvP8mjfevRjBSxOfOQamZRuCSlbf6KURFfwSVxAQGEic0U2
 Com+lyXKu3u23jVYJYwAlZzRJ80pAYZLfrItvT0p80s0gItyMNmTnxuawM9DiH9ushr6mfhvb9R
 taLj0Wt6XjBhImc5Dl96qVMX1oiVcT7IkbTIPYcjAGqm9hf2iW7zKDkVqDgEfp4QE2x55c2UQSk
 p+yoMwvDpQKEpmJzk/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112380-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0B7C667AE8

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> IPQ4019 is ARM 32-bit only SoC and QCOM_A7PLL is used only on SDX55 and
> SDX65, which are 32-bit as well.
> 
> Do not allow building them for ARM64 to make built kernels smaller and
> user choices easier.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

