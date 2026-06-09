Return-Path: <linux-arm-msm+bounces-112084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1KesJYLeJ2rK3gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:36:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0449A65E63D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:36:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dSzRjhch;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ev461t23;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112084-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112084-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87C9B30D6494
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5671E3F1AB7;
	Tue,  9 Jun 2026 09:19:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DBF3F58C4
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:19:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996794; cv=pass; b=ldleqQ8c16XtAqM0z+Bd2sCu/CS2+fUwSxn9cW7DZO89VvPtKWvzwcwd+8p6TaotyNK+vErTneZlOCDu6t7kuvRILGl7AxozLR3JO78Gef5n6wfw1oFODn722DK5STWC+Kgn/DG7IXlFegEsyP5MXNn0zsenKrVYpIZNLQsOQ1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996794; c=relaxed/simple;
	bh=oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAT8AqsRPtxzYcIJTfs0WzzkuuGVHVjPZp6lC3YuSjhGoqNjg2armO+eGOLWNp8sK7VmvSq3irk56wohaGqwE0rLJGV5n/crrV71HspvCELrFf46N74GoQ9mDkF+gegyP1vRFnwd/4BBCTzBUHBnbLTkGwloW73Dvo+9cgEQnZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSzRjhch; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ev461t23; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rb7Q1923226
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=; b=dSzRjhchuv5J+lA0
	VNfzn1g/9zxFGeqrtj10w6mP+5Vx15ppW68zOAui5kM3IYYYrV/FVdhtdtFjAFNw
	Njo90gM6dPM/GInzXIdglHf2hVk7m/0SsMXmLLN50m+xjjCceihnhGAUlzr7AMtR
	fkz+GgyVYr3L2YD0dF61q0U1D4Kg4JHF6Qlk5v76WGgPnlfPZXMQNKfBLBkUAXVN
	hlsViLtumFWLgxE8/G9zq0IT+3pq3YbcwZ30UlQNaQ3FLXC1Bg7SreQ0tB6IPO6Q
	+uJCXUYqB6O93OSwbJuHpNx5SKbI/RnTF8kpSvscvF1oAfroI0Bx09Ns+492qPd1
	ICzikQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4gf79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:19:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915767b341eso614072285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780996791; cv=none;
        d=google.com; s=arc-20240605;
        b=LCj35L28OLfxUKxnry56memsVtKjHC3N4NI0WCdjp+nWT70DJ73g1HFVRxVNPEIDEA
         J52mrUIBlkvmUkXBEE5Wsw+qG0Zar9kK3lLlT1R9t1W12x9j+c8deDfwlDEMIoxgItpT
         0ZInM21tXWe6O4jswXrY9vjNA1ZBwJlrQ1sGqj4KveGC7gtxc05hoOjS9Nr9fvRR0ObU
         ldA75kLR0cFPgCJUnnVE470nbp0tafmJbi5JVFb48bYDgfp7s18U+6YUiq/tZ1SrdKuX
         Zx73KYCteeaL+oS3JgMkTKH6piwklK4A7b0vLxiz5XdCyT/TKdg1Ikju/eg0B+rBx7GU
         r4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=;
        fh=Un05S0S/8LDyDrXOPQBXVZ+6P8ZVgbknZQGP5xkXnnw=;
        b=YwIYibmKqb2QaMs+D91WvxAdj+x/vvamgcsQaJ8G20d20X4ns4kn3CcQqw10sks/oD
         4Oh03wgMtKBkRHGdcBzWtk1aTvZkVOzEOiaxPoPwklITg4614hsU/QYeJIbDNCdGsF+y
         SfRiWhhmwX6ydegm2zZYVitzXOg81bWVIT22C5Sh5KEV6l4+A0DWsvzP01/0MNg0oTAI
         XJrNUzoT+pf0RQNaL8sSW48SuwzwM8Nbd0LibyXFe0zaiWVH87CTWSbvpcxkSQLNLNcL
         Y5rm0TV5w5nv9dni91HCYKictxC/9E0SHQPnSr/P7VVKR4lzUzSt64hyO1b5UI5t63ar
         yGiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996791; x=1781601591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=;
        b=ev461t237CfjSfw4zZBnCE2sV4j+BKrdhdFtWDdCN3b1mZ3MO0arSmlkSohSiXOIa4
         AcRZZqqIPtAwHFQRkzHMFGeTbiz28rx8an07uLQSX2w/if55sGR8TJ2Ypi6fkWfPOTqH
         Rr5hlNSoCEfJxdI20eKQlzc6xbIM74kLlB6mPhJrbJBJSOjMxNiu0ST5at1mXUbALXUI
         hxDzFcdyY9MIKDnfSMqtaI0JmPRThKyi6xyps7omOEQJA0wt25sigFuzILTGEqsM+bhf
         pq0WYWEnImvNXWleZufjXVsg5m9U9ieWo5fwSIKjX8mtqO7v/qLcTAE5DW+c9/34MsE+
         Zlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996791; x=1781601591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=;
        b=L9vWkC9aa6XD1PaIJHwKzb9yb+Z2/uDkhbwsvvaKmF6ZR8+FWrk3UnxzHO18I+X1ch
         67RqJbCG9C9G8S6V1cc1XWaKjrtKLktKJYAsX7Izf47Z2Nrc6LYfDhxkJ0mbdu/G/AEA
         tGJv6uJ8ECJ70NXP6bBAuMWVm1LqATpcdqV8R4g0c4ePHwm7EEu88bTnmBOvjnm0SZlh
         0doMwpHYlIFT7okbyalPctKxPestidUNXu40rGzaxDzJYp80hX8bYtfWtm+8QNH+BQ4d
         EZ5DKqvOg2vGrhgv/I048z2ymvEFy1xwEePrl6FESE0vDTdlYCDOxHq1GpE4vcCvJccC
         /WiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9S43RblnJGj50TIk9GWTAA5YOnUblGlnT4+ptnVVgbWRUvQ37LBIb9MTRUx9we83hpkx+Lz68/JzM/LzJI@vger.kernel.org
X-Gm-Message-State: AOJu0YxnbLCT46zWruhIS6dslXSaeRqdky7cSqDUcew6KGbtAf2jmuVE
	k+kV/YxMWwPApKJFlS+cCWoozW25+e7JKNfFOAZEW+LYCTEJdsfZRPyo934hyf4XMI5aGzXzzvx
	DUmhR68NUKhdFnR5gmAZ7jYhUwEXFG3HDF5bNAM4sRirJzyqKDeOCAV2Vv8vlZAqFIcA25u7hPg
	SpreyeDJOmVXFzDQ2ewbm1KH02AAQVkqG+gFSXfaPCVfM=
X-Gm-Gg: Acq92OH6LY7VKo/xkCPQ/XJj5AAriY5tXzSdxB3KQE8ATy2P1Z8vZ0htQmg1WVmOGm8
	YfFO+62dk+gPp26Vf6mLglxkPGMpGMixvr+EG/FJbXTHoZXSSpKc6vph5FaTLcwogyTpG4q6knA
	s0ZRHurAcUdsLizyywRmxmaBegfpkkAy0/79JO8xdoIEqtPoPMGI9XWStSt0NfK/SpV6s/YOwHm
	NpsRg7Jvn1MKtLfLVMb2aIpJ9pfVqMiFWW3XjzJHgzFX52GDPAFIc07kwYJbT6h4r8XfQ56eNap
	/RRRKaF38AiabG2x20WG3IvYvY6D37Ad
X-Received: by 2002:a05:620a:4590:b0:915:89d4:df22 with SMTP id af79cd13be357-915a9db5d00mr3035343085a.50.1780996791274;
        Tue, 09 Jun 2026 02:19:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4590:b0:915:89d4:df22 with SMTP id
 af79cd13be357-915a9db5d00mr3035339585a.50.1780996790847; Tue, 09 Jun 2026
 02:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com> <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:19:39 +0200
X-Gm-Features: AVVi8CejLh9w5S_OQ6YRu4HaLtjG5GDBpmdR78mQwKNwD0qnxyg2L6IjHLml8Xs
Message-ID: <CAFEp6-3imORRS5FqjTMYV2zOn+bpf54uwhf7Fy_4-uTDadtAxQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a27dab7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=h5pAuauRZTFNeIU57NgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Nknf8WX2B1YLQKDiplg-XtgNk_AgkKWa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfX+PeY5pfcrTKL
 +VuHSfJCcxkuCydj5prVkaZqPAgAeSbsNhlAwLkUikXEn6EnbzGQH+TV1S+muUUnINmHSiTm/w2
 BRqAB3ri8EIMLfwwyRRxDLuroJH8pcwaLYTAzAAHtnkJvYaoM2UCUiA2zvQif7xK/Phq7OlUguP
 3O/CZXsS8P4xOCHyO9zQ284XpYgBcnHYz1PfGZFAbhMg4Sy5FFgax55g35dZxCbu2cdBFeiNsOn
 y1VPyFa9lyk47toSRbXmfBeMFxvJQaqI1ujeJz6u7UTx7Rns/ptQoZSF8G8sbgU+fEu3WDUrKY3
 IMTONVAKF7250UDrVS0NMx22OZt/zZyoyjUUrNlIH6yR7j7dPPkoR46HbZyE4LWXDWbDbOho/nQ
 hvx/IDVhY0MAM4Vs+7MTWDfmz07U/XQuMbELLOIl0tQ2I4ddbQDWANrKO86rERjGF1DubNqmvjR
 HWbcYSWSABv+3TS/ULA==
X-Proofpoint-ORIG-GUID: Nknf8WX2B1YLQKDiplg-XtgNk_AgkKWa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112084-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0449A65E63D

On Mon, Jun 8, 2026 at 9:02=E2=80=AFAM Nabige Aala <nabige.aala@oss.qualcom=
m.com> wrote:
>
> Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
> the existing qcm2290 bindings to cover Shikra by adding fallback
> compatible chains for MDSS, DPU and DSI controller nodes rather
> than introducing a separate binding file.
>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

