Return-Path: <linux-arm-msm+bounces-115375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aHrfHVafQ2p4dgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:49:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2926E3226
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:49:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=g4dvGxdK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IXXlpJir;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115375-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115375-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EC1F30FFAC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B473F660E;
	Tue, 30 Jun 2026 10:41:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ACF3F5BED
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:41:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816082; cv=none; b=G3/tuAFMRl4+Zo0951Gr/MgXWsu+RnIEDoHnahMZM5NXStRYtL7qcWjntjuGnl2YCDFYNCXNEk2nWIbbvbwYnmNhfAuiPtsV3M7oC0a+2KuZhMtvM0+6B5ovBXoQIGmai4M4Oxy0Xmj/uvBYYvrXcs4LUj2BW+tue7QgPUArIYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816082; c=relaxed/simple;
	bh=2HI/rNUcbLbGa1cz9v9NI7RSNwM41bGzyO/JBQ1dipA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IY+ALu1k2TbsAcZ893afBLDhtgas9PT+wRxPs2TuYF7tzGGy2ihxFa+4IR93qT2gxTjyLyVOGsdziGcEVNL97ZlZvFe9hA1++AcF5ZOJLLmpMa3CTIcCv5f+/xv+wdWFj4tGOYACouJBCBg9olegIzAMqaFjYBcQeTxI57jYn00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4dvGxdK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXXlpJir; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9muGB1604847
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXsyXCX9guvSDj+MZYuaEMLKaY9BIJtmQB2DNEPy7qE=; b=g4dvGxdKCUDuwRyf
	d68fFXMSNDH4zUdnL4R6KKtpIAizTw9J9jrOVoqI27rbRuZFLYJ6eM0ko82fcM4U
	X/CQzh6xWAapvX4xKM0c4tI/YQW+l030/MDU5JQIAI2JqwCdfvdYkCUagSpHCVLG
	nwsnhSh1tPn5PBa6udbLI2QmYBhmRgBxbzgTr9pB8OyLTlGQHvFAzXjF6ydx5uR8
	77PukMECJKJKRP+Xp7D2/cQT6Rj9IlV7WT/JrRdnqSsuTY15FHe79VoHYVeiLaUY
	IGY1OAYpan9a7E7LqPRzD3XLZtYFDsfNGF0EuNkuIsmaBhXi1S5nbT3Zpq70z851
	NcqfTQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfj5vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:41:19 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bdcef50495so956e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782816078; x=1783420878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXsyXCX9guvSDj+MZYuaEMLKaY9BIJtmQB2DNEPy7qE=;
        b=IXXlpJirrpbjJDcMwMajUfiQwDapDcQYsNQTsEiveBK3Id97e1GLaODbnesA2H8hsM
         67nQc6MLkgvfCBeMeZpMboyyolsVge/joVi56aJZPDAkFx7oE+fIMT5LUvAGbMBjaR/D
         0dEAeIno/tqb0Eayc7a6HdPrVumdhWCLlcYOseZqHsjqAY42xaiH9cqkg+nqhhIxpeAq
         nxC3kR+4CwfbN3xXgLzOvlOm/qGupgrFrceMX/ATJnGEqHL/endPqJ8yxFlp8NrJDkG/
         OTWLPSbn48ZJ2CeSODJkV0wc8kaijk4dnZIIPJYhJaWwfbrNoQRRo2cnXf7TDzhPTBLK
         JMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816078; x=1783420878;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXsyXCX9guvSDj+MZYuaEMLKaY9BIJtmQB2DNEPy7qE=;
        b=k8ab6jpJqE0xO/EE72G6oF19EvSNRsrWVOSKb3/GQ1n4cCXv6m73Wy0wx9FyFZLs9X
         pTcvzrIG/28jorRAjDX+QaLHdNwbRMpvytyg8ox6vQOcnhhlXHEt0ZzVA90EFAm3Cnqw
         Qs/3k/IW63KNptGm4O/eMLxrGmg084NQAWY5l1NGJgpZr87FA2jgiEszI7MX0MwEx8WZ
         cDJf5jzfXG9sWLxrMln5cG1jHVrOETYhh+w3HaxVREWvFSOA9ORBgLIgx4cPxRE+H/hF
         TJcGLdFJcyKSAij47egCg5vI7k7sld/JbaocPuKdMJ1Hy82Z+/q8vL4R9V8lytiXMS26
         pPxA==
X-Gm-Message-State: AOJu0Yz7q+7yftOjzukDtSi0T946r6dj3hKC/AFn9r2vy6HJYCQIeKH5
	yS0DZoW3ilWqMkSnDbadva8y+Y4EOhxSG7jxNXYFydlgI+mM3eKOnVsck10fyyOBWAS9+o7ryj8
	MOdoSOWxb+vrDFufLhbkVm9xePyGfiF69qrpYXF9/96GBYqLfjiUo/ebC0H0UkQf8GFwp
X-Gm-Gg: AfdE7cmJ0RDsrloachV3JIyCVKRK6iEJWp/egLUy1SOt7vvbZIXVD34M1ppHv869OcW
	EiRh2279DjTK4GsO/BfkF3okdH/y4/Th6jt4muKT/WwWKpcR2oNzkstuoMgNANpCpKDM/+2Q+OS
	UVyZsz3ZqtZ1nXId+2uMutdDdDdqUD02VJJD1BhRseBr7TCvDbObwBdcQ6USKaDlzLSyeKOcAXq
	eo/xEAyS1OydI8A7H6OOKD7mFnfdGIZDLRwRqJyBaDhCu2h2lhwmBg6IXvrfW4pNKOFA++Id8dp
	Ft85LDbtYqLxKjKioIGIouZiuicFMhDdrhTDA5wEK8XEgPFxo1SVPsV2yvVECQievT06JP6Ueeh
	8+vyQCHfl5/7I562un9ApdVqyGGWqgxI5SYY=
X-Received: by 2002:a05:6122:7cf:b0:5bd:93a2:ae3e with SMTP id 71dfb90a1353d-5bdbedf647dmr506840e0c.3.1782816078114;
        Tue, 30 Jun 2026 03:41:18 -0700 (PDT)
X-Received: by 2002:a05:6122:7cf:b0:5bd:93a2:ae3e with SMTP id 71dfb90a1353d-5bdbedf647dmr506832e0c.3.1782816077747;
        Tue, 30 Jun 2026 03:41:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c950732sm936531a12.22.2026.06.30.03.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:41:16 -0700 (PDT)
Message-ID: <13f7c11a-a1bd-4aa8-a0fd-400abb0d9ff8@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:41:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-qcs8300: Use retention for PCIe power
 domains
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
 <20260629-monza-suspend-v1-1-b601d8a2f2f8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-monza-suspend-v1-1-b601d8a2f2f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4gpRwIe-lB--uiSD3rY1CUavAKnZKTgD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NiBTYWx0ZWRfX0t0g6N/r9W6O
 qyjCCUx2hrskcwACET1oY13SbGpoMOI+rDTOUqbR/0Jxbb5ZfWv7GRIxXdYRzsJs/4mqK2nW7+Q
 U9cyp4UCfgX61R2l3y4ttoV8lIyV60mfEhAEdgqMQExM5AGYqZ9fOsOVowSi6ckPYba6Pxdq8Hk
 qhJTP1N61t2pkcLAFQZ/VAH4VF/iKdBrWprVWDp6ij1VPylOxvxicdoK6HDbI8zzwujvjsmbj6l
 Co6L06jZSqHoS6c3Wzlgh6F7GQAKOFAEyU0d+PNqez66G9m4emmD1+OZ06lnt97N0UYnoArl2SJ
 JfWzSsbN+WZcryZ+pbu3y1zHzNqbZx/99Hm0X70MouLGIzmGksu7faTIs7ffkecRzNfzZTtD7Zy
 lEVeJoujZWbQO6hEoPNHhzaA1KJKDZosClfmcLNPAzjFcDfAJ2Dyh2vqrDcCsWZNasYCozyg+ek
 45Y1SX/KwNFgYkYikVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NiBTYWx0ZWRfXwoaZplM8PnyS
 25nhqnHEXnOe0MLE820zQk+Oa//S3HMsglIK7hLK1EylvBp1KFPLEDlwrNgRhVwL6HaXnp+yJjh
 nwkrYQRH3OhFriKkYwF+upFFp/zcmjI=
X-Proofpoint-GUID: 4gpRwIe-lB--uiSD3rY1CUavAKnZKTgD
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a439d4f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=p4vfNC9F68at6qyTyrMA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115375-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:quic_imrashai@quicinc.com,m:quic_tdas@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA2926E3226

On 6/29/26 9:22 PM, Loic Poulain wrote:
> As the PCIe host controller driver does not yet support dealing with the
> loss of state during suspend, use retention for relevant GDSCs.
> 
> Fix the PCIe link not surviving upon resume, and GDSC error:
>   gcc_pcie_0_gdsc status stuck at 'off'
> 
> Fixes: 95eeb2ffce73 ("clk: qcom: Add support for Global Clock Controller on QCS8300")

"fixes" is stretching it a bit, given the problem lies elsewhere,
but okay..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

