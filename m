Return-Path: <linux-arm-msm+bounces-118007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N+dnBVWjT2r6lQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:34:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F37319DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:34:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kmWajrZE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TOWKsvY0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118007-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118007-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B1E7302F3B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D32E29E11A;
	Thu,  9 Jul 2026 13:34:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F522848AA
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:34:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604046; cv=none; b=Qlgo4RRszkgr8Chh+0+6OUgpF4uLrmMSFlTODJ+YZMsRLS+vV3w9dLbQLuNQj3glLXvMJV0d/XAjmZJBrCH2d9Ix5l2sB1SMh+K9uqvtrLMZxH5HsOFNlCTeJ8oI2eRDuYUCftV1yF/yVlZGh+H54DYAL7O6fFsHabeZoBTosEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604046; c=relaxed/simple;
	bh=qbTuCRun0yTlo1Y60tPmYuf58Hlf6xKFKs68d+vsyko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErX9dAm6ZkeRgKciyWtQ+oMzYkwkLxBACM28w8R326niWL84bTWYWAqmUcP1fyC+cN43IY9uaWrtHWgNo4mZu2J7FNr/TaeWhGbFKiMm5QnLmM8W1KbsYN17pW1HRftV3uK/OoVKXE0w9T2EjfKeFUB7vdhfa4nCbouZNRTVGnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmWajrZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOWKsvY0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNDmX1450534
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hmAfXmVSyr9czNHTh55PG1BO
	jt5uvYuY8fvRq7n/YEE=; b=kmWajrZE2rBXVRk1j6Eh/h6uTAwcYzbks2LYt/Ea
	GePoMRdQXhnWXCe1Ja0dyY0mT2sKGHWZYco4by32sm2kP5tx1l6aToFgQHYgBbL5
	2B1lInsqwLXiXP8N7T24q1l79apyJkCMyvF48Dmiiz8ER2wk2ixIh1d+QfJ5lvmi
	rNAgwWdSSwhEwzcdLdtwBUg2P84qlJyOqCx8w50Bb++W9PfftoOmp6RaQfM3FD77
	YlcVy76C85nYVdbWr+W3ghrqkXWgs2TIMFXFY5Q3R/6valbiYct4cI1NIx2IrRvo
	GS4dlrkHvCQV8reRazTfCBvxBPjRt/qyOIc1tJcUzRsxsw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vj6mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:34:02 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738de163061so937489137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604042; x=1784208842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hmAfXmVSyr9czNHTh55PG1BOjt5uvYuY8fvRq7n/YEE=;
        b=TOWKsvY0xyLldTbGc0/95miyCG0h5WlsQEZylmLor07CMO2OfEfTcOibRJIX8tQr7u
         hBICK7p9AtShjIRL87VZwV3IJbqxRebhbGig+ZCfB9CyKfEht5uChGAZYvIfWP+mjk9/
         LWLBNHglciqylovf4ScZ2AoICJyByEUUXKPv9yANteapugdqrmppx9rDByZ2BeZ+Do+n
         anb3vsQ+t1d3RIMeeeCj2G67VZPsRrtC9i3lvTEHDkaIVBjVSu8+2yNibMHRL02skk13
         wph0bumjMCi6k53t84E/O2FP/ls9EhIurNl7nJSsdw8Ee37nOQc+XAk8LWCaMM35J1vo
         ThmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604042; x=1784208842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmAfXmVSyr9czNHTh55PG1BOjt5uvYuY8fvRq7n/YEE=;
        b=loQAgnOk2gC932X5wox3LFg7iY+pSHU18AcbLTiBHl4BVE8lF8YNieLTm8j6283Xaq
         VOhNHrA+jKxnQdj91O7WfLD6rWu4Dd75R8a686oRHLTbO/PmipRMIpsoYP48CmYugUyA
         sjTgZ88LAODh9F4eiGMHPE/XC80YeyUUBchTWapL+oYH1zN8+6RTGfM7kF2YYgqidpZM
         ldEF8qinQ5WYA/4YG2UdNbVy9kefnCiJYpdKBtIlqYQY3mEfXkC2FdXPUqAYGak/O6PI
         HixYKJXGdf2Gid50hjMlCAxTZE/qhpCmLjmzHA3DEn5htak6Ttg0ajPj4mclRlFA1z0F
         hpTg==
X-Forwarded-Encrypted: i=1; AHgh+Rpc63Hps853s0jkTDgFbD610t3fnGzUj2MSXnpCwWhdwS5/O6iagHfFWLLjns3LhN+X3HXeQ57KKXCmSNRA@vger.kernel.org
X-Gm-Message-State: AOJu0YxdYTkOUbPo79CzeeGFwyUyyIsU0mL3E09VOhWhD9ZiAO/6+G4U
	LjYMBQ0p4XCeA0LgJczTKafmwfJBqf7xmibTtTQZ8HGpaDtOxCY+zheMa7Z1rxuS63t6vPck7fi
	XsuhCw1eUGwJjC+5XinFFYAK71RNdW7cRi9QeFYKyCn/v0pQzG4Tazs4GYNkuRlcMfJnH
X-Gm-Gg: AfdE7cnLqA5t72zmWXrQ9p8NByjINxa7/9FpabvEkxRvvKTWI1bec8cVY0m4kcsLJlz
	rBXmnrtsAR0ye/PQDgoRKEJo6KqhWU0T4vsLvuw9yKTnRqecgxNhokyyZh81inpBErl/0VOU1Id
	FU7i8/iGpy5kumcPUNIlKrz+QoDrZk4fFTATCvQA8osE3oJXaj3cXDQeL8oR38U0IrURWPxURHL
	v9YsP1Q+CcWy0/T6Q63q1GfP9LzSNaXa0IEW5EfZIQMdxKrU4jeMwYPtkbNcaa2RUHwy7OLVBd1
	rlkoOKvvNPWEDgn0sIUc20DYXCoFe2jTw67BC9vOCM5eHKGuUwhivEymu/9aa2RgY6nQ+dqtV96
	m1RIv8BcjZZmdnehxZxH9f4oPgab635hz9ci+sknkbGoc5jvWFi1vSdSpviOmV6ALITAALBDm5N
	k/JvMZDX245k+H7Ec/KJwFFCHs
X-Received: by 2002:a05:6102:15c3:b0:737:4ebb:b474 with SMTP id ada2fe7eead31-744f6727d93mr1355551137.11.1783604041977;
        Thu, 09 Jul 2026 06:34:01 -0700 (PDT)
X-Received: by 2002:a05:6102:15c3:b0:737:4ebb:b474 with SMTP id ada2fe7eead31-744f6727d93mr1355529137.11.1783604041522;
        Thu, 09 Jul 2026 06:34:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84ba1b9dsm3370601fa.35.2026.07.09.06.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:34:00 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:33:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
Message-ID: <dfpwm4qodjtrdyz7hblnn67mwds75qzuu3knrxuyfa52meh6hf@5rgdxzcamk3b>
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
 <20260709-knp-soccp-dt-v2-2-6e2bfca96088@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-knp-soccp-dt-v2-2-6e2bfca96088@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMyBTYWx0ZWRfX9aluZcUQVcOy
 x2QCa0EdUEN+uvndQQhLINngJqXRqaVnQC/SdEHbt7T01mO0q4gwDGoy8iythRLhPnJG62VF53b
 b7RxVaJKloJQpRdZGeC+WzvVly58w6bcYAXlkJq8v11WymT5m0IWGcmlYoqIpFtS+ee4tGIcOlM
 tlJOlbJM+hiEn3kgfNeAkjeSETfdEMsRDQyrWFH/kByQnNvOlEuuiI1I403aKLiCSN53eaLjUi3
 SegwzJixerOtL/w3xxAeHY3En8Md4DS7GooiesCulASHPe1uieZ3nEKaanoXzvtaRjBj79hVOb0
 EDQfumc62rOYAvZyao0RCvMHMK3RqbAc+fjHrSzRDRqNw8+USdDlzCMPVsXGeT94kkebp7/wsmU
 tr4YK/qIXkcdIbH1o0Ub4M8zM4l5tov7uO1TByxbi1V5Eb7D4K90uh+8B1EQ4gLeHPlTGv7tlVV
 Vgle6J8spv3FB57Srhg==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4fa34a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=MlDfNhLudHztO9DQPjMA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMyBTYWx0ZWRfXwCkHW1ze6afT
 KzN/pxUhNYPZDQPjaynr6PG72oSxvV7BkXwlcT36GQNBTi6g/8QSGHTVAWhYHUsnsL/HSITsex0
 ymGPryrlVqzN/FtnvRDQs7dHBqUvjIc=
X-Proofpoint-ORIG-GUID: u2GCnECdPaOsr4_Fn8_dtbcvF5FnGsMy
X-Proofpoint-GUID: u2GCnECdPaOsr4_Fn8_dtbcvF5FnGsMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118007-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB2F37319DC

On Thu, Jul 09, 2026 at 01:14:24AM -0700, Jingyi Wang wrote:
> Add SoCCP node on Kaanapali QRD board.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

