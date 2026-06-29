Return-Path: <linux-arm-msm+bounces-115172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z0GLJe6GQmqt9AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:53:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCCE6DC523
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:53:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PTnjNB9X;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NnvG0nc+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115172-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115172-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96FB130E8537
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBFB41C2FC;
	Mon, 29 Jun 2026 14:39:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F220B4218A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:39:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743986; cv=none; b=mgyP4MhObwHVz7Dq6xpdlOKGabk/iQZhk+UAomX+kw8HHys91I6CPdKg/mtjXOcOmkS6bXfCptZy33iyZOVlGB2nX69CzADg8QOPC4QApB5K9u5MRQPZYklOq1Hx8BhDgukrRQQv5KDsqilRJGeIjr4D00Iwy4NCXh5uBv5+Qqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743986; c=relaxed/simple;
	bh=liqOCMe7OXo3zkQgVlcw1Eu9AkfS2Wd8nUtDi/XIQpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onhNUylA7khFaQx5wARtv7GH5mP/hADFwTQT0+FJDFgsgmjEJlK6Ndw6ktAvkep1o0X/o8n3fvP3T/cVNJ5wM8br72NenEPLYqJVNVhg8LqKZ0qqeE+usZknVSSOWR9CZZq5wWvo+jR91kFLoWcvqZOJs22WOw0Yqj4FiaJBJxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTnjNB9X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnvG0nc+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATENo2579144
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5bbBHtidWhRPmnInLMwZken1KORMptwNsSz5+Ls2hA0=; b=PTnjNB9XAbMirFlE
	ndJIFRNsKyu6sxsLjqv+9bRKNiPVTf/hBFDVxe2UEejUOn2LQrHHBd9wZhajwVbv
	wTotbYxEKMU1fO9xaDJDDciJCM3WyiKRx4pxw2d4AUQ7R6Rq5k/HiWOIYo+zAmAA
	KmrhOQdGd26U/m7rE5BqRONr8l08AjDp8asqoLZ5Eeps2DCmDCqb4mi/LR/3cC1A
	dSHsDdFFi3ElSt7QrnXeaAyQeDgImOejXoO4dfBTe47Csvh0nymhNZqeaJ10IlZz
	D+HczX6IfotlQ8S+2VU0DCy1mJImtyqz/Rz5wVKzwZJb1wZHpbGB0bi4FS2rFYJ+
	1Vx/Hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hury-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:39:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5110c89eso31128085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743981; x=1783348781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bbBHtidWhRPmnInLMwZken1KORMptwNsSz5+Ls2hA0=;
        b=NnvG0nc+W3NQhTENNoZ64kIF4WCjBPYaFFbgGSUWRiRjlWKq+LXgfkLjUf45scGSRV
         kOkbeUSxIIGSNSZLHmXeZurQq+aCiQHyarUzCYhXyXeEiz6KrzWwWdxF8r3JPH9rBiUH
         NnZ7UPHE1EsGF1PSkikZ7bjAkDXKGu+eUj7dYC8KzdofcJEkauVR/FnszqMHfczJ4ZSa
         WAqexQAtkdqsL2ZjuRVgPVHv7gQ9sKTF0E/gLBO+C3/fbtl4T724u76Ng1LDtzQimFTU
         nIubUD6ac8XUhfCRrjEc3p5tnN/CdEDw4BG1zdyjHq98bybHNBQLyvAX5aNYTJsaJAiP
         /QeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743981; x=1783348781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bbBHtidWhRPmnInLMwZken1KORMptwNsSz5+Ls2hA0=;
        b=IfNrxqLDdqqKb2UXtcUUPj5Uzzizt8fXIKP2/xxFeWBxxrnz1Oa2pICkoPudhPxHGK
         yy6cO6gW/VDbrV71BGvk23RKYpTo/IRUGxO0vDedc5Rp7MlUrPmIhtvthTQTNcAS1FVN
         V3+jGPq8lgqMfNU2V6hvb/FpLTy7bdPw/hGTERlWSBsL6zj6QCVpdJHpVLFNzSsvHVRG
         PB3viTmFBayaej1SnaxlrKD2MecDsS3sngf3dJaQhUSQuSzvU3HCQ8WXAu6bydNwgYdC
         E/qMumiS+AKpvLYAwGj8nQandSA/pnnTygsP+srTqKQnsrwH2uZf84CIBMz+KHE6NuG0
         BStQ==
X-Gm-Message-State: AOJu0YxqZqIwnMyW0u3Kv0cTYy9L7Qixvfwhit45XjrWiPwIm+fjEog6
	cm06elLzV0qw5CYFKWl67C27hyFAlbdhwHROFxUpdlrTP1X1SbNRYH19PHVBjl/kTnbHbiTY4f4
	DRNRBBbZTH/Qsu9kt0o3vQq8YD2YQ8+Oc1oipX2PSq0btefavXu9UDtW+Dmroizs0dn+I
X-Gm-Gg: AfdE7cnzLfbVQSJ5fPtaepYZNb/mFb/h53/Hiyo6b7KauiUh7vSZmQqmGG10bUILELY
	HPJy8TTsJ/tkpzZSDSjY3k4Vkm0pKsC6sbojUSxTPeaatQ7D6LtHVN3A5gMEinBRiTxTvVAejfr
	gGBAHF8DApnrnpWjRw+WIF1BOxuYYw8fejdiW6CGIx9AWeaGkEBIyXkgFzNzMrj/zmhnmRXL1Zi
	CcWwi/IhWkEFo0GJ5ZKX9IsAnAM2H8YRRfZYdPs6r5d1uelURCAITgxHy79jA48YD4ieRW41Is6
	7Lgutq2/exLvMdtNX3/jR498/uX7dxLBRA8oBl68clZWpwRKCVM+9x+fvTC8zsAB5/WQTn4Ureg
	KeGJJYJGkAXEjX7Rm95/G+lt5PpHk3CcewF0=
X-Received: by 2002:ac8:7e84:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-51a72a8dc41mr164992861cf.6.1782743980681;
        Mon, 29 Jun 2026 07:39:40 -0700 (PDT)
X-Received: by 2002:ac8:7e84:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-51a72a8dc41mr164992561cf.6.1782743979990;
        Mon, 29 Jun 2026 07:39:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12376df39asm449075466b.16.2026.06.29.07.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:39:39 -0700 (PDT)
Message-ID: <021fa1fb-7033-41d9-927a-5322be71768a@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:39:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP
 and MPSS on EVK boards
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-8-2114300594a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-8-2114300594a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX3bkyBpAtRp/7
 ax5tjkG1p+WyvMtJZmGK5bNubzhijba32qGk4NknKVS1lzTEhMLU4OISMXPOWINy+SzTM+A4koV
 0tctk7ywZdsJBLUJPNSFlcIZrLgFKTw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX9n1E8UmO7j0M
 +ydBno1tusmLzZSLM6iPGpbtahgiAvayNkMtrnzgmRrr7zkEJK9pcEX3xOzYsi8RZ4MXCtWebpw
 eb9J9FQmx89Kx3CRmb1/ipY5zhK61fs/jjoiL1FapNvr6aIA0C5ZCIrfpp3ft83lsAKzliSKQ3n
 8/tBU8qd354m8qNC3Z79RLjfYUqymekfsxVmbf4ByYw4bxROnWLMS+EU1AIyD6yBT+Y4+iukP1/
 guJmTtqh0V6UrXGsa1VoDVF34hXSGinRHEs15NrILFJbhc8Bx/JG5ftq80PHPyoBX9SDlYsuIah
 sXECKi57mllD80RIkZCgf/OVFQimsuJFQrvlA0hz8tERRvlyuyrNEtgGWRbLQc13kY17oGpMyf/
 unIOhqmo/ATGFrtmf7aOcceWdV1FEEXyuZ0ws+DIJ21hNWiuTlxzoHmjskSzzXw14xGHfW01ANl
 1rJs64SuKGS7yY7uNoA==
X-Proofpoint-ORIG-GUID: h6P5OO5SRJrfO_6OYpwumZ3iHmhjXu10
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a4283ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2wNq6JH_cIzNK18R0_EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: h6P5OO5SRJrfO_6OYpwumZ3iHmhjXu10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115172-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:bibek.patro@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBCCE6DC523

On 6/8/26 3:10 PM, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
> IQS EVK board.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

[...]

> +&remoteproc_mpss {
> +	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";

I think cqm-evk etc. could make more sense but I guess this
is already shipped, so might as well

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

