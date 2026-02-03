Return-Path: <linux-arm-msm+bounces-91621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNmwDmC2gWkrJAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:48:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A077D65B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 963BE301A3B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 08:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CED03242AB;
	Tue,  3 Feb 2026 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nm0f+GXF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L6IXmAsy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC96E29DB6A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770108491; cv=none; b=XhbMiR/enj8IPaDfSDoB/OiJ/Q+cm0RINBRmcbY9AyFFS45M/s5gqwSudIIM1b+cXNTOVrMImWovqlU6KJ8B7LEWcXjGGHUc4Wry6/SZ4hUgz/prTki9hb3KP05f7wbhIb6+AJmu3fqeStlm0jsmQ2DJI5TOnz/q7At5Ftww8ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770108491; c=relaxed/simple;
	bh=eXUf02paY8VxjOp8VCHeexVt79gZ8wBAFPRTmTsO2cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjk+VexUvWAI1PVmpTbEPUYebjRhT0kvNaaTwPbQJ0jyDKAdzXu3XoZqKyQaDal8KRYN3plgTd7hgehSX56rYi6D5ET7f7xPsHw4ItKTr0Bg5r0tByjItE3u6/wXK7hyfPudkU1arUPe3Df2gEvk2doAWb+t9dKqGd8t1IOa3Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nm0f+GXF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L6IXmAsy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136oV0e2356982
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 08:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQRx+7mNxFtpY4+Q9LFa83mI0dh37fZ2A7fbqFBPEZw=; b=nm0f+GXFAPrOMUUg
	0P9E1JhpOYuhKVLAZ4nVcsnVzA5FgGrR5ktvg/OqB/9Me7Ke7IRg2aeWtcsN+aiC
	FsUSmVJ1ZAU64v+CnlbQfWPTES9nMg8zQL+FsL20DGOWmRmuWoO6udr7MNZKq4bS
	Ul27jCcOufZTBTXPqxHVvPo8d2yRWmsexQVn4pBKpnsU5n2PExVxBp5WXJ9LDgtq
	lmyy08876OHMbVUu8e+THZBclXHyJ7z2V3SGOd7s41GrQjWKQZMDaz5tB+Faj/mo
	MINPLT40U+/8/2jiAE8Z8LvI5PAxrEiU1Rlg7Szx8JeeVZyEV7ZUA3q/kvVgK+lg
	44g84w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0mbb9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 08:48:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-894662cba4fso13469116d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 00:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770108489; x=1770713289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQRx+7mNxFtpY4+Q9LFa83mI0dh37fZ2A7fbqFBPEZw=;
        b=L6IXmAsy+1cb+e933W2cCRes50btGfhij/tWHyFx1N+WPC73MuaoppWwgu0eUjBKJF
         Cnmh2fBlq6/ji0JyAyiAH8DTGbEXkhp2zeazMdFGEZqYLgYMPx7ztlQxR9jFCD9K/czm
         bnCl+y4KmFJx72Y10FbBMOjuFuWCxAPhMNgph3TYcS+xGcLdOWfnXDvn7dQ3rhwrfAvn
         hXA+3BaGCgt4iv+2Beyp/Vtqsms9LbBdaFTr79Wocdk7wxVBJbRA0q3FuftZ7bD+yHTe
         6XslTnLjoyWowGGR5xRdSKkj4eDhbFMNLFYAOHmmOgrOaOpd9eHbU2Ce1GtlRtdKPdDj
         fGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770108489; x=1770713289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQRx+7mNxFtpY4+Q9LFa83mI0dh37fZ2A7fbqFBPEZw=;
        b=pvtUFZpaZOBGbZlMgNMZjMTPA4cJrkQKDEj/nbi8yLmfHhQejdN7h5vXHzbWZVwOci
         WhAmXxg1jpZF22B6RkxE/NdgfkCaUG4XEd0mrtZFP/AQIUyr+vMAx9tKS7wd1UO13FYA
         z2MZ+m2XXxJPoFMRAZ9ILRCBqdLyX+WHC/6uC9M/Gx0ZcfcNE/SgWdtdkZq+FLqV/W3o
         CP/2+746fnERzQ5MGCM8mIO0WyaIUBbvIaaKGgCC+MPcGvmvVHRk1yCQoZF3569UxhsS
         +tQXZQJ3IHGfy9V+1r9bSCKUzaMXiZ8tZHUuZOZnXYmmkMsW0DZ+/d9flQMJw+LF4dzZ
         nyfg==
X-Gm-Message-State: AOJu0Yxp2L+92HIjxiAsUS7trETsESk7X5jHT+pOG6lb+jMEZv4InqSX
	U8L0t90zFDxa34HCxGVkcK2cLGXZGIuHSa1IK15KQhaO0rpdZ6T18vByfK6GwQUTELsT4BDAIdI
	+RjYsh3c1C7Q1JSZ0SLaL0+U6JmtYUJBUk2SzKHOAZxU39zuwq1ytZyucHIUtL+lyg20x
X-Gm-Gg: AZuq6aLcyqP5jalbQry/0tIDPRH2k6LCOKIXFFcwJz1F6OiYCuMJn4xe7Bg4FJqsTzb
	igSjHdZQ9fUPLS1Gbwzwyjrbo5xuuSGc0AaGR9Mklrq4aqouIpdSk3gonHwNypDEp4iwEDrjH2U
	G154Fl/O72rVHiBTYJxnwGd5SfPa/dPJAS5r57vlt4kjSgp/KZwQ6m8zNARZeBT/rv7tV79naDF
	i/jLmmfqtL1uQp6e6CZREDiSfED7hq2gojbYZsuwGJDeS03cP4mZbgr8ppoIziNWSp03SmN0YbC
	4X6OrGioZ2gpng+1y18Z28byDlNhocG/SUqfK3cR+6Z416HGZK6cvWEya3ffXmA0sGRHr4bVifv
	lDamBOAOANhGkMfBs1cFJyXE6cNwcisiM8XUwFvHU5vfMzn6Tpm8QRnfEr4YiLOghmxc=
X-Received: by 2002:a0c:f099:0:b0:894:9671:7aca with SMTP id 6a1803df08f44-894e9db651bmr141552406d6.0.1770108489058;
        Tue, 03 Feb 2026 00:48:09 -0800 (PST)
X-Received: by 2002:a0c:f099:0:b0:894:9671:7aca with SMTP id 6a1803df08f44-894e9db651bmr141552246d6.0.1770108488688;
        Tue, 03 Feb 2026 00:48:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691e5esm8840359a12.16.2026.02.03.00.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 00:48:08 -0800 (PST)
Message-ID: <02a0287f-6508-4c40-bc60-0766f33ee720@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 09:48:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch nodes
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
 <62860c39-18cc-4db7-89ab-f85a39e67974@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62860c39-18cc-4db7-89ab-f85a39e67974@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=6981b649 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7lhRlkTmqxIpPjGlIAAA:9 a=QEXdDO2ut3YA:10
 a=Qzt0FRFQUfIA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: F7V3bROzTC80PTpP97NNu5zHMozmDx_5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA2OCBTYWx0ZWRfX0RTCKjo9zT/q
 gkS7qNNuULvQHY+CrQFnJMiw8sfYNXP85jcbj38D7E7aKigDDlt+fBGUGJqRwQ/d0dgXzYl1dln
 bfmUps/Mw4ZWYuXHS5LL88miFHV3fbSfdezFw50LhFGdDYtJTVyasuQAvCJ9MocSH6UclFS/J4i
 WSAHYSfjNVLGwX1GhNB/AyWLdJqsqM6Kpq1pfxDp1jydv+IOSxAcK/H2O9AcyLo8d/6maNcD7qW
 J8q/4Euh53N7+kwL35VDuuVsW8uHLpsGpOJFVYAI3hCCb4nCx11mhlF0GHyiEEHn0PqJxMVWNfZ
 wpWEySFLEABd+Hyvq/DLJrKkc28/FRcA1YlHA/W4h28SJumPVeYL9dBp2lU0AtKlZ5/jEZXMo9X
 8n1FYgPH/9wzEhlxfQYcxILlkArPPw3GMLZRxa3A/Yeg2EyvBonUN1JBXnH/QOKBL2lpNrIaKwR
 fgSGH6g6bbMSQMkcZ6g==
X-Proofpoint-ORIG-GUID: F7V3bROzTC80PTpP97NNu5zHMozmDx_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91621-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A077D65B6
X-Rspamd-Action: no action

On 2/3/26 5:37 AM, Sushrut Shree Trivedi wrote:
> Hi,
> 
> Apologies for the error, this is v1 series.

Please make sure to send the next revision as v3, so that the tools
don't get confused by seeing two 'v2's

Konrad

