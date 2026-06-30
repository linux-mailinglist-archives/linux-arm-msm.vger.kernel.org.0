Return-Path: <linux-arm-msm+bounces-115257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IpaOIpU9Q2otWAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 05:52:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3514C6E0265
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 05:52:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Xmoyhk/p";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H92YZRo2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115257-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115257-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96B3C300C31A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 03:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3073C2B8D;
	Tue, 30 Jun 2026 03:52:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E383749ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:52:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782791569; cv=none; b=fIO4mg0ID2tUSTERDWbv3H0JSLBLF4XA1ggzQbRpluKMGLOUdit9V8ucVuG6ykwRAGeMh5YT0KIo/OAWL5DKrkcTOl0Pkt9nZ+p6DiHEJ9mindUuQhCcT8AhIohSIqSzHlQl5QqmpyjbytSOaOdvs/7GwuJ/qXPxrqUUH2jZIew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782791569; c=relaxed/simple;
	bh=9A4vzldaBfQzALAeqt7vk2jYX8vI4TvP7smGabIAeww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5POu9/o5jrl78mixcRr9VYKSCkERPtBBnpatfYXugQD0GD2jFyWhOK2gM6Uh9kYxc2kl2SHQ9Z75mghIqUNz5xTGVTin2zeIn1CBfRayZ0Ieg4uhDw9eGYCG76vK6drF+598e4SbD3Nfz/qEyH2PV7UWVu7Q4x1DUOwSt3RmXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xmoyhk/p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H92YZRo2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U1ItbT437962
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fb/t38pQXCSWtkuQETEAFyT2Aw8OK9d5iiPSYtvG7iM=; b=Xmoyhk/pujowptKV
	A6PCDoHr0AYQR4eNx7KP2Rre+2mZ2is4k/xZGgOj5+zEGK3FU+itHW4ZuKCdmN/Z
	G5SAQbTSEf2UDJfoQt74/fr9wq/zGEjY8EokD1ALk2uEsyIqZnhL/RWUqAA2NtqO
	naAv8ZnI5WkyjNDU/lzxmLxu8mrZ7xKTL5AQOM4XzAU+Tsuu4XiM0fKWgIwOiPGF
	INhJPv4wivxamyesBlyh5TJCZq87QSh36YjoxpMQhH6oySVHxW94kUXqUKfkW7ho
	QuQn7dJc+llrgezOBXNry0jso5HIVed8BdRIQ4+uT0hfI+nsY/nTlQytN2UGyu9J
	ZQAi3w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qhabnc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:52:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30cb2bcbf7cso3912947eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 20:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782791566; x=1783396366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fb/t38pQXCSWtkuQETEAFyT2Aw8OK9d5iiPSYtvG7iM=;
        b=H92YZRo26QAWlE4mfRjiTMuc3cEu5h4kA3EkHApL3VnIViUxVG72W99TcM1KVh+kPu
         Q4O9Mbc17+scYytu3/7m7yrv98L33nVlXHS8CNCICzFLB9lNTpHs3cIWd9aKY2Rkq+Nd
         cLdvckA9xLEQB1G9yRMhvKeKLn3AtVj58QZZ6dD3SaDr5Jq2tLq9qa1d+LbJkMiFNzBK
         m8twtfqa02nRWXNIdvPfiM78ciQFXMb+OxvMT1SmoaEUvZThbNrbyT/N4XFFfrJU6qbi
         pnNg+LPj+a/Dsq6bM7RAKdOl+nam6vMaM8aVVmWVftjKzbxEbvuHiQs5Wwl3zp68XR/Z
         V+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782791566; x=1783396366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fb/t38pQXCSWtkuQETEAFyT2Aw8OK9d5iiPSYtvG7iM=;
        b=VLxyWN0vT3GLnQnzJHSMb9ocMo1SWjBBHVQHjykuJw0sKlhFJB8T1w4b2CkT17wpgF
         94fiVTHtmnChlqYfSO25Fh9Cxdfoa3etHQkQsD0qsTbvEDZqobZUIqfPqLT1sLa0A2TN
         5JHDeGKyatRwfZOo06LIM3CVOgSU/MKjJ8JkoZa4igRvxrI+c2xsLGqc6LE5HXLvkb3N
         SDezuD+T/VwsX6BkeoEJdpW0KM/MJzOU5kTJeCwVqDwxdph2cfQ2XNOHTKI6CXY7E8UB
         ACad6FoNzDddMtBzSJ6/7u50wVg6Nl3CqWSxb6oVqBxhw1Y8rZwfDx0cK/N8y8AtxL+o
         WDWg==
X-Gm-Message-State: AOJu0YxrT+NG4VdiFcb+Gg24zbsbcGZPoGV2UwvfP58M2zLDRFzHOizH
	knQpxMfO7xlIbn2278MTi04rpx/YawX0odT5j9CyknJfdk+BvmZjwPAKnY9kFpmMdsVB01Hi4Ye
	hxcshAnEqDz3PILD6NCbQBv27/IH1A5qcu6m4dLNp0h9lWrcFhlEim/mWvGrRN6dCBTdH
X-Gm-Gg: AfdE7clqRkX1LAbvuLxyyugztCC57oQQZHqtzvQW02/0C57wz/OJSTUGrTa95nANs1w
	GNYRtpup0RGU/3946HiiYw3PSFYcYIqtKaQGTHlOAZ1b52Di8VZXnKl4ztI6ygHPKyxfHN5Dhhf
	kyOJ21hvI6vyGaWyx8gNhhw3c104tqNwpOGLt220uJaigDZAhIg3pUu3qq6PGt9F9VWlVJ2dRZN
	UGvftPBJT+vYn7RmPHOX57yLVh7Mfviw0pzj6n87LV0kFZEoxyk5/Dw2Hy8ow08O457ZwomkMNA
	+j4RN/iB32ILcHbQLTjHb7m0lX5w8iLlQDNCO+C7HGDam5tnRaftYY9K9UXKZlzurYnJ3b3I5Pl
	2eXcxGoOSOPy3kTvkP1OSBXq1muwfyvYptNGikbWu
X-Received: by 2002:a05:693c:2d94:b0:30c:aeeb:ed5d with SMTP id 5a478bee46e88-30ee1222260mr1462318eec.15.1782791565678;
        Mon, 29 Jun 2026 20:52:45 -0700 (PDT)
X-Received: by 2002:a05:693c:2d94:b0:30c:aeeb:ed5d with SMTP id 5a478bee46e88-30ee1222260mr1462291eec.15.1782791565091;
        Mon, 29 Jun 2026 20:52:45 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3170ee7sm2760100eec.14.2026.06.29.20.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 20:52:44 -0700 (PDT)
Message-ID: <03b6afe0-937b-42ac-80f5-a1cbce0ed341@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 09:22:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-3-4d8e1504ea75@oss.qualcomm.com>
 <5e59c3a3-b492-40f0-9db1-5ef9f95d77b6@packett.cool>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <5e59c3a3-b492-40f0-9db1-5ef9f95d77b6@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kmkH2v3SCh5-3m11T6F5FIUx_gUP6cmo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAzMCBTYWx0ZWRfXxxxjD14Z8ITM
 HZaZ+IFknFOA6C412+2kx2lzbtWAHnkM/1YbDlWD/dmdnw0Zz3PHfjTBb45O28DoJ/a8VdrQHoD
 OPZJoL4SkaR9wSfoYCtn2NqFKyyUTDxowcwwZ5gZTZEvsUChmhTO5cTNq8yhJBCB88hq+Q0s3+e
 Rj/OHY4zF+nAs9DAJfZ6lmLD/JhcjiYQOwRBMtDSNNL1UeP7XrINGR9CeoTXA77+SUg2XUuLnqO
 MX1v9LfxuGuIVB92R5vSh5tSK6Ze/uMMJqjlfmriWOZ3YkBxRe0fXVI7ae6h1llW5KkoPzOIGVt
 qE/ZX6HDftPnxUx2BXPo5eKMXv4La0C5Ozin/Ip+lh5UCF2ajwGuUWJvDxep+sK0+fNKAH0482a
 2N4Feq9wSIzGTxEw9RPLxfuUPWheLx3C/b3U/TZPJgWumhsKpA44/nSpr3iNo9OFRbn3VpTfC07
 x02Kfw8WYnFwjlY2rCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAzMCBTYWx0ZWRfX5ylFjHCpWYdr
 NixoyOpvQplmhQuOZg1ESHaQZyiWo1NkTzs/ELCMUyB1Z6avssuc0GBsYad2p5Gnh17tZCeGPiY
 uhasyzgJ801pj4gh+4lRhs5Z7a63Oog=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a433d8e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=TBjd-TfOdEHq2yxd1H0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: kmkH2v3SCh5-3m11T6F5FIUx_gUP6cmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300030
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115257-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3514C6E0265



On 6/28/2026 11:24 PM, Val Packett wrote:
> 
> On 6/16/26 6:25 AM, Maulik Shah wrote:

[...]

> whoops..
> 
> [    0.197090] BUG: spinlock bad magic on CPU#7, swapper/0/1
> [    0.197104]  lock: 0xffff0001022e37b0, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
> [    0.197122] CPU: 7 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0-next-20260626-uwu+ #128 PREEMPT(full)
> [    0.197129] Hardware name: motorola Motorola Edge 30 (Tianma)/Motorola Edge 30 (Tianma), BIOS 2026.07-rc2-g432bcf301c03-dirty 07/01/2026
> [    0.197133] Call trace:
> [    0.197135]  show_stack+0x24/0x38 (C)
> [    0.197148]  __dump_stack+0x28/0x38
> [    0.197156]  dump_stack_lvl+0x7c/0xa8
> [    0.197165]  dump_stack+0x18/0x30
> [    0.197172]  spin_dump+0x7c/0x98
> [    0.197179]  do_raw_spin_lock+0xa4/0x140
> [    0.197189]  _raw_spin_lock+0x2c/0x40
> [    0.197195]  pdc_enable_intr_bank+0x40/0x128
> [    0.197201]  qcom_pdc_probe+0x3bc/0x520
> 
> Gotta also move the spinlock init to before the call to pdc_setup_pin_mapping..

Yes, Moving spinlock will be added in v4 of series.

Thanks,
Maulik

