Return-Path: <linux-arm-msm+bounces-117371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zHx+J7MtTWrawAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:47:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AB371DFFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:47:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dNHpq9Wb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kEo1iI7g;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117371-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117371-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17384300C83D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 16:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CB826B74A;
	Tue,  7 Jul 2026 16:44:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F7A2EEE75
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 16:44:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442648; cv=none; b=e9MsRt11E/lGdpNVjpniGcoDAmXIG6Kxd/w8gw7i3124KZye6bEVwj+E7TzO1jUjIdD6IiDvBZKfCpl9fHBrtGk3AMbAvVJkuZUAbua/Xe4kk2ph3QKOMpNE+QCOlgllKQrpM7i4qh3XrV00n6JxF2lAUeQPZECzKRTNNYOTpn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442648; c=relaxed/simple;
	bh=EWR8a47plqgBBVMdf1PmjfxiUoXmk7R5ZJ2ApF+iNyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAVLyHxZXttb0y5oLX/4LnJFiSGhEQ7iZ+PuUlqS+2w+nYJ3eqehBJIBj1EXU4EajLQSmtH+rpuY280L4l8kLVNwcLUqlQYNNVkzhcFceOWg54PNteR8+ECbEqYDyMGN5YitE/CgVanY8efMaa9DKhORkdEH3v8ZdCQ7Y5LxfBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNHpq9Wb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEo1iI7g; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT82S017943
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 16:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=msao9II978EcbWLPZnJCBt9s
	YRcY8oZ8a4mvsNrHSi4=; b=dNHpq9WbgYw1Yh7gHPw96BHub3pYOw90FAbN9wm0
	3LCNHMJwMcJ2fRRj7gjnHZzTMUmAqr3Ps4CiSZ+Akp49ZkxWWvR5RdRVwHr0W/ZN
	Tf5nyFuGg9QGqjcOiB0hpzdd2N7ao60Fs9LTyxu4WbO2xHPpBhp/qmyNk6qC7qIR
	Jvpewwb+cF/Ln0+Ec3NBwkb8EFuG2d24UjrjqmhbWMpLuJZM9Og8yNJxW146sRr9
	QLWEPOZXsfm/VEssXLxUr6lXo0DkVBg9et/mQv+txWMU0j6AASXTpmukXTZhn6eP
	GYUJ4bg9xfhjv6LLo8R7gcsGIMCaaSNSSTJ0LTnWXnhB9A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep28dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:44:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-739b4a4301dso4142235137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442645; x=1784047445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=msao9II978EcbWLPZnJCBt9sYRcY8oZ8a4mvsNrHSi4=;
        b=kEo1iI7gzA5fPDdxAbeuTsyLBeOp72dr28xF9v9hrgTTAq6BJ4ypaCDjA6CG3KCn5o
         NSFpdu0N+pEFlCQE9xwREgdCP0uIpZebkZ0T7NLkMsMfPfpURL0qLA9zlpsf8nPU7rC5
         6m/QvmYejlySopuqP+3zOWeBlEEKlWCM6jQ4UtYncQYrY5Ifk6tFgGsoSONAvr42q87j
         v9b/m91qVWCBsWb0RWtdd9mIshdCijbTmn8UOc5xaDzG1ScBae450hXRWrRdlt/VEDzY
         Sw1MRa4c80nhP538CpHSnO1KG9MinkC3Vwx8lEs4Xo6/szjXFIls7nKXHlmyHytdex0Y
         Xj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442645; x=1784047445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msao9II978EcbWLPZnJCBt9sYRcY8oZ8a4mvsNrHSi4=;
        b=LTOjzv4ofMBphSCmBRUUsH35Mt4ItuFhP0TzpW9+sDgJ5x7EknCZG1H2z2a6G/i5LB
         311cfru16ed9jubN4zeOCcGh0zoxHh3+I6YsVwmO2JGkEheevY/zwIbsq/flfMIQsEUe
         ZICU4BMfWHuTuUm5ZpPyMm1eHPKYuXQBe4T6xJLY49/Xo6qV4peJq56OamujVzzbYN7B
         tMFF4VtrgMzNlLekCIc1Wv8c2y3mf/T0Xoi3NKbXPw5K/3pPCv2A5cK+GFNzuc3huXa2
         Numu/yL2/xpES83+DlkhCH33/i0FFE+JteosGLWePOTrirVVhJNqzLT3QpbpVTv5t/Vf
         zOaw==
X-Forwarded-Encrypted: i=1; AHgh+RoBCkmUlrY7lGHghApot+5D50rOiTUx0VFz0pUsLJG7Pmvg4KiqNfclWCFy3ti0fQrdVHJtrJiNxvWib+BV@vger.kernel.org
X-Gm-Message-State: AOJu0YznmAIC1j1EwUQH1f/p8BRettYzRESdEL3Ay65MpzowAcSviDOC
	KTh2nOHhPbYVF/Y9PZWOIEvTLudDQEPhhWBG0tYPAMj5pjQlcCQ7JJE0HutPNgpn8mk9PHWGk/c
	O3G5dyGaCOzEG1Y++svaHCeiWP42BhHDjf1AVAW5U0YaQm2IevWjLOV2fbG5Jl2XZfSzf
X-Gm-Gg: AfdE7cn+GQSsl7X/5cNAShvfvYV7Jc6OFcEDKB6zclzzH8vNALcSOUc0D644OiV0lzA
	oN6f3/hgsHQivncDbnI3pTCv5XxaLJ+DEGgyiOStGzaxtjwCTejQLpAQ842HYleHvjq1tDkfs8B
	hF7u3Vnzj/rgWWuoudegXYUo+5+xuTypFDo0u8dD4SHfAU/GsmZ7ZVvkXuLkaFkwnXt0IL583WF
	tKmvb9Sv8TmMJAWBfmDyG/RgNQHUkveni0UYXGk4p+zgK9929ZAb14PPG5N4PqxdVQvKw8EDT6L
	Mb5/oPiMzYii+4lzDkFvSWnUVpujkcPVFBIAsVYdrSHJeG5Yjrq41WN36Z1nD3AlVWJ+fctB7fu
	lnUZClzTVIQmHtqba+Cjch1IYeHgd84eXgJ+blxTW4RazFB2Col1GapT0OyDyDWAM8nDnM381ga
	bRgrKHfgmC7UwIXATZHWAwpDvQ
X-Received: by 2002:a05:6102:a54:b0:738:6994:eb8 with SMTP id ada2fe7eead31-744b7826cd0mr3376463137.0.1783442645227;
        Tue, 07 Jul 2026 09:44:05 -0700 (PDT)
X-Received: by 2002:a05:6102:a54:b0:738:6994:eb8 with SMTP id ada2fe7eead31-744b7826cd0mr3376435137.0.1783442644651;
        Tue, 07 Jul 2026 09:44:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbbbsm3826799e87.43.2026.07.07.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:44:03 -0700 (PDT)
Date: Tue, 7 Jul 2026 19:44:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <a4f5sod3aflubxkk4mm4k5ozddydqcnqeac4s6vnozkd2nvxbi@hmh6zclsw5z3>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
 <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
 <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
X-Proofpoint-GUID: Pi8L_7dxnTT__LMNBGLXYcLp062sqHwE
X-Proofpoint-ORIG-GUID: Pi8L_7dxnTT__LMNBGLXYcLp062sqHwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfX91Hisv+EcN30
 iQ/jaLLgydAHWccqBdl9l3HpN5XlL6xH0vxMEc4j9+DqItnj0V6fjB0sSxeuNXwztj7xYRAmJiN
 I3dqLAg5P1PT7Q8QPgyZs98sP0aNNwSkI3R5YM5CImPEu9XL7h4YwR+8E0gXXtHIAybqSmq+XSr
 WEXjsDHOjAVeEQRJp1YI5luDW0qKxIKHQuMl2uOcMqJktLvAHwXvtvbAGkwB+Vc/uS+M5pOuf1Y
 kehEdIOLIb9Ehc+YPS9rtDpSmckH7iO211MtnU176zH9+Sk8XB3NvIgE+w4eFJZ5MbBdOyoBe6A
 7fh5iPnevrGUqcscF8ZA25fcFT37pH3WZmHZkcBAsPmIGZm8oSixdouPrfVcLq/UTXKamN1CWMH
 60CYRO6CLVMGiYBbTHW+tKCyGdaLWQM8SJMJadtgZ5WyUi8vCjRzJkiykrgo6DQgMCMCcZLdMyL
 y3pqWKyZ0ZZMlxq2GwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfX44btLbD/tbD4
 xx1Oq64UuuuTdGtnotXUiP0mmfh9JNnRvfNXLQVAYEuiQEJb8S1oDq3TH4vVqkWw6kewu35vSbJ
 18DuV3N5jHWd6fCyC2twCSOL1sEHlYc=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d2cd6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=c3lE_UrMKrngV7lMyMoA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070164
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117371-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,hmh6zclsw5z3:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19AB371DFFB

On Tue, Jul 07, 2026 at 06:37:24PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 7/6/2026 11:12 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
> > > On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> > > the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> > > are accessible. Without this vote, the SMMU may become unreachable,
> > > leading to intermittent probe failures and runtime issues.
> > > 
> > > Add the required interconnect to ensure reliable register access.
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > index 90e50c245c0c..721526f023dd 100644
> > > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
> > >   			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> > >   			dma-coherent;
> > > +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > 
> > Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and
> 
> Added QCOM_ICC_TAG_ALWAYS, to hold the vote in SLEEP bucket as well
> preventing gem_noc going to sleep when icc_set_bw is being called.

_why_?

> 
> > then drop the extra suspend/resume play?
> 
> Not sure if I understood it correctly.
> Did you mean the extra suspend/resume play in arm_smmu_runtime_suspend
> or in arm_smmu_device_shutdown() path?

runtime_suspend/resume. I might be incorrect here, but I think it is
exactly what you need.

> 
> Thanks & regards,
> Bibek
> 
> > 
> > >   		};
> > >   		gfx_0_tbu: tbu@3dd9000 {
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

