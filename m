Return-Path: <linux-arm-msm+bounces-92770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN4tBN0Hj2ltHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:15:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEA41359CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57A6E3032975
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2EF21DA62E;
	Fri, 13 Feb 2026 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIMN/65u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LckMg2+V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD55133067C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770980942; cv=none; b=b9+i6tu18zADaZo3h96vWSPJiNRqMQ2ZCq+dHkl4MHYznjOm+ZWVLH61KbwcgZl68VQXl0b3WywvmJdTN7kaoJVxUWpxVJWHv31RfCiWZ3cuTUxvFE6CuxFq+hBng3/rtvp8J7/NpKqTybO1nKEH0EGw/AuiLBWpcz+OauTOp4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770980942; c=relaxed/simple;
	bh=vUpystO30xCXUPtZuyORQtJgRvn8tqdlvpwqCd9hy1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhL1zEBKGSJ1ArF3mAI5EJJmwK/+qiPblsOc3oLrcv8KIH4dGr+ou/O+oSqNBvH3qVCKQA1eWVbJQwkWCicT3Tf2Acqe7S55C2H3YpBFvu7xKmlYoO8BxTB5agQIQHz/25xZ+Wpk4ZO3LYcvbsazjspdGx3WZhLvmLYtJQrhNf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIMN/65u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LckMg2+V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D9NeGw2733800
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dsFDdRSQAJzD4i+v72zp9SgRaVwmD1/UaJtWtm25vds=; b=aIMN/65uiz8tCg0l
	kcLpvJJ2p0qL2UNFUibVa2pMDIhJN9DspWAcg/ehqFaOLrk8YrU8biYVXNmYpB6J
	x8V9iNRqlytnRT9POObqn23sRGSa5hg3/nTVuV9SK8ujaKtLyNulTZ/sqRKz29fm
	b+X68fiJrd2qalQhhmecZHG9S1HmPQf0yKd3w1Cx3kPNqfXpXAfSUbxDE6Q/U+T4
	Nf1w36eMuR4bLV0FiCa2N/Kv43WU76gsGMkx581vbE1IhWMrltKyFsEfg2yBeJTe
	TBkM1v0go5XLPGHf7lcOWe8hJ/EiNnC3xHIzSydoRJVtXoIJ8nv8tPEdObWWlKYv
	xDMGEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wt3d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:09:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so379401385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 03:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770980940; x=1771585740; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dsFDdRSQAJzD4i+v72zp9SgRaVwmD1/UaJtWtm25vds=;
        b=LckMg2+VoSH6ld1C+oE/kJPTLg0UFGdA39M70iTawgR/rAG6ITC1RM/+lhV4r3f0C4
         Am4JFCIdZDxr7miTEMZUfJCZ/Zou/oj2M2XIWXIBj4vlV550ZJ7Eve1eMx/gG8DQ3e8X
         S6/IU35ojnRwGJgR43ri3Q67rvBpq51v5NXC7yr6NjJg6ax15mKKIyVj452ldtUMZB+V
         dtts+LU6mvjQ578mcLERiq1neFQ/XjpZNbAIHoOw2xor1BdJU+yQ1/FJ3e5owK8zEaBE
         VO8xdC3NFoUzhRtNA5OoEE/wophYY44zFjG/3uH39akhMSigFVnsmX3joyTCEWcgJgMm
         fzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980940; x=1771585740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dsFDdRSQAJzD4i+v72zp9SgRaVwmD1/UaJtWtm25vds=;
        b=K1R4UIIVaSCqdcucXEQnRZ5z0M76FnbwKQCJaJBRmHZYjfJUBvOBXRqoFEwtSBpupJ
         weaV8TkheulgS9Tq9ERxLcIWN8IM2Ztv7PcQe8n0AQJk4rrbOr01RwSOHx26ggb8cP1g
         wXd48elQJrmCoei20GlcHOEE5zLqq5g3iClj1vfRA2hCisxFR1OGzIfdh9VNYM8IUfG7
         RC7a8mOe/gNOzmYm06jGTQTk3ys6pvmyJ6yPbGb8puH6c7pTFBz8yrzoEmW+/vjWvi5y
         3hL64oXAqWoG55Y7ijqusbHj9E5N4dkrgzrmD2d8e15kDPnkDPtO2Irpz7joPZWNsOhu
         giPg==
X-Forwarded-Encrypted: i=1; AJvYcCWcGkbMBJtjaR0Tr36zouuFRr+r9oQIRbkidlNKhvAnHWwY99hXfXVHCx4Ob3vuINk6uiQv2nhTUEuXzR9/@vger.kernel.org
X-Gm-Message-State: AOJu0YwtVfDgrW1BPTOgvTyFPFYKpwy5J/ZO1NdlbRZPs/UwIV89iC8H
	iYehUtnyg5K5hodzkMPyy4H5LtpSaub92e/7ENqtVjqz7KCNecpyrT6vX+E5+sQ8qydbjNQ+SOH
	X+ADndf3iZnjGLOCPOA/SnPTzlugdj788JqHYd3BqInULRu+e1qZ9rUYrnochZ7sw79WT
X-Gm-Gg: AZuq6aKgaGfIxmM2cktt/es0KsWfBPzkpxezaME1cjI2PEowO8quJuQOSKJjtSxOS32
	RIVezmWzaH7P62XqtuKPcpwAnT2HmFppXClqMa50VqiRqL4BZRf8CcETT7f0qExnym4zud06A8c
	D+OgC07I+PD08mOEsS14K/m2CHRoXvMc9aZId5VQXTbYHMfSqmrBFij8mryyo/PggKAUbIN6cBr
	Kzln8YGFfIV5wynoxYQ5TKZ3qLw6uUN7vH3lHuNrYFqomvuNjZVm+wJ+7aMx9/wpiyR/tDhdV6v
	Ee9WY26UvhR7jNsZRD9+HhTVADoFxqzG6eDB0SluAx7U9Sdzs9AfjKou5fydzLF5Xg5kqt9UBha
	ktHYzQsZ0wFXizG/lZBRz3lxYYgu2l0C609x7ApeDV1bL7CAIyanMu8zNNzX+WOlGUtK8PHUBNW
	VMyZ2VHgz8FFjIKLQNqt37CxH7D9Qd/1o8L98=
X-Received: by 2002:a05:620a:2849:b0:8c7:139a:bf48 with SMTP id af79cd13be357-8cb42412cd2mr135470485a.49.1770980939925;
        Fri, 13 Feb 2026 03:08:59 -0800 (PST)
X-Received: by 2002:a05:620a:2849:b0:8c7:139a:bf48 with SMTP id af79cd13be357-8cb42412cd2mr135467385a.49.1770980939472;
        Fri, 13 Feb 2026 03:08:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a4f5fsm1507989e87.56.2026.02.13.03.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 03:08:58 -0800 (PST)
Date: Fri, 13 Feb 2026 13:08:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Message-ID: <ruflywokgeuoahmu5ecabs5bgfixymc6al3okuukb3goddut64@2vs37t7h536h>
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <FaJyQ2c9oLW2a2qKHDI_zfRx4G_Ee4rzdjImb7o3bKnZAo7AzRDgokOBewYZCNdqexEEPhB6nmPEjkmS72Kalg==@protonmail.internalid>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
 <5ec260fd-b8ae-4c54-863f-de9e684bc543@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ec260fd-b8ae-4c54-863f-de9e684bc543@kernel.org>
X-Proofpoint-ORIG-GUID: -Mg_BQ4BlHyAnrsn1fmiXm58Mq8zKw8L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4NSBTYWx0ZWRfX7NodKPYXhqbx
 vnsWUUAl2GZ5SnBGCCrSm488h8uiF0n00vL5wfanpaIbljenc2mbGaFnlOXYD2re0ngQ5krg//T
 kwRR5ke5+oAgNXo1tsY0Y6tijcwUZxQlTwBamNb0URYTFMXaizxIciCT5HvXucF5rIC8s9ycHUf
 lqDQsAMrgba53weloB4zOzSGkGC4lxQB0Jv8HE1Xz3RgTac5v0rXal+kuH5tYNVmwPtZbHeg9Xb
 3AvIOicGXhVVoiwC80ep2am4DB+OelbK304dapvXwyiJLDZZie2D7p8YFBDwziBNw7/25KjQehi
 JgTLPdMAlhYIFUz2pVKlW10N70JKvcfYXbS+5YsVPlnDHqj5au2DETT3i3h9dWtSGIC2sgn5EHc
 N8qnz10Na5u3sfHx5GgOjzs/NGzsPm9dfqSVs/LFPr2Se2MccniO2zVq/fr4m1s2dXF7kGbnS29
 f9cJ7lkraQF/TRrbzyw==
X-Proofpoint-GUID: -Mg_BQ4BlHyAnrsn1fmiXm58Mq8zKw8L
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698f064c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=QeGKjAVUF6DEba-xYkcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92770-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CEA41359CB
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 01:27:15PM +0000, Bryan O'Donoghue wrote:
> On 12/02/2026 13:05, Dikshita Agarwal wrote:
> > 
> > 
> > On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
> > > On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
> > > > 
> > > > 
> > > > On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
> > > > > On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
> > > > > > 
> > > > > > 
> > > > > > On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
> > > > > > > On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
> > > > > > > > SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
> > > > > > > > use Gen1 by default, but boards that intend to use Gen2 firmware can
> > > > > > > > opt‑in by specifying a Gen2 image through the Device Tree
> > > > > > > > 'firmware-name' property.
> > > > > > > > 
> > > > > > > > Based on this property and the availability of the referenced
> > > > > > > > firmware binary, the driver selects the appropriate HFI generation and
> > > > > > > > updates its platform data accordingly. Boards that do not
> > > > > > > > specify a Gen2 firmware, or where the firmware is not present,
> > > > > > > > automatically fall back to Gen1.
> > > > > > > > 
> > > > > > > > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > > > > > > ---
> > > 
> > > [...]
> > > 
> > > > > > To avoid accidental matches, I can switch to an exact filename match
> > > > > > instead. That way, only the specific Gen2 image (for example
> > > > > > "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
> > > > > 
> > > > > How do you detect that for the OEM-signed firmware, which can have
> > > > > random name?
> > > > > 
> > > > > > want to use Gen2 can opt in by naming the firmware accordingly.
> > > > 
> > > > I Explored on suggested alternative approaches and seeing some limitation
> > > > with the both of them:
> > > > 
> > > > 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
> > > > It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
> > > > the version string. The issues with this approach :
> > > > 
> > > > - the version string has no explicit marker that identifies Gen1 vs Gen2.
> > > > 
> > > > - This prefix is not a formal ABI, and it is not consistent across SoCs.
> > > > Each SoC family uses different naming patterns in the version string.
> > > > 
> > > > Example : For SC7280 Gen1 we currently see:
> > > > QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
> > > > QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
> > > > 
> > > > So the driver would need SoC‑specific string‑matching rules, which is hard
> > > > to maintain if we are looking for a design to address all available SOCs.
> > > 
> > > The only SoC with such distinction today is kodiak. So we can simply check:
> > > 
> > > if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
> > > 	hfi = gen2;
> > 
> > Agree, this works for Kodiak. However, Dmitry was also referring to other
> > SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
> > generic way to handle that check.
> > 
> > Also, please note that the Kodiak Gen1 firmware uses the string
> > video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
> > 
> > > 
> > > 
> > > Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
> > > solved for <=8450
> > > 
> > 
> > Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is gen1.
> > 
> > Thanks,
> > Dikshita
> > 
> > > Konrad
> 
> I really don't see what the problem with Dikshita's proposal here is after
> all she literally controls the firmware name that goes to linux-firmware.
> 
> Presumably you can attest to the naming format you have-sent and will-send
> in future.

Is qcvss8280.mbn using hfigen1 or gen2? Is qcvss8380.mbn using gen1 or
gen2 HFI? I really, really would warn against hardcoding something for
kodiak only, because at a later point there will be a business
requirement and some other platform will be upgraded from gen1 to gen2
in some other way. Also, in many cases, we don't rename the firmware
provided by the vendors (both inside linux-firmware and for the firmware
shipped with the device).

-- 
With best wishes
Dmitry

