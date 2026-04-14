Return-Path: <linux-arm-msm+bounces-103080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OYuATsH3mlRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:22:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 693623F7D41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EED9630B1878
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA4C3BD224;
	Tue, 14 Apr 2026 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwnvsFfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bLtKD0zW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B383B9608
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158204; cv=none; b=aqbrErIp5rNyumzOTLRE/5orWuN9u4NNK2hcLg+Yw9bRrtGoUI6IomR4J1Hbo0w+DqDotYg1y4X+iu5TiTxitZodazJSAMfOrTYynUIV5xIqcwB0l+UTxjpUb1Uxl9UVCzk9GLBu4sPU1KCouNZAX0lSxRl2vodrlHT4B4x5lwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158204; c=relaxed/simple;
	bh=CyuUOsZG3F1ayuCpTDlkKhEZiIianfiLsgXjXTRWEC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fl6D/j1BCCPny1VoNPivfqhH9RYXn5uO/yPxWpuEntJQi3S7bpi96nvumRZwcoWBBf1/0FdCozM5IxiejMK5TDVAFEPTO2Z/CGUYObI5GbtoEuUZBj4b3LEwlsLCde71pbwZNbWNsfckrczy8bDLSxhgaZDobk1Ieib7IW5uaaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwnvsFfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLtKD0zW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6a0Ag3425472
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AQlsZPfk6eawYKqaJllXe5Qx
	E8W8/7tu0/vCso1y7dU=; b=iwnvsFfpUWv6vjoC5/GuaXncBzcBmXRmpAnkLAJm
	V5LPTJWcVoOo3KcQfDhKbAKIVPHKndW23YVCNn/dCmByhYpsz6PUpVDcjgTy0Dg2
	hC0sC6cmhj3wDu9UtENpfHB8Kjg4W7pbahxowmmIHi/iwEG6i1RVqNOhyrBgqJXy
	2thqq3OFd2trt9gqnMi1z1vUoiJ2CsYxJLZd7JoTEvMyCW94M/bkxTOwub5UBCLt
	l8894BLNLij3DECRWbGlteWUZ6/xC1958f/qpJvtryN1q2J84oJ9VictcAsamLca
	5qb/GHNPCoMLlnjgVN70mlYX+3DP7Y7H3UZPIrZUJZQbSA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87fa1ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:16:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b241be0126so104740725ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776158201; x=1776763001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AQlsZPfk6eawYKqaJllXe5QxE8W8/7tu0/vCso1y7dU=;
        b=bLtKD0zWZka5DgAC/tu8lkO+D2G+VP7QGU9nvOinLmHtMWP/H6x3fX8tgi8qX5ScUb
         crvxnHvUwQhnJsdWsIFbtOC1hlyjmMcLsBEoja24wa6aG+yncvGt1EqpYKJIYnluXGYm
         NHb8M2kS0s2EOYSVS8Y6HYOCvmFuOBbSUxpcCipkMvG5gldl/jioZ0Nq4ENb0shbfKP6
         tA59VJH8pAaxCfnOcAhSO+WGrH9yQngkVLXkxfR8TibyPc01+Fv9fdCbFd+7QGu6x//C
         u/Oc0p4YIt6PwtLf9OgIotwGbgXs/yf9fMqw4HL6zLjNXri9nJ67499FW5c3+zWNDOTD
         luTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158201; x=1776763001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQlsZPfk6eawYKqaJllXe5QxE8W8/7tu0/vCso1y7dU=;
        b=lPPEsGViqJvTXfFs5ddZVPSyosOooe9ZUrcz7uLAzoVsz5SxmIhH1J4yobEMsmg33M
         /YZLkZEUEfRQJ5YqLygdRcYUYk6WDk9CH+mVGnXivXzhB0AjPD+fQhUM0z74lA9s9LvH
         y/HGPfPu99YKsf2s8Uz3tCB2F2M/dqgfcYJVLSvBYRicBiLZG6x/vrT5XmupId7/z0Hd
         xLYjaEqE4VPd+YXMD1Wl+EJHyaqItPBJNiBmxumRIBx/7qpE1CbzUZv5oL9MBRgbxEX1
         7q676AHGXwUHODpPwLd+NoxpROtf7XdFAZ4T1ezR2DN6BVr/sGFIzAupgmSyfEaN6E2l
         jhJA==
X-Forwarded-Encrypted: i=1; AFNElJ8rdfxyVmqNbKJUHWRWFShgSP1LLU+fuJWJH3uCUhJ9lkIiEm5hAPbSGsUWXddDPNOO2OUD1ZAjuJf37YcH@vger.kernel.org
X-Gm-Message-State: AOJu0YxMH1GMp7POH1bKjG81tq6I0R0H4McO73nQtaifgUqRqN/BuLol
	au22fn0k+KL1sbeW1hhVV+Y6whexkavu2g0JlF3PGiA/w/TQSrD5BB02/1nn4AtcHfVSBh6la0V
	iHZ6J+d84y7rM/H8eQz2lxnN4zZhI4V7v9P1H8m9fjnpraqfO6oz89AuPaSIPBG6sGl1a
X-Gm-Gg: AeBDiesG1Bgy60DMIe5/6ifvJi+ymd9YeIIMV4EtrsgfvGliQMN1PfxNX+38V6c9gHZ
	IyjZ73Zhx3sXdj6Rhn1A00gutcW0anp2H0DQy35dc6SQFB5KvUFKo4Fi5bU4UaFfJ7fWnmOpqOa
	NJikm6ajvI95dZhsEf/RBYagbZlLVXIXPvoymoOJ7o/zNUqnaJPIDZAqnMzZ/5dQcF/ccz0ndal
	XpJY+VxD5JeyqLG7HZdZD6B52NfOhXE0HD/CFBJ+7drWUM3MTTcP3Qc3XIvAEwakqedbryAsWoL
	jo+f6uFJE9M9wcilCOBAuEok43hZ0IXIZpgAxpzcBN8Aoxs+T2dwPG9uGuVQ+lroEr6nHJPBFPl
	P298IvW9nqXqiognT+EtfXJiYRqtWp+DyRqBLNAJ9FCXXGmwl
X-Received: by 2002:a17:902:7249:b0:2b2:4cd2:e174 with SMTP id d9443c01a7336-2b2d5aa42d9mr122118485ad.43.1776158201398;
        Tue, 14 Apr 2026 02:16:41 -0700 (PDT)
X-Received: by 2002:a17:902:7249:b0:2b2:4cd2:e174 with SMTP id d9443c01a7336-2b2d5aa42d9mr122118305ad.43.1776158200887;
        Tue, 14 Apr 2026 02:16:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddb742sm145311215ad.27.2026.04.14.02.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:16:40 -0700 (PDT)
Date: Tue, 14 Apr 2026 14:46:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        maulik.shah@oss.qualcomm.com
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 00/35] irqchip/qcom-pdc: Clean up register mapping and DT
 descriptions
Message-ID: <20260414091633.6edoaxktdvw4gj6x@hu-mojha-hyd.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <23c2f6c3-1bcf-4bd3-9fb3-71d6c8d1a4eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23c2f6c3-1bcf-4bd3-9fb3-71d6c8d1a4eb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4NiBTYWx0ZWRfX/yQKHihpjkcX
 6ljfcRISZ6TzqouUBvfyCHOeG1JzkxTdtCtUMatRPxj+Yh78i/mv5fZT6p5zbQyKtSkMeojDY4w
 oEDKOzuiPcWpB2GJhtVETIrL4VkvPQ+KqdGLVYjAbqoINb5BKmhnEpfRGb/uJqgRzRUzfMsx1zo
 aFClfV6hX1sT9yD2rzSADjmsG9uMpVIHR1erdJ42KESHxc5wDCop0XNZDEspacYOiq8TokFBjsI
 WrluXgK6PfNT6493R2MRj+pOyKK5HUKbYnQLwO1sWlcV34s/zYgnm08Sy2RH1AUHmK6SiQ7MG60
 DIEUQmgAW8dq+T2S0CY2hIsQSyf54c8s+RdQGggp5gBqXiO59uxKCwOOwcBAEKtopMXl/QYpT6M
 JApnUskHGNdnV8Agu9/cvXIS2yP8NZuLlVoD8Va7kgsXIf5PdKN3QcSIiCtAIcu6rWwnNetsj/B
 ndEArujoIbGBn4PNabw==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69de05fa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=Lp4zCwS7la8W0ee_oUEA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: 0GdlxP_yUoIXnmpSo2iQuWWEhf19nJEy
X-Proofpoint-ORIG-GUID: 0GdlxP_yUoIXnmpSo2iQuWWEhf19nJEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140086
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103080-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 693623F7D41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 10:27:41AM +0200, Konrad Dybcio wrote:
> On 4/10/26 8:40 PM, Mukesh Ojha wrote:
> > The Qualcomm PDC (Power Domain Controller) hardware exposes multiple DRV
> > (Driver) regions, each 0x10000 bytes in size, where each region serves a
> > specific client in the system . Linux only needs access to the APSS DRV
> > region.
> 
> [...]
> 
> >   arm64: dts: qcom: kaanapali: Drop unused second PDC reg entry
> >   arm64: dts: qcom: lemans: Drop unused second PDC reg entry
> >   arm64: dts: qcom: milos: Drop unused second PDC reg entry
> >   arm64: dts: qcom: monaco: Drop unused second PDC reg entry
> >   arm64: dts: qcom: sc8280xp: Drop unused second PDC reg entry
> >   arm64: dts: qcom: sdx75: Drop unused second PDC reg entry
> >   arm64: dts: qcom: talos: Drop unused second PDC reg entry
> 
> I believe that was intended for this feature:
> 
> https://lore.kernel.org/linux-arm-msm/1568411962-1022-8-git-send-email-ilina@codeaurora.org/
> 
> Is that something that ever turned out useful?

You are right, this patch is being carried in downstream for almost ~7years.

+@Maulik

Do we really have need of this patch by Lina in upstream ?

> 
> Konrad

-- 
-Mukesh Ojha

