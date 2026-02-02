Return-Path: <linux-arm-msm+bounces-91415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJnQHTJFgGkE5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:33:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0ABC8CB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D4133002A23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 06:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C250F2F3C10;
	Mon,  2 Feb 2026 06:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nYkIi2fO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QCfCmP/R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7863127A92E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 06:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770013960; cv=none; b=sLP8zEyylDWtXvEH9u+oeK8m+aZO+pJuqpo//Aa1B8sZQ+kAfobcwvVggR5irYlS8sFjoHPo+MHAn3OECIrw28FA0pZ2fxhWfttac5+wqJEHAptbKzVGhgWzS6mI5vW/ft7afo29pJl24SsMXflP+E3lP5Ba8Qz8zu5HOs+EYuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770013960; c=relaxed/simple;
	bh=GNhVTBlnouzaVaIZbBjia4fDeb1Ma0W34R3FR6sNPMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/vFemDzlpcdVsfRAuaHCkAlkVdfKPG8HOjEU/5sVyx15cR5kx8d4MFZ32ayGjy3qFAjiUmaA0eyvWo26tIuo/CuqtHrzLAHMems5jqjJXFvaVgyAUGewgKg+2dT62YT3xhu24dUZjkOhzu6w7QQruKWQpgVVcA0BHFXTSCPgNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nYkIi2fO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QCfCmP/R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611Nbdfg1571988
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 06:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4X/ebpbZHKXJ3uGpBJiYRdCR
	+Q1zwA07WypTogytST8=; b=nYkIi2fOHCkyijd2EuOfdE2/ikXn4xRIVbjjDgS5
	3lAO0avhLk8xQJkYyKByyaaKgJRKvUzETm9QpwCUMJ1xQcZVRT0XFJ/l5YRlmMyL
	GQJONHM9tQwBmI1CXzHy2+XLyoFTuWaDCaCeZRt/ZRMuh4nBdSZWKX8rtVH/d3I9
	Xw3LhxEU2m04gvfds3Y4zL6Pfsrgbi/Z0+AVbJKF/af6tl9fXQA0JPfpf1El9b6d
	iUkhRFUot7w+HGR3T6hMbM+vEqlVMVlYFjsj0oQuQOppZeoymvu0ZQJgr6U7LBkf
	Ou5pOTY3fNaN2N3SIG6h5cQXppARMtm4feI4d+hBZ5gruw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1au2m7qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:32:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so37530945ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 22:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770013958; x=1770618758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4X/ebpbZHKXJ3uGpBJiYRdCR+Q1zwA07WypTogytST8=;
        b=QCfCmP/RS8J201LOb2/0XAgY+mlzljgHmsPBCScF1RvuSqtQl5jI4JM88GgFB099Ug
         hgFZO1TxeIiS8ZYXXUvcfgH5FYoEfM8uTZYpwLSVThQaur6ROVnjif6JA3lYrethnIIg
         UtDfLdrP4QKeRa+hN0zRLRzoJqXZ/Q9Yozw0bmqb0rXTaPHEdCt+F9tX0aOobjkJ68wI
         NNlpmJxSNqCvxBoWWrl2m7mZQIzl3jSz7hvvTWC+O/huvZyGNCLLFWgSFxqG88TCIJdj
         LStzg0xiU1jgBNcS7CywZHZnGQrPMpUtEZC0d+FfSORhMUeHpXR1oSkkRKgPK7jNb7Og
         XMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013958; x=1770618758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X/ebpbZHKXJ3uGpBJiYRdCR+Q1zwA07WypTogytST8=;
        b=PtNfSJUmuc8D35Vcsox/L68f2I5p6hTXRBPzFEfYFt3vcI96j44H1A0uLCDRnRb8s+
         FoXHXgewp9z78NGxrqxLdt/fZskDraZo8S5L8nb7GzMZdwflEXkQZT2QwPURwJYUOd7T
         J2Zd/mnMztjDf0R4nj68A1/9AeIk4I1X0yZQ6N3O2weZYC0C08OixY65vczsEEx9TdDK
         JLbH5s0Gcyjmjub4ZHmVWMEj3PhwSQi4VzUFdQC3fo+QlCUmT05/EXRX4UGDJRfYj+F1
         swIfqId1MFNzwp7rnblvlbdnjeK2XmCCOa2bR5ktUZe3ahwubMDaIT6OW3XBYWzdzaKh
         8cfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRQ/RU90GoBYZLOMueVJwEWOqF+w6fqr7vEHPWg/LAobxPsakRHmk9hjHnyhPqnpGk+HjWUgdtt33zLTGJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3dz4aDy4Vw7x09k6f6qoikXdBDicMWQkLMzdTbsrrQ/2oGc87
	c8M95a1VEjBlpWXBSXGuOsMbViI4woKNYH7i9L1HN9sphoiNpEdo+FRLpvw1DR+8HX75PHpj5wK
	vesTTu5iRci/SdWbB67NpYqSszPma+szuvXw0c678nZHqkRGlE7bESvbYT8oymBqhJ1Bg
X-Gm-Gg: AZuq6aI9zNmMO9TAj4kphgpfLOewicep9vRrFndmxn5UtbK9NXovwXaZ+ZfcQe8MR/Q
	IUKEDYl6NsAkmtAkkR40wjGAX7XKqC+ZPEpWYCYSygW3j5UN0HqZxga7xsSfflwwVbQt+baxSqV
	9eiNH//DxFiBPVltkeyzG4VdV0fjbWVlvEsbqF/c9omqEzN7lIgIVYn2fKMWQwHosD3miyYK0vQ
	UA9fwt2l2064eGH8p4SYKN4Uwm257gVlFEWPX7HbAlMzqX801jCotdH/VJHxKv623yxhkGHs0tN
	xQPQqPSL4Acg5ONAv6e2oSQdtk9/WF5Y4ZiMawzFU9DgiGrUk8oJ45ivVq4tfhmANOYWeKLZbL8
	uV5eRTpT4EUjFbtLS9zijd4hX27aPFUScESKiterKh+z57hg=
X-Received: by 2002:a17:903:38d0:b0:295:4936:d1e9 with SMTP id d9443c01a7336-2a8d8037b2amr118684375ad.36.1770013958139;
        Sun, 01 Feb 2026 22:32:38 -0800 (PST)
X-Received: by 2002:a17:903:38d0:b0:295:4936:d1e9 with SMTP id d9443c01a7336-2a8d8037b2amr118683915ad.36.1770013957630;
        Sun, 01 Feb 2026 22:32:37 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b426a64sm131346685ad.45.2026.02.01.22.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 22:32:37 -0800 (PST)
Date: Mon, 2 Feb 2026 12:02:29 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <aYBE/VljJTUNx3LK@hu-arakshit-hyd.qualcomm.com>
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
 <20260128-enable-ufs-ice-clock-scaling-v4-2-260141e8fce6@oss.qualcomm.com>
 <20260128-daft-seriema-of-promotion-c50eb5@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-daft-seriema-of-promotion-c50eb5@quoll>
X-Proofpoint-ORIG-GUID: rhkUCJ3Mc4jLWfkzLFmPvmsI43hml94q
X-Authority-Analysis: v=2.4 cv=TtfrRTXh c=1 sm=1 tr=0 ts=69804506 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=skofDwuNRHh9mWMyy48A:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: rhkUCJ3Mc4jLWfkzLFmPvmsI43hml94q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NSBTYWx0ZWRfX2TodsDkPqQyF
 +1RMhMOx9Jxe81nfBPW+Z6bkmzCvfMwKEM16owEJACenD591N9D2iB1pX2yMuj+efHnCSEAlUmr
 6xOtkpTfNiQUxz77V/SKCkzFuUogkb0QFsf1oxU0H9dNKoBDaOj1s+TrPqxHdGhiddl6rD3DH62
 2hzu2ugDhBMmxQUBSEVTH9918oTpIEfoivGrEYYz7iWpVAulh86mhCjTyxu2Zkti2qrgNgw3yvr
 zZJiKB03T7pi5e0PjawRaC+qxXC2+05hwBH+WvX1C29DiKXt8UA9oXp/X/OGGvO0mepuiPSlI6h
 MMdVHebNLwH2kEeKwahG3nNqdRQiqbhiWBuM5QbAgdIjCa/miHsi6QpMTgJ9wrDUDE14iWXPhqs
 BMGwLaXnCvDcLI2UjqCUBDSxQv+pJGTyMYc2g5eskrBH5uvVE1DfMtpYYcFPZY1oZ6RJanF+hZa
 o23rT2Q0OsBTF1aQ+sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020055
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91415-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC0ABC8CB2
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:04:26PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Jan 28, 2026 at 02:16:41PM +0530, Abhinaba Rakshit wrote:
> >  	struct qcom_ice *engine;
> > +	struct dev_pm_opp *opp;
> > +	int err;
> > +	unsigned long rate;
> >  
> >  	if (!qcom_scm_is_available())
> >  		return ERR_PTR(-EPROBE_DEFER);
> > @@ -584,6 +651,46 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >  	if (IS_ERR(engine->core_clk))
> >  		return ERR_CAST(engine->core_clk);
> >  
> > +	/* Register the OPP table only when ICE is described as a standalone
> 
> This is not netdev...

Okay, if I understand it correct, its not conventional to use of_device_is_compatible
outside netdev subsystem. Will update as mentioned below.

> 
> > +	 * device node. Older platforms place ICE inside the storage controller
> > +	 * node, so they don't need an OPP table here, as they are handled in
> > +	 * storage controller.
> > +	 */
> > +	if (of_device_is_compatible(dev->of_node, "qcom,inline-crypto-engine")) {
> 
> Just add additional argument to qcom_ice_create().

Sure, that makes more sense.
Will update in the next patchset.

