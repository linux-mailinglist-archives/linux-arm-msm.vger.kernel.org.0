Return-Path: <linux-arm-msm+bounces-105832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCnzJnVj+Wke8QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 05:26:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4119C4C6235
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 05:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A00F830210F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 03:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE583A7835;
	Tue,  5 May 2026 03:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="giiji2UL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzwLo/v/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7E4318B9D
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 03:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777951597; cv=none; b=Y6ii0MxxohILJ1nThfD5ReCyaVBO4UYRd5THhyMEiVCDZXy/SipVbYETQweq3PJfFpzhePELUNrkJv6d8H7K8o3KNpRY5+0+AM4l+co/LIO0pmjWMzM6pFkFwse1HIBpK9a3Ay7qo52Z91CGIkvrd+pxq4rq16ALP2iukjtIGhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777951597; c=relaxed/simple;
	bh=H5BWt0g+lBHcqIDDq+DPw1/YSp22G7rvCg5jlFjVQqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOSJgkaL0JHWfD8d1pYplXBIzv2M9diPalWyPuecKKik7KRLVqWE/PghacA1Is11sezyjxKwpF9rZFWvQb8IJ+E2OsgehBxPr6hYBuO+60/OqZcSc0hY6PQZjy6Y9Un3tcyZELBhpEy7PAmlLOKMO6ecTKTBtdEnWYiXUdjlrWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=giiji2UL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzwLo/v/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64509XHm3409256
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 03:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0eb+03iUL2YtyQx4w6auTRUV
	x8sUnU42H8ebf0/4g3A=; b=giiji2ULCti+kcZmkIWWQDNp+8PmSiSolD1Ufk0t
	JUl7+HUNTEtcOIQRzte8ThEP4dkmY8w3INSW41CYXtRA0rJCsEC021UFBwYiP7ig
	oimMpEopWBrxJaG/1Lt1R+8TC09RfNrS6mnUQdi6bBxEpCBaZeJYKKL5JRFAOazA
	8iTHkjER2/fZ9NEs3XPFC8rTB871j8FBwEcS9MrzAWOyIIS8g7Ku7c8naK65QiHg
	d9bqBdyMvvsXJTwjji2aMiBM3uFmMgYAvy06yqHjoDSQlHSv083h35+3BcfSe6Ye
	SEnnSdVppcQ9EIvIDsC729aPe5ZTyhQXfm6cXI+80e5WXg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx00t5ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 03:26:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso43762225ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 20:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777951593; x=1778556393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0eb+03iUL2YtyQx4w6auTRUVx8sUnU42H8ebf0/4g3A=;
        b=bzwLo/v/lb3aQyUjXS/7J8VJqKilZfXeeOHP1rDGS57CHiXX5eMeKz1qe64sz1ufWi
         Qot7wHwrVyNg94Iq3L/R9wIIx0t7WACZUGE6veCYhrRj4jCphTPR+qJdaRQUiL9lqXHe
         VzbOMbcGxdNYOFNT3GtZ1CfvLXWyyQQt8gwQglm4hwF1Glb6GvL4a7h9TBVlZEeyutAJ
         XAPhPgNmBj3dAu8EroMS2qh7dewn9oqinsQwEoLvEuQpSxkUCSncJ8Ah1T9yUrOzNRa/
         RzBkjUIvgl7ryKi44s1P6ytp1I233nWKjqoUEpIRaKS6OBowhOalZV55qvIIxqq1a+6a
         kv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777951593; x=1778556393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0eb+03iUL2YtyQx4w6auTRUVx8sUnU42H8ebf0/4g3A=;
        b=Ak81A3n0hq1GPT5XjLSH0WpDikiajc/Gb1bADMlIUEEFG9F2Di/u6khNS1fSgKwWBR
         OcVnEJc8rUVA1QaObkf6ja5eBMWF5qLxhPKwhoNzgaoeOl5CBpFjHJ6bPeZJcpRfEPSe
         kqmU1g9lZG2FSj6MSphzBhuB4q89SmKttCtv0dlBCDSUTAadTGfOT0CXnqGIkukDlf0Q
         2mjrlZDTn1yON4inWIR4sjTIJpal4GUSyPIqcv12XYDkOS93xEjlhpHuMmFVWvPFcszp
         63bxf+dae85sha4zGuubBG5wkbxNqrP4AIJkztFWJzAwoO3ZU/N3PfjHG2eCDxLTpyhh
         LtrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3chyOz1uq+fNmoaKAaJoqIhw1UQ5Vx6/jY9peRbF4ABEROH11CUaS/iePxzEzOIM5n8HV72dl+V9L4j9H@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9HGdoPiQQ+ze+EnhZ6FJv1p8oFym9ppOEhoHEpO6qCJ+PCFH+
	mL8Krn3ShA+gtxeeblKDf5o9Dn6VxPL8JHk5rvm3Eb7AxY0jIKxEIyv8/J5ELCeQl0Qpli6IHqH
	HvQpY+V0RRUbu1BHmuBVy1P0Lq2u1ov5qfFy74jZf2goKMIdjtbKWb0QF3M1rU9FUX0V3
X-Gm-Gg: AeBDiet+nIPW5JWiUCT/D5/UNApVqTJ7VWblVsCca5wlAga5uNc9fLxJwS2L/PnrWdC
	Dp6TSFuG/Dyp4S9FmHn3OavyHE3XTn9K4A/vJYvy52cqKaskuVUBetoUpNtjgQ3k3xgCKfjh7CF
	ojW+o1Kgk5UJIFOFerbxOAKBzQ4U7usBvQ9iHFIVRg1n01QBybx2suE+NooJ1X18kMrrQP0bpT4
	CHeaTspmrXF34hUwztkKtM3GN3+/DYC/RumkF/z5X86RobIG+MKdOsUFh1hX/HyPcSs8wxKlqdu
	8pP6BXX7CTSWyErkS/p6NxLnFc39ZvzaRmT71NoufcpRG0w9NEx2YMQdroxrI0CHGZ4JEZOZmXm
	Q/dqx3TIeBHSlzLdN9Lc4C4KI7cRDQ758j5DLDglYp0kmbsv2NHqOsFyygxwu+sSF+w==
X-Received: by 2002:a17:902:e545:b0:2ba:22db:e1e0 with SMTP id d9443c01a7336-2ba22dbe33amr59277145ad.10.1777951592594;
        Mon, 04 May 2026 20:26:32 -0700 (PDT)
X-Received: by 2002:a17:902:e545:b0:2ba:22db:e1e0 with SMTP id d9443c01a7336-2ba22dbe33amr59276945ad.10.1777951592039;
        Mon, 04 May 2026 20:26:32 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae59f57sm118554935ad.77.2026.05.04.20.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 20:26:31 -0700 (PDT)
Date: Tue, 5 May 2026 08:56:25 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v8 2/2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <38fbf5da-abdd-4951-90d2-941f7cd62299@quicinc.com>
References: <20260311-gunyah_watchdog-v8-0-4c1c0689de22@oss.qualcomm.com>
 <20260311-gunyah_watchdog-v8-2-4c1c0689de22@oss.qualcomm.com>
 <acqEc_urKggA5s62@baldur>
 <db85ddc1-b302-45f4-be26-f835c63ef069@quicinc.com>
 <f2386cf2-c790-4ce4-91ab-115a29399e25@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2386cf2-c790-4ce4-91ab-115a29399e25@roeck-us.net>
X-Authority-Analysis: v=2.4 cv=APflyhIR c=1 sm=1 tr=0 ts=69f96369 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=_jlGtV7tAAAA:8 a=W9u3MqBc-PvxWcKrJdIA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAyOSBTYWx0ZWRfX5qVMlvbF2gmp
 jHkFyEReZsRBBASsosj/G2VYHSOxlIpk4kApOTyEcEPpgwMEiEEJMWFgzEXeTvKSdXfeEPGDhqr
 178VgxQj2ieVYlwcX48DMseB62C5BHBsS719dv8XPkdEiIVq+n/Qs52c8AzlLvpZsccWraYe6DC
 gS6fjfltbZOOf6OooVBwo6lYaLe+ftegWbcDrhvxUDAaxGTTtfKFIKRzS70vxD8vQ/uGG271ECe
 TAnR+y3P4p1NtfO0xeMt5QH4z9/4BBW/Zdzei3XXXNnzv58PyLIChM89rv0VSxFBTlYMV48MeDH
 GVitfQQIn8m49x8eiDFF2R8Avkpklc3w/69pn/9IFEpffTr2OWxdxiiE7XLuqtb1j0j+gMwlsd0
 9au3M5uMqfcCkAHNajULTAhpFlLK+KiHqdwwtYdHsSeUB1v8ktLH7ZcNAw+veEdkuEi/pP/ODGA
 qjczXrSj6Ww9eWTs8SA==
X-Proofpoint-GUID: UXDUbAFyfkJ00ozE7mjPZ8soZ9mpXEAB
X-Proofpoint-ORIG-GUID: UXDUbAFyfkJ00ozE7mjPZ8soZ9mpXEAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050029
X-Rspamd-Queue-Id: 4119C4C6235
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105832-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:mid,roeck-us.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavan.kondeti@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Thu, Apr 30, 2026 at 07:37:12AM -0700, Guenter Roeck wrote:
> On 4/29/26 23:15, Pavan Kondeti wrote:
> > On Mon, Mar 30, 2026 at 09:11:48AM -0500, Bjorn Andersson wrote:
> > > On Wed, Mar 11, 2026 at 11:16:31AM +0530, Pavankumar Kondeti wrote:
> > > > From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > 
> > > > On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
> > > > through MMIO is not available on all platforms. Depending on the
> > > > hypervisor configuration, the watchdog is either fully emulated or
> > > > exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
> > > > Specific Hypervisor Service Calls space.
> > > > 
> > > > Add driver to support the SMC-based watchdog provided by the Gunyah
> > > > Hypervisor. Device registration is done in the QCOM SCM driver after
> > > > checks to restrict the watchdog initialization to Qualcomm devices
> > > > running under Gunyah.
> > > > 
> > > > Gunyah watchdog is not a hardware but an SMC-based vendor-specific
> > > > hypervisor interface provided by the Gunyah hypervisor. The design
> > > > involving QCOM SCM driver for registering the platform device has been
> > > > devised to avoid adding non-hardware nodes to devicetree.
> > > > 
> > > > Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> > > > Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > Signed-off-by: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
> > > 
> > > Guenter, there's no build-time dependency between the two patches. I'm
> > > applying patch 1 through the qcom tree, please apply this patch through
> > > the watchdog tree.
> > > 
> > Thanks Bjorn. I noticed that 1/2 is available in v7.1-rc1 , however 2/2
> > is missing. Guenter, can you please pick it up for next release?
> > 
> 
> I don't send watchdog patches upstream; that has always been handled by Wim.
> 
> Guenter
> 
> 
Thanks Guenter for the reply.

Wim,

Can you please include this driver (2/2 PATCH) for the next release? Please let us
know if I need to do anything else?

Thanks,
Pavan

