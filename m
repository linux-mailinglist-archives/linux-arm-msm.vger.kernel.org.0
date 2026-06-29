Return-Path: <linux-arm-msm+bounces-115070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qSsQA5hoQmoh6gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:44:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DA36DA70B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:44:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="fSQsE/3C";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UyRiesGR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115070-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115070-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 761F330135E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00C33AD50A;
	Mon, 29 Jun 2026 12:36:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC48381AFC
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:36:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736591; cv=none; b=oB5yzGABJ4nauoiE+3HRw3thl7oXSaMZHAEvGIsLUt2JdfelP34vVPWMAftmZxHNmz4JoSudwxJge/tKSPgABFbl+DKLegWQDSeQQgXcWiIw5E5nBSnEZhkNxX6yNo6NhaOlXinkTuT8H8/X/3D8+LC8gFFLM1sB20+JxrShT3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736591; c=relaxed/simple;
	bh=fOd1vlATrzNbyl3rkNB9cxiicKWC6JmMvDCgEnlt5Is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fs4icUPOfDgfW/+2IDOFkrMgmCCwo/mWSWxk8cF7Q7dj1ZvCBLXtYFyk9ZlxFqaZEHYinK1qdJC+0Hew30mc9GZwrCwKICAshm+2l8afXA1FSDqOA1JxHPxhuzGnVKTGRNt58ls0T4PTwHb60rqybopx0ZuI+5jXBJO/ofCIjoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSQsE/3C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UyRiesGR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT7PO2627951
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ccr431kUVmDQuUtWvidvL76eb4saCqdVGrFri8yjl1g=; b=fSQsE/3CdQ6xfPPc
	p2/Gx341qGxio8XPLy7t+l94WQrlYyaaewy35VCClw/aXOsieiqygXBdAb40FX3B
	mQZcV/xir/5RiYgns3g9hr1BsWFXOZRv0QNaRWLw0yYkbchRE/dCgs/xfUyUoxs2
	hMGXXadSKd10/iucNtAXVMPY0NZ8zTe2SqCsfah2OrdcSjjc5BOAqrCqSfuwbDJX
	fTlAQN6QWaSIKUXNpYKMtiybsIkfjSRrFOUo9Mo8JW5fzxFGxIWIN9MnijUIuJYQ
	ACSFADHh2gP1XsKqgMcPPpt1BZqomj3iaiUKNsqwa0o+yM23gO275EHoiDlQWJ/B
	K7tZDA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgrvge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:36:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8ee253caso1923081cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782736589; x=1783341389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ccr431kUVmDQuUtWvidvL76eb4saCqdVGrFri8yjl1g=;
        b=UyRiesGRvXrW/AyJ5xQmCIPCUr/XaWrHmqzZt+V49L/1S3DcvBfZ22tHaWlMEBDFZ9
         RYY+yrO9tS/V+cFBKzqK7V5dg3Lvx1vI8xuqO3F9G0nM9vwuqiLYOJa8w/CClxucmyef
         g+uTiuXZw40UcbD+lgoogjZTkvTL84inn/CbFoz8TCrGTHuLq+jL9ydanU/dJUFBCSEK
         KM6H0kwKPT4mw+yt+gMcWUmxEEh+zge40QVgk+mnE1U0c78zggBvIk9D3o3ikupgjuCl
         jLNDQTNRxNSzbKclp/4cxEiNl0/vNNhCWcRfgZuzjxG4tAYb3BuhbnXtPieL/5mJi0JQ
         jo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736589; x=1783341389;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccr431kUVmDQuUtWvidvL76eb4saCqdVGrFri8yjl1g=;
        b=j/hmHH1QJPdCMAPCeQUHwyjz/pTC/3qmv1EJBKy2wxZ6CZLodqMUjafPJJ90Gj5JtO
         soRCMKB13H7wBa+AWI+v5Fz4/vQv1Lzq1JcziZCT1zX0WJxclY67tEFM82Khuv/ylP5W
         szCchiXdMnsaqk5lpF3wFhc28c5IZubSjuJtntnEX2GLvpVo4DPuMBgM2xkg95W6wumf
         KfoGglqyWU9AZ6SxBTUVG5KPMddaFkX1Kh5aS9YKDr9KftyXwSZSCH9FYHfZsow4f+Br
         q1BJH7Mscrpoq3+CM6fabMF0HDwJmjXGj1uQeyrt+LOtRuiQ7PifkGs7wvMpr1EtNHrT
         8+SA==
X-Gm-Message-State: AOJu0YxqczATsd0Rmctogg4SnPtX5l2WIgtvxN16kRX+vDzuG4hoHlJx
	b3Jl9UvxRYJH2s/vUYWH2oEIH7XtnWFI0ea8Tg68yO4kxDq3LISQTB1EBA+7gPRtW4b2xD6OZKU
	fcvlBfbxiVJvIXGrh94daz3fXFSMfBxgImzYMpQcZjauBR5jOmEZD91XXRuqqv1lB3xiu
X-Gm-Gg: AfdE7cmNuOPQ+4KIHu+adWkgW1Vyos50EvqGdgc1CR8OQLz4e8+/BjEWJupR7woG4g0
	1BRk0Zvj+EaIwHkmzj15ccMDXIWJ5Ac719kvP3ZG7V2AByYishGi6USTfKqb7LJWHEchIg6dA0N
	T0h6Dz/vSqVqDNu6CUrDwn4GXutJLDLoKgfXakcHrAgMSSW5g7KyocujBfSjhwnxitXzB9vAadE
	nWUt0jLKMoiHjXvPR+Nd5DTJAdqrAUwdLtPkf2z2F/kG7mUWqzEatNG+ePuIT+qTFmLohWXu1rY
	nPjxFWZ2doX5vLLtW7RONVfKLY/2bnejaW4dZEZl5ix88/MN5ehx9zOede9gMVrJ9JzLS/OrbZv
	kCv+D3HQGqag6KTLHgoAriDetWqpBMJxIjBM=
X-Received: by 2002:a05:622a:211:b0:51c:8fb:fa47 with SMTP id d75a77b69052e-51c08fbfae7mr10319311cf.9.1782736588806;
        Mon, 29 Jun 2026 05:36:28 -0700 (PDT)
X-Received: by 2002:a05:622a:211:b0:51c:8fb:fa47 with SMTP id d75a77b69052e-51c08fbfae7mr10319051cf.9.1782736588316;
        Mon, 29 Jun 2026 05:36:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c126ed2de5csm118170466b.7.2026.06.29.05.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:36:27 -0700 (PDT)
Message-ID: <dff71427-abbe-4df8-bed2-e3f489229a70@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:36:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: glink: smem: order FIFO read after availability
 check
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Arun Kumar Neelakantam <quic_aneela@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tony.truong@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com, stable@vger.kernel.org
References: <20260618-rpmsg-glink-smem-mb-v1-1-68a026453a69@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260618-rpmsg-glink-smem-mb-v1-1-68a026453a69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: em8PIakncwmh402fP5ZAWm3RnN_iMc2F
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a4266cd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bQgpNS1FtnsdpSD-sWwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMyBTYWx0ZWRfX5XYg5tyBQWKL
 HTwNFXaqn7QKtuYqcT1HF2x742nnLggVSqfzfJgZKJ+BtkWidTfPVEVlItth30dVAxlohw83KsN
 bXFo0pVkVXGJupCKk3+ktASA7k7UeHU=
X-Proofpoint-GUID: em8PIakncwmh402fP5ZAWm3RnN_iMc2F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMyBTYWx0ZWRfXwnobb0lfmhUM
 3qL4aMhFhu0I6DfEuk4s5+xvcpMZn5iqu18cEokplnm0PRfNuAElotw9kDCB0gyoc4y7M1z7bzd
 osRtdM6EPNOMnKwvk9DFjlsp8yZ6nU49Xw7jTHOmTWSK0ORarO5i9VgZqmKOYL8DFzpfDGCv1IV
 jf/GpSt4W+4Tzv6IOXSIJ56c9y1Que2gmgDOQL6apAs5kv2zIsNq3jiKqwLe2iihPuQYU07LtjD
 BOfFYbiPREZx0AALNtNSsQTWv7fGvAiodzjiZovYClT8e9TISWmfgzAfggVHWyVwVjf0mHu+8Gz
 z6hCRtIUXCRp9OOrW9EKlneP2rKbVM3KRmwCMM5avvgnEFBErTvEltLkWnEugfsbhihzFglkaNz
 Iu3+Amc2h3c4Ooszc6Vq/+jsL0Zhj6wbbuXVtFAvrgaPVChSU44b+w3xVTg0xibsds0H49RSrIh
 Rt43h4saZK3riJ27qxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115070-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:chunkai.deng@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:quic_srichara@quicinc.com,m:quic_aneela@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tony.truong@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1DA36DA70B

On 6/18/26 9:16 AM, Chunkai Deng wrote:
> glink_smem_rx_peek() reads the RX FIFO payload after the caller has
> determined data is available via glink_smem_rx_avail(), which reads the
> remote-updated head index. A control dependency between the head read
> and the subsequent payload read does not order the two loads, so the
> CPU may speculatively read the FIFO before observing the head update
> and consume stale data the remote has not yet published.
> 
> Add rmb() in glink_smem_rx_peek() before the memcpy_fromio() so the
> availability (head) read is ordered ahead of the FIFO payload read,
> matching the consumer pattern in
> Documentation/core-api/circular-buffers.rst.
> 
> Fixes: caf989c350e8 ("rpmsg: glink: Introduce glink smem based transport")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

