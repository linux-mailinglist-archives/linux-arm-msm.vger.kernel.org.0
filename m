Return-Path: <linux-arm-msm+bounces-96815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF+GOy7WsGnLngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:40:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FC325B082
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48C533034B05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98033290CB;
	Wed, 11 Mar 2026 02:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8uvxFl6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpw1kE3m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA49A346A0A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196828; cv=none; b=KXXGw8+AokD4IEoIBJaEUoVgmBZfXorZJsJgq9j2J3NjQ+cvLnFrsWggZ4bQv9FxGLzgpjCpIM1XgqBl7yyTXMXvyqEMpXjHJurcenLSm++x5xokLqQ83QzqKAHUq50hEpnqjSo9gaOh/nji6QV0Wr+CyZ9OhKBkbYYLaIE5ITo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196828; c=relaxed/simple;
	bh=ALKIhyzyR2P7aRhrGL/fGQa/Y3A2stwwFfrTkzVYohc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFtKvKBmPcPBNm19sBplCCEoBCCIDHKncysK5HJo8LRQ+gKOv2GZVEZDgTzpmMvU38390MG9tSjTVBikysRz3t4E1IgYWUhIVTE/0lCJc5H7BPUocFKvioLG4bGYiaU2TaTgl8K0QNzN/XX7EolkTlaj/QcPfkwwyfSx8ySYRQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8uvxFl6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpw1kE3m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHcoEL2179278
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7IFtWnEo3egCtAamMSi471pR
	KF2Zqxlfyhr7ZeOZFt4=; b=Y8uvxFl6jU/l51N+a3CUg2MaQ3/Y7Rrzv4PIoiwW
	9WLJfAO5km6zp+CN+MToY85iIfQpeWPRvIoNyCyOaQzy9IhUwPFGMt2GFV6pFCfS
	lvHcp/XvDjR0lu5sbEzOMFuh2u71AFxIPqxJHoBxTrPm4NbkpJO7pDNKQCrcqouO
	7HkyqEvsrAzxK+NEWheh4PfdPOwZw1W27A4Ts4p+vh7Z2OLReTmVJ7W+zoP+NxPs
	o5Ja0XfhYyBgVcxQ0n8r5BNEMNCziFMqL9jw4oQXVKNYrMGNCoYnkSk03+i2ZT9M
	dCEHxSOL+TCGEmNBAlSKXvpBYaKMrFzsxvnY8u4rHKqfOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvssj7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:40:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7d66afceso2042172985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 19:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773196825; x=1773801625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7IFtWnEo3egCtAamMSi471pRKF2Zqxlfyhr7ZeOZFt4=;
        b=jpw1kE3mb1RECVccyvDxhTMDI/gTaatHSXBFYPpEC2IkmgCRK4NZu2M0osjQ3vqD/B
         RCUq8tCZHLqaBDFd6Xy38399y4Slff4MyfMDPqGX23/RPz8DqTuaTO+0tnXTd68ZUj6u
         VSvDwd4kTkjg6sCKdF/alaspMsdcH9aaL5zmYTC5Z64NlxO1w5BC02GoW8u49dabtucM
         Wtg1c7FgMJirwn1rSl0PS3Zy3eP8e2Fv4u1M4n87hbt0685OEUwtfHQTtYvye06rfIoj
         UyRfqbAxiolXPwdwD9jf3rZJwk1rUSVmCBuo/agG7jBBkC4++P6rSnUSsA89cjjViXOk
         d6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773196825; x=1773801625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IFtWnEo3egCtAamMSi471pRKF2Zqxlfyhr7ZeOZFt4=;
        b=FS8eH+QhMBrGeKR3FPbA4LgUq5rswT21oMYApeWXvtw6XkIK7MZEmag6oYpqAcEPif
         Ifl3emi1+8dCQsjpMB75LbueP7LRoNthh5J/inMZOCJqbwRnjZSXI/RmHmelI6NtmWvX
         IeY3yr3gAMZCWclfobJLVVaPtmNU02qme/9erNrrs4nqMet+e9jZsEmCIlbeIFxvf7B4
         F5IgY0+KhRHF55aKb5vwCr/zdpYbqMDofJqmBu38FalopIB1JTkJyT3mCO0eCPHrbApr
         ZAUo4sAfJyFvyIguBnDO/oIiwutpYs4nC5pVMc+6Wt6Lmsxe1hmIiK/OqhMJurgwCr2o
         RWzA==
X-Forwarded-Encrypted: i=1; AJvYcCXtMsh1nXOziBxhVmO7Tq5NM6FIOVySJOXBUBw57CH3A0ImkMb3+owTN6OX22K+830mCKCFJFmMEHnLMD30@vger.kernel.org
X-Gm-Message-State: AOJu0YxGlgoRu90pMSnnleBwEdH5Q3SxpAoUTPzE4dWDRh/zMNpkwWku
	1Sus8rzVT5vkiewEYx1Oc/PuY8/V8uOCIa93pzvOO1kDJDRyN4tbbmP4/pKfmprhXT7avZmPKMr
	VmjvAJU7n7pNNK1G5do5McEn/n38syznUk8qOqqxUr2UrsOCU6aBlOBdxgvkr7znk0QXW
X-Gm-Gg: ATEYQzy439Mpvc8c+ABqJX67QWI2eYMAPZUjjC1UoS6SXCpT85hZbris5C9LK1hKjyJ
	+H4+EjWHy+015NOZ71HAW45M0J+IaC3LCUaUrjB0VLRpTZYMPNR/LBT/AeDwclfOSYDYecoZA75
	RFgUaDleU9+aq7q4nn+O2V8rnszCPz3n/sA+C8xYaBbWXrCf/5svhXQs4aYfXW8W+6gklVQFdqV
	bWE7SnjPbJSjqpZfmrV6X1mzoh8xIDUac1PJoCJVVPLpdwP2zycsuEYt+RSYRVcD4mRTDHiJvyl
	w2yH38uAG38uHdFHFCwEWaPW/17JYszsy7+yS3nioGRe7nRjp0lfdfu1V3Ek08XkU3dpyxHKVGV
	dRnMX/vuXBTROe/OuymKZxX4BDy8VzoTFVu+SKs+agehYlIAPxi4LVC0sBbZm30pW4hsC/ccpxV
	AqCcY+V6z2PFPbeHwHLhN4YqY1LyqY7elwqNE=
X-Received: by 2002:a05:620a:1923:b0:8cd:8380:d8e1 with SMTP id af79cd13be357-8cda193ea52mr140165885a.8.1773196825115;
        Tue, 10 Mar 2026 19:40:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1923:b0:8cd:8380:d8e1 with SMTP id af79cd13be357-8cda193ea52mr140163885a.8.1773196824637;
        Tue, 10 Mar 2026 19:40:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e60csm160185e87.33.2026.03.10.19.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:40:23 -0700 (PDT)
Date: Wed, 11 Mar 2026 04:40:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine:
 disable wcn6750 and wpss
Message-ID: <zutya6ebksaqkpjen4qb62kit4lgannbfbvvfie3bpzbf5cgfi@v5xbzjuf3tyy>
References: <20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyMSBTYWx0ZWRfX+df8ZwNNvlnq
 JfcJs/wt3yZz0XcmkIQ97J87RAdSkg2CAfpcs3t6iLBzM/BTpHWg+3n05ZznWW19CvZhrQNVT/e
 k2hs8oDHDVRbwJJRTEdT0p5N5gG21/JGOphWo+y9L7qE9NBsTWpV7tTqERdkO5HfQIwpemioEdC
 9bewQPo4iQY7lV2kNusi0/iETSYNZXJzwJl+Ju4wRG8azFLLUm6uwrJtS6hVfCz3kDtceAptzHE
 O0g0HautBq5BICDEHCf9qxDtV/suT9oQN7VEUpZM8EPY73XRd54UuBbIhsLRdHxS1hYPED1YT36
 l6Rx6ssNmYAPG0K1oJiseUZkl2wxLYSJy428yn4Q2J1SH+ISv62DQRics5kNy5/gtNOt+rjQkrQ
 WJO9SMpDZR3p4t6/asiu6+we4pgzN7Nkc/5RfCMTUUgZ71X+6LVsCKq7FdhrvX7MrOTM/fuDtOe
 XICpUDPVqi4S29E64FQ==
X-Proofpoint-ORIG-GUID: MV7nmX_oxOd794ezkpI-2SK8qRiyJq2P
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b0d619 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=OSSaywwjf6zdp-3i244A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: MV7nmX_oxOd794ezkpI-2SK8qRiyJq2P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110021
X-Rspamd-Queue-Id: 91FC325B082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96815-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 10:32:19AM +0800, Hangtian Zhu wrote:
> From: Hangtian Zhu <hangtian@oss.qualcomm.com>
> 
> Disable wcn6750 and wpss on industrial mezzanine. On rb3gen2 industrial

RB3 Gen2, WCN6750, WPSS, etc.

> mezzanine platform, pcie0 lines are moved from wcn6750 to qps615 pcie
> bridge. Hence disable wpss and wcn6750 nodes for industrial mezzanine
> platform.

Are they rerouted on the mezzanine or should the user toggle a DIP
switch somewhere?

> 
> Depends-on: [PATCH v4 1/2] arm64: dts: qcom:
> qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
> Depends-on: [PATCH v4 2/2] arm64: dts: qcom:
> qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node
> for PCIe1

ENOSUCH tag, please learn to use b4 or git-send-email to define
dependencies.

> 
> Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
> ---
>  .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

-- 
With best wishes
Dmitry

