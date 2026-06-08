Return-Path: <linux-arm-msm+bounces-111812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3aLuH2GZJmrfZQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:28:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 072A965514C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:28:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QorjvOeU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XIhkckM0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111812-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111812-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C1F6349D57F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0CE3B8BA5;
	Mon,  8 Jun 2026 10:18:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817983B47CA
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:18:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913884; cv=none; b=NwNgM5zpVMnyFpPO51Rf+ka3s3qAR/r4cuIIkzqKB63VfAJrq/72uAPrQM6FT9eiQOOmIGZJeOcGgCac2uk1LaeylNU74mQoF10BJJma5TDttOwpgdvhEP+AaddspRO0A9nSyKV5yVeCY6sXdYJJiRDjxOa9nlgPrrmtEedZuNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913884; c=relaxed/simple;
	bh=wN0cKjRcTcI5uqK8X/8ma7vJ23SctluoOntV5x9kycE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rM7mIvqZQvZ/23MLDctYH58cU5r161sVqurqsedjXlokvftVC+3NcQJm6+JOiRkt//pU9ZcYsV25vxNYe9AJ57mV6Jxo4oN2YYMV/5UV4Lp4a4i7nW2bkdUSFsEiu4Vu1MBUccnZ6UfazCA7aUG+NdcvXIe7FEWpU1hY9w69+/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QorjvOeU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIhkckM0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658929dJ2677495
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTcCFfgTVyr/3HMr+cfhuRnuMObMh+dMJ5ml2Oks7CU=; b=QorjvOeUW95viOxN
	tQcwzPaKlR+H4J258Ce8hLXS4YjKmepI7oahIbdbcgbA0cLUiDn4zS12R8lLdN3R
	pksQruYFdMsgCkI7Snfp53PROAEANfrMiK/G86i76EpjNUNN+uH6GzIHsqcyuoBl
	lolHAxfZ82HaWZOqh3UrxaqeYRHugpRgVD1eP1CFeDwaCUuMjDZU/DdrdPbdd/XV
	1t7gsfDWTGV7DZoBx1RRULZzk/BA5Up91ZvPf53Mjiy1pWPFh/m6XQd1tuzBQa58
	Ndg0+riFm6j9O8WAOuTrHWgQK6BM2tlrTtz0fCpQTkGWLRoOcobw4sQ9QbYMLMnc
	N7B5yQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkratj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:18:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccd1c3b9caso8827686d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780913881; x=1781518681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UTcCFfgTVyr/3HMr+cfhuRnuMObMh+dMJ5ml2Oks7CU=;
        b=XIhkckM0YZgxU+bEhd0lrlkmrNMNTGgPv8vUy0HRaab7+2V11i5tU/AyizBaqo0TXM
         lYbS9tGLGsh5ty8boE8QXaQadwqMuRR9AYn7igs3laa+mom7Tx+ASvKurwevzk65khzq
         /4jvUPU0ClxvSJYCXoZnKVZcE3VqIXdn+3s56fEFORp/kEdaDV+xVTui3Y7KGT2s3bCB
         /Gx8MHX4dMhUOGS8bjf30ohoWERNhsp8zpubSPqTElyuT9uYDLgjt6KYHunmOMUiHcv/
         U+iLbQw61gpOBePac61x5yEqYcgUzX/QpkBXHfVkI3bbgMdcQz2dbh9dv+mAHM43UXq8
         SHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913881; x=1781518681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTcCFfgTVyr/3HMr+cfhuRnuMObMh+dMJ5ml2Oks7CU=;
        b=QPUQ8BeaLwQVBco//EhZvoA47G1xzuhBTUo+ATo+VHwRT3kQHGusLWcIIp19LOztHu
         +QopvMDwl7Dxx0dyK7KkDZI6sNrSsKffhXE52PY5j6lSqFHckW68fVJlwhLdXt1g16bM
         kA8aPDy8JFfub2FEQNLk3SWfFNh1ye7n/B0EP+qDiKuciY7Ui37b36psda+AOdRi+Spk
         4vVWUepYqBq4U1US9X6j7qSM0c8Y5NB6K/wcrULCfdtNzYkfNtxhdICqEj53bpWnM2zN
         +aio2ivJ+GhYpBx1ZmgXonDyaZaKOGCmmX+hZTGLVOFEksbzpydwB2eClcC5haSo+WUA
         X45w==
X-Gm-Message-State: AOJu0Yzs9HjT+Ai6P3i/Z/1Pz81cTSCXFpDlb/9667zhek1bdM7SZlRS
	rE/6o+bt2NL+oqZZZmcleavE7XJUMot34Kz4dcyPbeYN8+hTe3mCXoqecZt/5xjPMAELJLlqOF9
	tD58voY8t+fgJZwzOAzShQf9d0PbEyfevQK41SMO/RjyhP0X4EoLIYUTbLWFxSxHWblIw
X-Gm-Gg: Acq92OF5OX3+pDe2ZD9r3BK5HGicNZWrshHcumGbpDrkQwGs8ci2/iX+WcJ0iLiZiL9
	Offo2lnpm/ePY28dk78HfEhU9xuTQTTLhhfnYT8rcmjucAyEVB2EK7Lc9LT6pu2DcBSVoGR8zw2
	2NhTtbsNV0WjTNEfH0lFfbASPQ2N/trDHOG9Dy7vcLZkrNIAbL8pElOrCbe4QnWK5YHeeLPcdKv
	Eu/MyF3r87y2k9z3uW6GNokIoXzgD93FRpX593LXy4ug9paspe0OfB4CGppHY6nWQKIs81QVjty
	0jTv4A8Ir+fin+TJgYHqO/S+5OIQKBkthfVoX5nphs5xye4lqIkG64/zUBYsisLNTO2WS10T/Ar
	RE8dIl7Y/6szRgdaozu1A6L+/Daad24VYqJiUO6p4k6SVtJTzOXQuvhs9
X-Received: by 2002:a05:620a:6084:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-915a9a5283amr1377654285a.0.1780913881459;
        Mon, 08 Jun 2026 03:18:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-915a9a5283amr1377652085a.0.1780913880904;
        Mon, 08 Jun 2026 03:18:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1f62sm862624466b.57.2026.06.08.03.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:18:00 -0700 (PDT)
Message-ID: <1cc0de3d-4685-49a9-8a75-2b29d81c0f02@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:17:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] soc: qcom: pd-mapper: Add support for SA8775P
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608084139.1468000-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608084139.1468000-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608084139.1468000-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x-d9vL8mG2_lOSwpLFmhSaCWAyDW6pFI
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a2696da cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LjxXOE0v2TbDKeWGmVkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: x-d9vL8mG2_lOSwpLFmhSaCWAyDW6pFI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NSBTYWx0ZWRfX/J/H1OvwlJAp
 8smo3BTO7mGWJQpBoGq4sLHfyBKirZYrPQrM7vf73K5fSNQlOaZO8L+/lmPmf27nOVSyrP44QHk
 89yo9JxlQKzBEDo15mfi33V0GQM2SIFLKnIkhGPnO0n0ZR98eRory4EMQIl11LcepySW1ynsWNm
 L8MTKTWAKS+9qeR8xpv4PZt2vAmoeYMog/WkqdtVYXUefAOQ/h4kuCUFrtiL0oZtfr+6qfvacft
 43icD/iQTPbJ31pQN127nO+HFMelpU3Vq1+ATGfLammes6r50iEFB6zbWVaJoM0mxUqS//TWAsB
 ETBfG4CQArZF0R6u3NRH6lYbXq//l2WCAzvuctuyL3c4wWtTfsE6BhhB4JZcbt+58zl+wSplpjf
 U2NZglSbNsEYrg78qp1CtUhcTFi2qVRhWDCtnUndorsO/uNzWZ/Fte7J8gvWfakDRoUepFw+gCv
 YsLhaJLYgeA92GIbmkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111812-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: 072A965514C

On 6/8/26 10:41 AM, Mohammad Rafi Shaik wrote:
> Add support for the Qualcomm SA8775P SoC to the protection
> domain mapper. SA8775P share the same protection domain
> configuration as SC8280XP with an additional gpdsp domain,
> except for charger_pd.
> 
> Add an entry to the kernel, to avoid the need for userspace
> to provide this service.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

