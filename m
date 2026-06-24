Return-Path: <linux-arm-msm+bounces-114306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QS+mIsKQO2ouZwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:09:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5246BC6F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:09:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iO6CVxOX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=klYpxv2K;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114306-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114306-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 118693031114
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4745395AF8;
	Wed, 24 Jun 2026 08:08:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690BB26CE1E
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:08:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288530; cv=none; b=qROeqLMSqfNQGbiwdAtaGb1rOMQI5j646D0vGr0kpeXCrIx6Q4f9YBcrKnbk/lZVaxeYl68BnEwl5UX9UQc42nJC//q2EDjZX1SfWzxpHQxk+SiJzkCDt+GDcIeXN5B4SaLbN5ya/GJDmBlwXKuZmtiTTy4wZpuO8YuUzZeivzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288530; c=relaxed/simple;
	bh=PCatXMQ7Ma4Yl5HqX2Rm6nOrvsBITeVXW7flqfjEArg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmlftllwReAuxKFXwGpaZlLrYocLBi9HcVzrYUDbPtNijwDa2H9kK4oSZmFGYxnR9XB1++1eaWrk60PDRfn384zAJi6xfAlDpPX3emr/k7okwJW6mGA3/ZCeALbHk+rmwAEFLpjF6gjgQeQR+wUB1R0LYs4eP/wA/VhY3p1gX5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iO6CVxOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=klYpxv2K; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5trl01972145
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eJbzjN1RbygmG8cpQBxIz+wj
	rg/x7EicOMtlyIXDJvg=; b=iO6CVxOXgszHJNmGfHo9P/bONKEZ9MGqPSiYCFuX
	avzKMEcRUIRb4PFeKsCgp74mmvc5e+AT2KzbLN5fykGb/r6jSEMNwRNx3g+WghAe
	dCbUFPsVL4xgmp/H7ACa0eoDx561DHgbh92IW208bdE0fU1LocMSDK6eW4/owyRX
	b7HoZOcCMvIakS/M1t4a/lMv0u7U0GDUt7grrjSbEeHtHUFmWR7MD34SKtWftNgO
	/TvIcPEwiEFw0s3yk8No+2SLWrcph5VDmR+xBiutH2t6AYtVsatrFPkK/6f/Rgwo
	HsBySyQ7bbSwhBH1LlZJHvkb0l64mo+NWPf6yYQqUgbUcQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f00eva2wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:08:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso760029a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 01:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782288524; x=1782893324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eJbzjN1RbygmG8cpQBxIz+wjrg/x7EicOMtlyIXDJvg=;
        b=klYpxv2KaxXY9ECS4Oo32aNKJHfvtT7haHtCP1foYv0XpUoTB3nxtDpHEJwmCEDIJr
         45+JAUkgFcmwD5kN7VA+WuoSHgwAQKjbrXLMbd8SYoW9RJk92wtmW0eS2YIp2CT5hRY7
         YQ5nRKAMrkBKhODxx487X/+k4z5jn6tpnBJ+K+rNXL9SWXjEG9+e05iTN369+R8j8tB7
         F/GfiaoY17ULDFBOTxzXuTPS3qK1IzkQLmtekaBFNcZco7ZcSlUHQfHc5m0vwQpBq+4J
         xSqEE07f9f+WM3YWtoCQQxdNHoNe/Sv0Lekd65usYSQfQ2e3TZbxO271l+ZZmE2teLfB
         Y9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782288524; x=1782893324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJbzjN1RbygmG8cpQBxIz+wjrg/x7EicOMtlyIXDJvg=;
        b=rBZzXTjox+RHdx9yZwILnkj9IQ6BxNPbaBErl8xPk++UjhWs8OlT4Sg7aOimN/E5s8
         3n4XBhEBcFBMqcyP2/oqO8zQIw6rm/h2hP2346osLqJ1Y5Lv2fecXdNjX/s+cZEEtgr9
         OfSLOkjgo5T8DqClwQiSCGoVvdkFmDhUKgZhasdcNPGMnSyL7SgfP3tp/v5AcTk/1n63
         vwXogfZcaDWBiIDLoUaFqZ8GDEZRrrTR0hKIWcWN5gjWCJuXU8flzm8wDn0zntSpB6bo
         tPOQNAEayv6EQNqEqHoIvaGm8jkwipYPdaIrn8T2oxAuMzDTgVuMTRoGVHSsHDJX5LH9
         R1MA==
X-Forwarded-Encrypted: i=1; AHgh+RpmMs7bUPFuq/Ne2Llu2D+QYh8TZk2VhTy6r9hPv6ejwxj++4p2by3hUHmRQR+2XkvhB7a13047U4SIQA+1@vger.kernel.org
X-Gm-Message-State: AOJu0YwZt48lFOybZJfoFw79aQLt+co5r6HXqGN5CATCJbz3jNOqUJsq
	TPnT9rHanX/oQhiZpEq2HVuw+yqTUDiFdia4bsiigEOYP3zw6NmIJtnYHO2xqvnJ46jFuhWjs4m
	KIDYrSZvOnjuILUANHDCwzBECVchbj48v6vaxaNOKkjA4t0FjiE1v3aPzPop+NvxXN3v2
X-Gm-Gg: AfdE7cmQtHDueI4m88AJO1NhnEYpVQlYXFMT5ercVRsoEd1UFNeuBnTHL7W5cQEjOjz
	bGjMPBEdr+M4KyT13LDWbfrla5AjTGf9xTPBHZcgIMBdBgUOUzWZEFdViXJVyWRW+fdO4Q4bt4z
	fIcK9j92GvECYRq/2djnltm0W+AMt9nvThpj97zwzWE3/1eH16eYQYbe05BPxY+rJsz+T6EiqT3
	O4qhYZZpYq6nGObuaHF0T9EQjioLvUkenTdBhPRETQUBqZwhFILU5qNVp6fqtmbPweUpW3Bb07f
	2Y+lu+6sCOMjLXb+uZuNL+fAnZeChIilQpxYDeksI/yGBZOufHvgjLYtpfN1oHWa/vCfGShvh/k
	9fic8u7RbUwj4foGBXPGDRj+TnADOwmMSfQI28g==
X-Received: by 2002:a17:90b:314e:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-37de41c0522mr2784074a91.8.1782288523608;
        Wed, 24 Jun 2026 01:08:43 -0700 (PDT)
X-Received: by 2002:a17:90b:314e:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-37de41c0522mr2784029a91.8.1782288522926;
        Wed, 24 Jun 2026 01:08:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3ce544dsm1877831a91.9.2026.06.24.01.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:08:42 -0700 (PDT)
Date: Wed, 24 Jun 2026 13:38:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v7 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <20260624080833.wcqaxuhlch7ljp2c@hu-mojha-hyd.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
 <20260623-knp-soccp-v7-5-1ec7bb5c9fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-knp-soccp-v7-5-1ec7bb5c9fec@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2NiBTYWx0ZWRfX94LLV5BX1PJ8
 lbS927tAjMQdgQFzN5kmel7KBTK0wklaDHHVbHz+m6/nD5INC9IODowO91H6xv+SRBv/uuRg4Kx
 daP/XF/eXCINJSlc59jOFPYh5DN19z4=
X-Authority-Analysis: v=2.4 cv=JbaMa0KV c=1 sm=1 tr=0 ts=6a3b908c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xccAi-TjZwAcfVKLSogA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2NiBTYWx0ZWRfXwFujIV0arHX/
 HydaZ0glwmbXk7p7Lk4BUjuE1QNYoSTmzLkVV+vCV/f2iF1cVO/gBVgtabbhqItMupY+FhHYPB7
 O/VjFEo1h8J0eMVX2jQfnbJUk5h5ea0FqEfR9rLTTwZ1Kh4llLJeb0MTsD07Tbsw1O7M3xKFdYy
 42kM5SVHkpH5sbWQHzMLQKSHgbliA1zOnRxvm8ZOizwpDNSccuheZZPZ18Ptm3SeePvb3u4lE2e
 b3Jy7+3KbZqM0JHK6ja/Z+wkTcakKOCNTWzVrNDL21hCM4a5GpxVJ5hQVO9A5S4JdrD1oaAzgOi
 FDufHRoCZi/+eEETB87Wp3h1JylcT3Ypv6CdI4ZH5L8QTAuptW1urZRzi5qr/FP9S+67lfccxCK
 1rdI/VfaSoRN4di4eKyr+CeGWflbVg==
X-Proofpoint-ORIG-GUID: kLEkSLY1D7KbxiHb8gZ3gVQu-DFkZP4S
X-Proofpoint-GUID: kLEkSLY1D7KbxiHb8gZ3gVQu-DFkZP4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114306-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-mojha-hyd.qualcomm.com:mid];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:bibek.patro@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konradybcio@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gokul.krishnakumar@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF5246BC6F7

On Tue, Jun 23, 2026 at 03:05:21AM -0700, Jingyi Wang wrote:
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits.
> 
> A new qcom_pas_attach() function is introduced. if crash state is detected
> for the subsystem, rproc_report_crash() is called. If the ready state is
> detected meanwhile stop state is not detected, it will be marked as
> "attached", otherwise it could be the early boot feature is not supported
> by other entities or it has already been stopped. In above cases, the
> state will be marked as RPROC_OFFLINE so that the PAS driver can load the
> firmware and start the remoteproc.
> 
> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_common.h   |  6 ++++
>  drivers/remoteproc/qcom_q6v5.c     |  3 +-
>  drivers/remoteproc/qcom_q6v5_pas.c | 68 ++++++++++++++++++++++++++++++++++++++
>  drivers/remoteproc/qcom_sysmon.c   | 19 +++++++++++
>  4 files changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
> index b07fbaa091a0..b0e7e336d363 100644
> --- a/drivers/remoteproc/qcom_common.h
> +++ b/drivers/remoteproc/qcom_common.h
> @@ -68,6 +68,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>  					   int ssctl_instance);
>  void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon);
>  bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon);
> +bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon);
>  #else
>  static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>  							 const char *name,
> @@ -84,6 +85,11 @@ static inline bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
>  {
>  	return false;
>  }
> +
> +static inline bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
> +{
> +	return false;
> +}
>  #endif
>  
>  #endif
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 58d5b85e58cd..a11d8ace554b 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -202,7 +202,8 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon)
>  	q6v5->running = false;
>  
>  	/* Don't perform SMP2P dance if remote isn't running */
> -	if (q6v5->rproc->state != RPROC_RUNNING || qcom_sysmon_shutdown_acked(sysmon))
> +	if ((q6v5->rproc->state != RPROC_RUNNING && q6v5->rproc->state != RPROC_ATTACHED) ||
> +	    qcom_sysmon_shutdown_acked(sysmon))
>  		return 0;
>  
>  	qcom_smem_state_update_bits(q6v5->state,
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 808e9609988d..8a0bb4b2e71c 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>  	int region_assign_count;
>  	bool region_assign_shared;
>  	int region_assign_vmid;
> +	bool early_boot;
>  };
>  
>  struct qcom_pas {
> @@ -507,6 +508,67 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>  	return qcom_q6v5_panic(&pas->q6v5);
>  }
>  
> +static int qcom_pas_attach(struct rproc *rproc)
> +{
> +	struct qcom_pas *pas = rproc->priv;
> +	bool ready_state;
> +	bool crash_state;
> +	bool stop_state;
> +	int ret;
> +
> +	pas->q6v5.handover_issued = true;
> +	enable_irq(pas->q6v5.handover_irq);
> +
> +	pas->q6v5.running = true;
> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +	if (ret)
> +		goto disable_running;
> +
> +	if (crash_state) {
> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		ret = -EINVAL;
> +		goto disable_running;
> +	}
> +
> +	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
> +	if (ret)
> +		goto disable_running;
> +
> +	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
> +		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
> +		goto unroll_attach;
> +	}
> +
> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +	if (ret)
> +		goto disable_running;
> +
> +	if (unlikely(!ready_state)) {
> +		/*
> +		 * The bootloader may not support early boot, mark the state as
> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
> +		 * start the remoteproc.
> +		 */
> +		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
> +		goto unroll_attach;
> +	}
> +
> +	return 0;
> +
> +unroll_attach:
> +	pas->rproc->state = RPROC_OFFLINE;
> +	ret = -EINVAL;
> +disable_running:
> +	disable_irq(pas->q6v5.handover_irq);
> +	pas->q6v5.running = false;
> +
> +	return ret;
> +}
> +
>  static const struct rproc_ops qcom_pas_ops = {
>  	.unprepare = qcom_pas_unprepare,
>  	.start = qcom_pas_start,
> @@ -515,6 +577,7 @@ static const struct rproc_ops qcom_pas_ops = {
>  	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
> +	.attach = qcom_pas_attach,
>  };
>  
>  static const struct rproc_ops qcom_pas_minidump_ops = {
> @@ -526,6 +589,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
>  	.coredump = qcom_pas_minidump,
> +	.attach = qcom_pas_attach,
>  };
>  
>  static int qcom_pas_init_clock(struct qcom_pas *pas)
> @@ -852,6 +916,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  
>  	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>  	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +
> +	if (desc->early_boot)
> +		pas->rproc->state = RPROC_DETACHED;
> +
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 913e3b750a86..a0830a48b1f4 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -736,6 +736,25 @@ bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
>  }
>  EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_acked);
>  
> +bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
> +{
> +	bool shutdown_state;
> +	int ret;
> +
> +	if (!sysmon)
> +		return false;
> +
> +	ret = irq_get_irqchip_state(sysmon->shutdown_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &shutdown_state);
> +	if (ret) {
> +		dev_warn(sysmon->dev, "failed to get shutdown_state: %d\n", ret);
> +		return false;
> +	}
> +
> +	return shutdown_state;
> +}
> +EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_irq_state);
> +
>  /**
>   * sysmon_probe() - probe sys_mon channel
>   * @rpdev:	rpmsg device handle
> 
> -- 
> 2.34.1
>

I tested the series on Hawi., it works but unsure about newly introduced
stop and shutdown status checking why is it required ? I think, you are
checking this for sanity if it is left some random state by the boot
loader..

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

