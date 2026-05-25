Return-Path: <linux-arm-msm+bounces-109600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNARFSIUFGorJgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:19:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 522655C86DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD27C3001384
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F5E39A80E;
	Mon, 25 May 2026 09:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ2ogOOh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yougnboi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BC32C027E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700759; cv=none; b=LpA12Kr3NLmbacYBO8XhYJFzX2OeQp3FRVDGo00TekyD/irdMvNEW0lz4m9jcseug9A4Im6gP/GGtg4hxuq8QUm3a18/uPiZb9qpT3XROAuulJW/fNag9HQG83OyFMzqMFEn6BieO3O31YCdX3cGEM5NC7oTOeAD9PZnIMkAk80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700759; c=relaxed/simple;
	bh=wUdMiM4gznb6+rt3vTR+q6cMpxLdznGhivqWLAYNrG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SK8xyZbwASxZNgocGyM8wwCAW+rAPj2/nUrpLmEfz4skzG5LW7W1pVmgTADIBfOM2MflRYdgIi8wMAJDYLYaI/8fx9V81TZa2rBTznJHqcW+UyLATCnujVfGUPMr4E3sL0DI4emMCl6wQldbGpNZNLLfwPF1N4wFtEgAk/z2H5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZ2ogOOh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yougnboi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7Ad2H307831
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bmgCDfsrFew+pg6RojZwQYb+
	pd6o+Ri4V4tsZlDZDeo=; b=DZ2ogOOhcNvpHlFCfgpKqgyFLqn9yO7FArZS5Paa
	DPpSUGk+80vPBbIJyaEp9thVPUMwsbRgEmPmIu3TzjGsg4DQshxGnV2h+WNybQKJ
	W70mbM51yCHCiCDmgbpFVlGjk1AmL6TzdZPC0YaceT4qGAWy7maCjH6OtveKq/zd
	d3zyvlOd4cpUiTUoACK6LKIegS4tT9gKII6/RdDLORqDcPEaR10qG3BUn4ZbO8G+
	6ApEAtsa57iSR/dE8bWNw/ylUaOA666WeBlz3H1YdUNkoy7/f4BP8qbCBu0jOAlT
	+Bqhqq/nNYdri/g065Mua9piP+NHkFItLcTNnNMY3MRlWw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386p6u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:19:15 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-575427e5360so8366834e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779700755; x=1780305555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bmgCDfsrFew+pg6RojZwQYb+pd6o+Ri4V4tsZlDZDeo=;
        b=YougnboiE8xlKuiDoElCBh3mR1ilC2hCb80HcEuW2UR0navXc+DCOjL95Jdwgirdsk
         CAF+h9y4O/85XwisdIVKIdE6XitEMt4CjecvTnsfori6y8Irn1Q36F/UE3W6sgLdVbzs
         q/Dsp4rUnDdOeWVARCJBXjTgMnyUXz+5Bk/y1HjPs4F0OKdI3wFxVq1Lwoy+zqjN4Q9K
         9gBVHngBSHxyXwfIuxgKJ+YBTc1VoChvGweexR6Fi/lZ3L+fbwEmHfsS1qSy+QFASGxI
         WoXSIBG05cJv0bc9cpwhsqVBJI0rf+oTuvMGOk8pbefT32/P5LnVJ5Yif/XK4zjrvu1W
         Uxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779700755; x=1780305555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmgCDfsrFew+pg6RojZwQYb+pd6o+Ri4V4tsZlDZDeo=;
        b=kfPNJfJKkYWFWBMnCBrXmIJBg7JbrOR+ydnd4+t1hGfNlbog7nt5LvvoyIR2Jdy30l
         yADHRlzWfZszaEeW/3PWTURf+WrOSQ/6SVk8U45LR9/fFcvbVibCaLChzVLmnZDH8QFv
         j825zCq5XwwNriuA7BmsJ8a5gkvRBWSvIOZhITyEoY0JLPpGwrbFz5dKqrSUe+qkNmNc
         jXo/A/KuTTF15dE/XaFjJQVn/Jiwu/qXJBrN5m82FNEi+ahpRKUwJTVv92jISiwMoXzs
         jIyhwTXaysoi1BllfHthEfRDccTGKIK7xKRhzBQ6GLtV+jCqy9nOp2hkYFxHsW+ITrmq
         8B8w==
X-Forwarded-Encrypted: i=1; AFNElJ9L0sV6jQqnfcymi6wxSmadYMmdquWh4yxWnZnuyK/y8ARW1pF0fhCFl5rrZ+uDGibyKg3Lu0/u6bhQAGk6@vger.kernel.org
X-Gm-Message-State: AOJu0YyZkANQtQxfjV2p/WMe6tadkVJeYb4YGGDXNxXH7flrnRlFMWKr
	3Q4rlOhTi+Dwt3mF8XOsiOrSC+1RN226yIZnAHCoATK18Wgyx6OUzOp5JfaXoy4aZM8PSDFLdIE
	tctet09ulKAkfverZAJY8rusB0C/eZ4HUZFxTvRQvz5Qw3LVrRvFlwkbJXvYiw8wOH7tk
X-Gm-Gg: Acq92OERHDkKss58G7zAFFNa+CwqRBgC7gnKfOdZKNPNrwY08csULviZY2XA0PgEDDx
	KwU9eEE/n2bYQ0vpkvnVmXrU7NYERuVgJZi5xw4g+08wz67ngTvzYV/IJpAMOAbPw2YN4nnBcsR
	n/OT2KdhTEb7x2Zi6Zc6uLH3JNRglQXMQqIFpXtyy7ov6Ud7U4LpqRuXPvneamAPvfVMS+gHnJo
	9GpPifaag5gm8B3f7yjFcZRJZ59i/Rw5qbomnE82AorLl/UdYFfiyN8LOG1Wzuz2on7SUPZubSz
	M2XtX5TNadt9NGpwJlKeeSUaejgBt7kjvkaL6sKCPrBh6d6+ZEoLjjzukIkwvAwNgURUqIXO0og
	9RZLvZ0XM1B8mOsBlTNcbUxzFZLW4HDxm5fCwq5eQxHIbKQwthLFIG0VAKxzuOcXLyUJNBT0wIg
	Y14QSLITDYnzdv5GCVLDA5kkScV5vO/eoc8nw=
X-Received: by 2002:a05:6102:418f:b0:660:d26b:5077 with SMTP id ada2fe7eead31-67c738b7be1mr6149844137.6.1779700755006;
        Mon, 25 May 2026 02:19:15 -0700 (PDT)
X-Received: by 2002:a05:6102:418f:b0:660:d26b:5077 with SMTP id ada2fe7eead31-67c738b7be1mr6149831137.6.1779700754643;
        Mon, 25 May 2026 02:19:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb369fsm2511211e87.15.2026.05.25.02.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:19:13 -0700 (PDT)
Date: Mon, 25 May 2026 12:19:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH 04/16] arm64: dts: qcom: shikra: Add cpufreq scaling node
Message-ID: <aibebzgnfdvfnb7hapjoym2ruawpsx7qbtedhyvn6b7gd6dqnk@3l4scbc74wsq>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-4-f51a9838dbaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-shikra-dt-m1-v1-4-f51a9838dbaa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: T089ktSCCV0_6GuYAjhAD3vvcgCsUThF
X-Proofpoint-GUID: T089ktSCCV0_6GuYAjhAD3vvcgCsUThF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NCBTYWx0ZWRfX+whdfZu1IrwK
 Sj/ThLArfSonbD8Wq5nVRJfI+qWVDG8QEF32CixZxo7UUQXwHQzplmCUJjts55P4TnapIXahfNU
 GqIpcSHHG91ADvAWTh6rrgMz3IFm8Pn+PRshX7QAlloXu1gw1ABGzEX3l0spVqXLZm+z60GJ4c2
 /4xyBsCD90eu7m1vEuipn0JDFXLSi7wAy09kh+NUWzoG7yO+/GR8fJxsIvLXNU5KC9+re7nCCqp
 iBZ6qsZAZbsa2ZC2Y5HSX/Lxe7wkW1pwgxlMAYHeDx7sOzIUgd+RJu4fam5yY9Nea5SjuUAL5A7
 0mUCk02aQGgBBLKBQcP/IPFxHkCk5S6LgfYmitCgWcFPTynBzwLeF7Ivu8Vv3FgOzjjB2hKx4Ve
 EbtoKyeLcpRlYBMF70QzIdJiJiyJ67bc2an3qfAEPNgQuqnIvO4WXsjGIQ3VxsEKaR6cxey/VUP
 +ZrY6gVaQsZLtJEkJCA==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a141413 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=gR7PYC-x2pxtVi67x8UA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250094
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109600-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 522655C86DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 01:19:08AM +0530, Komal Bajaj wrote:
> From: Imran Shaik <imran.shaik@oss.qualcomm.com>
> 
> Add cpufreq-hw node to support cpufreq scaling on Qualcomm Shikra SoCs.
> 
> Co-developed-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

