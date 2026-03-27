Return-Path: <linux-arm-msm+bounces-100392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CgoE3LAxmm4OQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:37:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1A73487BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 442743029242
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E273737881F;
	Fri, 27 Mar 2026 17:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PahHv61T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3xbzpl8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A937E2D063A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632668; cv=none; b=K9Kvw6QiBXfOIBOJKYACV0jI7Km+5AWPj/JJMvDo3Qz4KfBwumvVA+UVSgbP9dioDYQab+qprjGu0GcsQxzNJKEd3x4gIcgejJ9HwhVgp8Q8QscnS/evTPlyPRg1aBX1NVPYlGEsLcnrJdEDf3ee1MDUCswYC9RKxncHGn7V00g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632668; c=relaxed/simple;
	bh=Q15dp8YMTplDw4O3okli13eHvdNz6JuC5h+JRg3kweQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7YRIvVzIqljxZ1olDWiZ6D1sMHmto0TrS0DtWnq4g3rIzNa4M0i0kMVJz3hTMJhoskZ6KdbTMpCdaiVvqUOtesk4oFNenMAjIPw4XkfvH1rA0dHYYDV92VtYWGG3TdWX9EqIT2LNl7WGWg+zHHntlINDsmDL/XY/UU4f/G/Ot0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PahHv61T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3xbzpl8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhIDN881609
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLOcGXIpoI92dPoTocEEyelLMfOcJ/l+Kn64KbaT2iA=; b=PahHv61Tql8wMOut
	rJ99wXUhLiXZ1vJzC6/D3QpP/U4RJiqmi26hDWTKQOujHtjYm+qSo+cg+g125T0I
	jDYcQhcfQVhm6FndAFPpW7h+ckDi21aBCafu6h3PomV1umSPRhhiUJ+PjMFtGMq/
	OX+3HnSDroMl5vzRjeYQ4sjh9x9aG8Imlo27Al2bUQP/cZjrqzK+Cwtdbz5ee8Xy
	l2+Zd+hl1L1vOmON5n0s50vFgDm69/vKpmdocNN1RtU1UKiyphSj1qu62/W/Q37x
	Zy7YeP9Ho26MtbJYV6+DDZY7PoZwsgY1ql4l2r6LGh3Dwx3NMODIvxAULWpJia4U
	3VUwfg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6ks1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:31:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c189594f54so4180977eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774632665; x=1775237465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLOcGXIpoI92dPoTocEEyelLMfOcJ/l+Kn64KbaT2iA=;
        b=c3xbzpl89A6K6BgCjM/cr4lN8hLkBuxRgKnX8Jwmh+71xSkB0zsXt5y71qtkxN0AKU
         1J7j28Gcm5CkaM8qqDvHvHk0UG6SmIcEMeJGjLYqQN04cuMjdo/lhbCseHOzNZ01XXlD
         /EHnY/TyphEc4gT56+Cn63cZBvni3QBcXVfCFIF4FJby2MFUnPC6Me9q7KAPdpnFWsFF
         Pc+rz5Xntun6V48Q4fE1X0btW/bmSA94s+jnHWNKoFuGq6Z9nGXTN9+RfWOfcqVe/55F
         yDJKvpIkXTOxnnFAFf6kw1M60GqQEzYZv9T39Ci0IsRFxX+KESXa1xtFs+0SL2yy98Qw
         I03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774632665; x=1775237465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLOcGXIpoI92dPoTocEEyelLMfOcJ/l+Kn64KbaT2iA=;
        b=pSgYWKD2jmJ9c2bzKlFTBVQRn9pD+b6OpAqQP7xlgVggQVgdO0TQ8MT61KR5zjVmwt
         THF11k9WZrS1+TlvpQSGugqSkAJyq5fm2vgLL3W2VEpVeE95Jh5mTAi1vYVyyF60kScW
         XTrUf+89sX7zxblIYfOkYCBEKCudJMb4sjFx3KHh4PY7jJrQcH+Z49BR/ZWVfr90VHuC
         r911SLcaq9CJzWDPzmKGB51s5lm8O+toWf92N/AjEMJEfD+gmgey3Iv/aYUrk8WF/4U9
         /xx30pf4W9CPg6WgR6F4wCoNAoP/p6gynFo6AfQA+g9VbCsFyyIS5i71JyIXyRYhk9QO
         PHSA==
X-Forwarded-Encrypted: i=1; AJvYcCXVMfO7U4tKMTb8r1U3mxrplh5jgwhGCmJzuYu3F2Cn8wzSPvp0BP2ragyFEA8F+IR10IWtGr+/QkRPPAEC@vger.kernel.org
X-Gm-Message-State: AOJu0YyvxJyShqeyBqUxbUClnuQn5h0JYFy1ZZOeq23ejIqUsfukHn2g
	RDHhFy2Q4STG2236J2GWwPIWkx6zALBGT9bHiFWZCSB7KV+5ARYpZYtYVfzNjRPrDzlFNAednoQ
	/Ke30C4dzCIzSXdHRAIwjBC6Ey4A8iniMJcroyqJ6PynFP6DmGfZ7ciYRM+oE0O+TeNXknU6yPu
	Wo
X-Gm-Gg: ATEYQzxdI3eBdbpmjwxIRIIoBaySvPKRJiKoqUMIYyMBenF/Y/u0LBRyk/pTPSiwK9o
	IX4Ae3uUKsCpL/IWTUt0rXcF6dsxjlAojd+tGmfXkqyJ32fe4xMea5mS5cccW1uDC4ye64b67Xl
	T2yv0xIjPIQZVSI6mgH0RtdnnFoi673xR7VIUbR4fB6n0F3Yj9huO/HbXPKN24HIyuc6oziuDhB
	C6TJYecYwMxzNLXPSimbp067Io8DAGAjMSjQCaAWCvVSR6L9dh4EJpATZYfzTttu0wpzPnsFrHY
	8ycmtB7xAjHhRlOQ/a5k7HsZ43cf3ovf+C3KcV1C7GxuUYiXo3MuR1KJTEcUBp1NB0ykp2dm7kZ
	S+U/RRS8z/1Zy/qtecizlUCSnadcEN0ff7OpLQJiBL57vR3CZMjpq9/USM8rwWqcYuwc7RFyZqw
	g=
X-Received: by 2002:a05:7301:578e:b0:2bd:b961:7e8b with SMTP id 5a478bee46e88-2c185e2b73emr1557855eec.24.1774632665261;
        Fri, 27 Mar 2026 10:31:05 -0700 (PDT)
X-Received: by 2002:a05:7301:578e:b0:2bd:b961:7e8b with SMTP id 5a478bee46e88-2c185e2b73emr1557832eec.24.1774632664661;
        Fri, 27 Mar 2026 10:31:04 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ee01674sm6293658eec.27.2026.03.27.10.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:31:04 -0700 (PDT)
Message-ID: <c269de7e-511e-4b54-b432-f36da6dbf3ab@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:31:03 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Retain bootlogs that overflow
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251223170511.2277302-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251223170511.2277302-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6beda cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oqBJM22TPj05MoDBPk0A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: zpz-KKNNS8d-riw3Aj87X_6TsrCV1vyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEyMSBTYWx0ZWRfX7Ffe/Ilpg41C
 EVQ8eyhyCkcXE3ottLs73O7s9qCeL53uM9M24LBudWLizL8pUv8t2gRpOO5znJsXEN4j0MKOP7c
 ujuw9zYSX8/3taxZYA0QATIyqnAavGGVFNWJz60K8fVpVlfxsiNCxXkrAvxM5EadL7pNvdEIYbs
 GRuK7H1m0K/SICLsPJQ7ASDe7LMA7nASB97q3hZzJy/uRjM1k/ui9bR8qqubjLnDTmKN4+t3uJK
 Wpr0TF9Ycao+raKjuFF12vVoBkkW4snXA0uNieh73hsQoSmIgqkoNxCGRrDICqkflHGpgP4RSj2
 mHaAWDKyV/vFUDzffQ4cMbVR3Hyg+aBv6U4BTvadYMXVqyEs3xuyuleytv80SXB2afflrj3kWV6
 f39zE4ltKYX8w/1sEI+6HRMLAGe/Vq9igyKdIyF5+oAzTE9FMbVQbfflqV+i4016VFNi8OksYYt
 aWAZ8nmTM3/syUSU76Q==
X-Proofpoint-ORIG-GUID: zpz-KKNNS8d-riw3Aj87X_6TsrCV1vyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270121
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100392-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D1A73487BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/23/2025 10:05 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> When a bootlog requires multiple MHI messages to transfer fully, the
> messages prior to the final message may have MHI overflow status set.
> Preserve these log messages in the accumulating bootlog. Do not treat
> overflow as an error.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff

