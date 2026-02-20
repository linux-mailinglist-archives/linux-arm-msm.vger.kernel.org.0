Return-Path: <linux-arm-msm+bounces-93534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELj0OMSpmGmvKgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 19:36:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC5616A1E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 19:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF5C53037EFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 18:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64180366803;
	Fri, 20 Feb 2026 18:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WR0v7JUD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ho6qkBf4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283B630E0ED
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771612569; cv=none; b=Ic+b4roG9dahFTnGSxC+eBQJNplWnpfQBbJXXtzOggjHlTd0QS7caF3D1xMv6s+dP7i0xQGMTZQbGdfgceo/DKn4oiPU+FRmxmCZjMjBJVyWBiNkN5LlIWZnDEVYbAlpY1IuMtEtQi0uGcLL0PEHF2C7oMnqDOJh5aCEpwc2tOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771612569; c=relaxed/simple;
	bh=6BBdkPJqMHHK3Zc0r4B5LyYxE6bwREEA7qGRi2JTxt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSagMRqYCun/Rrz7tSEGZ2W3yf4rUQG+0TDNUUmQjIT8Z7crw7+DWAw2c0cvIzOiwHlG+lBtSl/MdmYLLtWLyGiPPJoX4N6Z73M/rwwYdoiny980Hpbui8XrThxwSSe+BefgH9l7jduVZ2Opm/dl+U+EQS6NnYymrbYIXGopqbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WR0v7JUD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ho6qkBf4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61KFdSUZ1805721
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 18:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j7/7cFtWPhvS1dcPn9E39BqC
	yO53/sfIBWAgvwItg/E=; b=WR0v7JUDPsyzVClcMgOPguuId1QLUl3+zclkstEY
	hn01GeWY/clspAFoIAYTH+LlDWcKJdyhGq53sZqQYZTpMKXDqR2gTGH3CyLRe7CL
	qef4SIbtSdBlOsr8DHR5myZUVDGOIb7GjoxoeyPe0+TzTqYYvVoZS8h+YRGNpMCR
	x9yPJhv9bDvZo/4BtL9bFDctdw8lPvs4Rp87vt0wzIIQji0WU/wlA3FkNSmyZmDI
	Q+6mjnjXOwRLonnUDxF4VvUqUIRWtdN7dtkhZHLcPWI8zN8zoc9rRS2tj06a8plk
	LQ7GXIMB9Po7n8bGIgLEWjdTSOhGH8kd3+k8QYC78PedZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cedsnthv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 18:36:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4817f3c8so1683365185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771612566; x=1772217366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j7/7cFtWPhvS1dcPn9E39BqCyO53/sfIBWAgvwItg/E=;
        b=Ho6qkBf4t7QGTCOMyYJsRQZjcVhwRbQWPiXabgJS/kcKCRtyf0f/FlA2FwnwfRAG2C
         qqvu8uwk1KhRPf2ap6e5/Ny0aP6sTRyNNfjRRUkMGfh7g3SCKt9NGTD8q5JYvmhJLGRI
         jSV1UZUnyCld8keRiFo8Q70r44TT9fT+PoADqb17VIrU6UFk0HqrRDxsLpZ/RLbm52vw
         /bWrRsAQheDHv6phvcQsgklXZO3by5hM28vCcxsgw/6JPytc/4Mw+WJd2Xd98IF6mHsn
         ct3p6BvH81SvTZnACieaeATDvEN52KlRGb2LvT3AB7cYl75xcYeHt8K7+Q8T8CutCttN
         Zjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771612566; x=1772217366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7/7cFtWPhvS1dcPn9E39BqCyO53/sfIBWAgvwItg/E=;
        b=Ij5rzRkCC1Q2bE3veBOFvkwcDVkMdDpp+0VKwsVW8bWMwm8t0aHu2Tk+AIZKQqlz8O
         UnRiNjxUpnswwNqvd+Hkt5dvqDFhtZbp9DwrRhx/hNVhUKoXcPmgjKhVvPuhFlcrNYZb
         sCyTTuxhIrZUK/QC+qPIDcqFc7cVmm4AjIy3VtmpUPfoOZPRkGVC+OWyPmtTN0LxgHmE
         8tzQh16BzUTTgk57NxZl67NMjyGyhOF5+GeGfmQh/BT/UAvjeD/EGpXa5Utr7b09Ldoi
         TU4les4XDTMFOZqCHpocUuq+GZoPSI3Pl2iEblUJrqxa5BpWPZ8HNuU9fhMWvNDeehaM
         89PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfgolY4g106jItCmW+yPQiqKW0bcMIbM5vPS6wui5zFW6tc4X00UM0+EV6LI28iVk8xm5GErzgNCEa44Cw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsk/OEvo4aCKsx48GahpBasKCcZUWok4KLPFk5QgSkUsiuylQl
	t/Ssq4h4g12o/ogtUsvZ0bdoXIJ/bTJPuohlseAeAJS5jXYXiuilUFoVmO21+ZZ/A8b2p3rlSFU
	8CNf4zSBFE/2FuNXRT1KT3Y+n/siIHIgQFz/eCmBIWzqlHlzoPM8IXnWFpCrWCmyCPg46
X-Gm-Gg: AZuq6aL+HBMryIAvUhFnTyvtroy8tOFArKVGJobGNE1iaGTSXdu+c+tQsGVf8NWzq95
	d/N9uimXWqAnIxjdeklqOipmACwZeTnmJAXYBXk/F0lSt2e4Wr+WvszGQt/Tqx1PSxIGsMyou1p
	+ptb6o+xj2TofzP8U1aTLffKAr+qs7BXZFJaOxsBAsAkk2VS2BfJRl5uk6ofxv5A1na8h81hSDO
	cFY749vjqGZi454Bca3xNTalfldOF7kiuw6r6BKb27heZCBCBhoSTszbekoI6xxsBkSeKLYmAYI
	MngnllcawoZ7RrlYTM73boo6VREXcL5BTOM8XevFbR/efNisQNou4hH+2XVrifHMIt7gTUeGTA7
	uHNYWnhmHD9cLCn9CTambj1W7k0ecMBAIQgK2Uj8opYtZW9ZhndSPOtLwkByQ8Iflh+5Qjn+CI4
	SoZrutHjD8+AgsOZMxhnIRDJOiV/MPHSssof0=
X-Received: by 2002:a05:620a:4449:b0:8cb:4d64:e972 with SMTP id af79cd13be357-8cb8c9cdc56mr64926685a.9.1771612566268;
        Fri, 20 Feb 2026 10:36:06 -0800 (PST)
X-Received: by 2002:a05:620a:4449:b0:8cb:4d64:e972 with SMTP id af79cd13be357-8cb8c9cdc56mr64923685a.9.1771612565785;
        Fri, 20 Feb 2026 10:36:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7a96622sm145981fa.36.2026.02.20.10.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 10:36:04 -0800 (PST)
Date: Fri, 20 Feb 2026 20:36:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: George Moussalem <george.moussalem@outlook.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
Message-ID: <s4kuwcdyaqxe2e2mw5hdfxs3527glx6yswkgynju3owktn7uxf@nm5e5vqoihvv>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
 <62d53cdd-b71b-48f8-88d5-65407d3a80c7@oss.qualcomm.com>
 <be05578a-d90e-42ce-a1de-4f670fce03d0@oss.qualcomm.com>
 <DS7PR19MB88834BFC4ECEF7CA27C379139D68A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <d610008e-bb1e-46d0-8397-126bc1e2542c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d610008e-bb1e-46d0-8397-126bc1e2542c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDE1NyBTYWx0ZWRfX5GtXdmNsKDxg
 oQvDBAwpI1pDxhRCnuRkVLxh5HwPT0+KS34Q/sBEFsurTYgqOKY/f1Z/X/AO6IG1uD49T49KZag
 +LfCEdJC8Azj4p0SamLySPlsWVgZU4Nphy8Yz0R/J+rkKbZTEjOHff/p9LUT04u/ABy2di+FTvJ
 ftSljm4C4v4H60kAcFuKfqRNiYD8TQFFYlbWpqT6chre+PlQdk4FCJiJwhO15YcHk+Gi5N25xto
 VDJQn7TcFc5I/rjZ4vgqVcBx6tFVfYFkFcga11liDc3YfrlBdLxmeLd8FUxeyZCTiWW5IXKfyuL
 d5+MsF3dJHSqVsl5xQ9JgQs/zmJeFBPI9g6ejS+UQBnX6l9Jy7avI8nE4lpNrpbnGPlwVJTBnV7
 TLypKpMlmKLsSycmjXVR0eA3DFiWO8XeiWgBgUXMWM2Wn1Bx0WDTnnLgtJQI1+taGH2xV9FQ+z3
 BpOkV22VHT9nqh9fP1w==
X-Proofpoint-ORIG-GUID: luK7mBu7UgQFqCDsAenNUHPjE0-X3yET
X-Authority-Analysis: v=2.4 cv=JsD8bc4C c=1 sm=1 tr=0 ts=6998a997 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=UqCG9HQmAAAA:8 a=hJAeSEcNMGQMv2vWbG8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: luK7mBu7UgQFqCDsAenNUHPjE0-X3yET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_02,2026-02-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200157
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93534-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[outlook.com,oss.qualcomm.com,kernel.org,linaro.org,quicinc.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cd00000:email,outlook.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7FC5616A1E3
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 03:02:48PM +0100, Konrad Dybcio wrote:
> On 2/20/26 2:53 PM, George Moussalem wrote:
> > 
> > 
> > On 2/20/26 14:36, Konrad Dybcio wrote:
> >> On 2/19/26 8:42 PM, Jeff Johnson wrote:
> >>> On 1/13/2026 1:20 AM, Varadarajan Narayanan wrote:
> >>>> From: George Moussalem <george.moussalem@outlook.com>
> >>>>
> >>>> Enable nodes required for q6 remoteproc bring up.
> >>>
> >>> I just recently became aware of this series, and have some questions...
> >>>
> >>>> +		q6v5_wcss: remoteproc@cd00000 {
> >>>> +			compatible = "qcom,ipq5018-wcss-sec-pil";
> >>>> +			reg = <0x0cd00000 0x10000>;
> >>>> +			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
> >>>
> >>> This file does not currently exist in linux-firmware.
> >>> Instead there is q6_fw.mdt with associated .b* files.
> >>>
> >>> How do we transition from .mdt to .mbn given that distros update their version
> >>> of linux-firmware independently from kernel updates? Will we need to have both
> >>> the .mdt and .mbn files present for some period of time? Are there associated
> >>> changes which no longer attempt to load the .mdt files?
> >>
> >> Since there are no in-kernel users for this one (the ipq8074 WCSS driver
> >> requests that but no DT is wired up), I would say we should promptly move to
> >> MBN..
> >>
> >>> I ask because I've been told the ath11k/ath12k drivers will also need to
> >>> transition their firmware loading from m3_fw.mdt to m3_fw.mbn, and I'm not
> >>> sure how to make that transition.
> >>
> >> I can't see any m3_fw.mdt in the tree or l-f, unless the m3.bin qualifies
> > 
> > I think you checked for QCN9074 which uses amss.bin and m3.bin. For
> > IPQ5018, IPQ6018, and IPQ8074, m3_fw.mdt is there, see:
> > https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/ath11k/IPQ5018/hw1.0
> > https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/ath11k/IPQ6018/hw1.0
> > https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/ath11k/IPQ8074/hw2.0
> 
> Snap, you're right.
> 
> I think a simple ln -s file.mbn file.mdt should work though? mdt_loader
> seems not to care about the file extension at a glance.

You are correct here. A symlink is a correct way to upgrade from .mdt to
.mbn.

Inside linux-firmware the easiest way to handle it is to add Link: to
the WHENCE file.


-- 
With best wishes
Dmitry

