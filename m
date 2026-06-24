Return-Path: <linux-arm-msm+bounces-114354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hi6gLMrgO2qeeggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:51:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A78F6BEDAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:51:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q2+ubZB5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Du0nmkWC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114354-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114354-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 529A43054C63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DCC3B7B7B;
	Wed, 24 Jun 2026 13:49:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04443B635E
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:49:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782308947; cv=none; b=mYGAqhtWmrpukOETYomKh4YZlkzyNPGJPPEYlmSM2IP4ipa8OuPl17ri3cighOxwDfNTouiMU1gKiYKGlskt3Vqj7Y5fdP6wpTuFLLB5qbxv4W0dkDr1oy2LmHQjqzkaz/WI9275HAQtDPOdMHEIQTIpaKfhKQ7ajaJIj66qhiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782308947; c=relaxed/simple;
	bh=lbOJr8vNF4o5eQxkVi7i/+7YOpdaLnzLqUqUbwV3fSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rA7mUFlLqf3CLQPo4npa6EKAkedYbG4Z3dvmgRNc/olausvZkV4VdVJi0GaSFKT6rzAxpO8f4BS57mMj5E9JO3+vBt6VYwMHaE2IMuu0daZQE0koTxmo7O1cEqsSPwu8ri5HfSwMtyqApBP6tcIhIswTO54Ku7y4Ye8O5dCY4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2+ubZB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Du0nmkWC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANk6B2503629
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmq91jkGvneoxWerkaeuBOohJIvM59ypbHsXw116sQI=; b=Q2+ubZB5zLNJ3dOv
	VXFh9X/7hoSGO1l1JdBxrUF/gifl7W6QphUEhXUr8DjvdHJz7ZqGzRspN7NsXxld
	j69LW9pb+XnacD+uchFMTsB6McekZ3ULqM8sbrG9kjKlMvbgdjAI+iEj7ay5I0la
	Mq0d8QG7QXSTjM+MlbuLTl5jOJTVDZ1Jp75zUF3aGf2dqUwbpta7XWY//ii12VGk
	E78v28XA19CmSpUNaT4ciJF1e17SrO3go3+q5iftE8n6z5wo3MkZFwKiRljlRhB2
	RhHVrt/VQbekpQrULtDSGOZflqCqUzg9AN2B2ffx2EmWO+QSftX71erse3iVguOo
	LQ0tbQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfaggg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:49:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8453a81b846so1539460b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 06:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782308944; x=1782913744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rmq91jkGvneoxWerkaeuBOohJIvM59ypbHsXw116sQI=;
        b=Du0nmkWC+rQGnhZe6bKshtjSQlc6s2LvfSTJLysDSRlRy6Ot/6dbmCod84TZc6q//a
         ARYCP1ItDPRl199wFKL2NW3mTFsHucQt00n7/oEtWjUuHe/gaphFQaHx8N8SE5ds9Sdz
         iyFblgngzESgL0nQ5W21n2Vxf6M2efRc4KqJs9XhWESXOKXcgSWhDymmHIHbBWqmwzYC
         bd0ibjROdpD60F0PCkkn1lwAmvLc01iSMJyxgFSwR5P3ELRni4lws0+WifhXI7naYcNi
         j8aSECGXgOuIsWNseKqepqtupNzvk8uKfVfUTXGNtfiDM4yOm8wD/T+8Vj6ZUitJEd+O
         7WSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308944; x=1782913744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmq91jkGvneoxWerkaeuBOohJIvM59ypbHsXw116sQI=;
        b=cAvn9m5BSfTafp7SbssbPVeBJ2iUtUj+jXyKGKNQWdrRbbkdn34WitWQkmr8yNUg/U
         WbBCWc94rMvCnbBCaYCIvtCSYtcfSwQAEqHw4iJlkkKFhBr5sXQ1KGF155dPjNj3xLe6
         zh4BQGHL+j+EcQwfWJJybjp9DscQcL1TetuSy72hPfYJOt8gXs1/tOFEUftYNpcErS+i
         piqvCEIhgjiP88hKD6U2HfgwqTtWTkf3cxXx+Rmepg169u/WQ/RYwjniEocdCqBUvfNm
         FxsB+fGEKIete+yZnHam9JGEAdXaqUwGBOxj0TzrtKvs40iSQviG8q49csu4KQ4KZZIl
         UL5w==
X-Gm-Message-State: AOJu0Yw1KJpL4iiz7zjbCxCFEKiarAME1DOXD7tjPwzS69d0X05LardO
	j7KMQqglrEBpyaJw4US4vjMJVZTr/EjvkWIfyDhBgseeBBERYQc3BinqC2+7FUh2ubCERbsjAEs
	wz49dwsM74lnF3saRN6yZZr562EZGb3a/+zUbTqMyDX+SeyUlrMdkWWAMcUnIwPLQnsBI
X-Gm-Gg: AfdE7cltWVHDx8zCtxQfUlHLAGB6tmF0uspeD64RxHD0qYPNukVuBSxIqPn1bQsvZxZ
	SzOXiOI5y7GNVkshwCJPyylpjwt+FmMw9SB4RV38W8AHH1m5Fpotsdqf85rKNbO2pVEbJXZTSEj
	JiYdGZZj583tDUnqAOQLcpKrRQOMOEw4j3UxM+1wzLUL1SiAb2fm+TW8H/R9uoT9Xp8VZicGYHK
	XmY90aCNrq/JCXCWRhIpYCILUtvV3zwMsi6C9uRuzjf1KYDoq+TDqawW1PBpQRBSlUJTlEpRqcg
	eu0Vu/a5/GaNr1zBA8BqQOgbuEGtO9XthNX5DiUPd6JrY3j4r0JQKMDGkeXBqwMCqMWkP/n/ji7
	i9T+yC7VSyWc3be6PjLbMW808Yrg80b99qHlpbpIce9HfcgzmPpvY4Af/QgjF89WVWXRMELiIyw
	Ge
X-Received: by 2002:a05:6a00:2e9f:b0:842:54e8:bdd with SMTP id d2e1a72fcca58-845a27b3f69mr4833563b3a.40.1782308944527;
        Wed, 24 Jun 2026 06:49:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9f:b0:842:54e8:bdd with SMTP id d2e1a72fcca58-845a27b3f69mr4833511b3a.40.1782308943973;
        Wed, 24 Jun 2026 06:49:03 -0700 (PDT)
Received: from [10.133.33.213] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a4127bd0sm2280981b3a.53.2026.06.24.06.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:49:03 -0700 (PDT)
Message-ID: <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 21:48:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3be051 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=t96WpxVnkgGKFerJHPsA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: i_JCxITf7EVlGiAtdOysexrwaKWY8R3f
X-Proofpoint-ORIG-GUID: i_JCxITf7EVlGiAtdOysexrwaKWY8R3f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExNSBTYWx0ZWRfX6I92o9uXQmmO
 7eBQJn0dThTBTcnxkzML5EyfzUbmQm4e3oJtwo6pHW5ck83Y6D6QCyVxA0slHyfe1MWtb3qwIFa
 8nWusV9DwtQiESI+w5MdgVQzk8RkY3s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExNSBTYWx0ZWRfX3tI33iow91N4
 a4JNEXVzbxMRSCkfTvaAD/nh6pxdvhcqzmilfgtOlwRyiVHk/LDRU3qH9YD4KTVbTcL7G7M38/w
 v+dQ5T42xLlcAnzz65dmFUQuWDatJ3rrTHG3lrSVuWTZgLgxShXyWxLQEqbgme+GmIXO4zyjHbA
 yqCnAbFIU2VzxXI0QikjB/TcAvhN6NO0aCdJ9tsO3HEtyaKn8rgHa3pN0wnWOiQ1zFxcF/PAL3a
 W+Jx9wkpMgYFC57K8ExVZVxyKE94DUVw8zr8ChgkknAji2zwdI+rdw93aLkIIgfnhTGiFlxFaZH
 lp9qgbgzsZLlSLEtOfYIKgWjMWkLhzXp8gpx+LXCGxsGXjPmExsRm7AtKVwXvuGOmxEL/8myLyM
 YJvKfdO6D7V9WkcvFt2Ql8PVsu+z0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114354-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A78F6BEDAC



On 6/24/2026 9:27 PM, Konrad Dybcio wrote:
> On 6/24/26 11:49 AM, Jie Gan wrote:
>> The AMBA bus attempts to read the CID/PID of a device before invoking
>> its probe function if the arm,primecell-periphid property is absent.
>> This causes a deferred probe issue for the TraceNoC device, as the
>> CID/PID cannot be read from the periphid register.
> 
> Why does it probe defer?
> 

For an AMBA device, the periphid is mandatory for probing. In the 
amba_match function, AMBA attempts to read the periphid from the CID/PID 
registers if the arm,primecell-periphid property is absent in the device 
tree. If this read fails, it returns -EPROBE_DEFER, and the probe 
ultimately fails.
Most AMBA devices expose valid CID/PID registers, so specifying 
arm,primecell-periphid in the device tree is usually unnecessary. 
However, for the TraceNoC device in this case, AMBA cannot reliably read 
the periphid from the corresponding registers.

> And is this required for all TNOC devices?

So far, the TNOC device has been added to sm8750, Glymur, and Kaanapali 
platforms, and all exhibit probe failures due to the same root cause.

I prefer to fix it on Kaanapali first.

Thanks,
Jie

> 
> Konrad


