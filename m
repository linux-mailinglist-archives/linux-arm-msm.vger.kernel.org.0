Return-Path: <linux-arm-msm+bounces-117971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O4msInmZT2rHkgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:52:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E687313DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:52:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O6rS3nmz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Up5ENYkC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117971-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117971-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33D0E319C3F5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E1442A7A9;
	Thu,  9 Jul 2026 12:36:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E32422546
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:36:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600596; cv=none; b=oVWx/E5/iR8KlTAobILlZBf2NUtNhRtS8YEcIT+WP8oojvyzzufpVXN2EulICjVAKpKqcMn4f1ZznlgLHBScIEF5mP2vceGVfQsPas8MdPX0U0H/Bvya3Xg9IPdoocxtUm67aXJ2WLKJvzUF8Z1ecM6qtY77SNtaq31w+Q8K8Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600596; c=relaxed/simple;
	bh=PJuxOpwcgtdLiaZrr0e0nCoZUr58X/RZrSYwAHqnnYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kx38GZbghzl/+i8nFOVMrnmNCKevYF5poEGUFsrtRZgLBYhp5wYW0nIxqBHEq5BK9AP1kydINqd5wLZ0xZXzzzf7r0UrYkGRaLB+iVAegOtaGhGz+T8dUXxCFmMGxEhA8DHqSFHR1y2MQvNREbino3foFckKQakyKr8ZpZbs/lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6rS3nmz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Up5ENYkC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNHd31669195
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xdIlinKU5FAEo1uLB0/ZFmCi
	ZXJJuqBJRmfImIhYZg4=; b=O6rS3nmzmgD8yWcpWDYlUrD+K3ETcv5guS4jJMxv
	IH51cSRFJzGGlIVGmmobEk5oxOwMaTw9tO/SisKZGqLb14ywsBupLEUt30A+3Txt
	GywaJJvLn6jjQ4qrJggqIUcfaUJIPAIeeDg2dsRRtqMWgxZempBAUfO7WxynHPSV
	xyyqhp8bJ/pVytzXP7aUwdGVx3o0CMFTaqs5CNFU4Nqc1ovDgGLn5kTwycyz3G0m
	cVJlQocrPSmRQThVhhH4X4dFEAElebCCvJT/G/R3mwt9wDIt3pYTDa6eNVoYIZnO
	w6pJkt7Ul3XRSIzsoFKgyBXdC0Kyd+jouI/A+sJJUU9qZw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418j54u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:36:34 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-96927e59ae0so881847241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600594; x=1784205394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xdIlinKU5FAEo1uLB0/ZFmCiZXJJuqBJRmfImIhYZg4=;
        b=Up5ENYkCIYX0mcxomyv0/WqxYmvdPPRwO3yLhKk/N2auOLwTGDsfR1rKImMMd0rcAY
         s5bO/X9mXAxfHBoey1oLbxd2E8mozTNWycEsMgJxa06sMdz5xWyRf/IThl+WCqox1pUk
         cMCUdZp/IUHMMu2BNTyYRErVYzZ6ocenpAdcYxSjLJ5w/RsbLFamMU+wOHLB7FeKC2Vr
         GI0aYlYLgf5GHx0jRjOkOvZ1VcgjonO70ns627Zeg7I9ywlgiGr9OAuatfWXUunc+BkY
         9NlIOvtK1GPH+3s4efKEccG5QHHEH0bohN+WukraCaH0lWCJS8Yo49EKDfZrxdCcXOxb
         3R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600594; x=1784205394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdIlinKU5FAEo1uLB0/ZFmCiZXJJuqBJRmfImIhYZg4=;
        b=kbPp0rlo4OokzYcYnASPGOUXVkUZP34u1MbrLcI8lcYE2/iT/h+YJ905IFCpqY6q3y
         Ml39Z40+4J+bRJd+y6ofYp8jSE+U4G1mMFtvyXVlNnEUNSiMdmbg2bDPQfSlS2MSFG06
         YV6+CaNRHZZR+H99JrGgLEITCij0O08Y2MibqSq07kxfOZlc6EykzgNTe5y7f3YFMhbd
         6TiSGH6mMZCsGKS7Rl1tmc57lyrzumAlWaykY1nHuXg+ETFbxRL/UD1WxEuLFYSX3c6r
         a3Ne+Auh+LmId3so7dTIxQS9WWy9iOa63j0b2YWXhIruqg6xkBwF9MZ6gTLa2O3ThSPP
         4K5A==
X-Forwarded-Encrypted: i=1; AHgh+RoRpE2K40UDEvv7M/RngwK0qmhHHHasc2evgaxccv+fDkub/5uUuVM9Vztd8l9jbPuAVusp9iyEnr5x2T4p@vger.kernel.org
X-Gm-Message-State: AOJu0YzJt730t/yZQF3E124Gozs4V5laPq0gM1AmqNv9wbzePSPoRPRF
	YfyLfjUOIcqSnL98LUINrHQGvKSP/YqjmHuJt2wNFqTCPvT5RCDLVkhTDkrGAncYbjPfR2jlhQl
	98MV7AIZmUULFX1u6uhP3QJw5P0kT+vNm+euqbcmDkOxISBAnQRo/j8Q9laZVU7LKsI38
X-Gm-Gg: AfdE7cmsTvtVxzeOB07Fg8dw3iDb/Mv5GnaFrOH+qp8i1YR6LYYSfOovKWXVvy+n4Zr
	HDB2RJwePtr+yQE7Z47pShSvpJQHhvDT5VDj7tYdlAlTwNWjElFwZpiP1JTFvs+PkoHs/rZqfPv
	zbsvkJ4aYvuRdKBr2+/2d81THYZdMHZlaU3bpaunYzfiRTLo6QYOEiKkh0DTNMPGSgakj2PYAu8
	S7Z940YrJOHaj2/YvryQtw4eGPms7DmzUwFUUm7c3Cf7EpeNS3wSkP0tVQztWQ3rZGPgp1jbUwn
	nBSjrwLgIW3R30bWrCW9njetx2v17qzjVosCK4xpw4QufeL69+JUyzhPfb2U43AWNrXNBNbTKB3
	MeTaybzGoVfpSSvK9bmZPPZVJDO0XzBO1eRXcOOiL7pgA+5JkmkWOKuqRpDAJd8CrPIh2COE7G2
	K4IGh3wkgIzQWVV3Bx+Mt50Sae
X-Received: by 2002:a05:6102:370e:b0:73e:9fae:584c with SMTP id ada2fe7eead31-744e005ea3amr4369267137.19.1783600593430;
        Thu, 09 Jul 2026 05:36:33 -0700 (PDT)
X-Received: by 2002:a05:6102:370e:b0:73e:9fae:584c with SMTP id ada2fe7eead31-744e005ea3amr4369241137.19.1783600593007;
        Thu, 09 Jul 2026 05:36:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b13542sm3154271fa.11.2026.07.09.05.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:31 -0700 (PDT)
Date: Thu, 9 Jul 2026 15:36:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, abhinav.kumar@linux.dev,
        freedreno@lists.freedesktop.org, jesszhan0024@gmail.com,
        linux-arm-msm@vger.kernel.org, lumag@kernel.org,
        marijn.suijten@somainline.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run
Subject: Re: [PATCH 47/60] drm/msm/dpu1: Convert to atomic_create_state
Message-ID: <vvzexupy7ptk6hqq5vkh5mhqh5iv7doplnhsjsf2x6xuimlav4@457x6ummsmcn>
References: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
 <20260709-drm-no-more-plane-reset-v1-47-302d986fe5f0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-drm-no-more-plane-reset-v1-47-302d986fe5f0@kernel.org>
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f95d2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mVv-3nkEeNymqhpJ9RMA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXzlvvLPl4rF/q
 O638zffKL0lNoW7DPv8lP3jkAS79TIpo28XqmXvl+lLkPe2/5+7HnLCkGbbP2rhBKYVAedDVmKa
 a4M+EXiBdZVn9h7LflNtgxOGeorMAP31SExz2IQ5bZ0+BwnNoE/ZjI7Y9Z2RqqLfQwXXiOeZrQQ
 02F28cZJwPWThwjn3qjA/UfPSjMWNfk4cKon4101QLtKqvMMw5Am/b9d9DRx+/Ty3+qU1yMmBC0
 KcD6aJXGeHAKpiRXMzGkIe9WK5hkFT6L1yRTb6BdrLWWjo0x5fdcfMSn5D6VUgctY/08i/XPG0k
 kOhhlP/PckZ7/2AX1P9EMhh6ek842VAgKs1bv34JsPdQ93ibQNh/KIRJQ12bAMYG0lQkIO/RyDI
 w489wh8SxndahBIK1qygd+eg4jvoY1I71bfMM+wADQKtuWdh/5Q0GJWSfDPwYqZrGfVN0/PRd0N
 dtM4CJNAdueyOn8g6/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX10he0IuX6Ma/
 EYAjuyUKX/24sAO/PNK8EG+bRlwuta9tuFyaM0Gx3cMFiHJ3wzRoErtsWiQPaHMcRsxTc31YFMI
 wCpu1f2amFjDBdRyCGvIi5uiwx2Pplo=
X-Proofpoint-GUID: zALOBNu7xcfz-wKzzdf1m9lGzLMXltkM
X-Proofpoint-ORIG-GUID: zALOBNu7xcfz-wKzzdf1m9lGzLMXltkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117971-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:abhinav.kumar@linux.dev,m:freedreno@lists.freedesktop.org,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:lumag@kernel.org,m:marijn.suijten@somainline.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,linux.dev,vger.kernel.org,kernel.org,somainline.org,oss.qualcomm.com,poorly.run];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,457x6ummsmcn:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10E687313DF

On Thu, Jul 09, 2026 at 01:51:13PM +0200, Maxime Ripard wrote:
> The plane reset implementation creates a custom state
> subclass, but only initializes a pristine state without resetting any
> hardware. This is equivalent to what atomic_create_state expects.
> Convert to it.
> 
> The conversion was done using the following Coccinelle semantic patch:
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


Ack to merge it through drm-misc

-- 
With best wishes
Dmitry

