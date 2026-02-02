Return-Path: <linux-arm-msm+bounces-91488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIhhKquDgGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:59:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C18DCB5FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9393C3048020
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F38235D5E1;
	Mon,  2 Feb 2026 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dpt1V3u9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPTVHbo5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCE435D603
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029845; cv=none; b=LRMtv6pDAaj0X0eCDKlzygTae2XnQY7LetJB8TQVlC6EImZx9IBHciLkTNErLHzJKmb329ZGGZc2gisWAQnrVPNgfS+kpawW+71H5/Pc40ilitkXu4EEEpvImKAXrR/TDoediPIf0HqzY5beDFrJpov+Mc87D4CaeVXrr+jZLfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029845; c=relaxed/simple;
	bh=TFTxp9Whu76WPWc8LoRr1IbswWOT2EZOfWCEsAXG3cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muaZ1HChRcvp6Wrs8bVX5ydDAdn46iIlawg1CHZrwkg16ANS1pvN+sQrWdGdMO71hA9V3uDIu0K6cAdTWdnvrHBr/E2tmeCTm1uLo9H6gESzmf0eQtq3fwMoifwPN6nEbiYZOeOLU0HF9hPSPIyE0me4eveeoY9GqYTGyW21Cwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dpt1V3u9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPTVHbo5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61285LnD1583312
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UuulFgRx9rd/kvUwhvAhL2lf6p7QUWW0dftJxb5MCVA=; b=Dpt1V3u9rKUpY5Oi
	GIjOPuOONwb0nuY3VNAVkxQHYXLsyznSjcYRh/g8lQmTfq8Mft9pVlCt5jsoOxFo
	RFH2Tya5hatwejqa0yztCYXi82sGp+Q/9C5NFJXRtQWiZY3VcuJrJJ7k/jhTLlT8
	uVbTosc1f7IGFO5gz5p47UG0DyX6w9MgenSLUOs9lalDMPCCChdc3//mvNVu3Tti
	kdly3kRD6R1IfsXWyJ5KtkkYrmWnIbLF+BxttNFvUNMvlOFG9Cek7GZP/qDYRVpa
	uOu4Gl3u8IWYq3Ro4W+nrenvnls67qtvuP2iQVLgc/u3g7ML0x5bHr9uQ0AyA9hn
	rZ5Rjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1au2n4f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:57:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e518fb75so25738985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029842; x=1770634642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuulFgRx9rd/kvUwhvAhL2lf6p7QUWW0dftJxb5MCVA=;
        b=fPTVHbo5wUOSfOKVziEtvkjOMOzbXeQDw9tREExTRWFiavEyDUCN0vWQwmo+oVajqZ
         PGenC8zewOi/jvtDoyXo345xS6JtP35Xa6ohAmTOqsAmnLb1WMmnyo2hrcq/Argb2ZWC
         /IktTUWd6gKlsFzPdV1JPSxTLWX2T/0/GAWfMJ1n/ifgcRaoEjGeL1UYMNK9idu6aPuR
         hQ4R0Jp0pajoSYkPo1uBpJXZdacjNlefx+qB9Qy9n3uK7WWYrACnZww/pXUR6C+J3/rD
         Ml758mhJfl2nu+b8wgzfWuNuTbdVWlYgNZT0U82A3LOoYMTijwgnOzN3/d7e7lMVb4WR
         PUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029842; x=1770634642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuulFgRx9rd/kvUwhvAhL2lf6p7QUWW0dftJxb5MCVA=;
        b=PfM/Cp1JbdBsx3OmI06lR+1udwTHwOE422KDPOLbDDhc5m2+nzdhU6cIPU6Rr9bqzp
         bBNST1loOniBawPN/sPYINBv3hzOleDdBx9Xom/gWtJUxzUKrFRvDn9tsK5CrRhhDaXQ
         klHWvpk4OU29gl+Ue2gw+c03hXDu2XfdChuUlLI9l5EkNqJP8QMtRYVXVvBru0KamqUI
         OR4cHRBpOIwcXlm54CDswcZ/Z0Ykh3xP7iis1K5JuGmbsa+bNKcDcar8aC+j/jM5y9VR
         XB9KozTN8Js/UQzRSsB1T1wMrD3YgwqzzWw2zWpdSap2RnlNlg1R1nzCSIi1/zkTqwql
         p6Rw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Qv1iUkzzdR6j2d2zoHjKaCqXk0/XkPJZdmOiIrLPeyg+FQTQZsekH2VP80h7gloOQiEGmQ7CrxtNNptr@vger.kernel.org
X-Gm-Message-State: AOJu0YzeOz2UyG+J5+O4dgFXQ24HIAKXtqhSc/WRhAhldvKYZWuSSFVg
	68ZnBIZdBaY50sfhbCvHYdg1G0+/XyJbXEKsKqsaEoo58/WW2ni6Ebq15lKE0M5PSfZN28J1bpP
	wk3f8gaRIVnUjTXOiHoUl8i4BdDTOFQ5HqpzlseKDW3fgXr6lSoD1I6JnGeV8HdaoH2wI
X-Gm-Gg: AZuq6aL0k9v0i13yaIRZz4GYrd7eLYHVbAGspmvyZyWAurx5HYJ+bGOBy2OaHoTxkTe
	ddDtT7mwIPVARgi5lOpog4W4WjQvDDJPZczqwnmM4+I2/cTDoZ3WbcWB7lXQ6RHdUtqBbgCAZX3
	qdulfGyTNK3YfH/ydm9wwpA0Dto6FS2PZHaSz3J9cuh4ASclCPEM+74Roct8WmfzYdDOw92NZzi
	+Bnh6gqZ224kot6Lrc1U91B/KHcqQtFXvBiEHyM4/wpHSshkY1zYMrXmIy3nG6Y59uOmPVbx0Pv
	ZbpQENJDhruSpf2cOyoZDVxQJ1t4IVLESyNuRX9nvf3HyfMDZrkCxrN/UjvbbaIibavwfUyz/0Y
	SifvOG6t7MPh4ma7vj5iRHdY8ydiTm82KdRio3U5cahbGKg7ehL8DAaKuO6uKxcOXJKM=
X-Received: by 2002:a05:620a:4141:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c9eb20cebcmr1085528285a.2.1770029842028;
        Mon, 02 Feb 2026 02:57:22 -0800 (PST)
X-Received: by 2002:a05:620a:4141:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c9eb20cebcmr1085526585a.2.1770029841519;
        Mon, 02 Feb 2026 02:57:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf183ccbsm843100366b.34.2026.02.02.02.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:57:19 -0800 (PST)
Message-ID: <9b4ce86a-8529-4c55-9dcf-caecf81e46d8@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:57:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Luca Weiss <luca@lucaweiss.eu>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev
References: <20260201210230.911220-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201210230.911220-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rYiKxHxuPgIE5qZ9iVAJAPtuSoE5KyM-
X-Authority-Analysis: v=2.4 cv=TtfrRTXh c=1 sm=1 tr=0 ts=69808313 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1XiK3UaZtGXvnlVxuGgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rYiKxHxuPgIE5qZ9iVAJAPtuSoE5KyM-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfX6gRs/dkxBBnS
 +uimTSiLH8fV0TdBvEAzms+ZytOQ7X57lJ7xxqr7/9ATEl4xllLBJsLTZ++lSabxMzueS5YbZWz
 j8nGJU1DBln/w5vn3Il4bOao7x35T7l3Ok6NrNAfacNyFvxRBD0J0Z78vw0keobCPzX9jR9o0IW
 2mDIKNogJHt6c7oFylPYfKMHyE7pt5RasfFt6/aQOiAnPOevxJFhMrsJ/MMd44Tig3xsAIgqvZA
 oo0In8YF3pPtiguwUfqlB6rUjyiDf//9tNj9ysD3m3UqKWPvbCobEusEUuU14bAd0B+s3CbZ7RA
 bHWSiw2tBB39gGEuKpIGnpjzfNxy7jr9sQtd/TksFpGbsPRmZcE+wQNbxVdUJUdp/ycF0kvC/sc
 EurukVeLrsXMUFsHOLWqCJX747gYuaJnSqgMSKXR8iRLou9SKAyS2/KV6G/lj5xCGXxPnLFi1mS
 O4QBR36N829ffzdxKWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91488-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[packett.cool,kernel.org,linaro.org,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lucaweiss.eu,mainlining.org,oss.qualcomm.com,lists.sr.ht,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C18DCB5FB
X-Rspamd-Action: no action

On 2/1/26 9:55 PM, Val Packett wrote:
> The changes introduced to handle single power domain platforms have
> swapped the info pointer increment from num_pd_vregs to num_pds, which
> would shift the info pointer past the end of the array for pronto-v3,
> which does not list power domain regulators in vregs.
> 
> This showed up as a difference between GCC- and LLVM-compiled kernels
> on SDM632 devices, where only with LLVM one would get the
> "regulator request with no identifier" error, because the out-of-bounds
> memory ended up being zeroed. Fix by skipping the increment when there
> are more power domains than regulators.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

