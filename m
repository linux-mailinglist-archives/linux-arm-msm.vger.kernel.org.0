Return-Path: <linux-arm-msm+bounces-93151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yENlB3dZlGkXDAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:05:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FE614BC0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C265B3010617
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A58F337118;
	Tue, 17 Feb 2026 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRvVmN3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFihUg2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F0F337B95
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329905; cv=pass; b=ZmMUjhspf6ggAALqGJvWVtJ+H5Qkp9eUoLC38uQvCdieSeRftevWpxlaehKPwz54gkivja0S3Jkg8AhAcEhh6mB2nQyiKyzlXEp0unCRFt5eOClmWIncqyTwMwCCCWnYYt6Q8aAnvhpmlwbOEs0QH63WHIdLjooSWbOVhkT7i/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329905; c=relaxed/simple;
	bh=9KVFgu+BEJg1ZO43wRkIdKpD6W9Kxf3Y90o49FxY7zA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nve2Et4f8uxHEBNm+Pm3VVI8bVEKt4OBy0Oi4bwZE8zHEaDZ/eCzcbmCjyqdfKfayKx4ZlfqRbbVMRDWpLiDjkTrRBC0Uyeixi1pwpGCHPsWpo6ozjwtBswMVfP9AjATLJDv+0QEi3ehfTXww9gY9aggUunLBgjrIrDpjbjYcKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRvVmN3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFihUg2A; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBDg2h125852
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S/yWZoY0bWvRAXMRtCqqCAXL
	oYJkkT33hUE89JH+vyA=; b=TRvVmN3cvKt3SzUiJFOL5+4H/jgCEkLkSzs+eXZI
	bTP3rNZpJRaPr2Evk02oHEi+igXXNbCQF0NmmRM4w6ngqZHS1PEEyWx/vH5Uy5/J
	RUmQxMc2go80ZFbJJb8JrFT18ev2W398WATP0r/RN1y21X/jiSIeRbRi4zJkCpq+
	7cT1uNJtxY5zdNN6yKTk3Vo7O5WuksYVQo3bAij9Enfi8kayM17DJuXueYi8QjHj
	7U6ec1WPeeTeqt+Jk6LuPF+qyiJaPnToUuW2+WvQHE/+VXPX4+fwZ6UWuCGl1BhK
	pseTYseZLFs+jys2CuGWPy5KKBBOH71K1LIQa8EemY8wYw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxukbda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:05:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-352de7a89e1so4241496a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:05:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771329902; cv=none;
        d=google.com; s=arc-20240605;
        b=ILu4S1Jwp68kuGJsohScGeu6Nh3Hs/2qTPon4NGJoce0pPV+vCEAuKUPqe7BcTMBoS
         eEVBQicsz/w0yyqiosS8V1NHoIHBqN34BxDMyBoLMT1BvduoxCilL0hstzYkZORmgoHz
         KBFVeqQUzBvr+wNRHu8ZAsjHBW9ssv/PCx+qvbZcYYTfnimGD9UBf6K4l7QlvYtuVynv
         URh/u/ql9hfy/3DOsVU65QY4LzPtfXqKz1kEh4nGNhpRds9yZSRY01EF6OYUmZQworet
         tqq2UCGS3av/BuSA83D3jfV27TO4FuYOXErpbiUmeOWnTGG3Sub+7eLm0VyCbfzAeZL6
         h2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S/yWZoY0bWvRAXMRtCqqCAXLoYJkkT33hUE89JH+vyA=;
        fh=yGoRNDf+B4t9cHR2Zxddux1UYY6C7zwBvrEHU2qQKsk=;
        b=fp+pS0MsDJbhOGhJS5XyZVcURAaLFBNsPK3CFV8OkfJCKVW/setyYiOo4vDk1hO+W1
         /v8o2843Rj4sLRHRtS+hSPjNZJphrznIMM6ZJjQHDCS/6emh3ETudNcFx7eK61kdGqJU
         0/lXn6DMGiezvHJp4kRSEYZnXRUekHXNywqWoykLq7q27/P6BijS8aFQtGssvaATu8Ns
         WTCm1MZoq/1c1R2yjA6eJQQpbJpJdafz3I24OWgPRBOae0Q2RMIrs7dxG69z7jEAb+aV
         B/qR7LmDt7AyZ+uIlAwR9gajBAzmyBha67ZZKXlVLIV6b1cCFd8ZwLh5b0msnc/04fzZ
         Kt2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329902; x=1771934702; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S/yWZoY0bWvRAXMRtCqqCAXLoYJkkT33hUE89JH+vyA=;
        b=MFihUg2Avsn+L0Pi7GfkxXJSd4nU9BirqCxtr9FwJBfCzyT7dmxGbAdhVXp/Ytoa9x
         5b7d4MQu+9qoNjIuw+NVO511SgwntsV60PGwPTpAa4IsYmtjo0+HUrxPvMc/I+n7V9G/
         EseEhdG6EIXXRj68Fu9DCdLglDmM+DH6WYDboYKNyFLpGtu9RFjoPOaL5B9dS/91Nn3/
         dUHJNHGlHvVRFWNsOYv7sm6JX5HSsJppEoy6H2YmH2RgksFeSJbzBYxrTWByF4aDflsC
         JxBB8FRfwqZGabJ6veLcbn68iqVCyqtn9FDN2S7EuN4nC4/oVhAJkApqhQH+IOk9VBOI
         jdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329902; x=1771934702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/yWZoY0bWvRAXMRtCqqCAXLoYJkkT33hUE89JH+vyA=;
        b=q4K2V4EYZiPLB2ZeSGUeVLLWrAXSQQd5/0gQYdpsN4N+EWU2GOXriKnBM5xCV/eOKZ
         wB8OwTi5S/llc9U56RLvky6CKTaovZnvFC5mGIQm9wchG74Y1JnGsNYGC7U3j9ucfAoV
         +SgZBTUF4AKmsRE0OT73r8WXVVwE8l2jEQ3zDU0RbG/9C3SPiCJ2KLyfz3uDoO0ZYZ72
         U+jPsLWDCUqzT4/UFpA58nMoSJdWz5cUB6b6MY/0B+q7SPE8Ur12QCYcn6FWEt6hNe9c
         B9KnS5vThMoX11VwNpMwYdMemTG5AXR8y3bZyJH7V8SpdjP7FCuqHrEu/NVZxiAsNkOa
         JiYg==
X-Forwarded-Encrypted: i=1; AJvYcCX2uO6Ib03iGiyZIwQcGVLyRsytxJwUYOv4x1Qx3ISWTxxBgVBrlUjPoO7H3BxJ/lyMvc9JOQpJUYHpoR9O@vger.kernel.org
X-Gm-Message-State: AOJu0YzGOjELg4CB6KcO6zDSIHRsAPZIrjAS93ZnjTPMzLaWQJzCYAA7
	P2bEDejx58ennbqxZ63bWkXlZequ17oWOG5AoJuiwmo9QDMQlK3ZVnHhR1X26a4Lh9Rp77M/86b
	9XxdKnZ1VjiswPlqnZ1U/q6ZWl6X2FWP/ffe/7Xx2nQLLyTqKNQkmvPS7e+Uu11xGr37WhPbICe
	Cf6f2fSsAmgKncaFlws6HcWVGpi/FMWcD0EZQBwx6IEps=
X-Gm-Gg: AZuq6aIblARC0X6tTN3vEuwFB2vxiIQWJBVunyEVDo7t55Eva24UKQCR6LLy7Mi/is2
	ZmDx7Yf9NSuOD1zbORNvOogJaC2c6nsHhPuuANZE9wO2PTxO8y9kwKKey6/M3mEyAUuz8b8fbYf
	iUk9OPdHNIX9YdLTJTJHomlMKsB/4yEe7UXyYga9dRs8qqZkxAHDJ86ujAcnQ9cg5OZcqHuUVD/
	rAjoxeDDlGOFW47UEno
X-Received: by 2002:a17:90b:5646:b0:34c:aba2:dd95 with SMTP id 98e67ed59e1d1-356aad9e00emr11360439a91.26.1771329901780;
        Tue, 17 Feb 2026 04:05:01 -0800 (PST)
X-Received: by 2002:a17:90b:5646:b0:34c:aba2:dd95 with SMTP id
 98e67ed59e1d1-356aad9e00emr11360417a91.26.1771329901223; Tue, 17 Feb 2026
 04:05:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com> <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com> <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com> <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
 <mnqt1vydHJ7duvh6qPmtIczPjjPtvVtq45CYhLhlpdAIKfAXuZDtVvIZD2SN2d2m7oF1f75HTXuXFO7qS4ahxw==@protonmail.internalid>
 <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com> <36e636d9-befb-40fd-b63c-6ae48df61199@kernel.org>
In-Reply-To: <36e636d9-befb-40fd-b63c-6ae48df61199@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:04:50 +0200
X-Gm-Features: AaiRm53GORJdxBY3_kRF8qG8hajVea-pFFjSIbX7-vNM8UH9kdgfxYwxz3VkIQE
Message-ID: <CAO9ioeX0HZNOKmDkrp-HPSei_QAYGvar0-b1ptrJnoWKu9X-kw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: DyCGCwHC2Hhl4fQoxaLHvQFv9h2AMjOR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfX87ajyMiOMSKH
 fcC/sR+pGS/ZiDT7Od7Dt4t+njp+3XdwlbW3grPI82Eco1gwcUKyY0JPm5LBgy7ej2cIXsAIh8B
 TUvcQ1ovUGVyRTrdVX8pbv+wjiE3zdiXC1uTtbxa67wzQAtbpo0Fy7TrKAwKjdZumOt20Gewbiw
 fbOAVJsKPoUC8Tw7nfQXt29VDrX2uzXgJvTu1GKArR5KuY001qllZzc8mzKA9DEr+3NBjE+oqOt
 klHJp/ZA1rzukTy7uHXKVvpDIkr4HvdK1eoFHU8jUUKn3+ygw6yugpnqGpqlGUVt5tfpExKNdXN
 a84pje1oUFr5eKGD3nZeYNzOqfZq1spHOg8rHLT06lpvT3pKnftHhlcGKGfGNmhDlSV1aaRtjZ3
 lUejkub1ner99kghCQl6UdW+5KBLJd+pQgMyK2rxINaO7Ylmh9XTRN+8nOkqEAyC0K/e5iHFe7D
 Mk9GvGTOFh5mDVhMOOg==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=6994596e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=_iRmVI0JDk5pcTnXREgA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: DyCGCwHC2Hhl4fQoxaLHvQFv9h2AMjOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-93151-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 00FE614BC0F
X-Rspamd-Action: no action

On Tue, 17 Feb 2026 at 12:37, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 17/02/2026 07:40, Dikshita Agarwal wrote:
> > Due to these constraints, I think, the only possible way is to extract the
> > version from the firmware binary blob itself.
>
> According to the internet machine
>
> MDT::SW_ID
>       GEN1 == 0x0b || 0x0c
>       GEN2 == 0x24 (or above one assumes)

Neither one is correct. I see SW_ID = 0x0e for all VPU binaries in
linux-firmware.

>
> If you can verify that with the Iris firmware people we should be able
> to parse that data out of the mdt header and reliably differentiate on it.
>
> ---
> bod



-- 
With best wishes
Dmitry

