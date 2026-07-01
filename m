Return-Path: <linux-arm-msm+bounces-115614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NfGENNLVRGq+1goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:54:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ACE6EB52D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:54:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PnK8ycWK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aVHFiA0w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115614-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115614-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E06330A478F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC3E3F1AA2;
	Wed,  1 Jul 2026 08:51:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727DB3F0A90
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:51:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895877; cv=none; b=I1JQsCUOqKCvu1BrJ19WXX4dcjI/1xJwHBLAv83pUjE4RrBIOdh/A45AtvYI7FeEqYppjRhgaVMddArjbMpsdD+j2dX789j0+lOUPmgOY8hMsU6E1UHjIzeSxoY4ZtbzTnzKmR2nzDUf+uER3xjTw82JDDiOBFSyD28Ace48AaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895877; c=relaxed/simple;
	bh=/6Hbmv+j5VVz2Qew1mwOKDUOPfWnD5Hc/1yxo36gb+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSI5gfynDEs/XDPy9on/B20OpCX2dWJqKI9b9WgAjaNcdJdv9DXtOv6S96VLi3BAttX75Vcn5+hLO4hEtY234+ufuAiqzVUe/IAEeSy/+QqUmlyTXjVptb9dH9goWx3no5jY5r2DNq8YWsrBcea13pDWzD3ptkW5zykemtna6Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PnK8ycWK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVHFiA0w; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GES6496790
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4qkyYKJBBJfOgR8NQFS/rnAqFlPZoKot/SYiMkB+EmI=; b=PnK8ycWKXte09IQw
	jrfNKEQ7sygq33L2R9J0L+A1wzdEq8TFqZ0HWzG8KRzyX/sKoIIIxlfBpxDUOdTm
	RFUNAhaw3/Vyv9sbkgGIZr1Ykaq18LO5lnRJLPieDEteTfdxw/3Kop3f9iPGYzpd
	q2Ou0DxmSH0SdWpgMDS7KUXcvVM+0RLI1HEDSkFBxMXO0XQuXCx5bPOiiM3MA9po
	IQggs7kCJhca8/9pIT7tbgSxLjuWbEZ1o7KcLiY4TZtvUrbwM6bBRGFzfou630EX
	2NxKIhBpkdu8Ueapo94RaRggB9qc3wNYMVFHymOE1KptwAPGklBuWDpYhdazK/Qm
	CAp9lQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktb7s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:51:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f150e7d40eso1125266d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895874; x=1783500674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qkyYKJBBJfOgR8NQFS/rnAqFlPZoKot/SYiMkB+EmI=;
        b=aVHFiA0woSw1PBe1YpTiFbQTv7AK+TfS4pyE/mPQiqooFHKfOw5OyRReF/e51A0OcE
         jk9BhEVgvKsFPRWq56abLhVydxDtZrTaIuCKE5F4+ooBYS3jJcDlndVGKW17cmPiQa+X
         l2V1g1VLoQgavbcUkPqVIXOeIB5xDGvIwiujeX8CapTamZvwQT+USFq7YdgLu+w746Pm
         Ml5xOTvBjmQGRAq3OPGbNJ3cYtMVVdV0hDQ/H4EyGtS0DyVxc9MXpOdtw9wFhRWX5Qv3
         dLsXlbKfV6lY8RZKaWI5VxXK77bX7WxJS8dnyal6FxELGHM5pGlyQITvRsDZWsdkogdj
         1RQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895874; x=1783500674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qkyYKJBBJfOgR8NQFS/rnAqFlPZoKot/SYiMkB+EmI=;
        b=PfMl+wW+6+y7UbPNs9kEsk+8CrWjbDLmM9i4Lr/yMJ88mKBm8qrBRoJ7ZuhZoiJhX2
         C50E+WLBo6pGBux0aY9jDi7XIpmncQmXb/w+fb9JOUOcrT3CEfUHCxzV6I2q3RmRN2Jn
         h5LkSvj1H3y1JbsCsSmJvGQVVYj5FNjjP9D31pU0m4oml3ZaHULvFwhOTzo0Gwwoim3c
         nmPyt3Elb6ZT9FqNJj8upboyNPWcJ34ogmd0SKLmYidk6zaBtyuN6C76mokve2OtzRfS
         Dn/PdTs/U7UBFcobVGlKZ8M9faI9sWfJ1mFEUcS5lWjiG8FPGEScN2QNiHstPjfB7Ww4
         7Qcw==
X-Forwarded-Encrypted: i=1; AHgh+RreIbZsSIydkd7CaPfiHO+DRnmDkS7GV0Pw77Zo4Chlaln0ehdODKV8/F3gR24+PpGiIp0T+L868CfogyUA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3U8Z4ZXD2jxc0CCojYzttmpm1B8sPTA9NKuVS0TXHNRJ5yrxR
	hfXWBJgcCT79vfT7IlloaXriwjoio4gtg24Wi3tneHGiB03aLdxMkq8/mUSJ+AZ2WbGMCGSo7j8
	HzDGfZmdnhzXNB9SBTaGQh0AGj80JwuOw9bbWPkzphwN9gZiCdb05syHIoAfAJROBlikZ
X-Gm-Gg: AfdE7cl9QK4ffcc6S2HnyjbIcCaiBSse+N0iKCBhH01qwBnYSMmLIP+uW9gREdTnu4x
	UsAYSBKc1C6QkN/b3DCnmzP0PD36LUl+saW+3tZ3OWiztFFmywpaX7s+toO9YYYOArpRyy5WIiD
	Ywglz9GxO1ADdL+xNkTdVMcYZiO5Ar1sM+tl53irk+jWZMqAuFDXZ1YjmLtTMsCmPXfKPaREqVA
	dwqCeko79GFzoCXv5n2Z4JnUSJK8Xo12IaHNuWwBoUDtRWhVPwHGBy79NZ6ga9+z4qJ0DDg/hYI
	3pJ5cqGfq0ydYuhQ0rbcLKySRIwDKk6viBI7JVlTfv9r0NLIlRp3WPr7DQOQ9iEfuB6xb9zysyk
	dbcZUCuDejMfVtQ/4lD7WE9SZCvLk9rT4bC8=
X-Received: by 2002:a05:6214:5005:b0:8f2:7e8d:eed9 with SMTP id 6a1803df08f44-8f3c94d80f5mr4647756d6.9.1782895874007;
        Wed, 01 Jul 2026 01:51:14 -0700 (PDT)
X-Received: by 2002:a05:6214:5005:b0:8f2:7e8d:eed9 with SMTP id 6a1803df08f44-8f3c94d80f5mr4647586d6.9.1782895873602;
        Wed, 01 Jul 2026 01:51:13 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6988270903fsm1829565a12.11.2026.07.01.01.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 01:51:12 -0700 (PDT)
Message-ID: <8d9b045d-edf1-47e2-bc46-202686cc680b@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 10:51:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Don't use all caps for Glymur GPUCC
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260701-glymur-uncaps-v1-1-5f7065348eb2@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-glymur-uncaps-v1-1-5f7065348eb2@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5MCBTYWx0ZWRfX2Q3C9v6cVhBW
 g1NpAoJuomNo2KH9oiEkEMU17iEtmq25DyqY4jMVEbvNS2qBNeBFJoj95mLMZQZ9jePmsA/y4sO
 vY+0e20ZZyYqhMXeXTFqzx8f7Pt14QI=
X-Proofpoint-GUID: WmZQXzRCfMm2O94cYnZgma1BEPzXahP4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5MCBTYWx0ZWRfX+5G848GyVSBW
 0ZTDj0RpFujzzmqmBXU8AALQOl3vfUmfjcfWKgDDu2qGDpbx4wZQyTaAvOC8QQjaGyQZoZ+HZta
 Uy6X8Dgb4yvP2OmXXIvevPJriG/Iu+HSWcYj7PYxYr+7I7E9qZ59MxbtycWZf1YwgJYWMYeM8nA
 JwpGtVAn7uNIFtwz6WyFjMDXl1NOEFihGs74AccAN6x0qMaFQ3tUDznTrIyqp1nbF9peyOUdFsi
 uu+F/VK5OReNZgy3zmh04GmDklZYVqUhPeu9zvLGVwb0hbu4z6O8AEUYNeQ1cHJdIOx5g3fmMB0
 ep0qZSN0U1DDmKn18+XKOJ95RTBaodNYYr+2UMhyWrZWGwcgsyWRmPzIWNYbqfv1HYyyy1MWtXw
 ZO4fsa1G+4t/ZmfWvevoIbe/aFQ0bOaekjN44En4Xh+Kzq2IS95K3KTUj6qfXrB3n3PdlB09y26
 3H5SucZjJvawg27hFNQ==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44d502 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=XN7p8K0ll9WvaQOQMdIA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: WmZQXzRCfMm2O94cYnZgma1BEPzXahP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010090
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
	TAGGED_FROM(0.00)[bounces-115614-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,fairphone.com:email];
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
X-Rspamd-Queue-Id: 71ACE6EB52D

On 7/1/26 8:19 AM, Luca Weiss wrote:
> All other Glymur driver use "Glymur" and not all caps "GLYMUR". Align
> the prompt and help text.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

