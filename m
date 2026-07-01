Return-Path: <linux-arm-msm+bounces-115703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iqq0GGIMRWp15woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 14:47:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCCC6ED8D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 14:47:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dBlKanGc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XdncNcPn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115703-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115703-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F2F130574DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 12:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B70481642;
	Wed,  1 Jul 2026 12:39:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CAD481254
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 12:39:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909551; cv=none; b=Ti6dn7/EMzUavTR4c4/XUk/ql5csOTQzCzWtaZWae5F9zPzkSe/OmXscXZDZNcQR3u81BHDzMLVmXivcIqhNJRst5sC1ayYDizyM/CpLxcyo6FF+V8CeURFzYV9FG1Ei1Z+PLg0CM/ndn3tQlky5SVTY5xbmYAf6n3Un8hk/NKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909551; c=relaxed/simple;
	bh=0ENwD7I9GShtPzLW/n5zRTNevETKuJp0EKy/3Cy5E4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyU+ZsKKL/BVbXmBe4WRbRVlyF9arKDzXIgx1nl1St2X35UkOcRBx5xeJqjX3g+gn9KkmwKX6gUzpmhEIJ+u0Th4RqiJ/2fcdvIxbJrOcphTTK9z5CAldsm/cfsolM5HIAiqG7VhV4xlgiBLOWVnqHdiaqpkZtSLELbKYarXNwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBlKanGc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdncNcPn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8qTp721951
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 12:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RElYUFyhVFU8ab/xOJ7WvztVwr6ToVtrUcAveEyodLc=; b=dBlKanGctWPIE2EP
	3xXkBKy/tSiYDpB+182tQ8OUA32fJ/34hGqIBcmQfiPqqv6dFNkqjOtEBHycEw1u
	Emoluvp6tKi3e8+M7C+ELCL//56kX/sjAPbTsSBfw8xB0YwcZi/yO3Go/puu4k43
	1kBLrbDCCoHY3pxPMFMpbrWe8z3mLFPFcKdghaKsv8PK/8Zhb/kG8PAecXqbw+xY
	HrKw1bK5AAjNq+EXJ4L5tQ1X+gJlFjeh4WhsiX+hAcoke/zPvWG2Dw3n68PwSclA
	u7utZUFdhAm/PnJMxqcfFloReOq5xLKr4Hj+COmLGwAeWOTB2Qdt92LfgNITuBAS
	M/oQ4Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwc2mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 12:39:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139f5f5eae7so2831982c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 05:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782909547; x=1783514347; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RElYUFyhVFU8ab/xOJ7WvztVwr6ToVtrUcAveEyodLc=;
        b=XdncNcPnMAvcQbljXs+D6VRhd7nXKxkbiD2XR7spNu24SEUIBr1uTdwrElDzIpW5KW
         X+OSKcX8XmXVnUs80uIhEhtqyvit+1WDl49qr73TiWjoEhuS6Om0kGvCUsYp0TKn3ziY
         s885+mbHpuLLGPL24vFddKHtHXoIBCg7LwFu/PBsCZpTkQci6HXhYJob7nvSC9EVjqCL
         45LG/ZSIcHu0UHyIBsnAdpVlDR5YYyncZULmPDtbidwWPN247UKZ1qqowythCfsiEoYD
         DBLdOgbcR227uLBIEruaQl8+DGc3w1YJ3BH7Eqp+fRTCpd1uhvF0To9VsCDyQfCsOa7u
         8Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909547; x=1783514347;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RElYUFyhVFU8ab/xOJ7WvztVwr6ToVtrUcAveEyodLc=;
        b=mgLV00A5jIKcyYeKFJsNi5qEZ4y4O3B2R2fvJ3emve0kL/lGIv0rP51C5VOUvih7HP
         X8mFxRg+N4UvKR6Ace0DI5veRaZDkMAjCJ1LpKvg7iXsrigz1X6YLz5pDLPl33fJu8cU
         94eBrHdVdtW2Zg7GveEnKMnoYWknuzsaciBbAtLh/EpO+ceAvh+6v4FWHdREhruyGjqe
         SytuJqkaJBJRN+GYH3jyhgPoDkFyr4g9b93cgxYCG7iXgD1ckHEMx81JajzKaKJrsZWL
         BZBOYIy492iBgJQ8rcdnbWZPpwXWSVOb5qVbmmI2zZg7u+Xo0XdN2SSFK72+cWImHMa0
         eIHA==
X-Forwarded-Encrypted: i=1; AFNElJ+LI7FGmrPNa3me39/9NkRWgtMe/UDaYFiJc9IC/dLWkWOdrSPHciT+ToDlgtB0YRBLDVNTf6KDq7URkSo1@vger.kernel.org
X-Gm-Message-State: AOJu0YwiPvv81wzpahrl7Nw96C78wz8/QPAHLD11CzJLKb9X8xK6DO51
	SSOjyfBQeo0zkVYbYrcdEJASYpHYji/eS14gO5G/lh30oviVaTYhswCxvsmHXbm13+hYqNmtsIQ
	4YyUE2Psa3g6gT4tCTskZDZPb7XqFmF6/NaseXRBjGwQWkRp9XANhYZDPAv+k2BeICZBk
X-Gm-Gg: AfdE7ck5kpMRM9IvYPOJmz449jCEVy02YdJ2k287M4pzfP6LBjdsjIgRTptGr3dpUrC
	ZQJlQfAjweIakesvpQVFRVogSyNY02T2pEngn83USJVT01/pXPWPgLRihDeAGdVtRifaPq5IWBf
	sRFYG1ZJHMn14QZn03BV8yS6y1LhN7YC7xkwuH9rawyz2raKFvPVb/uHYu/kjaGOLn4N4t/7y8D
	5k7matVYWEPllYs+p5Q9tiWcQPf++WzPdktlpRXb+InjTc0LeNMW2rAJbFydbFdwDpK21OLaFJ9
	N7+5zfIWSPzwemHjVuKAwle/EDU+0IyEWb2VovBlRCY2IAN7w+Q74H0PtAjXiHfTjx2OxiokT7w
	WsEGZj3IxcQi9VGyJHEDhpJu8DxrPm7dyBkiYGA==
X-Received: by 2002:a05:7022:260b:b0:139:ed5d:1b59 with SMTP id a92af1059eb24-13b36dd71ddmr1367953c88.39.1782909546450;
        Wed, 01 Jul 2026 05:39:06 -0700 (PDT)
X-Received: by 2002:a05:7022:260b:b0:139:ed5d:1b59 with SMTP id a92af1059eb24-13b36dd71ddmr1367914c88.39.1782909545720;
        Wed, 01 Jul 2026 05:39:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab0fc83sm17305784c88.3.2026.07.01.05.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:39:05 -0700 (PDT)
Date: Wed, 1 Jul 2026 18:08:58 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260701123858.4grcpqlv25k3r7mp@hu-mojha-hyd.qualcomm.com>
References: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
 <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
 <0e7a5719-9271-498c-bc0d-5fa76341ede7@oss.qualcomm.com>
 <20260629122248.yb5fe7rifdoowpfl@hu-mojha-hyd.qualcomm.com>
 <b7d6e7dd-afd6-4ca9-bc54-4533de6b663e@oss.qualcomm.com>
 <20260630063037.k47sbwf26l4fi5gu@hu-mojha-hyd.qualcomm.com>
 <174009b9-8be6-48e0-847f-a85c224fb817@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174009b9-8be6-48e0-847f-a85c224fb817@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yYtcZthdZKqPTo66BTmIYFq_a9vWWMqv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzNCBTYWx0ZWRfX/vx5J5IGQcK2
 bn1BAo5SbAo8sahpA+qoesMS07eN3lZ3ed7AB3B7C54QjNbNs1GKF/x+4QvYg+PJG4suSr4s/xV
 yr+5GXgnmfV7t6VQ810Bmm7lBJoazhM=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a450a6d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VSszjrxEkVDZzJrrQw0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: yYtcZthdZKqPTo66BTmIYFq_a9vWWMqv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzNCBTYWx0ZWRfX271SoaIyMOv/
 GMB6+X41hG1x0yfrJovBJ4Z/0lq4wYxqdlTE1TqxWNu+mxx3sglJhlnLoXnkykP/dTgMRoI2JRN
 2Qy7Ta6KnRLk2f8zTL/Np2AWZsi+6OwBbdHOiWnOeeYvOkIewZfw3FCvQX2Yb3dGfsGxqpfvG5y
 EOrK9G9Prx7sDR81lmjOtlLDSuRMw8gktEkI9xf7nIe6hnYdlfuWbukdx/TzrTzNdYMRbA8y0ef
 0ksMbenSjb+ky0v1L/Jte82zPZ+8IoV8/vXkUB2RfUeVV+k0CJvu769ymFe6DHD0jkxYXB/OeH6
 /tRQRf2PWW49WCnKqEIV1FudNH5G+CIsNWPJPXFYV4/LMVG0uZfKaJyVDJGMojsSPdixNwdnvQD
 JLvI2t3eI174SpDIkNsK/yaFerVdNbEodAT9QI3aGvHyLRN+ktoVt0vseqEZ6SrJXVcfYlXMRNU
 bMFde8WBdX533xU4YxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-115703-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:miaoqing.pan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FCCC6ED8D5

On Wed, Jul 01, 2026 at 02:26:11PM +0200, Konrad Dybcio wrote:
> On 6/30/26 8:30 AM, Mukesh Ojha wrote:
> > On Mon, Jun 29, 2026 at 04:08:26PM +0200, Konrad Dybcio wrote:
> >> On 6/29/26 2:22 PM, Mukesh Ojha wrote:
> >>> On Mon, Jun 29, 2026 at 01:36:34PM +0200, Konrad Dybcio wrote:
> >>>> On 6/25/26 3:14 AM, Miaoqing Pan wrote:
> >>>>>
> >>>>>
> >>>>> On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
> >>>>>> All the existing variants Kodiak boards are using Gunyah hypervisor
> >>>>>> which means that, so far, Linux-based OS could only boot in EL1 on those
> >>>>>> devices.  However, it is possible for us to boot Linux at EL2 on these
> >>>>>> devices [1].
> >>>>
> >>>> [...]
> >>>>
> >>>>> Is it necessary to redefine |wlan_ce_mem|? Can we consider updating |qcs6490-rb3gen2.dts|?
> >>>>> I have verified that with the following changes, *NON-KVM works fine*, and |wlan_ce_mem| is only used by the WCN6750 firmware.
> >>>>
> >>>> Is there a good reason non-chrome devices never defined that region in
> >>>> the first place?
> >>>
> >>> This region is needed by WPSS and non-Chrome (Gunyah) has IOMMU
> >>> control, maps it for WPSS during boot up while Linux at EL2 needs
> >>> to map it for WPSS in Gunyah's absence.
> >>
> >> Right, I'm asking about it usefulness on devices *with* Gunyah
> > 
> > Ideally, it does not need to be mentioned in the OS device tree when
> > Gunyah is present as there is no user in OS..
> 
> But it's also reserved (in the UEFI map), right?

This is device memory and not a normal memory.

-- 
-Mukesh Ojha

