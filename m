Return-Path: <linux-arm-msm+bounces-109569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGz2FF/1E2puHwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:08:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E724C5C6ECB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1471302F384
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 07:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB433AEF27;
	Mon, 25 May 2026 07:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZ+zGwlg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZ1PJxPy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94603AE1A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692815; cv=none; b=Evb4Bn9fMNYiCE8DMGxGQE35J0JWUo26w7/AqXD43OS2S5LDVIj8FiHe4MLGft/uyjjPPvGUfTqNoKcfcjWyL2iXSajSamBwYuEUDjyP+cuLH4r+Q2VTiRWZl4ASWK1oB8K2Gk4YdaDM6tMQlH2/L2uMDVo4wPgjvJIGoUxOZbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692815; c=relaxed/simple;
	bh=hCe5dnACuZOm1TDNzmixfuaE5fDBmOyedweHcK1ETPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyCHaVA9U9yrLzHqRDPZuGba847cRTfxyVIQ6nPYIpygkd87Xpn7CxsOouZ34zeK9yQ37Pj3GOKRlS+Q/vC7i/w16Pt+MoE8477kiSF6n0xPIktUJjnF8oiwWdT8fKjgIRJ1ersHdFk4XvMarsXG+15igUwrGbfeYTDclq+WPI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZ+zGwlg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZ1PJxPy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6gPSn1223139
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ImreOJpx9nKlDyipy+6af8Xk5D5pUnY1RTxb+3tQZ9s=; b=EZ+zGwlgzjBnZdA4
	23+pDezy28tPuCjH/sHywCOmQsClDyS1zvTUx2S9rHgEteLJ7EEpJj5ZlBIZXrtW
	tXpJF0egqDsf8wtUoDfqhUoMYqTz7m1HRmHUgHKQ6dHa0goyDEDvNG92agy6zK2d
	MA7chArHwYn3G75OI2qzM+9MdsJt4XtbnNCXaiZXGMRRzSzUu3vP1P+1T+LW4cIs
	vdFY8xMJFBXXbr0C4y3w/VrIOhjLUh65h0l7uRgCeI/YKx2/bWPDo2LxkRXk8Ngt
	EPrKidbfUURfq99MyfCHQbdjx/fUlpFQeriGG4NJuw+cvFM6paJCkeagjpIDbvCw
	RcI4rQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txng25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:06:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b99eb06178so213702265ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 00:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779692811; x=1780297611; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ImreOJpx9nKlDyipy+6af8Xk5D5pUnY1RTxb+3tQZ9s=;
        b=PZ1PJxPyzJQup9ETn4Mthq3BE4BofzQpoMA7PlVbWBvwOyzY1jEGCklEe0Wz7vVNui
         pZcMj/PbBG4YeQhz1iC9oJ0MQhtUN7+yB56ZRR2XqVlkbFQEg05bzSH+/ZCmS4CtcVpX
         P7zqB5/U3lXa3JpPisI8OiuQ2oTx7ID4fCSEDA0uRtrdsYJK/1JqDrocTQjvcGT6zUZS
         7iJGpyYgwN3MO3u9jlnNifCWPNivbKRKtN22jA0nvy0KhGHn49m0hk7RvuGA8zQKWPoO
         cdP+NUQAjcqO6fYh29SmirjfvsLagKgSQSLKSWHAu3D1/khUcDVOGLuArTUFbv0xCIDl
         Xkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779692811; x=1780297611;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImreOJpx9nKlDyipy+6af8Xk5D5pUnY1RTxb+3tQZ9s=;
        b=Jklb4w69162wo96dGme2/FZ4OTZ5IAxHMQcyy3S+JWpgiOwIqqwt+Xv9QLOWbqZtXe
         gL2lvuxlVqC0zmMN0yKsXSJ1G31SOy1+eTyotZ3dxHp6TBR2yU9DPYwd+PiaEomkEO1a
         3OXx/Z09aesAxapGplwL1pOhzccWHjso6EdSNSNHg/8/KonLMlLaQD6tEgiLEVHfylmM
         uONp/0TJKOuOHdOKThP+QZFLjBUuEhi8J1Paxw+j/YGlHd3qOkjLFrlzfpX/T+srXcOS
         nrA9OwAVLAvhQB57XDz+hNEwSj81dy7DeaK3+69Qwi7GYuS/9PpKcPIwCNssDhGjj3uM
         PqAg==
X-Gm-Message-State: AOJu0YwAba0YDZDYfGMDGI5SdNEx4aeSCduWBQx/aHTb2NIwBA8hBRcB
	zMoAZ9f6E7sGiAlVZV7iyIxZMwyRDE+BdbaYyHrJPkM7v0qqKpGE+0WQlSGT3fBJBMwPr0pb7s7
	pTfkxo+JID+cmKID6vIcnbB6wWoH2I1Sw7gsjMv8selAygMZRbPcwsLoMlT23ilN2bkgh
X-Gm-Gg: Acq92OHZMUgAA5WylKdweM2CCPx5Z9PGQIJt3MLun4AzQpr9Szh+cGnnV85UskI1AxW
	raaL3sY7/XQyDd2jLJ1DUlfy6gnMnK4GTRfFyTa9JtAwT9lq9i2CVwmxpmasLTd7h4pEdp/Efan
	yiQoqw+xN4dbYe3fY5whGa8RvCaO7xN8F3VKYsNHUQP6WoYJb0PF7wt0b9pyk/JMi9qJK2uvDi6
	Gbn8Xip6yBL8d5Nfq/E8N6T3g80NBfv7RGS6cbAkV7q36j1h23+TjoO6bgbOsJT7NOJjGMGx8bR
	SwfbBaL+cjL3IBSwIoDE9zYXcPcQgV9aUA/ELAcwH4qg5DSR7q4qpmck1f3rWbMRn0uXZ+F55bE
	7/UHe0Lkf7HtZJUdGxsg/agBK54urvB7M2wjMpgYtOJso3OfG0GGfuMD30rTqiTl9TKKMgg==
X-Received: by 2002:a17:903:1212:b0:2bd:4d9e:ab27 with SMTP id d9443c01a7336-2beb05822d6mr148297015ad.17.1779692811476;
        Mon, 25 May 2026 00:06:51 -0700 (PDT)
X-Received: by 2002:a17:903:1212:b0:2bd:4d9e:ab27 with SMTP id d9443c01a7336-2beb05822d6mr148296545ad.17.1779692810948;
        Mon, 25 May 2026 00:06:50 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b387dsm87575635ad.50.2026.05.25.00.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:06:50 -0700 (PDT)
Date: Mon, 25 May 2026 12:36:43 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/5] Enable ICE clock scaling
Message-ID: <ahP1A1K/EXujoFuB@hu-arakshit-hyd.qualcomm.com>
References: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2OSBTYWx0ZWRfX5gp5ZvCOsHEL
 Dxx23amOKIiL3sTrsWAe6mEAm091SDs3fg71OlKcjdYwwIL6uSQOcDu+mFs9HObXYdcbqgh2eKq
 FD5/kfr0slJoSMwnTr1grnBuu5Il/VliNbu5/QBQwLtn8SM1WA0/aFbZqc8EyjN7G+hxByc2ZIO
 sn+uD9Md0Z5iFYH+DT9ZBuo2mz4SqEFbaK/0Hs3rNztazTRvlU+Z/14BGVRpoTL9u5zZjyw86R9
 hJYPpgNCLIG13vTRAFCQlybr3LDPxBQ7pli0l0tXNzRe32D9u95WOoBOdqalSEO3r6YGR65EWLZ
 JH6gLpa2q22NnRRmD+cG4dzBYqWcIcU6VvtyxCmqxxAcEcLoFwLyrq2n0bEUggj270D/Jd8u2Ge
 +6/AH2vJZal9qYyjWfQJ30/MvwtzTtHfGN41Hm3ZbOKyAzuaZYrZ88tLpxYNBmYDOfw+bVXuDta
 OQQ4N+2hwLJpgCJGdpg==
X-Proofpoint-GUID: dwMH4IJZRqJIei-J9olULoXBpb2CPjJT
X-Proofpoint-ORIG-GUID: dwMH4IJZRqJIei-J9olULoXBpb2CPjJT
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a13f50c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p6yxZNB5brmi-_xxTTcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250069
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109569-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E724C5C6ECB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 12:55:47AM +0530, Abhinaba Rakshit wrote:
> Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
> using the OPP framework. During ICE device probe, the driver now attempts to
> parse an optional OPP table from the ICE-specific device tree node for 
> DVFS-aware operations. API qcom_ice_scale_clk is exposed by ICE driver
> and is invoked by UFS host controller driver in response to clock scaling
> requests, ensuring coordination between ICE and host controller.
> 
> For MMC controllers that do not support clock scaling, the ICE clock frequency
> is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
> consistent operation.
> 
> Dynamic clock scaling based on OPP tables enables better power-performance
> trade-offs. By adjusting ICE clock frequencies according to workload and power
> constraints, the system can achieve higher throughput when needed and 
> reduce power consumption during idle or low-load conditions.
> 
> The OPP table remains optional, absence of the table will not cause
> probe failure. However, in the absence of an OPP table, ICE clocks will
> remain at their default rates, which may limit performance under
> high-load scenarios or prevent performance optimizations during idle periods.
> 
> Testing:
> * dtbs_check
> * Validated on Rb3Gen2 and qcs8300-ride-sx
> 
> Merge Order and Dependencies
> ============================
> 
> Patch 2 is dependent on patch 1 for the qcom_ice_scale_clk API to be available.
> Patch 3 is dependent on patch 1 for the qcom_ice_scale_clk API to be available.
> 
> Due to dependency, all patches should go through Qcom SoC tree.
> 
> This patchset supersedes earlier ICE clock scaling series (v1–v8) with updated dependencies.
> Hence, this patchset also *Depends-On* the following patchseries:
> 
> [1] Add explicit clock vote and enable power-domain for QCOM-ICE
>     https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com/
> 
> [2] Enable Inline crypto engine for kodiak and monaco
>     https://lore.kernel.org/all/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/
> 
> [3] Enable iface clock and power domain for kodiak and monaco ice sdhc
>     https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
> Changes in v9: 
> - Kodiak ICE eMMC OPP-table entry corresponding to 300MHz is updated with SVS_L1.
> - Add 75MHz for Monaco ICE eMMC OPP-table.
> - Fix error handling and initialization of has_opp variable.
> - Pass ULONG_MAX as target freq instead of INT_MAX from sdhci_ice_init as it better adjusts the data-type of
>   the function qcom_ice_scale_clk.
> - Link to v8: https://lore.kernel.org/r/20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com

Hello,

It appears that some of the dependencies for this patch series have already been picked,
and there have also been recent changes in the ICE driver that conflict with my patches.

Please avoid picking this patch series for now. I will post a new version based on the
tip of linux-next, with the ICE driver conflicts resolved.

Abhinaba Rakshit

