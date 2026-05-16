Return-Path: <linux-arm-msm+bounces-108000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLqtLPpVCGowkAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 13:33:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 110DE55B743
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 13:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7F24300D457
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561D53D47C4;
	Sat, 16 May 2026 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRlcbz91";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9hyGOJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE13A31717C
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778931192; cv=none; b=jCBpt8vNplFYduG3PZvKyaxlJ1L63TcMITB8BA+Fo+nu+KZg44bTNj4XLI4LpJrjmA11I9XOVotA3eu3odCuCuMdgmThdlY4N3R9dr9uY4jC6BksCWb2WYzvJiFxjn3wRpnpOH2bqGA+xGV75r/FJe74W5jTeHiugUcjLMTxMN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778931192; c=relaxed/simple;
	bh=c7/fDj5CZMFkOVW3HG3dTmdxHSOCpcjlJvRGLHkPh8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2hJ9ugZ+r9AFoBdiEYJl698j2//4Mr5LYhBDsH6bnxyWp0qeao8zqAhla2/0r5LdZLx76RHLaCOlPOQoZzqAZMlQVDaa5JIUjUDu7c0o2wILIuGYXjcrLrWn/6a3WRpIWyrKiIdoM8wEixDcH7RnCSZsoPvDzApT/UGNvBpyC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRlcbz91; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9hyGOJI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3fB5p778378
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AX0tFwqRt6TBvJg8bQIFay/r
	t7O2EG7am9/QJOwChb4=; b=CRlcbz91/iKdUsgMnyzGyZj9OJRH+LVvvoZbkIv/
	BgkZl07f9Gat9vz7f9dsPT2eMI0yxl0UQTxoxRYQ4nTIy9s68A9KFItT7sS7WaIH
	gLofVoWHQ09vTICB1qwrXlqrKQ8Tf2Hkl7MRsH/HJahiSZoPhqhvrlj8akE+YzIe
	0D6Ewn1q4gZ1t2DhOMxhFub+M7AXCLn4JLxz3Bl++g1QMiD+vVehJ+ZnyRDAT4UD
	o2hF5bZgyIZ9ndPPjf8EbSkt2hvzkmUVTX6VnT3L0WY6WAbPX+rSc7AGiG5K3AAZ
	h3PccZU/WZQ4QyMgZS4CqGEn+cOYyxqsv98dQBEYXJyQCA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvyrs4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:33:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51605cf3c60so27472461cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 04:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778931189; x=1779535989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AX0tFwqRt6TBvJg8bQIFay/rt7O2EG7am9/QJOwChb4=;
        b=c9hyGOJI0wdzmZSuX6fUjVlPZj/U2MexXZMt7YrFVs091XM+IcO1iOKxHvQ+LDEv4V
         flFbetUAZzJGGVNjZnpEA8agQcAhM9kfwtYRRII/8lZD2xHaqliAMuDVks0ptU/t3ajZ
         4Ayc0PPi1PNONH/knX+8GGccHM1WpARKVo3SofwEcDafpaHKMm+JC/ZwUKrNYdKiej29
         N/DgOyAVDEpUWHi7BvZkPYIwbsgkQfOMiWoCg1OXH1Mws17w5qjJDbW8Y4wSCeZvPcAT
         X2LTTZHAeW53b0xn2IHVV+Bvd9Az8Ta+RLcVHnvDWt+YuUmKLy17fhjkrD41YYm4TtmA
         MTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778931189; x=1779535989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AX0tFwqRt6TBvJg8bQIFay/rt7O2EG7am9/QJOwChb4=;
        b=I4y9yIrOiYwPkt2wLQwYf/oYJBV8AiKHeCVFRlSBBj/AeJH3YZ4J4xdze3kOLA/nZA
         sruYu+gJVpvaFtB3NeIBI36kqHNJfgls4xuH3ueNn+c9u0kew56ukLMu1BGl1RWEqdgj
         BHt3gGy1MxB/JWhWcpKy1qHslukZYWlSxpFVjUpbyFwshlUxAxHJg3qljfjAze1iAFd7
         4mhWwjJg0MYRpRAzZCDG5dyXi74DSXMXBOhh2kEtPp38ExUW5axgk8ub7C+XIO4FlilV
         E4jMjSW4OC17p8Kd/t+IIlg7TF5QHUJHXxRUK6d/nVtHEgGvhZGMk+iMmBEqm7D6q4Ie
         suOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bUQOeazM7cbg/XDlVWfSn66So5UwvTTdBKR+jkj/C9pjsOEJTsLkviVL6C3BhBvBME+PjwD3BSi95WaiR@vger.kernel.org
X-Gm-Message-State: AOJu0YzlMm79OVaDQkKSezsusWxy/z1kCcL+kyg5Z9PmmP3mu9GGAX7R
	p/XhXtBz+O77akgu+7Lr5ox3LM24JjRFxmnIWOQxvCAAbi4dTjli7GkgVvhE2l11kBcse/QnDDR
	ZBmTzfrnAbW4c8Yi+kxCSlpH3Zw3yT/2PsNOrpHfilWLENV6GjbvBbCYSooCSOEU7Qu5fv1I+WM
	ZL
X-Gm-Gg: Acq92OFEnGHAErS7lGfK8Cy9VqWV+gQsta02aSR8KTObSpmPphrNiCFX9d34cG6ysgh
	dIc5itZrus2kTpw6OXglGG+Zzmo+fzR6+AIbIN0UctZvIXUALsxjH7h9iAnf8DtyoFAQNqM0XYe
	nYE+SX2sceE990bAPNbyLCWRLey9SnFxJ66S/Q6xmdOU4Xu34nNSbLrYvZkRUk0W2FTlMQAe+B2
	02oj5j2FiVNFOgqxglLb/MU89A+d+RNBf9EGa7rQbwYuT5CVIByvb2w7mLf/QABHy/+C8ZHtf3r
	9OaKaSP28ANQyT/znXzk0f0Fuiv4PbXCxi/hYvXj0gpCMka5H/UwivCja7aGYxY/At2t7lVUp/C
	A6E+/9XpXH1IIzKTHApeJhnhdIJsB/dmGbmg=
X-Received: by 2002:a05:622a:6201:b0:50f:817c:2fe6 with SMTP id d75a77b69052e-51659fe0269mr114688131cf.2.1778931189045;
        Sat, 16 May 2026 04:33:09 -0700 (PDT)
X-Received: by 2002:a05:622a:6201:b0:50f:817c:2fe6 with SMTP id d75a77b69052e-51659fe0269mr114687691cf.2.1778931188376;
        Sat, 16 May 2026 04:33:08 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm23351835f8f.10.2026.05.16.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:33:07 -0700 (PDT)
Date: Sat, 16 May 2026 14:33:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Message-ID: <phulow5tpsgjhbioqcokrzwezlx6rlxc6ymmg6wlj43ucxektu@p7swwathtoqq>
References: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
 <20260516-vivacious-axolotl-of-attack-4e0ad7@quoll>
 <if7u76ecucdpjff7v5a5nryb3oiyouofn4ldpu6dmfweg5tjmh@gxdvexjrazvh>
 <d946b45b-cef0-43a2-b31c-a3860836745e@kernel.org>
 <igtojkmahfoubhkbv2dn4c6h2fzu24patv5n6etjdw3jsy7wss@2qbxzsxg7ph5>
 <d15f75f2-01a8-4bd2-ad12-ee67c93c74d1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d15f75f2-01a8-4bd2-ad12-ee67c93c74d1@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDExMyBTYWx0ZWRfX3QlfeiSfMuSG
 3bbFW6IQmWUvGF+08STflrWvPYF6b5LHrpkZQogLtYg2rQPylHdqWZz0XPD2oOHC6K/OcFH+Dqg
 uQm6um7zUBCAHEw09pf3dkmB8O14cVgNpOvjyuK8nvUdUHfl3L7mIbC3T1PXg8Si/Vry5kp6vcC
 TNtbvT3dg1mFpZ/UvYdWqnifxmCOW3DVAJS+QCghB2pm9bo2EU0NlebsNe826iPBX7Fj3EsO39x
 WVWmudDrPA5JvCOwkaUC3C075V78l4P2oNB7ely6W9h2qm8ntpy03W46KhjTIfeJMJuQCube+WQ
 o6S2+VWJQujy3rXxMeSsECj/YEx9PtjdiIOFuJtfdUgwKZGj2nbhVwRfq+RFCP+BPfithHE0tnc
 cO8lWOPJdeGHHVVfSUHm9fSX7sEBtrRA0TMgyvx3chks23ZQYSlnJusuaxNnkFqvOUQ/LVtvSiT
 ANuf6UQaTOYyVDV0bNw==
X-Proofpoint-ORIG-GUID: cLJCVrwMdyfVAhZrMyxIKAby057SvZEQ
X-Proofpoint-GUID: cLJCVrwMdyfVAhZrMyxIKAby057SvZEQ
X-Authority-Analysis: v=2.4 cv=X5Ni7mTe c=1 sm=1 tr=0 ts=6a0855f6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e9gZUEpOi7332uh5qvgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160113
X-Rspamd-Queue-Id: 110DE55B743
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108000-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-16 13:22:19, Krzysztof Kozlowski wrote:
> On 16/05/2026 13:12, Abel Vesa wrote:
> > On 26-05-16 12:37:03, Krzysztof Kozlowski wrote:
> >> On 16/05/2026 12:34, Abel Vesa wrote:
> >>> On 26-05-16 11:59:37, Krzysztof Kozlowski wrote:
> >>>> On Fri, May 15, 2026 at 02:13:31PM +0300, Abel Vesa wrote:
> >>>>> Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
> >>>>> boards. Both boards are built from a base board paired with a SoM which
> >>>>> is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
> >>>>> LPDDR, eMMC and UFS.
> >>>>>
> >>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
> >>>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> Heh, I noticed only after sending email - where is any user of that?
> >>>>
> >>>> I expressed it many times - we do not take bindings without users.
> >>>
> >>> Well, my intention for the DT patchset was to include the eliza-cqm-som.dtsi
> >>> and eliza-cqm-ek.dts as well, basically having the eliza-cqm-som.dtsi
> >>> include the eliza-cqs-som.dtsi and later on add the modem (and the rest
> >>> of the CQM) in there.
> >>>
> >>> But then, I realized that I don't know exactly the differences between
> >>> CQM and CQS, specifically the SoM related ones.
> >>>
> >>> So I decided to send without the CQM entirely.
> >>
> >> But it is not about CQM. There is no user of any of these - neither CQS
> >> nor CQM.
> > 
> > I'm not sure I understand this one. Here is the CQS user:
> > https://lore.kernel.org/all/20260515-eliza-dts-qcs-evk-v1-2-7169d78a33e1@oss.qualcomm.com/
> 
> Why is that posted separately? This breaks every practice we had,
> including all my recent comments complains on internal chats and in
> public to Nord, Shikra and IPQ upstreaming about grouping patches. :/

Yeah, my bad. It should've been sent together with the DT.

Will include it there when respinning that patchset.

Sorry for the mess.

