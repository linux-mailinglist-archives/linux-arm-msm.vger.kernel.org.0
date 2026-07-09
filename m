Return-Path: <linux-arm-msm+bounces-117951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OLHMDvqBT2qDiQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 13:11:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF9730136
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 13:11:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SYS7QpqN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WeneMEE6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117951-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117951-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 649D630984A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 10:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD543F1AA6;
	Thu,  9 Jul 2026 10:45:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF9C405C5F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 10:45:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593912; cv=none; b=ZE3ocUjBLVnR4czVBcYfekoiZtqL4EVW/Znt5s7klV15+1jIr+moQ5Jf+BmMngipXRR5C58b+O8hCf1rwD7dU7AxLVPSWF7GFX8vornnEwVpKwmG3Yjt1pIFXZ4ofr4us3ZqhWqFfSXwgJOvQzL/C6OTQhKDpFC4ZWUeXAUkleg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593912; c=relaxed/simple;
	bh=QD3manX5WJLWHwklT44Bd7vdgJYfsMpFHVdu5gZjIIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WOD4nz8v4mungzEbSJqd82h3y+y4gBw+0iXFMyr5In586WK7yAYWlCxoIlOQspvG1LUQnVy3E6db18w7ACFcj1ybUnN7aj6i8bu7BXYOIrIcV05HVOmp23IMnSQkQ7aNU8MJRFJX6T43tt4SbHDPiTQEEJ1zN4O+bBigJcn/lUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYS7QpqN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeneMEE6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ai4Qo1362100
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 10:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TukoVQ0gaDRj7ld7E34mbrss1dmlhmyy144jGx/Q9fc=; b=SYS7QpqNi0NA1j7q
	9icx9AKADrt8J+HVynauUN4NPfaAvw6XreQSsGDrx3StTaPlQaRUQLUhzMkHICzn
	nja7mE1etjXlot8x+lpWTmxBkRsV+ENUVFFNBXQRwOkXvQdGLgb3UFeH/khMB+Ue
	G6yTQSVBHQuTi8E7SIHjILpIQdSg0YJCn8gLGogaCGPTMKHRl2UnDxzN4aAE10T/
	i+87tdF6gX6MHyfFA9VQUceGWF8r0t+AlKi+kSPqnmqy5skc9NnSNEXuAqaOCmk7
	ynYaymiz22+PWRJvQjQ6FD0gg1SE3CyH9+I6G/hsH1x6NM2ecR3gUe8EnE2kF4cD
	ivamhg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vhe7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 10:45:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e9c0c4492so54257785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783593906; x=1784198706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TukoVQ0gaDRj7ld7E34mbrss1dmlhmyy144jGx/Q9fc=;
        b=WeneMEE6z2DlNxYeGWMRBQcygnOzgc4JXcCIhNemYy0c5ykymDNPvHm79tOAcx2iGY
         A4vGV9g88HSPh1mDhMpN31x4ISaVIBVXAXJMKJWz5nwrkQxgBB14QC1ejz9sqG5CtbFE
         ZBWuxbrgZ/UtDIDzpDqEtuiEa4lfsinrysDw1Vab8FJ+OH8Xg+c+0Mn/V9bv+nU2e1YY
         VnRDHrCCAu3cc/EwQULoHYncyx4WPWaRq+NrknuqnSMJ6iLeIPqwsSnCOdm08RQG4vNT
         AdVw4h4yjzOlFd3sB102cV7aYLkTAFbtZMh5hzkEblrID0VIho3I7zIm/WqkqEM3Xs4J
         6lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593906; x=1784198706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TukoVQ0gaDRj7ld7E34mbrss1dmlhmyy144jGx/Q9fc=;
        b=pY3gVryk+aD7DDGmUzWiO9eeJQNCh3wWk5iL1ypcR+LTH0rQ7I7yoWrji9QAO6zbUk
         G94dXXH4oVABXSXjMUJsF/stiSgOd1jylc7j3m7VOUhCkwae8XzKenb2NiRS0ZSvYmcw
         1PeP5+g81VMjJ3CndO5n1obbicLx4rufq/Z8rfix/u8cpFmcTbm6jj7zpg8Yg/mWsuvH
         CER7YKwJo42gL5ln8OmnqZx61gkKgjRidI7WxQI3izfv5f/r+RCVfzSEszX5fo+7/okl
         h6NC2sEHpfDg0EBWtiVD/m71CrflwrptafqwZ7cr7l7cPrD4jLix+JZiMAl/ueBScXtO
         85PA==
X-Forwarded-Encrypted: i=1; AHgh+RqteZXZI0Y/0bWHE/9INJ0DRdvnF/1KZQ3fIT3ZWr7zVTXcePrP1ejpvz9s5J/5WbFqthsV49v+3kbxhf6b@vger.kernel.org
X-Gm-Message-State: AOJu0YzMnagjlZfgT6GRsb/GIiP+HxXbpU57FQX3rXsSsfHAZZSdkJEl
	QRf/w/n0vL8cJATxxd38v/B85rqUEKcnw6xYWmMNoxSSznDb+DfbO1aVNdIFGVTuKDn+H+5h51+
	/+HR1GOBozX+dr4rrxbeUcytvKTTqhEKblsdArA4IW/SNgpBChom41lz4SeEY6tr9XLGe
X-Gm-Gg: AfdE7cnfVSYOijdJoGOMrxgS6Py3/w9EOj6w7+bKBDYDqsN0QE4z4DAfhnOz0ek3YHN
	CgVgeaMlHlLKbluD5lospj9vbg4zuMwhLSvadYU3ftkjYxKT+dZtCyqR/Vzupz9atMqbfYpUCf5
	bbZP3M2JYERGE5gtEaCItuc1TfVHgGKJtJiFqjugCs8f6f9GFnA0f8v/AXBziQci2SCbDh/EXBp
	CVot32eHbzKbC6wdWoohxrT9vaBBGktQ/nY1Xud93g+5va8dXpaedY5hSRgKmrAz26kZXuqWTy5
	yUJvt3O/9hjZ9QCUJomtV6EKHYEArhReATl9Q+ub1YlWLOuywIzQ+Xdlv5hg91lcw8kdo/z9FIS
	z8wQMsKT3fCY39VyghyINo9HU6g9N6SL+UBQ=
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr276070985a.0.1783593906102;
        Thu, 09 Jul 2026 03:45:06 -0700 (PDT)
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr276067685a.0.1783593905690;
        Thu, 09 Jul 2026 03:45:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada05d72sm465024266b.53.2026.07.09.03.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:45:04 -0700 (PDT)
Message-ID: <89a2537b-ed04-4444-aa1d-698b0f998fc8@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 12:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: qcom: common: Register reset controller only
 when resets are present
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwMyBTYWx0ZWRfX2VbHgr4T1eIP
 qAU+XO0jKSa+ESHHFeNAEi/xa1Pb+HsBQZE/5uWQrf45M8mxTReL4Gtetb9mFyms1mO+W/F2IHI
 zHCOLRvvEg5lAO9d845oWnff9n3I+6TYiHWJDJkJpDvM/dUDEp2YUJDTNPpaMokfLYUrDTf6lAx
 Ts6PJNEDe939ypzji+R9yXuJ1Cyf5jUCbWyuNDgtS2E5+dRYCgZ68NS93MPRuAXz/QA49EJE3Cz
 qVwpCmnhFZ6XmXsXZ3c3sUtMzPe6bCE+fT2F+2dWuLohPhVak+atH0wVbpzlPPAcajestPswfYa
 CeriJxytj6cUDjS8wG1I31aRKv2qB3iLKGWTS/m38Eo9YI4K9a+pFHMiu4Dg3Sp4i+I8zO5M9xg
 kMGDP7M/DJ3oPrxTcsImcR2ioUuEj1DI5RsnsKyxKcEVbYExegAXy1tNoyFlFMltXTmhKV142tn
 2CBkKN5eWoYJffT8kjQ==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f7bb3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwMyBTYWx0ZWRfX4Txv840RJHVO
 fZNZ3ZWp4D05vdN0ElYs8BDb03dDKPI+cE9OnjkA+WlXnX8SYwliyjWCAVerc/iAE5fPpB8+0y6
 7pPGHARAovQiH/2O0yO4fqBHYclw0Hg=
X-Proofpoint-ORIG-GUID: OmZagcq-pmDbWqZO3AqKEfZf2gfzzwR5
X-Proofpoint-GUID: OmZagcq-pmDbWqZO3AqKEfZf2gfzzwR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117951-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77FF9730136

On 7/8/26 8:25 PM, Imran Shaik wrote:
> Some clock controller descriptors do not define resets. Avoid registering
> a reset controller in such cases by checking desc->num_resets.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

