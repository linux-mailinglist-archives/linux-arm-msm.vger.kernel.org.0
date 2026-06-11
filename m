Return-Path: <linux-arm-msm+bounces-112740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EBX/FSeeKmrztgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:38:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEF36716A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:38:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="M/ReORxb";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cE1eKx81;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112740-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112740-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4391D30241BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E26D3DE434;
	Thu, 11 Jun 2026 11:36:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295443B9DB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:36:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177807; cv=none; b=s5YvJzud3ErRyGXmxlKxcF8T/Wx88Xk00iYdQrx3vAP2nc0hHJEvAuxKCsoH5/dyw2INBEvCcBsLY7dfi9Gr3bbHPB5uoy1dSncIBP5t097M8RaKS3NXh4M3bEdGySka1VajhaKbPwPFD64TwQ7C5U36XK+jSFuohCGQJ6sGTSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177807; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7DtEKTaGMFCZfh6oR+rwmVnYcTxd3Fd9H7gj+DX2Qs3nxVg1c+ktJq8Hw+JTlDL/mR+FI3aD7DKeM6G2H+eT4tAVx1Uf8Z/tj3Nidh8qIpo9TeXnPiKASYXxV3Av717pZttqJrJchDm0mE1b/AxuHFCNI4dSmvY9A7YYTDoENw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/ReORxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cE1eKx81; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA1oiD271452
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=M/ReORxbC+uJNdAr
	ue6w04RQy9ZsKUuwsU5y4oTNEz32OcfOZmzBjqijMk3DpBEjhK2srKWEo7I/TyW2
	H6qhd7/3z2q5qevvqsj7hF5mmtrSV/kJuHz684Auk/GBOInUGwy0bpbq8xw42G7t
	oHeUsRqTbt+6i4BGpdRbbj85RLT3dEtgYpksBAFfcSq4O5w5tYISPyi3OgS8jSz7
	0YOecCquKlyIz6F3J4H/fYmPwdfFvNVtv1IFpT5+Mleu+DAjaIydglQGa+roHA7S
	QxPQcQomoCF9AHHMI2ls0aFXblLbguwgf1KYOSJcM459gvp+1Ty00EG4hutte4Bn
	ZNw6+A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71k95c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:36:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177b12d7bbso14773921cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177804; x=1781782604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=cE1eKx81Ysgfih4BXz4Z5US59kluy7xHOEzmkag9UImi9FzFWjcGj1gB0v7S9sVH2P
         s9EFE7+m4nflFLe2hrXMmzcvSjcmr6RKsLOCOrJ7yquWjjk4v+hLiGBAfYFPWzLsKTFg
         W21jVjAymJei8A6tHbHDz2dYFdIVGrdRSFwj6qy2iQFnk0Nhvzy5CYJOzXFK2gGlzivm
         8Swdg9snP7Hv0CIaEgjkPCiSHZ2nsXQpK2eiru3SlPfLwZH1GxPH/nbrIRUa8/I2g8fP
         YBNfDoQgZfwOe4MHxO6K66yb/heYbhqz+Wygn/y8CCixojcGYiLsZxVIWVruaPJdhJVk
         1U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177804; x=1781782604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=il+QgZDlwbl3kMmKmbH3OEnOL+L2HRheyBOXpYiJAE4uLM7tSYQPEDkawtF5UkMqYm
         Ep8vMehVYk0cwJz0jC4bbvP/h9822ruOKo6bhbHaz6w8ieg0zTa6+ujcO5JFqX0Y3HMU
         itBewqM4ncmRXh/eKvbgYo7AmqO2JmK+51UhFT1991tkOXdhf5GPr7k5xr+N3N9xluEc
         9qDLdd+QDoyq+9zPF6OQpcX+WraFBj3KQ6NBQS/VCoqEjvmV022+OJCcxl4biuXFPjHg
         Vq86BVXuvzBf9HxkquQO2XiIZ3v3SBSHuEetHWyxRcHd6EjP0prc1fMwFEL/9MSQ3LcC
         odeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PpP9pEmi9Ltqb4jod76v4M1TYFmcOtMUFBE0bELwujlrD9Py1SP9UEcRMdFDlKQzSGpr9Y46DsHizKS7s@vger.kernel.org
X-Gm-Message-State: AOJu0YxUbxJScYkclYbN3Ea7tqND9Q47H6WfE70xI7T8ERp2KSxnfcG4
	ttW2LLf28eEHxda7Hs0gKSeLIQEPXrL/TEDTLg5ZfSW1KJWFsUueFBPScMNh6JzFUA7A1N10Nrk
	Oxx/tsgo7SQy/dNbaXCFFkVKJ74poTXf4twC9S0uc1QqB9dMMwtLb1gWJ9ZWn2UAJw3GJ
X-Gm-Gg: Acq92OFu5JSyY9tohYklH9p/ZJQ5mbD6ghWzydQ05FrrHXVuEpTWFILpyTcyhUBJvwr
	bgFgzqHQt8e43ZChLlFV6lSgJ2FRJ2w7u6ntQZ43XiPx3MPcGmTkBrUCt/F0kCkLmiuTAAmNNcT
	Gtoz+CnBQMms5+CkXg8j3+T5+ZTx9ISITKpeeKlf9VI2yWWaDU2LRubCSCj2u4KvoMHWxlAxDPn
	WDPxwecEhJeJqezc3mMOqBVPZ/xTh4Wc9mC6FGUySGzErpq6kOwJ+jj/Xq+WO3a+c725LW0tuYl
	J+WZ56NqPMsqHJxm+sI9rXWf2Jyuc0Vz1Xr43LYOivOeOXv7PnHXlzjuP5aAT+B37QB1iTnAVbF
	qfZ7T+RaDWCadE0Ppg6G6at/i5WbU9A0PP8pnfz1Bez3UZl5+NJKS9MGG
X-Received: by 2002:a05:622a:1dc4:b0:517:6162:daf5 with SMTP id d75a77b69052e-517ee1d6c66mr23523551cf.3.1781177804541;
        Thu, 11 Jun 2026 04:36:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1dc4:b0:517:6162:daf5 with SMTP id d75a77b69052e-517ee1d6c66mr23523271cf.3.1781177804169;
        Thu, 11 Jun 2026 04:36:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14759sm53797766b.6.2026.06.11.04.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:36:43 -0700 (PDT)
Message-ID: <ec710ff1-703d-4688-9db1-54ee11b2035f@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:36:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/18] arm64: dts: qcom: sc7180: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-15-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-15-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D9eP8paHVA_vo3yfUC6AjQuzNOi6vAIA
X-Proofpoint-GUID: D9eP8paHVA_vo3yfUC6AjQuzNOi6vAIA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX9zcjp+UFHqOa
 WZFjB1SwPbAChWBY0UzqpyFzn5H4IQxnQWaza8b7QyBM7ia4p5dlcMIxiMfKPlV5S2HiTiqfY6R
 NayAtN7J47ERfiVqXRox8CjlCDGFsVidCkmxvVbNg2vFn+pxhVRljon6eR8VXtBRiVGIjq1BTlg
 tVGOF/adDgzutNmrwLp9lvrT6+W9QsA9XZupfKK7CPzSsAgUbgC+djTw26WfJZKqeCzqTybmrzU
 w2XF6HJU9tDiOuJXPzNJmz0sim8gOag9tGkr1MLtf87q2aPi02IkEaXfkLhXiuN+Y/GWFNBOLdB
 PUtTv6JA4bVMSO7LT6RsS3+1b1gIB328DpGqKm9PRguQWAWQaUpw8ympvbeqDW3hWE1fZsynkJP
 fKHdaVWbhNHr4yu2zXFSYDNrsiXbiXJESukefRFbZMRRpzgrPWre6//oPm1AnRwatyJax00MYU5
 61p2fBpC/jNNgrdsICg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX6eqppuGHJ6yL
 v0GAkcZuKNMLRUOWJe0pSwQ4ECoADLdMUUQQPmL7rzFCauaTM9c9UNZEfrYwPjFVPgxcDxz1POM
 LarTiNBYm3K1N3nxwjoDYfbQx1oPo+0=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a9dcd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112740-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFEF36716A6

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

