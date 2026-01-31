Return-Path: <linux-arm-msm+bounces-91352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLTKDEW1fWlOTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:54:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79403C125F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30C1F30038F8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 07:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B251DF73A;
	Sat, 31 Jan 2026 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXSub0HD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOio0sgt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD2628B4FD
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769846081; cv=none; b=rEFBd6T8YFA+g6A5XGkAmzl4RNuYM3DRKdR++uwxfY2wVJMfMqr/3NySLeeoaE07TfEgo4jE7+imL9Igoeyrjn3EKK3WaH3Ix+CJ5wPgm8DoucpwtJuF7XAzcjdS+iaCXq+d/aRUH0OfEnL7Iy6kjw1ZzW9sRiCE2z5wBcZZx7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769846081; c=relaxed/simple;
	bh=CWDOa3OXSZPAQCY7FNjuE0d2Db7vcuBhjJcU6z5Du68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaEp9//13qfUyoJsucA3Ci9SwMGp1DVOK8S6UobXv+Pa0h2pWe3lB9iNfmic0YYgLJzgws47potKnuKNn+75aOv5/QVjI52vOQnP7DiqFGfUJVr43KiVGAPaDJP5gwUpDce/g9ZduFvxHBxHONgKryTDj+48xGn3WY+E3Sc60sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXSub0HD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOio0sgt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4edge393384
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BNGCdgB+I/241R6e7TdCbqbF
	QIHMkedIcP3fo1ofUoo=; b=iXSub0HDBbJZF7c8ZqLFgDfRVEOTyO3PdLhPloqn
	VfizqYx/98oUCJO1ujItkVh53g4XeeTLMIDpEv+vugTMiuF5zqVYGtrYPNEwFEmu
	smOqNwijvmv6QfKPrlKOu5Nl9CjMSuhHiqzloNRVP4FV7QSxHgXRlfbN9wQd00+E
	pijhEMPG4itwILT+4aalkniebQ5yjheRO6KdQ1jSETVPSVx9OSN9EaXv1C4WQmvE
	+WeBt0QAVsUOuSarqVss9Z2SBHnw1P0oSPQwTxEzxyggHO3brTP8mXBp3q2AMBhh
	zWTH4BmzwOEHq96DdLBT1Qr4iTVKu0f/8lqmZs/20g2XOQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnrd8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:54:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a5bc8c43so869191785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 23:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769846078; x=1770450878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNGCdgB+I/241R6e7TdCbqbFQIHMkedIcP3fo1ofUoo=;
        b=eOio0sgtvXxso26+5kNRkz39w5ioyQtjRWpoyCnGmHCtEnCNaRH2ccVMb/BKJ1Y6PN
         pY+X4Od+3X9Hqz8OyTnGzxA8ooF7L4XWG0NoTp7OVO97vosmnJPSCcm04Yoni5tGYjMt
         LRKhEnk+62BcKXlY5VDzjEnaabBf8w0Z929me/DgUF48Hm4xZhXqYgwzLjpuo5KkJRQU
         gFMv3WZSnNQECU/drlQRYgwRgtw4n4QaRi8w4crHnuR7oPju5VItR3VYqzleUiMCx0gY
         to5zxDZ8QVdpuvNYdHYBiIsZ2rwe1GU/0t83lmTeXqVVaQMoChmFdPD0g0lwBBk/GuN4
         lSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846078; x=1770450878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNGCdgB+I/241R6e7TdCbqbFQIHMkedIcP3fo1ofUoo=;
        b=HWgJxhADn1QqfXPxAIc1fGN+5usFx5velkE4Niv/waIAXfs2+k5MGTKh+eDJBmmRjF
         KK5jUoPPbiJY09G17OEZWkSwtVbOcoxNVAVteh+PjVYc9oN40ld5yHstO+WHfQfaRrCf
         ZdFXC3f/XhYpvjrHZLyxiS8mXl1UfZKQ34seFiX9LrrM+l2iGE1mhUPkjRc8Oj1rBypm
         jfXtbAdc6ZX4+MRoFAs91EXOmIZWYBZnfA1anowNSj7apTKKQngoSStQ30cFH0XZUfIL
         2vpUCheC0BmAFsmYWi1PuUstg7iNvLZksUGmu6E3XBwzkcS2F5sqqgmEh/Z517ETxoMs
         H1AA==
X-Forwarded-Encrypted: i=1; AJvYcCWLZFShgmYkpEOqZN3AfDBd5fW43iLPD+nCffZREzh9WqF3tNslMSRe2LVTWsHmVZ0XIN5sRyxNuLBsedXI@vger.kernel.org
X-Gm-Message-State: AOJu0YxHSo+yPDmVE2BeExSoSqkTm/fEdybdQ47vu3VfER94nbExfCCI
	l+UVqJJM1CcXmUguakqy9pY41pG4soEAnXfMfJYANchsx9tZTqomHsc+OO3rDle5o6n0w5g75LD
	6VPQEJSw6KHqaNCAmTonn3w0eNnjQp3LkpK0VVSRGrfyMImf3t5xdzNY8dQgq4CE2r1yT
X-Gm-Gg: AZuq6aI7xKJrkMh0PThxArQ8vuaacq/mFxqh4kLZ+4icG9310rx06qlHSjRMh0XQ0Ns
	8PwluDJnNqw9LxTeFWhH8sDV6RdL9qu8uKZbbNMFTwWcdVzv9hZ+6zOV/huFtAVuII/AHc2OFxH
	t4XIwcQoHfguK6c4UuBlZoNGRvSQYvh0Rr/Q467ipVEMmscqWoDDD07fi2/ETWycfk0+8lGTpgs
	0j8zpPeuNgp5xy2osnuRCkqEaXEnx4rQcouAYMhivaZLI1J5Bs9I6+vIEHY27doUNFb0aFoomN6
	5OuD/GufKIydndKTkPC+2h7mnyZeLgIr09CfyTrCFVVgH36jE7ddalsOpw7FQliphwuw4iJYyDj
	HHwMhDFUDVhhGOrLafQmpVvmeXQ6cDQAWBSUcodmoDDZNG3JY0I5wFv9hsXIMmTeYip28PoQYYI
	C44Bzq0tcx75i8a5lsNgBEtAg=
X-Received: by 2002:a05:620a:d8e:b0:8c6:a5bc:8a80 with SMTP id af79cd13be357-8c9eb276269mr783151585a.29.1769846078010;
        Fri, 30 Jan 2026 23:54:38 -0800 (PST)
X-Received: by 2002:a05:620a:d8e:b0:8c6:a5bc:8a80 with SMTP id af79cd13be357-8c9eb276269mr783148585a.29.1769846077410;
        Fri, 30 Jan 2026 23:54:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625fbd154sm18624001fa.43.2026.01.30.23.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:54:35 -0800 (PST)
Date: Sat, 31 Jan 2026 09:54:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Message-ID: <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=697db53e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JZfQ_b1XWSiC6XszZi0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: R08fwTFszN2bb3USfXmdQs6u1TtctDuJ
X-Proofpoint-ORIG-GUID: R08fwTFszN2bb3USfXmdQs6u1TtctDuJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2NCBTYWx0ZWRfX6npC1hppT4UK
 sVnUiII5QYRBjk3lvKKSZ9jpu4TdtLqqwiMUFxcS0hsclVQpSPUn5fX+MugDniV0h2SN8amjWwH
 RjM5AjPH0oNmzFv0Q9MzBBPbNpH8szA8iYL2yDTAI2llq0cfh+7BUGbGB94CRtgU4LnhHZLDcwE
 tZXpZS/95DoT3oQQ4w6z4TOTaofTPJmif363ip+aLnJUdqxa3B6dTIbhgQLsuic9FHCgafunW9G
 tvYIiVwBEJquUQCHq0v4+2uw5bJYUorF3oJd5NfpLXOHgaDCHnatvsFo5HF5vHra5wnylZkuDSn
 m8Llk99NQ6e+0je0jfNTeEF6UIhibTxgRcIaimyBV7+zhYMmAixfyy3YiKFHPxoR+CZh0S9/VzJ
 dyASTB0fLFhKHFPREFJqZVobDt/X3nDQPF6cELrLJDOipSx4G1nsmsGJxe00dH8STMtcvJZeaNg
 JJY4vbT/EQ0FAwT7dzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91352-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79403C125F
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
> On 1/29/26 1:13 AM, Sibi Sankar wrote:
> > Enable ADSP and CDSP on Glymur CRD board.
> > 
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > index 0899214465ac..0eed4faa8b07 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > @@ -487,6 +487,20 @@ &pon_resin {
> >  	status = "okay";
> >  };
> >  
> > +&remoteproc_adsp {
> > +	firmware-name = "qcom/glymur/adsp.mbn",
> > +			"qcom/glymur/adsp_dtb.mbn";
> > +
> > +	status = "okay";
> > +};
> > +
> > +&remoteproc_cdsp {
> > +	firmware-name = "qcom/glymur/cdsp.mbn",
> > +			"qcom/glymur/cdsp_dtb.mbn";
> > +
> > +	status = "okay";
> > +};
> 
> Please make sure it gets to L-F (only Kaanapali is there right now)
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
but the firmware in linux-firmware is (now) targeting IoT devices,
should we use WoA-like names for firmware on Glymur CRD instead
(qcadsp-something.mbn). It would match what was done for the SC8280XP
CRD.

-- 
With best wishes
Dmitry

