Return-Path: <linux-arm-msm+bounces-111476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AFvZIEgCJGoP1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:19:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCBB64D2BB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:19:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bioAmOkN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fvJD9XIj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111476-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111476-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9CC23019BB1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 11:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9101A31A567;
	Sat,  6 Jun 2026 11:17:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE4630214B
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 11:17:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780744666; cv=none; b=Ty08EDk9VT2wvNlZmKXrkbJtfFfXR2k5k/aB/pNpm7NE7KjecAKFgfiE+B5J+FzVbYKSIiM2Ut8nlpIuTCouS+rntWbnA6V4Vp7lHkd71KVD0uMqOFTyAP6AlSGL4s1qHUtRpbzpPkqRzyUo//H56Jlew5imB9OBxf2MxVK28Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780744666; c=relaxed/simple;
	bh=QtS+bU0HdzQifrsDgjizrZ5jyMryQB5j+BJSEX1oMFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dETMSlqkumZvyIqOpmCaUsGnOHa0KSZYj5uoZULIjTbvug8UcHKcnkdOGG6spIvHTaCjMhmJSfHdCjQtLVtFWPHrvCntPqNyIujJdwmuIxaWv25ipHSgJIgrAeNys6zEmgPyhTL8/+j5EWQ+JaxjkdG+tq9W03fBjDsiSkUUtyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bioAmOkN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvJD9XIj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDYO61230956
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 11:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cLjQ9WvxzzZPujHqT8NeOomX
	yT9hmfTusim6k1vlBJY=; b=bioAmOkNJqEb+4L3gf3PY45LneEOp437CKzpS3Jf
	fKtaLvUDw60bpjGzaSp3RqQncM+ZceyCA+7XIX4GbeHjJFuaNY3WptGwyR/i7MFg
	qAIkSc+2AjgnykaSdbqMmCPGfg9xycWfF0QoGhTdE6Ju0xjV40Bdfczxdb5QhGsm
	Z1/bph0aJmkBuvDZwYHI2QxQZLF0B0aliYwpWHNV9DvcvF8UupPpianNlsUuLn6O
	wWdGTRLWYmz2/tv56Onn1ff4XKm5q6eSKQ79oLwMmHsCESN8O8LplhAybkL33hSS
	fseS3t/++1NnoX6ntUAp0iJQr5AcjWz+HjhKC3gwMjNIIw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgrq3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 11:17:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177bddf6e0so68823061cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 04:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780744664; x=1781349464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cLjQ9WvxzzZPujHqT8NeOomXyT9hmfTusim6k1vlBJY=;
        b=fvJD9XIjO2MBcgXtYiBAhgc97tSO8d7DVDi7d11bqPZTpLX17qx7/i6YlD3wYEpq/N
         pWaewdJtAyZaixRSqJ9FwOfWo2qINN2HgAdSbPk2avPPGd/abDxPjlPFwIdIwDp47LeA
         EPFCE+oZ8MOqAcYit8cD+TGKOzimmWw4C5QE4qFs8/0dMSwhahqSRq1WYkEcgqRSZQ6m
         lwPfRddmwmgzy2vpICFMuj3zsOFV+sbjCS6U+ABdh0aPIuyfaJ3YKvjNpOFVVxsEMyZe
         JTXv1if/iT9u2Phu+54bx+ahsCWEbmAjV+j8nWtyfiTFsV/CceInOOSyineSWWOsg/zn
         BZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780744664; x=1781349464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLjQ9WvxzzZPujHqT8NeOomXyT9hmfTusim6k1vlBJY=;
        b=kgFP4fnjOyL6sxTITWn6epAty1aPbN6sWSPRzl6vwyYbWND3GjmQC6xFzbUUJb55LD
         JDx8IfiFklF3eAa/uT+jArvxzAHgF6gTFkIGktdusrJ2Swx/dLZ+WQTxIGZE6MTeNUE3
         Wl2FPBaVyXG+dvka8cU3vTTM7ZCq8B/1cm0pzwsNkYaid78ZeyOzUp9FicZ6zsJYtuJW
         xz3ve7wwpzyZySLAs482CrvoOOyCnzXJuzzkgiaQBlOKtTcQfeKUgv9uPlco+dJCH+uC
         ZArNPNP/tVDhQyFAonW3NszVyh3bsr2HoI+FoC21esoB6kPnBOYzss8duWges9CwMDlg
         Vlxw==
X-Forwarded-Encrypted: i=1; AFNElJ9Qfm8L0W0t9DeaJTqrDSwoKKoLk9FywzDxEAS7i9PC7CxoasPtJh7A9mdb8+Ki2ftlG22PVOgvohr2eo7R@vger.kernel.org
X-Gm-Message-State: AOJu0YzzGILxVYAMHEnhv6YpFyQF0P/e64O1nSTlaeaVqtQJrpcj9KoC
	Q3Nhl0A9tL+aRqvlgMDKCLjVeVd0YClcc3zFNHS0YaLmDokLmvjF4A3Wyv/9BA5lwfD3CIDiQPr
	W+IDHYD3xKWUBQ+K/JRZg9BLih998NJcjlL6aa1V6zAlZtvXx3Pi1fTq17HXgfS4DSMM8
X-Gm-Gg: Acq92OHJl/q2LOa3TDpWA3cKmdb6Oe76GONZuuZjKd6TPrxZnNvSavPyjuD1OJuSGRO
	aYBXaS2vgjLLILfX+4aUdZjfgOpbGayQO1Sd+8Ql9l1MhKzgeYRcXXNVxQPg8anm+F6HxmYKHur
	+MZiz6Cn9NX6tSNdjMO97jrheNmHwSiRu42ICMbzo5YqlbOGJh+RY2KeTzCNgz7aEELq4R2FkQO
	EH2uCA2n8U4DkTh7cjNjtBsd1YtXGPFcCSxb8dkyy708TQmdf1j6Y0khefP6+I/3ZWvVh8T7ySG
	D7stPkMW6dXwyd+OoqXeoQVmOOUx+iEx2Gibb4FHwAQhe5dwopGRrrwZOF+BAcXrivux8Zey0b5
	Pboy40e3DH43V0/co9ntTrto9K/UnGWMlM4EG7biTjZ3UCmH/6AtVcXJfBnsEQjqkISGgRZmUpd
	mMu4enKxLf33S3/0WoDw9DRFcHN7x0EO45n4/aAWXbw8wIiQ==
X-Received: by 2002:a05:622a:1982:b0:517:896e:980d with SMTP id d75a77b69052e-517988745d7mr66369151cf.37.1780744663668;
        Sat, 06 Jun 2026 04:17:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1982:b0:517:896e:980d with SMTP id d75a77b69052e-517988745d7mr66369001cf.37.1780744663198;
        Sat, 06 Jun 2026 04:17:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d503fsm30608431fa.34.2026.06.06.04.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:17:41 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:17:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: convert from icc_sync_state() to
 qcom_cc_sync_state()
Message-ID: <o5k62vvdprueqgruk3qtkugyzvnqtba5h3wjbpuui6pvfytcic@euzvxdlmrhri>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-3-457120eed200@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-clk-sync-state-v1-3-457120eed200@redhat.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a2401d8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=20KFwNOVAAAA:8
 a=X9BXxLd9AQfZTjhNIisA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Lij0QVK1Xxwewu8CIPEIkqwNEPH864f2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExMSBTYWx0ZWRfX5ktkTuDOaBcr
 dSt91VvvlCfJev1cZtS1U9b+G0uXg91E7SruiHKx7vKOnib97G3nM10VF7Bl7kclb7Rimb0pXUM
 pO8jSLynnuqBVZIIS8NsM1ZZBgya+5eEIRZEEC3d1+Gmv2ZUt/xfOPI8mnmXZL1VYn8USgkbJxo
 XI8E1MbRDse2+y3SeWHUOu243X62iw7OiMmTsL0RUfSXoTOHcpW79Zzf4HIFdckGdWvhfM5uyUG
 4rnLhcugy7OEn+TPZQIv4cTDJgtqlJ88gMYGcKE1cma/jLDvGu9ubsedSPSqW+19hk6AYctp/nJ
 wlMCceMDsuAyywWCQs4jyQix4RVpf+xxQNaS9eessMiyI2I2mngPcw7jrlxOng6/H6IV5mC2NiJ
 rqbNEjfGgJAUD+qGsI6q5R9/TQVL01J+lc0xj5QBODfsmdNZYFXZdyy5gCKR0kYT1zGkzQ7lrN+
 +YjpNrGU7SfAoEXZ7Nw==
X-Proofpoint-ORIG-GUID: Lij0QVK1Xxwewu8CIPEIkqwNEPH864f2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111476-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,euzvxdlmrhri:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCCBB64D2BB

On Wed, Jun 03, 2026 at 10:21:48AM -0400, Brian Masney wrote:
> Convert all of the qcom clk drivers from icc_sync_state() to
> qcom_cc_sync_state().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/qcom/apss-ipq5424.c  | 3 +--
>  drivers/clk/qcom/clk-cbf-8996.c  | 5 ++---
>  drivers/clk/qcom/gcc-ipq5332.c   | 3 +--
>  drivers/clk/qcom/gcc-ipq5424.c   | 3 +--
>  drivers/clk/qcom/gcc-ipq9574.c   | 3 +--
>  drivers/clk/qcom/nsscc-ipq5424.c | 3 +--
>  drivers/clk/qcom/nsscc-ipq9574.c | 3 +--
>  7 files changed, 8 insertions(+), 15 deletions(-)
> 
> @@ -249,7 +248,7 @@ static void qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
>  
>  	icc_clk_unregister(provider);
>  }
> -#define qcom_msm8996_cbf_icc_sync_state icc_sync_state
> +#define qcom_msm8996_cbf_icc_sync_state qcom_cc_sync_state

This patch will need to be reworked after adding a check to icc_hws. For
example, the CBF driver would need to call both functions manually. It's
not using the qcom_cc_really_probe() anyway, so it shouldn't use
qcom_cc_sync_state().

>  #else
>  static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev,  struct clk_hw *cbf_hw)
>  {
> @@ -258,7 +257,7 @@ static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev,  struct c
>  	return 0;
>  }
>  #define qcom_msm8996_cbf_icc_remove(pdev) { }
> -#define qcom_msm8996_cbf_icc_sync_state NULL
> +#define qcom_msm8996_cbf_icc_sync_state clk_sync_state
>  #endif
>  
>  static int qcom_msm8996_cbf_probe(struct platform_device *pdev)

-- 
With best wishes
Dmitry

