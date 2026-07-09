Return-Path: <linux-arm-msm+bounces-118086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sjv+Ep7uT2pqqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:55:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A8D7349C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:55:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YfNQknXE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qj13Lzog;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118086-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118086-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 211CA312B398
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 18:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A642449986;
	Thu,  9 Jul 2026 18:42:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82C5449980
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 18:42:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622575; cv=none; b=qKx+FV7ri4jrj4reP9CT19NbB6AVNoFRTL4ueDYX1dLT0A8WBFJ71mBQ5f7p4uBgEP/1Gp7REocAee3E76+G8hw9nQdHYYLkbhQtGkMUk+LWtHvJqrRiVVCS5wZw5yVh+0ZbRwJUaAdTSypitX0yfUL2+A8YsDkyy4oJqAaiXxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622575; c=relaxed/simple;
	bh=8G002/IxABPssrEzt3TqDoNY1L4MUJqdSn00j40u6ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csSIAbzQPScx9GUkX2Z4XgGlSBpu2PMLTk6SOR2+wvCyzcrmQ/X9jxYG5K4O4heNWQ5rJQgRhPufKXKm0aOzetAMXN9IZ/BRsnrqzqbducWHyuKUN6HUNJ72DFZwPqPUEfU3IPOZ+3y9F+rcnblfYJvF5QOcDnpQHM45JwWWNXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfNQknXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qj13Lzog; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXFSo2516516
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 18:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=; b=YfNQknXE40JDrClz
	EHFnTG1PkwuOYhq2NNByi3fOFBH8S3XdJ4p84LWsrRi0ASDYyQRM6gNf06kEg/bN
	FmGvNqpXo09tetopfi9LGsQt721cySlXMqnluZSFr+ExFKgd3EctkIoJjijlHffR
	GozG87Gp00lltvfk1OLRHKtNJBzN1BJgoU12ex+wHQvFc/duMohJlGRW2SG/S4Bh
	aLHzSmxu8Z/jb+Nh5QEKnNYPrqiUBBCOZl6iRNe57xmTL9prx8PAeJ1NkYNET0F5
	+olZA6fZD3W4xF0nLUTIf5TwqOmC3Mx+PSb/CzLmFn/5wASY+scwjCdwSSzCuNoy
	6HVfcQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418kyar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 18:42:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso204814a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 11:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622572; x=1784227372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=Qj13Lzog26AioeVzE1qM7BmiXfH+knR3/hhHLPzYE2ypOcZO/0Ztu9/0kXt/JUYk7q
         +ZvHFYUV3yMtskWLh2/Nrl6cpe16HIYdWg6C3tpgcWsm8IN40vSGgOgjPfl5onz7MoKO
         2coNcvKVbT3wHBnHxUcEn/nXfEiqltbuuRI7+BCdS3H+XBXXV4jlGAhPSkNSC/hme5zT
         feq0eJMOAdzvv6g8KAzZ0HY7nQIgCXW4QgO6xFmITm805l/NTJFgKhDcDOmd2tymM9Ed
         tuxSBq1D+1v4XLRXfEK5m9JwBjg+kE4xjdFeD6xfUR5TmFVx9Y0O8HP1IeTx7KKdMqe9
         bDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622572; x=1784227372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=HswOCDOBA3DcZEiCj3BURg9EreqtDoWXC0cihy/MOUeDPodL7O1NYCc2cpR7yD/3DR
         VlIrgjcC3kEl0jWph30HgZadByMlU1GGpUMUzqC/w7BRa16U4VTOTvCQrmEdD49Mhatt
         SqK3QB4R50RImm76AqoO1gI37sWBYsjQtsodSh41GFJ+1LDCywqAog96YzQmH6OF0TQL
         4cDyH/TC+TMex2TJlScnk9GuICT6fp6SDg1KvJOhEbEAy0S6S6ZPq9gyC7TlB5bgdpuO
         XGWH9TOldSVbMe2WEVwojDul/TdzwMK6JIy0tNkIHHyYxwQJ6qFCaFeQSMpU5y20Cc7b
         HEBA==
X-Forwarded-Encrypted: i=1; AHgh+RoUt2OED42DQqZ4RSFArbZAEZ2RmwPW17uAZuv5deSm9nm0dF29/ia1LJka16Zi2ipUzYNV9d0hwcdJl1BE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu+Jw3X4Y+O2XwkS7T7uxPUExxsHl2D0MxkuA6Vm9akium+hVo
	d8FZJcbGcVQy577gWcsQn4g2um0fTmaHnwvgeweTUIbFio492uQe5mPICoHWsE7bPFVHklcq3+P
	iUrhkA5/4ezxZXWIvvTo3Qz5T5ZSL2lPALLbSHzHlqQpB7clkeKtU7XnSYT5TzW+5TMul
X-Gm-Gg: AfdE7clrbiI3SqHaZDa0xyspjklrRr5KVDgkXXVr9Vz4WH2TBFzvto6TZepRR47B+cq
	p3zE1MwbzmMg3BiNsnjeXI/4Ilyxv4wvUn4ml4UVp8XUbotvobVymWnz3w5LHlkHlexjHLQccnJ
	j6Ly0/+oL41ASPMPVLfB38YWrMmE+P7Ricr3s2Xek/WhDPGOiw23ZK6YPkxe0gWiZFhMC1uciop
	KikjraN73AtpTLAinro+ZswoFAdiepsgL9yAHQT+lX9JqnFUpMChiiU+1EvPplCDOYImpk9+VjZ
	Z1hO9spqxggPPAQjVzMWMmv9G2RUmySjQbniA/mkPJL1eUcCT9C+VxYt4mJkCFmloMoGqwYOqqH
	FrZkjtVzA22u5rIn1LL7BDEya72eqayM4BBI=
X-Received: by 2002:a17:90b:5685:b0:387:e0db:3d8a with SMTP id 98e67ed59e1d1-38943854a52mr8741855a91.37.1783622572621;
        Thu, 09 Jul 2026 11:42:52 -0700 (PDT)
X-Received: by 2002:a17:90b:5685:b0:387:e0db:3d8a with SMTP id 98e67ed59e1d1-38943854a52mr8741825a91.37.1783622572199;
        Thu, 09 Jul 2026 11:42:52 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:42:51 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:02 +0530
Subject: [PATCH v6 3/7] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-3-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=1298;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2jQmU1XEfwX7ksFDjORvPn6m0bWV65j9hgt3Tl3GEMo=;
 b=ZHYwuBBmHydbbYbR66h8CvEw070fSbVdXWh3mYBcTePopE1EO2/nQ2AQyCyuVLwlR9uzZCS7X
 FeMi9LFyjJrC962OmSUnxwOhByuza4MZs+vELBPqh9Pj8eXByS5d7P0
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4febad cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX6Z1smiB2l7Gb
 9GJhT5kPbbjDbe2v1YhI0EdSO/nMtnxxe9DdUOgH+HGiUyrQd2Mnjs8q2hVeb6LA2hjGvF7kzau
 neSm7l6Y1yr3b58NilF/zDVZWBmc308D3hhk1aNTdGoGxGZjBeLULQvb7mfPwC1xKV62JoejChu
 xjqDZ8fIHM1KON5Ajx0y51SCiyZ/n5p7YZvcfvL8anMO/zSj4m7Javvd4nFFftsR9oBec9vnF93
 mqS9Zhxz8SE2b+ZCg5Kbu4yKpwVFC5TDxi/SvnQ6HB6pbZsFG38o0H+/ofXFl0+JClDmw2r+hJk
 ewwOiB7ZY0CxdIDvEnrPJz+VjO/g0PuWf8CFWYj0CZx6bPZmYEUAyOKTSRAd2vbtZ1a8eo68vYJ
 4wMC3leZAL0kqUrRyRRgcscmBV6tMHk1vhwVeh5zxyrrWELdnuEwH9+ZW2xlKzhGm3CvA0V/XbU
 R1PbsfQub/Q+ObVZ6dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX43xVaJZlBrsP
 hfU+wOQ8XDfjgczGz8TNqysscQ/6zkjl28+ejHFssmqjQUjqktxWDK3UBfFgjcyj5chvLanEStr
 Z8QZf6JpA6uN5D+cz3ee9CiGPg1Mf7k=
X-Proofpoint-GUID: KcuIK1DQ0buKJ48j43u2t_nh1itSB9oD
X-Proofpoint-ORIG-GUID: KcuIK1DQ0buKJ48j43u2t_nh1itSB9oD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090184
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118086-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5A8D7349C0

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ad15fda5c25e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -108,6 +108,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
+              - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
               - qcom,sm8150-smmu-500
@@ -543,6 +544,7 @@ allOf:
             - enum:
                 - qcom,milos-smmu-500
                 - qcom,sar2130p-smmu-500
+                - qcom,shikra-smmu-500
                 - qcom,sm8550-smmu-500
                 - qcom,sm8650-smmu-500
                 - qcom,x1e80100-smmu-500

-- 
2.54.0


