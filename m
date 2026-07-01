Return-Path: <linux-arm-msm+bounces-115693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mNlWKRT8RGpD4goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:37:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3656A6ECE32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:37:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Va9qc+vT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f9kFawwN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115693-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115693-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E7D830117B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAAD48033D;
	Wed,  1 Jul 2026 11:37:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8043D4F7
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:37:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905872; cv=none; b=ZgJXe14MYkw06+E2GIXWb1ir9Dp2MVnpgM6DYTQVONdpjGIPQovIp7yuYqCccGvj3jJTKMjf/4yPdr2u1+KdSXrcGqmwW/6GqkFvDMe1bb78P+7QWgaXkOAvl7GXSz1woqNKyVrJkR6Jl0AXGqPRoZP4PR2T1FmV/Y/n04luOd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905872; c=relaxed/simple;
	bh=up0C0oytixjQf/FBVqm5fVh2BEmRSswqru8S9l7dq+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=luQmeADmlbgAxgXJJ41/bpbSw6PqjWOUrr7cq2WIz13AohLXwlCU+auOpF5gQ10SiAGQOkYoK84myLIZV7EYYDpQkrGmbLRriTp67JabDFVN5VpaxICnwKu42bVWlJxDEqFPjLS7yLRkcP4MZjOHdIeqTtUtOPK7eEYbeeYjhPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Va9qc+vT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9kFawwN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Wa9744289
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnMDfMcHILR8MaujBWN2IXVrf1V2crbHAtbaDB4GjEw=; b=Va9qc+vTL5+0sB0p
	t1ZapklWzsGiK8oNzMWQqcWv7hWCP+WN8CGF/el3DHEFeEJqQ7hsFAaoIq22SsGs
	LZzX/OCvxOOryAWCd4yU+tjfYOYdbADF07xUYZOvddZnFhPpWp7fChAaq/YiOZ4Y
	91A3WVxWRsVSZsyRtdvvyQAHkwoQQE7ixSZfasDkBpuR9uNzuU3HXn7dIwX5vFzj
	KtjxayJ8Hocx2r6nPIqeBMw6EJ8uAa6Vje9VUyerF/u0E8V5rXHmr2jSRCSw4+Hi
	FdZNgTJIYjHUFJyZLmVGeRYfHTG8ERg3Nq3LLEwrqwX0udxeKTPy7Hj/paNbeJ+O
	vwedWA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0th8xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:37:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c298a1b20so458751cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782905867; x=1783510667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KnMDfMcHILR8MaujBWN2IXVrf1V2crbHAtbaDB4GjEw=;
        b=f9kFawwNWWntTOUqGnRwoOFFp9Csj6BPTsBXnqVUueUQ9XEt6H/O6106Dxso7KzBdi
         CAyE7egDRzaFX77zA5zGNtl7v9uZDVVL+aJg0kB8wzM6/z6FUQqrAvUoJQJRY24OmMFQ
         r3sCreb+xEoUqMuIQTBcPubZMEks19TynpFi1yrfxihJmMM+ZwCUjbAQf2rFnq8LFZu2
         nGcHCFwG3Sd9dAvabGpNh3uzVKzYfmnSnO5yEk+QXjAKKi27mVrLU5O5vWonEbxYcRbT
         UnB6VJ+VbAjENbCkNnnT2E5p7HIZ5aRkQi+tGQNT9AgBT7LOTv/A7cJQ0ppTT+gAPbwu
         5u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905867; x=1783510667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnMDfMcHILR8MaujBWN2IXVrf1V2crbHAtbaDB4GjEw=;
        b=STjDKZVbMYH401KmL5F8egwjUM+UVRBk0Q6OjFS9R4DkTas+nb2eC/QTQYm1w4GPjZ
         MC6ytMKAuaxuc0dhehAr/ycor0Ns8uEweNTS9HZEsaABztyTgSG53rf+wJFtDYQtAdwW
         b/oWPeRqKxdROxquRS4gAwiCZyziABchmP0kE7URktWoepivT2f0cTUmLdXpEAIDi6cH
         uZpV9yh9VSsONIMngv2kYWELDwvXKsSRby3OfkpiY5zZ/ZczRc42GcdWDk7ZAxJJzeRQ
         k4RFJdKxTbwLDCB9bVJkL5a2Fj/xAm2JbPsbqi+84mjJ4TPqA2F2h9evstLCSz0S5H+5
         8IVQ==
X-Gm-Message-State: AOJu0Yyj3hFGWVLKg6a/+wtgCOqE6/zKwmQFCZdU/dHu3FvtlXgJFdU+
	cFOfPUi21Mzl6AxPNOknMuVpNFX3h2/QX+1QBV4HuHwbToOzHzVAcA0w6XsRAfoORjIer8ufDc/
	hqDFyt4sBQusVzWAluBHvHD2injxwG9gVJVvaV37fsrII+Zzzw69G2zb+CjW6UFDIZ/rI
X-Gm-Gg: AfdE7cmItY02ruJJqBKJHtY0vfEngeGwDZS8HrsW/cENEpCNdJzatrYBRT84tjCw10i
	x23iljJ81SxYVN1d1sy6BSXUXpnWbg7TRkIaZs9XndrrK5yIXVwv1u1L0qXS4R36zQuQHK/oI0Q
	avvca6PYNSIkTdED4wbB3raYdf1NtGAedWA+3/FvP0TZ7Sy0j6NxsI2FUctKuIeqkgEdazv7k0Y
	QATxDpK2p3EDRzEBqSgZXwjKj3A4+HJsl5I4udIPHk69fI+pdjgJmTyYFtlodoAFAs7xNuPFcp0
	1vUlm9juJ0IsKwPPI8VtWtOZU8J09muVU2H58E32vcF/Oe4l+MDRwQYFENmvtbcdo8UOs/jmg7p
	t07bNZmnZsm6974SUTtUQFAA4EjwnBGoqSyQ=
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr11241921cf.5.1782905867293;
        Wed, 01 Jul 2026 04:37:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr11241521cf.5.1782905866877;
        Wed, 01 Jul 2026 04:37:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc4csm268596466b.34.2026.07.01.04.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:37:46 -0700 (PDT)
Message-ID: <b43691aa-6d1e-4df0-9d1a-cd5c4b3e3dff@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:37:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] arm64: dts: qcom: Add SD Card support for Shikra
 SoC
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
 <20260630165700.1886608-2-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630165700.1886608-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -snosN__vVypwOasSt9maDNfrijgaDCy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyMiBTYWx0ZWRfX5yqRsfVMMBzC
 KRW6v9MITTRwX9TqNsHppPYGP8Zrzu77CH2vUZ7jEOC2uu6hK++b1/HJhhyomSzZYM9fqued+EW
 jKzCFS1IVm7e7Rh1sKVfNz90GWdHTQc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyMiBTYWx0ZWRfX7ud1NZjTDZKc
 O87JwoDVAq8a56DZv0/VGF2V9Cgz54amTKHUM1BMkdpiEEBGGASEzufdeCaqOikcMAAndcvibrp
 ml8VxLbZkE0Ms3ML8XeDINEPI45xeMqC9BGbmgk8NaNlXAwn31fsl5cmlacm6TlHwvxNO2jR24J
 dNTE7IItJNNtSuSr80aiPPZXVdKWyvpLilb9tJhgLOkCo7Rc7Nh4vJpf8VjdasWERjUMsGz9zGA
 k1qBf6Iow7/oJtBE6hoilnYCaxeyr8KtlOVxuqI+XJI8oehgCuqJG15Vcd7ZC/kQjGlC7grvOgh
 PhdyzgFIe7Bsx7i5YkyUihDY3wwvw/Eu3m34tbHMdygcK6O4ssIeFDq3JaH4zfEI3YHGfrorhS4
 lfKEzab74lSO34sl6N0WmEGbmOAwVxWWpVrL1Z0vLejOCZ/S2dOXSH0G3/mOT9bwdaehdt4kbZZ
 vY36UOLD6t2eaTaXrGw==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44fc0b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BpmcFw1FbD8WNArM64UA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: -snosN__vVypwOasSt9maDNfrijgaDCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115693-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 3656A6ECE32

On 6/30/26 6:56 PM, Monish Chunara wrote:
> Add support for SD card on Shikra SoC and enable the required pinctrl
> configurations.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

[...]

> +		sdhc_2: mmc@4784000 {
> +			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0x0 0x4784000 0x0 0x1000>;

Please pad the address part of reg to 8 hex digits with leading
zeroes, like all the other nodes

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


