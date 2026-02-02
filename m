Return-Path: <linux-arm-msm+bounces-91500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAc6CamXgGnL/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 13:25:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A33CC51C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 13:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86AD730045A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 12:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4D53644D0;
	Mon,  2 Feb 2026 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9lvvJQq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFmOyD9O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEC235DD09
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770035108; cv=none; b=PMvv3SZhT0FUSqwBEhdpE0RggpfTvnMhR6CENx5hKfE+ltgB07Yl2wUqDc2d8S1fxT0lRV0w4CzU4FgGnv57OU0lCwsxtP6KxFajzXZNdsB7hGFicN/CT7dpsknThxsmChZVQKFs4XbIdCuCnpjRA9ou7zXg9R0y3suiuU9EKVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770035108; c=relaxed/simple;
	bh=gUCF9+jSXyb3JIC6GV9eR70rJwXnnHWNLadFygf+hu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=roWWCbwBkvbGSgjkyB3+7lPU+w8Vf5wd/xsu9dGSo3LG/V8HJBBEhTqino11hbx8D5xQlDGJ+WqQ+yy5cIuW3BwnwbKZAmKHTzIQRsQYbXBP76RDehVS3wBk9sCLLm82GvAN9eB5WB323x5NOrEZrRHT12ewT50NC+24E9lrZP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9lvvJQq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFmOyD9O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612824fJ1244296
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 12:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xI/twei90NFc37s8BZBKjsNGdHURMt/JPbtCf1osmek=; b=g9lvvJQqF+7AKUg6
	4z7/PjIQ72WmlWUz0HZTyXGlA9ixxwvHSEIFOlM5VRN8rsruCRLUwuFpwJtmCoN2
	D+v5DC1e4neZOJBLR+PgqyXAjZ2oZceXY1v1qKYHazMoTdvpB8vlWchpMG1Oq91S
	r5YQDnuW4J2l7ansf8VXSX2nRabFidAj2hgO+qg5UYjD8TXD8F2AoTm4VPIKCpB+
	/EKnlPVZ86bMP676PFPa+XOgLodZ0xEpaSgbxOTuIhBQI/sP5+HFKIjVvj4iWgoP
	atqtAi2Ct6+ODW5jEyyoMhCCPo3BLZau1YhAQ0/FG2pMCxN3wI4lFt8mn4s+iXAC
	mSyJwQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnwdqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 12:25:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c710279d57so113452985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 04:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770035105; x=1770639905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xI/twei90NFc37s8BZBKjsNGdHURMt/JPbtCf1osmek=;
        b=hFmOyD9OEYsiJakumR/4u9hjOf1uZWCAY77U2pMQ6jPnMwu4WxcatTl4CRLFggxSUD
         nGuE91yTwKmuxkdx+30HoQ/wWG8ANxP27+Y8wS93tPV9rSFTsIOxkDta4PaseXackdjU
         eQMmgp5dOy1PiqsOAyFR9IJUDVX00qrmD6tiZrILIt3n4OW2ZZFtdrYV1Hge2AYyL761
         4IfRR6WsQDpiW3it5JZAt7yjMm4OhDMVYVnKAORhwotpbuGHnJhOjh3L5/4AeUuF5X7a
         O6UGWxuFUTFiCZ1WoOPXsUMWe472NvWk9m+XHpTpzOKUaeqtaLG2wCrVClaldsvjedB0
         F+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770035105; x=1770639905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xI/twei90NFc37s8BZBKjsNGdHURMt/JPbtCf1osmek=;
        b=OAm87Wnvm9zT2aeifWeVhIVE4bekSFeJz/zmGgPDu8+YrRnnflqqC7RgN1EBAngY7u
         e8/TR2V7MR9N4SH4YUK/VAiwPAaJgoLs2DI1Aw5eessrFfKdINKKd2NXLi3Lz6qkYzv3
         tmvQnQyhlUAmIT6hG7nMd9ViLIlUoSrGQYHBqBGMhVS2BPwhiEcRHsSPmy5j2K8f6B1Q
         iYxIvYH6ORItmPKboU7JkQRyqLS1YK3yNC+EoUHA+m5IRqfMAuAQ2cMBD/Rrg8mQVOuu
         z+0vdob7hKt9lVXPWr05mV+zJ1lpnY078YZ3+rXlvV5cyIIpmLDGMgNyEYHsiqtQhTdq
         Gb8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJhKgA7A1aFUqzS71NkVdHzqTjdVs6UCgJdQKQicdBccbZGkenpL8dqklGN/N82mIH/+HSH+1hnnCFplqO@vger.kernel.org
X-Gm-Message-State: AOJu0YxXaafNc8wlKkJjh0qknTY6PkDRJ490xq5fWBwhAEsW1O5hbd9U
	/5s+d64qj/29aQXTNjecFPl4DJ2KKRw4CeWNbc1+kcGkSAQjKyEUI06bUfQF3pw6ja0VidDt9li
	XdNNDtgLXmGas+PF/SSsNIGD/Btiw35A4qcvcKgMbIRqQZzgNfnLT5mGzJt5n6gqrNxZo
X-Gm-Gg: AZuq6aKtrjTmDMz9rQmk/A6kzWXAmUWpNhpthTjsAaToVfn/2i0pEVcfeHhMIOYdkts
	0d6qBfCB/TUL2y7XOrURAOBqeIGNoRj8RII1F+ucPEK7NTmFqkPZDmd4PS+l3+OncnFpYpGFoIj
	t3mEidsD2Y6lcK6tjX7ED+I4/TvLFTNSXlEISOmULK8ycMWT7JyvfOc6+5lmy7AZKgSp1dUMTB6
	OKkEpqGzcU2tXb3KwRDmnVS40W9fmqOESIHdgFMA+ecZSn8NP1cm2B6JJZETKj2LbX2jGyibIGJ
	Qz7ULG8pJCry4E0Q67gPyWKECsFfPPx488m6cxyoT+NPv85VDZsmlxdA6vTlwEJ44vxnP4BfAcl
	kqq7nxpxM5VR+jt3olNOuMJS0d8GmMiwpUy8Af1j1JS2Kb33Q79o8z5njT9iCCLNUKRU=
X-Received: by 2002:a05:620a:31a4:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c9eb25aa3amr1079736085a.1.1770035105218;
        Mon, 02 Feb 2026 04:25:05 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c9eb25aa3amr1079734385a.1.1770035104740;
        Mon, 02 Feb 2026 04:25:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e6b2sm7608999a12.26.2026.02.02.04.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 04:25:03 -0800 (PST)
Message-ID: <b5d7ac9d-64f1-4666-a950-d79347854ad9@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 13:25:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: Udit Tiwari <quic_utiwari@quicinc.com>, herbert@gondor.apana.org.au,
        thara.gopinath@gmail.com, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_neersoni@quicinc.com
References: <20251120062443.2016084-1-quic_utiwari@quicinc.com>
 <a2c6cbdb-a114-423f-a315-6e5e9ab84e5a@oss.qualcomm.com>
 <ec9e420a-932d-4265-8cac-dee003933898@quicinc.com>
 <c1749b86-0016-4314-9497-04e952683060@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c1749b86-0016-4314-9497-04e952683060@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=698097a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5YqSPhDMRtzW0TTUFusA:9 a=QEXdDO2ut3YA:10
 a=QYH75iMubAgA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: eVaSAN7t9DGDf99EmB9svTmtB6HYU8-F
X-Proofpoint-ORIG-GUID: eVaSAN7t9DGDf99EmB9svTmtB6HYU8-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA5NiBTYWx0ZWRfXxKhnLJ1kZ94j
 E4GMojBDigmz2BMy/p1sE0Wv0C3QeJkVUYE1/H222YN0KH9kFmz9MdJIdmaRrSqeR43oRIQrUT7
 Fowl7R5vkGuh+zLcj3pbWHHm1UKMDZY78154Ge2n8vQ9t/7UYFNfhACCbSHB2Pnc0ZbPqSgCJ7l
 VFofIdk99WAGIZFeo3PMBDBClbLnH44rSGcFrSNjgUQ4ZMpIHYe6YIhw2+F+I62VOUCVGIOwsqc
 bejVM+DO8XciC0gUf6noed9PesSr8WY+VKeL78Fglr0fFZvEItmIqO9tJKM6cHm7jBkar8CVzXB
 5GAwL/Uo78tcN4yAXCwO3Kcz5GaUaA9fjUlcMK4Iq6V7ih66GGQYaiHZE9k+ubLf5WEE7haEswu
 04v6NEQBDJ+kqYjXRn1nRjhZ2HzPwhMyu9pOcI0oVAtvPGzt/9FqwxLvloDaMGt4b5hn+oTBi8y
 rHTCyBIq4iHSZhG6xCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[quicinc.com,gondor.apana.org.au,gmail.com,davemloft.net];
	TAGGED_FROM(0.00)[bounces-91500-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 91A33CC51C
X-Rspamd-Action: no action

On 1/27/26 5:27 AM, Udit Tiwari wrote:
> Hi Konrad,
> 
> Gentle ping on this.
> 
> Do you have any further thoughts on my previous reply regarding the PM runtime optimization? I am happy to spin a v6 if you view it as a blocker; otherwise, I would appreciate it if this could be considered for merging as-is.

Sorry for not getting back to you on this in time.

I'd prefer if you used these helpers, as otherwise there's a lot
of unnecessary goto-noise

Konrad

