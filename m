Return-Path: <linux-arm-msm+bounces-116987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2UjfDID9S2rmeAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:09:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C7714D27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:09:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IMzSRlpG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Ht4NWo/5";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116987-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116987-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D131C302E30D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 17:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72403374A0C;
	Mon,  6 Jul 2026 17:32:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B55A384233
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 17:32:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359124; cv=none; b=JEpRK/ECi50RZ7MRXJH3xKhL7kRVjTcJM6hAWgeFHzMExFjUd1e5+DKppqbiDM8HjwkgZETOH/N2yNHseIaRgMC5qmIRoGJLzZeySv25dqxN2JpBM40ir1bNt2UJZ5t5X9/F+vKwOxUqLtNfMLoirVHQFJ/WSj3y11ogGtMiXeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359124; c=relaxed/simple;
	bh=XE18ZsxjLi84XUKQEP8W66jJbMRQO4F1YjAnbU0F+RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SE8FYe7S7UVV60Lj+XYk8cD5LhufDXCLw4lnlxHah+D48wnsdw5r8E/846Fpm1enVWi9sYPspGb//oZ+VUDTpSBq1pxt1hjijU+PmD/g1DbuMMywfVwUpDINdiVtZMDNZihDt7o7kBFChix7LN+h5aMCS/e99hlg/H2y8NiIFI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMzSRlpG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ht4NWo/5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF2uq980949
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 17:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bH7ft7EpbgAlMoerwx6sDZPk
	Lvb5tLjWY/Dxs8VQ1tk=; b=IMzSRlpG4SLSd7P4qGK2S3t8cRMUQsWf9CwWZIX/
	kMt/NM4hOBSN1Kq621neogdkBl7620Dwx4eQ3/o9EvCAvRX1sG4JM7giiyzw4gBw
	8cK1ovnYiZz1qTZJMy87uFP+Se0oCv2tY/SkK5HPhFJxajVZlr0n/TEV83i4bhOK
	gU5KRezQ0jFo13q4Qs0ECGKUmrUIYjQp6CeGNKRLy9zznk/e5Xz6c1/WA0TVds4m
	9mqpLZExUjc2B1ABRNmuehZaUhtvZsVemjFAPCuUMyA/hGEm/4j72+NDErSOiT0e
	LCByZEtwR/nHuOJ9yRmFW8QvjdF65FGF/TwHjiTfmrl06g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgt95y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 17:32:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88ab059052so57025a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783359121; x=1783963921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bH7ft7EpbgAlMoerwx6sDZPkLvb5tLjWY/Dxs8VQ1tk=;
        b=Ht4NWo/5LG/y9cqE/AS8/gqZ4FZmQp2Jhan90w92pFZCUAOBJWKGAb1rtPq9gHOH97
         tBLf/t3poFgvJVfSYa40FoknVohFnwMGXDLNp8q+KONM2ZCHdw2AtZZnEgR1tHUPlH1x
         YkexmAbqZUDDnckyICL7w6qnHzH1Io/ZT2zDJZAOcpn4j63JCcSJRdKNh6vlyJC5Vj0C
         RZ8oWauJ96T1DzeBWkLMRcdLAsy/LuDe4CV5jJGRZH/JAlULhFsXRsWa/UjhbEnTUgRD
         vpzspgeswZMi4cXr5ZoGCNT7TUWwSaU+XxuSCINTEuVDw59eX0DPRVj8JBovEy84E6qS
         ohOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783359121; x=1783963921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bH7ft7EpbgAlMoerwx6sDZPkLvb5tLjWY/Dxs8VQ1tk=;
        b=st3Le+7aP/zL1CIUTP51hgeUTKBVFBJZJMz+5zA2Y10nOmeeTHs97Pomui0iWgIC4a
         On6AHAt1aWr2w5ngvYZZAqaAgGNxwfJftLhPZ3f9jGE1+TuIz467056Y0aLuG2uHJ2ki
         eNjd0nhENRgA+NNHy6fbbjMaTHcclnBJDrrm5LGmaU4L6LCw8EdVHsWYma0GJ8shhOQZ
         VxfeDrEMAEosXHmuTfEmQLr78X3beiOGf8TEfdyqKLM2B3KdWVvPKkHW+c59VTkBAfLT
         53Gge1gWoR/D9K0C1+KhIBUxVx1Ak3yVl1JskmDR784SRpZd3tTCCP2UVr4C1IKRUJs4
         L1ww==
X-Forwarded-Encrypted: i=1; AHgh+Rq2f3oZN6XJUGNApC3cnuosZRCOsH1vZ1b4w/GGRlu/1JSTwtbgRtLLH/Nx3EUKlcz7s4RxHYI8qn0wo3M1@vger.kernel.org
X-Gm-Message-State: AOJu0YzNJXEYQk/h2Wk97xDwzEx3awFmH2eY1MlNIP/sZp4z93TCLRWQ
	5pgyIQHfc2yZXg6T6Oth3/St2ojjqHzKjfmdgDDQ73YS3nsZF5Xg59KrcHeQMxeksUp4NzNM+Ej
	7OpQJndo3EjKXKrCip2AuMsKAuquV2FslbyakaaEhbgKhcrZj47AjlCE1dbW0BCltCy8a
X-Gm-Gg: AfdE7cnndv+ay10rNC3+vjW8vXTNKPB+8SlcB6eZl/RLBx9RCMQYb/DjC9qXl4YoG6N
	qvaI96aOfq9xqGMxgPDFd6YU7xy/tP7QDnSgCsPQC7+6e7FEy1lZ8oQEWfjf3S1RA8cKvCCQReg
	C7a6tO2UdZFgiJMt020iETAr5ss5fM4F6Xc8E8DeuHvKp6cGmB70dzsV6zRmgf4TIeh/BiO0LQt
	HpinvW2gW/919K4sDl1jabgicwGP1eQAOE4EPCC+GpZBSW3J5ylFW9D+H3KhBCBDLwhi8enfyGc
	1jczdQxw6w9jk48RVUA4UDKm5Zr8L52a/76MYFWTOjJ69QntOA+mDstyTsNb4rr3A2S1Ww9lPz8
	b3L+GFzTaF5bJizmpInKsIg8V7xxoyFj68CQ15w==
X-Received: by 2002:a05:6a21:4d8b:b0:3b4:b259:74e3 with SMTP id adf61e73a8af0-3c01cb9c437mr16566249637.31.1783359121247;
        Mon, 06 Jul 2026 10:32:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d8b:b0:3b4:b259:74e3 with SMTP id adf61e73a8af0-3c01cb9c437mr16566189637.31.1783359120524;
        Mon, 06 Jul 2026 10:32:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm88488369eec.9.2026.07.06.10.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:32:00 -0700 (PDT)
Date: Mon, 6 Jul 2026 23:01:54 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 1/6] remoteproc: qcom: fix sparse warnings for __iomem
 annotated mem_region
Message-ID: <20260706173154.g3vhb52tkjchftmu@hu-mojha-hyd.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-2-mukesh.ojha@oss.qualcomm.com>
 <62c91b74-ca1b-44be-8771-669aa686ddbe@oss.qualcomm.com>
 <20260622155050.yvgffdapdjb5f4fh@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622155050.yvgffdapdjb5f4fh@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-GUID: -XCeL-N_gTRbPEr7NeunyAGEPNq2Gq27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3NSBTYWx0ZWRfXyFP9g+8Hw0qR
 Vf8VAaZQ2ilvjOE8RzxMKpZ+HTM1G+cd7XRt5ZJrySYMGCHvyLP3dqihhtgqAgrwcgRXg/xIMl7
 w6U7J8nkB67vAuLV+uhhieV8GZP/gmbYUpW4udCYW4HLrjlKSOSRxzLRODWA0JOZQxZradNbYyv
 LXI80OrA9UQdCLi3qNMGCZpfxzjh38Ogt4i8o76TXHI/ep6SgP+NcJtu2eSKqrGHmfyH6x0glMc
 sDn8jdqj1t0YcouV61GtjnaBEtCS0MCltGjYcNi3eOz3i05jM0O46Q5N/GyLbMJYXNX+KNnKo3k
 8TGUjtfZcVSDqG5u9/IQsyW2Ij++hoNiCxrJAbqqwAple4WjcRK1TMTqOF+KFg1YsIffleweNVH
 ftBAQsO+0+UwiLogKwQkfbID6Weusyf/1WfhioGMr45rym+TwKjgJ9EADRNpIbIup/W77uoacqD
 /jhwRDMI8iMt8NfOiQA==
X-Proofpoint-ORIG-GUID: -XCeL-N_gTRbPEr7NeunyAGEPNq2Gq27
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3NSBTYWx0ZWRfX+KldFCrc85Aj
 C6XSvpfArjEhTaE+KOa7iP50bCgh0NXUdVz/zv8xq2c/ZUy0ryUuKWeFjswIHcCIF5b0/Lxskk0
 V+bQLudURhvbUOT8OcYxvj5Glz0I5Hc=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4be692 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Q2gTMR_NNKpv4EgecgIA:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116987-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D3C7714D27

On Mon, Jun 22, 2026 at 09:20:50PM +0530, Mukesh Ojha wrote:
> On Thu, Jun 18, 2026 at 03:53:22PM +0200, Konrad Dybcio wrote:
> > On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> > > The firmware memory regions in qcom_adsp, qcom_pas and qcom_wcnss are
> > > mapped using devm_ioremap_wc() / devm_ioremap_resource_wc(), which
> > > return void __iomem *. However, the mem_region (and dtb_mem_region)
> > > fields in the respective driver structs were declared as plain void *,
> > > causing sparse to flag address space mismatches:
> > > 
> > > qcom_q6v5_adsp.c:639:26: warning: incorrect type in assignment (different address spaces)
> > > qcom_q6v5_adsp.c:639:26:    expected void *mem_region
> > > qcom_q6v5_adsp.c:639:26:    got void [noderef] __iomem *
> > > qcom_q6v5_pas.c:141:45: warning: incorrect type in argument 2 (different address spaces)
> > > qcom_q6v5_pas.c:141:45:    expected void const volatile [noderef] __iomem *src
> > > qcom_q6v5_pas.c:141:45:    got void *
> > > qcom_q6v5_pas.c:637:25: warning: incorrect type in assignment (different address spaces)
> > > qcom_q6v5_pas.c:637:25:    expected void *mem_region
> > > qcom_q6v5_pas.c:637:25:    got void [noderef] __iomem *
> > > qcom_q6v5_pas.c:654:29: warning: incorrect type in assignment (different address spaces)
> > > qcom_q6v5_pas.c:654:29:    expected void *dtb_mem_region
> > > qcom_q6v5_pas.c:654:29:    got void [noderef] __iomem *
> > > qcom_wcnss.c:540:27: warning: incorrect type in assignment (different address spaces)
> > > qcom_wcnss.c:540:27:    expected void *mem_region
> > > qcom_wcnss.c:540:27:    got void [noderef] __iomem *
> > > 
> > > Fix this by annotating the struct fields with __iomem to correctly
> > > reflect the address space of the underlying mapping.
> > > 
> > > These regions are subsequently passed to qcom_mdt_load(),
> > > qcom_mdt_load_no_init() and qcom_mdt_pas_load(), all of which take
> > > void * and use plain memcpy()/memset() internally to write firmware
> > > segments into the region. This is intentional and safe: the mappings
> > > are write-combining (WC), which on arm64 permits bulk CPU stores
> > > without requiring the memcpy_toio()/memset_io() accessors. Changing
> > > the MDT loader API to accept void __iomem * would be a more invasive
> > > change and would affect callers.
> > 
> > Zooming out a bit more, should we even be ioremapping these regions
> > in the first place? Are they not just RAM/Normal Memory in arm parlance?
> 
> Yes, ioremap may not be required. Don't know why it was kept in the
> initial implementation, as for most Qualcomm SoCs this is going to be
> normal RAM and not SRAM or something, while other implementations like
> qcom_q6v5_mss still use memremap with MEMREMAP_WC.
> 
> > 
> > Would switching to devm_memremap(, MEMREMAP_WC) (like we do in RMTFS
> > today) be an even better solution here?
> 
> This looks fine and I do not see any immediate impact; however, I would
> like to hear from Bjorn on this, if there is any history..

Bjorn,

I was looking for your view on this before I work on its
revision.

-- 
-Mukesh Ojha

