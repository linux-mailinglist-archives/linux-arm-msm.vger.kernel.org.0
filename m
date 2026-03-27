Return-Path: <linux-arm-msm+bounces-100469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLUvOSfrxmloQAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:40:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BA334B20E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E93A30B4DBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000D638C43E;
	Fri, 27 Mar 2026 20:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LaJGQxb8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0reVqGC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822EE37F73A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643758; cv=none; b=j5iIU8jHXk6zFJUEVA0OaLad9vmwXBbqmFCwFRJY5fgI3QW+B+5tFAWFGRCX0BZshoWM7x1XMAU9ukuS54Q9f8dkjw4YnPpmDEcangIVuLpnh12Y8vXSsVuBxbZFxTLVF2I6VoMXF1ymenTMIg8iEtUAjHQK+msvSnffUDCw5gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643758; c=relaxed/simple;
	bh=da90JW4sgTJrBt5zyplbOUxv2GSn/957efQJW5/vBVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiA/av//z6+cJ40on7anT53UGdPVeGVHZFwWvhs9c03jY3IInq4RLry7zUcmTIIu+buj2NniuEekRy1/Ld7+BWyvAcIyIfdz9YoefH1pUHjl4H02h4snw3HsSd8eMxWM0SZRwF1OGUXjufQUy0agGmAZ6n2TkEgSMso9CWYD7Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LaJGQxb8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C0reVqGC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2bi63659035
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNV01vD0V3ksspIAVQk7842j5z/hrGjFE28fF4qUPxo=; b=LaJGQxb8XRA8vQpL
	+n3cWnY5Toaxjpi2hdGe6oD8ptpe09lx86GXtqAo9Zd64BpbWEzteO7SQuU258Yt
	Ykr4JQ4OCk8DY0GMHtHz2yW6hQf0hEYIUyFyegfTNNXt9I336ZX/rPJgCJz1Ft3N
	sZu4VRAOJgDWNS2WsfFzw0zuol3FythKGZtmDBXelraMRODJEwSIcWYe7bIb2tbb
	x90juQJtaXEqBQ2ni/4efgWwPFFA0x8x0QeoRzA6CfArmRYx6xN6HumzkqWKaXBr
	quRDIfxtJE0umSfm/+UMFziSfQktk0nGhRqqvyBmn3LKLEfYMW9yJNcR7q4e2vi+
	2QLeBA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn12vt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:35:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so19184331cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774643756; x=1775248556; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNV01vD0V3ksspIAVQk7842j5z/hrGjFE28fF4qUPxo=;
        b=C0reVqGCUC/vG70n8TAU9V7hvxImp/1pXkxn2AaZnPIMPfkdeqczLeDTd3z6RNHQWm
         xqDF2BtDOc32plTlxevR7hoAlbcyyxjcJuA4hsiQvcNFRypxIJCdWkfQp+1RAK9x87n5
         zfOtSkt3zqWBm1Fn/p+WcjTrvfOy8EFWIg0CU4DWXpl+kIzoujgVU6igZ0w+WB7XZbAM
         c+C+r+EiDR6+LIYo9Ob7LkxtVflyIrL3500AEHP1Y5UZuGOQVduLUqAzfyNQs/BMwOkX
         LvMCsBjXRK2gTnhX7dvwJQxUwxns1lqv6K6dETeIouaZPIcoZMHxnudoM80xgs1B8vIB
         hnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774643756; x=1775248556;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNV01vD0V3ksspIAVQk7842j5z/hrGjFE28fF4qUPxo=;
        b=qSI4fGddru718geRWN14zHfKnqzkxuXTnffczFkzBvUgjouAp/eTm9J6a8fb3SIETG
         tYsnm5ymrvs2wwuw4M6Pxekk/VO6BUNL49HQig5FUfl8OxJ/jPUHYbhnxUMmhKsS0xyH
         loiPuchpNCoBzNA4jTE1ogO12d4b3B8YV/LSUz15wpu9brFaD1r1xFhNfbBXJP2ys8/b
         u/3A8ERKqqVXXHiSFeKtaJjEyPJzL585N0p615zxpGQGKBaI5qCAAWTBpcGHnTdPsk6z
         YF+/hUCnUe8Hlv4HuVq+5jOwHJNQsp+8u8cQ7GsyRFep1J0g2V5UfjGj4zSz9emz9TXH
         L2fg==
X-Forwarded-Encrypted: i=1; AJvYcCWZy4BdVLj+uHoK/d7m127LWqAWLKpJYgzT5AhDXO2JXqHvhsSE09lzvYFq/CPBb64N3TQhJgmA7Sk8Oa2x@vger.kernel.org
X-Gm-Message-State: AOJu0YwHg+zSepQJrI4eJ/9zRpOkdPhmsVxsAIJtl7YHRC1mOwvj1rnW
	LlCRDTbbpgLHOSIWYqiZ8X95HJxVsfBhfM+6mEECJG9f4rn7pde80+tSHc2Bc+H/2ADyuBFXfDm
	jSxXDBnrbb4BVlnlCUo/s+cbt9vJfgPD50qcnDASWQaENjC519Eo9m8+PiaBliiMTxxYe
X-Gm-Gg: ATEYQzxSjK/NwnYnqcn9Rebcatvdr0LuXXTAv2npuelPgXl2Q/iqpP2bHOEtDQdha+j
	swYZ2GRu4SUSsdYXiftc5O3JbTt3pgY4CVC3LaecULZTfQqL3hSSsk+7bm7wV0oaeh7jXi6GSPQ
	y3uXONkD04vAB2KK/jJCXPMWzUAiwkQ4+rTXiBXqgKwP5EPymufRhGHTXb3mXh8MxL+Lv9sIsbi
	Lh0+fkr+/9qPYcBCAEbEB0esnP3F4HZLQlE6Z8XyNNlArBBSvVd+FlQXtjXI/FgYSN20fCxVv9s
	NyPb5k6Ev4x398tE3wT1x5x3NlaBaV1BOYQN/oos0EmSNiT17O4BwiiCoH3Pk3MF6V6MdpyVF9v
	L71+xwjwplesbdRPkuspbPEb0pGj5eloS587Pe9EkIcjPGkskbaUhtwWGQoww6VWjYOptsXR6t1
	hkcj7lxclI6Eq+FdQW8GZIcxdPuGNVZK2+UcE=
X-Received: by 2002:a05:622a:295:b0:50b:22c2:d7ec with SMTP id d75a77b69052e-50ba398f23fmr51862381cf.59.1774643755765;
        Fri, 27 Mar 2026 13:35:55 -0700 (PDT)
X-Received: by 2002:a05:622a:295:b0:50b:22c2:d7ec with SMTP id d75a77b69052e-50ba398f23fmr51862021cf.59.1774643755311;
        Fri, 27 Mar 2026 13:35:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389202asm560111fa.24.2026.03.27.13.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:35:52 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:35:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: qcom: msm8953: fix modem pm domains
Message-ID: <i6lymgal5c62ud3aas3qvzv6fjnjrzuncguwechraahmflr45l@5t5qli3k7npu>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-4-6098dc997d66@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-sdm632-rpmpd-v1-4-6098dc997d66@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0NCBTYWx0ZWRfX7XHRDPD43jyt
 mcTUhhwV5RDU1SNYwwnn6RsG6iOSrOnlnzx3FvXIxYVSsciUwRapR6DHG2TiDjdPcnBJYtDqK+J
 QDLKs1+8B8ccCHwGklFvqrHEWR0uvscULPppZ7AZvuNvR68X19a8in/Qxbuyavzm8XpSwfkxowX
 JMvc1UmkGHUG3SKhYtQNsT648xNqRLz2BhHEfD+gYDa/b4n+t8JW41wcpyyXICOz0YL1TinoZm3
 qfAYpEAgKHOOoAksykjB3dXc7oF/paDvgEpesgoHOm+Zof9RxXdhqFawZbL4PJbHJTeIaZ6LS3J
 Qi6qH45DqJrItZdXGKxXMTNSOS5LKkRCjyLMBQz/3FTugmhD1GCKITcXutk7M5N+j81wlR9hddc
 3peJf+X7ye3G6a0hlp+d+94r8Z++KqWFiqf6l0Y0vFCF6rWWZmqhlCwiE3bvKx1EgBmRoNYWaIs
 Ime7SYhVmcZ9LkxN4rw==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c6ea2c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=OuZLqq7tAAAA:8
 a=4EqJN26lZN6HTI8qya0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: bjGoEApvyQKeb6Cw8ByiLf5A5_apa6Iu
X-Proofpoint-GUID: bjGoEApvyQKeb6Cw8ByiLf5A5_apa6Iu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270144
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100469-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64BA334B20E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:11:46PM +0100, Barnabás Czémán wrote:
> MSM8953 MSS is using mss-supply as regulator.

"On MSM8953 MSS regulators is controlled using the voltages rather than
performance levels. Correct DT definition and model the MSS as a
regulator rather than a power domain".

Also please squash with the changes actually making use of the
regulator.

> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

