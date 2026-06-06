Return-Path: <linux-arm-msm+bounces-111484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id llsOBDYFJGoc1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:32:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CC564D350
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:32:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jRM1kJOB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZOCwKpVF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111484-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111484-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 047A6301442D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 11:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7950938D3E5;
	Sat,  6 Jun 2026 11:32:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6788C3242B0
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 11:32:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745523; cv=none; b=emqYIQ5UIn7FcYbtdQ4oFqyI5k9l57rFgd+KhzQf1p1AuztTuAI5Q13KHujtGC9/vQ1msPaeSra1FyofGGouEozkuMhWqD14BrtzUOk3+IAPKrrUsqlN3pRBd1ZSNg+r1boEa1jxKgyq2wZoGu6NAI9/bFof1cwfS2v8L0VheA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745523; c=relaxed/simple;
	bh=qzKzfJNwhUcmU4gTj+upXOKBJeFWIsGwBWcoGZfnOuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzLDTOS594Nym2u0aodZaswaOswFg6WekQYv3Kt5eOUoZKcMRGBoxUogRQbwrhFW5f4dMz2NvXYrEE/J59vzZwKBEEgm30Nu2xtm6VXT9b/XgsFCZpH0muJR/uxSvDc7UsD/WSe6UHssdAzvArSLe3fIsue7LFr0Rmpicblo9zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRM1kJOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOCwKpVF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDsUE1329273
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 11:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BsN99lzTPiEul/ZpmdaPw+E2
	/yyTMZ0opEwuAf8gkRU=; b=jRM1kJOBGeMRvnW1jkSBKYnf3geD/V/4NuA+uY1b
	YVIaXbBBzMTm2NOENtRu/xc0F+ng6WIIHqIL+PHyJdeVO27dY39FFrC9dS+pG/wa
	wDuvusqzYb1tm6kByd8mfxDH6urtIyv3+D51kAhgiJO58M3OU9apMHr+PauyeWSm
	FKL/jWhQ+hBsVPFgvwochw2lErsC1OmXhtOfieq550xIca6/0cmsHwNqrFi5x32m
	qouuhsC/7tEBrQUTWO9ZH77VyleH4pZ+hrH+Yds/g9rw18bND5lsQMFs4M28SWfy
	2Mq1hAqygO1t74m1pQDmJdOXxlgNE3s6pziq4Akj2eLRFA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs18vre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 11:32:01 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59ebf602dbcso1854791e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 04:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745521; x=1781350321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BsN99lzTPiEul/ZpmdaPw+E2/yyTMZ0opEwuAf8gkRU=;
        b=ZOCwKpVFii6zR8VcUNw2IKNQ/flDus+L9fXMx8p+YDtJ6ZkZw4CYGzu9OaJcExKBov
         q22K/6ld/77ULbenvLFZdvtPGYwHD5yHBrBusYbaxSip0r2KVs513mYTdmYiD8LUKHv5
         9KxV/LBKz/LeJlbTViSY1k/JhlX5AUZ81QKCL4fYom8ldareQPVKgbkXKgVqkXqWBE7/
         z+wyi/4/9jB+EOXw7FXASfU6ELB+5we8MKVY3Tk4kzA0yjhAtO3wvtjE6xaAz6+Ye7eP
         Pi/rzQxjxtj1fAk8y6PuFNhDOrz++kALJuMgixNADhPTrZEBTY48UNKpGhw+kmIyc7eu
         kvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745521; x=1781350321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsN99lzTPiEul/ZpmdaPw+E2/yyTMZ0opEwuAf8gkRU=;
        b=VSc9+BkXWC0ooxpyx5DNy+Ub1uBMheNYbFJMqCz/oJrJB+MnCWLopoDq+tt0N9Asej
         RLK1mIFagKd1PR5yxTfE2sX1GlFZ6MbhJ54O28x6NvQN3X2KyYOkyQX4hWBIo5q8CAMq
         MVzgefhQqHf1DwSC0swTqNYaOW8u3UUmXIb3gmf08wj+u0g/YIJp7vfA5ioOX/CgdXRT
         TeHrEu5Gyrr1cjNpoiNnODuh6CHu3SptwJwszyA5A3eNqz30vgzTqhiRKTZOOIuJErCs
         omze9mL1P4Vlbswu/qWEB/nbYG/6dmlL8dFXOFruORnhPPCcTYNIhr/jGPpnFMHXcQfV
         +5kQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ggSOFYDbQDg4Juw0DoZq59dfbCeM5KaWRkJhjUAFzHeruLUqrfgudQDAtSSGHBMow5acM34WqFq5ZBJpY@vger.kernel.org
X-Gm-Message-State: AOJu0YxDxgO0F2HzC/vIl2uJsRYSX8NIjG7HzI1NaQ01Qt11SvhNz3Hx
	gsZHdmcE+CUEy4UUyA0FiQjMRVpKsGAYN92LaMoAZdxHl/Vl5zhSdQgESWC90a4qlfCLchMCKqH
	q38ioRB17sl4gJrFXDrmSwlrdt99WtzcoTphMUKE884ox+6HRCEMCyEuRTFiH/mL96DmS
X-Gm-Gg: Acq92OGYyRYRkF9E4DQeXa91h5Rj2amXuL8TcLkNmBsMiVMnGLGninN3lA9/KGe00IY
	wi9He4ZSYdyIYeQ6NXeOQDeFUqLYCv3DgOilcZNflP+M6GUWeI5CZEZ89JzDhRQNHSouum2dnxL
	kga0pmsvcLp5q/NkRNIDQKTncORLXS547etoQgG4B9dhpk7Kb0cBvVRM8MRUOSC4BfXRKCW+TXx
	8t+N2i/DJXXW82FqGmq/tU+4igNwrfVH0l7ZmdMpvrEu4aI+7W94++ubBksJw1D6Q7ZPESxm3IJ
	wha5tlHi2sorjVECOWFMAa8UklJnjMwBbleRd/B4OY//qXnlJ74uSmMgmvweCzjGYcpwSkryj+t
	okrJegxK27+F9Y/ausxqp42TBzJptWwooTRry/Joikrd8zT+piuhynd5ZpGKLeAaGQ918zvbljV
	UmKgd7pWXIB4qkQDqJ2GdjoyLbHg8FVKQDry/MHjusBtE2Ew==
X-Received: by 2002:a05:6102:80a4:b0:6e0:3d72:3044 with SMTP id ada2fe7eead31-6feff81b7bbmr3588579137.28.1780745520786;
        Sat, 06 Jun 2026 04:32:00 -0700 (PDT)
X-Received: by 2002:a05:6102:80a4:b0:6e0:3d72:3044 with SMTP id ada2fe7eead31-6feff81b7bbmr3588573137.28.1780745520387;
        Sat, 06 Jun 2026 04:32:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9929cfsm2415672e87.75.2026.06.06.04.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:31:59 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:31:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/13] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Message-ID: <aqthrh2kj4rerszww4vf4gp5f2f24wdreld6ot4w4kmzujemya@ftoyzykhkzmd>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNCBTYWx0ZWRfX/supc+Gr1UXo
 d2G1+Fh6fuOCedu91eAiTKcWX/pXYfs8e4ARfzREKH7TtEVw9TPK1ZchMM17ZTfn8YdSMUdJ9Hc
 gvI2tIWsRw0Rml8E2ymwwBi65iqZ/i150NONF75sz6UZLKmVDkxN/i0SdmPosXzauMWQZmaY9Cb
 DEOc2Sjeh3FHyCpSdNkAvkZgdAWN9hCh5PXb75zIpj5v+qCFIy91pWXnzi93VKLXLntD+V3yIsD
 sdYhDPdyL+SYkqSKzMFm26SVk1Yv8MxlQhHgXLU0xSY0wISnm4bjvlQrvg/m2lk1kJYulZg7kWR
 6DKw3acvSAWrkbrFlN1B3cobrNmcw+xiDupwJ74ERAHMa59/OnqIjwN0lti8qxjXCXST6iXPcO3
 3MkiabPzfJotp32kwIEDHFea4KszmcFf+/Aiy4IYTsdFO7/d9Ye3yeEzmhEV17JT5/Ect9PQ0lH
 wZ6msWIm0gEHDlAnUVA==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a240531 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=244XV8jIjgl5S067L6QA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: f3lSunmpnFY_iC62PoRU2SgHOwk8DOAA
X-Proofpoint-GUID: f3lSunmpnFY_iC62PoRU2SgHOwk8DOAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060114
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111484-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,ftoyzykhkzmd:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72CC564D350

On Thu, Jun 04, 2026 at 10:56:17AM +0530, Imran Shaik wrote:
> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
> hardware block, with minor differences. Hence add support for Shikra
> GPUCC by extending the QCM2290 GPUCC driver.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

