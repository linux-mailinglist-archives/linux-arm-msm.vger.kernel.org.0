Return-Path: <linux-arm-msm+bounces-109626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ENKF10oFGrfKAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:45:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA85C9583
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3C0A302A6D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3454936F91A;
	Mon, 25 May 2026 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pbx/bydp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7yGZl8m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B9736EAAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705848; cv=none; b=awFtJT8n7Yy6cjZMQ5vqqFDiA94P3UwtWyrG/iWgC83l+iVeRFMUtkU43wo7fWFz/RnKopbXQyifAf7Itts9+hmLYuHhmS+TmYNxYhI9OADSDWn5MN2KTRPULkhyFtlLVA4tRDl/ux/mwtF7S30Km3hscLFtPlBDGFOch11TTQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705848; c=relaxed/simple;
	bh=h/uqjF3R3sz2YKYkVBCkZA1z2qZxypPsZhVBXAZQnQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7Ngx9anQ088kl75u709wNx3dqFkQd2Ac7bLOJfAtfhtZoFg5pAbzD6dJEXiWK/CyuU+IU4YSKqOVs8hKN+s83L2Du2IdWtX0nfLZcif4/JcPCc5ZNKU42S/faC2jXKYqi9Dee2j6zK5WitIu/yiuWcFnhuSraUp3X/eoFz5p00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pbx/bydp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7yGZl8m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7WJcP2244701
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z1raWWhLV0vMOZgDp8fhNzwX
	X9rXSsNT5f68RVt1IR8=; b=Pbx/bydpwQyQYuMslTHRkLL4d+B4FFarFnUiFEtQ
	nfjVfqqnpE1888w+zQ/1LKvErVSPgda8jYbtOdBHGN7q8JHna9pjtoSwP9DVr/GP
	alz465/XGeLqOUQ7XksPA9I0zOWj47T1wbIQW2iAV5bJ/NVTHoEUs3Y/EFwQQcXy
	qOb7GLuDgRub0JzWPheKVNfad4QrCyU4wp4kPvn1b4u7Vn+ze6VPVuDKVVqrIhUX
	DUfAmo9RTbs3Qmkm2MuGjq8dZQKo2cLyTOeEEc3dfZ8gElVks2pNI3cxMOGnAWtp
	aL7CFmncY4aHBvVZIqMRicBub7OA3TYCJWHKbZvMPkiazA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7p9pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:44:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d38bfe83so76860031cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 03:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705843; x=1780310643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1raWWhLV0vMOZgDp8fhNzwXX9rXSsNT5f68RVt1IR8=;
        b=M7yGZl8mrd+GW1/lCmROMiSBCIVn7OheKqCWe9/xr5BopDRgJO/+YHyGephHV5oBDb
         We8f46OV2qmuavVgXx8emJZ/QwGaIkkPIN5tEgcZBOf3dhA6ZRPc1gr7U4Wo1ThE3eau
         7xwbRfGjtXQrm181jvVh0OD3lrboWiWSWp9xarc7h5U8vDWPwmEqHgn829oHAtU2sex8
         Kz+8Ti9rL6C+gN702QKezwS5HC6kQoM9qeXZOZq0S8etm6HPOaX4u1jtqm9pihBqgNC6
         FaVd4F+yJy8kZlBH74eOPIIr/A9vq4kf5KmE0xyba1J/9hrM2CBJgBQWb2tZbPwoveTc
         QC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705843; x=1780310643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1raWWhLV0vMOZgDp8fhNzwXX9rXSsNT5f68RVt1IR8=;
        b=Jq0/LO8FCYxUR2FPYXw44wlsXSmlVWIKRn+oQTJYdhxT7LfN+7cxlrvgNzKAYwx7Kq
         hxcnl+IHCTLpNdvqJw720fMPQpk0Ikcfm/mcuajThK4X9aQEvDkM27b3eZCj7qcC0tan
         ceBeyfNmKa5txCGMWAjGsPibPxdkA9w3Ctk3gJtAJUaZstg693xjiekbB9dJ6DOojgPW
         wxoCUElVLadWgh5fLh+QdFmufD55WeDF32KCrqVPBSVRGBP7EIysvAkPA2vyZHL0vh72
         bIm+a8v0JcgV6tVQcwTNfyYiT0dboOKqN8L7EVFpFOMWxi2iu1iBpxROv3vbsb3cLgoS
         a+zw==
X-Forwarded-Encrypted: i=1; AFNElJ+3TpyUbPpb4qLaafos5dTKBqFEDFLDRy38reLoCRgsPsK7MXUYj4fvof6MBo5NRzQNFuEUnE6VdNE/rttO@vger.kernel.org
X-Gm-Message-State: AOJu0YyYrd/ahBNqDQJNg67fsGS8xmLFkzIj5EMHSLYTCVwY06Es56dO
	PmnQn+Zw8ByXEHRdp0/qBwajFXNx1rgZDKlsONA0aTQVEC44ITDJk8VP0q5uGW2g3MJ6p/Am8sT
	kBCO0mcVD75l4JjoH5e0qc4qBI/iEvCUZZxoiO2KHAlr5uQiWmpEGW2PaYkNUsWQfIblM
X-Gm-Gg: Acq92OELHvFJHX5ds6vT4CZ3SIAQjxvY8RSB4IKxpowmOXr2/p98EC7vsOtTwBhNCgr
	GDb+bJSmk6F+/iY3FCx3lsgIL+9/dq861R1xYfGtp0B9dv1ubD7mCNAV9vuBVtMNKitv5KiYdhy
	zf3PeFdMqTsUs7bkdswWRwKQWbGKZmmn+jYkIgAsjt3XsO5GNpGykErxCuPcP5H/S8G2VRpCY4Y
	19Ps8XT+mYgvZwf9aQjEedghTROxOQjaLcyRcBiI6ZVOtlb99X4QEiQ48x6DZtATksfVAoF+QyH
	HoSA6ADwo1WEXks+GmIVcpol++gc9w+oyOXNXer0cBDNugjn5hIeKLAY1ESZKMFbY5tq4SoilBg
	+5/dMMF7QpEGVwFRGavEkZwUSscuS2c0CrBLkwNTuDk0LHjA/R12RqQcdoCVxKCEldSAHj8bE8L
	aY0dbFjWk4REN1HEiBRtXFjIlVLRn5DlMdAtU=
X-Received: by 2002:a05:622a:418b:b0:50f:be4f:465e with SMTP id d75a77b69052e-516d466fb5dmr185267041cf.53.1779705843009;
        Mon, 25 May 2026 03:44:03 -0700 (PDT)
X-Received: by 2002:a05:622a:418b:b0:50f:be4f:465e with SMTP id d75a77b69052e-516d466fb5dmr185266741cf.53.1779705842593;
        Mon, 25 May 2026 03:44:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc0a9d8sm22226301fa.26.2026.05.25.03.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:44:01 -0700 (PDT)
Date: Mon, 25 May 2026 13:43:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add qcrypto node support
Message-ID: <cadke5cbqfnnbcwlafgajy6g2xj3s2apmtpzp5uwb5limtehyx@4nnoww2kmytp>
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260515-shikra_qcrypto-v1-3-80f07b345c29@oss.qualcomm.com>
 <8dfa0670-7605-497b-9d53-db9b4a8a3d8d@oss.qualcomm.com>
 <57c26520-42dd-4159-bd2a-69874945cbbe@oss.qualcomm.com>
 <algvollvttjlu4qpawi3gnhwponwml6pts47ebmcvrjvlryl3a@qjq5ildo4qsm>
 <8a1d6c78-fd16-4994-bae9-cf75b1e7e3c5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a1d6c78-fd16-4994-bae9-cf75b1e7e3c5@oss.qualcomm.com>
X-Proofpoint-GUID: mn7YKvF3-Fm4a7PPffM_l1Rvx34kqpII
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfXxm2ZVT8ukZkX
 BfozIVCYnxOTQJvjqwbFJxCTBV2aOTciWxxDA2TRP9NsUyc0PaHYGuzxpXXrLqo8VqsV27XH4Ja
 9HYqXdhfzesgH97u99ekLaa5NbloIo0R8yEw+uPQDyHIWJcBSD/apr03l9OWoKwBeNaM2ZOWtWS
 oBi8XgWbHpT2IjraWlLav5gSUl3lyutkCOpoyid8XUHoUBQBXxkKtVr4tcMzRWg8mwOD8MtG8A0
 Mhh0wMvj2tswGcAXMvLU51L3fG3DadJ4riXZcPVIMefIvubcoXehb75B7DaoOjrFDtCbOZz1ohe
 MXW4qyQ6ayvDIbYyZzA9m7yTbkChU8aPLsq7Iv1bXAzB6ZFDPd404mw3lYMrnnsyAk3RBvf3S9H
 lGz1Rvg75n/eSGIkSEifnElP+IVDLbfJX3qFYFMEFw8Lh10k6GjglR3IOmoGIyHXNS9xblxXMZO
 dw1Sy3B+StHfN0znPFA==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a1427f3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=eCBvbIXyoX1lJJg6tWAA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: mn7YKvF3-Fm4a7PPffM_l1Rvx34kqpII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250109
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-109626-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 07DA85C9583
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 03:39:17PM +0530, Kuldeep Singh wrote:
> >>> These two entries are logically the same (SID & ~mask) as the first two,
> >>> does it still work if you remove them?
> >>
> >> Yes, resulting sid is same for 84/94 and 86/92.
> >> Basically, the resulting sid could be same, it's an optimization which
> >> smmu is doing which can result in same SMR(Stream matching register)
> >> routing 2 different sid to same context bank.
> >> So, 2 sid can be used even though resulting sid remains same.
> >>
> >> Also, DT usually dictates what hw capabilities are supported and hence,
> >> captured all apps entries here to match the hardware description.
> >>
> >> I hope this answers your query.
> > 
> > It doesn't. Can we drop them?
> 
> Could you please explain more on what's missing?

Usually we don't have duplciate SIDs in DT. Why is it not the case for
this device?

-- 
With best wishes
Dmitry

