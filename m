Return-Path: <linux-arm-msm+bounces-90852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH3ABcjyeGmGuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:15:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8347B9857E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED4333086AD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE4425785D;
	Tue, 27 Jan 2026 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6n2kADB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCrXuTsD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4D035CB7E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533829; cv=none; b=NLCu4QFvPQrnH4MJbZKTgctsPrlnLBqs1zSvsxWiA5U8uXeDwsmEdCdfRcscYtOU/52PzjHamnwbNc27tGMKhVJHHUutA3/Ovj/Ajilt9gob43u9mAYfqeoetmQVkIa/DlfEmK7imNMpOP4cSn6VHScFOjr+ua7mgoZjmsSu/CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533829; c=relaxed/simple;
	bh=2t1Vf6UpwTpD+0yC35m+4bzwOPrmuwtJstpwaHE5UVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/0QiTZ3RRyFV6vUJ1JemLxEOY9CbEDoXA+5WnRU1dnWTjDHhkAXuqAPfQqlSf/gbDe8Ekv+uhpIA2+/8pUTlesh5qz7ZSFNCijQiuICtc0g/uMoYFhh1/ZpxHBig4utG0VYva6k77iDj4kbF6XLP0lpOkfHwdbHz4RsVR2T+L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6n2kADB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCrXuTsD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RF40Gb2379287
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/yMpzSpDxVs8Dh/5bLKNN0uh
	ExC8+G7Y0mffS21qSd4=; b=K6n2kADBvWEbbY3qfHQzc3TXO6nTFmIANR6lkle1
	som8Zx9h8VUNn8nT/CDgUBEf3qBqw9lUmBikghudNIvEHhlOKndEwPFz0/yzmdGG
	Gnwgthf5phgSjsqOzKDgK3abjT/eCjWyzBAOKLpkp0NWKjw3LuDQqkdQdhMtCbCx
	j7BAz5VsWZFWNg3L1eeRx9YXCz+mus+v+BuU5KBDD6bwhzSQwNqyHGUZA6nIeo6x
	1W6z5YWTt95LkQJUCuTqd73Z43fhcsmfGkLbodwmpzgBeCPY+EL3LB+hH+t5xW+I
	CkFAbT6mCmROKovjoc6My9LO9ai4nXT/vWd6Y1XerXml5Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr9uyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:10:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5eea2aa86a8so22179921137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769533826; x=1770138626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/yMpzSpDxVs8Dh/5bLKNN0uhExC8+G7Y0mffS21qSd4=;
        b=WCrXuTsDzZTZr18/Tzga8rXgKDH20EMd8dLfFmeFH7VhT1sRcYnF7w6o+iJJkyEpn9
         1vnhzY8P4FXQnqkxt/7DEPqYdu1oqPIK6R5bHC7EIRyuUOAWu+o7+D2wLqNb6EbloJhW
         BATys/j2V/ROkWlA+4XC9Z57lgcclzpCkL9tUYnN5Pea1VqgL+92MgT3mYPnF/QQdUZ6
         oR3+dvmYgxIuRbfdGx3Cy0hCmeQzKANOSqEQ01XGLANGBEcUlKU0ai6dpjrn2YNfYlaP
         XyjN6A9bX2TdI4by4oIrn2APnWspUk55b9ORRTB6c4RJj1vKDQaXdMRWw/R5vH58uN3e
         geOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769533826; x=1770138626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yMpzSpDxVs8Dh/5bLKNN0uhExC8+G7Y0mffS21qSd4=;
        b=ZsgrqrsEb2D3FofexZmMm2cdEt+vwCyK73I+d8jISFjyNvE6U0pIPiCgIvVuyqGz/r
         7d5tS/V2xX4is04nbcoIaByydLV0a8XQlXRkifGMCiNMXXiCIP2fSxT/kCBLwhOEA1op
         us8XOXI3VJscPADiTXbZR7fpQN9NyAh7VxATxAh/b3yEoxcbunUrTpULf2cDBrgLnoFn
         n7LtuMSfWRlDibEDuN4OMBiNNkK9+rwBdCHchCoOGwW5i4oBZNzSeEAMf/bF4I2vz3Kc
         nmPzFucg4P6RVmY2sNL85J09nOdXJkqchdYM2EewwWMPRvCUObbOJiHQbSobfEm2sodf
         EQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1IKo/WVfZbs0xbyBh27VYuWD7QKGVk0drkP6mHzkEUhVxNlFJrQF4t2mfRuWcTsF+JWA38ZEbK1ue8EIL@vger.kernel.org
X-Gm-Message-State: AOJu0YzSKMvjG0miO4+aRZamg6keWRNFnVlXqZLZsQaiGIZo8sWEfIAL
	9w+/Zh2pKm3NK1yIl5CGdPu8V1Qcl75oVvRimOt6W0hVRI+Ej0v/aPMImang9tLwIh/IxcxkfBd
	o+ly9MgjzK0PdyMAweF6N3gg1NENdGoakuYFnLRJf+qioMb4ivbWhTfxOyEAfNBLXvYmX
X-Gm-Gg: AZuq6aKHkdah9CPlZ0Eo0CFVMEy4q6D+ngWM4lIu7qOqwqGyzCZIrpOISRtmsYKiJPX
	gyRaRIhn+uRYJ0fJDGjOnBHVbABSBAecD28FVp/f8qGu+cggbopD3/a0Z4YonB5nM1zCCKx6YlI
	+DaIMYUJwev5z4jvQURGZW3oW0nZnyTLgfIEIDCx2D5Fcmdy/fzqngvxqWzmnCCU4c7TzinFQe0
	VJXV7EVM87Vr7onhqSByhqX0X10O31WcV6+xcZ8ygRfi0c0jxFG9xv/RnIxx2cuJF+t6ULl6Sif
	Q+H2zuv0ypVVh+1DVxGJYQExCFdvS2GV6CYWLz+xcxmKRAJJ4n0TtJurfFa1Pm8FLrEr87EedyX
	fcFlXSElR4rDubLp0NaCbEdSfYx9esjw+WxJb4ZxwelyYBxdDzjjIUrU3+PdNNCLnnOs+HVx2VL
	NQEnjOo64g48GBN6IK7KWADwo=
X-Received: by 2002:a05:6102:2911:b0:5f5:2b1c:7551 with SMTP id ada2fe7eead31-5f7236f8f1emr1322131137.19.1769533826130;
        Tue, 27 Jan 2026 09:10:26 -0800 (PST)
X-Received: by 2002:a05:6102:2911:b0:5f5:2b1c:7551 with SMTP id ada2fe7eead31-5f7236f8f1emr1322121137.19.1769533825707;
        Tue, 27 Jan 2026 09:10:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bdca0sm49577e87.94.2026.01.27.09.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:10:24 -0800 (PST)
Date: Tue, 27 Jan 2026 19:10:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] clk: qcom: Add support for Global clock
 controller on Eliza
Message-ID: <snwge2tfgbn5l7nvaez5v6h334hfhsaeh2piz56zuponxkxypo@73ar5opadfjb>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-5-ccee9438b5c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-eliza-clocks-v2-5-ccee9438b5c8@oss.qualcomm.com>
X-Proofpoint-GUID: gU24nolCFtQQg5EohAD0-voxErkyud4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0MCBTYWx0ZWRfX66giRae6ssHB
 6kehouoLfH1Qh0k8+j6lRKxjrrZC6CrAfGGR1AT9yMf3Wn8DRvRLMcvEB3ST0LXUcv51efgc6wC
 PfkPsAdR6cXrI1piTowEULlksukR4tiqo3V9Lk7LkDy4MizLt9H4MThWZyCQa6LKrAD+hZucbw/
 anp95sMiX9+o/9ivflTAVHVUXECAE7jLX4/bCu6hB4NKgIBD2N7qsKPXag05naAOLbf4BZHIOvV
 4VAi8Vl08aZOj2Zt9a5I9/bCv40C9IR09sNONvSiAKxIKrPCOXOssPvyHsIHkz/tunDPi0bcr0Z
 bx77JEAK/hubjG7JvXjrXCo9oK0RErm2MgM7zf0O3zUOK7MPWL9IygitWUTXVT2jcK82pSFp+UD
 h039GDCclVCAjbMeKB4ErDjcldzsXOTI77TmFqXsU/Tt8vIj2oAYA6Nps3Npx8rvOxPDfNXCeVf
 8qoMShxoLZDhAJisTSg==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978f183 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F7eGajQwVCTwq7oO_cwA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: gU24nolCFtQQg5EohAD0-voxErkyud4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90852-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8347B9857E
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 05:03:23PM +0200, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for Global clock controller for Eliza Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig     |    9 +
>  drivers/clk/qcom/Makefile    |    1 +
>  drivers/clk/qcom/gcc-eliza.c | 3160 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3170 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

