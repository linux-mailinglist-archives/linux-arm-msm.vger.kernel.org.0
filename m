Return-Path: <linux-arm-msm+bounces-108079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HyIL4AvCmruxQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 23:13:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6CD563F1E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 23:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 974CA3009F2C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 21:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6C53148A8;
	Sun, 17 May 2026 21:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQ0Wogbv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VhSd3bJh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C8B30C63B
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 21:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779052376; cv=none; b=oqJRxdoP8p3kN9Pla/ZuUM3WrGUMsS6+zvvbU2hYIMEXyGuyYJ6PbM/6wTA1HeYSqctKTCfdDwHTvyXcYPyxFj9myAaYHvSthnyrPX3r/6WTjlGZYtzryLy69hnDHWT2jTyfj3eNG4DQ1UI9A62uST6uAtLftxIQZyT8IpLwDlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779052376; c=relaxed/simple;
	bh=giUcLwN15Q+geciY2fSlYXs9Q6AOeatRZMXPHuhQXfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJimyQjUzniLkVFHFg524OY34BLGmN7V5Vohn8GMX+y4J15m9N65C5lOLtzKjso8BJez36VEAC9mZ/PPSgsSvMn2r4k+aS59Yidrds3iWE3Thd71V/mQivQB0GkDTZ7g/USa8kkb3jEt47cgxs1eDvKgTilXiH3xpewIWzNar8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQ0Wogbv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VhSd3bJh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H4mTTZ3270715
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 21:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=USSppWQenx9I/rY2PKBd31OY
	jPwORwTFfqQeL1QfNqo=; b=WQ0Wogbv2rn73qU9D1bPIfARDwRH9oCxNGSmGany
	1ZObfhqH3ft962vYO/CFm3lJAFW3Loh+fEvyRHp9p80Ca8/yQDfbLmJZko2vFn08
	tKnsNmDEe7EVt5JqJPN9qZ+8wbqusNtW71BOexbeZbR//MJ4uuL+liI4XXgrQCAr
	iMY5dezjKfHXEOsS2HJ4sbj5hs6hjgbUx0PzLobFI/F59rbiwR4gJX1W0UfUHMwc
	tYyxQKmOLOygPz4/iouKFfb1mPKXZowz3dCFT7ajm4ULkAzhGEQN9RL2e/SaZ+i6
	TupvpW7qbdHofbpuhpVDjw0SJSPIEanRXEnREiYvTruoew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g3ju9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 21:12:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90da7efbd60so429625885a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779052373; x=1779657173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=USSppWQenx9I/rY2PKBd31OYjPwORwTFfqQeL1QfNqo=;
        b=VhSd3bJhepCnpCVNcY9VLr70lQTnXKqRGXQo+Je+I1KeoN5XvygIxKrO7Ir1zGZSr7
         UCFrchP1/5Vwy2nx2LXLtTBoA2aerhGhtSEOnUdLcx/l7ykQDOChA6Rr9c4o2i/ML9PM
         kzwY0LRGBZggNszrTS4rhoksHbP0fGTkVNsAsdbKmuX64eabUMiLPxGyOfCxaI1SSf2x
         SDYADPRkeHcuq4nmdHfgS5oqUBQHKJq/MF/YqUIpwyNFm6oGHO1DJa1O3y2+wuS9nE1v
         WcXA4sbjoR3fg6XTJvPw7qZZBB2iMNiOeYwPJKoGIRRtW06NbAqQPA89w1IIgGU5sYUr
         ufWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779052373; x=1779657173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USSppWQenx9I/rY2PKBd31OYjPwORwTFfqQeL1QfNqo=;
        b=W24H/EworgEyu4WvSh6ZuJA1oLZ2M2Zag2nAaKN3pjsF/g6QBQ3l+5lT+Ef30TMas6
         zdOn7ESO0ymo3u5haWSo5UacHu6hDP+3IRBI30h1a6yxwWccz4kEWOoceyk9Xai23nZk
         Koak37UTYg1mixz70yYT+spc5TxCrtrvo2AzYKeyhwptLrwZxX7xYoMQmdZptgzgI0Sh
         RlgYcjhy8j82MtELfBRHJkNRLlfJhTTHPIgS2KA7uOm91Q9ENQXsvVhogx7D8Xg4gZyD
         Jsh5xjE0l2NDi0qGJD2YBqBOZyu0Ml+AQJGqcFDUvAR9avgxkXDIKNWSe2a93JxpoddE
         pcBw==
X-Forwarded-Encrypted: i=1; AFNElJ82ihg1JovRQNvDe7VEIIN1PC1RkLyFo1dtT1bcS8t2tyw0klivfkOafy+6KCAZTBNP2OwFJ7C19HIYVPOJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxYayfsOoPCbcAuIB9+P1n2dwrkvU8xEJlIaAQlClJVaLUf/E3V
	StFH414K6SF9MQ9kP4FX3muBShoh6NWh7/UBWbJKDoBvDe+QHJsXYsJ9oprvlOLS1jBCMs3TQx6
	Dx+Ul1f3nggyLW0yhDPo0KLG5cPwaxZzaZJP6XX7DwQEujPFeIwbe0S9zkkr+E6D2nlej
X-Gm-Gg: Acq92OHkzrDJ9JfDab87ec8GWSR7fumTEyBKejIstgm+R5subKwIIfCwJUcjX3ks2SE
	cwXHWkFvlm4INqYfi5xZO5jPdTLh4UMwE/NW3BgUyjaGPafZFesG2KKS6ZjMpoiKzqECX8XEbD8
	mH1Eu2KT3MfEitWZXeGyVyZsC51GvraRNEsk91IUK2HoEZGmj4as4/PNdD35ZP3xq2X4yT2dXUm
	XRdPGiKx7dwAr6Bf8NRNuNRR11cSa+akxg+xebQikqjdEgp7zKCUjHeeN0ArRYqBJYdOoyNRzD/
	1m/aGHsx+U0hgf2ATp4dJRkUBLJbzlZZYDZN+pCqbmDh/VeXiMvEmj+/H1idnqAWvwOlHsWirwI
	TcVhYonB2JSKXTDNLDzC2ysBIiZXWKJAW+CuySIZLXTmCDqx/6aTGhFYMbdJzp/c7qCr/CUL/3B
	uP5SGOPEI2U7PV+StE/LiYRzaXnDIJi1LXvWo=
X-Received: by 2002:a05:620a:4542:b0:90c:fc17:95f6 with SMTP id af79cd13be357-911cef0c256mr1702764185a.49.1779052372708;
        Sun, 17 May 2026 14:12:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:90c:fc17:95f6 with SMTP id af79cd13be357-911cef0c256mr1702762385a.49.1779052372288;
        Sun, 17 May 2026 14:12:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc20fsm2874458e87.43.2026.05.17.14.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 14:12:49 -0700 (PDT)
Date: Mon, 18 May 2026 00:12:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: Re: [PATCH v5 5/5] misc: fastrpc: Allow fastrpc_buf_free() to accept
 NULL
Message-ID: <s54mqp3n6gbny4su5qysslmduxxiwkv5qsezh7jeha5oqphvdr@fba6tocb23wq>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-6-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515124217.20723-6-jianping.li@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIyOSBTYWx0ZWRfX1uiq+kxrcXN5
 QdWJZbbsH5ayMIbtIt6sl90OElECHVQKdLOfmQOgkBtWtVUPjifge6rJCAAvvIEKOSwky9QjVkN
 EGxXcobMzt+xokZwfXrg84RCa7t0vHu+qR3JbpzVdnaRYUsB8hZBbHg1hTgbBaXWAZhocj2eNfH
 +46QZiHzUfA0MDjmeM5z1+HGvEWu0OqrpqGfMqVAl+M5hN3wPY8oBz4AmOD4yetRcZBBwqHMntA
 2c4ypW1QeCN2/SpiIM9nQzaRS08h4WSkSP7sazXX8vx2dh9n43mLVn2Y3BDF/sgQXH/Kcntu6LL
 mld1x8JCaZihqXnhqN1hvaAf8iZYbh1lpEcLklsyTxn5d514BT/5JMqmji6LiotIWcmqTxqJwrQ
 GePA1ZJIotq77YZq/GHJGNwV9irN5K7XtiEIw73y17/SjE0hHx8MvLZ1652ieZtYXrAmANFrVXk
 BE5fqknkmLvDMwbACtA==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0a2f55 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=76wLrWbPWh7v4vPYDgoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 8BvPy65b1wC_vOajOqCB81n_I_hHXRxF
X-Proofpoint-ORIG-GUID: 8BvPy65b1wC_vOajOqCB81n_I_hHXRxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170229
X-Rspamd-Queue-Id: 3C6CD563F1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108079-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 08:42:17PM +0800, Jianping Li wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Make fastrpc_buf_free() a no-op when passed a NULL pointer, allowing
> callers to avoid open-coded NULL checks.
> 
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

