Return-Path: <linux-arm-msm+bounces-116339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L93sEirKR2prfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:41:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4915970385D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:41:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M5zofz3x;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CGHE48j4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116339-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116339-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91B3A3033EFA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 14:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C9F3EEADF;
	Fri,  3 Jul 2026 14:35:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105832C3251
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 14:35:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089348; cv=none; b=dydga4Tk1jcM2de+dz3lIATw5O/YejXCpFAJpFSek8NmPnrN6skUsGvibPvZItLHQl6bFUWhvARmIpUFvdA0GufpPq5DNBC/lKF0pdNE9S/0WvFl53x7UuEekYfgJteUsxAKyHyh15ldJolrSa/CjHyYDBw7tyVZoWZNBX/NyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089348; c=relaxed/simple;
	bh=HgFi9QVMBwNzib44gHGEtsz5RXKusZm6n4tj8Jo1pF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyYsUoves7ekwwGSo5clClo71ugMNh60x+hlXrJ4okwGy2bINUixZUTvYIsWsg+Xs/f9xq8RIc7Wa6lppSXf53hxdSWcRywwe8IQgX22iVHBWk+XhS477brvFP+4Xnz6CZ9sKCQnScT56W9Pboisb1jz2LroNCyB7JHB2rgGG34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5zofz3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGHE48j4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A2t5D3772692
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 14:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1jUYSiye1pLm+j6sCHsWCk7URSeaocyAVQOnxDwAvI=; b=M5zofz3xrGNcWxBP
	HdM62Fz6CLFR1DadPx0ESYz9jVOxckX/zrIbmfNeBk+F+C9UfG6bcy7vn6iqPaIu
	+iwnr4f31WKnJNTWcAaTa5mAP3EdDr2BCqCMLU2xwN0x7hPAKjvaL8+tImHHCKHG
	XP1u7CLv1HsTIxNI3TheA/R50Knz6CxhunWSWD3CaJl127GpcLLHUYFhzTrUv/w8
	MDDce2+WlMeFR6pIVvOENAZgRC321VGzv8aDlPCz6dO2ejUXswuRmPulMJ8q4vVr
	u3qUB+9Ssg9Y2+rWdlrHnro384w91+XJ8/Wg0Gqq+wH77I4K0eVmLjcq8GPhiEgq
	+BaxIA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b03908w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 14:35:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9f0073e20so11651465ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783089344; x=1783694144; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v1jUYSiye1pLm+j6sCHsWCk7URSeaocyAVQOnxDwAvI=;
        b=CGHE48j4jwuwE8b4vFmDpmUtol0JGVGlrE83U5ZcuyBUmiQg859f5i0ExPRl3lj1Io
         RuSoTw3yoUhrrDHMTFiEJO5Tv5XqPo8uMkTX2Tu74v7RZL+JzDd1fyCOfX/lgFIh69v+
         F4wyRY1q5L+8NS2b8CZ4bEQT56mv2TgBQyR6c1/GE300c1cqoDVuojKr9giHs8kxbUsE
         7ztqusM0/m98sCuFzGWhyrd4CtI7rrxkJ7QWtaCFadZptS/HcUFHQkod5u7ZqLP/ltv3
         a6hYrs5s/BwZyDOcgOYtZYG6ONGW3EF+BuD0F6gVu34dX5V3/qhR979nBHAc7jCXLChL
         sG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783089344; x=1783694144;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1jUYSiye1pLm+j6sCHsWCk7URSeaocyAVQOnxDwAvI=;
        b=cBvftb9g6rTuHRkAsqkhfhnYoP2dSXdUnczSPRgD99BWLVMiunpY5j+ViJ/H2cw0yb
         dj5A/ZJlHNFT/7zp+FeFLoS9i0oN+GC+XSGjalkngTcGzYppct/DuZncp0EvBuqXLM3i
         FV/MexfS+28ON5zkcuK2N2e/WU24KQNzSVuvCZNlmboGsP/Oas3KRGcOuDgNteTH89pk
         7OXvrZVpNYGjIMeiYCd3/EweU+YMw+tOL8/ysAO67+H8fUreb2y2vKS5pYILsxVs5l6y
         W18D8JA63V7RKluy8qOEmKFryr8ir5rGJndVFyUagLWcHYSkCv7wOl1tcC6oCZLeuCu2
         RcAg==
X-Forwarded-Encrypted: i=1; AHgh+RroRI0Tq9psz42G3H2bUYEDfayMB0JTBAnzv5s+vISyf4sl6S/I63RohtS6nfopfWkfT7bJoGdd3kyqacPE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4sG9hq+p2FEObxDQcLr6SkDnoBW4jmoGthWumz1VKrR98D++K
	23M4p1TW32lrMDMztWPfM9CKnz57XXVUctSU0fTM4ITs/RYIBELB4n1rpShifcIfNd8MopAmals
	1FhU55u9jo9dy8ZjRIlaoLvRUTZFyHYhQ+KwrH9AnR3c1CQerom2UwJnjBXzlz/nQkEex
X-Gm-Gg: AfdE7cmXWePFxxqPIjpkbqfr2J1UWwsFde2u+PAgHIfp/8sviyQD3vc80Ba8RFEmEfe
	LZgTU8/rr39SfJ5pixqj4HSWheRsRwaYqdth+asBMifslc5rY9ctnxF/bCLdHAAVPXILOljIySq
	3w8DuJgwD7lL5haqzkzOJVaRWt0GSb13cIyd/KlpVla65xuIStxDmzKxbmhFwrmpcsRCdJXhd/6
	UFB1ShmPHt5DJI3vlyIXm7jKAuTO4xgZk3f7zn5Il+izE/e6FPlVRHzSghiQJurBkUqelWZ+2XL
	urSUI2a+43GhWGLVhW6MgxIJHuTyP5zFyy0F6v3rRhNmYo6lVeyvVPJb0sNtHeVPHNAgr+yku/i
	Q3Kc0s8iFNxUqkdkASQNb0unRrdprYRxZ4+Ijfq2ARved1Kz2RD/Z1yb6BX3Y
X-Received: by 2002:a17:902:e811:b0:2c9:fec5:ae82 with SMTP id d9443c01a7336-2ca7e8b3a8cmr120291935ad.44.1783089343716;
        Fri, 03 Jul 2026 07:35:43 -0700 (PDT)
X-Received: by 2002:a17:902:e811:b0:2c9:fec5:ae82 with SMTP id d9443c01a7336-2ca7e8b3a8cmr120291495ad.44.1783089343044;
        Fri, 03 Jul 2026 07:35:43 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c876ea9sm18701734c88.13.2026.07.03.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:35:42 -0700 (PDT)
Date: Fri, 3 Jul 2026 07:35:39 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] remoteproc: qcom: pas: add needs_tzmem flag to
 force shmbridge creation
Message-ID: <akfIu0V3XxQoV_Mw@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-1-b706c4c9b3e2@oss.qualcomm.com>
 <579360fe-9276-4d5b-9da3-e479ab8e5e37@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <579360fe-9276-4d5b-9da3-e479ab8e5e37@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX/P5ncdLVV/2+
 C6/i3S0OLApEDosQnT6dm97fTF6K0D8MCfrduuXmS1mP3Xyv7xAOzv/eC790uNjPVpEbRpNzBsr
 XyfqJZoVMLGK7ePJJIW9ZtkQXbXGjUU=
X-Proofpoint-GUID: Eb7ClBKjS9wA9Z4u2__dyz8O4o8fTPfs
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a47c8c0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ny-STUQjzk9O0FCgRqMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX3pLZ5s1jRTEa
 cndV6qxzR9FgReHS3wlD1X29/jLW7L4PHjV4kgozUIqXO4B1FwlAaYIAvdrWTeTiI+YMk1bRnIY
 S9IYcMisd8RoHgpyTINqqGmMkAzkK9fda6UbSvY4QQLP56Bar1APM0mXUul2/SOtG+JGs5ZQFON
 Khf5engMTX2StJFoFHj+ra9JfWsc53eEuCNXS7bdCbTTWHnAhreKYv1CJuf2elV2a9WGDsmDtRH
 niAFSVV4cqKgwUGRLUcobM9dbUavwi6z8NQHH2RnBo914dK7+F/b4doZUuYjYRPP9wgWjKkx7N4
 LXppuDgOIEp+DbFV+GOfwoTJMVyR8EDjKveST4Zm6kFC/65c2CvMt7v7iU43m/1Ry8z4KLPmiGR
 e45UJXrcyoIbYckowx18+v2K5pj15o+K9bz7ONEO4cE1mM4eGVMklWiDtuQr8+5OKNjBeSWBEoi
 3cjvCmbzR8QHF1pJrpw==
X-Proofpoint-ORIG-GUID: Eb7ClBKjS9wA9Z4u2__dyz8O4o8fTPfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-116339-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4915970385D

Hi Krzysztof,

On Fri, Jul 03, 2026 at 02:44:41PM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2026 14:31, Ananthu C V wrote:
> > Most Qualcomm platforms feature Gunyah hypervisor, which typically
> > handles Stage 2 IOMMU configuration. Additionally, SHM bridge setup
> > is required to enable memory protection for both remoteproc metadata
> > and its memory regions. When the aforementioned hypervisor is absent,
> > the operating system must perform these configurations instead. We've
> > been relying on the iommu property being present for this, but for
> > remoteprocs that are already running like SoCCP the mappings are already
> > in place, and any attempt to recreate them while active would lead to smmu
> > faults and a non-functional remoteproc. Fix this by adding a needs_tzmem
> > flag which ensures tzmem and SHM bridge setup is performed independent to
> > the iommu property being present.
> 
> Looks awfully like LLM written and considering obvious problem, this
> feels vibe coded.
> 
> According to current docs YOU SHOULD add vibe-coding tag to the commit
> when doing that.

Part of the commit message is based on 5c720260e840, and the rest is all written
and readjusted manually. Every single line of change in the code also is fully
handwritten - well, typed - by me. I don't know where the feeling came from, but
please be relieved to know that there has been no involvement of AI here.

> >  static const struct of_device_id qcom_pas_of_match[] = {
> >  	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
> > +	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

I ran checkpatch well over twenty times before posting the series, and I did
it a few more times after seeing your reply. I did not run into any problems,
and as such I cannot understand the problem here.

I could not paste this into an external pastebin from my work pc due to policy
reasons, so please forgive me for sharing this extended paste here:

$ git status
On branch next-20260702
nothing to commit, working tree clean
$ b4 shazam https://lore.kernel.org/all/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com/
Looking up https://lore.kernel.org/all/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com/
Grabbing thread from lore.kernel.org/all/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 8 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✗ [PATCH v4 1/3] remoteproc: qcom: pas: add needs_tzmem flag to force shmbridge creation
  ✗ [PATCH v4 2/3] arm64: dts: qcom: fix SoCCP memory mappings for Glymur
  ✗ [PATCH v4 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
  ---
  ✗ No key: ed25519/ananthu.cv@oss.qualcomm.com
  ✓ Signed: DKIM/oss.qualcomm.com
---
Total patches: 3
---
Applying: remoteproc: qcom: pas: add needs_tzmem flag to force shmbridge creation
Applying: arm64: dts: qcom: fix SoCCP memory mappings for Glymur
Applying: arm64: dts: qcom: add SoCCP DT node for Glymur
$ git log -3 --oneline
3aec83c4ebd4 (HEAD -> next-20260702) arm64: dts: qcom: add SoCCP DT node for Glymur
abb3c9998fbf arm64: dts: qcom: fix SoCCP memory mappings for Glymur
7a2db13e713d remoteproc: qcom: pas: add needs_tzmem flag to force shmbridge creation
$ scripts/checkpatch.pl --strict -g HEAD~3..HEAD
-----------------------------------------------------------------------------------------------
Commit 7a2db13e713d ("remoteproc: qcom: pas: add needs_tzmem flag to force shmbridge creation")
-----------------------------------------------------------------------------------------------
total: 0 errors, 0 warnings, 0 checks, 44 lines checked

Commit 7a2db13e713d ("remoteproc: qcom: pas: add needs_tzmem flag to force shmbridge creation")
has no obvious style problems and is ready for submission.
------------------------------------------------------------------------------
Commit abb3c9998fbf ("arm64: dts: qcom: fix SoCCP memory mappings for Glymur")
------------------------------------------------------------------------------
total: 0 errors, 0 warnings, 0 checks, 17 lines checked

Commit abb3c9998fbf ("arm64: dts: qcom: fix SoCCP memory mappings for Glymur") has no obvious
style problems and is ready for submission.
----------------------------------------------------------------------
Commit 3aec83c4ebd4 ("arm64: dts: qcom: add SoCCP DT node for Glymur")
----------------------------------------------------------------------
total: 0 errors, 0 warnings, 0 checks, 63 lines checked

Commit 3aec83c4ebd4 ("arm64: dts: qcom: add SoCCP DT node for Glymur") has no obvious style
problems and is ready for submission.

> >  	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
> >  	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
> >  	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
> > 
> 
> 
> Best regards,
> Krzysztof

Thank you for the review.

Best,
Ananthu

