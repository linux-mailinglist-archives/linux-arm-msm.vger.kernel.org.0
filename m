Return-Path: <linux-arm-msm+bounces-107995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFVTCDBICGp2hwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 12:34:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 782B455B29E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 12:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF5B6300FC56
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 10:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B7A3D4135;
	Sat, 16 May 2026 10:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVeq8slY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPiVm8GW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918D437E302
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 10:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778927658; cv=none; b=IOXVVjm+jDdEHNXLR3fHgNXzzaG3xZty9kqr3z/EgFTb5CKJrdMs/dEsa6El6Q81ApgVWfAZL9ze1ti6bjE6lFPBpcWsqqR8iRNRue1DPoKHFcbKoKtRExInD153oR7WQRuJLhTrzIffkhtOyWl9M6yZH2WbjEHmOs4fhVpCwKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778927658; c=relaxed/simple;
	bh=eEy+NNl+WsVSXDV9JJ7AihsAdhnLuMN3nivA8ZtMXog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNQwcTq5cW67DaFFYdHVqL0yXefU5Lgagut6lUz7fQFzy24lkNrI1ml1PFInt64Mog5DwlAZPV1pljE5avespZZPbOpkrx3BwgUMF9T4Q2rU3Ss4Eo3lme01ME7Gov3tc9Pm94+gUm6HqltHKbtkLUOMXb2pw2W0XA8rmwAxVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVeq8slY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPiVm8GW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3fHD5778590
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 10:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DKHHswqBUBxZlbbXiyxDnU5I
	5G4+BYbZHvJWJAxuCA8=; b=jVeq8slYRU80Jijc0nfMiALvIbmd8a53SXUuy9jb
	y90d8PQF904qQeNPnHM9L7X7VVeyEmF94c3BRCo2XmefLwKnQfyZqgH3pQ2nKe+J
	ZfyF7T78jbbV0xW1AvzJmTClQGfxYcSF12NMlUsfjiUxC5cqisSm71lkReDgZdF8
	p6MeeRpL6FNn+l//406EGVy4lOgq8bdISL/gzcTcZegwMO2twVTxPj0QM9I6K/+U
	o6rGTELqPdjdSl5c8ru7f3EN+rrOHlUtVhTIlD9wK8jMi+aFnTfott6gWO6VsH4v
	ACjGADFlRDFMLcMWu3zPy0ovF3FEZR4OBT7EJePmQQFMsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvyrpdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 10:34:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da529ff48so23511821cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778927655; x=1779532455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DKHHswqBUBxZlbbXiyxDnU5I5G4+BYbZHvJWJAxuCA8=;
        b=bPiVm8GW3/iondCGK87L9uY/y5lY8fQgqDaF0zzpvWKiA9ONWsXB6sGArYc2SOXU5U
         QPyf+byiPfAqi85LDDgBz2O9oRMVV4fkCskvtbQw4qGMpuh2U+MzlDDIyTNvqLtRg7pL
         V9iigcGRDig7uSB1j4cqx4JqgiIdY4cKpV2rHq7mYHY8Pq9+2AU15/oLArNZAoBryqnD
         QKPL9pdkrey5batFbW3i342b+DNgUeJf8HSm+wWQkgBqxLVCJQjYdSUmFqA4cFeToiZ4
         J1stxeVMBNCeTk9Lpwl29witj4Z3NVXMEc0XfDgPOdEAYTR1qI0UBnAx9Llj1Rnc9hCm
         d8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778927655; x=1779532455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKHHswqBUBxZlbbXiyxDnU5I5G4+BYbZHvJWJAxuCA8=;
        b=Eu39KAsO+1yhCfI9E7xbivuc+lWO3US/Se/6uqyaysR8NvYLXnrGOyPRQOv0nRNxZt
         dzd6+fKUHS6u4DGHUXzQytqtZKJtG2v9cBSx8mS7m0fTZpPRxenBIl3xe1w1aLOgUN1e
         AwzVBtEmGWtoGP6idVuwpht7TZ0hIXT6Z5M1moADy223fUhjbub8K2B1n9sTAvA2fEYM
         vO3g+vFS7/dTqtntXruNVUHkGL3s0Lr6CI0iVW5HzDPAuaevi1SY5SqlpG7DfFXRj1z4
         GzVKcvYnH36inadl0eiL3VLAR8lWk2sisjAX3cCUd9dJJXH/HN9ql5X6yVQKBIKGYCav
         fQXw==
X-Forwarded-Encrypted: i=1; AFNElJ8LgbnUZzp02CmxN6D7u0t8DT8Ebk8oUaYmqoygZA62Iaf8WWUeL9lPdR5sWzzMBwEcTQsZMwncmZZGQh4W@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp1FBeppa05K1js03GVMNonxKyI8XPJ/5k6fTq8hMFqH4tBp/8
	FxS4PalbzYzYgXX2TOOcTnyliC8GsoQMqo8U/yK5D6AEjzKPeyUa3tBMaDFoL3VVA098eSTCfy1
	XZ6lD4JZGR192oR/H4CQ1DfZNvagE689w/R+gqOfj7XPBopENC05CmNlPd6QCydCbmOkUvCqT1p
	6c
X-Gm-Gg: Acq92OGQgTSH/WGx2AkC7pXGYtjaQnGpC7NGbhoaxYP4P57YATjDA4k/bdjICPmvZ+d
	s+7oTGhravBYXyjGkeDRT0DglvrSuqVFXDE1wOSY6tw85dLyYHavZa5DEox0oP60zrXIBvGuK+b
	Li6CmIGlioQf5FKTCUzChScvYEvxeEhVcXO2J0mAT6JQVOeddUcfUDQutmMYSRrt8cq0wakmHCl
	8ILK8zsploBLYyZzHGjsvQvdcr+vxrI/3L7VP1Ya0LoWPCUg68brXmy9YrXfjBr4Ud0wI8EsqHZ
	ZRHRxx4gGLHN+Vqn4jCGN7+iB7JjJYFxBpnvQhOuZmkDu6yNllLpgjzaR1aEOMads1nURk2IwsZ
	pfEMfugywvfdKx7RbK3DTj6O+qhJAoMOT70s=
X-Received: by 2002:ac8:7c4e:0:b0:50e:5cea:a519 with SMTP id d75a77b69052e-5165a002a69mr110961571cf.12.1778927655520;
        Sat, 16 May 2026 03:34:15 -0700 (PDT)
X-Received: by 2002:ac8:7c4e:0:b0:50e:5cea:a519 with SMTP id d75a77b69052e-5165a002a69mr110961291cf.12.1778927655030;
        Sat, 16 May 2026 03:34:15 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm35829915e9.13.2026.05.16.03.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 03:34:14 -0700 (PDT)
Date: Sat, 16 May 2026 13:34:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Message-ID: <if7u76ecucdpjff7v5a5nryb3oiyouofn4ldpu6dmfweg5tjmh@gxdvexjrazvh>
References: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
 <20260516-vivacious-axolotl-of-attack-4e0ad7@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516-vivacious-axolotl-of-attack-4e0ad7@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDEwMyBTYWx0ZWRfX60K8fSP461T3
 j9Z7qqtfBzTpTYOgaLn6ab4WSVWC78QIXSlQAM6lgevs7ApSzW1kDrSZqsJuE+f/xobmJKRM85a
 m8ISUZ9OyP3jZ6fxMio9uUhXAS/oPQS/jOY9Ahpn9Y42i6bDGDWehv9q2BdYVHu6PdMNFWYCqfM
 3wmFn2iskHMLy3h1wCZu2mMtuVWrRN93cOhsoUackGkZ6TJKI7ZsEYVZ6rxxibpVrbm1dtsrpU2
 +R+w+V0uibW1LThuOG8rsxl1tEZBCZQ537CRSUROcjNMSl430xwadv76Xcs4mj8jkHRjDfjOVm9
 sLpf6VUozXh/kUc18K3iW0ifvYpYYsvkZhNjgb1FSUKuQRHDsnHTf7lG4mn2TS42xbyWlcS1oje
 /ntkXYkt84UK291zmJHiT9qPtC/Z/Md6Rybevg/ohRNechRSU4Lx0+85bhe04HYZiG1xUF7z86x
 Ig98piRk4Nm+zNRM+Sw==
X-Proofpoint-ORIG-GUID: oh9FE8zrhVyrz65UtLUhnQUzLA1zyQTp
X-Proofpoint-GUID: oh9FE8zrhVyrz65UtLUhnQUzLA1zyQTp
X-Authority-Analysis: v=2.4 cv=X5Ni7mTe c=1 sm=1 tr=0 ts=6a084828 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yHGrZt24M5PB4BZqfSIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160103
X-Rspamd-Queue-Id: 782B455B29E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107995-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-16 11:59:37, Krzysztof Kozlowski wrote:
> On Fri, May 15, 2026 at 02:13:31PM +0300, Abel Vesa wrote:
> > Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
> > boards. Both boards are built from a base board paired with a SoM which
> > is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
> > LPDDR, eMMC and UFS.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Heh, I noticed only after sending email - where is any user of that?
> 
> I expressed it many times - we do not take bindings without users.

Well, my intention for the DT patchset was to include the eliza-cqm-som.dtsi
and eliza-cqm-ek.dts as well, basically having the eliza-cqm-som.dtsi
include the eliza-cqs-som.dtsi and later on add the modem (and the rest
of the CQM) in there.

But then, I realized that I don't know exactly the differences between
CQM and CQS, specifically the SoM related ones.

So I decided to send without the CQM entirely.

Anyway, I'll respin this patch with CQM dropped.

Thanks for reviewing!

