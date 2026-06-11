Return-Path: <linux-arm-msm+bounces-112786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WZQjDt7yKmqSzwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 19:39:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C87674113
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 19:39:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AX689USz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="HJcl/EGP";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112786-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112786-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFF70367285B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 17:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C078C4D2ECC;
	Thu, 11 Jun 2026 17:24:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201944A340C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:24:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781198686; cv=none; b=m8EN7ad6+IE/tVzCP49eu7+FaH+WhTC+ffash9tAkmPlPT79RXmgLLPfLqscwRS2jsiTc6J7A0mtu0pKsfk9y1PbFNlmcLPTcTae/5TljsiWpah1+97ltuHGqf/6aNrQM4+f7VYsl0efKCHeQnvxLJ0Ww6XAmXfN0xRLqVDbJTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781198686; c=relaxed/simple;
	bh=FR3zWr4qifQm4S38yXjm5IS3VkWlyrWgeKrhhiwTQz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fn7mViQUt4HOONGke1EC0N8Vlqsf6NH9bZgQtykIKbxVp8qi01CFKVaFSdziiGFEsdFP2Wjg4dyvMj8i7SO/0FgEdBIzsz59ylFFGc/FHmk9ZeJPhE0zj0wXqX0/0tLe++riiSKgaqhX0s1Q4D0CpivPo2PKal3cKNsfJx6yblc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AX689USz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJcl/EGP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BFolZw3680520
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p0UEMu0DOZlEEmh88aTiA9Z8
	ge8j8Nt0vJihhcGu1WM=; b=AX689USz3m8bFwKaKM1wdx1Df/N4NJMcAQs/EmGr
	2m9YGtwtBsmnOrb/tgTWHvQ5Le9edm1tPusfsMHXIJHfyb91hLaHFuSri634COXv
	6O2oLF/X+1cZPxRLfPnDZJQczosI61jHWbmd7vEovGwuRhkHySHDBxqpfg55p5xG
	xQNzCDwMbY7xO0UBoA/v2gCAwZcXsKp3RrXvqZrOVrSwIDho0L4GYN8/niLKqrRl
	Vws9FJxmGzw8+S+t9y4tRUpLfIzyKWhiBIJBNdqhLsqft8yt76WdI8j1luW7HV5T
	8UOfNGWZJ1o/oeKdO/P94V7xcl/9cn2g0ufH6+0Nn6EV6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014gebs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:24:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so1285925ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781198673; x=1781803473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p0UEMu0DOZlEEmh88aTiA9Z8ge8j8Nt0vJihhcGu1WM=;
        b=HJcl/EGP4zYhGCQ1TwRxfjIjb+i0LrUmzAaEGZhekR02u15Nc1d3F9vP+7YMd7q/xK
         3NDdJserJrL6z6yLlju6lK+loMTF4TJ+3+pQj97xJcAGxxoYXwyU93TR+RZ9wOCxxdxW
         CHZ/QO6dti3zMXi1agFvem9nDGYalzDYMWNbgwSeAxOUHDBhPhN6oD5z89EvRVzskzct
         qfqTdloQG6Ydkz4SIomVHAB2m8MyrhTVSa79zMsXMSOy3Ph1y4ApiNLeTTOgGEVhY9CY
         RvuY2/ned39GRFya1UKDXLdKC6P4CVt/akhVcLWaU9CoYKiR0L0XYdWG2VgXYzxH//tv
         KfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781198673; x=1781803473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0UEMu0DOZlEEmh88aTiA9Z8ge8j8Nt0vJihhcGu1WM=;
        b=jpOnbG7RuvuiY35Qw6qFBiXIWcBIMLot/wrY4/nH2mac3eHMRAIU+vZtIPU5JaS2ae
         kppRnky5QW5Kn7muE/0+dXs+92MFY0UwVqGVbSXoTnByLU4+VbLZ8ed6cg/n0wUkYyVT
         wqan+BxnyhQrd1U3K/n5jHbnIKBcl7VwymguQs8sD3iWqRXxKOBl0YCLG4FkPJn6/H3e
         RzF9M/Z+4+4jJqs1yCe0wcfWwPmNdLuTdFTylBVnVjIy7wb+zUm5ja1VHWdBp7/0i7v0
         qMbgnX4m7Zt2PVOMjfQLOeEYo2cQXtesOQPOd8F/8BEzjPP+jP+hnTB5n7VCFHFDrLJW
         Tecw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZvfunKNpfNT+1Nf1KRhRb1/jR1P7mVR0FixrTUX6bvle1toHNYEv4jJR65977oQdtTT+AoWX12nJ0Dgfg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu5qdOnIasUMGNaAAFPVjKH8DWW/OiBXvSmXb8Xf8P+p82ct9M
	HIQ2hkskNvyXrBqtp8oV2/Lzz0OijLgWvs2Uu2aUz3NeRurX3+XaL0S+IJK3bAiNVZc1STYJLtk
	CbEwUq3lyBU4PnA3Sv1xbMAjixE8lXxtuGO252FcRv5V72OepZwxDSTHb6h1x4Z7PrHxp
X-Gm-Gg: Acq92OH14xy97AhuTYtFL2F7TsSBI7CX83QqL9G9ujutBtZJOj5m/6hiYTlUGvEyc3n
	jyPRhzE10LQE+HbAuipKFK65SLAB6VjMu3h8vPsnsS8MCRaCqlipXfIMRVAjVuhHX6DrAfUWMOl
	yNCl1C56gubrwfR+PRAJ4wQ/t+l8lnvCtLVZ/fdQOHT1L1ebeODHFIyFSQtq49jH39uJMCJM2QH
	9w54oQE0WZmRGryXscBf8vfzyEuzwMoIHflhFvd+81hS0TMp3vPjjB1Bz56z6J0YB/5xAcVN6yU
	/y5IaGge6vc4hMbdfBNbZP5iF/HgCxzcmkaFxTFtZfm5DjvNrAvUvrX6qx+M7sdXiPP0p9GZCwV
	Sl+RPOgjRnNI3ejCpzeRwOkmkgraDVZ0sFxan4ZQTi26zo0sR
X-Received: by 2002:a17:902:f607:b0:2bf:222e:455 with SMTP id d9443c01a7336-2c2f0059f50mr59409965ad.7.1781198673134;
        Thu, 11 Jun 2026 10:24:33 -0700 (PDT)
X-Received: by 2002:a17:902:f607:b0:2bf:222e:455 with SMTP id d9443c01a7336-2c2f0059f50mr59409545ad.7.1781198672622;
        Thu, 11 Jun 2026 10:24:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d55esm290143975ad.63.2026.06.11.10.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 10:24:32 -0700 (PDT)
Date: Thu, 11 Jun 2026 22:54:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/18] firmware: qcom: scm: Add minidump SRAM support
Message-ID: <20260611172425.eejrdiv2zvhqkk5a@hu-mojha-hyd.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-5-mukesh.ojha@oss.qualcomm.com>
 <004d6bd1-2800-42d5-a6be-1fa69a06194c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <004d6bd1-2800-42d5-a6be-1fa69a06194c@oss.qualcomm.com>
X-Proofpoint-GUID: xoDCOOdAlNjIKvfXxXL3oLwjCRQVwEoY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE3NCBTYWx0ZWRfXwPbAAhXbJrZv
 A90zElBRdpFR1Tj2mgmft2FzmfZpRL6F8tcnwSoZOj6k2esYuQs8IV4MVnSfp9h8aoCVfW8YtvG
 zDOUVFfSN5q5MvdYLZSJ11Ar9HZGwhI=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2aef51 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9xwycFMNzIvhgBqj4zYA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE3NCBTYWx0ZWRfX68NbFKCoyDLL
 F8D2oqJQFW4MWsF/hGgu/7D5mn6Su97r5XtOYh56sRg7U/iYkFeVuRKAujL5CG/pP0THLLJlpPg
 JUiFrUvM8uKmCvngWb8/COGphiCsjDZGQIBW7aLVHjIMnkyBTj+ip8J1RCLyfkcFLGnoSxTB9kZ
 o6O+7Yt+A+pCRIOzrFkM0Kkoo6fIFmwqwfPpf1ehnZk1f+KbCfgrapoxQKo9OiKvUp5T2+B6Kfc
 o9XbJ6XFmBJmrzYqaf6On4hvjdMs+M8fmhlnGrt4rwXTW8KrnjJI7DN/MmI0aHxQ+bGRi50kQfx
 R3j5UEIOXYtm1fQKtPpxUPPoQjSv6XFB+YevqOz+CY52c+bpOq/QPvwHHP3nDrcMCkIAb8BokDc
 jxOrYSVGZ5glo7eJV3vr/r+Og7KKjYjKTk86C2j8CDxXg/hh77a2dqjOOmXYHDO5lL/Q1cCXqCC
 6nFIqBIVjygFleb1NHA==
X-Proofpoint-ORIG-GUID: xoDCOOdAlNjIKvfXxXL3oLwjCRQVwEoY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110174
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112786-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,chromium.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81C87674113

On Thu, Jun 11, 2026 at 01:45:53PM +0200, Konrad Dybcio wrote:
> On 5/22/26 9:49 PM, Mukesh Ojha wrote:
> > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > SRAM is shared between the kernel and boot firmware. Before DDR is
> > initialised on the warm reset following a crash, firmware reads this
> > word to decide if minidump is enabled and collect a minidump and where
> > to deliver it (USB upload to a host, or save to local storage).
> > 
> > The SRAM region is described by a 'sram' phandle on the SCM DT node.
> > If the property is absent the feature is silently disabled, keeping
> > existing SoCs unaffected.
> > 
> > Expose a 'minidump_dest' module parameter (default: usb) so the user can
> > select the destination. Only the string names "usb" or "storage" are
> > acceptable values.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> 
> > +	for (i = 0; i < ARRAY_SIZE(minidump_dest_map); i++)
> > +		if (sysfs_streq(val, minidump_dest_map[i].name))
> 
> I'm not sure about sysfs_streq() specifically, but otherwise this lgtm

It is used in quite a few places for the same purpose. Am I missing something?

-- 
-Mukesh Ojha

