Return-Path: <linux-arm-msm+bounces-104175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNflDnUp6Wn9VAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 22:03:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD2644A6B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 22:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18F80300C7F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF26B27FB35;
	Wed, 22 Apr 2026 20:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euWayNQ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enioLelG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972073F1647
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776888174; cv=none; b=RHblRxaPWUNggOM1HFxf87l7tRcrDVxG5Ut6WgjMAmLpQqbe1GuYTp76bfuwr8Uhzt8HQo+3VrEHzJKnLzbwvSSl3iS8Tj2weVuhEG5pJ2gDVHATWCDmIssP0cGUEhntW/HhFQeZ9NvVxkq5BdUXhZVRQ1gmiIlv03AfHLwEeDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776888174; c=relaxed/simple;
	bh=jMYpbLL64WOaWpsgBTfjMt79RbB4917t21R2mPwgWJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPj10rr+Dkq19E5kAGQophbL45GQJR9Fo/zc38UjGIpUlSu2RFjHpG3WJWI0cGYPThkczgstx3JCWL4fKFT7Ur65cK83INDgnrI8imyVY6XE3Jak2dXWSflZSuvute6hCAPWAVWvnIOvAcZSMdJqW93+ge/y7jloRRqY8HDQOHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euWayNQ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enioLelG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG9xVF3173170
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XlA+3Fg8UBxQ5lYzPMzvkMyS
	dKoVx8IQ0KNPVbZ/tKs=; b=euWayNQ6aS/msB4QyNSPCgqo4V2flm5fNtkCaPMH
	9RbWrFQsIG8La8+U60xsfBVl+WhrqsVDsyJvR31qT1bV1+oM0qlFuVP+wCZWjFoo
	yvUW3+cCFdbUwkMmRbEBh71ZW61hDN0ESzy/1N7B3Lqg2QvxYAWdlqgKst0XLIen
	azeT7S0VL0ESVMM9exHutL4aQADOSw8W5rrBR0d5BmTUn8rs8hvsj37pki4BMisK
	vCfu7APh1IW2g+7QjueTGtIPTxMRSDi9hl1juDP1MzMp2lAQKgw7k57jYeJQtmjk
	xUjYzuELKHumTs3PU+j/uzLYreK+UgBE+lYcfaJiHigcCA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1m30tak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:02:52 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-47018d3424fso7955716b6e.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776888172; x=1777492972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XlA+3Fg8UBxQ5lYzPMzvkMySdKoVx8IQ0KNPVbZ/tKs=;
        b=enioLelGzskDQALZlbkz1qeEfon/19ywmi4mKbVUs60N3U9EpCMPjwPMII73AVvRrx
         hVCmNGXPbxaKeswb6d8wzMhhxm5Ttc/Gig9flICKC5lxX3Bdg2f53kMxm8ejHBmigjaH
         nEjn/NpnoH3dNTaQoVWIVVDnApTyVnCrezSvTNAKw9OUJRqS2iLMcoOXufgYE7u7zNEf
         hy2swfO57kr5xMaQk6IXeFX8IEKa70UD//0XwphGxyQQv8CE5SWSjwJpqtDNZDeRQ2BJ
         j51oMWkbkjpPMnHUxoNfq5iwWjd3S9Ba+CqaNGVQK4K5NJYluKbjICFXLcHyu6q5VrPn
         mDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776888172; x=1777492972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlA+3Fg8UBxQ5lYzPMzvkMySdKoVx8IQ0KNPVbZ/tKs=;
        b=Q1LkHoIsR4C2Bv8OFKAaMEF/UVEZw5Vw7x/tB8o1C0pI9wjnqq4r0fNKA4ZldmtdcA
         9klWaTycrKKOsJfYfl4Ri1MmioO9W6r/tCcQVC6+8yt2AAykGiMsgULsx+upJeGZ8BCW
         W36nCUJCnyI0NubTDJg0jzOUaDfR6fUJ5AbcqRsG843m9brx3zpkUG0Pn0ZMr7U4SMok
         ZB/ysq7nT41h3qTAijs1f61iuUAX38zBTuxndTzTNnm7943nGagTux87nGW6zPEInywQ
         rrw578ejqVIFNh8oGJ4a4fmW1YZP/EzQf4GeZnn8+V5KJTox6iXjUU0KO+Sm93zgZjqd
         3o/A==
X-Forwarded-Encrypted: i=1; AFNElJ9GeI0QtASN208ow0oUOq/XmcG3WOFjolnKWQViknjnUt+UzuOCqrfEpxiSnUTaXmBzl9wCpRRNLsqpnIHy@vger.kernel.org
X-Gm-Message-State: AOJu0YyEQi1PELFb5808/y4+NBACX3a+M02QenmSuJhMUe71IdtJ+rW2
	X1UpuPVBP62PSGroZofBcxCmW/rm+bt5xbKO95/Y5wRFXJ0oGiLFshqrNcNOxswS+T4gTr5rm0u
	LqJIyrMm1gNSspRCj3cb2xRtnKBzgErpHtKqohl0C2kO8KOytTDIWM5RZS+rnEFlQnFfp
X-Gm-Gg: AeBDieuyZPIDzkVVKPyQ7vPNLRJAYO4eobMMVvVnTRvptvm+KkrIgpFaxmcZjMSAjeR
	seEt3kRSNW3kBkjwk0S7IZQBJWsRBfcKjRu4pNlGVDdd2zMEKEcmWdoCALBtSHczygP5UcvpKLs
	IlIrX6nXzO2L2PtYi4Bt3MXFCE/iU4eRz/OOTQX3n6+msUNjaFgHDH+74sAQTdaLMo/vV9pBNS/
	xaySqmbaVqs7zhPDMenfFFSH6logfALHZzLHmuC58de6DvoLXZX33xI6BM7aakB2UQK3yZZM6+7
	m1yWFGOzaJNcsni/sOzsBgTG9rghZwxq8b0CGDRZFaefXBZHUMhqePJCa6rz7ZKqm5IApLhjA9n
	beTaTbBjUHZ6PbNUIDutyn9VEn8DUui/sna6mvGgXnFjUA3ugvuFF2II15F/x+b1t09k9CBoIxg
	ZUrxq93fjpPXzHa8RHqahd82SolpLGf8z6AiU1qhm0eT/qnw==
X-Received: by 2002:a05:6808:690b:b0:46a:746c:2d53 with SMTP id 5614622812f47-4799c917825mr12518466b6e.2.1776888171973;
        Wed, 22 Apr 2026 13:02:51 -0700 (PDT)
X-Received: by 2002:a05:6808:690b:b0:46a:746c:2d53 with SMTP id 5614622812f47-4799c917825mr12518421b6e.2.1776888171535;
        Wed, 22 Apr 2026 13:02:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0b6dsm39086411fa.20.2026.04.22.13.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 13:02:50 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:02:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] interconnect: qcom: x1e80100: enable QoS
 configuration
Message-ID: <ndutslrzvabc5xy56ooddkfs5jhxsefhdngqde5migrybc4nk6@m447f5sloya7>
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-2-bcc2afe4cc78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-x1e80100_qos-v1-2-bcc2afe4cc78@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EH8JIX9dUTfQXyWOwpbza7CCrBmB4pWu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE5NCBTYWx0ZWRfXwJVAZYl2ugAc
 /7BGo1SIDod8B4bDmzCd64YEjcUAoyuiX4pM7iWVaQqPTILSXFhsNswn0phDY4slZTq9VdJFa2M
 pEZQq8m9EY2HP1FD/NlKF9Jl+FqLgx345uPq2Ny7ju3c86j+RRvFqB5cVyB+mX8XN6zEb4CWrBb
 PDJFoWtpDHqVYWd2TifODQK1yADRA5WLH+3htty2XeUGNTFtHJvc41AnFbJDwYhuaPD9etRzTpb
 3MNFrEpiq7bSGUE6wuTmYjhyJlqUk5qC9PzJwbzyDdfGLrV+DwVOwSFZU4sZpoimOOXT/ChoZZz
 zBrVWGrxfAVsQBZR3W++EeZpOx1fH9JGEKbN7WrsZR4n+loVtmdm/qZhyOAbhyVbEG9EA6lEJ9R
 1EYQ22kv1k9bLyJjTOYsiAbhiFUfwygqdRDJnxchD+uYm33EmWnq/QG7ugYZzMYRZ6UWq3D1LHp
 0zDLYhQF6v2w9tTnOlw==
X-Authority-Analysis: v=2.4 cv=PsOjqQM3 c=1 sm=1 tr=0 ts=69e9296c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=OjuMvAmBQBMAj6EH008A:9 a=CjuIK1q_8ugA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: EH8JIX9dUTfQXyWOwpbza7CCrBmB4pWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220194
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104175-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BD2644A6B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 02:05:12AM +0000, Raviteja Laggyshetty wrote:
> Enable QoS configuration for master ports with predefined priority
> and urgency forwarding.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/x1e80100.c | 485 +++++++++++++++++++++++++++++++++++
>  1 file changed, 485 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

