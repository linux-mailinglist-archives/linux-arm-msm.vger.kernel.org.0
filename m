Return-Path: <linux-arm-msm+bounces-112723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /6u9LwGZKmogtQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:16:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4767138C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:16:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NAjhRnoF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D0vhFYY6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112723-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112723-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACBB9327E547
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2DC3DD849;
	Thu, 11 Jun 2026 11:12:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A853DCDB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:12:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176339; cv=none; b=iR84VoLLQkO46kegebh3LLleJLiNIBtkgae8E1te0K/srVaZ4yEcyIUttFS2biLZhA+GosNQ1JTdqEoRnt3vhmxBBk6CIrE2nGoYKDpeNujZfoHjMLZuN07JXDH/gUUoE4qvAJml5iisWRMtYhUF1t2BrjUqz2t5+yoXpQhVBz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176339; c=relaxed/simple;
	bh=k8RSWna5l+sutgVFwIL4tV7HYt0GmcYYL3d9N0V3OUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1+zQKOh5/bdUR6563CRZjBd9KhegesqlXMAW8D+WpN+v0fS2DMHhw4jNRWgjyiO5XvqIFKowJSFkeFNRQSIPnjW3nj006klc4CjigNHa2egogu9YlWyjGQaFQDYUXE+N068j4XGIpXWWWed193i4gQ2d84bWf+xXE7s4UOdIy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAjhRnoF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D0vhFYY6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA11hY299660
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2YOVwunfwE9zdytOfHRsQTwQu8TbVNXg5l0jybiWzY=; b=NAjhRnoF68q3xKdd
	wThiFcCO2aGOsmuncKDZT1RXAzDDc8uGWF0fiUieDqzTbBm/gvSSgiUYzgNgbxoi
	FOfmfXlM2tV+6FVqckWlHfgvx3uMqDzRnzD+f/bwkpPoj9wmal/zMDik2AZmfV7c
	SfpPfX34PvL3ReO64ZrmTASYwC6YkTr+JWA4OpSeYEaK5EjkGZ28tNpJkq6WQ1bc
	XNaS2UHo8hItqWrqmSTcqBVbwDC130Ox6Zmo5E0VFfRp+Z5AfPDK7ZTZPFy9sbQb
	9C4vUAlkoR/csJTdxo9a++LmvDoj/gbKrgj0fHqMNk8yeMNZaPQZFAMZZGsBqzTz
	E/Ox5Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7032kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:12:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so6935571a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176336; x=1781781136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2YOVwunfwE9zdytOfHRsQTwQu8TbVNXg5l0jybiWzY=;
        b=D0vhFYY67IsLKT/blh3AY4oOlBm2Z9KX89DqS1fmZMVnvetpLXYSfQShQQa63n8nCG
         3jxxxOnyvamGqz98ssORWYGJGaIiiP90q0spKuJ9qLI0dEHZjhMWhdbzCwDayxIBf7KF
         ABOUtrB8O88gi9QkEjAk8TAeYAyoZF0Xm3dcgbRYwaES/vqz1pQH5oUJkL2x2TpRlB80
         4oOcuJXwxjNqF+nfH8DstO+Q0CNddND6K2XGjlW0gCRW9SxmGhVYLAMqb8gN7bNxl+0e
         5IAXzHIPHYYbp0cMHkw7vWfUcUJUXWp1+Nbx+z/ADfM8SaBvscAhsSCOIfoXV5dgCm97
         Padw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176336; x=1781781136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2YOVwunfwE9zdytOfHRsQTwQu8TbVNXg5l0jybiWzY=;
        b=ExyucYdRFi2zku+X7b/1OAPeiCoNpolcNm9vBo7VHPP/hZy6CMrMQ7BiTpB43Bnpa7
         k+xlyhF6ge+piWmr2Z2/3ybO1ekzrFm4V5N4Z4rP4z6xd8kPX+Hng0zUgf654AHd7i2q
         RckGNxHUXZkxbZzn9dgFv++XhE18Wn7zqE5WKvS2Wy3aZ0KNCZnk9GFVkLWC3rR29KHq
         XP2joabBkAWGglIGhlmga3TtXWW8c6W3rDB6ehY8M+p+rsnJt+0WDpyxbvIkf3h0wb6m
         YWLnuZinfilHwcJfyn7oryUpcVQb83jFqQLsETGCjyPiMhXY73W0Nraxlu2hjp0+xm68
         Ku6g==
X-Forwarded-Encrypted: i=1; AFNElJ990vAm/bTsGfn9ktajPjlXKqxRBEozltDb2oC6TrLAEGoj4h8l/wRPpIbwkTxlciw5sL/g7I2pawiDxV3R@vger.kernel.org
X-Gm-Message-State: AOJu0YykuaP9QANXjpAzYwmLqBm6rkjtevGXlogJPRwk4J7ch8lyAxrR
	8BdhEnDLWGjZ4mBX8nWnKU0DRralQEI57JyFixrpAlF16j9pQKfrA+sEs0wYbINHOtk85Habnks
	/b/B0npbWm5FpjTu8aKkjEn8m+F+Sa1RhL16faGaGsty5BfHkXQGWKiJZ6TUjaUIpULEc
X-Gm-Gg: Acq92OE9JUQzw3yLyRFSzkLmL2FuiSZAWuhRwng9Z6gMCzkyUbW9vVCufGoRmaBnMEQ
	U/fVCwzomNhFyZ0JoNOfzzig5LuRmJkUOTOVBwVW4K/1hR6JFk48g/LBgHwl+IwLiu+V/DSNjwW
	u8V8gw0wIa2WT9zIXtfAZhYEiflrZq0IOlWlNSFkeEMjDpWA9CMWV47n+Th4I9Exfi70q0CJU/w
	uYaBTF9Pa7N/05d1EOf/a5wIswCQqBO2Ng+ELRfveBgzFGuPqUVjKVCz6EQC509mDRiKP96kdcp
	tDdYpeyVpRL5rZ0Ls9iMeuw9nG7nfMp7Mam4fWGoOT2dRxJWXLSneO0I/kjsxwAZ76o5czVGYb9
	PQncbj3xMHgigIxZlPqxgccZOom9QA8pYI3S0Bj9/xaY1BI0k5GXNTXEQjLQ4oHA=
X-Received: by 2002:a17:90b:2d0c:b0:377:424b:59e3 with SMTP id 98e67ed59e1d1-377a937f654mr2732727a91.24.1781176336169;
        Thu, 11 Jun 2026 04:12:16 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0c:b0:377:424b:59e3 with SMTP id 98e67ed59e1d1-377a937f654mr2732683a91.24.1781176335715;
        Thu, 11 Jun 2026 04:12:15 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377540f7ec2sm2193426a91.15.2026.06.11.04.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:12:15 -0700 (PDT)
Message-ID: <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:42:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Q-9IgixcUDgMDZuSAh8iw4eMxqvtAU9n
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a9811 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JVF5FwQYlvdi58aEJx0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMiBTYWx0ZWRfX0fkRml6Ef5lD
 JVh6wL6SD+2TMK0l0kf5QpmGYZ4xwoXN9ilbyhZNt80oIn+tCK8WzndbIYqaUf9Lvw/uM+9lNVn
 Yj3hMLjwZzfNcogd27xblIp9foFd6IBoGOh+DaCkElYIVCGgkfn8evzzj8N3vQgK2ss+gZsNDA5
 CR72AwjZzzbI01bpyRKuysbD3awmDCSI0+iwciSAUEDf5UBwTxz4pxDLzRNOfeOXurqUyTt5qcf
 LRsePGXGUK/t8OWB6GQD+wdngj6gBVQffQ3XyAY+P1QYf3HMSjFDEsW97PhqV9bi5WE6zWk4uiT
 5P5TfpAwlI8ht6z21yYIdyx1m9oEuwGGLqMr5Mjp1iDhBwVNFS75tQKSOOq+xLtGho5u7SBliE8
 u8U7Svmz7y5MMAPhhzW2Jmr36v+yjJuReINHhCB9Pq0IC1FbzMcjhgz2xzoacNWuo+z5RBE3hkR
 xespKZ4Xsr78oXUL5Ew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMiBTYWx0ZWRfX4tj6//kTRO3o
 m/vaA2G9GhDtMNeVXJp7w9B4/XOK5x7PlCHbnxLWZ6EYoNmAm+FYFMPohEBtSeyMp8gZfSbumPP
 oEfyEPVQtMsLnwhso3TudpUpx6VEP9U=
X-Proofpoint-ORIG-GUID: Q-9IgixcUDgMDZuSAh8iw4eMxqvtAU9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112723-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28E4767138C



On 6/10/2026 1:01 PM, Krzysztof Kozlowski wrote:
> On Tue, Jun 09, 2026 at 03:52:56PM +0530, Gaurav Kohli wrote:
>> Document Qualcomm PAS remoteproc thermal mitigation properties used for
>> QMI-based throttling.
>>
>> Add:
>> - #cooling-cells (2 or 3)
> 
> Why 2 or 3?
> 

thanks Krzysztof for review, will use cooling-cells 3 only as it is 
backword compatible and will add why part.
  >> - tmd-names (thermal mitigation device names)
> 
> Why? And where is this generic property defined? You cannot just
> sprinkle generic properties in random bindings.
> 

Ack, will add why part.
These names are matched with the thermal mitigation device identifiers
populated by remote firmware over QMI and define mitigation devices are 
exposed as cooling devices.

Without tmd-names in DT, it is unclear which index corresponds to which
binding. With #cooling-cells, tmd-names in DT provides an explicit
name-to-index mapping. Please suggest.
> Best regards,
> Krzysztof
> 


