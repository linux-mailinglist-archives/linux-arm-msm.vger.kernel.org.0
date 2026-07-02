Return-Path: <linux-arm-msm+bounces-115985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lF7eEt1XRmq8RAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:21:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 451466F77DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:21:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QKHeWgmZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EJrxwTto;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115985-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115985-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C83430432CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC7246AF2E;
	Thu,  2 Jul 2026 11:57:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30153D79EF
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:57:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993436; cv=none; b=IDBtzgyDCWSRggMFRV7KV8n7jScOFjkbDUQO0v8xRSG8H+R2/zXUd4qsSwOImEd1ZhdfqUSLY9tdL64d4K1aWa3MvdXogVv5JFqGSXDuuUDaVoD7kTPrc5Y4BIcSRkIFlTkWUbh1K1ZBFZbloiufcN2fU4NK7tZUPeCRw9a9gzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993436; c=relaxed/simple;
	bh=7W1GCpEe3Gdv9nXmjbwQh2a1LPAEYYmV2hnpUZRBLKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKFvt5a+H5n+W0SuX+qiInGqKrOLVaonuxFAg9q551jefz9s9ISo9W1ni2ZdCNmF2Na49i6HKj/FzrNwc+ZdyajU9IgtEilmHdpgzVQtQHiufHAo91jGCDqx7rQ6yBc+WBjhJvOxlnoaAAu27bQJ4ie13e71TcqJtKuhj9qBFBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKHeWgmZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJrxwTto; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6627TshK3964219
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 11:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dcUxmlJb0u+2w0hmOr3Gqno9
	mV/FfHmW/GhrjwOQzaY=; b=QKHeWgmZbjqBL7V6KkgD9JFOigaMVHSiSKFNlkVk
	LfTtb9KT/urbl6vl1KwgR/oMsqQas9TYPBUOMNeewjttN3C7BV5UX/xVcu5APUBx
	2PyV1YKjW9vL71GABIb9AnZ6+mAcI11IDRdRsvhVFJRVqlqmfjlEuui6+3mkeS6K
	FY+cldfXFzHqHGV5XCjTz/URpfPlYhWekHlVEXhmXizmfvOfVeeJkC0ZTHbNu1T/
	cMfOZT1WZeo4LZfgZuZxCR/BFqGL/8DlTOfrW3aHM+v3GRPL+WlARgQBwIzmG1co
	EjsAyRLLDMT8x5GiwNJ+TUgO68jP2fHFZiCiaI4C5Ix41A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc10s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:57:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so66884885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 04:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782993433; x=1783598233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dcUxmlJb0u+2w0hmOr3Gqno9mV/FfHmW/GhrjwOQzaY=;
        b=EJrxwTto2+FdSvp+RrK/CJITXeO3z62zl0uTHysmen7wl3FXy+PpXXk1amEMj46zgw
         DnKHBOeHiAdEhXkpZY2IcVBkA4+q3gp1VV/lihjPiYTWTqkUTAwTIKm7i6OtIePbLMFC
         QkseEIwluYAsMfQhXR/Rsc3MxiuAriY2h7jaNNxJ03YpqguKDZwJxCIlil3Ur2qJ8jx2
         S49PxKLhfd8W7yyVMA574RhwDA+/eKQKxbmk3zoQcnkTvtbXi05nSD47WoSAGWKZF3Fa
         bJzPNndk58TImzZDt3Pa8BEwxATPDgzmEaYFdvOdx0Tdc8oBtCzqqRxdY+hU5guU8+mz
         9eJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993433; x=1783598233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcUxmlJb0u+2w0hmOr3Gqno9mV/FfHmW/GhrjwOQzaY=;
        b=ONTYLuVKcpgYUfOzeADa1iwcKMhKqy1bjGdAq+sJc7WCt/r860AhMIF3529CW7wBzM
         UlEd+QA5/HdjSeTz7dByPhxr01m5jbCA5YMKpTe3hJcg3UjmPxVaayF6ocrC8Yq3iy2+
         Is8t1agqN9ER4uctKveJ5P7wrwLsvUdm12dwoIQ+/HW8FxD8T+s7oBwb/K1oKtGQpvvd
         61LPQGl1XAyN83KwG1v0hvhbFZFLEo1P6USojGIvM2uc0JDQfrtPk1mS2yMm0zNrCaUB
         nOwf6o0d/8v4vqEJdLvcq8jsMtTVVAto1pXQmXijCRga6mdZiFFGzk6V7NYfyWRmK1Bm
         UP4w==
X-Forwarded-Encrypted: i=1; AFNElJ/mqx2KF0k28hB+IfaZVUWOUPHOUpLQk7my11hvVbERZxMd1r9IiDK/6TI7zNPL4szPbrS9UFr/tfT6NfZg@vger.kernel.org
X-Gm-Message-State: AOJu0YzN73hWLx39ZfMl4mIawKaFykAg4OPb+Loy7EUT33IbW19yR0KJ
	PXEdX+qEJJeKKyDICRXQaw79lTK7a3hj1msujaxxeLCIQHGr+4FqrW9xy/8tG9MmLMgz3ZT6EP+
	a1mXMEh9MNEfGJUL0QT0grAiTlbiZZ0bUrE20pvB5R6IHnn4ejq81/sLYIEDndDLKvErb
X-Gm-Gg: AfdE7ckU06+pvhCSbVzOX2oI/kMt8Mtzc+r4eILq8eGUpYUYfiC+do/Dfvstm7VdVfy
	fQ2wnMgNCATNENwquUvm271AqDKNV4Ma8plrv2uJPZh77GKq/yAIbhJCZgZmoZzjx3nptQ/Ku5C
	93bApXn+LLEZ1PJ6IgCXRcCNSNO9LiC+HIaPeBgduRwef1/s7sdoSkdzHEf0F9qDNcSENr7GlxP
	lF9QRYVh4UKRz80NNwewyeKOySNwzgMcYk3LHEJaG7LDMbiYWvqOGvoDGLqW4JbIM3NEn1acC8z
	MpVrR/3soJp7xan3oZ8Rgl0FAh/EuzlGJUMcrju/llPM33PCdfc9NHjWCFCOxaol2L3GkCZ6K2V
	GkeknDTrGhVkuUp89R4pKHZXlhkezxAkpjHTeQymK3/GAuKZAkpiy7RGnyNFgb9FO/qBu195qqH
	DKPUDOUbQfGditKBbXOPhS0dvt
X-Received: by 2002:a05:620a:4728:b0:915:9931:3a3e with SMTP id af79cd13be357-92e697c24bdmr1334935185a.27.1782993433247;
        Thu, 02 Jul 2026 04:57:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:915:9931:3a3e with SMTP id af79cd13be357-92e697c24bdmr1334932685a.27.1782993432780;
        Thu, 02 Jul 2026 04:57:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89e56d0sm618674e87.79.2026.07.02.04.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 04:57:11 -0700 (PDT)
Date: Thu, 2 Jul 2026 14:57:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] power: sequencing: pcie-m2: Add QCA2066
 (QCNFA765) BT serdev ID
Message-ID: <xzudpqgyunuj63h6o6npvhlwiqduz4ythmbgufovotptbzvraz@q3hhppxledpj>
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
 <20260702-monza-wireless-v2-2-7b56e2a6a6d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-monza-wireless-v2-2-7b56e2a6a6d4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Mvt-gpsoisGLHBH5dPl7sv8U1I1YzvJ3
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a465219 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HTi0trrisHXCjICuZMYA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX1ugLntSdBadN
 Li6LlpAYCBsoM4VZibjaT30tCu2qpghfmgoWDRAbWxiPXZXtgXKUYn9NvSDlb0EHmVk1AP3lEeS
 6WWWoyfGcYFFRhEDdRei0M2QjK4U4sCFQpI6P/fZBP2pThHIiOFLGlgEd12+WkGW8a4WaF0/3sm
 m6248+2+PEW+lA79SS93aYZQzOPKzYpo9o7RTIZrI/RKQ4Etp6mc9fuUMHhHCM/ojcharJSab8M
 HnhGS1YuFwKRxCuyR6wCKCVgTki2HlSU8/1F9N4fwyMWj/mSctMwUj1UuEti+2PGENi/A2AUB7M
 PiyNhMIyAo6Q/r1gbgsFdJgY16TCZnm2bfXtfR0MPt190OmvknuQBF74qDFJHSKfNVEM0b/E7U3
 4sAhRLd4FLQbGNFhJuWeXEsNcwSZ2j38khL2KGSQSb6tbgiBneQH1QYXxwJyQAxEMsCZFTZDQgB
 p33IZM5AJmDYpque2MA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfXzO357+H7mFDc
 V7+7RGpSur0fJxRyOfIajo78sbd9H57pp56UfZ/P6MeVeFZOsik4t4+hKhGfsG7IsXz2zR9DY5+
 5YsI1qz3e8alQ4jj+JJVxm3sUGn8mMI=
X-Proofpoint-GUID: Mvt-gpsoisGLHBH5dPl7sv8U1I1YzvJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115985-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 451466F77DA

On Thu, Jul 02, 2026 at 12:46:14PM +0200, Loic Poulain wrote:
> Add PCI IDs for Qualcomm QCA2066/QCNFA765 to the M.2 serdev ID table,
> mapping it to the qcom,qca2066-bt compatible string.
> 
> The Subsystem Vendor ID (SVID) 0x0108 distinguishes the QCA2066 from
> the WCN6855.
> 
> This allows the pwrseq-pcie-m2 driver to automatically create the
> Bluetooth serdev device when a QCA2066-based M.2 card is enumerated.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

