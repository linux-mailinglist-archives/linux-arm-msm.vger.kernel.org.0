Return-Path: <linux-arm-msm+bounces-93133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IjNBdFUlGl3CgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:45:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8FA14B883
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33EAF3006B0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC79334389;
	Tue, 17 Feb 2026 11:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVpN1soU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="exQRzZWJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9371F63D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771328718; cv=none; b=Fv/NgtfunpeQlPLrBV3Rp93u3xgs85pFXrjtXPT6j1inKFaMTZULy5KCDwu0q1wFbHMRiXsJXL1IhSQoELiNTdLlPkLfMN3vEEegolVGhelDCGwXWXsWgP0EplUe316pSI+ZoNfFNzks3+K1mEAdf1VU29RuUxi7CZiIws1x6g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771328718; c=relaxed/simple;
	bh=pXmSGfgp5+QmfnauYLBEsCWHWBMYW+n1MVwaOtwbsd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BF8QDbCjF5o2Ev9Zp96gimGK/X5PV5UZ9Rgc9QSyItR7/DQzzSIuJmq+051QmSILy/y16qncLT5VZAQ0rLVZS4rfsDF8yc+RDNuUMmBNxleSdReOYR9Vhn3NJXxPxQkMha3cwwAGN5u+ZpSyaQmFSTSx2i+C4J93zKOLBRJeCp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVpN1soU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exQRzZWJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8TONC048843
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=griD2yBGtJvsSfHR4B8iPotT
	2LwMerFC4LIovExWQg8=; b=WVpN1soU0qloXSL/kQV/ybLZN1WjCWY9uf82QTRQ
	Piu1ExW5v5uTNaaKSUZRR27nbiP3peO/Tg5DG2zYDvM4/rov0HyyBxpQmZEENqHI
	MyFBIRGGDBxXdmHkn+J92IvlI33mDJrf0aoy6A8b+WHpauhw8m5Xw9QP/PHstMJN
	ugPQtRm2cO/6aE6pwf/qxlZCGncKTDpSu3pMBYWpnV1Rcccok53F6VHFrL+GONG0
	pJkr/K2mepttNVuftZ3attk2jrFiBDn4Y7tXxcpJlgqe+6wHIy03xIMbzrDRLwbU
	6sYCZwdv79vYjqPVkapWEiyCZz+/MgP5pz4sdtdkRgJ+yg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d826tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:45:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so436736785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771328716; x=1771933516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=griD2yBGtJvsSfHR4B8iPotT2LwMerFC4LIovExWQg8=;
        b=exQRzZWJkKnACUvyGA2JZeJ6l0eu7ksHhhIHdU06zZqbMxabDf0IpcdcrI3akV6WAd
         x00RFanDbn4MtJ4NxGhzVZG9Qg4vT9NRvpj9n/+DfjdWEC9e+2AJINdrCK3Mib95gVlr
         8Csk77PltZ+lls/oHYKVT6vhpsAUGfCy+6DPjiqOJh7Fdo7jII2nB4dubkqTaariNgf0
         qW1qwUSJFaZTLSD78ySMXYHAuu12xWCanTJibNAIR4u5Xe/vHzvnV3ulGZi8X9B8H7QP
         hXjbKF7uMbHy6hPTv0Cw+PlDCixgLhaDGNYA1s0Ff8Ovv+nirSFOFjQ+SwmcWaRiql2l
         pXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771328716; x=1771933516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=griD2yBGtJvsSfHR4B8iPotT2LwMerFC4LIovExWQg8=;
        b=A7Vn2xUEZvjM8NOZUZqKIv6xI+porQilhamsPavT2+8LlExvYUaG7B9GO9CLE+kshs
         Fz6LopS1S+vLDOKZBbxT50g3L5ul2qKrPOheVJlXec2q9ANVjg2kQfUEikv30Elpanaf
         5pwgLxW+H7C5rAEg9tmbibXUy2h516NVniHo6NxBUyw74hB5ywXj3R6qdJgRd+d06IYC
         fPlEvQ6OCgUVr8/MPgWtpOmRLqRKoYBqfEbRLdTpUV9baHv9ngZzlNzubX3aUvSSbGoe
         zYpYiSj1ubG4UYrzP/qdIqM+kL69fQjrmqVBU5KL6wgEwGrbgJOCG2l7B1cnedBcEVNK
         IdGw==
X-Forwarded-Encrypted: i=1; AJvYcCXVVcA3scwoIZM29vRNkTMgh3++OUU+WPf7OKmXNkoBvevJesN36KyKmK7DiyV6dsKVs2QinsPKP4T+XJ3o@vger.kernel.org
X-Gm-Message-State: AOJu0YwE5k6SxyX7/6ZJyozdDUWOB5vhmDWqROWiKeYTObvAOb6J5bn4
	6AsTmuPoF8BJ/UGNS6/HYXGXKi0CqU7xLvx4dW0pzGKR1u1zPVNq8qu2EnR7LV85Bdmjy2IgSNv
	7Yh8VN4jQG4QJGmoTjTYT4N2VOlrNCSBJZeVb/MnD5LAiMBRRyQLVeA+AfpPKG4eMNlIn
X-Gm-Gg: AZuq6aKkMLbPrPCiFuZ8qFcV826qwiG49LXK/6j/hVUdE0i+PVPcBIqzfAwLVv8EhIA
	P7ourI5M3xNSmKEhiupfFv3WCIm5JBpgEjJb2A6DrnNBOEa0A9xANAJP3aiYGKEkjSb3AzxLXLM
	GR539n9DMatYmIKzzuWdMp3Y5oJhb1QPMFt+zT+Y7fn8MWa3QiDQVnbmOPQa5TJ3QH6fWZ7rpIH
	NT7e+6szwVWdW8Y+Z1NP9pCQYGFvlhzu+coEaKk1gnR2gUq95XiAWMMAXtoiCCoGtrmRUI8dhon
	liG1i3bR35QfQSAXnLSpQsRt+N5KqDJ+ZElZn3/LkCTOFGhSZRasD3ls343D93nNaineHP0wnOw
	qpV7EDxCW1hKbEcWjxu5Y9THtGYILW9fxVxEI
X-Received: by 2002:ae9:f817:0:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cb4fa5ec22mr806117985a.77.1771328715426;
        Tue, 17 Feb 2026 03:45:15 -0800 (PST)
X-Received: by 2002:ae9:f817:0:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cb4fa5ec22mr806113185a.77.1771328714818;
        Tue, 17 Feb 2026 03:45:14 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abcda5sm38030337f8f.19.2026.02.17.03.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:45:14 -0800 (PST)
Date: Tue, 17 Feb 2026 13:45:12 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
Message-ID: <l3w6auudk2o63cc6m2vp4663lhhnraajbp3hngiykvzzfeayrt@bwo2l2newxtc>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <20260204-enable-ctcu-and-etr-v3-2-0bb95c590ae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-2-0bb95c590ae1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=699454cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=iWN5h_POgodqhNU-qcIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NyBTYWx0ZWRfX4PBYzwBGgPCR
 N0nU1WhBclcA52MQhDvOZVJYXDuGVyj3qhDyUz2esp3eADe3++8QuTGP9CP9VctWx/0wtlXnoHn
 NppznuVk0Wmfq/WPSVAqhRzAw9V/S+spEaWZRB1W7k5VKq81kWIb2mlkhjn+O1xg/TEbAJI1ZdD
 5KQzprKisT+cCCP1VQgvVmMwHx5oTZgkrzJs0bdOF89DccSZJaHTlj7r2IE6T64oeeVaORsTryp
 xK1tJGvRH8kiDB7aXeTr/RAVi0BhLtjusv6WVi3DI72UGmxET58eWDQQnZfI5UXh2WskcydxMg3
 vQk5FkjeSUC+DU7Sxuf5zmcLLpV50KD0MOcE13wL6NQMYAa4EOfpV9wrAxt9G/lTzpojGjpX7Qf
 rWo3ycn19JBHMMrIBqABiYIoWbhwTajeqtO9pZ5/eE/fFROJNzz4d2n4bf9O0iDgw/Ox11Git65
 nLa+MgWHecolOHZek0w==
X-Proofpoint-GUID: W5Y0YKDTNzvS7sr3U2SazFK5caboG77h
X-Proofpoint-ORIG-GUID: W5Y0YKDTNzvS7sr3U2SazFK5caboG77h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93133-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F8FA14B883
X-Rspamd-Action: no action

On 26-02-04 10:22:02, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device.
> 
> The CTCU serves as the control unit for the ETR device, managing its
> behavior to determine how trace data is collected.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

