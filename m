Return-Path: <linux-arm-msm+bounces-91530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFgBDaXCgGl3AgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:28:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E75CE387
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3228D300EDFB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 15:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9519937B40C;
	Mon,  2 Feb 2026 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBovvPWy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYePi9Zy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F3037AA7A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 15:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770046109; cv=none; b=dmuDxPJlqvJ7kedbPAm/py395ICrI/btBIiQyyfXOCyi1a0BnhmpUXHChQBAsUe6VSf30iWBWn8SXjGMipZh8T5h0pxUMvOk+GlR8vr4TnSkjsRaY2fbsUVsguzjCBaWlsVEqX/gCdTjCcDlhjhS2DV67FchrxxFFQUD9ZHXySY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770046109; c=relaxed/simple;
	bh=1I322/dM+NuBo9CkzAYX3QYx0C17eFG2BAzLvHNf+jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2li2dkdgHaflSLr4UgvEdXsvIz84OegrzWCO/PtNl9JTpPLbPzXh/tkD3igcmIDCzuskFSM9DtdJL36dlIGaZuLpyc/0wO9V3i/N95roUAbOtBMY9Yrk2uBe/dXSU1me7XI/IfXGb3ZZrheOq8qqfpCvihf2BaCv4QVMg56d4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBovvPWy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYePi9Zy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B5MKr3459123
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 15:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AHkXeN+o7WvzaWGkxUhekKQW
	QkWVCeVyHZlgLTqTpbs=; b=FBovvPWy1RCcvl0Jk2aZ1lN1M0LvwJdmlOtzNhYa
	Oegz2oFTdTrJJhYq0peH3Vc+MqXvZyk6qoWkoDDjdBD/YF+kjIfvgkgsk4K0NH/m
	nG6tdMJ1ctZ2WM8UWXnViw2CM80wYe02KxfvpJ61C4UXvbQ9Fjda68XzGPZoj+rl
	8e1yaHKnjhue4uuQk7wJ+XptW0QzDz7qvxOD4FMW6C86G9vTXkNWHIxOCKVoAiEH
	1sx+uD5oWG3eZ8lBGLDGhbX6+qwQJ5G3hYT9ixpkabkkrFdauhYpqZGhpe1lRpRA
	ELZCYR8m2JKJirWTf5OU8ItoWSTl9ypInHqIVt/HLHSgSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbgr23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 15:28:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6ae763d03so477937485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770046105; x=1770650905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AHkXeN+o7WvzaWGkxUhekKQWQkWVCeVyHZlgLTqTpbs=;
        b=AYePi9ZyDaRus92QrAG/8eBhyW2Wk05zkfgqKgF3kGv4UBDhIUfpF49gA3aVDP4zSE
         4zFPq2Kb/W72isYAUPX7hXcFzubihH3VoLeQtfdvLoQ15+31fBp0CpQJzA1nDCVxXAWb
         dFyQnmksU7ZiSjS8aSwljXhTK5dGRtf6houL7V88S6pWZuzBrkeJAK7PNQ1kw5aJJKX/
         ROpT8TAwV7G/wgoyaFdRcNDlXvdkvCO5eYvkpE6VYp37sqwYkGuryAW1XAYPaT1bQocr
         DqjkN2acOgXSHZJ3+UYYxfHHDuAuWbjBRg/ZqphV34dyxDI9rvTpIxBwzIP701Q6IeQ7
         OPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770046105; x=1770650905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHkXeN+o7WvzaWGkxUhekKQWQkWVCeVyHZlgLTqTpbs=;
        b=MXnOkeftpeeF3tX3OXjpd7jlTrnt1TL/F8fPlOlIuSO3gHRjzGRLLxfndmNCilqSBB
         3rzND4VgKajHVMMCMNGSykwIBV1TRtQe3vIwdv/mEeFz4Kkepq7D7fuxKBa+aHfvp3R+
         5Zn5AX8HDNco/4L5SK6esDWSBrldK92vw52YnxqFsnEgyrhx1locQopDeR4VQQxFcqNV
         CyjW7kK2GaV7SNKNCX32ti+qRHcD4oPXigYlgq693FHr/IMEtGx9N+RnhPVu6OYFto8j
         SflwX+fE7632Ob+iAvib1rIG3P6awP2SkXh6CZSzEaYO+Rerx+MRU8QqYhC0efrfAihl
         OoXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/wsprCX+Mjx9nx/2MUFzBU1d7i2ocxMHJjxUVepGyDc7ev2n3YRhYwdDEYGglpebA3Onqdt/ppJnO1IU6@vger.kernel.org
X-Gm-Message-State: AOJu0YwI9THzoyRjT/h2euTil0KPV+qRMYtSooYjKAzV6dSipYAbcfn9
	ltH75dpsESvPCRAAVMIcBUmMwH5PRPqxjeBbS2cZCV5nTKpvPyzkCEfq03bJ0TUTE10eAQ/9yKD
	bpkCwGG6/b8VcSChq69E9OEnWyL8hZZOL7IIn7kDLFlexsg2XEeB8kQCJ42ogk3qluyU5
X-Gm-Gg: AZuq6aJUCJYE4vDYAgsPgQ1gBhYT3tn6RGNB88liJwWcX+bImMyDL4V9OzTmAT6mKGj
	uQuNUr/bw9zMg5FjLA0qjQlKynvBUWUiPaiUNjITGythGEFaIw/HCPaMm/9gDPBPgd7jkxxUF1a
	67Aidvdror2rKdpA+15EaSZiM7h+S6WCVGlV/mfRkcTmbZSjhH1ac30L95tSd+SPLVWKSkX4aLb
	VAawy34wEQUbf2qosSMRXyMLcxMD1Jlo6i7WBjQTVpjoULKqSiVcNydSnG2z8Nytr+z05QP9Tr3
	cTnky0SRTGYQprRuIICtWgohK8/wyBEf0YUsXzxD1J9Wu3CAWV2Iqnt8pe/0pypNfuxd3QE2P2T
	bc7eXlNItUQqQIP+eRCJme5YG
X-Received: by 2002:a05:620a:4708:b0:8c5:3202:8bb1 with SMTP id af79cd13be357-8c9eb227ccemr1519104485a.13.1770046105438;
        Mon, 02 Feb 2026 07:28:25 -0800 (PST)
X-Received: by 2002:a05:620a:4708:b0:8c5:3202:8bb1 with SMTP id af79cd13be357-8c9eb227ccemr1519100185a.13.1770046104805;
        Mon, 02 Feb 2026 07:28:24 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee040sm44303982f8f.11.2026.02.02.07.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:28:24 -0800 (PST)
Date: Mon, 2 Feb 2026 17:28:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device
 trees
Message-ID: <dwf5hn3ijjmr7hguk2msaeidhvwi4kf5p7ih723klqyrko3tig@xhjrmthsdzfi>
References: <20260202055436.818098-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202055436.818098-1-xin.liu@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: MOs-oYEswxbgujKsIy_WTRP0aMpKLhPU
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6980c29a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rdvWTO9h8kAPeaJoiacA:9
 a=CjuIK1q_8ugA:10 a=eSe6kog-UzkA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MOs-oYEswxbgujKsIy_WTRP0aMpKLhPU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyMiBTYWx0ZWRfXwJD/xtVh6eXj
 RVlAImeknmFpoDgIrDmmqXeD15/Jb5DM1YF+R7Yt6iDmEoICKK20dw8JBKlWXnqbCQSdl1ZnBkq
 YMxWmK+IrIBKtkqdUfS/AQ9Fda2voKu1dQYHwTn9Jvsawl8EMTnKUDHOdl7C1bvnF8HTaeXFM0S
 Ej9aYJEEnmpUpoDbzO2SBaSjGOhait61UF+Qy2UtoJRQHMfoY9wDkCxUKIO2OjGVI5B4kmA6s8G
 LRU9NvDW2GHCzsWGsb0brN3Wsbn3WEyQc6RtXV3IsspvmkOb+97/wF/lCzhiOkB8qeA9wK7oAQ0
 uMsnZFjemkSYeMjnJp2aaGmyqIgbtYw0dbZxzWRgM5uKJ5sNLba/KykctGynkh5f+liGY9Eqtix
 0jYfAnrob59RVvULl0aheLHqm2dYe2mxRyen2IPxVGbRNSSsOq8sPlpCu4hYUt3LMQPczXHzxra
 EAUQe/+4dCWG3OsioAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020122
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91530-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 14E75CE387
X-Rspamd-Action: no action

On 26-02-01 21:54:36, Xin Liu wrote:
> All the existing variants Hamoa boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on
> those devices. However, it is possible for us to boot Linux at EL2
> on these devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU streams
> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
> by the consumer of this DeviceTree. Therefore, describe the firmware
> streams for each remote processor.
> 
> Add remoteproc to the EL2 device trees to generate the corresponding
> -el2.dtb files.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>

I think subject line is misleading. You are not adding the remoteprocs,
but rather overriding iommus properties.

With that fixed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

