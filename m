Return-Path: <linux-arm-msm+bounces-104148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJnOK6rt6GkdRwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:47:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 601CA44818C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF27C3001440
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5D335E936;
	Wed, 22 Apr 2026 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZafF5I3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gN0j235d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8945631D757
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872870; cv=none; b=bAROjMPy5gziCR3t2ls2LLMUSbALj3EqdlQs8I5uU8n3Qs836UahNepYxwjER0gsPhhodr9kuo/3QbweJLQ90daEHE+4XTf3+4Cn/sIJ0VngsfgZoOApAnQhOiWPEX1gsV88ASUWaEsG9lnw2mFezSx1Wtyu6fwErBI4QO4CeT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872870; c=relaxed/simple;
	bh=DGgbv0zoNzdyS7hoyg0w1sZx9LsWMrpQSFwqw0M29jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgFDRF94TxP+/U2RT9hqBNcHhCUdkIMIGTDwQdAVPwmZ4F2maa/YXcGNA/yJlBom/uwGvhvOJ4QsiGI0JlYM6BUY9pFJUhEmoyTwP4o6Fjzx/W2Y12cf4HI66p2o/gaFSwejsHbadGDnwira5F7YKNK03w0Sm1rCW5ATV84LsPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZafF5I3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gN0j235d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAOYv03083043
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WzmZNY/QWu7q9lAMq0biJox4
	17hyAsUwXK8QgETcJzw=; b=QZafF5I3B5usDcoJQBU3RtajUWN9T71xAi7lghju
	2Gu70D0qKkev97Ck16cp6q+8J/cvpX5O8qQaZTtVTZoBqvtTguqcRzsCwUJQ9SwO
	va2g27/HkWo1+5A+u/Tpe1TAGRxr+zyhYvVZ0JyF3y5eCeoSrqT21Z9X5mGbW07M
	3sEDuGSY0KtkZX0tEnbVi6TEobtKfMYLginipMCRGMROA275V7j1YjeKx5xAz0oy
	6VyMIUHJ92ydYJ/QdUUX7xxe6LPZfu4utRZ7uNIQI/rMVJDXS8WGaTA2iJPEgpMJ
	Rd6WNd8XzbXzWmzh+jkUdWNVSa5UEabqg7Lv7PaKuuC4Vg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmm7vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:47:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60599e65115so2682765137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776872866; x=1777477666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WzmZNY/QWu7q9lAMq0biJox417hyAsUwXK8QgETcJzw=;
        b=gN0j235d/OYfKp4lU2kqBSUXEuTff9QZ73jnBVux37d07vIql5LAOG0+C+54nW6xC/
         /JEHn1TYphigV1FiaNgysy8pCJ/iGwo59n2f7HPPTBOjmAhiOcGA3GF4uCYBCvoSRpji
         Ov6NX3ZAP9QZY/LXwm2S+i6m4EJymKmmhBaH/FiJp0t+CsKbpsIaaW7JH/8pA2ehOyLT
         /nK2+ExHlEgXdT4xBRFFITEcjFSRkYeN0Xkg+7rhRcICbvHaSyFcCZ1DPsERWefEj0Kf
         iGAOIkl3OxfutdSTBatBWHoptXq6mJMa1gi5ksjvFCAvZf4g5wzOhrZR5Lmbqx3neEQY
         6WuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776872866; x=1777477666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzmZNY/QWu7q9lAMq0biJox417hyAsUwXK8QgETcJzw=;
        b=KIobuN5cUb7l/85ksC4ANKn6nhwN7qjz8xnTSi1OImsimB85yJ1pGQ5UbiRrCe3O+V
         xUQL3YEFEy/8EYMne+m+2Da1ualqLHpZGwkWmiM+Vy3hV6/nXl8/bvhRCX0QYYG9jx4L
         tmMBq63p5K24Gfg2Q696ptLpXiqUr4Q2J2su818R4BcQFvZOBVbnlqopmDJnbxOpag/c
         mkF3xnwey5jkG4x2WeQfSdw3t9sNzkpvRr1k0Kb/NmbNQ4GMc9IykOnSjdOX4uGShb4e
         UiA0431wDHGb8NdfYNwnB/881NADJb7l4K42mVNkc0rew4BdT0B9+8bzMMTcGLCSH/Kr
         xmlw==
X-Forwarded-Encrypted: i=1; AFNElJ/IVT/6vOj9pCXXC68DNZShfdVBMhyPm/2gmSbY4No5sjERRPpZFaKKVRUiYB0yBOG/RRKtGsvP0QkA4aEF@vger.kernel.org
X-Gm-Message-State: AOJu0YxoJgHAw9FVx3IGyNJ6V7x2ImyGH2baoMlbNtYky49XmFpxXXt2
	1OeHCKYQh9M+dRhcXWE3vsn6Nrd4RCcThfh0nHd1GC2zs/1DrDHYArtLwuSWJu8NJGm/KRQH5fX
	y7F0ugL7g9hcv4AYcQbBxC2C1+Vwv6QYy55DyAojTs2tboTeGO2TI1BAeI2bveix6fSNl
X-Gm-Gg: AeBDiet/dM3GtY/FSbbfWaHwu7wrjR+lb6KTG7rtSkZ5YQIs23/JOCf8nzflBvs9d5I
	5+cgaBKgaJPb9VJbe3Nsj4nP6ibainzJywEtoSp0RXRFiWtA+D9PWIad3MBtzRsi78TSN/AgiYz
	nNl6kMpIRFCFiBKtkriaIH//Cg1XujgwoKXseT7g6tkO40T/7LTtratfwLwfzZEW5Zzsb763KNq
	V0Lplz1kcqCUqpnT91fkO9EwaUWKIbBBb21jIRPaME9vvLnr+2gdEmbl83ibSSPsC2uX/v2TZD6
	eaG5ap4ErKMRzLWrBJSG57+AxeMbDyhp9PancP5Ev+tJXGOrIOLsKMsOLi7FwK+3gdN1naRva/8
	/vogs1/ruWDaLHU28J8ECtXu6/7p5izyt1JVNtOsYx7l+qdDpyzX8WObeMOXSy/Ka3L3LEOXK35
	J5EgvEjUQ+9uoCDkla6kvyU8uTiCAbqEMEvNjkTp+CCOlC6g==
X-Received: by 2002:a05:6102:160d:b0:605:8143:cb67 with SMTP id ada2fe7eead31-616f7c513dfmr10283142137.20.1776872865796;
        Wed, 22 Apr 2026 08:47:45 -0700 (PDT)
X-Received: by 2002:a05:6102:160d:b0:605:8143:cb67 with SMTP id ada2fe7eead31-616f7c513dfmr10283124137.20.1776872865367;
        Wed, 22 Apr 2026 08:47:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0b7bsm38581791fa.23.2026.04.22.08.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:47:44 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:47:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: Re: [PATCH v9 2/4] misc: fastrpc: Replace hardcoded ctxid mask with
 GENMASK
Message-ID: <uzbbch3uwvqszhsp23faj4war7ksxfs46ubmzhirnar7qofokp@bni76hd3j6hj>
References: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
 <20260422092409.4107093-3-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422092409.4107093-3-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: 5dS9voB9642KLPnu-49cvWtH6O6sBSF7
X-Proofpoint-ORIG-GUID: 5dS9voB9642KLPnu-49cvWtH6O6sBSF7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1MyBTYWx0ZWRfXx3YDKLPvSc06
 lWmf5fEYlmP/QF+JPNJoTrx31dc4gaNBMzHhgE3HhvOItw1xzDoxzJbNAij3TzuL05H5cf9KfEt
 mnz1ptBJ+MLYhVaifxXo1ecTEe7aQmYU7m+jFdaGUxxHJlMmyts/11/EfTJZVXqQT6f7LxLXV2l
 tyBFd5z53nKGF6hgPKfS6wCMKblqRdeI2mVbP+RJ96ZVhMyEKVLxvHLQs+WR7KuqGtuhtZOTerl
 YjUSUi+NAT/ebefeZEjDjcgZlAfKU1zxJdv//vG+rtVYvREZnwBdbBHXxsJZ7QcirLa/51kEvou
 heru07ac8rbjCsDDt4YO20sQi+cftq1J4yyU93Oqc6o5rcEeE8mlfhgims7Q4iVtu4VGc1Y6Eu5
 8FGOPVZ2dlJWY30jUVsdifTVQF59wXqPrsps+1Al3N50NSw6Pb+xnKbltFRDuxHnv7ce+63bXm/
 esiU2f124bC2z1Sjbag==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e8eda2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=P4vd9y4SQzVKkZbYo54A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220153
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104148-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linuxfoundation.org,quicinc.com,lists.freedesktop.org,arndb.de,gmail.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 601CA44818C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 02:54:07PM +0530, Ekansh Gupta wrote:
> Replace the hardcoded context ID mask (0xFF0) with GENMASK(11, 4) to
> improve readability and follow kernel bitfield conventions. Use
> FIELD_PREP and FIELD_GET instead of manual shifts for setting and
> extracting ctxid values.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

