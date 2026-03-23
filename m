Return-Path: <linux-arm-msm+bounces-99232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMV1KeYzwWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:36:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F212F200A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFF093084532
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C39929D267;
	Mon, 23 Mar 2026 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNtu/+VL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Epr/G4kK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9A2397E97
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268971; cv=none; b=KbbA0aUREtPeAGafR5HDX/twnL+WTr7/3DZPVEeVZnFhKbyNeIhPOdIbaMcKLEzBpDKSNYo74pu7HovMwsCHOJzaeUWFHlocLcEbV5atzuOHaJgSk3Mblg25iXYZWoX97NAorsnFDPPe41nB3hMWAomz0etlitdAzGt6aV4+MwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268971; c=relaxed/simple;
	bh=LOkT66V5XEHXE0b+d1Vs+fIw0i98dTofv5jFGEJtFKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tjj5w7ZdE43mlJ/ZTfXcJc2PAvtBza53ByFTvuVe9cLGzswl11jB19QdPaSM2O4NS51axc4Iu1ASQBVkmg96a9nlHTnpnDDCqsP3In0JANB4KYuL5pd51FhGNqpNU7k8ILTfB2xDoVmijeYaZyC8zbJ6dkDIBqVD7xd9GkEgku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNtu/+VL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Epr/G4kK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NADsTw3539886
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8PrlFzVWfV/cxRVHmJG01FzexjrHX/GryzH5goixwvY=; b=oNtu/+VLZqMjlQpf
	/Et0xaobOpRUswmcvwQstr8XbVYCUYgZEsclk56JBDfuaNC3etZ+yI0ReRPA/g6t
	LLz5AI3FwsKG+pbJs5UbQhpRS/y2e260PEACwKnhrnD1XyL9Cot9b8I7WEr9Nefz
	nO+NMrlu3CLeYctBX7FvZGFRNqG5Rfcb9OKMs32sFgLQwJdeaatrwHApFF4U3n/h
	E61Xx8gTR+U2D33G+JOX40UZC/+DkG0XX4Xlra3A99eVNobQEEanWYhWPr51uYZq
	ot2mwq/6jgvjb13CNV0+uHN9xTWuylQQj/Tvfk69Akqua71fHCOVhTJzhwxOvF2B
	t6zKfA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k30ef5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:29:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b04293b16cso146435855ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774268968; x=1774873768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PrlFzVWfV/cxRVHmJG01FzexjrHX/GryzH5goixwvY=;
        b=Epr/G4kKSthL/9xzG6zl3EJCt1w94gIH/ymKIO07K8tLJsj4klKyVsKGVGwzV8jMUX
         aD3hsytquFJuc/CW4femgqE1+i1leSb/+DFXc2oQtcN8LuBJpv/fwpmQdrE7YKkZRWJx
         wgb7WrZViVNw2s9w45se9BVrjLdE8foesP1cphmTtNRbrZHRjPqCOvoTEx6jvvxbOEIF
         FNGu/HsUEDpe0913iE21P8u01HygsVfaQKlT70x23KFMRUAMYAEPMku9drzsWiW+FcH+
         E9WEsPJrd7B797IpNfdnzvVci7DkT3MAzqyp1kB+IeYjUvgUriCHmKP7lD5pItoXBvH5
         rC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774268968; x=1774873768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PrlFzVWfV/cxRVHmJG01FzexjrHX/GryzH5goixwvY=;
        b=FOC0yHYOrhwlHnzEBbl5dRoR3VbiJljm5Ooh+DoodwPk14K1Okmh1BV2wD6iAFZOo+
         6vFWtA+Bjup8AeJv8tL1r2Rra9vt5dQmIOPh9AQPV8fV7aVdq/aIv3XhdWDFVQOK8rgP
         cWW+pu2/f6ced8pIBfBbJxuRB99VT/f5XBIyNmHgib3Qt3WvQA+RArxg0HTZKmwMy/UU
         ZAKoZ6Q19GE2w5nKov+ZO2GLvR5IoN4jkr2sjdWifH+FkUV1upExMeGLOajmYBKF6mWt
         OmeR9c2hYV259vcOirszZoVLYWU38OmRXkKkPnC+V1Fg0NzFTmdHiOwQ+VPopUwNDCmr
         ypiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBqCTdzZKS9TjJ/iMPu5s7lSeV53+TVW7zJV7J4wQi3NMed1TYUR5G2pwV5mk1KuF2nltsD4QKpT2t9Xrf@vger.kernel.org
X-Gm-Message-State: AOJu0YyYk8z5NPj8RBzDpkSquS5J+j1glRfMEhymy8Si22VoYehlMXim
	BGhDGWBi2X96hVMyuN+ggakUHB3PRy+uOymtFWVIl6TXI7SC66f5EJs7pbsE1Sl0dHf5ICRAvgG
	+yaKMoJgWrIrUMu004lYt9rphgTtMl8dbqXHPGg/MG64wauXo1+kK24x7Q7avwnf36w17
X-Gm-Gg: ATEYQzxk3L9oY0uEFc7aVosgV1yHvu9GrfQukciY8lY3FZ4RU+CDWGdnbAOlDeRxcCb
	mcAU/RyoddmPQjHAeOQrH5rqFHHXzAHd4WetnQF+eK5FfUmdJ+MPLK/9CpLoQH+Z8l/RxXOO07e
	G4LeX4fJbcHbg2InZ9bMwo7/TcSa0KrcIYPXHZe15g5tJatsVQF4Z1ofSpNIeG4g6Ko79LvC72J
	/IY4CLaG5dSIzE6PAnbf5vbFip/YgOwRnVFiKMiMf+iEJPvZVP+Yt7+ZosqDjw9E/qgnsoIIPaH
	c2a8/Fba1mKby3YZROKt/KPzdOCvOKT5wRMVHW9SAGpvOB1ODR8cyqTAT8t82jOQmYvAQoF2v2h
	RTnMItSIyAyx5y0cVb5Jlqp4zn5tw2rGVtMAnxXtwQoKb6ABAynjuAw==
X-Received: by 2002:a17:903:8c8:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2b08278c148mr106468655ad.28.1774268968427;
        Mon, 23 Mar 2026 05:29:28 -0700 (PDT)
X-Received: by 2002:a17:903:8c8:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2b08278c148mr106468515ad.28.1774268967968;
        Mon, 23 Mar 2026 05:29:27 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08368eb9asm143991785ad.69.2026.03.23.05.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:29:27 -0700 (PDT)
Message-ID: <a0f4c2a9-aff3-e97e-cf59-73ea0979e7e9@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:59:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 09/11] media: qcom: iris: split platform data from
 firmware data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-9-55a9566ebf60@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-9-55a9566ebf60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c13229 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hbzS8gabZINpAvasuVNEhA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jz17cmUFc4N99GX7AB4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NiBTYWx0ZWRfX9zxl5X7ZQgR1
 1b9246m5O6XnCkAcmKihTAuh0OIoRWSf2yLdqHT6IbsytV54WDCQhjuq2/v8T/H3ZL2c+DBn1Hm
 D7c3f4vcR60Z8eIUvGUDBXHnZKB1fTxfyOd+HMyem6NuqOBfj+itjS6C5cAAtE6n9rYW1e3n+X7
 DUji/y+Wm2QTLxUGw9aWKxJxCK0Q+jA8ENpwXeM3lu89glAjf0DT6xLPcc2omrZZ1rjQPm31SSx
 jT338f9ey0hnQMQ1nHheuTsKsFySDGrgZCScXa6NLwqxr4aNGEFZH1JK7L7ed9M7yVzlRsx6plr
 f7VMdADZTQRfD2dp1mO0sFyyNYtYyqAklLkUjEEgbXROvmhmIOJ1GXtGbkHTQWn++fmGqivgfU9
 eUEgXGXcOUFT1vBxQ2nVFlArP12gPydopDxxMIGtwpSvXSFiNJRI5fhpFtGGGJ+SrHD50GQm3PE
 0lhACUFD3xhmMojsMMw==
X-Proofpoint-GUID: svBS-3CoAYQtPAA8vPmVY8hLGqzb-nsM
X-Proofpoint-ORIG-GUID: svBS-3CoAYQtPAA8vPmVY8hLGqzb-nsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99232-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20F212F200A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> Finalize the logical separation of the software and hardware interface
> descriptions by moving hardware properties to the files specific to the
> particular VPU version.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   6 +-
>  .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 134 -------------
>  .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 214 ---------------------
>  .../platform/qcom/iris/iris_platform_common.h      |   3 +
>  .../platform/qcom/iris/iris_platform_sm8250.h      |  29 +++
>  .../platform/qcom/iris/iris_platform_sm8550.h      |  31 +++
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 124 ++++++++++++
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 204 ++++++++++++++++++++
>  8 files changed, 395 insertions(+), 350 deletions(-)

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

