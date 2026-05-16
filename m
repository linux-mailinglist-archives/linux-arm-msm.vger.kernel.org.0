Return-Path: <linux-arm-msm+bounces-107997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPq8AR9RCGoMjAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 13:12:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F6155B630
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 13:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06851300601D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DE93C8C7D;
	Sat, 16 May 2026 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KzeVtIF/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cY1A4syV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD854380FDB
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929944; cv=none; b=maoO0blmanZApGh6Chk7Wzq/aQgP15/RUXmBGuJR16hFPxsFsqucvtylBpc6vgPvwtmMvzwZ2BmvnNdjWyyO5y6QOTVT9ghwqZ4SWbGHJebhVvbblErsuoSBlzKONc4eNTysswGyiTgAO/SpNYEnJHj4Wd7RNtkbopwkdtdMwyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929944; c=relaxed/simple;
	bh=3vnKfbc1VkmlR1G1GHlzJBAcgSt3U4rxFgtv2H4ZahE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkR9uLTrpNA/mtPZJCyRBLgKMrl5WXhqcTygI9DcXcVcPV6RLe/ZVdmLTog6z9B+jw90zkY8JFeBW5/iaI07o5OkiftCpg1NKJfwKTy+t29LGuv7DeD5IzRcHM8sb/lYCZchCknJcubl+/GpgXt7HFhVYz+Aj3iKCP3UOGIwTYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KzeVtIF/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cY1A4syV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3nT2M4081770
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+2qT5JovX7kfP0I+bMIJ3G9q
	zVfq2Vm0XOgaxrq5B2w=; b=KzeVtIF/+YpjYrIpUGuD2B8b+mTz8csXz+rMq1vy
	trHGC2OrrHd0HAUmAAgDaZ+1JGQcY7JV2UNXaxeN/oGjPKVMlMlPka+K4HcANxkb
	Zk1K4NA/DEhB3E5azARuA1n5z8SMkfHiqiXiaWKSh4Z1M0Izh5icfg88SjMAIXbD
	gHtw/o+BZGmlDKRTYbOqYs48Ahfhn1lz0xn7alE2g4+He2QtdREjZKM02TdfCPr6
	XbnbWD2SLCJzNyCJFugsehAuqFfl2P9k6JFsjHW5EjkBNaykVa7zzORHpGBZ/YYi
	Y8U0amibKQRulwrkHMxYuRDhH0tcdr54TAsnGzPNTLZ5KQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0q8qkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:12:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5156c85538cso24576101cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778929941; x=1779534741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+2qT5JovX7kfP0I+bMIJ3G9qzVfq2Vm0XOgaxrq5B2w=;
        b=cY1A4syVeoi+3n4WPzRLz8min+hX1aew4rC3sWeUF150xKYVrwLd+RCWowhITOLTme
         LW23WFyS7Kxyuo19yNpPIbVcBoM2Yi27xTY10HmHPJJwMPOTGi3NaWjfzDvzqAtAPhXc
         nkga2W8ZsYB1DDZ+c9gODgB1R7vn26wKboVOtvx3lexZmdyXNPv1Kf2oI7fiaq5pGhlv
         9Cg9wDYkMQD911NqJobWxDQrRu1zUAUW5P2jxUpz2p68pIufEKyQi0FBOzv9OOwL7zts
         JbpOb9+V8kPJxDoev4EE6N1Pv80Q9DnlexCyIJdoIApe0bE+X0en7h05xzc0AmUYdUOJ
         Ptwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929941; x=1779534741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2qT5JovX7kfP0I+bMIJ3G9qzVfq2Vm0XOgaxrq5B2w=;
        b=ec071sH//jUE8UXX1fO27kqZgVq6NVFXe9jXcQ2JrwekS8HrMoj45bYxIq45J5Mqa7
         //9bEh4ZTrhCsO1I/PYnEhmOnxbdXG8hYt12p0fYxLaQBBHPmacjOQp8QVGxpmXJ7LVB
         xmqNZEZ9eyxszhE1sB75Wx8+2M6L0O74kDQmCxGZzZzErpfpw9Wu519pL+Lm1L5VH3Z7
         rbVayUxlFOjQk+RO330QHtXEP04XDYsEclFLPK19xPzCZ/pUUcFKkY+ukFh/t3fsEFAf
         3wUEOrzleNlD6HErhj4TQg/r2DSGpL3eGA9aI8vk82X/kfxgbgyiP0+NTiatfEeJOz0h
         BW5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+t1bQBS5gmsvWWICn3kPiyCD3ndSi/u2Eo4E4eXml43al77iiinphOrSCXZY34hare+VwqdywHzxp/7hOT@vger.kernel.org
X-Gm-Message-State: AOJu0YzrUX+KPMkIP4lDsl6r8KJ45BBLMSJqV2d5lRKej+maiJhwjPcs
	tFmtlB/kw2DZnLLV/Ex/FwbKmhv6nyO85S8+T6xsyQctiNhtXNCoNUtSB/PBtQhbJc2yBkZa9f4
	DPaPMqy+IzX+QPkp03cllh9IT7UsOw6HYCkjN6c5mJ6vT4oj8qEl7zv2KkKg2oeK1oY3F6QLrM8
	Pg
X-Gm-Gg: Acq92OGIWr80yCH41xEaU9kC/Un4824kl/iCKXKbeQWP5PwiUiJAAdbVysP5aiJHzeH
	PNLiemwjVUa9HfNc+CQve2KjLENid6ZeMcnGmB7as79eWLm+6ZZlNhHrJk785cJY2MPNlJtl6CX
	hlHx8D6oHEybAqnzWoZM4KFRbOdbWy+bYDUe+AEjp/Pk8mco5rJRp5u2V+fX4PA/UCNsmLeVYq+
	hVEDHblJU8xRC0ZPRkE9N74xcyEwTb1Po41CqqfNajUqkOJMRcB3s60HknYohJVC3dxGYShBMdd
	oYQu86FWPOS7wXeFLLuWyYkLnV5lwUHjWcx8NxCNOD9qvZ6LHo+CKj/jTDbuHT3lnC53i/LOCIU
	9Keza0M0EEO2ewkqthWBN84m11ij7jxc8ke0=
X-Received: by 2002:a05:622a:588a:b0:50e:5e0d:98a2 with SMTP id d75a77b69052e-5165a04061amr109389991cf.26.1778929940952;
        Sat, 16 May 2026 04:12:20 -0700 (PDT)
X-Received: by 2002:a05:622a:588a:b0:50e:5e0d:98a2 with SMTP id d75a77b69052e-5165a04061amr109389561cf.26.1778929940447;
        Sat, 16 May 2026 04:12:20 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm22310497f8f.23.2026.05.16.04.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:12:19 -0700 (PDT)
Date: Sat, 16 May 2026 14:12:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Message-ID: <igtojkmahfoubhkbv2dn4c6h2fzu24patv5n6etjdw3jsy7wss@2qbxzsxg7ph5>
References: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
 <20260516-vivacious-axolotl-of-attack-4e0ad7@quoll>
 <if7u76ecucdpjff7v5a5nryb3oiyouofn4ldpu6dmfweg5tjmh@gxdvexjrazvh>
 <d946b45b-cef0-43a2-b31c-a3860836745e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d946b45b-cef0-43a2-b31c-a3860836745e@kernel.org>
X-Proofpoint-ORIG-GUID: QOr7jRkgUH5jX1FYLZz2yREFlp0nHE00
X-Proofpoint-GUID: QOr7jRkgUH5jX1FYLZz2yREFlp0nHE00
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a085115 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iPrq9hpNfqLAvcWrCccA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDExMCBTYWx0ZWRfXxRaF+UTPsdoQ
 L6wt7ObJPAQk+P0BfQc1OT/Hs55sO7+zEnPA5KtoPm7wotoZTK19HZtwYGyIp9qycYLt5/qkP81
 NvqzojgCUB8XIvya3DzK9qxFMkz5sGeg/KUo2J8SjNfcZ6dSC8X8carSraPLlBElGi9/ObWc6tI
 nGIUOFUQwpmB5CBXdqR7Q6K7bSQQvB0fm42F4qG3LMAXSBn6PfJAcSAMYuPwRrCd5dSTPLb4xCj
 WWNswgfWfhf/geA3D3YXW3RlpgV3CnO2YD33/4Ej5tV/bfMlzjaR5Vf3Hl6fEWVYT0Y/HHr2zyz
 p1yrMpFlWD05fxGBc4G3dVqB9TTH3c2J2wFc3L4m7td3kmOmOTQZVW4WXPTklE42IMpG+kDB261
 N6hFxmJ01ErBvTZNSXObojS5sTgQgMZWGz1S2ui0M0NFR8LFl26WH2Gnh5f1KrKNbzhOTlkWiGO
 OqvVeBRPmGHy0XviTPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605160110
X-Rspamd-Queue-Id: 09F6155B630
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107997-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-16 12:37:03, Krzysztof Kozlowski wrote:
> On 16/05/2026 12:34, Abel Vesa wrote:
> > On 26-05-16 11:59:37, Krzysztof Kozlowski wrote:
> >> On Fri, May 15, 2026 at 02:13:31PM +0300, Abel Vesa wrote:
> >>> Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
> >>> boards. Both boards are built from a base board paired with a SoM which
> >>> is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
> >>> LPDDR, eMMC and UFS.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>
> >> Heh, I noticed only after sending email - where is any user of that?
> >>
> >> I expressed it many times - we do not take bindings without users.
> > 
> > Well, my intention for the DT patchset was to include the eliza-cqm-som.dtsi
> > and eliza-cqm-ek.dts as well, basically having the eliza-cqm-som.dtsi
> > include the eliza-cqs-som.dtsi and later on add the modem (and the rest
> > of the CQM) in there.
> > 
> > But then, I realized that I don't know exactly the differences between
> > CQM and CQS, specifically the SoM related ones.
> > 
> > So I decided to send without the CQM entirely.
> 
> But it is not about CQM. There is no user of any of these - neither CQS
> nor CQM.

I'm not sure I understand this one. Here is the CQS user:
https://lore.kernel.org/all/20260515-eliza-dts-qcs-evk-v1-2-7169d78a33e1@oss.qualcomm.com/

> 
> And still whatever intention you had, it cannot bypass the rules - we do
> not take bindings without users. They make almost no sense to the
> project, because the goal is not to document entire world's hardware in
> the DT.

I agree. I should've replied back to this thread to say it should be
ignored as I should send a v2 without the CQM.

