Return-Path: <linux-arm-msm+bounces-99219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKYpB3wlwWmbRAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:35:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 101442F149D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 530EB3005170
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE4F39098C;
	Mon, 23 Mar 2026 11:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEKOKaLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VHLZm9S5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CD437E319
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265668; cv=none; b=auqHGVdJG0ZPgPiv93uTBPy1qSyw5ImfWygpJHqq5QveesRFheEVszdNGh3KV7/8gYZsMp7IYB0zgizCExuoi9dJo4pUdablKWAikgUavPnNxSJX0nO07MTaBdBAkOfkdlujbWhF+kjUbe845DVq4I4RhS9GZNa7fRKPQVCurws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265668; c=relaxed/simple;
	bh=5y6Bd03R9I+jDsejN2kyRg3MgRmiMG2aUkV/pbS3EVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSTJjzR/mezsVwzcFES0Zp1incHB26VhiZrPzKaDRAGCJX8DvZdE93i8ynjLPp5Taz/DOF/BGHTop0s3/yiRjcwcmcb/phpQHpIeTHh9BHcLBpFueFdZattfjEjHu4jR2lFYUnlXMGz1HnATIM+WY2cbwF5jwyaLWFXHsHHhVX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEKOKaLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VHLZm9S5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7u2FF3468342
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yP7BePyV8V69Gp0dwYW6aB+HYb7u/dPAwd2KQHqi9jo=; b=kEKOKaLc7JHXads1
	LiyvnEtYHpnm7QbgsRkuvvdn5iKUn31iiuV9BJoaGZr29co3jC6kI6pStMAiBmcR
	6jgwwFDiUIfP3Xz6UPHNmYvTvu77fvc0/3f2yPaPzuL1lSCpUaV90AououKvT30O
	G+3/JVwcwdGxb7zOb0GFIYmrQ91hdZ+HEuf27XuNJ31Kv3ueDWu+r1bdnSFlSjFW
	8WQX0dIhJTah6TVeJXH/KuQByFuvwfFBRwAECylOs36ZaEM3MWnqreVobcxJz6S4
	PMqMGMbj9ECQGPJ46f0leb96RmQAeSBh5pcCD6wQHyOSf5y4lr7Wt3oc4AH0X/nU
	BpxW+A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jggs6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:34:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50943e69b08so34143141cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774265665; x=1774870465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yP7BePyV8V69Gp0dwYW6aB+HYb7u/dPAwd2KQHqi9jo=;
        b=VHLZm9S5nGqvINpPdMec83tf82BOiFRZsVehKA0ImJfnX020GoamMP6LsVPrcKmZF5
         u/8j19RKSk+kLa8Aimo4n8/QBTL2KOMN8tW9VI7AEouZy/iP6RuXrW2AIf757/bZp1Gv
         6J0TgokhsMnktQFn9eZA4gY3+kjY9SyD7BwSMRfQQhaad3lXDRB3ZYcG5cQIjLPbx2ZO
         w7uaKE5yxe3JgVZYrbrNOhH5bRuttQgaEUA9Sue6RdAd9iqK2ytpUS2XIBQJFr4sAggU
         wydJwt2bO4Yi/K46+MyBgkAw19XTH83+cuHYsdMGNOmDXerCZrYlEG/MiDQ8jLJAzrzf
         lhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265665; x=1774870465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yP7BePyV8V69Gp0dwYW6aB+HYb7u/dPAwd2KQHqi9jo=;
        b=rDSuZB4G56+TAEcW6iK97pnsSkqC6TUrTMWC+2GWjMGCs8rLPvil/ffIaREmuACRCY
         rm6hHDQWSp9eUlpFu2FgdAxqE8GwG92XVMKBXzc8zN1qLWnT1jz39s82aUfXdNKaihqR
         /9YNOPF6es4dqnzsvBJwnfs9jpsY+wsutoA4ZuJ0dQvDoabKm4qVngG0p9nN4o1bf9tm
         syUup0eSR3V8hFiHAN27yUrtZKOJDomjgIlqNPYxPBAeazONFZ9b0+4bX5h2YDwYTY5d
         RW2RHFZwcgaR62aKQ/gBruWGVTqLWxcaVmqNiccAj3SBlUTAysdOk913hF32t3DkGVWd
         vOSg==
X-Forwarded-Encrypted: i=1; AJvYcCU3JxOIieifa+pmzC+6uhyCoLdQrBzVhkpwiiNgx8BmC91RnM53VvgcIZR8JgpUziyj5T986F15vm4Q+TBc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy19TdbsNW5sqfvwXg78s1zIfWb+hVnJLf3SAGDTwTIWfYhY9ZW
	zIpL1wzYo/Es5jzDiJ4Yh0HTLyh2NaHSQMkinydtW8MU9NXE340K3jpdyfIg0NjjiBe/WfdTh/Y
	/Pn1S9oaQlo3hQsLRREjhQdl0MhXXHQEgP6I9XWvPQodgKlOg387Tqaomdal128XkhDO1pssRq3
	fP
X-Gm-Gg: ATEYQzzHa8Pw9Kys6ODZ1x2HC5ZWUUKuHqJfaQAn4GiuHdO/WefZ04UOmnGgFX8deJV
	dpVRFhU3kNnHR0KHtxowYWk3hvKVfWENRaTAs0wrlpCRWu/2xU2IdF8OcWe4ELFdsk8kGxUC03a
	vB77GIhqdZRSASRcRfv6WaBuiC/0/0emZ74xLM4s1rKZ+C/WGiHuin7D7F+bfGlS8GMzdq4wwBv
	4Vw6miporqb+p58Tjv2fqE6tF1C/SRJEZ//Em8uwSLyJg2/MBDTaUv0V3LO6YJCi6Q9FJ25a0L/
	IU8N8jMQ2IXM9zk+JYwcVrH4rfU8OKW2c3VZoHCEhU+Xjix58ERWYerfho+acuZ1+JAwPziQava
	952+7vLLxQ7Jq2aCPO6pavsyTTbeG386HwGBE1rLMGZAWssGK1+r5Bie42fhMp0TICDkdTZXsHq
	cUv0w=
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr45722071cf.9.1774265665434;
        Mon, 23 Mar 2026 04:34:25 -0700 (PDT)
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr45721831cf.9.1774265665045;
        Mon, 23 Mar 2026 04:34:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a166sm489893366b.42.2026.03.23.04.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:34:24 -0700 (PDT)
Message-ID: <b743b408-0b24-4660-9879-3536d8006d7b@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:34:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH QUESTION 0/2] NFC support in Linux (and support for
 Qualcomm SDM845 devices)
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RCZm3E3h-O7YgOfI8OMKRzShxKU5Owsq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4OSBTYWx0ZWRfXz3l6kJbpbGTj
 b5k2X7l6pv36kYK6DMIqAy6vjWl2llXbkOYVRMBxaCJdjHa8JzOsqHplCKYi7v7RMbW+jpVPiL3
 7REeeeiLOwSCHM2Kx4oJQtPVser0+3dxhTIHSRTZ5xgLJvtjVrolNZNcC/+I9bKZ04ALML+P1LK
 n+FU6FcjOOBdLeyekEmFclWtNgHuXU14ShnFje7U0ZcbhQfK7tDNTAF/HPqursCMc4Lc818RFyV
 zkL8N19R4aIen3l1cD33IjWxYhXIzlA0qkQ/nDn0YNCh3j4q1IFrk1EwKoRbp+8NmKD4VOwo5eQ
 ynb0Rd5on7MST5XqofrbhS3ZXaPG4myNfMEhEn/fcXjW1xm2tGm3cvgeVeEpKpA41JV+k6IIsQo
 OuVw0HtJtQ9TL3uJ6pNYc1b9aPSqQrkM1/mrO+f7/ck1sX8TfdrsJrOpR8ZfiQhmx52m4qsDFOK
 BlPkpM3Kn3DXTOSRphg==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c12542 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=XBYjAflyaPWs-M9QSm8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: RCZm3E3h-O7YgOfI8OMKRzShxKU5Owsq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[104.64.211.4:from];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99219-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_SPAMHAUS_PBL(0.00)[78.88.45.245:received];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[209.85.160.198:received,100.90.174.1:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 101442F149D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/22/26 3:24 PM, David Heidelberg via B4 Relay wrote:
> There isn't upstream driver.
> 
> I'm openining this as a starter. We need a NFC drivers I assume. I tried
> quick check, but both of NFC drivers register
> 
> nfc: nfc_init: NFC Core ver 0.1
> NET: Registered PF_NFC protocol family
> 
> but efficiently does nothing. In the See section, there are some ways
> how to make NFC work, but rely on patched vendor libs, missing updates
> etc.
> 
> 1. What hardware is present on Snapdragon 845, is there some
>    documentation? It seems that both sdm845 devices has almost identical
>    setup, thus it's NFC solution integrated? @Qualcomm

As far as I'm able to tell, they're clearly external ICs

Konrad

