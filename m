Return-Path: <linux-arm-msm+bounces-109039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJMdKCf2DmoBDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:10:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 209535A48FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49C993005E99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A477733554F;
	Thu, 21 May 2026 12:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+EOymGA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bya2sVjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6052D3B83E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365022; cv=none; b=FPm1dfi3iCTBfJBN710u5IsX5ch+RBt3N33jOT52ivjnsXIjkh/O+MALkj0zXnGIgEsButt8Pp4dIraL/yKhZ6hrzEf4PRrjOYWm+Yc1+xx8gKV0+JxAcd/G/BP7F1MNrRJgNMviP5OVSs7TZnLvHS7dh7bdXGOGUe2k+PSmnF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365022; c=relaxed/simple;
	bh=5ft7tPTz06uRFx3UAMTh7vYo90vww/rhfO4/XqvZijQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZo7y7xszzmsf6lYFXlnjJ3E1irvYFpZMG+tzfhcU62VVS1yQT/74M1cqUvPU51q5rwQ6IASPW1p1iLB52ODlZLfZBrKprmvlXEw6BldC/GcSyjPMHOCjHBaG7kHRQ9zxX1uRp6XMT9Ddc1SJfpRBNFW+cN7bRkh/idD6VrOFlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+EOymGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bya2sVjB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A54i3343968
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UnFnRDhDaJdgwQ9IjMjo7q2jt0y45AcI7CnUXzkpzig=; b=V+EOymGAnDIGPCl/
	GJpbO+GLz4AOIztPzJux+zqQ/4a6bcEinMeSyH1ROY37RVGsac5ljW1QAQ2UASmQ
	RuITPpBSvE+nMRvT+E0u8sL9iVceKHEbYWKfDDpFH1iUhqT5N/AlTSKzFjNmvTR/
	XHQEj1TDtCbeUxcnn6I3C7CmbZ8NEtyb1sOKtAEqrx+46dQ6JZSY84Ia0OSQvjIV
	swHiiNOnzGYIxR6O4h8wNao3lT3FC3VfGb32v29kUpO9pAO/doQEBibfU2oCn3Y2
	k2vL/Pr/GMBeMMEYVWU+vW0hp7vm5rNafBfJD62eQnWsqsjOAYKBSBcFlCAMXGVn
	d9XsSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahs69y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:03:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914aa01cc21so9497485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365020; x=1779969820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UnFnRDhDaJdgwQ9IjMjo7q2jt0y45AcI7CnUXzkpzig=;
        b=Bya2sVjB0e1Kh4Q1VMxAJ6weOy1Ge6feKF/p15ssIrG8lQTQ7Ks0iEF3j/thuWFO7I
         nTny63RUM4Akct7tECeztN19vPqrhEicdyDyUmOGmalbVCLlinbZYJ1J/e83Ushft5NR
         RkUNEjXkYzjsZlsr1jEQJbSXMhqSQ9QXZ98Zh74TJtyZDNBreLDjtR8qJz5KJUscGidt
         jJuKD3GFW5RRdRt7Hf9t32F/d9pKTa9w5HbjcBdOScUCNCjPE6yISLbNFSAmd6/+iGz4
         4TIQVf9YDX9Rgne6LpVtmbeQhVU39qr/HsRcaVDeVrhtQWu6fR1rpVfcbPXzwtYpl4HE
         Ny/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365020; x=1779969820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnFnRDhDaJdgwQ9IjMjo7q2jt0y45AcI7CnUXzkpzig=;
        b=nYy0zh3F0xg0W7PT5UMYHT88IUJZ+HCy+TiRCqCb6a2zsSQMExbPpDaDhkl+Ez+1EN
         KwkZJwP/F/bsBqIykpa4FwN609IwJwjj5ire2O4kuiP+guB4uJEENiHdlIHqxD+FZQ0u
         t362pnwZ+T32s8RUzZJFaQFoDf+NmEjGQMatT+cNgDsYkaP8I3y5vJkTVi/p0d0tirlR
         g/lCROXjO9y2wIvStnRW1DK/t4FYjb6LwdUWC7tqRBK9DguDgrR5+SM69Fy9884p1wZj
         /iv8ysttC9z3o9UYaCZQhrTphZ89NOzsCSP8yecRqz7Ev0UpBH2iO8+etXYySURlX/pI
         soJA==
X-Forwarded-Encrypted: i=1; AFNElJ/mEXGoFqJK/ul8jTakkH/2CwJF44IwnmLXFc0vXLcrg/D9kR5AzUyIEhRvuoavLVuovg55fKt2ClCw7jwD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ocq5dvbPf41sIDqQd0hN/7zRHGKOBgy9p/xr2tF/gOCCHZes
	b4/F0iZZZ4rwXMzf+2AcrvtzrBqvZxI54pmPAjwUIqexfwWqxMsoet4G+8Sxmir0fCkOyRkCZJr
	NiEZ9EmTPzhS5acqCXADJ82h2Om+bNrsNYFJSDfw2QRtTaCkL1FwURLzPSByimeICQjbk
X-Gm-Gg: Acq92OF7KC26KspBt23gXcD+QEdgDDNuiapSHPXIdE93I8Jh2zblG71/KFkTt1QdGA3
	Gzr3KLWaVt4kUI9PAt1A9BF1EKUm5YOIs7/GtnxGKSH/UyGw5Uw6WxHZjBIDUCUr4zNz8o06E3l
	RrkkzrQC0biP5Jr0TNeM4LfpLTZw5gypdMPWVl3Lx4BsK36K4v8HiIL4KpNvWBCGgdJ/c0iRsEq
	T3I3t6PwWQCKA+GDWPIEiGce8tlok5RNG/K358h/zctPWH/dNvz+XWwSnL8CPT4qUfHztssNrEL
	9qX27VYaYJeOLhwmo0dfTDpMLUX0tF9gMQveIe5bD/bDt7PpyQ+hIC0CfNvPknEABfqV2tJimLM
	R8SUa07VkY7eoYiaYx2FTwsZqhAgDZ9RqOupnuk09ge4jfnn54DdNc6kUTGTyqbHlxxFKuT1vNr
	6FJWEY5fwKsm5xoA==
X-Received: by 2002:a05:620a:46a9:b0:911:295d:59a1 with SMTP id af79cd13be357-914a2e4093cmr208377585a.8.1779365019437;
        Thu, 21 May 2026 05:03:39 -0700 (PDT)
X-Received: by 2002:a05:620a:46a9:b0:911:295d:59a1 with SMTP id af79cd13be357-914a2e4093cmr208374685a.8.1779365018908;
        Thu, 21 May 2026 05:03:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6887e224afdsm64600a12.9.2026.05.21.05.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:03:36 -0700 (PDT)
Message-ID: <8e465091-a50b-47be-a276-4436f8886fe0@oss.qualcomm.com>
Date: Thu, 21 May 2026 14:03:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: scm: add trace events for the SMC
 call interface
To: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260506-scm-tracepoints-v1-0-4bc983264014@oss.qualcomm.com>
 <20260506-scm-tracepoints-v1-1-4bc983264014@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506-scm-tracepoints-v1-1-4bc983264014@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMCBTYWx0ZWRfX8tjUKmhkUrVp
 TtJEjd9S96KKl8zKG7CGP1mH4yKBYXK7Lh5niIwS4k3vyu8LVxBWVvFetyJcOUZrJ7yx9VAECp8
 n5JKir/BP6Sb36kyrqIypuw1URxnb2XzyXtZ236Syf8daqjySt2apJPwxtsiCjMINQbimXYKdZd
 KFJOzYzfVM0EeFt6lZqw2V+FYhYKYCD1Ic1uuvn8sNgMJsvmNce2wPsGYGOsIYgehM7xf7xZIq7
 b+D9G+KB+bqCCgyKkFxuBBTWtvKdw1HkxMKd4TDT6rufr3uKjpAujsId/d9qAKZSUfPI8MFj8rt
 m/1X376LdIdErnn3K8s5OcYJ6bXrHo5TgMf77xU6/P9mztBmPtpQ4izY+bovYCPcNYODaSy+xpI
 IltAyO1P5HQHWxq5uBpV9FZPq3nPPbyMmikT1pDwIUWFNTWbU8Sfb3HDL6BP5NQOauQpu5SWmt4
 LCrZLEcI5hKS8qJpyJw==
X-Proofpoint-ORIG-GUID: JQsnz1sXGq_hdk3bUBz0jA6-OgRsA4U0
X-Proofpoint-GUID: JQsnz1sXGq_hdk3bUBz0jA6-OgRsA4U0
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0ef49c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8YGEyzvmoWhSzbtatFAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-109039-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 209535A48FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/6/26 12:37 PM, Yuvaraj Ranganathan wrote:
> The SCM SMC call path is opaque at runtime. Stalls caused by firmware
> congestion, QCOM_SCM_WAITQ_SLEEP/RESUME cycles, and EBUSY retry loops
> are invisible without recompiling the kernel with temporary printk
> statements or attaching a hardware debugger.

[...]


> +	TP_fast_assign(
> +		__entry->wq_ctx        = wq_ctx;
> +		__entry->smc_call_ctx  = smc_ctx;

nit: these tabs-before-assignments seem forced

otherwise I think this looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

