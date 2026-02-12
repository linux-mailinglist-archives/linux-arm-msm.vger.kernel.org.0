Return-Path: <linux-arm-msm+bounces-92691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCdXGOTCjWm26gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:09:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0368412D4EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFDB7313370B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6D23570B8;
	Thu, 12 Feb 2026 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pla15z6e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vk2bBb97"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741323563FF
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770898013; cv=none; b=Fn60rYp7qj7It338qeNHxo9MYozzDPH/7hG7l3VQK/jRcsY00Hj1G1o+pn0HZZQdTAqfK3UYCqfWRscUqmRx2gC0MPHQs4F+WXnRs/qNZL5aalO5S/ObZ2FO0TgaUqsdJd6q2DMjtU+TIu4GzZjGxoIISgG7dfJ4D8ufbn2GNqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770898013; c=relaxed/simple;
	bh=1DNLpq61cYSOELcv8uH83sJOUYPEhlo80Ea5FXc9A44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4k/rKFOUxuMScmS3+EceKeJ4iAvBhNf9UwlU8RcCMVZdE3ZQaRwGNrdMuXSdl4zAO1f0Rfj6p5biAvEFjH7XY2wW0boBKICwAiM6z0/o+avbgF+VJYLNOVajX07CwRWtoxSxHEGsahz80eYKt2vtB2UldEkt9autWEjfBvwM/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pla15z6e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vk2bBb97; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAOxZY3963739
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0A0si85uWxYrypvSclZt2FGC7xRDNmTjiE894KvMwFo=; b=pla15z6eTneropyC
	pfrYEQM7fP9Wgwe3FdxPV7OLY2DQziMD5VA6p+vR/KngiW9COJHJId7W0z51usDZ
	42NgAqnhM/Td0iYOGiW2L/+wzWSMWak+KaQUZviIlqCl8rDP3YoNnf8xJfTNjvJe
	byn7P3EssG1dMH4wPRlb5F39YWGqSJSBrsPCqUCEdLgrvnth7VTDtlSmofgHrSE5
	pZsV4SGMmvjl8eJtvKnZt2HhoXQ1a+cbOLLN3hA15nI5EaW0JuaKyKsiYJxyS49w
	J6347fcvn8GGue66hmhUuJr0vSNU/Sn7bkHA8pT3lpDKii5J4nd/gOsyaIjRYO9m
	/9oCAQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y8ntwb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:06:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb399597fbso7786185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 04:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770898010; x=1771502810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0A0si85uWxYrypvSclZt2FGC7xRDNmTjiE894KvMwFo=;
        b=Vk2bBb97nuy9iGy5W6RuVl27FZIkK3feIpq+bX0jncDPYRaGDmNbKSlL8zOkbyRmyj
         UFmveJefFkIf3XKWmNYqOOhVd7qDNd48AubtO7mm+Mm5tXWAJwAW95OjGcBXtm+ulNiv
         g+ZWt5r1eF41POla9vbu9L17s7NrFf0KlDDZ/9U/vcHDBCGaq2gCYC3BObsbHTv/LNGG
         ixwSKA0fJoFkeNElSE2JUXlPLDXQgkj9ca32s2jxO8LueCs6rH7RCtu4fIO3wVsRzXMt
         TpcsIbfQc8UxMbR2WETFaH/WKy3iUGUlmta7zpGXFRVvZFr7c7jsbGHY5TEnZSySZuT4
         VF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770898010; x=1771502810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0A0si85uWxYrypvSclZt2FGC7xRDNmTjiE894KvMwFo=;
        b=XtXJMAhj+akaS0nejlSl7Z6T4ZUr/4XbprmbyqBkxtG+MiIl1i3e6YeNnoC+IPjWfA
         RbTBFd9FolKONoQzKiahxT64QNQq9txWXoj1Dggxk0WifUqyy4Hvp4DJFwNPN7S8JyMJ
         w/eatC4HkJPAV/Ex3084hHCsXw9/1mmLWE0l2hKtqx2udIT7WdGZLtv8QLvA0ot34BI/
         nLKqcIyGZY5tPd2klSsVxW3UInycNr1/ki7FQ67Ad+4juamxDBr1yRsQbgsRc6xIa2m6
         CCx6QNiTkz42Y0NLbHv6t5yO+AK/Nyg9fCFUUHpyumP986kWtK30sF7ozaiglaDWjy3v
         VVeA==
X-Gm-Message-State: AOJu0Yx8asF9+3AGvVzUJearRr+HEwWj1n/chYjxajkxKAEg1VCUKoCH
	50Wl2yp4uwwQVl7GlCgqpo9u6lj+CJg2YxZKX8GEHV8aATx/mcdb/N2/QQdh5nEfbMMcleYcMkk
	wHAr7MEKk05gF24O2Fvz89Yb1/8tCBthS1N+tLq+8e+bGqXtCsL7o4pjErUZjystouNGx5qzuGi
	BP
X-Gm-Gg: AZuq6aInRWeaZKQEsG4Iq423C7EAX4xrTRjKO+XN5zd51rBfllbg1Ir9JcrE3MKgkDH
	ebRaoRZAImZwLKnq1Z8+1X49OLbnyGNzH+YkBd/Y6p4cbuv1Ozz1MCikWxMFOlMvpWLWh4Rpf3A
	YiiD3wRLoXgL6BBLNxlCVo12U5QelRcxTCRUh0eCiW+xEG3BPjh4sLTz/Yo/MOC2LgQZmKnHrb9
	lJtHG22ufvgn3RO+hvNZs7zvd7Q0MlapnXKn+TNDcWDW7Kiva93doVbJ4nxUl5th4DQtZbAqa6R
	gYhcWCBQYU7K5wvemrh1uLrCs+DZa+/1gpvKskO3+da5YVGFZWy2puwnIjDGI9K+4ubiQ3wiA5s
	IuijIGl+ad3KYNT0i4Nfvp4SsB6ahsRjDDMf47MGfgFCS3V1ndjzd5Cp7Px2IOvfmFxzQJVMjq8
	EhLpY=
X-Received: by 2002:a05:620a:1a26:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8cb32f16815mr246462585a.0.1770898009727;
        Thu, 12 Feb 2026 04:06:49 -0800 (PST)
X-Received: by 2002:a05:620a:1a26:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8cb32f16815mr246459485a.0.1770898009209;
        Thu, 12 Feb 2026 04:06:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e950029sm156666666b.14.2026.02.12.04.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 04:06:48 -0800 (PST)
Message-ID: <2b1b38ef-3097-45c4-835d-d7e367f235b0@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 13:06:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1-dell-thena: Move PERST and Wake
 GPIOs to PCIe port nodes
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260210175001.7691-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210175001.7691-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4OSBTYWx0ZWRfX5AQ0h0s1q2eW
 CvxtcjFHkNN+u35adN8sW8Fa2gKwGSj49mWp3sopIszZ25u1l7JtW2szu3ZzYy+UPrQ/sf+entd
 a2Ey+BiFT8reZcu/rKFcfPzdyxIHAd/MXHkCe38Q5CJVWG02P7WwO2xFk9Lv7SNJK7KwQKgGFPH
 sRCmIdQ/Rpk0uorbMMvuZOp/WiePklaexLnIgTLk59MiJ/D/z0jijYgmr7qH384R+d9oK+5Dehw
 Wco8JiK7FZG7SSNirrXCmG6sBntiI2PbuKXrToBGYpA7onHGqRk2K9HuXYylKW1zKF48M2yuz+T
 hlKBbUpAZTo5yNUrAMlgA9s9Lu3zTIXKcg1mqokMbEr/ONiff2uPNqORG90n6MlJcTTqxlplwmc
 X/yma9uz6KUxy/dioW1uMW9nbLmIVwEfKu1s+TZSoRNcq+1ckBbk60EmmJ1Cwkr/Qzd5r7Me4eo
 h7swytTaSEPpZoMXdsw==
X-Authority-Analysis: v=2.4 cv=VNvQXtPX c=1 sm=1 tr=0 ts=698dc25a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=SkglpTzSsiD2VmOEYRYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: r0ZSJHHknQmbkaBqBSGImXE8K81WIGmb
X-Proofpoint-ORIG-GUID: r0ZSJHHknQmbkaBqBSGImXE8K81WIGmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92691-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0368412D4EF
X-Rspamd-Action: no action

On 2/10/26 6:45 PM, Val Packett wrote:
> Recently the DTs for most Hamoa-based devices received this change, but
> the Thena dtsi (common for Dell Latitude and Inspiron SKUs) was skipped.
> Apply the change to it.
> 
> Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

huh?

Konrad

> Signed-off-by: Val Packett <val@packett.cool>
> ---



