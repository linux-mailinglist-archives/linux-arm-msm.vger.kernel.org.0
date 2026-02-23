Return-Path: <linux-arm-msm+bounces-93736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEqKHHN+nGm6IQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:21:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 126F41799F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 595763001023
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDFB30C366;
	Mon, 23 Feb 2026 16:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAUmDwYl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QyxcgYpP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2F12FFF8B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771863665; cv=none; b=D4t716mqVB4RrelVBPCiPVp45snSlfGDiyaywMn2SEm5ecYZBEkRQiI+Ib/4JnRFl/c4jTrKV2dTQK9dKHTIt9XL2KPRY6kTs4d6m/mDv+zoVj79K8FIhqdSq6YazqZGFpqt6FEg6JlLrM2judHtKjvesvbdj84l0n97kd6N29w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771863665; c=relaxed/simple;
	bh=9XMww8y1cQhJYxDduGYdr8t8Ddjp20hYAB5EvGOs0Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQpwdZY71Kct5XS+2tsCyNG0oRL66YMsIAf9t7XSEZLzy+oHeBKRdgjk4SoBWtvrpdl8GqQ5LX3bbxqsoZQgyMtBqNjU217MQ3nVCm7BhyEdCjzjNaxt2OJvIy7Q+1fAq1TfSxBRXHB5YWpm4l2v4LJ6ppE9XPywNjEkFsmL5xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAUmDwYl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QyxcgYpP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYI1H561407
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 16:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xhVObjuoujdJeMjV3kqUuIrH
	fXuJ62UYDpmgw9/nppg=; b=JAUmDwYl3JuHlvGDb8ItAtK7tNmMBHv+HsgaOppy
	cWefqitW2Z0HJSJ97rTqyrQHlpNPRsISzIDfkoZR3Ck8MdWOKbJjt+wOfV9jKDfA
	DvJacs2bgcqyjBerf5ziTtWP7x93eMNnH6WirtKcB1+U8oocgatfSg6Hx1IFjclN
	reMSwjRRHB5GiazpcoJcfl/KcrOURAqXUVoIMW/rN+VoCCTqRKIoNb1QRApo9p34
	3VY6T3xjgnZ03z/l0COsYTxY9l0HuKj1KuY4V5ZPWEQU9T9Za8HdLsPVKb191nrj
	ypSRI4K3qqQx3PcLLX313nM0pjTRiJ1jVd/sCKHyOSRncg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8r90vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 16:21:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb403842b6so4797688485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 08:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771863662; x=1772468462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xhVObjuoujdJeMjV3kqUuIrHfXuJ62UYDpmgw9/nppg=;
        b=QyxcgYpP789DIuVXH1hqrMZ0ABns5hXv0jpJQzFrpdSVf8L9eJDAOWKeygi5j9c6L/
         HElMbYeu2yHUjZoB3ET7wPMPFgpTmg6STVe5URdyRm6oIuMarK2EMJugqzSVI0ZlVwuI
         uwHeLmt3pKa5G6jilY1Moa77ZlO+reRnggdoBt64Pu+V1GGsvtNBZir1cq80wZGz6zm8
         qDotwKNVSVbITDWqQLuDNaD/O7LbAKJm8YsJJy05w4UDhlOlR26s/EnnOsikNT1oNOMW
         1Q81zXGm5Ru3XHP6VAZiKKwl2nHMSJGAa53uc2KLRjZ56dhmgJkXu0yE0TZPBRrgPswC
         Voeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771863662; x=1772468462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhVObjuoujdJeMjV3kqUuIrHfXuJ62UYDpmgw9/nppg=;
        b=CygZajs0ctmhb/EdZP3RGV4K9RVMO27azoa+0hLDZRdjf8weGt7PhiE+xuwI8zILYH
         kptXdGMXMUaulO3FbFS6wNLpLg1xOjkGkaI4eQeKqjcbHDZ6cH0tz7+A6+GrKxb/KNgc
         O9sVmwNnaOphkkkKB8aG8WnFtkNMhzxFSH3m4OpVR6zUGAK5n5ViHOKmnZpBbrwTwIa+
         lxMOOX6HwiRzHZlzq5j8YE3FiJZA6usm9YpGwLuaD82mYupYu+YjxBoxm04p9SW7PA+2
         0ZxSDqXRg22lBRMv/9XtELrofjDNHqYoqy1yeUKcqmjjMxxHldy66+jm+kjsAVolyhr0
         GkKw==
X-Forwarded-Encrypted: i=1; AJvYcCUeBpIZyTRNShOWutnzjeGg4JqDx2ggLnwkLxis18dSPweVuJmQxpqHjZPDzCqLxsS6PyfCMB6CEC2co5XI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf31FCX9qOYyX2P9w//OGmPhK0RWOHjEamsDMe98CYifnh0Q6r
	/VEHYSDqeCtfhDZojmbqg6WAyBZvoOugUpLMS6E0ISKoD4zp59KUI0aJjppa1OZ/rg18/m2Dlgf
	hPsg+83A/udOahvbiep+gdRGX20TyAzoKej8sfyUhMHeHblP4mP1xQPcNP9qqIdrSqLoM
X-Gm-Gg: AZuq6aKeH2hlGN+iodpHB39cbG5tn3C+6Zgdo0IAEHwgVGOHbKKYK3HuxKT5K+bmlKF
	YAQbtHvJRwUJ+tsonuM2z1mC3TIu17qcZcsctjYYRAC0XZTTDD+vmNqwOaJ7AFf8A9nFSTJBnbl
	00MoGmMsQqFzv71RpaV/ktcHITurO7qz6yixygyjv21vtj7Rg75q6IYLFoWVj5/hnkXHme3Qjjc
	ae9ufISiOfcW7vblwTXR+jfRfWYQHxRNhXf7/xeiQU9AxfVFKfB5axlHtotIU3pd96TAqOaaSC4
	C8pjvwWNRHdTIhvwQyVkAvvIDrnQXaxLCqcyeCpJbrmbT9mp5XgwRrjdpRt1q0Maj0RHBy5BWTT
	KudF8xQebDIeyyaBiw9su9EZsfauJ87qtQGtG
X-Received: by 2002:a05:620a:1a1d:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8cb8ca76ab3mr1029273585a.59.1771863661436;
        Mon, 23 Feb 2026 08:21:01 -0800 (PST)
X-Received: by 2002:a05:620a:1a1d:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8cb8ca76ab3mr1029268085a.59.1771863660741;
        Mon, 23 Feb 2026 08:21:00 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b6698asm337771805e9.2.2026.02.23.08.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:21:00 -0800 (PST)
Date: Mon, 23 Feb 2026 18:20:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: dt-bindings: Document the Eliza UFS
 controller
Message-ID: <pszsqoifgo7oxmfhqrlukqo7ipnt37cqol4ecdjxswxpsaffqp@4qgiwwrmmi4j>
References: <20260223-eliza-bindings-ufs-v1-1-c4059596337f@oss.qualcomm.com>
 <qroy3qzudcgtme4xxo2dy63ay7ojd674ski3njwew5ky7rjw3m@iagzzywq3we2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qroy3qzudcgtme4xxo2dy63ay7ojd674ski3njwew5ky7rjw3m@iagzzywq3we2>
X-Proofpoint-ORIG-GUID: 2iIQrcJoxtEYjEQ7dzq3Yzv0RKO_AX28
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699c7e6e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=J6WbokQiPFq9zDEevI0A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE0MCBTYWx0ZWRfXzCsfOC3rmTVx
 5xw+kP6tOTkd/uOeJRL7pd4AhtIkDpHBujrElc1CvCqcW0hWOtsiPdeye+v5g5NUGSc/iyh4ZkU
 PYSSsG/YMdiJCRM5tjqkITLvCfR4LKfhdwYV/JOwsytF3FJp5VOx6Pek63/FRfCDIzwzmfKiAl2
 RS2PRWJ86+HyX3lT5oKYgLgGyiiKY/8xsamhJta1mNsxszZaO6Ekxx+ZEmgSu7GJ9gSzEOQHtbP
 86srsVPdpHGzxHRAQezIn/UfJ0K8g5sfGOiJQj1qO90mAhx1tDznabMC+7FHVAxEujKv1VTJPXX
 vSEIG+wrzjO6fVY44sypWy233aHEOxYSp4UogY+NQiZi9VhVD3CIleb2zTlMCrhd30Nen3xSJlO
 cwu3fIlazYPQqhrE0Y9hunvfQqcapZEs5RRVfQKaEkHlbrSw2Fgg08GB+e9olUsmqdKbTgeliZj
 3c4WSUSa2zBASEZR7Iw==
X-Proofpoint-GUID: 2iIQrcJoxtEYjEQ7dzq3Yzv0RKO_AX28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93736-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 126F41799F5
X-Rspamd-Action: no action

On 26-02-23 20:17:09, Manivannan Sadhasivam wrote:
> On Mon, Feb 23, 2026 at 04:32:35PM +0200, Abel Vesa wrote:
> > Document the UFS Controller on the Eliza Platform.
> > 
> 
> Could you please include some info about the IP revision, compatibility etc...?

Sure. Will do in the next version.

