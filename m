Return-Path: <linux-arm-msm+bounces-106332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GXqBz9n/GmpPgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:19:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD8F4E6ACC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFBD53022556
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 10:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DA63E6DE6;
	Thu,  7 May 2026 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnP8XNFL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/fi/1Ny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B4635C19B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 10:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149110; cv=none; b=uN/FLFM7+idVIC87wo0UIDLJgM93QhSEDSZCxkhOpOYoeJ0F7fswdmHomAYe6+zqLFC8+ruwgorxJONQzbTKz5M0x7LOXlXQvoXP0kqmZA25CxS2s10ZQFGRZB81SN/rnhBMK6ct2Z9tc9oY04qV5GyK4AEc5fgkxTH/JWvjd+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149110; c=relaxed/simple;
	bh=WJ4j0x9GW04ERTNK0FkSquraH3iSYTfeLo7uY4ZPx8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ND+MkY7rcF2qoyh7tQ5/bqkVCGqrAjWJiH9P5B9qgKUzNhLva484wekZBJFG4XtROGTwMVyk/hz8vBaOit5diONdMFrMz+FasNUK2J8Z0M/E5FiSlzk9VhwGrm/xyQ48Au9llvpPkCoXL/bsrLLXjNpA12RjiAJmHaTZbAJjPyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnP8XNFL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/fi/1Ny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64797j0e258795
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 10:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HJOb+Cy7FbzagNYzj2J8jHKc
	+MgECHMNcJszAtwtqdI=; b=nnP8XNFL6jDE09OBAgBaLtLFbwekGI+ikhx+JZEi
	v9B3lsa6kANyXx/3UWjk4s7qMhOLFjj71OZJ4oPUrIHEfdDLnx3E7p5I8zPdS/6A
	Z/92aoRt3B45KGSPUh9005A0AL+veO6FYOSyKi3mQBCMj57aLM4JjPBuHXZLgdd7
	bJRgDTLItZrUmX7t/SDMHeIES8Qip+lUQp5Uu6wE1rbyIrKbPPbHAaSqsp8jY2MO
	DAMGg3byN/YjzHtWw4SIsJO216qDzKCVtwNV8NKw0M9jitGtEiPNsahYGDxV6Bk5
	sx0M82ByBcbnPH4/2/YzgoJoOLQhVsnvWPkld3urvc6sOg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8spd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 10:18:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3650a4eb60dso752477a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 03:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778149107; x=1778753907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HJOb+Cy7FbzagNYzj2J8jHKc+MgECHMNcJszAtwtqdI=;
        b=a/fi/1NycT9mUCmyChPDirug/oNxsMDFbbIp2PaPd+R+UNJOL2e9GNdAY5VhIkaedG
         nbEAG2XvVw/+L+sD94Of3Kvo4WV3Iw4UbAV5PL5vsdbkah/uXP2/+F5tovE7VQOGmxum
         lnDAGmDrBTRJkLkklbqyfH3TCnXnawdbVgdf9UlMCtyqF609mMS8gmEt60J5WChTSD4l
         GQ1JMc0vmRRjPwzvFlm5h8Je8ydcLEgJIW43awNAhI2GkQ+ORttzCO95sfIlpY7AsUYs
         HqIa12xQcj9NhSJtihNuJOz79S05ue7uiVdPNT69WLK8xiubLc1TLCN0pAKbEkpS1RFd
         hOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778149107; x=1778753907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJOb+Cy7FbzagNYzj2J8jHKc+MgECHMNcJszAtwtqdI=;
        b=eDei8lhvwAfDoe2BGwfF0QtKj9CVCsQkl146yYFtOqj06IjO6lBuEZf/k+UYdE5g8I
         xIDa7JS4SV1FOr5x7SacOTCtG4yef6majKlKkrAvwXR8BJrkJu03Gw87bu3bZFC6QNBd
         +nvzeeNrET0QQNIrQgp6kqL+GZjPB1W2wvjvOAzjgAaM2CwfoqFKCaDVt3Hg5nHQ5YPB
         DMv9HWq5icOrL0jDsxG1gqHjJS5IJnr1vmn8SAPF5G93VXGsfyI6SgJDopRmtn53y+7L
         B63i0AYyUsIjiPr22qKZcUVW9PfNSdaSOcAc7pRb9+d2VIRQA0afl8yCrW6EbCdjtBn0
         UQwg==
X-Gm-Message-State: AOJu0YwBRxRnSTE9rOrlbMq/biaIygouv/Lri8S1cKWHv+c/agh0jlg6
	ENjZUkKs2pLuZaIg5hiL0AHk73hp9htfCmTovWewNSBcDjPZ43p0EJXm/D+uHUA6gXOaqCkOwws
	H+Cg/AOvUVljo7sO72B1t6WWW4kyzwtByZQeGME60WxroYMgpcf8yt+BeZoDbSU1KNnms
X-Gm-Gg: AeBDievfkgAypEyU/TeEEhiwM/7MEiDYuCB4Ao3hLsZICkdklFMSi5C3FXwICQ6WS8p
	6jp8Mx75O2xISKd+roL84OtyDpHQsWIdfTn1lOcjp1HMAdLcvGooZyR9tbVppRPIDPzDVY+XHOB
	+++cfzU9L4R2qVjTATOFVRHKMi/55C1Dz0VuA21mnU0/LcryLTcfOAHydbywmyoY6/oQwlxd8Jk
	JYhd1IgQBsrH/DAFva0hr2IWVTgaYCNWswCZ/mt5om+bT+y07aNTDTk2LUrrWAlGs/jDJ6sliSQ
	rJYA90IuggLJ08Xi9dqL5f9rm6iF7/W8AkdLLeaQjX/BbZaLwJX4K6t4kzuBLCq4aZPy70ZKtf+
	+AtaXPpoeT1excZI0hH0evc4upg+tA1mKPV2jjWGmpAKigDUqWLm9OrzNpt4=
X-Received: by 2002:a05:6a20:472a:b0:3a8:2af3:ce8b with SMTP id adf61e73a8af0-3aa5a94e12dmr6038611637.14.1778149107298;
        Thu, 07 May 2026 03:18:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:472a:b0:3a8:2af3:ce8b with SMTP id adf61e73a8af0-3aa5a94e12dmr6038586637.14.1778149106721;
        Thu, 07 May 2026 03:18:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcfc0sm10237193b3a.42.2026.05.07.03.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:18:26 -0700 (PDT)
Date: Thu, 7 May 2026 15:48:20 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/4] firmware: qcom: scm: Add minidump SRAM destination
 support
Message-ID: <20260507101820.bshppmp6pbqezrap@hu-mojha-hyd.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: eCIC-KDnUpXYOSoPcyOjy_gDLi3szNhH
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc66f4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y6rW8TDjuTIuaxCCkQgA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: eCIC-KDnUpXYOSoPcyOjy_gDLi3szNhH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEwMiBTYWx0ZWRfX2UBwoHIB+dVb
 Lx4MN5YsUmvEk458RzICmzvvcR7dRQsq+6OCWgGVUig2xVjR/xw6phEJcL/81/VEsI0YWuVGnDE
 uP7rp2iMv4hTt3qhhzsrZ335bdi8sRi8lTxH0atlcV3nEBpyRBdIacdfEMDET8Y5JLPIJ0qsI97
 uNIW7Kt5R/tNeg/R62JcjXJOIeYi6FFWAHoKY3GpHgUGuuzky/dmprs7CONqAlKj3jeZm/unnnl
 tfb84dobeFOdag4vyad1ydfM+QyT2WuDpo4jLvSEILKX64hokpttJ8eZ93Ss0wBbgifxAUVSQxX
 FEbbqb8Qi+0dGZ+jVTvwxEjP5h4YxHoo9lwyHAD2LQQRL/DsYk79tHHGNrX15kRfQDMN1QsAz+2
 ikia/1NKwA1J1mKIl+LVxEcpdYVOeAY2ayo2K8x0EALlflqHumcQpifGG+Stj7NAng1AKdu7xB8
 4dhDovUIG7rxNisyrmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070102
X-Rspamd-Queue-Id: CBD8F4E6ACC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106332-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 01:37:16PM +0530, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
> to deliver it (USB upload to a host, or save to local storage).
> 
> This series wires that mechanism into the SCM driver:
> 
>   - The SRAM word location is described via a 'sram'/'sram-names'
>     phandle pair on the SCM DT node, keeping it decoupled from the
>     driver and extensible to future SoCs.
> 
>   - A 'minidump_dest' module parameter (default: usb) selects the
>     destination.  Custom kernel_param_ops expose it as the human-
>     readable strings "usb" or "storage".
> 
>   - Add the support for Kaanapali.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/lkml/b33938e9-bb5c-4743-866d-4cdccf808a02@oss.qualcomm.com/
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>

I meant this to be RFC., would fix the minor schema error if this
suggestion received well.


-Mukesh

-- 
-Mukesh Ojha

