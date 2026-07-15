Return-Path: <linux-arm-msm+bounces-119169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YggHF7s0V2p2HQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:20:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D0475B626
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:20:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dXra97zr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XccGGVd3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119169-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119169-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C30DA301CF9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF593C3791;
	Wed, 15 Jul 2026 07:16:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3903C1F4F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:16:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099818; cv=none; b=ax/cCQN9d5AV/LN+gptPV0ijDqMPyv33OKfk+NE9qSzJMwqpS4iKwUWfi6Io1NtFl9eu6lHPkCRIvfSnOSnqmIHceHV3f1BAKPtcNryO9CAy/f+ThrDz8+hdf8Q5e/RHH1ewMYQ3zRq1FEdsnW81ZBCCdR6Cdq2SdgHc1oLzQK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099818; c=relaxed/simple;
	bh=peEZeARG0HEMoCiHLDH3PVgVIFFbTBPIugxcmGQ/+qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEIV8fUgZxAuC2v/HsZF+ApUc/XiUtSIqueMe213kGveMJ8GK/DIL7wK89m2c33Ypv8/wvek7YDg7+TB3Tv26Wiv59UnzGsnbBKJLsOpY2I17LfNl4vFZXX60ecjtHb5Rz8hCkxewDXBEX8kcXeEB3r3y8XGHVCWhL0crFEXd00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXra97zr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XccGGVd3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lJPF2621249
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l55Dbn+uB739qkNMJrfJN0It
	ChWvhwJWIh3jTf2LSE8=; b=dXra97zrzYHtaS4DfcQ3OpnFrOiRtH3slBd+CqoJ
	3xpy2WHHNkmxxAQugUG7iuIqz5wxAZMnRkqy2lKDfNgPIEnWkDlXm/K6I+oyapaI
	FobOZh2DJ3TgN0yjHjYCIKtQ5EJrF6R3zWQUcbRHgFMtoAsys/YJDegCkSNqLTD0
	ePVWv1qL1ywHQF2sfztgjL4ueuYyQ8BtkJBUML92NF9DcrgkO1Pol87ZMaqCdBBP
	Lg+gzYXCMtj5x2SPqlbmdZ3I3Exlp3sFwvtvK/OY7RK1NGuXFs55v+IwkKhGMbYG
	xfJ5nkMJsNnRTrK7zLSm1ws8/CKI8k9lV9HnzNMTj3IjmQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vh3h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:16:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c083f1818so29694101cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784099805; x=1784704605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l55Dbn+uB739qkNMJrfJN0ItChWvhwJWIh3jTf2LSE8=;
        b=XccGGVd3djFEocJMfiD8IInQTka9uZnTzCoQA+ARfLL9sba716l0pA1uryc+2RRZgs
         FVilmtG8DVMMs318Zhing7fTQRWUievF+rOMq7g1h1Npxfo8INhXEAV1VB+vMsI3/snU
         zT/0mVr5B7WIRJmEH6Bv/ISm/12NjtQkH9EDbiH3pzSfIVksp2yjbVyRYgkpj9dK0Ykx
         sDqvaNDlvlxKVzSWYk266EP39RL9TkoDkKchSqu+sGOeCKX54cG+p1/qOdIMEdnYvZYI
         EauQdlLyFd/G35663RmxIu4Yvdg5uRyPzl8Mwlq3i9Cqjv8tLonQNi0mi0gTG/3NcZtS
         EiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784099805; x=1784704605;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l55Dbn+uB739qkNMJrfJN0ItChWvhwJWIh3jTf2LSE8=;
        b=oHE6TgVaDKYgrsvXfZJsZ1edaN18c6BoTXWAYnxCh9N3llFquIF+LhA3VONwix+DBJ
         cw8XpZrfQiWAJvn0Zbsea3e8w9P8ednIe5ix9ZI/OInQHMIAH0aY58m2QJaOPiFubYLt
         Qi3d4yWZYQAjNJ0cPrQEb/YxqNYPDS/8KbmVl0LzzNW+tuRrkvDC0XimlkF/yMqFJqtk
         DwiVsgNAWrFzYNMU37ZTA035lRoYR5SBNEnIVKKRkvdmidFytO0nxoOZwCLp1yFQrZ1K
         MY6KTSFXG642yNTvNlVxf/J0C1U/kReZs2SPBeemMLurF9w/YNkMsdoq7X4xakBjW/Hc
         1O3A==
X-Forwarded-Encrypted: i=1; AHgh+Rrh5xDUuH/yOC+jHt4AYAyEA5ssmAUA5fz3WpSx3FU3uZne34lHSt8raoOYoQMKU2p0k3xVm0DjjvGJVNm3@vger.kernel.org
X-Gm-Message-State: AOJu0YxGllrqQHbc5CpeR3i2c2QVpEM4p9Q3NFVnbGjiu93Z6Mh4Cvjw
	LknSIFkiWvbkXdZE62pdnxcXY/k6IQiYP0MYZdkzvqFCJOv52Z72+CwmxcnK10O9ea+PMT/20Cd
	A2v7I/GiY1JlqH2Dtf5Mx7FvYBit0NzLt/heN/1ef9vTvCZG02EbAMvPawMvtSGO3TT5c
X-Gm-Gg: AfdE7clbzcmy8RLlf8AwqpCrIHdXfN0sxFsGPekrybpGMnhnF96aUfyaJX03Q1tTKnx
	8R6sJknYDELRwi0VqlShvinYQbvmHSUd5OVVYN9dTgW1wUGD8VC8jq46IzC9ZBN4/X68FcxKa7I
	OaN6kQQeNGRXg3yj0IuMmpVCgWW3dsc+VfO+Ae475813Af28zGlGkv7LkfHmv7Ge6VoKelYuPbo
	VF9E4HH+HnuTV3EJ7rrOgb2tkOLnLsJuZlmpuiPZomRGbs3W7y2oU+qnU5EsLt/8Ttp8VtsGk+l
	HoO5T4e8cETy3JUn/IIbX4C1NWmfXo8+SETpxlHYXBs25uJOdov0AR7uulDPnq4WRQ5fno1Rd2w
	ZmpY7cnekjNTlTYmjyq7Q5Q==
X-Received: by 2002:a05:622a:229a:b0:51c:7b12:5ff0 with SMTP id d75a77b69052e-51cbf3dec76mr162829111cf.76.1784099804956;
        Wed, 15 Jul 2026 00:16:44 -0700 (PDT)
X-Received: by 2002:a05:622a:229a:b0:51c:7b12:5ff0 with SMTP id d75a77b69052e-51cbf3dec76mr162828851cf.76.1784099804356;
        Wed, 15 Jul 2026 00:16:44 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a322dc6sm137697535e9.10.2026.07.15.00.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:16:43 -0700 (PDT)
Date: Wed, 15 Jul 2026 10:16:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: Document Eliza
 BWMONs compatible
Message-ID: <j6p2aqqn427lr66n6e7gsegtrilcyidmprhyqvmsa3tbv42zgd@mgcz6xp5wi4d>
References: <20260708-bindings-llcc-bwmon-eliza-v1-1-3c7dbcbae87a@oss.qualcomm.com>
 <20260714222740.GA3177936-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714222740.GA3177936-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a5733dd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Q5Zv6aI2IZJGwc6Qk4wA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: gCwMtOg9Ec9WP_xFJj8hF9e_XRaZctOq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA2NyBTYWx0ZWRfX0Fd2QjlRzlI2
 t24Q9HwSd6hvfoAUiI+MFwXl1OnB5UxOkspFPmrEBfSDjuuGXAbYMStivVFucXvv+/IOrZsng1T
 TIuAyVc8vkHvogzmwjucpxd2GSSlEzJ5PWYBIzZFmgRq7lzttsYrlvZqYSoBV5ZIIb44SqYcTCA
 Ikl5umTRqVY59MgndSnC4YAlf10anppiL7QTVM96DW1dKB+fTdGEIYfBxI6bcTwIV5/GL+E4ivG
 Sv0sHDlfC+gE2Ftz7zr1R655XmPRA7UMIiqhJQ/Knd7ok9/Tb32TNnx/otMRgyS5QkDm6Qsx5zL
 dNO5FHwUukk82+bsNeUIkfHPgCMYG74yR6eBJmOjdQaPb0Y90IY+zaUvgmMj0rUq8cV/k++UHmA
 A/UAVeX7Ghg32Qmciv3xMGhEbyL7vGxgd4YaXmoyODsSrfruoZXWO3dEfnDRFu3gdvSU7jkZwEt
 UUcenqvw6wVZyNp0bWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA2NyBTYWx0ZWRfX+CGGqpAP6nF1
 nYrxmypiUkxNv6ighk6fwfTsniiGON26yvL4eshC2imBNAlNxGEhSkAtN3RL6RCdELu5V9DBOal
 vA+cw5HqQWVCIXQM5oE3j3przm6cBrI=
X-Proofpoint-GUID: gCwMtOg9Ec9WP_xFJj8hF9e_XRaZctOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119169-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,mgcz6xp5wi4d:mid,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1D0475B626

On 26-07-14 17:27:40, Rob Herring wrote:
> On Wed, Jul 08, 2026 at 02:57:20PM +0300, Abel Vesa wrote:
> > Document Eliza BWMONs which has a BWMONv4 for CPU-LLCC and a BWMONv5 for
> > DDR-LLCC paths, same as SM8550.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Applied, but this should have gone with the .dts using it.

Thanks. Will do that from now on.


