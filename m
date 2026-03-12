Return-Path: <linux-arm-msm+bounces-97202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8WtKKS6wsmmEOwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:23:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FAB271A41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A20C73009F09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5000D238159;
	Thu, 12 Mar 2026 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7sClG/g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akY7TTJl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1697C1A9FA0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318182; cv=none; b=F8F1JEfkFdm9XH6+Q/tCbvPntOtkjCyBfwBTLhYh7aMEKIYjgy4mdu/3eee/ZQ/zZPWVlxLjp3O3lzQxIZKwYlVT7qlFuwYEA9EWkdj0N4ab0c2UHN6H5v+hQ0lUOv4SXm4p40YtnpKXJ5JYxB4d2TED7SnBd/6Zom/bGFBhO6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318182; c=relaxed/simple;
	bh=QSn0gTtQR7OpFQpCdYNc55uVptdfnCfi6CdDZ7lx1P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOpoNVSmMGvLazJA1g7lFJY6Xan2itTxbuvoBDBYK71CiRAMrV+gt6Jdg81sGcCGg2+2CJvzI3D6+2AS2OXHb8EVDzk8OxiyH3puhV6DF8pZzf+ufMYBS/+6ekUay+1pb/DWu+sKwNfMUgCVGvWMMxn/j2iSEhFPVRt0FdwYDFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7sClG/g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akY7TTJl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C7eEIt510096
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CsSNj7IKgbVQOonk5NNnLn/E
	FkTff98E+R8aowBio8U=; b=I7sClG/g2zQ4u9RqQnXsvhcC/EOBuZhteWCpj3QT
	AQACODkt2QZYkXygo07usbtOBn7lSFA105jbWG/u6XaSSfQs8QoOOgkFBz5zvHT7
	84aFPDXJBvSSMayVOOSwMZrJ0xs9TfE1SeR/r7nWckBCQzWFtYEkOsxk3JlaHlqR
	Df/fKOuz+yNDsYu3t/zE3ewDK9VElsxG6KAn2y2mTaxL9tfw2123c+8SFfCLflIZ
	xPR6LJvCllv7jo3m6GEpIitAd5WKq8UbMklig60fzLVyCPUYK3CZMcIUzW6K7XSz
	5TO64TF56wHvH3leDdro+Ar/9lRSF/8zSq0lLWc38bfa4w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w0q8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:22:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fec8d44so635166185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 05:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773318179; x=1773922979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CsSNj7IKgbVQOonk5NNnLn/EFkTff98E+R8aowBio8U=;
        b=akY7TTJlzrhwdM/4ZyVHPX1d+x2YLX2xIjXaHpkiluT1mX+X/2kDKA7WGpuzQZ+gDS
         0c2rdJkBZlBbu1JZ8fBtHKvoMjh13V6BkTr+h9CvH4y8/Dd51NmoKRR8U7e1bfMspRPg
         Zx+BO0Oz13YI6HzudBSza6FAAk5lW7wUq6T4TzxfrRNEgUXgyUVeiz8sgd6DQC8cTkj5
         ThUHb+s4lxM9zS6mTlH2cb38ONfmygKZsJ1G1JkhcJfpUltFLS0xDn3RwfXqG4fcoMeb
         2FwCyVv9k6zITUYyWtFLgbaRhtcEA8Yufs/e4BfZZQQRXdj1IXXd91hlSe7+MtPVqV/3
         aPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773318179; x=1773922979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsSNj7IKgbVQOonk5NNnLn/EFkTff98E+R8aowBio8U=;
        b=SqTCEmY9ALDmytakbS5d2l0/WN3+8rW5gGC1JI/30E2zXJZYSvaYrz7v6pJpG6W5G2
         L+nplatEjz9h/GpVgZj65Y9RahMuuU4xQXo3EBACWyx6qHxXUZ4UiYaK7lguiK1UI9K/
         YEkKtWntfF4Yunqc0SCAQb/rELbLTMaKVL0PCsxPXiHHXIrIzOWvSjPvp85/BBODEvb0
         3U+zPXBM59VZqEZFy49wVBvlHxrpSoCviv7987ILeVsjE+33AOUJwfkiqc/S8vmewKLC
         f0yrEhZFViHO0unD326dQL3obCidonTG+RqzyFLVk+gKF5ADhecqFPAceRq6F1jrqBP7
         cvXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6/ZkUG9g1PiqgoWhit69mK+hUWDyvhV+1Zk79cCkb2lRxBUDK9A6SX13wcCrtY5P3pJ6hJjHOuKe5gdjV@vger.kernel.org
X-Gm-Message-State: AOJu0YyWPO9BiDeNPZ3Yr4IKmG+iCxxuB6N7nR2XHJeGQ1qjyFsRaqWU
	C1j7KwMmt8aH3yZ0qIDS45PdUyUf3wxbc38VDj32Xkn3seXoLdzTIyGEick1xiapTQeqrsG9Lt+
	TU5NX4mjvBDjUqcoOO5ZfeVnihUz5DaIU3R4kIx/eBqLQDT4W8OREivmsbpLYqhtAm6R3
X-Gm-Gg: ATEYQzwQgyiDGqAY+p5KBos422KAaiTvzxS+VNF3SAlpw7d6751MTQarmJz8abjrtlK
	3tcM/fAZzy6c+wC4O5jwdtS+/wGiqhEVb+N9RVhwNbSBoXiHTOc6FstjHoY+jv0pD/kc5h696FS
	EeScQGgoCMnOw4nR5tdesQurBVf4PS1vYMsFrLu6jb/mQEdQtmaqBMEvaodZAlnryb1f4Dy9Zxv
	gktBOVI/88z3uVbEV/DLza/hp41d+V/rv6RDk3siUevRXMlrCB/gddp9NgR4A+Ci12lMWemtg7u
	wGROW1f2rPD4IJmoDG7f282xDAj5d7ss42T19zGMy1CxF3YyoiXZTG8z8hMbJTzI9sIJw0fAeRR
	X3qBq7CXBN2wpSyb/jjyyWqzU4XetKVZvsQ==
X-Received: by 2002:a05:620a:2994:b0:8cd:7cea:aea4 with SMTP id af79cd13be357-8cda19e4ffcmr723887185a.9.1773318179256;
        Thu, 12 Mar 2026 05:22:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2994:b0:8cd:7cea:aea4 with SMTP id af79cd13be357-8cda19e4ffcmr723882585a.9.1773318178610;
        Thu, 12 Mar 2026 05:22:58 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm217442035e9.3.2026.03.12.05.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:22:49 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:22:45 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza: Enable Eliza MTP board
 support
Message-ID: <3ct2n3prdcjbf356qkdhrcd6uj7kywoa4onyvljlmwv3joyspu@4bozoqkmpf3i>
References: <20260224-eliza-base-dt-v1-0-54e8e3a5fe43@oss.qualcomm.com>
 <20260224-eliza-base-dt-v1-3-54e8e3a5fe43@oss.qualcomm.com>
 <8016eafd-9a6e-47d9-add3-3e3f31f1facb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8016eafd-9a6e-47d9-add3-3e3f31f1facb@oss.qualcomm.com>
X-Proofpoint-GUID: 4IBGN_55ZQqIVKBocZfhppgNnVs2Vukw
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b2b023 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CrkQYY-1ogOf0s88gfEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5NyBTYWx0ZWRfXwObifDOeBHGr
 aMRErfl7tMrufb6TiU/ZFXiP9RRT7gpYY0oWTuFii31WmIorMiDQaB0yps4DD/b2DOvlYeyi2g9
 kEcuwQ2TKvvhdWT7mmlidP1jQ74Ou/K6cgfMrXhdAkuT6SopQAb6kup+gmswAgetNLJhMdPjXnv
 KqkvEYPqeP7fDi5u6sjNc+PQhb/YA6wOQtXt+vkk9AU6+XIi8+BmHxZ0Kw6a0ik4ne5pzw+NLFx
 iY5uWZATo7e8kv2Y+i3C/SFjI3tqyNex35EW+fr7fJyILuNNPdPZt+X9dukrcYm9S0uYb2mJhEB
 zjFg4INHTKQZSP2FaRFhrxnfrF2tZAfXUmb4+o7RPGZQeLnnuRKPeu2OK4R9Hnk4eti1/bWpVke
 yDJMsQFTTmpYJ8Mc3GJq2ywpjlYVkC+1ZV2okNb/bjIk9aZJEYGngLXuiu6CRlM07UVPK7C9ji0
 l+1P7CvT+3x0nt3goJQ==
X-Proofpoint-ORIG-GUID: 4IBGN_55ZQqIVKBocZfhppgNnVs2Vukw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120097
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97202-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88FAB271A41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-02-24 14:09:39, Konrad Dybcio wrote:
> On 2/24/26 1:13 PM, Abel Vesa wrote:
> > The Mobile Test Platform (MTP) is a reference development board
> > based on the Eliza SoC. So add dedicated board dts for it.
> > 
> > The initial support enables:
> > - UART debug console
> > - Ob-board UFS storage
> > - Qualcomm RPMh regulators (PMIC) and VPH_PWR
> > - board specific clocks & reserved GPIO ranges
> > 
> > Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> I didn't cross-check the regulator settings, but I hope you don't like
> this kind of fried chips!

Will double check.

> 
> 
> > +&qupv3_2 {
> > +	status = "okay";
> > +};
> 
> These are normally mass-AC-allowed for a given platform, feel free to
> enable by default

Sure, but then this will make this SoC the one-off, AFAICT.

> 
> > +
> > +&tlmm {
> > +	/* reserved for secure world */
> > +	gpio-reserved-ranges = <20 4>, <111 2>, <118 1>;
> 
> Would you know what they connect to? Please describe (like in x1-crd.dtsi)

Yep. Will describe.

> 
> > +};
> > +
> > +&uart14 {
> > +	compatible = "qcom,geni-debug-uart";
> > +	status = "okay";
> 
> Please keep a \n before status for consistency

Will do.

Thanks for reviewing.

