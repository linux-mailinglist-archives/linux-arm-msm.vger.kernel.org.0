Return-Path: <linux-arm-msm+bounces-115923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pmk5NxhCRmrnMwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:48:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA306F62AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:48:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OMWHpuZl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KqQ2pUJE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115923-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115923-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6440A31596EB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC6B4C040A;
	Thu,  2 Jul 2026 09:59:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AD5431E47
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:59:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986353; cv=none; b=B6z6dpzT0bsexZ4fclgiLMLtX4kMZ0wazP0T+j1zCJ5ykPyrxYIxNdoL03goZCUZEuCOf6ZxqVCC44Zi/28ED6WgFMvKO2bFFQX1fTbPUcbA9bSmz7Q4eZCbboVXJDqKzE2vO3pRnpLzQyusRjJp/v2MP/dNNRBzcxCvs4jvhoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986353; c=relaxed/simple;
	bh=TGYginCcu8vEeQkqcYRv+UrCJ68pgVmuBMxrS9AXVlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fr218Yz/S4/FgJtpUG9Am/FYc5AD3HkGAhPulLbuFvvih4beulIpqjKPBSE4hTS3AHOwHzY4uJy14oAc6XtdlSZh/sIDH2UWrSqMC6q1mblJUUlUXZfZDVaLSBl1UI43A9i81cQhmqWptanF7KoQ2FPNpsPZdCmvoAKsaxMwA14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OMWHpuZl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqQ2pUJE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662439WW3460878
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDGh+vdlAXmGY9n6hwEN62P9ERdS9gy/4a0G96WWiys=; b=OMWHpuZllTj7rtA+
	2fEonH0UAc+E76REqzT0Y3aHJ+AAy6W2SFYDE6r7rCxxxU4cC13yenxRHwLAKDp4
	CrAP9jjB1URltIal9oSZl3M/0/XiIt/UpA0bzcWr2YQa/WG9rS28kHptHiCEyWhZ
	Dq2vl0urig4vW6OFjwMBIQqEOXdwyuy2izeHSm8YkPhFeugS1bdQaFtmkDIYZ9wX
	7AKgtzl1eKNdX43A6WmiUKaGjWvzzdJPJvQXCojgWMgAps8t1IwtL1MOaGuEhlRw
	AIdDPCfqNIpaQrGUBTbOJxBwnhDkusgC43E4i7lXOd2eiSpGbVfQ2xHK2h8yBKxd
	Zho16w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb18v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:59:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c27616421so4067881cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782986350; x=1783591150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDGh+vdlAXmGY9n6hwEN62P9ERdS9gy/4a0G96WWiys=;
        b=KqQ2pUJE1orgjn0YzS/GtV+IIRuhzdrHodse7xYZRnMJBovL1gqFMkWj1+lDAfQFzM
         dXNtvuOB1hsZCpSQnx6dkIWoaZp+Mu3VSiJHWz8D0Sh65AUKXgVBc0GstF+wsRhflwXG
         rFyVXkDncUN5aD00gsZDD7gr7JPhJKHG6ttPSQ8CDQHjRh5CXyr6rennO3Wjp+FOEwvx
         XNyJKU8xT++vsN70dOdzTF93L1AA9pz41Kjeye5oCuW+TICHEEgrYPLC5xjemAlkwc33
         daF0AWBj+jsjlvOj0aIA3aMNVpuWXEG9JkHKRXeux5KE/H95Ke7pTghgFS6k3ljcutoQ
         KDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782986350; x=1783591150;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDGh+vdlAXmGY9n6hwEN62P9ERdS9gy/4a0G96WWiys=;
        b=pW6zWYcNHRXeoCJkxTk643tA72SSg9A49eweeXeNN+dzZvhD6cnTfOM54tHBmofYog
         ipEsOB39zaxLG22X3wynTdqbDFu0LCzhUGIr7Etl/9PVzz0ZkiV4x8+rdG7bIBx+Ypgg
         Md6z+bXPdtZyzcE+Wdq+PsfzVPHBQn+5t/A7VQchklpYrrZSZffpKNXLHZmzRMcZethE
         f8byIuhxMQnH3rpwOaKfHngWyRT+wLC9CsLJ7dCe5m8r+O9OAlcMFGpu23JUUgqfuMcl
         i5fmcsN/xwV77T17wLjdEjtDa8RQGY0ufWT/oVZjBdJQsM/U/JM50WOHZBFZIDxciWnF
         mtYA==
X-Gm-Message-State: AOJu0YylZPQpxaxb+MNNZXiLTxCurW56ETu1mV1+mXWqkk5GozZZrthz
	llz9nFigElaJNGv0+GYs9ozqG4bcPgUZNeujbtrMUHiRR97PSa3WqbbC7TuO6rY7k200TT+p8MK
	c/0vnNW330BJsm7I97c4mYWdTm9pC3qJuAPjhYI7fY548HVgk5QR0Q9ey4aVaKiWb+n8LpQZJ6v
	xY
X-Gm-Gg: AfdE7cnGRHpF/gtuWOj/NS2znQLe9TKy5PRl2kphJptcmIqoII0N3h0BZwrgA/XBJVF
	JxR3vE/Y6l5l0Jhyc46OU1rt/hpZxsE+DajDbp8E5LhonZTbDAoaioBjgiZRSuL869g7iTcYM58
	taMD58DS1GfnTKGICdzmlGvrpatxMMCf5bFMb6+jUXatsZWDt+hJ3mxEzcU2zOwhGPiKLv2VweV
	KERnVwCy7ManyZzFgrY+WA4BkuUqH4a4fce9BDS1PxTN8Njc3drUaO2Q/CC4D/5mDz3xplLqZdN
	7EsX8ej4i7nFLB8yCHYnt7o4T9wjVfXm3UvQdqd8cMpe2rEDuiF26yORFv7/ubEL+TtwhPKErBI
	xoX4/ikSdzQkpTLYg/+7BYG/+WfY/Cn549rc=
X-Received: by 2002:a05:622a:14d1:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c26a76bc9mr41230131cf.3.1782986350026;
        Thu, 02 Jul 2026 02:59:10 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c26a76bc9mr41229931cf.3.1782986349651;
        Thu, 02 Jul 2026 02:59:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629082dsm103474266b.29.2026.07.02.02.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:59:08 -0700 (PDT)
Message-ID: <426ba742-8d05-4780-86e2-8940088a1e6b@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:59:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] firmware: qcom: scm: introduce qcom_scm_bw class for
 bandwidth management
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
 <20260701-qcom-scm-code-shrink-v1-4-02f5ce02c95a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-qcom-scm-code-shrink-v1-4-02f5ce02c95a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qppdjpfynDLk-gh1moeGcFe-ufaF-Nxz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMyBTYWx0ZWRfX79uNRgYMenWw
 jMeZmVSU6mmJQaD5b0M1oT7ubNLFPRT3NNFdxU/eBWvwnJIMIadbH8QLWjVY9SVIqsiv8zJI17p
 IxznC5vvHLr9ZiE5s8vwR3pvGwfkgzk=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a46366e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9SMf97g-trfYLz4DcKQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMyBTYWx0ZWRfX7Q5brH7940jg
 EkRVDH9H/TbwLxLCssHdpXLApNz2+PaO7+ap9B1Ps/PdJWEDSH/sfnQULmuRAWANm+666+erX2O
 iKjHePuuvEiN0XFrmzIej/B31WujrvbN/Fn43ZPN/CHtgIdfa0vbntA77jQvCXfV6GwKqnrvzc9
 EWns6q0EJO4o2ObJcBbj6wSCYKY63jplWAcxpy9T/YnRDjw2UIjEbFjR5Tn7UKiQs2HGR7GRHhL
 s7+t8dNSVfTFuWFajo+jseJy1EjxT0T2T1dXr6e2TDI6+S9zJLx34KK8QmcvzXOs8EAUUuvLM2h
 fKS9Eub/86ANtFvvX/DuudXbvjLA2TT+5Z0duFTyHQjDHdpswiqy0aqEKQoykO0akG8AWnEsd+f
 WFK3TweoIdwGbGpOapeprrhTir3S1ndFP3nkCV38xxDschr7XiUcvD2jnYLtmLCJtnTfroeQuvR
 pe1qu7tNE6ye1Ju2QZg==
X-Proofpoint-ORIG-GUID: qppdjpfynDLk-gh1moeGcFe-ufaF-Nxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115923-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CA306F62AF

On 7/1/26 3:38 PM, Bartosz Golaszewski wrote:
> Define DEFINE_CLASS(qcom_scm_bw) that calls qcom_scm_bw_enable() on
> construction and automatically calls qcom_scm_bw_disable() at scope exit
> *if* the enable succeeded.
> 
> This allows us to convert all call sites to using
> CLASS(qcom_scm_bw, bw)() instead of the manual enable/check/disable
> pattern and to remove the associated goto labels in cleanup path.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

