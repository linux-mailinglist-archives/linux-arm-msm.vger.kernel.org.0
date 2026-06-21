Return-Path: <linux-arm-msm+bounces-113901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kanBMyDnN2q5VQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:29:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA426AAE69
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:29:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bEAi7yhu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H01v9mvs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113901-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113901-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DBB563001A73
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 13:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC5A3655DE;
	Sun, 21 Jun 2026 13:28:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D9D1E531
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:28:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048539; cv=none; b=kPD7spBDxDqAwZ0PEk9pPccwDtZZfBooCNPgu7xCrXmHsFLclh5dEFP9g+OcckSh7F6wu+yz7vd/F9axLsL/WOfUJ0wF0jBtD1ENOxgUPStjafxbdfJKmVrRsJYW/f27wqnBJPcMKnekWM4FTHGbKkSwpX1Myn79Ipz/3mBoYN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048539; c=relaxed/simple;
	bh=/1gwxImvfbX+kqBJ2oxN0RD9tJRZuIRghmQumNZUES0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MTgjNvrSaF1vwWXGSRD6r07abSjqfRIYImktosAsZ2fM0CIJmSInfPlRF2LE0iNDgN1k1oe3i2Ngzb7UJGY5uuZ/mHMIIE0dgQxR8DrnlDIZKAs3YbdiGmzy2jxWrfarYGpL8RdwVUvsMOR1Ma3ckISMRUTYt0XeQIMZmXQ7spk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bEAi7yhu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H01v9mvs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9uf831514957
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WXxgbr+zoksqo3z7jo/Wh9E0btSV/B3EVlHkOx3aGMk=; b=bEAi7yhuLxyWRDfy
	fmlQRK+XtqEnkLrvKOjKqZsXMKj8f2IAU2o39gzHYPYeZsamlJQ5P2Mc9i1NM/2R
	K8KErIqV6Viy/XBwKtQtDUn1zDUcaAPEl8oZrOKIN76RsiiPlUSlk07eI0yOHn3U
	uiN0d54oezdqaAIahSdRypFh++kmOCIziTxycF6asy4RDLsmYEymGd0vZlZ1seDm
	A5mLHt9m9wdFm7bi7uPItUdd0DBUuuhOIU2/fjeMVsflELBfHjlVyJ755NPDdBao
	1Evn30WjdtTY6z3fMcjEWP/s7fXv8ekMNy4Rl2lYxnU/TkUdJTDJZhhYQ1BcMc2y
	12YyYw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm582xec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:28:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c2a4babe45so22415075ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 06:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048537; x=1782653337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WXxgbr+zoksqo3z7jo/Wh9E0btSV/B3EVlHkOx3aGMk=;
        b=H01v9mvsUfKcuZwkuOzftANW0Kdg9QFCX5uMgLwpj1q7drfjOCduY0hDftx746j5qV
         /YrHAMq5uAy3R38katQS2fuu5Iy8gUHkbdaEYXXNe+YIst9FNSWzURzxVJDrrw/zlyRI
         izckcrGPDDNr9P2hWZRx8l79aYLPO4PSb4qEACn/6ypKwOBrBbQx67GRj+4+n6g6nytx
         bJD0iSYpqT1DfMleL76oGO81Z3HuCPTdaL6Q6g4ch8az/CNQdHE7bVljn+4RrikGtnk8
         Fi20DmBXvSJXUf/EJxFFrO9jZqTz19gv+W+Djrrp4DQqLOFiwn5uIjBgSypn9vvNtABB
         jaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048537; x=1782653337;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXxgbr+zoksqo3z7jo/Wh9E0btSV/B3EVlHkOx3aGMk=;
        b=AqbTaC8N3GLPjg3pJdVIgfnpIzBx5p/kmSaia7+4wlnR+QHvCVFunq5cJcL/oohknQ
         jP0cmED3bh99a3zTdsKxib/ZHRgisqCQm2ag/Z2DC8tGDtyf5jDxbY9aonH7Ty/s6CLu
         Kwb/3/hqoLdcwYEUOqDRGPWCGNFXIg10eS6pKRgL67boe7rg7TSO2eFsRqbVEK53jQAg
         jnXk8CzAg36ezedXNFvcOrRp81Rr7M43T2f1TzbyHl8gUhL3xSnl4fkpNIvewgxTxJEF
         yfn3JnhAXN+CwcaQWXLCowTEwamdf+kDC8omyqhNMcwiilDEyljtRP4xXY5Dzur5ZVFM
         7dOw==
X-Forwarded-Encrypted: i=1; AHgh+RrgkXPwuRRBzmYJE10jHEM2cBd/WZj4w3o5LNTScW6bYTL3zYhypz7NufShN15Uc/vga1QKKS/jE8ILo77n@vger.kernel.org
X-Gm-Message-State: AOJu0YwOmCgynylIoA3WGdLpQfS5xz/2e1SN0gvMXxaRaA8PrHiu4j+s
	00VveBQmwu5LPTcFJxUE9pNyQOSsCpCD5s1/2XueW2fD9b5SGc5fhm12A2iVZQ7Grm/MeeNTFco
	Fn3MLCxDtg8vAQ641s2jGCB16oINKfal0v+60VlJ3TwXRjRTYkNkKmqOlcTxLZNnClEkx
X-Gm-Gg: AfdE7ckunxYHO7a7GtBatCXy2AGmQsCnPPFGvfbqFZYpdFSBolwF1YDZ17HROx2zIFx
	ACgDEmMnVrMn23rV9ZSfpVVM6YsfgaBsr4ZMXahDkW6Gm65KTlNzOUm/+CfQH+pjyt2HUyRkARN
	1NBa1LokEK+9fU9DsqL7X8lwCQWQwgr0ZgnI9kOYReSoqov2PYDMsrPxAORM5A55iOYatDusmF6
	qGBIno8+M+UGp64b2DeoGrpLnaupyRspyjW2phrU8KwjtCp2AGd++YnOheKjcufKNY0IXCSQTIm
	Y3fe/TcWO0TNIMTpM5VeqVa0iu2RcjBMg0Ke43mqKyDBNuZmzs/23zw3/Q+fAuc1S9kCW3UmCLx
	xY69NdV+BizuqKu5ncbAAP6yW6IkmOALFu8Pxs3i5
X-Received: by 2002:a17:903:94d:b0:2c0:aef8:23eb with SMTP id d9443c01a7336-2c719001a1amr130799635ad.25.1782048537198;
        Sun, 21 Jun 2026 06:28:57 -0700 (PDT)
X-Received: by 2002:a17:903:94d:b0:2c0:aef8:23eb with SMTP id d9443c01a7336-2c719001a1amr130799415ad.25.1782048536750;
        Sun, 21 Jun 2026 06:28:56 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8524sm52980105ad.47.2026.06.21.06.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:28:56 -0700 (PDT)
Message-ID: <f6264995-a6f6-498f-9557-723c39becf1a@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 18:58:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/13] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-1-8204f1029311@oss.qualcomm.com>
 <w2y2wz3cbifnko3td3ovxfom26lll3vl5qgulksa7qnuvzukpf@pqlrh23sljsz>
Content-Language: en-US
In-Reply-To: <w2y2wz3cbifnko3td3ovxfom26lll3vl5qgulksa7qnuvzukpf@pqlrh23sljsz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zviIS1tXoyehWvxRjaXta50auPL64_TI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX1toc8uhMVxG8
 USpt/t938sqxlbix0og959/C3cyZxNNBBZeFwg4qOC01BSt9f5XRM6lx1gws2Y8eMZLcq/uFheq
 Jfgp2awtsHhQV2u0v83xtbb/kxpNPRg=
X-Proofpoint-GUID: zviIS1tXoyehWvxRjaXta50auPL64_TI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX4aybBOngmROe
 x4aO1l9gGbYkEXWSV+ihG74m1lcOU4jOhGMg3uwJGqHN7dm0Hs61wzBfr/BwqMfHySeqgPAXXdU
 v1s/vsDf042I/eRRsXzbEhbfIlXB/0rP8Z5yTofbvIHUZrB/aohJaqvZw1U55dQ36ezVPowX5+s
 8tHWtxkeY0ic5foU4QLOS0U3MTp/Z3tPbW72xXQUTXsIOQQkI1n8tZrJwlNXFDINJM9PPPmKzx2
 3i1buRqdM6VUT2ykbKmLTvElQgmPglxPzRvareeuTEt7Yj/Ba+p+qWtJQ5YDOGQ4+eXfK4ssdGb
 CvLBKaBGkLCXnn/biw6BQu4szvlZKrT6kMmgxEvl037itTXn5SI6Uk1Wi2pBFu9E3KjOopRHbxO
 H/BfugtQ9ATio4RPRmGyfF/7+79RHJ2UYmkOQtATMzuDLW2mLBkpy3upRA2D8vDdyyi4tQI4F4T
 aaUAFwmlocQmJhzGPFw==
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a37e719 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1Eoo6ObXIGekxtLEpGMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113901-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAA426AAE69



On 06-06-2026 04:54 pm, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 10:56:07AM +0530, Imran Shaik wrote:
>> Some GCC branch clocks are required to be kept always-on due to the
>> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
>> clocks and use the latest .clk_cbcr convention to keep them enabled from
>> probe.
> 
> You got the feedback, but it got ignored. There is no explanation about
> gcc_gpu_iref_clk and several other clocks becoming always on.
> 

Apologies for the late reply.

I have updated generically that few clocks are required to be kept ON 
due to the hardware requirements. For gcc_gpu_iref_clk clock the 
Power-On-Reset value is default ON, and such clocks are kept ON from 
probe. As Agatti is working functionally, I will keep this clock 
modelling same as before.

And I will update commit text that the GCC video ahb/xo clocks are 
required to be kept ON similar to other camera/disp ahb/xo clocks.

Thanks,
Imran

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gcc-qcm2290.c | 160 +++++------------------------------------
>>   1 file changed, 18 insertions(+), 142 deletions(-)
>>
> 


