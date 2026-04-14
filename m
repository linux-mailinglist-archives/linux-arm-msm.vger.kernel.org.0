Return-Path: <linux-arm-msm+bounces-103088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHuEMa4K3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:36:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D233F8048
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFE223065A45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6C03C5529;
	Tue, 14 Apr 2026 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJKMVZ4A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbRKnYhp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC793C342A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159218; cv=none; b=sI3TJ1LL859eaS4934L5WDFHaP3KzDMe52uyop5dp9h6UoNNIzSzQxQnV6A6FP7RygPso1PhMHiCy5I+fxFBtilxr0iqcGEIqtJ/y+Xq8XfdzSDyP+vbc++ZhEJp8r99YCGo+zHl3NqpEi3wz6Vxqdu7gdFwTYgO2nFZwWK3SUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159218; c=relaxed/simple;
	bh=0BPZxwyeCDxt/qQ3n1UlOe0NaqQe38QUBg+xfperdj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUY30Q9k9RYO4XMANEtJjEsQ/sVj+PmVVmnVU+IUIk4yRw0OBeyq8sLWQDHuW+KoSOZscb0RdE+C0N6WhHb+raWGPk/6r5SCZ0yKz9VfD4D5qfykDI9huvmozMY5lk/2yBs4cpcSOh/O+TGkhlt709YQUUel/FSBiW0S3cZAISc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJKMVZ4A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbRKnYhp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6XD6v3681487
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mSbqfMc6xRfrir7P9sbbGiVO
	qRkXoiDCed3ZiNBf5fk=; b=YJKMVZ4Adyx6ojrbYHIw6Si593Z37yloSz8aGqg5
	DBEIwsJA+NOP0telQpGWfp1aVu4rf4qRteIHNVjnLk8laJVWRbv6DAQ+VAhJid0d
	dxWWxQg+o3VDoXlpUalH+ii5DSmddfXh2EDnCnex4X3ew5mS/MolJf2LnzOxvnx2
	KyF0LDdv51HTDtvrzjgfYapa3kijKH2fiDjsx0Hd7KMnwbQawoh+TKd67pgfypLT
	IqoYNFyav45qxmUeSEdKcWbNpWUbigULEGQHJ/Tlk3bl4oVKslueF1IE/667PURk
	JxkGxR3dpCIgZiVEfgukf3DlPZCR4zlZvltkD9VFuJcrhQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d23f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:33:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a90510a6d1so43829185ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159215; x=1776764015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mSbqfMc6xRfrir7P9sbbGiVOqRkXoiDCed3ZiNBf5fk=;
        b=PbRKnYhpS7rvlFXBM7pQi6F3Qr4FuUq19DejxuQy+VtpeATlagjHtxMuHsN5nD+JQE
         0uhANXjeIJqZ0rLapt5e9Q7JyPpb791KnubKTScZgwDyoDhg5l5grLTYbE/2OElRBX5y
         r0viU/lGu0IhzW7kvF3kqmamlSjw1WMhJR/7nQsxAVq14HNi3DlzvFOqxiOy5DoPzA+B
         zfHzRDp2ZNtTPxMDPciLQ17SlTe+z1rdAhMjf3iA97XaUg34mG84JdpuBkxFz0q8GUdY
         pBTGH/c0ZVfiMwT2u0HRxIgAsPNt4j61vJBZLLOiZo1JoroFjUd6RJIFqd6qjKJCFYTR
         zotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159215; x=1776764015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSbqfMc6xRfrir7P9sbbGiVOqRkXoiDCed3ZiNBf5fk=;
        b=LT2Y073lZ0DzmM4MbGFpql58wgZfZkuIhU1lXdoPdZ1u1Nd7Cyx/RhLPIBxRWypMef
         gBT5e/CUJC/iqaMbDGym2ALUqqmuQD3nA3dYmpSsYzUAspYdQMqroOnivQ2HnieqH8KD
         qSuku7SWUjhFDhHhWSy5UZsecm/ZI+IqfNsFzSK1AEz53nfZ5y3BBimvnNReLq4tiV6M
         UpPhYmYKu0lM7BktP6H8CbS3UP1Qn+3B2DRbTB5coCfO6pJ3fvHJYFPSXIcB7er+q8cV
         C+LzvV/+8lZVY/cTVlZ8wrH/hRokpCT8WV1tdPIZcuu/E4f6wiwiZrBXsdBacjbIYmyk
         8Zgg==
X-Forwarded-Encrypted: i=1; AFNElJ+2HBtoD0DbITMzkInXEbVLkJtYCX11AVkVuXepuP/iE7ofSU72B2SVT+kMGNXXj9BJBchJYwC/3phA6Z4V@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/Hg1sxXmHMfZdYnebfDo8bUg+aA8ZXvxmPyrKRLuErhvSPCC
	ta8ZgIixBhMi97skqsqerhku/qHONbne1ZVFytwcWIm5H3bXnBBrvyMf62G23vNuO90mVOJaI7A
	VnkYKcqqQ+3TjlusgQwNedIJBcVA8Hv3ydR92RJ3RzhSD7tI5LIVEEhKV2iOYaD7TwVvB
X-Gm-Gg: AeBDieveJG2l2FJHCwhZKcHREMWJbafzJlkg8sRdD3XJUmVhV57EF/MNXuaDo1pbzpX
	BmP3Fjs88a3MKzVDcClrTVnb1UtrLuoQ/OBF7ALsXbt75P30xKsUL7BKnz0GaPSve41UTDTl7/N
	aT6xoCd4U5+twaYJiCeqjUKuawG22v6XMbK6+FlxnKbsVxAVcJw+MxH84GC46y9dWQ+ll0igFqe
	nrw7Vz/5E5UOCwmusze67lyhOrFyKp78urql3jB4hf0VMX3YSsIFJHHt/gHhXvKzjVC+QYEAXXe
	4CS7fAi2paVQQUgiZXDsI2fpJP43chNFIAa2yL6MloAgS8cS6XfnVR99NjU/skHd4165sOIfCAh
	M0iPsLvSfq5TBOEVGfzHyCwOPtEE2fli4bTlAtpRJjoVp5pFR
X-Received: by 2002:a17:903:3c6e:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b2c7260fb9mr194441125ad.8.1776159215262;
        Tue, 14 Apr 2026 02:33:35 -0700 (PDT)
X-Received: by 2002:a17:903:3c6e:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b2c7260fb9mr194440675ad.8.1776159214669;
        Tue, 14 Apr 2026 02:33:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45e949464sm76959135ad.24.2026.04.14.02.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:33:34 -0700 (PDT)
Date: Tue, 14 Apr 2026 15:03:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 05/11] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Message-ID: <20260414093325.clafqgd367jrqpvq@hu-mojha-hyd.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
 <20260414063128.6ass64wfi7nmtzti@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414063128.6ass64wfi7nmtzti@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4OCBTYWx0ZWRfXyhj5VmX21gH7
 Dyq+IQezNnyj+jJ+Qscw6kJEIXQPHIopEoXgsTURPp+OiqIrxCaC0dM/PEszsC6EE9j6zgftE+i
 LaBaPOX/PWCAYuZw7AIcpQ7vi66tJeotGRAyrkRwnCSDMD0Y5LqHkjjRJU/LWqXepVoq7x4cXyO
 Nldgwj3zsYKU6VDaf9IHs0PXH5kf/NrFEzptuOthxDNfmlZogH/Vg94JZk3P07K9x+9TT/npQcP
 kyvePcwsgcbH51A8pt2qJkS1y9C6V1p33IZcThKPuuTG12+zUPcekI137CPoouy+QkQEqwYPrxE
 SefL6Qn9m6op34P6udqxQTi5DrpJV4rN+VuHZd61nUYFF5ZZv4Nq7Bl2FgGgCQr1PB9xoWQM8J+
 45iV+UwEHE4dJLrG6JsDjFs1WEknOs7Dv+2znkttK3/eE9dDdnjJF7Yy1Dxrzkxt7sJg08d5s45
 FLwL+LyjNDcVN3he7eg==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69de09f0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TLljPvHKC21aDJODJdYA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 2QPYvwMi6xf8PaXDw8G2m4nW9R-EgPlw
X-Proofpoint-ORIG-GUID: 2QPYvwMi6xf8PaXDw8G2m4nW9R-EgPlw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103088-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88D233F8048
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 12:01:28PM +0530, Mukesh Ojha wrote:
> On Tue, Apr 14, 2026 at 10:30:01AM +0530, Vishnu Reddy wrote:
> > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > or QHEE), which typically handles IOMMU configuration. This includes
> > mapping memory regions and device memory resources for remote processors
> > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> > later removed during teardown. Additionally, SHM bridge setup is required
> > to enable memory protection for both remoteproc metadata and its memory
> > regions.
> > 
> > When the hypervisor is absent, the operating system must perform these
> > configurations instead.
> > 
> > Support for handling IOMMU and SHM setup in the absence of a hypervisor
> > is now in place. Extend the Iris driver to enable this functionality on
> > platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> > 
> > Additionally, the Iris driver must map the firmware and its required
> > resources to the firmware SID, which is now specified via iommu-map in
> > the device tree.
> > 
> > Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
This works as long as IRIS does not have optional resources. Once it
starts needing mandatory resources like some peripheral access mapped
before IRIS is brought out of reset, it will need a resource table SCM
call, which we currently added for remote processors like ADSP and CDSP.

Let me know if you have plans to add that. I have a few sets of changes
in the remoteproc resource table and an API which we added in the
initial series that I could bring in.

-Mukesh

