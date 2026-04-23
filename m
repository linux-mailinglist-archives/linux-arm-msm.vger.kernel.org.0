Return-Path: <linux-arm-msm+bounces-104289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOr+FgL76WnkpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:57:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6414450FBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0372C30C0A51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5B537C11D;
	Thu, 23 Apr 2026 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GjM+Kzcc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9CfQrJf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE6B3DEFF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776941481; cv=none; b=AwmHlzsk5Te7aoUlzw/BLd8cNgQoL6SGzxQv9i/2GRQAgJjv69lB6x1USHFKH4sthe8HsoM5VTfCbSxLkh9TM2UdS+N41iIATZ+0HXbh+UO79Ii9oJMuICiFMMAlt3VgkW8/yHHoT5JGP42GOAT9U8jCu67BgVOGpmsTb4WTyvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776941481; c=relaxed/simple;
	bh=cIvHu94OlK/VxJqhDMuNfUW0Ajkc5iyIvjAm7xvvlPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcp1VYSkUdPou8OaMaIojMAZRRP0ruQlBLMkCKbSBkOA/VpddY7kW4zc3ARdNqNOj7brfTnJrEQBRJjBPId6Dw+Eefd1lffTR1p7KRDVJQTLRvhwDyIafOrvLXEB3Or2v/3EjtySxvokXqrDeNNyCF72i0sl0Xr1L45O0u+4IHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GjM+Kzcc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9CfQrJf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uEGE3044072
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w83ZZ3NDs84zER8XEdkG1ZCAzD0K73Rh1Eh1mwK1mlw=; b=GjM+Kzcc+f0QPt/M
	2zjgkr1R7mcPqniR3cY+PVff8FpphOstoJtdSgV9GjvrJ1XndZg1sCdzlUYWdJ/7
	EJmRE3eZmjuCEaAPEIFMbQxD6IdAGxikRAArYEd6BVPLJIC+olOq4XHDnxmiBmAT
	LMKSBlYp1JTYPEejRl/Q+XZbUUN3F+lQPp0Ix7C0oSZTTVQi/p5TtuarQdQtT/sP
	SgQgh/iyZ+80awSw7F7p3kJngWZuJlLQoTAUdB4pci1V59aPmcbOWXDtz9Qm8ND0
	5oV24vVtPq7KL1pjGXTb6mTi5QaEmWUWrgfT83dHX02uvA121SmNDo9+vmDxEMHX
	LKdmFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3g3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:51:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb0b93e90so11041871cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776941476; x=1777546276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w83ZZ3NDs84zER8XEdkG1ZCAzD0K73Rh1Eh1mwK1mlw=;
        b=B9CfQrJfcy39F8nxIOp3LueP4vBWeXJfn/HePRLrvEaOXr8r2WIqTBskfmjjKbOiqV
         h3Byy10jXVR10I4RFnuVqyAKFJ5n/XLiJ/2h3l80Bn9L18MSHTxGxlz2sDTRIwHjs+n9
         keRSk0dnPgmAuasvKwGzcOotjTbJD9RmI/i4gKVnXTMjyILa/JFTIDCKOhiI8Ek2XKyt
         DYIs0ZCk/HVaxAwBT5cMAcPFaOmRfCC7gUG0FSEkqQyHpv4egAtzCeBxT4M6hzgGanLV
         ZEtnoZPLFfrxXX95oCLZkZ0PfaJhVop1ApbJjWdsRVEGYN1TiHIzQdvOMEdghxi65O2n
         OSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776941476; x=1777546276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w83ZZ3NDs84zER8XEdkG1ZCAzD0K73Rh1Eh1mwK1mlw=;
        b=qFOvnySgtaYuVASuLV5+xWbCXV/Q7iP5ce0DaHXoEa0dzh3q16VjEd2d8PeOxYpVWZ
         0l9bBFtZawRZdqSn/mwotE8MLKCz8JuRArIXB0Gi190+mtNj6VrblOggU7dFz8ULR08I
         6e0TIKsiK0vlqDxyyMcdrBVSedqSFAkTO8YrnDmab3eN1ywQ1P+m45p7njDI5aKbRl1G
         pYR5fKL/1i9qku54GB2+kix89PIvjWDpt3JfYAbfFTRRwFmg0KeiPF72hm6zClRdQrrK
         7gkuLLU1mFvB+J/NpXtyKkgiEbh3o8LM7YPT+9fDBNtCotN0+YRguBXccB69/4sV1slV
         ZfmA==
X-Gm-Message-State: AOJu0YywnvDmt4ZaECZjNwvJwrTgzAJsW/Qi27lKTPRZdKeZnUf1/uma
	RZ+hEvxm32oYX3jMwCKxdNvcTIGTN9xdyM+V9707Zs4pmu1K92OkXc/LlpN5ufsdEI5/Z75RHsx
	kl/WhbtW31f11WxIgBr+AkFTxua9mriIHgi/bAhjbmOJ0r8AerEZG1Uc3Go5ERzx4Xg/o
X-Gm-Gg: AeBDieu7I00MkpqP6kvhf2LsKzU60JOzp77lTBl/Z7cRWx2jeWe/+5ZlQDclRY6J0+3
	wu24hArf1p6P+QhF5DdehY1il+jE9D9usXf4eOyZRQ8DiAQUWPD1nvPUB5HrPwLYyclwb9OwDxq
	rvqND/4pV4tbOPDDQz3ch+WV5bN8IQGfFSYCoJ/h1f3sKP0wubOQy0xEz1F+y2MlFIEI5fhsme8
	zvZrAD3v4PHRETzEJjag/LHDMbGx1tEykRURnbhA2Bf404mSPjKb7QyVwOIPYvKRAfpNNS7kNur
	7xtiy1GggXE3IQ1lHcVeNntSAwcEwj95slnmawCZ0yBdK6o2NYMDVakYqFNbIZbm4ykrepP5UKF
	s/qxMFfkuRDXo7mJlODmCndA0jCjRKZ2feo5UPiQSkFYMD52oTB/2vQO5YXFo3eD7iRX74/1Sqa
	NJVvFIKMM2nvY1rA==
X-Received: by 2002:a05:622a:a06:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-50fad4a0f81mr146970281cf.5.1776941476312;
        Thu, 23 Apr 2026 03:51:16 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-50fad4a0f81mr146970031cf.5.1776941475940;
        Thu, 23 Apr 2026 03:51:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba53297b1acsm573805066b.53.2026.04.23.03.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 03:51:15 -0700 (PDT)
Message-ID: <be874611-4318-405a-886c-4a7e434b3d67@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 12:51:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100: Add clocks for QoS
 configuration
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-3-bcc2afe4cc78@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-x1e80100_qos-v1-3-bcc2afe4cc78@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEwNSBTYWx0ZWRfX6uGE0UvF8M1g
 Us6c5YnYa/dZvbMgAzQ1r9/QS1fREAcSMvgY4XeLSnggRSJDMdwiilqRrdqJzApqURNH2DuJzQa
 0vmzKSe3oqNUUgX2t7MGwNmeF/4b3vgJlS4FsSXMahKS0c+4QpLiPCK7IpLmNwwxzm1t38HezxR
 oFGPxNbeUQW3uMBP+vyKiSx3ZVjRPaviP1Ad7kdDQKFLy+m9jC5FywQyf8S4tPRJef4JFM4FYRy
 KEUKUuAJTUBXxuWkU5dHrLvM4TB/MxRCMmfLCx1edHztZ+dQwD+4ly6sUJ5wYGcVcSOal72eM7R
 vbUqwkHhsMpjMjvmJO7RvvFEUGjDhLeQ4yU97pV6at/DkAn9IJIuUtqx1iJV7k2PW8Qe1zutbGR
 9IX67Jv1SHag/93Dq7WLpIEH2eVVX47Pc6DeB3pr9erUI4bzUGK77p93eOTBVFiJwsibJvbr0T8
 6ycMMHFWA9Vcy9zeeVQ==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e9f9a5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tiNWlLPGnZEfyRn2lfcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 28IoBn5lLZs4GWRMFsWHXEDRsstPgPs2
X-Proofpoint-ORIG-GUID: 28IoBn5lLZs4GWRMFsWHXEDRsstPgPs2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104289-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6414450FBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 4:05 AM, Raviteja Laggyshetty wrote:
> Add clocks which need to be enabled for configuring QoS on
> x1e80100 SoC.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


