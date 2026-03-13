Return-Path: <linux-arm-msm+bounces-97586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GQJMAs8tGmDjQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:32:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 021CB2870EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A01430182BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3AC313E1B;
	Fri, 13 Mar 2026 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPkT3yfq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNZKNe/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA8248F57
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419226; cv=none; b=bTFLvHVCXqLeWPrWWkqDcn5uvWdxXjxIQT+UirL98JLgnXhjk0eGjvrEouc4nTG0Pgh1PvrcoGKgopqVCW3RtKyGuUjoE26FMMB5bMMDeHSuDq2IhQiTLGemSf8gfjGT4KJj4MGyUIKjCEbXF7mxunyUX5vHU7Nqe8GYukkpKds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419226; c=relaxed/simple;
	bh=voyBjdKSwkLamyDzriTV/RfjsDyNQSsgghCmX2j4XRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvgM74z0POpzppF0Qc29Df9N8MjwrC50CAUmpS/DYT3gdAko95LKT6wiacRQfAjLcdgVFWbpRm7aQhhh1IRGKylMETQ5De3PAJg+ebj7D2plKaW3RixoQAyTwdaPQQxO7EYOB4L7N8wJfVlwAwek/20T2wU/+TnSg+FxFvldDcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPkT3yfq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNZKNe/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA8Bl31749668
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lvFSFt+UmAAWATy47J/WKBKc
	fySPAKwdTq21sXgGZIg=; b=GPkT3yfqOjk2uLveNpnmXJSfgLhm+FhlXOGk01vW
	lXIj6+r0Qujq0lq8x8KjGdv1bkyALq4ci3ySLmXXkYh6qO+DfoGaE92tDtpCiyvE
	YfKLlvWa4S15wXn6XxZBLdomVcvkTLqlc/1Ht29tzR93V9IvJ5zoGhrveF0GupBV
	5nATwGP+VHIXwh4L6lSUgDhRAJZ8tPwfOIaRkBjW3mOsUHRHhSh+PVrSA1FDEEB+
	PXxdS+IdKbmiWjgyS5Ka2XTQ4wIymnm2wOlx06ZEfo/OPiJDuNW07n0z9iPdRcXo
	tUu0iyeI04HI4oeANLy7ayYW7y6aoOMgIRMyY2GuSiv+nA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6h8sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:27:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8b37d4b2so1708113785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773419224; x=1774024024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lvFSFt+UmAAWATy47J/WKBKcfySPAKwdTq21sXgGZIg=;
        b=NNZKNe/Vq3x3FEj6p/CNrHZU42qJC7f6S1s4hzyAZu/dWRdlrxCMojiWqxwMfoSRyM
         HfjXa0zG4Xl2J7iT40ZDl34T21p845b4Ax7hRpMq4vYp7wQljLurHfLC5JqqPOZL3oL1
         hTdTooue5oeedbgfTui9msdmOnHNxpUbL3fev0Def0F9Jx0kn80WYUZlu4CWOY/XDeHc
         JU7uKw3JIG6J1jGLTwOzPIlwtWyz9o22DG+pxO1RSrC16qJDoBDx6ewv5QgWd5sqcPVT
         7pJ+px+B1czvqM/Cs07MX0WTl9e31gMH1k53cm9reW+LLLS+o1a7lFBtA8PGTe9aaos8
         BQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773419224; x=1774024024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvFSFt+UmAAWATy47J/WKBKcfySPAKwdTq21sXgGZIg=;
        b=c5T4N/eDK8MDk8blRYzKmZmuAP1u1kWiiDmO4Itgg0VFNneHvLPBdDCj4+ZLuVeJfA
         5fST6fTV4kfcbPpb7glGLJRmukgBp2ZwRrpA2TaYXEdWibyCyRk+O1Estlk6ISu+bser
         b45sTX/sJS6UFSQVUX8ukPuef24QGNn+OfLlFyVk7Jw7Zn9KMLOuSAPdgA7cEzztzy1/
         0wddKO6S+06ilt83QN5aY5qIvKBE4qir5Kc+yDKPhyaP7GJaTN4PEtATd8qi80+5DOz3
         ovVcb6QobhY0OEs5w6G2Y9Bzlq4jlv1o3I5GYZeBVpeVvQ3U1vvrk04fn59pKBGPtFh4
         S2cA==
X-Forwarded-Encrypted: i=1; AJvYcCXRdiHLYtATYRn2hf8b/JUszVsq3Eve/wymo+O5empnvCUtOEyN4uZ29+zLBYjhwk/tg2Lu46OZEDM6xWWQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzrFwK8LmxqLrNjU8T8eQc9zQs+2gVmYXlWSW3UT6U7HIbaR2bK
	13AII4h2ALK6wc9JfimYm6OP7ePS6T/u+g7gvm5UeIgYpF/BHclyPbeTt8a1Y/joxa9clANIYoF
	kH1eXrtrgmZ/Rf5z622RZZZZ2UhluXfn2HYVX4jfZjCzXkuk1UymVz7hfhE2WXyON8c8+
X-Gm-Gg: ATEYQzyNg0ScWLVU5LmTRfVaALwRK5J+frCqBa8LxqKx7xMI8BZvPuuEHVacCA4Rwj/
	2fA2r+F9Swq+yxpxA/wUi/98wVkq4BMSVwOhF5CSqZMnrT1mQLoac/m0VDezPMdBBao62XRwtcL
	3LcoP1TtUhEDsaJjKHCQN9oC43LbAdJ3HaFx8G7jLlkAsURXT3rTYOGkT56WW3UmmlY9srJd+uk
	3CKQYivwXjpp5kWek5QTLX34H4URfo6nK3zEl6xoASMrrz5X37s5zhCp/ryoUT4dldKwNgjjQeY
	cYZbIPx7//IcnkEv25LXPF3TonnSpuZKB7mWikKRcqKDfdZ7KUJ62jahB/pdPwEi+Worf8MnLBR
	CGpTk3ko/4jGIizHQKfJdKhNatfU+FwIiUtqy4g47ZSObGxhNVnUN/OphuplMXNx8u3IAKvBkAi
	8o2Pf/fCeTKH22xbxDXrr26YHqygADY06h258=
X-Received: by 2002:a05:620a:472b:b0:8cd:b342:14ef with SMTP id af79cd13be357-8cdb5a0c885mr556444885a.7.1773419223450;
        Fri, 13 Mar 2026 09:27:03 -0700 (PDT)
X-Received: by 2002:a05:620a:472b:b0:8cd:b342:14ef with SMTP id af79cd13be357-8cdb5a0c885mr556438985a.7.1773419222969;
        Fri, 13 Mar 2026 09:27:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33d45sm1642225e87.11.2026.03.13.09.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:27:01 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:27:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Mahua SoC and CRD
Message-ID: <xdr5q7y5dcszcbjjwquvhbtlshemrov7nkbkmnutojilpp7bgn@qb2pmvkvniid>
References: <20260310054947.2114445-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20260310054947.2114445-4-gopikrishna.garmidi@oss.qualcomm.com>
 <vznk4wbziuieoctzrqwbjm7xwdudsrj4afanl5lx67mmbar2rx@5msox6m4h2xn>
 <454580f3-7459-43f9-8321-a716d55cdbf0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <454580f3-7459-43f9-8321-a716d55cdbf0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzMSBTYWx0ZWRfXxgVFbFMY3WcR
 izdKxxgFAUWRjws9UjffNniqf4M5VMYjnYbgvUdA274srxIdpLAE7boXiVfwv1twZYsYkLw0T1n
 DmXNCF3o/r2cfi0TvSUqUHXe7Hl+vkc5YPs5YPUoAjcjTIueeq4H/Y6QraJohWOYmJePwIIvQlu
 G5Vo0C6EvXXMDLXsHrtdd/cNBuolzDeTB7NKz/c8dxHLO1zdNusBmkzlzmdVxYboKKAqpZP6p5Z
 EitwbPwULEOQ+FUCxZgPZTvjiopoWLdNBU8tbN9Ru+qu/7+d0DK/RFRntLNQPZa4EKLLY3C8cq3
 t0lErZKmxV5dP6A8eAIHxfig/OdfUh1UXvFuD3N7J9oygYFMxkEY+AaecdhZ43VETxQ+scscpoH
 pXH+7ZqiSIOdIG3yUnKM4RMzmcnhLzW76mSQj3UOzhr7NeI9SikWl68o+0GT7BmEQAGGT8iSkU8
 CcYuGgb/yqI7Dp6Fp9A==
X-Proofpoint-GUID: YcOTLTTqtm2e2_i35xKC4vw8TDPWyBR-
X-Proofpoint-ORIG-GUID: YcOTLTTqtm2e2_i35xKC4vw8TDPWyBR-
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b43ad8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ugnmqWBoImWiQiQDKksA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130131
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97586-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 021CB2870EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:06:46AM +0100, Konrad Dybcio wrote:
> On 3/12/26 4:02 AM, Dmitry Baryshkov wrote:
> > On Mon, Mar 09, 2026 at 10:49:47PM -0700, Gopikrishna Garmidi wrote:
> >> Introduce support for the Mahua SoC and the CRD based on it. Some of
> >> the notable differences are the absent CPU cluster, interconnect, TLMM,
> >> thermal zones and adjusted PCIe west clocks. Everything else should
> >> work as-is.
> >>
> >> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> >> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> >> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> >> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> >> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> >> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> >> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/Makefile            |    1 +
> >>  arch/arm64/boot/dts/qcom/glymur.dtsi         |    2 +-
> >>  arch/arm64/boot/dts/qcom/mahua-crd.dts       |   21 +
> >>  arch/arm64/boot/dts/qcom/mahua.dtsi          | 1040 ++++++++++++++++++
> >>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |    2 +-
> >>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |    4 +-
> >>  6 files changed, 1066 insertions(+), 4 deletions(-)
> >>  create mode 100644 arch/arm64/boot/dts/qcom/mahua-crd.dts
> >>  create mode 100644 arch/arm64/boot/dts/qcom/mahua.dtsi
> >>
> >> +
> >> +&tsens4 {
> >> +	#qcom,sensors = <13>;
> > 
> > This matches the value in glymur.dtsi
> > 
> >> +};
> >> +
> >> +&tsens5 {
> >> +	#qcom,sensors = <15>;
> > 
> > This one is indeed different.
> > 
> >> +};
> >> +
> >> +/ {
> >> +	thermal_zones: thermal-zones {
> > 
> > You've completely rewritten thermal zones. Can we patch them instead?
> 
> It's more messy that way, sensors are reassigned because there's less of
> them (and less things to monitor)

I'd say, it's a bit messy either way.

-- 
With best wishes
Dmitry

