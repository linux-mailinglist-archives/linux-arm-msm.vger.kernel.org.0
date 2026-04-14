Return-Path: <linux-arm-msm+bounces-103089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLILC0gM3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:43:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE9F3F81A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D56F3038F78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB5B3C5523;
	Tue, 14 Apr 2026 09:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S22rCgdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FR8wTGFC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BDC3C8724
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159510; cv=none; b=nQ+iGW+df2jTU9wz6mf9F3VnwMYt5V9RKMvSlfFXcvvElxwTQq0tDXdti9B6rlrHEKc/SWZrw+w+7j/QiKvYYv1YbXWInYHSYBFFVFiq0/2Gm0Wtc4wHrr4fS2mRfJ8IDYqdaixBlgYGyoYUzaq1pONSUO0zBNeo8MiIPK4ehv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159510; c=relaxed/simple;
	bh=KTvBSKVfut/C+3RayjBd5rK9yMr6kzjkGYNXJVsrWJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxzBLmZH1hgA7ixRHOOeUQkpZwQ5v+lER651pFZRuS6Y1kRqH9FG4VZ9LrKGrdv2HNsEfjEUFhi9vZ4TGP6VQNovL7R89dAzFCkYL3SLoV9d4UAsoEult3Lr+sOZeWKjLMbsgLrk44Yv84jK4vwus17nqpC5R8VSUjV9eRk0Hnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S22rCgdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FR8wTGFC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6p3W52633571
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXDrQw+KIE/ShzXzNGZMw84IS+1qYKv6D8NCeasacqw=; b=S22rCgdyk0Ksxxmb
	Ew9Th1pxGW7YLVdkyeHP8gH0X3S4KZI7lfVccM7bmNxkK6ziB9upigv2Adjhb7O5
	MOVqpaEKleG+wCZXgqH8ZYeDYn6TRtKFFVnmAwuOEawzdeqkbGzxYuI2zClAag1k
	YwprDNjzsSYZkqLf1sOupW7EQ4dShtdetCHJbswvDkkHdn7LWh5w00jq9bbjgF5h
	WZamGRJe12Daq2EtZsU6+wdlOuFF2ZLZ5ERrnAsZEJhSiZ1AGKCHV2ZYh/oshCoo
	aNjZ6RFDi4JmsOKu9qFZwel3OCVwVz2hYsVE5ai9KOHnR2i2QAZkwPYp3UvOsu4A
	gW/tig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca4ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:38:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acb4b340f4so5169676d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159507; x=1776764307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZXDrQw+KIE/ShzXzNGZMw84IS+1qYKv6D8NCeasacqw=;
        b=FR8wTGFCcY8etnNmNhdDG+3XZnP7sTId8MPPwmFhT/LeaoIk1GGH0YheweIx26TqFw
         /n9Xzba4XhHag2ge/M606VOsrZEHa8yJmPal3ubY15oyhQhpGxV3Yhr9bK8L4uxVqBxS
         CFLvSqQP+q9Qsl/0jNYGi91ZQcdp8ZXgJ4jvzH/BMWxQpvxKHeSiOD7UTTVbAfpSbg+Z
         VRdH9ZgfYNt9Kj4/Pzr6pKRCNSR7zCS7oJiAsityO7KE/mFnUjV3O/X3wzCbGIxVDp3c
         HkMSiONv1mPnbpj/mV0jDPwPbT/vtYnXkhISlSPwUzZQnxIqYyr45jAagZbD7VXcg/3k
         ftUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159507; x=1776764307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXDrQw+KIE/ShzXzNGZMw84IS+1qYKv6D8NCeasacqw=;
        b=V+jx4KPys5mFW19hIsTp9/ym2KKsgzHbchVjA+zOs0ziQbxuSrea+wBX4RYVQspSmh
         U6/gVdXJzxe2U6JDlUb9w1XhqWdkHiAjzMVcvwB/sPohqjqoHa9ZktrCW/Kt9SF/HLdX
         txjMutLH2EqWLJ7bq9Drz4P8uURu9ZVFPorUDoYWZ5UXtvBfzpTOw/4td20RFFrBxgjX
         mgq2Lf9VlJeM5RCtxfZdoNfvlMFjz/YL8sqRZx0rK+0hsR771aGh6z0kiYmPzuWvxXu5
         B1mTIJQB29W/ljklnZw0dpzoSB0losipgBfkQn7QVqYGy8UGEYOvBGQnPb6aqh36mDnu
         OeOA==
X-Forwarded-Encrypted: i=1; AFNElJ8qGoFZpfPSWcB0JF/9lNmH26pRlnPFtEsgX/Awq9pAX+3PF4o9CJECh6KRVdShQUkg4w2luFiP3ber2G8U@vger.kernel.org
X-Gm-Message-State: AOJu0YytVgRyAorWKZf0NoF3gR+Jb43J+F8lRi2JySWZ4NkdWbO1CScP
	VknVl0nut85WdsH2QbknEQ7eatKbDT62MVDW36r/LrnDaoBN09RDCBovKxMRtIM7rHxd0wBMBso
	Pld+vLGqPwD904u4IXJrLBK8TFxYgqdJsMPnIZB5/6WiE9ueVXLeBCyQeFas4yjExpSW1
X-Gm-Gg: AeBDieuicY/aUVNzvKFq0YBrmDfMufrPynzgWCR059C/+UtMp9aeSqkx4AyspDDjbS1
	zp9YaXr2jULFZQJn+dgl5yEj3aPoPkTPtqasRSIi8Ux8GCBp2LYXAIuRfgbwHgaTMS3FvVv9rdZ
	YWYzHIBszxvOr74Wp+FMkUmNddmO3KaCxn/tkiaoir8TL9hRU/5aNDyfAloVREylF4NKmgx0kiL
	P4v62fxwPR8QWi8yn0gtM2mszngtAzVBYQDE4R+3XKHDZTC/HcbZSAD/4XUzWtfadvsuW6lJphe
	q3mg1lCjWtwAUKBzXSJeiaGlGbn2E8sUrP7xAijjBcKp4BI1OyfW5N56Uizf1GSHdt9gYw7kfUt
	mZ+K1YWX8jeUy+E3TLipLuFx120DsSgNY8o0xRWddI8h9EJAGysml3Iw2wqKALot+bf9C/ixZNg
	gm/zTSMZJhH16OoQ==
X-Received: by 2002:a05:6214:260f:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8ac86ea9d23mr177075076d6.0.1776159507684;
        Tue, 14 Apr 2026 02:38:27 -0700 (PDT)
X-Received: by 2002:a05:6214:260f:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8ac86ea9d23mr177074966d6.0.1776159507325;
        Tue, 14 Apr 2026 02:38:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1810sm379610666b.55.2026.04.14.02.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:38:26 -0700 (PDT)
Message-ID: <5d3190c1-e09c-40c2-9ba1-df332d9f7aed@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:38:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] ARM: dts: qcom: msm8960: add SMEM & hwmutex
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AARkU_5kKnBQq6o_MQk20BASvQ9uOrBv
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de0b14 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6Xm4nHdHo4a8rT5D54oA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4OCBTYWx0ZWRfX0lns5uwmUqET
 Z09SEtXNLoP/uDJAebSB64mcVYt/aaxfAAyHyCgZXUCplo4NLvNgWOIh7W0Hv33Ni8zpPYG3lrE
 PNu/zvqF8aQe+QYlYA4F6riFvAAsXSA6XH42qUJtrq5xT1vC0qDFcEX8lMdsPZS1/XtcanAcGIG
 +kw/u4LucHHVHvqEmE6l/P680WgRbRLa/bDgor5xpfco+xfRiXBwXKojFslNIoKbxDNvnb5k4Kb
 VWJlwsDuuqHSMii264ZiE+z/R/jnRMtEYSQh2HUUQ8SnR9JannBpVq0C4Ehvz4MJfHazpJNpobM
 CV7FXfFuWQYfBkIufowI/wB9w6Lh+34W1g49I47g0NQIP68V4o/ZV+phfT+YIE+HVmzVJNCg2G6
 Zjn2U7G+aqmUAbePKRzAWklpskuBCD0XchB659wcj8MSJoZjEv6hgiZpiOYY70faf0vPXUmBScd
 IwH+Ss1Z2nu+3Q8mZfg==
X-Proofpoint-GUID: AARkU_5kKnBQq6o_MQk20BASvQ9uOrBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-103089-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6DE9F3F81A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Enable shared memory communication and add the SFPB mutex for MSM8960.
> These provide the foundation for inter-processor communication with the
> Riva (BT + Wi-Fi) subsystem.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

