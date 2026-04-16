Return-Path: <linux-arm-msm+bounces-103413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFFILB/k4GlhnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:29:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 144DE40ED31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBBC7301C59F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0983803C4;
	Thu, 16 Apr 2026 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuPD0ZuY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2M8C4bm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B14282F13
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345700; cv=none; b=PblGGX89EmV1yuGax9laFr+K29pYFEJJtZ1kLHq0p6u7HJc+c8gXBc00h+h/FPMoNrkbgC5OdZknhwY2SqaO1xUOicKH8JVcNuCEQHMTlphg8EJuDvgmSB1UjKoYlpRVBxA1yy8wbWp6lIPjIrEalWQOgJHzgapCVnwgJe5PUcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345700; c=relaxed/simple;
	bh=6hLaVwNU5sfu64nZwy8wbMblTFiOkzb+gUEkEnXMe40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYGAJjREaJegDIAsxq4DJFDIx/5Sw5iBNfJKQ+RxdFl7LUIgKL1V0OJHa/4hYLKTyPSymLXwD861eY7tuGC5UNWvC/nW+c4GUI28LVUcNHjaMUsfc50xdJ+iBBOhAHD8lRxbG9N/BGFMuJ7F+fhDyVYb0w4F82pyAs8QURz+N7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuPD0ZuY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2M8C4bm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GCOX3S218759
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SNN6bJZb5T6JRttooEykeHPt
	d9OBGWMgLZQx8AqrSk0=; b=GuPD0ZuYypeZH6EDx6nrFTGQXLg22sCXxHRatYwW
	/qOb6RGLFfZgM0S7Lvp/tH4dy4aAk1nxaH9IGaruoY1tJdeyUsCSVoZGKDiBrXTa
	r1MzoqopM841xwU2boGQZ6Tvo1UIIJjEpMMnNpm0wUzLgDsyyn2LAMLiNcyaja4g
	VM1i81mkOtMEwg1OHGk43pjsyfla1CRMC8qIwMJPox9uH9dBpybhuqhC0jqVD6Tl
	wb3oLazyxV1r4955hZzcuu6wDOlLDKGD+dA7A+fXHZNZap8SkBW9uVWVy1MpEihg
	ej7aTT0I4tai3/9d3PF62kGbr1EC5GEwypZ1aCIBS6PUQw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtuyhbfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:21:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so78220395ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776345697; x=1776950497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SNN6bJZb5T6JRttooEykeHPtd9OBGWMgLZQx8AqrSk0=;
        b=E2M8C4bmygYRvEi0RuG83sCVS8ZJ5Qe5tUYIOMLoE9Oca3NkLtz8iQAMNpC4wOa+4+
         +K9nj0dGB/0jVKgEOdi4Qnng2Tj7bnS4qRA05e5AtKx+4K4lq1ff+a8VJi6bBrc6TPyT
         z8rb3M55pSoVhRDgqEdMoE/9YPanWILfiyMEfrm9KJXlNRzYxXqxEIUcGBNvudIvOs46
         pw00Yo5M+OMMKjtku22G501HNf1PLlcwuTmE/yTsl9MUkkJCygv1Q7Uvn3qtUac9eeL+
         p19eXIYpnUp0Knli0JbcPzfNZFtfOpzy8TxXEBoYQvCwFgsDYEVuCfhjXpUgGH/xiy3/
         wmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776345697; x=1776950497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNN6bJZb5T6JRttooEykeHPtd9OBGWMgLZQx8AqrSk0=;
        b=bToPHaRIa/24oPXA8H1C0mhbbp80Z8HaNlJYUB8xHCCu8EVPBEZTX7sKxk3Y0nmxlw
         0Z/1p3AZNBMR2HXHm3Vw6ojiXBy9hOwPPnB4WTA7EhwWx+UclnvgUIfEiqYpyCoiZOJ0
         /CMflDLEZgwvS4Kqmw2CqmKycaZM9tlsJgAKC6ZPgaX9y26KoKs2JoVeja7cJcU39+F1
         /9q89l7jaVxgdREoHxIp6sKtDBssuhmK8rH8gE8a1NJ1uXQGivka5YWSROQ+uEKXxwzj
         Gk8/l3HqweTv4wGGOlEBwVxtLRRXMr4aD1t8jOq7P7em3/Oc8di7IoZg9rxgaqcz3bU2
         KyTw==
X-Forwarded-Encrypted: i=1; AFNElJ/kBaDg9yyODj0/BdYACDO9ZtGQXZWjNWHKd4FKRy7x8ayKzYtwhxyNJvVMPxFRABnIJJgB5qj6/TqOz4jc@vger.kernel.org
X-Gm-Message-State: AOJu0YxlcO7FXf2N6CiN0kCQETp0YmYjgiUibJefXHpy7pvoLBXzhvoc
	xHnoU51B6Ywa3mrJvA3Hl6hQ6iiihOw6UMM6KRuEGFxjyhYNoWYAWIMX1i6w9QddCp23inOcULt
	oRTDby/ttRNQTrRnSYmQOlqphQ4zL9pT+3Z7WmaRIfIkCfjRPVob93hAwIcFCmOMWP4kO
X-Gm-Gg: AeBDieukpP+8OZ8vUvgT31wuEi4x15wecJ6DULoqyTHmLKGZAUJAonkinKgkl+Hd1n7
	WAH6UhupKybFH/ise/WwOGYM5N15n1ZuPYWKBh7KvKSun3JOPI/niAd4JvRCnCuaCAyU8pv8Sj0
	qEnPpSsXP1ocqpwLlCDz97TCGQ22VVnhz865oghh8rT22Twsk5bViVDUN22yxa4JOUWhV+qZd0C
	qpnTWjzNGjIdR/UGxVI+GGoPmlIQAkmdkRIV9Qb+rQ5xDsmZtDM/uusLbh4FHvdXxhj2GM9AdFG
	1bHzZic8DfBqrMZok0ML3HsVJNrYdK8aFEPFp5OXkeLqI5yhHtGYtFA+b575u0+VTMVvrsdVG63
	bwl/rs8nwCyLz+YHSveY4Xn/taj+MoVO3FR+9J6YCjbC4HSfXqByvfaRS+JjJ
X-Received: by 2002:a17:903:2cd:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b2d5a5b40emr273960405ad.32.1776345696793;
        Thu, 16 Apr 2026 06:21:36 -0700 (PDT)
X-Received: by 2002:a17:903:2cd:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b2d5a5b40emr273960005ad.32.1776345696240;
        Thu, 16 Apr 2026 06:21:36 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782b2d0asm88663755ad.72.2026.04.16.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:21:35 -0700 (PDT)
Date: Thu, 16 Apr 2026 18:51:30 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Gurbir Arora <gurbaror@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v2] remoteproc: qcom: Fix leak when custom dump_segments
 addition fails
Message-ID: <aeDiWu3EIZjb/ZUz@hu-wasimn-hyd.qualcomm.com>
References: <20260318-rproc-memleak-v2-1-ade70ab858f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-rproc-memleak-v2-1-ade70ab858f2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyOCBTYWx0ZWRfX5mg+3zpewA4A
 /0sFvs/HmrMS9MkHvW7AuXHz3rgZ/v79cQc+meuchdeCwa+FZgCyaL73GPLqF3BABiH7e3JEsdg
 ldtMairkCw6PMFRHTd5/4KrPCaDBJLiLULCMvtBMsdvGkXXPAsOIAlUH0fOLOvQpFbNUv6VopbC
 TXX/z5DjX28scEuGVWWH6zrG6RkUVOxSL2MNOgHetos47EYNJxPgXiplbuUD5tLjk4ytHAve4yb
 IZXxV9WHO7A2iKTrv8uw683NvOGHUjfoFZzQ5MJSn9435TevG7mRXG1wMDHQF+SPyHipw5WoTh9
 0SZpiQZTExbUTRvqfnrrjiYdr8oH0WYg0e1pl9iCEnk1m+Q8kwFLdFSHGDwUy3sFRbonPpDwWKd
 VWdNurryobsBfKwv4gHCmS45R7u2GnkE6B+Iav61oirakDHH3Dy02w7evMEY0wKfH9mWqhPycwZ
 08wE0WxAc1XevxjAHQA==
X-Proofpoint-ORIG-GUID: vbHMT0_akA2GCLbHicaxOlfRsikdMImw
X-Authority-Analysis: v=2.4 cv=Ipgutr/g c=1 sm=1 tr=0 ts=69e0e262 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y2km3Jh7R0eAzGVYxbQA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: vbHMT0_akA2GCLbHicaxOlfRsikdMImw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,hu-wasimn-hyd.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103413-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wasim.nazir@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 144DE40ED31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 05:19:16PM +0530, Wasim Nazir wrote:
> Free allocated minidump_region 'name' in qcom_add_minidump_segments()
> when failing before adding the region to 'dump_segments'. Otherwise,
> the 'name' is not tracked and is never freed by qcom_minidump_cleanup().
> 
> Return error when adding to 'dump_segments' fails.
> 
> Cc: stable@vger.kernel.org # v5.11
> Fixes: 8ed8485c4f05 ("remoteproc: qcom: Add capability to collect minidumps")
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
> Changes in v2:
> - Add fixes tag in commit.
> - Add stable mailing list in cc.
> - Link to v1: https://lore.kernel.org/r/20260316-rproc-memleak-v1-1-96b1518a1a61@oss.qualcomm.com
> ---
>  drivers/remoteproc/qcom_common.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

Gentle reminder!

-- 
Regards,
Wasim

