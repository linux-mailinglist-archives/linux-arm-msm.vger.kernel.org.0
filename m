Return-Path: <linux-arm-msm+bounces-102974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHnMLFoB3Wm6YwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 16:44:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 610F53ED76A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 16:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C7CE30432EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935A13DEFEA;
	Mon, 13 Apr 2026 14:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZWmkokl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9A6ms9r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6603DEAC5
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776090885; cv=none; b=NmYQ53JA8UZDX4oplBJnRW1oFOInasEZg4aoZ1xnElOfwQrcwpkzNGVH0kmUZFgmTbBtHQIPZoKuRTrcoyGaK4T5Z3qS/1Gx51X91DN1LMJijMgIuDkgLwko3CFynYlGrNvcRsHwyura/dlV/sTmRjWK/ly348DyO4G6O1qD3LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776090885; c=relaxed/simple;
	bh=CdNj/EVBvnJwzqhkF5S3XaQ/lNgQDLJPYlQQ2PE6P4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LY3syQnZm+50apkTlroIJzf64/XzeOM3JdJm6eJoOmuQ8ZkZ7lzk3suQ4YPYcOeYzXV71cehgsz3ok2ja9FzbJWI0OwkkkpM7tYzRg13BzMYsNhorhhvgEbOZgjcBWatU8oyzOoShsbgHPp3YicEm7y8CIZJ5IoQIYBGFfaufUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZWmkokl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9A6ms9r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DEJJhU3539272
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 14:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J511wH5FlpfDanfQEjJYrxwz
	t6mB/ncXMWLvOptG8iA=; b=ZZWmkoklhQSW4T5Rs5Ql9RtSjCr40YsOmZedzEKP
	0OJsGWwthH7DDvR8O+6FoVTXKS5jdDMV0UwNUx+lJpgL5AGzxTzAST8tO93OiENm
	aEc207yF86eOX+St51ohEQM8UhsvrYCzCP5X8A3cqz8SG059u6jkotD+oUjeB1nW
	xCRfRKMGVIv54rb+DmawC4U7ydtNudN5bTnOhfzNT6bnOo/Nv83tmvGOKtMBDnEJ
	lyWF4lqqdPB/2x7ivtgNBePbFWinR8VqJeGWn7RAMkPWVdyEa5mVXe71t+/u8NFr
	ZQhY3oQlWl6Ed3ljR6uVSUPw0U633uasSFtD1bFEDJfjew==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh258r19r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 14:34:43 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1275c6fc58aso5783038c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 07:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776090882; x=1776695682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J511wH5FlpfDanfQEjJYrxwzt6mB/ncXMWLvOptG8iA=;
        b=R9A6ms9rQgtKtKVR2gZG5ycl4VBMgXwLPWMDO2335xxQl31moIFK9iEIax3gmO/0Qc
         g5olIvHRcoxv7WPKwUs7psiiFeI2TS8IOsN29VffKPLwjpw+nw1EQQ06BKDBfjDfXJjx
         fBlmQ3w2cQiJWUE0QR7zsUTesNYkEr69m5hiE+Y1HgRMgloaVZMrZZkbL643Jgtc+32F
         DX7M5axsmIWhAQPFna+tbs3KT+pXXtuqrj6kkZB+E2vOL2nvwiAjxt1ezl68I9hE47h5
         bS882cCTN/rMAN0TsSPe/ZNjIcal1bNZ/QAx/oP22o/yy7pr28uydiALHthIJWacYTm1
         rB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776090882; x=1776695682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J511wH5FlpfDanfQEjJYrxwzt6mB/ncXMWLvOptG8iA=;
        b=Jk390fz7K/LIRrPECXSx/yKB3I1vxVKpUf69ZkPEat1otWXZW0HTMWXJBDuzUgJf4x
         rOeF/93DmwzUHo8+7v5pqpWR5CTfFWRe+6kSzHWSUKJ4HCgkiQk0fBL8Fvri3WTQeE6B
         r2p8Uu4oymLYvO0x6zwIhVUIgujqEVChTjMMIzaNDXpRK0GYdlJHAuOXZloulg9qEXA4
         eb+HTio+N+nur/de9C8z8xNoJR44sFWL4YaHzO1XVKSc2iyGCmInb7JdjYleotIEHkEO
         eQNjqMt6JKRVnWDTYsxyimd6KvyUF+6NfNyypsIdMDxDxJR3l9Cr9XvTTcCqyzA8HDpM
         F1DQ==
X-Forwarded-Encrypted: i=1; AFNElJ+78zA/m5ANHg2UgqHVCBUz+Dz+tvDkJhu0ukFBp3DufHcZ8/r2my4s+8NWdZMNKJCIEoKwCLmNuHR8/aGr@vger.kernel.org
X-Gm-Message-State: AOJu0YzPBu6UTsrX++gRlNpq0wDTmc1UHQe+2rEnW2g4k/rFw+/lgynF
	WOMECO46QjrSUtm08Mo7XI7kX+QFUZfCFKCvsX0PktginALU/HvA25J/y2BuTijobw8Raxhl99c
	/mk7Qx3tk4V5r+n7ngwlJhXOwG2NSVFn9NFPe2zUO6I97bHUtFfdDvNDJxas78yWoN8Nm
X-Gm-Gg: AeBDieukeugms6PcovEjufkdIGUMPJH6FxLmglXcY28S1Hzt1sur+Q/Fy72uC+hl6O7
	o6fNQFaZYaI0Q4x7QJmJK2bidC3lecYJ4uc4FY0EJq5Z6l5Zzd0aSWYD5mB4MFl20s63pYcN8rI
	9NjIPcVgRJRV+XG+jaZ9d2H/TSA6L/n32QpjKIMLiirFQoojgJNfKkHrDWxkG+zy0J2QKmAyeQK
	qW+t2hwJsQdUphEG9dP8LBJVhpH9oOnxemElU6uwh816tbNMSfFFUWPcZzbP+JtHG3vuI5fd/5R
	ndmMo1B7iSQQ+ODG7dtBmzDuawMNt/3KvEv4mN9rVNrqdS5POPM+qE9Zo6fUupIh0Y5HOIe5tvF
	laolSpjxSlJSSWgleUckpAj5/GiU6YOcse8MPBAoZ/Ys1suvdInYJpvYTin7Hqhoh
X-Received: by 2002:a05:7022:327:b0:127:9e95:a2f with SMTP id a92af1059eb24-12c34e714e3mr6704281c88.2.1776090881974;
        Mon, 13 Apr 2026 07:34:41 -0700 (PDT)
X-Received: by 2002:a05:7022:327:b0:127:9e95:a2f with SMTP id a92af1059eb24-12c34e714e3mr6704249c88.2.1776090881212;
        Mon, 13 Apr 2026 07:34:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c4acc7d6fsm6594668c88.5.2026.04.13.07.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:34:40 -0700 (PDT)
Date: Mon, 13 Apr 2026 22:34:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Message-ID: <adz--4_2qAs7lkTu@QCOM-aGQu4IUr3Y>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
 <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
 <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
 <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
 <adzrY4AijnKqXDrh@QCOM-aGQu4IUr3Y>
 <cc08a091-9f2d-48de-9284-2f0c68fd343a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc08a091-9f2d-48de-9284-2f0c68fd343a@kernel.org>
X-Proofpoint-GUID: JuPaYAI52Fhd7_Dw3g7eFsj3IHlELXSo
X-Authority-Analysis: v=2.4 cv=Vo4Txe2n c=1 sm=1 tr=0 ts=69dcff03 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=9op85udBEjPWsePlfHIA:9
 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JuPaYAI52Fhd7_Dw3g7eFsj3IHlELXSo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE0MyBTYWx0ZWRfX/thipqmif0uF
 AGSDHvkBZdSFZv62/K8K+8b4huRXqNi4U9R7lzvziXYAEKuP0OtJpQfu/PO/77boRbG0TjNo3fU
 F7YVwVxWcM8LD18YgP817f1ZJXXh+HfQ0TodcIEnh8WSVTOAG2EXN48USvP5DMUM6gyrxH+CEW8
 c/A9JDAFvjqG9e80ksGJhSHMRZApHFn9BweVMldlLhzKkb/SnfyFPmhD6qllR+gFHss35Fc9aoo
 W01AMhCOrkbsqGxuL6hJ84N/81z5dC9gxUM95OnDPpYB5k3cCx4rMo9+UGkcq6Oe9IryQa0xHyU
 cNGYjUUxsIx0RmGu2OshJ5vgevRAD2dUw/eswiFgjC3LWbnTIC/KuNy/6P2oWTz2LpkSKPRythp
 vfhOFoOO2+VtGFZTf//9KKS0p/5ivVgpt9VAsvSbqYk9k4oJwSdpbPVAbjMKSw6R3SrYdpinET1
 VE/aiivYQF/qIn3bIjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130143
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102974-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 610F53ED76A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 03:30:28PM +0200, Krzysztof Kozlowski wrote:
> On 13/04/2026 15:10, Shawn Guo wrote:
> > On Mon, Apr 13, 2026 at 02:40:18PM +0200, Krzysztof Kozlowski wrote:
> >>>> Please organize your patchset correctly.
> >>>
> >>> Are you asking for a big series that consists of all the new bindings
> >>> used by Nord DTS and DTS itself?  Unless this big series gets applied as
> >>> one-go, there are still chances that bindings get into a kernel release
> >>> without any users, e.g. subsystem maintainers pick up bindgins being
> >>> reviewed, but DTS requires more iterations and thus misses the release.
> >>
> >> Please follow existing rules, communicated multiple times on the mailing
> >> list. Qualcomm also has internal guideline clarifying this.
> >>
> >> Below are some upstream discussion clarifying this:
> >> https://lore.kernel.org/linux-samsung-soc/CADrjBPq_0nUYRABKpskRF_dhHu+4K=duPVZX==0pr+cjSL_caQ@mail.gmail.com/T/#m2d9130a1342ab201ab49670fa6c858ee3724c83c
> >> https://lore.kernel.org/all/49258645-d4d8-44a5-a4fc-b403c926a5d1@kernel.org/
> >>
> >> And how to do it:
> >> https://lore.kernel.org/all/20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org/
> > 
> > That's what I'm trying to do, posting bindings in prior to DTS, so that
> 
> Hm? Nothing above claimed that. I am sorry, but which rule either
> communicated publicly or privately encouraged or even allowed that?
> 
> > when posting DTS, either bindings is already merged or we can refer to
> > lore link of bindings.
> > 
> > I still need to understand you comment "Bindings come with the user".
> > Are you saying that bindings and DTS in different series should be posted
> > at the same time to show bindings has an user?
> 
> I am saying that you cannot post bindings alone where there is no user.
> Why do want even such binding? I see no point in having it in the
> kernel, unless you speak about very specific exception, but then please
> clarify that exception and why it applies to this work.

I think I'm getting what the requirement is now, but still not sure what
the point of the requirement is.

- Posting bindings and DTS at the same time doesn't guarantee they get
  into the same release.  It can often happen that bindings are merged
  alone into a release.  So it doesn't really help to avoid situation of
  there is bindings in-tree with no users.

- From what I can see, there are always DTS patches coming after bindings
  changes, sooner or later.  No one would be bothered to submit a bindings
  if the DTS using the bindings is only kept out of tree.

In short, there will be Nord DTS using the binding coming, and I do not
think posting them at the same time should be a requirement.

Shawn

