Return-Path: <linux-arm-msm+bounces-116938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 48l3EbTSS2qvawEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:07:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C7F713032
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:07:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O62LOiTI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GTq9OV5Q;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116938-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116938-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 442BC3381707
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487EE47AF6C;
	Mon,  6 Jul 2026 15:37:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4A430CF3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:37:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352266; cv=none; b=fCpyhHgIpA/T2XM0J6bqYLXyoFFLLO5xAdEtiqdzizWvka7L6T7JAu0pQe8qmLAS7ExNyAvdzVONm5T0pD8iF/wYNdj+SGqYxlhgMwZfgiHtT3ucWEtVYnoAZm+gumdMAlN5ExUnZLZvzl+1rT2x+x5HosTfMY3snT2hoL1+BCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352266; c=relaxed/simple;
	bh=o9JniCOQwoZ997J2sLZ/aXDXCK5YccIpFD2pRIXPnz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0ZwvqiRjW/cV4c+1b98D6L5ZtznbFptx1eWKsM8ipHx8qtqiRLoo4oyA5f2aHTWnq0HR/Y/vO+1REZlT/EsC1dMEU9M+MguOnd9mJnPY/0M3sZbJBYAq6oC8rwrVRPZa9+RqvJc1lmMLvaJMkOulqdgIw/ue+D2BnDEA0W8EqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O62LOiTI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTq9OV5Q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF0xh956520
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 15:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1hUvU7+YPjYZoemxWGudb5HAwYsBJ2lip94he8TAung=; b=O62LOiTIr+OGbYsa
	2foSvydPvNkHVmJAENUjbCvuLzrUhR87vjk2oDpW4PEYBQf/KtjJgOJt7ak0Go9W
	xzoAAu7+KaJgvYQ6TXnLdeC10aDkmcJzLNxolwNfueGhbm//zDOOiweTTPwz99yw
	iXHcAT5At5jCQMFwdAKC6prWW3vEXA70Sk0cuRpV29yFWOBF2AIiJG9wwQS5pr6O
	wwyAHNkZTHei7IYUMR4VTvtxsGaEEunvyasH/fkR5D8HTD5gSiFkFjCLP1ho4RLi
	uRzIS92Sq4SB09zp9mAeAkOOaGdBBPpFRelJTdF0X034L0eh9iW+GbdzkTKPF01Z
	4oDUqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891usu4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 15:37:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c27616421so12062691cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352262; x=1783957062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hUvU7+YPjYZoemxWGudb5HAwYsBJ2lip94he8TAung=;
        b=GTq9OV5QBjppqcLvle3/AmeRg9NxKHjqqSmyO2v5tXQ5tHSJoTrRTrk2HPiVcyV6tu
         JBMNoS0oOA9lWX5iWwiLOJ3JgTsKUyFYqzhtTm/6zLw6efgz5U2/W8R9cO7vlnR5G5TM
         ozzsURlpnwQ2LWcmLjdPsqkJVUMLFSrlbxlgHmfozKyHCHytb0pUXLnzi8C/ryUc1AVh
         O46asJFmILDiWLQ7InDFaeYvZWVItWTQC3pYh9Ke/w9S+VKk++OMy8sjWlk/8AEZ2u0d
         HHoZX40GsbWPTTN6ZjWdwKqpRqIPXJi/3GVusLeE1sb5f4aMVUqRBBwFGp1GLyVTu4wc
         VbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352262; x=1783957062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hUvU7+YPjYZoemxWGudb5HAwYsBJ2lip94he8TAung=;
        b=cD363Omh98ptolmX0ajo3DyHnBxrvVbZwjiS4ZDeysXSoCW4bRbZzfGkXo0d5vkwIc
         7Ynw4d/87Cj+rN1QpW0s3iRLFI24kvefEETm/RjBpGO6e+CULhHraoFsuz588ZVZ3aan
         SbZmcjS0czCgfmkSoCVT6t6H7wUdPZJ15Y8ZXHtgHblzw8BJJyMK7Y1EAKrCkd0FEkSE
         oH8MsOnV4Xt11TTIZ6pcEbvGdYLKvoob84ctaxtyJ6Ue7tQzDmcw2wKRTPuw7gEk3NS9
         9hTgkeT2KQNxG+vz+XSUzJxYqCk4UpmOunQna3IlDvdeEwOoktprGobkDuXrPBLG4mte
         38fA==
X-Gm-Message-State: AOJu0Yxu7duUP/Vd/RQftZnjR5pRJdE2d9xuBMPquS7P6JAuT+O60kGL
	RvE+NAmWd/V0GydfF3grs8WC72NiwEMn20qi8A0+/S0NoQr+bs/z62zzjDAcfwT+//52q81OHCl
	M75O3j0bQ6plkJTmmv1lFPzDENog0Oddv0AdODvjiYGeuzL6w++FEaEquVb+upp0NRaW7
X-Gm-Gg: AfdE7cnRuby8rfq4r7DgmTgTcOjc7+VeZ9RtnlIbWNuxG3bNB3KvjowDJZc7TjSxd1b
	CqK8xS25TIk1B1BTzSItG1d7G8yHwAQkkffQbFEGoHP30qYSK2VOF2QlY8+NJXCZz1y9KF00w+6
	CXjI+aTdL4nb26R8GDC0b/wf5sz6Czsg+1dKgC2xkwTALzn9xfmzd+axbvsIiL/NFN6aSzRdT/J
	lkHiwvvQixvbZqR3Ufd3MTsSn5ZFg8CdxqNgPLl0vIq7wokOP0xpNxN6MESfza1wHZwlg3cc0Ny
	uabt0tqe1TGD4VBO16V2ObFF1w/+NePHNWnPcjwJLFn45dOawDyfdDlLQ2nb9Zl1VBeqVU4zvM6
	gkMOqlwZPAZFDpYY/CRa8F2tFq6g9Gn05yKc=
X-Received: by 2002:a05:622a:144e:b0:51c:215:3e81 with SMTP id d75a77b69052e-51c4bddbc26mr100069491cf.4.1783352261752;
        Mon, 06 Jul 2026 08:37:41 -0700 (PDT)
X-Received: by 2002:a05:622a:144e:b0:51c:215:3e81 with SMTP id d75a77b69052e-51c4bddbc26mr100068971cf.4.1783352261047;
        Mon, 06 Jul 2026 08:37:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd8904sm4294955a12.2.2026.07.06.08.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:37:40 -0700 (PDT)
Message-ID: <decdd6fe-7460-42fe-9e53-0352f291d538@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:37:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] phy: qcom-qusb2: enable autoresume on Talos
 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com>
 <20260706-fix-qusb2-v2-1-8d9cd73b1db7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-fix-qusb2-v2-1-8d9cd73b1db7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eiIUg8OjRKacdtcEtFMp32aKuJ7ELDGI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1OSBTYWx0ZWRfX+CDK/ZgNiyWm
 zLzscK9u/ydBa8c6B55AS61gobH4C0MUwDN8ten1XS4qyTv7GgrZJylpA2GzDv2S008RDzARIlQ
 xCLfSJEiioijL0ItXq5GOGwbqE76JRg=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bcbc6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=w1RBZjOZuwMwct0x8h4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1OSBTYWx0ZWRfX88n1IEr91vWW
 babiyOCcV2wyp18zenq6X58n37R/KW4Mk1eFi87I8ApnAGvh9pNrPh4lvuymkn6eCXZ/R3gylU1
 21FQG2uGqFmu0v2aeSTg8QEGLgcB3Gm/dcAVPcJcuF60hqShZlaEiBMMK64JjlZlbGq3AWRD0a/
 dRSBEyeJi1PdIWgVhfYrhHCVqmRpRfG+YybHiEb+KVHPWAjp1md1rxwaxVJeLGF/JsupjAHS3jz
 SB1XOqboUBL7poVCVYBiJjUityjbZEkSpkjtWA7cx6ul8Zm/0GNkuObLirvCGzGcppViaWL1MNU
 aJ6jcfLKY4Z3iZSQOlKiEXSTVVk64+WAoIcd7LAmvyJCwbicjRT5QnIuFRIEQhEckdMjPcRYXqI
 v/dsYek7xU+PSSYviFv0nJ1F+GDLi88vREzN+6HoSNEQTvgj2bvg8a+TYjz4AozPw98JQerixW2
 PNS/8lG9WNT0WQ35tKQ==
X-Proofpoint-ORIG-GUID: eiIUg8OjRKacdtcEtFMp32aKuJ7ELDGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116938-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:mgautam@codeaurora.org,m:kishon@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0C7F713032

On 7/6/26 3:53 PM, Dmitry Baryshkov wrote:
> According to Krishna, having autoresume disabled on Talos is a c&p
> error and it should be enabled.
> 
> Suggested-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Fixes: 8adbf20e0502 ("phy: qcom-qusb2: Add support for QCS615")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

