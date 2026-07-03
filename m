Return-Path: <linux-arm-msm+bounces-116279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FVTPMn6OR2qvbAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:27:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AD570133F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:27:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jKYOv+4l;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M2yf1boD;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116279-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116279-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 245FC3001D72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BAA3B71AC;
	Fri,  3 Jul 2026 10:25:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32FAE56A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:25:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074328; cv=none; b=jRoIF6C7vgeCoPm2vPPL0o8hgV9Yd8c2/vIc7mXET71m0ulcdeMf4FFjM8xHziyho5wBCmVJId5SC8gB+XVKBG+OQxlUtGTjkCossiXwVKczsyWHp0ATkpcGPsYv/s/rIfcziiThRfdsN1VwFl51ms3pgrlHCzXqgLPhYlt8o1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074328; c=relaxed/simple;
	bh=HcdxR0QkQCwxHy3Cnbsvr5l5RGluBp3hnIhcPvLMuEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGl4C/M40zY3JwMdLTqV2IzkrhXHzuaNgymupLOEfg0Rjoa8BQqKSy5DhaQUcxVeAY9Wh2mjft+oLZ3zw9PibcECq4EQRsWhe2TkaegZ3Sb9GTtvlTsDpvKb+rocH9U7E/Sr/nw2EvbsEM/dgxlYblASREk9D94Npx4or2sdHwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKYOv+4l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2yf1boD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rl6g2995006
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFmVjSKmtezW+iC/SEgcCIOX0juiZJsRO1owbDX0Df8=; b=jKYOv+4lcTBCAhE8
	i4qzPPQPd2ZSydMfWzxqJKxKm0IZpxvIA/KGMhN3OI4abRxDi9gQiLmaRJqL5b5Y
	aFUf4rJs1Syyq8JARo7FvZBtcii2lYmTGNz71PV9aBb4acrn9IPI6/EBwlyLbzir
	iSDSozwFgnyylT/P3uHoTq6zEWJWIv5qjRcgmvpktKz8qGDP6ghN6P1bFxMJYSLj
	dqkS+5Tk1hujIcGaBlS5K1V5blo7Nk7qKE59B405z6d6f3rpxqtcURpI8kcQjuqb
	TjPK7vKPi2fRQurlmLxZypy5q9aU/GmrDLj4yDp8xGFWvvRNZ5MI9LZiU7/RF2Nd
	KSLXzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1vkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:25:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c069f73e4so1375991cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783074325; x=1783679125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFmVjSKmtezW+iC/SEgcCIOX0juiZJsRO1owbDX0Df8=;
        b=M2yf1boDcrSJZE1Z6B+Xi1+no5AfuCkhm3gPevHnAVkxZKb6c0T13CWum0UpvlNu2o
         k2Na+s7h1tC+vCvkKX1lZc0BePeg5VhT1OuLiDCGMdjI7aEJ0jEKVAaRM0wU3AHsGeRM
         4GBdvSTejAwjrTds30saFlWwFZl3ZNtoWBBCinA6YpVqhgbn6dnH+kbiyjBHz/XcxL61
         5W44ZoBGAI63nBwLfaxW6lHF66+I8nAd2Ky/dA+Xs0mrcRZ8Tjp9IfGmoVIpYd06sq4i
         xUdrlcbEDwDvTuVUK2lPhHWwf+E3vGYpBXgsm+1w6edflyUOaW1g7iD2eOB3pbXr61kH
         HLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074325; x=1783679125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFmVjSKmtezW+iC/SEgcCIOX0juiZJsRO1owbDX0Df8=;
        b=nPDRfqr4uJlNvnMwLwZxCmFLomUcqrFuHRQJIJIKjFje85SKqiYzg6Yk/J/Otcp+n+
         t1CIN3HqyBnJ9BYzHOGb9d1Hzl5TftLM8a+F6iI7xcgpxjJtZwdVxlGYlANBvkF++EG7
         yC5uzNtEYBoVWBcGjQsxgdzVwWwTVAzb67pdnS1Jr5d2MutLNZdAIj7txeL/PFwSWfld
         ew5lmgR8vBpzys1Qp/D8OZMALgCdW84H/KycYI3O7FwIe3/HKF0J1e1i9GfFctdc909l
         iUDekQuaj6T9lbiYuZ8pXg37uFloT7q2ulZJWMUonAFsEwKm6+su2sE2O7tlBQhxCx3v
         qBtA==
X-Gm-Message-State: AOJu0YwOIbKZJ63Nyf8L9QS+o44izt2z4sYsO3LTgVtRO7lm8Or4uEKE
	qMX4Vpjw7dPN7/g3c/7tGdDIrUtEzTNBqilh8n2fTEPtpVads3vgM96SMwusixw1WtmYu/F2oPy
	KxSzlxQpcJuVj5uG9TrENsScCKxyvAx6tIem6xjECHQUxpfQ4gJ4bHm9VpR9mppDqNXkAOrxBpE
	Dq
X-Gm-Gg: AfdE7cmeR7iq6uhis516VAbVapm0CmkRdQGUb4N6tvTudLlNToifKN43iKRNI3Ytu+D
	xtxXczeH/dbeJ+laR4GkMltL1fJhh7kFJaZwnz+vi7XLF9uSzzyI2cpdf6VN/nf4zW8XPXuQ/K6
	XuCfS00ctmoQOcqzkLjTVMJuaHVKamz/plAvFuxOimHxDRxxnC7fAdi++hs8pBLSmPtK/27Qo+b
	IwyJW/Z/oNeu0oghgvVYzfirdqDshe+cSVEF1bbzmDI6ptRNRAKc15RO7yMLExpPg5BtKyDwsgU
	MPlt8+1XtyQPV6HsTnMreWeTopfEnCW+B8LoePAkjIPS+EyMYwEGUo6frfrDZaaaP2LvDqZ7U1j
	2h6NFi4NzhHSXs+gUfCmRB6JULDpIGWWaZaM=
X-Received: by 2002:a05:622a:1aa5:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c26a69173mr79863671cf.4.1783074325294;
        Fri, 03 Jul 2026 03:25:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c26a69173mr79863451cf.4.1783074324941;
        Fri, 03 Jul 2026 03:25:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm263041166b.1.2026.07.03.03.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:25:24 -0700 (PDT)
Message-ID: <e5c4c9e3-aecd-4559-a536-e5f2f9b19ed5@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:25:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] ARM/arm64: defconfig: Drop redundant Qualcomm
 clock entries
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
 <20260703-clk-qcom-defaults-v3-6-78894525e54a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-6-78894525e54a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwMCBTYWx0ZWRfXyRHDEAOK5bsw
 K5fO2OtIoJebiVmBIizYXm+LW4Gq/Boi6kPPjpvFth4v6KytmEqWV7TLOJt8mASpu51QXlYHs6f
 vUTCoqspl0WQ3sbiiG3VvXYwnZDYWcU=
X-Proofpoint-ORIG-GUID: -SACvQIkfEyrBadKD5JfwW1vIMgxOKX9
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a478e15 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pIb2VplZuXs3id8JfLcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: -SACvQIkfEyrBadKD5JfwW1vIMgxOKX9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwMCBTYWx0ZWRfXwVCXfrtYl6y7
 iHz6vRRU+XfiygoZoda1GSODlT4CjD5dhD1N8IiStseCmYpOu18Z0apIaYKJasZkrhzQ9tqYa0I
 SdpsoZfKFsRRJmiDIZrcurnNQbQnKiBSNIhw4RfMb+7I1Y0OsM+R2djDRdjow+F/goDqFNxsfL0
 Clb9kMq/sCBUKAlsC5SRcgiAngd5OTwzdgcT61j9D9/Vs1GtB+tdIRT8CZJ160KlooGzPkwHkUm
 thUlDNx2ni23UKx/Wy3T13cCJ1A41dTcWSRbZ92qQQXO0GU14c4P0FEyHcb5Ucl8mEnbcgfgeWg
 Mo8pgqKI8hGjmYmRo4hhYwc8tDRlyMMgE6GIOVFM30qqt9YPnBz82ohyrtRSlNgSCTP+sQOz/77
 hf4HyGRqaXyWsRxNS3iqYC8D79hKEHygnT+sObDryIymcTAvr7kk8uwoSpNiPHTPWCfdnmeg8w6
 hhIPY282WQovVDjsluw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116279-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63AD570133F

On 7/3/26 12:04 PM, Krzysztof Kozlowski wrote:
> Drop all drivers from defconfig which have defaults in Kconfig.  Drop
> also MDM_LCC_9615 which is gone since commit bac4675a4d1b ("clk: qcom:
> drop lcc-mdm9615 in favour of lcc-msm8960").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

