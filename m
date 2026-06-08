Return-Path: <linux-arm-msm+bounces-111782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hrtfFDiPJmrwYgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:45:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C07A654B46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:45:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nSQiXm8p;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZtdCdul+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111782-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111782-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55D7C3005784
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026353A9612;
	Mon,  8 Jun 2026 09:42:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4A12EA480
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:42:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911748; cv=none; b=gTQn/Apsx11SdQKfqGowEJave1kKx12lXEAcyDRF4ZmRN5NuegxYivHHkSgAS8EPoe/VHDmFnP9QKgYN0ubx/qRgcHMFf3Pzg6ibVksvdEDp0JsXN6jlYg2qodzzqlaeRixUVfuRk5q84sYPrHLER4Ua+nIns5QRHA1vBd3fiwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911748; c=relaxed/simple;
	bh=mUT6EzmRA7TgGKirfdNbc96pM0Jp4I/gD0W0XLKRU+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nweA1b8Zjrkm6D5RDkzPzZ7o/61901KbmT/qX8SwR1J9z5GgHBqNMPKOZhkBk8PDQBwTFJEfFGaTFSLfiMiOZDswhQnmPcXw3F+jzAozeEtRj5j9cmG3+jJ6X6hq2npE3PRYs3pXAiosQhtMdHZnBReCgFFeFU4KYvYh9oeVnkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSQiXm8p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZtdCdul+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586QpE72771081
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcwIkpumSTBfGD5TZURb1t3HusChjXrALO5s6mnDMnw=; b=nSQiXm8pyxSjiv0E
	h9gGCBzYV1h7852SwxqsfYZwI9ont/iKsCaacVpOO0dj5Qbt5tX0YbVx8OnMSMUw
	sGjFHvqilCcv9IkJQ1HNgnFuCwNjsu7LL6bs1R+e0+vMT1Z5zv5JeWcUlB0nXv5O
	YfRVv3XRyXCV7JUOwrZ3nQSSNLJhj6aWVglt/gejzj2sVFcNBj1NjMGorUccWcbP
	26nizd6Op7HU2s41sTYupxldtoKN1DcTSVxNda9rf9DBRCsh34kBDcUpv7EBtFU6
	RbUwnsSrzK2XNw9LkZyIgV7R+VgR/OiyIoLVB5EcQftVFI33LyQwN3ep52MM0Va3
	CWTA9w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6f314-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:42:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517647fbff1so14024571cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780911746; x=1781516546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vcwIkpumSTBfGD5TZURb1t3HusChjXrALO5s6mnDMnw=;
        b=ZtdCdul+FwZwI/rrtKk39s93h2dPf9nSYN+NXQxilvzcgc+F6nDTmRtO01Z1SGF9mX
         bgaOyaiwlDOwH76gZnvnyrL/FVIXWiBjd1J5KeSW7J4Y96/XpczX32ccvvSVPz67w6d4
         4baMbjFglQzwlDzLf2qg3bxn42UrNZmBhky3kB7t15jmnNzNmCwZCcRP+hBou7BK5Aec
         u9xmF0RC/3Mu4bP+xMERdHC+LynmyYWcvx73SQw7x2wCVwSkbEAtyT64kWIOwzKbqwlq
         77SuPF0qNzRRn8SGOFkv+JILdTRBTVr5GeH8e/AQVwZegNtp266Z+NiBF2rjowAGImw3
         fEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911746; x=1781516546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcwIkpumSTBfGD5TZURb1t3HusChjXrALO5s6mnDMnw=;
        b=mzdUo8VULJs1ZTkEhGF8jYmp18dwnQYYPUFaBUPaDKHIPTKfbhSjP5Ehsv40ZKZAqB
         XAIcHmdz4PSiNX405x03JcBLT36MWILO+HWKD9vrerXYaLKUtNZXH7rNX2LbpcHWjOMT
         qaJrPjBA01Fla6gKT0b2n4dBkycdOjFCgYSuIihU6nJzDHdModDVGHC9J1DXsIVMkfov
         hK4lBA2247GljXCe5tOZhIfTbUe+1WXVf3Up5GOpySlcPu5DTgCLCU0mywrSfUyEzTyx
         jveSfbV0hAy28Ba0h4X1akWsRV6RpW/jgVf8y3lK9tvLLvnb/bItN3ivE4xf8OjKJMTu
         KpKg==
X-Gm-Message-State: AOJu0YyhJ0HSjtNGmVKd8e2rVzDs3ZmR7xwqsTOkERxZkwhBVjF0prVv
	DJs0AZCgGa2Urc/LccZt9NdQY3iiDG1vbLYDaoYZ/4yImmNsFF4t10D+wLFB9yNAGFpympZ9WOi
	cZr+LYhQDXGOR5NE0ggN838ZGZiEqIVjA1Id6GGZMJjch+36EOjCxjUNntFWDrfDgcghI
X-Gm-Gg: Acq92OF1Qi0HK8LwRgeCQIx3foFOX178VTojxznj+fTTpAC9fxo/nKiT9rzOLWdYvin
	Bqedgi1xJV+iZioJEFF8tJmRpsynw8v15NUOZmBojazSM1RqviVUvsEipeLhWCYudgsr9nMdn9G
	c3CiKD/jomSpud+jZNEvUC+M2zc7x1vGaRDbSRbtiCmvG7SfuFABOmGyohcOS6Byhhm8bPBCxEC
	ygUkglImtBIu2igKeHUsy/RAbSmtNU3wBrsj54ND0p/7UoEqhLXLf5qTD9o2X35flsZlrA7Awlp
	oEef2UErTf6vJMspBSn4ukd9L5E4oavQwXz89RxoapQUHuJ1+dK4iB9IupUqyaRReiWU88U8QRC
	HXcDdMPu+hP2R0sdOixl5S93iyDbS1VkHcIzypeha6Y6oRQyeSFINfydZ
X-Received: by 2002:a05:622a:388:b0:50b:3489:5495 with SMTP id d75a77b69052e-51795bc9321mr123880661cf.8.1780911746121;
        Mon, 08 Jun 2026 02:42:26 -0700 (PDT)
X-Received: by 2002:a05:622a:388:b0:50b:3489:5495 with SMTP id d75a77b69052e-51795bc9321mr123880471cf.8.1780911745642;
        Mon, 08 Jun 2026 02:42:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051d82a78sm831986266b.18.2026.06.08.02.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:42:24 -0700 (PDT)
Message-ID: <0fd667c8-c4ee-48c6-a468-dc06e9a96dac@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:42:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: llcc: Add configuration data for Shikra SoC
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260531-shikra_llcc_conf-v1-1-fa405f5a2404@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260531-shikra_llcc_conf-v1-1-fa405f5a2404@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a268e82 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HfAEOugIZqrarMYTVK8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4OSBTYWx0ZWRfX/I6CeoJE4Fee
 sa9tSDJlh9YFVFVTvKOUH0fwa3CFZ3xYOZDb6gWwnnnzetzYdBnsv/bCbgfFK2Emug/7euf/ZUs
 49vzKq97EmBmXkn9vW6Trz9mu9hdUDaFzB+yxUDMqozSUeHMGRsyAcGLI1Ji+nCmich8/kWOJTZ
 VnwitnevYUysE+pIYHKK681sKhwdoKR/BOBX61SwjGJDM8AfC+dn0n7ZQKMyxhUgGStBr4xQyzh
 i5h6KahFCdBqA4Nh/VgbAQq7XXuht+Bu3KK8Vx7+6c2nXndXIYSUYZr9fTgp0/gAMotUwYKRon0
 Gh1pUUU5uodeOmbvZYrgZJCjLrdI/dYSe91qSmRtcDdCP/dGGWXP2x0YiHMAEqnkyilFn6rsU9t
 e/o7JAE2WmOV/xZiYXw8pw7z/zl1djBvMkpx1ZjR2FwKKG66MUOTd3rOWc8+fUJqguYRa0fTMsk
 4INMERa3U1bHaMZlQ8Q==
X-Proofpoint-GUID: 5OEHmNqqkDyzPHicgZUXhNMQwlchzQPA
X-Proofpoint-ORIG-GUID: 5OEHmNqqkDyzPHicgZUXhNMQwlchzQPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111782-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 9C07A654B46

On 5/30/26 11:39 PM, Komal Bajaj wrote:
> Add Last Level Cache table and configs for the Shikra SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

