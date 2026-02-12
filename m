Return-Path: <linux-arm-msm+bounces-92640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI+0CNBJjWn/0gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 04:32:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8DB12A2F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 04:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20CDB303C631
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 03:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583F3199252;
	Thu, 12 Feb 2026 03:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1hnnNma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJ4vY+8Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD8A9476
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770867149; cv=none; b=edqO4gKLpHrRG/ST4ynzDzTzY9DWIm8J6k06Ot593lyiuizKoWbp9PrHBGfhKcoY0k3FEzAhYuZM4LZByfvta/8tX1F2LCfQk3EREmQBM4iqouKjdVzch4twbI1L7OZDEvMOZXagexjqpJunFQxydVHkpc5EK0KwdxWGF0cbyeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770867149; c=relaxed/simple;
	bh=6IaaITUYEk9yJmkZ+quDwMQtXWrfwUDIHo03dlYCP5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9RfV1pfBz/4MijCa5Sdlwj6AXXDUNR6cqE+y1nbWcP5PIIZqJ3CR8eikQg4DRQ6vUR3kZ2FHb748i6uu8L7vFk9Gc3DI3STIZeNuoxMpluxZg+0Fgu1qYY7/YRQITKsl/cJzM8erQ9D5F6AnHKeIVUw+GIVx41rVGCRqI/feWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1hnnNma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJ4vY+8Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3RtM13963739
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cHtWPqb4Hy0L77cGc2/r8PoW
	7F4JUPzoJ7lU0l5OE/4=; b=J1hnnNma7FiWyfDEXaycQnSiRJUGvFNBDJkfvK6A
	AM9EbTWuCvmGEGNwuIwakYqXPXqaoij7hqJjOW1NE+Kg5q7jKohy12lDIyDoohQ4
	gKE+SxCVPTNpNNdURquJmTmGTUu4qX5sImbcefuEVN0CtZPN3yFjGriKWLOBIYON
	B2kFssBnAFH88gGgu98OG+PGKfkgJL4fk++dHgmgq7SwrV2UeplO0gzpSau4ACsU
	iyVrINXxa8w5EIj9QzBPwO1pGr+Z2uRMFlzt/Af+lbCPtnxIQiWA1ClgIAVu/kd/
	UdBQjWfUTUkyhP5n1LPif3UK2udur1jrCoy119CPKhuebw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y8nscry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:32:26 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12721cd1a2aso20409241c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 19:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770867146; x=1771471946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cHtWPqb4Hy0L77cGc2/r8PoW7F4JUPzoJ7lU0l5OE/4=;
        b=DJ4vY+8ZMjjwKVlCjL2oyKVsAU6ATCGdqSb/Y9YkT9Ixaf33zVUVeh0uxKjnte3CD8
         g97IdYG5qimcJmGYyKYnHw1cbuVkLPyvOufUFMfp/jH9DUd/rqMJdZDRhu49GF5S8CrI
         7hTNwMVG7UqXKjhLv6ngpMF5ghED2w1ptzX+56JDWGbP+oQ4iU6Sko3CqLgP65wJLBkq
         WWrHPMKGmUaJIjUlzucYtCCpLZDvRNIvXpzA0VGJg2Kjrlxb2TEDyhCmlah46fB/d48D
         lgN7MfR2HbVoT1a1eHttrkiCje6cPNLg01+5QZBqPUJ6c9uUCkE9+cSy+XXVFFeygiiK
         w7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770867146; x=1771471946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHtWPqb4Hy0L77cGc2/r8PoW7F4JUPzoJ7lU0l5OE/4=;
        b=pdWF0CO1vb7UzvxTRNLENijHKyVh6TueudVCSh9/epQ1LAPINx+gVembTdRdnO+ftU
         N+L4z9rTG+iyVBj00QCyG+qRAjwI+FSWKZnHSUUATrI6/z/p1RDN7BW2tgKZuloeVbNd
         z4W/1EZ1k43tWRpYoTknJ1gM9n/HQzqv3MaRi7s3kLE11hILr38fpTvqdLvniBb8I61q
         cPzuvw3w+9zKmL0qBf9rAuJoTKGhyewa/UUP5f57cCgM3sraMG35Xf4OrD9A1Fh5mGtf
         PpRvuvLSWFXOGZ6qLiCLNFLU1Uux54o8eOvx9pjj9pq1PkND/OPuHzQXNztGm2OTWcoC
         hP7w==
X-Forwarded-Encrypted: i=1; AJvYcCVtw+lTDMNixKNRx4vxoHlT/kWZVVkxnWEqkg+XvCA1c6b/EMJTpf57HpnF7sY0ZJKG8euQVs/rm9bQ7Esw@vger.kernel.org
X-Gm-Message-State: AOJu0YzNL71MsuhaN4tujy2cSd4xFxUO7SmuBkEZ3T45nGkJKoDZuk59
	I9lD/JJgQLjyvTDe+sLw6Yp/+UMzYr7re1KiDGwmDH7ymVKLFPoAt3LZKXMVQB8CUqoxrAyG/VI
	0f9s13qThTBF0ZcaCWsRVxZEOcZ5lnttfjb2S2aih3SqAFC6yK3xzRFvlxGPrtFAW0n9k
X-Gm-Gg: AZuq6aIOOtTu239tnPG8TUmdh59RNDEoKjsQ3/ghjSYM7O3+RuDYtY+B6Nyjl2dZSs9
	8T3Olxxv7R/eVTkM7dN6DVBa/LqEHcy0eijlf36Abfg5rKlKkhmenW8vIDRIGfeDioBOn4GPI/x
	am3srfsEFEGTPaEoS0yyFTxW0tj3nX/86SAf2hdhzrmEfeRm76hVK8LqFm9cr1p6mvvvwdTwIZT
	C2tawo8OqnGAgXCLp2P/hDYMoXwewi7DJw5kjNuSPaKiJnXlg3Eyb1QyZ7+mvH5BrI/UL3jAl2H
	PDq1h6gyDlSZ9PFehKStUvwEhdBjue7OqY0xgoqFthl37hFPsLO2RAymgtdTSdqMdbOvvazaAwq
	OLEM+UurtM9n4QTo8/YMeXFWiQ7hGR2gf6l9QdneIgyPyVn9l9L0fL8QMRA6fa+AVAyDU
X-Received: by 2002:a05:7022:eace:b0:124:9dea:188d with SMTP id a92af1059eb24-1273056bc8bmr337349c88.30.1770867145978;
        Wed, 11 Feb 2026 19:32:25 -0800 (PST)
X-Received: by 2002:a05:7022:eace:b0:124:9dea:188d with SMTP id a92af1059eb24-1273056bc8bmr337338c88.30.1770867145477;
        Wed, 11 Feb 2026 19:32:25 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a6f3279sm2891880c88.13.2026.02.11.19.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 19:32:25 -0800 (PST)
Date: Wed, 11 Feb 2026 19:32:23 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen supply for Glymur
Message-ID: <aY1Jx5J8x/OALk5M@hu-qianyu-lv.qualcomm.com>
References: <20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com>
 <20260208-refgen-v1-1-87ca84fd78b3@oss.qualcomm.com>
 <20260209-magic-conscious-seahorse-b81c8b@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-magic-conscious-seahorse-b81c8b@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDAyMyBTYWx0ZWRfX/FxMbYeN2fmX
 Yz2gtnZSUnI4J6HNbGkAIIheUJ7jAK0jRbnjJKYJt3frX8yuClQ4Q9XPe+5yNIFlrmRQsmw8kLM
 zn01H7jH0nzz+DJWjomXrqNJN+NfJpxJGZVb4NtCIBIwqjLsD9XOjj3QBvwR5u+0f1KuM8DGAxW
 d04590biLgavgD4Nio9BvFPAMAsIIEBSL4WyEy/SqKxHGoG8pQgfiRWunyanLATF6vFpBJHgxCL
 2vTEpBy2IXwV8h0LhYO8RBjXXdTPdrXrSkP024UKAZ5n/Hu1fr7RS8fCi9YCFXXKSumNCZa98lY
 bYX8EStzoCzjNzqzG1e7jHhTfijVNcUt0pIWGDqtViTSRL5lNO80Qq8iiBKCOe4hTF3mOyPveVm
 XEDu0r1O8zPRGN+6p+O2Ue5FcMN2IcgemhwvxD9xQRPCtTIxSfG5Qdn4fHi5hId4Mzkuvhlm3iD
 k+Qi28AaK7FfQeU+sVA==
X-Authority-Analysis: v=2.4 cv=VNvQXtPX c=1 sm=1 tr=0 ts=698d49ca cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Gz7ZAXQ6loew5yJunv8A:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: gml1KXdGjlzPq5WPb5k3bx_A1Z66z3wj
X-Proofpoint-ORIG-GUID: gml1KXdGjlzPq5WPb5k3bx_A1Z66z3wj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_01,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120023
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
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92640-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,hu-qianyu-lv.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C8DB12A2F8
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 09:06:23AM +0100, Krzysztof Kozlowski wrote:
> On Sun, Feb 08, 2026 at 08:49:39PM -0800, Qiang Yu wrote:
> > The PCIe QMP PHYs on Glymur require stable reference voltage provided by
> > refgen. The refgen itself requires two separate power supplies:
> > vdda-refgen0p9 and vdda-refgen1p2.
> > 
> > Since there is no dedicated driver for REFGEN, add vdda-refgen0p9-supply
> 
> How does the driver matter for the bindings? If I add dedicated driver
> for refgen, then I change the bindings?

Yeah, I know that dt-bindings should describe hardware, not software. But
what I meant to say is that the refgen is different from qref which is
controlled via TCSR registers and its LDOs are requested to vote in
tcsrcc driver. The refgen doesn't required register setting and it doesn't
have dedicated driver, so we vote its LDOs in phy driver. I will avoid
this statement in next version.

> 
> There is qcom,sc8280xp-refgen-regulator so why there cannot be
> qcom,x1e-refgen-regulator?

I think we can and it seems better because the refgen for pcie phy also
supplies reference voltage to other modules like usb. But I checked the
qcom-refgen-regulator.c, it contains some register settings and there is
no LDOs voting. I'm not sure what does those register do, maybe Konrad
can provide some backgroud. But on Glymur, we only need to vote LDOs. So
what if we use a fixed regulator in the device tree to represent refgen?
We could set refgen0p9 and refgen1p2 as its input supplies, then the PCIe
PHY would just need one refgen supply reference.

- Qiang Yu
> 
> 
> > and vdda-refgen1p2-supply properties to the PCIe PHY dt-bindings. Use
> > conditional schema to restrict these properties to only Glymur PCIe QMP
> > PHYs.
> 
> Best regards,
> Krzysztof
> 

