Return-Path: <linux-arm-msm+bounces-103625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COiwHdvQ5GlEaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 14:55:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC9423FFC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 14:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5D38300FC42
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 12:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4500367F5E;
	Sun, 19 Apr 2026 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cd/PxSxI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrYNZ9NE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6B824466C
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776603343; cv=none; b=KOZ1YVtrHrLOAivZzv65NAHAiIu4f40CaLxZcUYWpual+io76qXpSB2Ge3OvnpCSZfMISnLq3OzVGHT4/rAg0+B44Kxo4UZjdTxMAWnr1HPEq7bmwn0RT1cPNWx5guIl3NWksSZtekQXXwTN7SZYlGBgnd1odsLlfhUQIlnpJDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776603343; c=relaxed/simple;
	bh=F9lDqIpzPewfZT0cHqN4gLKwdFR7/hB8BJ6yZ7xzvEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3nr3vwhwqF36SMpVZrmZwl/mEIts2RTANwtTO/i/rNMepTEGmJbXH2zOEzZDM9lrSKnJJ5qDRXzVu5p1Ul1PrYAAjEZviwDycwN8EecZWhHaAXetTCOXZPZ29b+A3aG8MJE3acWKF5/JkZ9evs2ouOAv+anwHaxUZQXSKUrdKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cd/PxSxI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrYNZ9NE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J805AX3802532
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 12:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=17zZN7t/iQfpCj2DqIKt9rC1
	oKSiVFVDOFJ3v4jgfZU=; b=cd/PxSxIKjjw0jhb7l8OOSlm6YCnuwLCjq3YbVhm
	V0P0aD+t5kkDdMb8/XkeHLSZr0WebJrf+YinHM7Uu5tHKPclfH35loUnTFA/GoEy
	v6r7l+eFN1PmvzMBU8HHlq+kIgxgkr8sNNmYjDnV7I0vAFSWg1sIVNUt6SOEWhmE
	QubnnD7Ae7oCz0ttL0MvvpAyuukvsirqXrmdV4z9pfd6pprljYznz0umEcrHmVj+
	Fg0CmrKNA+Q2sf1iuZpdjEplEGApJJNcsRj0SRWVElwAUkr9B9EcLrkPrZGZbvcW
	W42wQ0YLrNITWWD8xgKITIV2XQHMDKpCpfYzCKqjOvUYTA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b72gqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 12:55:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2cc75e79b97so1246253eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776603339; x=1777208139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=17zZN7t/iQfpCj2DqIKt9rC1oKSiVFVDOFJ3v4jgfZU=;
        b=TrYNZ9NEjw/x7wlejP+GWi5YTCWo6cGvtgeO1d5OPuYZn8Q0T/m64aopObQxAtwaGQ
         S1Z6W/cM7bzXxIPWPmXQom+SvggNS+V1QwuG/K9OaL52SzvOqoZoyNfuQa9yOZEApeOr
         ML524jtl0G/GWetppQWpX6mdtisMEQM2MZ8ghL/fjZyXfg58GTCNYspLVfGUMXNxDENr
         9CNEfDM5ZNdv1Q2DSh0FqYTH53noqG+Bk3FLsE8NRiJKW86FLpwRW8u3XWxhWPDeHLow
         lvVpl4yeaQa/OSjtHAOQhD4j5QOKTyv6nEcqsRr0N2QNCpxNEXXHWGHBkp8xdihE6V0f
         U/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776603339; x=1777208139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17zZN7t/iQfpCj2DqIKt9rC1oKSiVFVDOFJ3v4jgfZU=;
        b=dpVWsF07dGVuoQwV2riJEpF0CDclrmX3D+rRWtQvuLU0wIfj8c5mSCsq5Wx/OcTAZX
         JuG8TU+Eqq7MgZC5nn1R3oA/ZI5FcEeArJTYhhD8WrzTAED5Ld0uAfSegmkH0HEW3seT
         Ap6su6zCUCmPpZPTmyVrpxJ1IuhqP2PSLSWvcnsTbKWEU59t8ZKR9zqr0IJMndHunf3E
         tvjDRFPCucOW+hx05AoiPltpDRryao4MgkpGBKjq1gx+tOgLS4+0TvFfYWkWVtHymT0o
         /r5wG5IWkgSKFTIht6OZNFsVfyUpm5zjN1IWzeTSj/KGCmt5HihQm7WlQBiayJuR75mn
         +W8Q==
X-Forwarded-Encrypted: i=1; AFNElJ82eLruL0F9HvoLpk7dYAJ87FejulPOEckdxlBVegVyRL3daFSbX67HX+zDjTrsmxXiM2LduMMblZIeOvFC@vger.kernel.org
X-Gm-Message-State: AOJu0YxQtw8Un9uAOvhtHTLMcDlBM23GD2zSjH65viP1NV+1K50oEtPv
	3t8LV2m54sfhyta5HP/ZDMLB3Xli1r2XRNEJJDvdzsvijrZF75YVcJOnv41UpkFJaxZuPV52/b1
	bT4Fr9leezIjbzmXnqySqpkjgLp/IvT/KIPhcnEnf9NBHCjC3UjKoNyAmD7rFygX9T4m1
X-Gm-Gg: AeBDiesHp6eLSmZNk47rUuZJ+tAhDtUMJhalBMmnBeSDHOfrC6zyGKvYiYKEKIYtTpD
	2bqSj+B7pW5AocB2rm1qcWSCriUoOD+1GfWrseFNCc8endD1d8p0tf21yHj2mnRN94zR4RN5rii
	8bAzJNdjoBqpT7P5Srv7VrM6IpK23KH9MVUkHV8JDMpgRDUMsyLbXd9Hz+S8us/2I/vbnIyN4+O
	BSN3l97VNrTUrUx7HKSgX5tJ1NcmEV3GXIMqjuP8DSdZH/F5brUapNmdmnfbzh2rJpTpGwxTjJZ
	E7WYY6vhDgceqXZspz/epmk5rwF1Tu7pxHmZnw9ogF4eFmddQpEK00E2bsV2sx5WT9ALeFdKe3e
	mOKYfkPEnA7v62YWJGJPFnmHOVXHtf6x/KiKlPtu50IWMdwRlfKUeqS7jpz9bwO1jxWp8f1YMu6
	Q=
X-Received: by 2002:a05:7300:fd18:b0:2ce:3aa1:d39b with SMTP id 5a478bee46e88-2e4790144a1mr4489768eec.20.1776603338941;
        Sun, 19 Apr 2026 05:55:38 -0700 (PDT)
X-Received: by 2002:a05:7300:fd18:b0:2ce:3aa1:d39b with SMTP id 5a478bee46e88-2e4790144a1mr4489753eec.20.1776603338371;
        Sun, 19 Apr 2026 05:55:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d4bdaf7sm9533927eec.25.2026.04.19.05.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 05:55:37 -0700 (PDT)
Date: Sun, 19 Apr 2026 20:55:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com, Tony Truong <tony.truong@oss.qualcomm.com>
Subject: Re: [PATCH] drivers: soc: qcom: smem: Switch partitions to xarray
Message-ID: <aeTQxVry5L-H1odY@QCOM-aGQu4IUr3Y>
References: <20260410-smem-v1-1-8e94bb5416a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-smem-v1-1-8e94bb5416a6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e4d0cb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UXCI7_oW_s4cHWwpH7UA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDEzNyBTYWx0ZWRfX0Zc/Ccpjb+E4
 PlomqvAQOylKFk0/0XAZBDXX5PIaT03cnIFSjkPQyZmtugO7Eypf9DKFlPGbnxQDqo+ulIFXuna
 YAgFB/RxqQrtxe/E0fYmdsLjEvoknluyI/AFx2CXx2NLp0RPPOWISgVHkGo7nuwtqiP5CMmde+i
 7AVa1n4alNy1k1Gf0JIUq/dKrXNnr+vy5gsKxpCBY0vdpDBB3+ZiRGwmcQVekdL0HEv3Iy7gIrU
 bq1J7vwvENXm1P4/yGQYzzusUybPnYSAwGXIqwUQeWHYB36l+uyhi8XYYHks0lMHjmQ2UJDQOZQ
 /d1WRxvmwlV9MLzuDyz13bm4Lh8vQADTR/uZGrwcHhlByIp1n7qi6S960Fdpod9sU7dJOaMUD1D
 pLTbs/bf0PIIN+pWdvUR7N7jVkPN3Hx0mS51gcfYI9zb3Kial92Gdu1hgDyhDIb/dbOVFjUI/JO
 Exr+pIcIEBhTSrvUojQ==
X-Proofpoint-GUID: a4M88aKjZ6ryaLkwhSEdoQ6Zy3DFTpHp
X-Proofpoint-ORIG-GUID: a4M88aKjZ6ryaLkwhSEdoQ6Zy3DFTpHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190137
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103625-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16FC9423FFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 11:02:30AM +0530, Pranav Mahesh Phansalkar wrote:
> From: Tony Truong <tony.truong@oss.qualcomm.com>
> 
> The partitions array is currently statically sized and uses the remote
> host ID as an index.
> 
> Future protocol improvements to allow for more than two hosts in a
> partition will require hostIDs to be bitwise significant integers.
> This will result in large, sparse host IDs that generally exceed the
> current static limit.
> 
> Switch to using xarray to efficiently handle these sparse indices and
> allow for dynamic growth.
> 
> Signed-off-by: Tony Truong <tony.truong@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>

Nit: drop "drivers: " from subject prefix to match the existing style.

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com> # On Nord

