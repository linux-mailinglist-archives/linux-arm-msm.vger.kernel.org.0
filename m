Return-Path: <linux-arm-msm+bounces-111981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mLxfFFE7J2qvtgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:59:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE96E65AD61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:59:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kNRWWdpj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PfA2t9Ry;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111981-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111981-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48E39300D363
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 21:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0213AFCFE;
	Mon,  8 Jun 2026 21:59:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328E63AFD05
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 21:59:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955981; cv=none; b=J1hkTwpxETK4pEjNeBcO156ZxlYuH+R4KdDkhjBUqo/1UApujAru+/NgEGO5jrdC0eV8RoiWQTOmrDXOGbOWfcnRtCJk6LRXMVkEwsiAFWbJm4zBj0gsNQXgr5PknjHlGTQGxiePMGlrsEblJoGqTs2gdsHH0Z1WGNwDdvocAEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955981; c=relaxed/simple;
	bh=ax4ze0UA6/4H72uOViA5/ZcefxNmngv7b357bgwEp84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tgeg8NGTwQH/OLXyJTD2vfqhTHCSbQynQO8mgTYWPce/wxMgGhM759Hg1+lH1LUGB3f2vLgRM29cl85EHbTOMcuACo6bbFEb+ihGL7zYu/XSRuZyma38LVzXCsAI++Gn9g2bGobDRtrsdT8YuHYVY4DQ74/yr3zXwstKLLVY1h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNRWWdpj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfA2t9Ry; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IwaqR326817
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 21:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UKPBCuEZf7xYMnI1PmVPSJnd
	4ME8IsBzg3bGxfYN/iM=; b=kNRWWdpjEdfvTcgCQCouac0FPlvw3COQeV4zwpCL
	VAyiaMo2oAuQDFynGHR5C7y/GXmgikqrpiJ/Xv8OP5GN+6aSAnM+diY3MX9NoGyn
	k9J05kvnPF3zwN85YmKVEMcU5XpMJnhcmPXKkPHJ7ufl/hBAHM+AGAWu1HutgDRp
	rc6ptGuptQ586JQowSIWrTeFGoAchx/36Q/V33bm6NhMxAyvCdmu3PQCwvKgFGX6
	UdE8izwk5NcZlUIfUunH5pH6QBFhzrkVvCglpZpyajuVix+fiOc9EQ4LS9Uoq0++
	vQfS+BEAm3oKcQW8Vvl/2P/egzKqZsBF09ljeOXpRUz7Aw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8k4pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 21:59:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c1e08848so66038865ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780955978; x=1781560778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UKPBCuEZf7xYMnI1PmVPSJnd4ME8IsBzg3bGxfYN/iM=;
        b=PfA2t9RyRY5VGzosJMwalPBs4sXhkS1/Mtimk1WEgFpOMU8iumsrg2xlU0C6w9Mmge
         locKe2HjgKrMH5fU31uKo+GpZ4QY0sNdqeHDn6V1RyQ8TtzxE6IxGCrMctBWTUAYffaW
         N1OKv+ixnLmXUKhzke9SPrnp5sldCryFBf/S9hqxxI5dpqHY6w+ybdkMYyhsOLziSm7t
         dCIeTT6HhWHc2jLyxdcvczcZgyLt4dWfUy2VADRBnFxmlyzMf55cdcQIyfiEPPvYoOKh
         7adbhUDKMDMl+Jcxv/7qFba98vycEWWUTGWW6gDKM7MgxoaYtH3+Bg1znASDDjNytqte
         IRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955978; x=1781560778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKPBCuEZf7xYMnI1PmVPSJnd4ME8IsBzg3bGxfYN/iM=;
        b=ncOHKEPpMh0NWdmnoOLsJBl5NWcT+JcXfPD0GSZBNzeU/RMd4Xp2Fa9q1om++UGtLV
         ydRAz8lk+mcoMSm+ErJkZMhVEiubVkHTsYi6htN9Z9W4dIZ8Hv0QAeHyAttkhwsl3ZYS
         bYHZMBsKj4L5Pf5GiLzjjZSuM15QdT535vR0CK6klzPAmCFReBC3O3cfyOmc1qaiIrtG
         7HH7yBNYT5z1YWxnXmt3rKd1UKpCmTMNXmSZldQ+iwUFHU1p9+h3IFAp8P+X1GPUKWyY
         UOcbCZ5Y3IK//eWAVEyRVEOovbC4LT5TEqDUv4hfZAecf+zUUnN/GibT4rMgQN/Zu8t5
         vaPw==
X-Forwarded-Encrypted: i=1; AFNElJ+XuMZJcAh/m9nAfgZgXtkTY4W4OaHb/fq4F3VxRtDinqlQhOiOFbN6+YbSpHqoaKSkkU3fNeyNoWm22Tyv@vger.kernel.org
X-Gm-Message-State: AOJu0YxWatQiqM1cI1GYvd/H/IeXAIqFhsZgnSGeOLnOx+17SI7odtqv
	M2BBPCsT4cESjH80pZf83CJ0mTEDwD2jEMtOc9qzv9YKoOH1MfuAREimouJblVrdbtvNA0UK0Iw
	g19/jGe/wdB1wyBxZDcQ/aUqGV2IDV3s8vhn8gaRGAkooYeCS11d2Ptbl0zknHSTKW6AI
X-Gm-Gg: Acq92OFC2VOZU6V6eXiiD09JSecUy2kDLswzwOKw/zXgC2rncHZLGDnxr7lya9o+4zy
	2cVyuufIQ+N2tA730j+xdHHvkC1pdb03ikOB5G85WJgbIfUle3lvKeEwVj1uK5mHR/JuPOz03pI
	Hpij7qtYDE9kSBPF6olHJokRCP1Z7iF1pMjQdlSCUrrCmx8nGkTStk7OZIufbaiIDkX+xBgEZl5
	Y0kl7TakGO1X69TLz21HM+51pghBRiw7n6B+gUgYQp/N3Tz7AGkpCiy7d5saiKfQblbbZglnlYf
	MGh/QqhY2f6lfrijfDXD2MHIfRIPwcm02f2NiKRRb35eGyFEXDvOYgm+D3vnZp/7GVAZnHy+3xn
	evhjluD5cqgxU/IBbtBdumjArkmyl3CAd4Fa7i7L6yfCDuTJfEPrZIICjyxnYzxFN10q5+Q==
X-Received: by 2002:a17:903:22d2:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2c2a1cb92f6mr10575ad.37.1780955978168;
        Mon, 08 Jun 2026 14:59:38 -0700 (PDT)
X-Received: by 2002:a17:903:22d2:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2c2a1cb92f6mr10245ad.37.1780955977683;
        Mon, 08 Jun 2026 14:59:37 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f9ed6csm194052205ad.31.2026.06.08.14.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:59:37 -0700 (PDT)
Date: Tue, 9 Jun 2026 03:29:31 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans: Add OPP-table for ICE UFS
 device node
Message-ID: <aic7Q2utTYrqXr5a@hu-arakshit-hyd.qualcomm.com>
References: <20260530-add-opp-table-for-lemans-ice-ufs-v2-1-2b46d3ac37d5@oss.qualcomm.com>
 <b56341c8-eb31-44a0-9385-778b5d24ff36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b56341c8-eb31-44a0-9385-778b5d24ff36@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDIwMSBTYWx0ZWRfX4tYkOswhqGYI
 IuQTjqV66MbK2PPhnMypGWFEHznPpDKHGLOHdv3+gWU6anyhyo02fr+mH1brA54tqFGAB5S/C6A
 JRKFrCJtu52/XTeVDDOrnKF8bzORrMfkQkyyzP5JqY74E6f5fJta1yNxUWigjrTKnhKD3Sl5adP
 4I6RfZ4BOCnfI73A4gJ3+TI+zFAS2/BCk3kquFp9YSpdP4+4HhJId+OHPZ9g1gwjaBGg7hIWVKY
 cn0tRZJtU8XlQPVGWddHW39HV3JArKBtV0OOa6sZ5/9X23Py62sTH1JLdrXOWn24VYQQk8RN64f
 M6JimzDy0RJCFji0X7G3wtvB2VUsqLgy2Vdd0Pm8IHDzOhqm4LVly9wcTpeHPtt+ahTGm/ORSnc
 ApFq1G0F/88xZj3VLaoUOQsklH/oCFgA4hw0t/uollPdKEhNUCgUig3vE+WMvBeqJ3vmdlBFj2I
 2Xvu7aRPnRFOicwQguQ==
X-Proofpoint-ORIG-GUID: OcVaytk5fusyl-ubkvJKtT5AlImQSHou
X-Proofpoint-GUID: OcVaytk5fusyl-ubkvJKtT5AlImQSHou
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a273b4b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i-L58Xp8eqOkf6jkiZYA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080201
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-111981-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-arakshit-hyd.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE96E65AD61

On Sun, Jun 07, 2026 at 02:15:38AM +0530, Kuldeep Singh wrote:
> On 30-05-2026 01:57, Abhinaba Rakshit wrote:
> > Qualcomm Inline Crypto Engine (ICE) platform driver now supports
> > an optional OPP-table.
> > 
> > Add OPP-table for ICE UFS device nodes for LeMans platform.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> 
> This patch still needs patch-series[1] as prerequisite and cannot work
> standalone. Can you send this patch in same original series just like
> other DTs are updated?
> 
> [1]
> https://lore.kernel.org/linux-arm-msm/20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com/

Included this change with ICE clock scaling and posted new patchseries:
https://lore.kernel.org/all/20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com/

Abhinaba Rakshit

