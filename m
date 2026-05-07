Return-Path: <linux-arm-msm+bounces-106234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMwcFnMd/GnHLgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:04:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E93214E2FEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EFE53011869
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 05:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF1C3246E8;
	Thu,  7 May 2026 05:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LO7AI3SB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvq9RCeK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01123148AE
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 05:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778130262; cv=none; b=Emsr82bH7tPe5J6JxbkVvpI+3RoM+m8vwBEQ9UwzZ2UWBx8huv4R8fJsJIb5+pKI2dRvZ+YH6Zc6JmebrxP5D2suZtyM4Tfbf6o0JqyZT9MNR2emSlH0wevufNJz1QqTVKf4Xe7SFIwH7mdAI4qyhGmxtS2mBuEVpk8/UCcNBb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778130262; c=relaxed/simple;
	bh=hgqjW8KfkqTcrWolB9guuKyPRLtFQrE2y7JWIKYzEvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BM22qiAdO7YQXUGqNofg28dvJTHyZRbtnH65l3c3ywsfmzh0UvBM7c1pfkC9qyN5T0kJ2NScB5h3K79DMeE0e4HGxliKzlkCZG45nXDAbIwxqYP07Hlwj2rM/IScYJ2r4+KCIQVsxdpgkPVDhhGZnMLL2FdtgiZ7DZUyI5SBrts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LO7AI3SB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvq9RCeK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646K7k6H3036592
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 05:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=udpIyFeLuuX33ymGmzPtSW/W
	6I5xBEaw/yKDVf5r3nM=; b=LO7AI3SBaYnt4ROPEdpYdRP8zwPlm/jqsw3QVPs2
	N2BFAHROpPN7i+v+QhuTpWO0uzfzEU0SSjkHITB047Eak/tvPxrEIdcGARAEyaDh
	yUL+w25b34apgLNyaHZUS3wOqHTwgfsP+IYJHT8ZcRAlDeU+vCZl5/YhlNnl8gEg
	7YH81a5IHJF7EOUoQsJZp38AlkRf6LN4plyXG2yU3TpN1thKeUlBsIj5APdx/RJf
	u4jw4s6G5Tw/Vx3zOvAIdpKaSbwEK4dNWuQsNP3fRq04EKRT8S03bCGHV49TuNGj
	xPukBWGxaC42wtX1PJ65PYJj/ypzP/AjGEth+pc65kehyw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf37mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 05:04:20 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c8ccc7593so1140421c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 22:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778130260; x=1778735060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=udpIyFeLuuX33ymGmzPtSW/W6I5xBEaw/yKDVf5r3nM=;
        b=fvq9RCeK08knLh7kGgpAykGhZyWJbo/q6gxLAxcCQEFGqk9QWbiXR53dpO2DbdehBY
         6ucRUeEMp2t3TxiRfwh9egqQS4tn95GlkQZSQOwrRMN+8pY8oIO3oMR4nHgQuEzQBifS
         KcglmTxMUzPW9b3Je6Nvh+JTGuM8wHk28ca3cIeFKWy61no/SqLBPTHGyXjGXzz1QD6I
         C4ZLENubboqfcTt1zFZeW21Yf4lY41tKQtOptjeIBsqhTkSLwiZ/XFyGEJ88lPneX5tU
         DbfvaeVVn3nMjuUkBpe6Zf8yIQTT3qpI7QzT+4shsXQDp66J2IGUZmDzB9Q3zM0Ixcg2
         aLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778130260; x=1778735060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udpIyFeLuuX33ymGmzPtSW/W6I5xBEaw/yKDVf5r3nM=;
        b=JKiZZLvWl6ETdzGihKRDbaP4yI74pYfQPiq1Ri2FzfgotihmuV4cG+OBj/hfrwZIb5
         txRc6Sb2yZmdL7o+OXcPVTm94wsZ2w58JcRQ3FhbNj/x+TbBooSD7u9GKKHpzuPj5kiY
         3XhQ0j9T/KEYWXuJDEL/FT0x6XF92cNMHIpkMYiFw2yJYcdWwOEBAKO6DwBFA+Fze+0C
         XycYFkVuGg6EF1em31QDHDmglCN1xXKLSo35lKq+kzYOWj/KjpSkWdcQf1n8Ee90W1ur
         ZrhMcu3QIAVXtudlozivgmVnhoNMKOKMAQFX4O/8aeeft/9zqHMnuHcA9HDk9fBOOhGg
         GFxw==
X-Forwarded-Encrypted: i=1; AFNElJ+aJvbazHjIGTEKQMF+qiOR3L4JVDDJ72PoVx1WTNuCjbNXkFSQK5GlOqaEFxCVZLBInN0kuYXRpIVAx62l@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7PQ0fWu5QT7yImUbLUFXnOkO4p4BVpKtdiq2/zPy8a1uQQ5o6
	pEcEUFV4mO8aE0kGGnm+mqG8X9smevvVeGKpIF1dGzo2AvbFedHClE7ZGTwHXLLed5oeA2Lozjp
	i7l/VvRT0lYGSRbdHHzAJf/f9ez2Sap7mQ1wT0Ez9hbcUHvytATqg+uGqsT456f9xFMtW
X-Gm-Gg: AeBDietcjIU2JLEXoDGbwNR74g9EgmsmNuLNldAt6L14VFFJ/wf1lj5YgRG+tLpBw8X
	eZtf2oB3EbcsgCzBX4hh4azcESx0WYD6DHOBPnvcAPFT796bngKPab4Zj5DYM2A6mReZTzoAH0V
	NSg+eU8UyMtbsqpQVujHBzTEfrJPDTIKUUX/H1fbVVqWf5VUgu3xNjEM1vWC5RZxRHHLQj51rTq
	5YAuNZu8yTq4HTJMad5Upoz9v396J2QTrD/ThFq7Y68i4jsfb+hlplMVSHARk66gEDfJuyYTWNY
	iPZ0daP20U1FEESuTKBnfYqobsIWsLbMoGHNmjk8VDcnFXay8lavDGupu7VjFoRAiBS8AFSxzGM
	M7moV1ygJO/hVeP7ij2eww4ewV3S2dQePFlnmQeJZe0Efmb0ePelaFH/uA36swPCOOyaRW3g9UL
	M=
X-Received: by 2002:a05:7022:f005:b0:12d:e539:98e0 with SMTP id a92af1059eb24-131963a0fa4mr3238555c88.39.1778130259248;
        Wed, 06 May 2026 22:04:19 -0700 (PDT)
X-Received: by 2002:a05:7022:f005:b0:12d:e539:98e0 with SMTP id a92af1059eb24-131963a0fa4mr3238544c88.39.1778130258627;
        Wed, 06 May 2026 22:04:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec592asm7142762eec.5.2026.05.06.22.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:04:18 -0700 (PDT)
Date: Thu, 7 May 2026 13:04:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <afwdS5euY8bxxA16@QCOM-aGQu4IUr3Y>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
 <adm37MruBfXAjLpZ@baldur>
 <7bd01424-e611-449f-b5e0-7c823ad3b978@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bd01424-e611-449f-b5e0-7c823ad3b978@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA0NiBTYWx0ZWRfXwL26rPGYBryu
 hIRnZVj+tNg2K55JC0qU6mxa19qLRoHPHbn95T50VRTWUFlQEC5cTCN0iu4Is1u0qg3uRKxAywF
 SGV0o+pBpYRlFnNyXQBlOwJKSUN1JpTQ2j1aj9j1Hw0SzpcPHKMD52ox6xMLBEHkbblb13gVPoD
 TghqmlmUAj0oXJhmtjVMSfRgPAVVjJKy5fBrG1isQOoNMUmHgR9gfnZ8zZ4ZNl4gEgKHDDjwwm7
 Jp78barkH3rgB9Z0zR2Qm2ASEsPuHyENSIU4IHX3i2oTNv9HY+QBUNjXsnb2rsFsjYESt05smth
 Fd4c6HOkRBw7EOBXy2LapehnQRPFzoxqgy97dfCh9yGPr+Su4QQUAp9eEB26AyjfKae0BPsbRX5
 YxiLahfkj6dFtnQQkCH5DVaaNt+PlVOCXr/vI8e8uVp/FZg2xSEhYK8fjlef9iX33kEuNXPfFSE
 3oZEezjT7I3z0ZuKKLQ==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fc1d54 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=DzB75-1vIS7bBwd3HdEA:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 3rYWQk7AhmInAnDg8XgsXy9Vk8ZV4mdP
X-Proofpoint-ORIG-GUID: 3rYWQk7AhmInAnDg8XgsXy9Vk8ZV4mdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070046
X-Rspamd-Queue-Id: E93214E2FEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106234-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Apr 14, 2026 at 12:56:11PM +0800, Jingyi Wang wrote:
> 
> 
> On 4/11/2026 10:59 AM, Bjorn Andersson wrote:
> > On Thu, Apr 09, 2026 at 01:52:27AM -0700, Jingyi Wang wrote:
> > > Subsystems can be brought out of reset by entities such as bootloaders.
> > > As the irq enablement could be later than subsystem bring up, the state
> > > of subsystem should be checked by reading SMP2P bits and performing ping
> > > test.
> > > 
> 
> Hi Bjorn,
> 
> > 
> > I still don't understand.
> > 
> > Are you saying that devm_request_threaded_irq() will succeed and then
> > calling irq_get_irqchip_state() will not work? Or are you saying that
> > SMP2P driver isn't reliable and we're loosing the ready or fatal bits?
> > 
> 
> This says the ready state is getting from irq_get_irqchip_state()
> instead of q6v5_ready_interrupt(like what rproc start do)

Hi Jingyi,

I guess Bjorn is questioning "performing ping test" part. Is that really
required?

I'm testing this patch with Nord ADSP which is brought up by bootloader.
I have to remove the ping test to get the ADSP attached, as it appears
that Nord ADSP doesn't support pong. Are we good to just check ready bit
for telling whether a subsystem/dsp is already running and remoteproc
should attach to instead of powering up it?

May I ask you to copy me on the new posting of the series? I would like
to make sure it works for Nord ADSP as well. Thanks!

Shawn

