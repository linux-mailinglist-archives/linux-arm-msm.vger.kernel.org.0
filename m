Return-Path: <linux-arm-msm+bounces-91417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGl/CSBGgGkE5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:37:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5747C8D7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B255A30131D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 06:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A688E2FDC55;
	Mon,  2 Feb 2026 06:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GihNtjmD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bx8QmEpf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4741A288C86
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 06:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770014183; cv=none; b=iyEk3OwltbT9HY74UrlqkhvQbmSZHfQaCEWC2eKqkRf459kWI5cGBJlwuv/uaOmNAH7TSVlN66iEYAJv28WidTnabgaNmwPy7cr2YG1v1mOjowvopfrIiRwmoJ+iLhKTLy0eLxlZQ1PFVs+IquIdjcLVpkCW8NnNNrTYNzv0XBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770014183; c=relaxed/simple;
	bh=xg9NDRatmvfZM5E54UM8msbcE7qfGPKuOC+UcnpJ4/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsREDXsBmyfGttqx4eH4tSyyJE6yGPf0oqFwpFP1F7+Hmnw2bZL83ZP1Z+swDq1oIely5xwEWMIywE8GPrcjmDC2N4ttxFVgbsAQE1MTSeprFnOOwnyLE7jDGEPI+8ksLUlN7qIGvGpwz5Q3CCPzKRNS3HhZ7Gk9pV4XI5x8sj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GihNtjmD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bx8QmEpf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611H8TNV635217
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 06:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SeWrAZswpltJqdpISuUe09bjU6CqIAWEII1qQkgXJJY=; b=GihNtjmDDTRzpMPf
	6aQjhdbcDWzLLok01G/P6xrmiMCy5YL26eKMr5UhAhLNq+xPCNuY931OH5A8yJFq
	w0VLjs6ExTUiLrWVyJ2GDVsTRb9QVWeDcRaaYGIOih88S2QGyQekv1rx7OkhCaJT
	a1GKuGUgvtMVecwWXw+szM9yIt99hguynrrXi8EGQIfcZLp9ckSYTjwQQL6x7kxx
	Do6zy2/17Y5uJ4dXyN/tGAJICMWl3+rWYguIyfp+mC61+M3ke1/OkciUvPW8hiqk
	NhR2u/TcZf+pQNxPvBI9INuBpdPI/qImp/NH56nSRuGhC+mSBBmnWrq6lQaGtQxY
	ze4A4Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arrv71x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:36:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c67e92aad79so1018015a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 22:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770014180; x=1770618980; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SeWrAZswpltJqdpISuUe09bjU6CqIAWEII1qQkgXJJY=;
        b=Bx8QmEpf8z6FXjEdu0dfgpjH7Kh2Ncu+reja2w3ATFZa+vjvW7RLJv80mEHyK5db/j
         859ZC+E7EXv+QMANtCwviV90pTgFErVXw2Hczht3Mqt2fVzSf4QswWpsyi+PD2DHkKJ+
         t9xWQxVP/s3WN5ZIlrHQk7r5iF3qfSc0FeChCGnNhxikAGdSI+qfkHjGCkFbja+wQ8Jz
         zlFEWTK0GcDQYmqxDzwRO4Y48dvsvFZs55SHzbjiq1ctfEdaa8HG3a9MoQmg2BAaAav7
         tcvQ7JSlY2Cs1LDZ2k7nj2I1kbEGuvOK7wRkcF7zsekSqj6ggmiOdbbq8pm92XGQpeFg
         DCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770014180; x=1770618980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SeWrAZswpltJqdpISuUe09bjU6CqIAWEII1qQkgXJJY=;
        b=BURAclw28/XcRMqAoRfVSiN9wUljL1Uqk9rwZzdNVW9lktXS6xDZW5ZzpD1Rwnd89V
         3GWylDXRI5XtryXFejWoFNCV3uW5usfPsNTOIL2onBmWyTcAH5Z35ZNlkKfovvJFtLoh
         qgA3cr9A0xO5yCZxLNkWDIVVMssU4M/pHWylPYIaQ/PjeoENfQuwBEHsYNYRa9eecAvj
         dbn9+xaiJikSX1dDGkqYhJVbxqkkaOvrRjuvL3kjcU2yBUFspmex4NNV3y9PN94Fs6Lb
         M/gZ5U2nS/u3d1+Cd+UxoPGNR0rzCZxca2W+cEoCOQpzsACsJ65i5qIwzytuvliR6Dzr
         y8pw==
X-Forwarded-Encrypted: i=1; AJvYcCU2gYm48Z/cWLUZ23s01gH4fc6UzUYkzpXgKd2UMxMhIyWPN3LeTJZReuI6YED7xmPv8rp4mX5LpYGKYjCG@vger.kernel.org
X-Gm-Message-State: AOJu0YyDQJDDdEC9D/YIgdK0gol8gvTiuuLOoXqu/XtJ5NcZcYRjG10Y
	zZFC6WULUgDDER9sq6y75sF1orlbeCEMAjmHwhzDf9ezNP2yBRmjHL00Cd7hRYnhLjUPKyc/TVD
	2U7W/QreBFjYb06kV4bN8AcRt2v7+1upWwVtegUtQ66H2p5c+8crUz8vL13cWhG2UjtLv/E6A7f
	cb
X-Gm-Gg: AZuq6aLeSaxxECH4cR4AwleShC1MoBRGS90r+j3fC3NOC/3dI3glbrrxKcXU2r+r8ZG
	ATbbDu0FyinqBd84NpadzJIMk+Fvj0a6+jboKC7gidF6Ba/e0KKUSyR4tpYLL5VOVytT8GEL0QL
	oefl93ukHoN5fR0cFkUOtVLvhtMV901E59ArfCWoWzXrswKuO6R0rR2vTjYS3wqNLicRhALbsAz
	ajlZQ3VczkvrVjqeaxs6qO0v2NW8cev5U2Qge9oQdabDhRa4pDZ/nZdkR+Kk7mn0LiwxFjA0HLD
	we3+oUPVi50MWhItqx99/Kq9q3TzKUdxb9vjZeu+bUU/iszACyr24HSGYFJ4M/jLIk8a1OZewEd
	mQVPCKI8DJJer0pnQRm4J/YhXttbdpKdNP6d/SpkX1S7N/mg=
X-Received: by 2002:a05:6a20:cfaf:b0:366:14af:9bd8 with SMTP id adf61e73a8af0-392e01b362amr9962855637.78.1770014179629;
        Sun, 01 Feb 2026 22:36:19 -0800 (PST)
X-Received: by 2002:a05:6a20:cfaf:b0:366:14af:9bd8 with SMTP id adf61e73a8af0-392e01b362amr9962821637.78.1770014179151;
        Sun, 01 Feb 2026 22:36:19 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642846888fsm13626274a12.16.2026.02.01.22.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 22:36:18 -0800 (PST)
Date: Mon, 2 Feb 2026 12:06:12 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Subject: Re: [PATCH v4 0/4] Enable ICE clock scaling
Message-ID: <aYBF3Geeuq2qHmYg@hu-arakshit-hyd.qualcomm.com>
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
 <7b219a50-6971-4a0c-a465-418f8abd5556@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b219a50-6971-4a0c-a465-418f8abd5556@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RoY-JmtL6L7K9Ht5a3ZKXWmeXWRz2cTT
X-Authority-Analysis: v=2.4 cv=FNYWBuos c=1 sm=1 tr=0 ts=698045e5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OguJ8merRGVtADoZ0hMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NSBTYWx0ZWRfXwIh+DVYiLhOK
 JTbuV6xu43BWjMKsrV0NkAS6WLmEXBMPHlQd+tCAx3W6x49Ms3yISUlDMaEIC8DG2ZJLvEICDJt
 wERVxYJOa05yBFpLRR2KxKWhmhrHtlIE2DFuJL+einGFNIOLawkRSyoq8kdfpbRJJZVpXMPAwri
 5B2GBz3cYxpYfJHbg+qudSI11ZhWN8JKE1hlmXhXUzavB6HjEtCqmgnsaDp1sjcHGz6fpKVpSdG
 5hRq19px4etDKluqbn8A/pIQXll3sTpPz3+cgvM66AZYTJsfNOC/leMZCpfKXHttHakqophrufw
 GsQPfzH1Q9B0S766YDBfKEREjrbHCd4nTcY1EmWKhnC4e0eqsfvD8O/GuQPia/m73fRo8BI3w9p
 yKZc3NfOBoFMGzX0vTqzq/Dx7gEBYWUMfx/Uv4wNB7iZ9qh9qbi+Zs0Rg811TQZhZpgJ+nsVKOu
 SJo5X2tr9sqAjt3b+HQ==
X-Proofpoint-GUID: RoY-JmtL6L7K9Ht5a3ZKXWmeXWRz2cTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020055
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91417-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,hu-arakshit-hyd.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: B5747C8D7D
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 01:17:51PM +0100, Konrad Dybcio wrote:
> On 1/28/26 9:46 AM, Abhinaba Rakshit wrote:
> > Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
> > using the OPP framework. During ICE device probe, the driver now attempts to
> > parse an optional OPP table from the ICE-specific device tree node to
> > determine minimum and maximum supported frequencies for DVFS-aware operations.
> > API qcom_ice_scale_clk is exposed by ICE driver and is invoked by UFS host
> > controller driver in response to clock scaling requests, ensuring coordination
> > between ICE and host controller.
> > 
> > For MMC controllers that do not support clock scaling, the ICE clock frequency
> > is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
> > consistent operation.
> 
> You skipped that bit, so I had to do a little digging..
> 
> This paragraph sounds scary on the surface, as leaving a TURBO vote hanging
> would absolutely wreck the power/thermal profile of a running device,
> however sdhci-msm's autosuspend functions quiesce the ICE by calling
> qcom_ice_suspend()
> 
> I think you're missing a dev_pm_opp_set(dev, NULL) or so in that function
> and a mirrored restore in _resume

Thanks for pointing this out, its an important piece which is missed.
We can use dev_pm_opp_set_rate(dev, 0/min_freq) in _suspend and restore the
suspended frequency in the _resume. Something similar which is used by sdhci-msm.

