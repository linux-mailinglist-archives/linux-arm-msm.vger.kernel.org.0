Return-Path: <linux-arm-msm+bounces-91221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLw3Bs75e2n4JgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 01:22:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71231B5E11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 01:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF657301A3B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5739E27FD7D;
	Fri, 30 Jan 2026 00:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVoPJG8z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8wvSFoE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0543727144B
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732547; cv=none; b=kE7FKTzcOBGrVuy15NnEc0YIRDbm6pqKjaLAYvOXfI4J9nwj/TWvS+W8E5QC/WmILRY3961vNIjr98cYTBJVQhm0HTZdM4Tw1V8U2fP9aqyTCOKIBZqSxE0JMbzutSP/b124ugZWSpQf/jmW0c+kLkJCUlyDUzHEjf6vLChpkjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732547; c=relaxed/simple;
	bh=ONh8Ox0sflnYK+apVyW/Ix8nn3epMvhEIggWmET/cSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCKMcATUfrlBRhk3C6+N9xTZFoX77UNePrdG3gtn4/RCzl+C4YHSW5FYMlc+eyfI7fNjxH3Oq3a0kUlkf9eg+1cIJ/a4A5sDrAslcZ27uEO1bJ1OyX9iQb/gCNKdFHPbErAzh0npg0nVg+MH2yioJkwhI3Iw0mZMKw/DsnjKEco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVoPJG8z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8wvSFoE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TI38MG1429052
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjCZQXKJgjZ9Ks+eaKcXCSOamlGnnAHP4v+PpAcUslk=; b=MVoPJG8zmi7s8jFh
	fHUh4YhLEm3/oo6/Mdbf1y1VxBYUV8tfiAKf+97EVM9gqWOueJ/RltXO80A7aHah
	yPVqegw9SuIu8SzVyfiKhHqIR2NeMKAys+MUpWKfWMvD1SX9lHFpSms4tuKqt5OG
	uPuMhDC5PGjw1onmS7l53hNjT2JSm38Bh0olqwAWDXwQizHq3jSKXk1CQGLYerZV
	662F85lZwPsbfGuICalb+EtZPYeDd0OKY4xDdjMN4/GT5EU5IgAMplEmS9WRqPPP
	S2UMvij4qHVzN86wBX4+9/7AtMB+pNHemV2XEJeezF0QZh7mK25NcX0Ip3WbQ/oo
	ZN/kJQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byydh3s0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:22:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b738854780so2208057eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 16:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769732543; x=1770337343; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jjCZQXKJgjZ9Ks+eaKcXCSOamlGnnAHP4v+PpAcUslk=;
        b=b8wvSFoEQZh/E00JIcLbJi1ktsa53XtOVod0XZKUm5gOaM97IMrd3cCebGGZKHnV4U
         Ed8FBYBxP3uAxckcwsgyMPECckyAiNV+m1cw/wGO+KSHWhgDz5dciWEZgWtDTn+XyltS
         bJePVtT1DnkqDTqQdn0QQ/ff7Y3ikrjaXWQ6KVU13DYl2upiShEpH4qHYmQtQGw0OIvr
         RreyrwErXpSD0MDmyhtQKsSpT8tzAI7EsImPUimO+896NdueR3s4YSeb1oMt4JWew550
         3khZCdaAEX4W42klK+Vml13IcAZFofTUfdpNYk0uBSRTfpROLfsw6fA2HWeoSVdui6cS
         g6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769732543; x=1770337343;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjCZQXKJgjZ9Ks+eaKcXCSOamlGnnAHP4v+PpAcUslk=;
        b=CWIXTKyo8575EgaLxX1+4XNaPRREZhivMpnN/UrJLEyFaDewqw38eAASsHAi2nzoMH
         ZsRoKGn+9wl8uax+azyxxfHFBRl81dLKY93fSqym40ElBk40twLpIcQZkES+qPHPobhg
         Zu66RIRGLonsIT9uZYdeP8GzqeEBIAvV7cnOBADroJdSI1R+1Xcu1dSxRQHUZoQ53pDE
         lNXnR2b4yw4kKSwa0pcl1X+wxGJaS9dJBErZTJFRKeRTeO9bb3juPSatfBThOod+mA9K
         snVn6ql3KlbTIJBIvG0dhcqemQUHiOySwR0ii4FuIzt18r2LceaqHkIWfRtcrryhmGIX
         WX7g==
X-Forwarded-Encrypted: i=1; AJvYcCW2Gjp2PbWhWASdA4NRzI4P8bTU7sRH/fL0kHScAlGVIqOnoToneuvk6o7CubjxWnPOoqPCLQB491JOvFKs@vger.kernel.org
X-Gm-Message-State: AOJu0YxsGA6PcJk6IvKkcW4rm5DIraS5tA9lXQIkQ5t7hpLxgIM5EH+L
	bG0W7SpURdeXtsGC+1+cdBnCIGwZvTC9F8hBSF2ZmZmd0oiKSaSWqny2NsOHVEW1F+71oM/pX/e
	10BsZCMkS3Q0UAd7ETJ1Zh1hrpyutfRKvMJVNHpBAPRLaFrNGoNDvybtY0kSDC3ineoxw
X-Gm-Gg: AZuq6aKm2lsvCKd5s64wFsmPzS+KDBhnsjEGkg5iAsv7WdPIzIxOMhKld5Bmknl2omO
	ExuOPTai5EMc5cE9YLYU/cbKXuMJ3VxcTWSanJglICvFhcCeaNFYF3JiJu5jsxnDRaRMMH44bp7
	MlbFeTu5Z6ZJ5y03ZUp/mloSRN8hkbIiwARJ5Xlw72/sOJ+dUSVyGwW1IfEyTjunu7lhU/L2QAF
	6NXPC3OW7dmn2GBspo158Wdz8J9kWDLUzxo712hz/JByV99Gqo+8jMK96Njlonp5h0KrnQJLAi0
	wDkgcc1Ng1hV0wXhmAIX5xaN4j2tewVgoa6Pot6Zon5z3c5HyL0gmXRyjUC/vaVbIlxgLVxORXY
	ugH09BKg9PQm+rJFI18Q9sPOgHUSCACqG8gQVKTdi2VXvy4rhDI3+nzANmvWSR6Y=
X-Received: by 2002:a05:7300:8ca2:b0:2b7:befe:3743 with SMTP id 5a478bee46e88-2b7c866cf6fmr563462eec.18.1769732542861;
        Thu, 29 Jan 2026 16:22:22 -0800 (PST)
X-Received: by 2002:a05:7300:8ca2:b0:2b7:befe:3743 with SMTP id 5a478bee46e88-2b7c866cf6fmr563439eec.18.1769732542165;
        Thu, 29 Jan 2026 16:22:22 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef40asm8798357eec.13.2026.01.29.16.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:22:21 -0800 (PST)
Date: Thu, 29 Jan 2026 16:22:20 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5] rpmsg: char: Fix typo in comment
Message-ID: <aXv5vErz5I2AFmb1@hu-clew-lv.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
 <20251217065112.18392-4-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217065112.18392-4-zhongqiu.han@oss.qualcomm.com>
X-Proofpoint-GUID: l2tJjyWIoAyLe-gukS5l8hWfX0SAIQe6
X-Proofpoint-ORIG-GUID: l2tJjyWIoAyLe-gukS5l8hWfX0SAIQe6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMCBTYWx0ZWRfX0EI06/0t0+cQ
 xOOp+L52XM29GJPTo+EJw6aGChB3eANJh9uF3/7CfI305DYKSphmfpaqJDQXLkg0ZrTuYWyTUo1
 X22kANzM8DRNbq+665qwzRk7OY6HR+YGd5LDrwmy4vpthf73E1Ea1iR1ZLFhBf6i+CdOXF4khEu
 +WhkdAAT1aDbbOGd3LsxfrP1yO72gdeTQ/7os3Nr/OxdufYNE59Hd7OTupCDlhaE8TrNIahELKA
 XAl3w7uTjU88hSCkNiuQ7C10E/7iLqnsOYhn3MtZBIxgXL1AwiSzwFbVJbFgua2X7ILQKBmDdmI
 lUOwpOMjIvTyQutL8ARhb4yHGIH32RwBdsjKEbkJ1yBupv6YTrF5JkPxmRdXFVgTYG5Q+FjxvMy
 UGESHcDbLBSwfLwtsZEVIer+sAOXB/ljdQw8n08NEqf5Y8JWqKEK4TfEmxZ+8bB+w2HXwH7Pm4K
 iOwKF6Z+XfcUgI810/g==
X-Authority-Analysis: v=2.4 cv=Cs6ys34D c=1 sm=1 tr=0 ts=697bf9c0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sgd4GuN26VHFCRKVnZMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-clew-lv.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91221-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.lew@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71231B5E11
X-Rspamd-Action: no action

On Wed, Dec 17, 2025 at 02:51:10PM +0800, Zhongqiu Han wrote:
> Correct a spelling mistake in a comment: "Storedit" → "Stored it".
> 
> Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Chris Lew <christopher.lew@oss.qualcomm.com>


