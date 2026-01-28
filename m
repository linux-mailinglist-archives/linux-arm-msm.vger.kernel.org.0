Return-Path: <linux-arm-msm+bounces-90929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMxcFPrZeWlI0AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:42:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A26969EF2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0A3130056EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2738F22D7A1;
	Wed, 28 Jan 2026 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYyuoAaC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZzp1LZt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A7A32BF43
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769593118; cv=none; b=abDxP7cxvdstFV640+n6Bo2VcXHAX6W/t6+iD4xW+v4E04QlkXswPb23rsPf85+PE05/d8hKJKNeXSZrzMRlKINglXL9E440Fk+pTdX500Cd0SG985bYn/daDO6aG0iBEzH4WqgKj61EbgWzgir96U5/ia5rnZBXQx09X8JCpBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769593118; c=relaxed/simple;
	bh=SaLzpK9cppXT/xXveOAE80OC2gdc/uRNUK8N8rdnL6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l98yRRLVIQMpCjcvwdLRdUZdYeVkw1t3KlEXN/zZZ4KP0hOoFnvyEm+he6o0l0GTNtUs4xNWForaZD6CSn0Sx5hjJqf8J7FD6CQWvjGUckq+o3jyawE1ER+z6af7lHGFaxw3oF/N1ljE+74urkWvYY0fQ2xa6NAMW8UU5GC1o9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYyuoAaC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZzp1LZt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91o9c3442318
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 09:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8n7NGDuvr8TWMjmqTO9g1tcY
	k4MIbn8AHbCQbwVA11s=; b=RYyuoAaC6a8tREwyDfeGboanMmi+DqvSipC+7URF
	kZByzrL5G+6KENhy84KLo758H0mE2BCJCjxCcUx8vnQOlf9MwZQaF5jmDpNbrVuU
	eQyxZ8z5lDFWpDXB1uQnM0RktXvOlirhnHSYWQpYnghWUQKp4qJHP4Ue9sYH3eUq
	zNSB0Yp/s1Lqh/DSh9znaFwgE110mkBT8uvLAXV9li/qVW6QdaY/Wx3ry12ZWIP4
	bSCk/975tujJn3+R213OLLVWNCj7P7z1FXhPU4Lh1xH7Kv764orxg3x1odAB4mZE
	1vninKWIKooW2YryWgXhLiyFiutSOaIp9Y1ubZY8wG0ojQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byanah3da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 09:38:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6cfd52556so213744885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 01:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769593115; x=1770197915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8n7NGDuvr8TWMjmqTO9g1tcYk4MIbn8AHbCQbwVA11s=;
        b=WZzp1LZtBEnrjiIOmB33UDwEH6TS4LMWjKtnaRLY8HHgZIXPDoyIaJFnJQ1eMKu7I4
         +8zoHQLncdUDrRGG1pQUMZ/Hehs2mstBgE28IIUPCBVHDJpYrYUqgXukzxvxnsuC3f/W
         u8h0AeLB/eq058NDZGvaV0m76ihfyOwNYF+Is28L5MdanFbWQ4AYGieNjqW0AzzbmyEy
         3oKbY0Al4ThL6WWDhmI9cgu5dXMgGu1/Zv+ioQOHzq0eQevn54z+YSOiC5aoNsvDnk3W
         qXXutElsaJ0txrKfhhti2WUT7JpUAkKv9Q/dvitJ7kudOwe7ec8DjAjcfUWV+imw3teX
         roXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769593115; x=1770197915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8n7NGDuvr8TWMjmqTO9g1tcYk4MIbn8AHbCQbwVA11s=;
        b=cuYhZLqg/Hp/5qjXora3yT86dxEoYGZw6lzBeCR6Bzlo9/Gt2EpW3FrjLF57x8TEB6
         YZ2CjKFO7bgSWx0VcGOzZyCV66wQAiqmgsyZOhQgp5U/XORL+Sq3NFpNUv5EO0zIG+/Z
         Q40VCsRO1l9u/IvckemfB8nCJr6BrSkPbHUlqM7A02HjLwChMOi4HQYb7Hw+oS5sXzUX
         mCuuEKLJMCC6XmRtsRKPq7ZTsnkVfgnht3drj97X02y5cONInEOE5Fc3+N1B1i72d9NR
         wKna63JoDGcW92M9lTZ1FMwbVB/0DCxSUKPlJ+dP7wP9huzU+ySZ5L/Wo58b0NcIN02f
         i9ag==
X-Forwarded-Encrypted: i=1; AJvYcCWWX0Fp3YgUVaAsFJBB5jLib57rEP1AGHXS/BoWT6L+KMrGOwZ6wzoE0AxazSvYYhzjbiR0Q8fF3vxo0zxt@vger.kernel.org
X-Gm-Message-State: AOJu0YxaRYRHU8EloiwtDICJZrD0G8dPOPrPsTaTOtJkXqArMNkt/yOs
	wevxTCUNEBSZqITm2Q2QO4sJAv7VWPE62Sf93YlqrReC1u6g24JDxr5KnXdp7yiyHJVKvE/zAKU
	c6anWWM6+oT54MXRXQ34q3H6SEnO01ZnWbebyceNGpczdTl9+GQ1d5Emsrgsc6XGAzwk/
X-Gm-Gg: AZuq6aI739o4qVBYsqdyTjvo+o8vY/wD6KmK4cin8irKyHNSr/lQFv/QxCoo7FSCJl7
	bsKEEGp9Nl5e+r0BWiOh4gGtkZMR/gGqXIHVFKmp88FME6oS21UmeIbRgGwcJas9lMXRufb3of0
	23n2O3zX+bQyPqsLsrr3yq0CQ/ItBDNdaGFyEBT7xnBIZnh3Uct0fNl3ChmbO9ynHd2IYYG5kpJ
	N6kLUDEaX7g+dtQJFkwjAitkfFRWgXvDy5kvS+LwfYVC96wg9M0aJXPxv0zAM5KCqB4lLbRtyFb
	cQkEzxE4bCGojdEtPmTBFyNa3PqmST9a9qTZ2OHjTHXFXFHkCWUoKuxddctV769Fsh5uOlvlUSu
	89Ix2EEC1To+tf97lh9DSCCHr
X-Received: by 2002:a05:620a:2699:b0:8c5:3045:854f with SMTP id af79cd13be357-8c70c221f38mr509101385a.30.1769593114624;
        Wed, 28 Jan 2026 01:38:34 -0800 (PST)
X-Received: by 2002:a05:620a:2699:b0:8c5:3045:854f with SMTP id af79cd13be357-8c70c221f38mr509099085a.30.1769593114019;
        Wed, 28 Jan 2026 01:38:34 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfd4sm5506004f8f.25.2026.01.28.01.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:38:33 -0800 (PST)
Date: Wed, 28 Jan 2026 11:38:31 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
Message-ID: <tjw5y2tj7ebjsirqmlheidy6t62rt4k3lw6glbgss3krv6ccld@54y4gryghbeh>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
 <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
 <6lieos5uudkgynizozrmzrj5ov57frzzl65b2fpanwbhbmehot@z5uhyv4ipyet>
 <4632ad3a-c893-449a-b0d1-48d9c93da7e9@oss.qualcomm.com>
 <86dade1c-3ac4-4352-8dc8-e7acaaf21321@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86dade1c-3ac4-4352-8dc8-e7acaaf21321@oss.qualcomm.com>
X-Proofpoint-GUID: ccfsobmb2707urMJ2AM-cypX0yR_QPO9
X-Proofpoint-ORIG-GUID: ccfsobmb2707urMJ2AM-cypX0yR_QPO9
X-Authority-Analysis: v=2.4 cv=N58k1m9B c=1 sm=1 tr=0 ts=6979d91b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nuD9v1B496bkLGN_CiAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA3NyBTYWx0ZWRfXyMXlwleb8HEy
 OjFtSvXqRJa8tyLitt6Vaqf286XMtL42bH8pKJLSZ4DuPd+T3zOTgX0TC4uwRHZv/4f+f0mlFiq
 8BdwhptXsEZdqeLGGnPG3vQmLiYVzk+1JXB7dBLNSaSfsSGZBMrWfZ+qlWeVlyPlOMLyT0g0CO1
 ZsXJmIU5Z05gbQE70K1JOOg6y0LBnLhJ3I0rREmn4R+cy8aB/yZJ1gGxNQkhD4yNxORI2ygRcc7
 dvkjFCWlOhKSRXJiE6SOXaoIsVhVnh3ilNO1ft9v85wHgDrv2OD326jFdb2xoPA9imD/Nkz6Kd5
 S2N8KgUXTuRI7RZq2Ml9XeXX4UZ23dg5onRItNSKDQus1hHLAorYj108QH4on4zRkjB1CPGNMyT
 DwdWUIwVwVfyvftiR4FKYIAG0fzmTj0EI1v4gppZ8qstTm5oD35O0yYw24bS//9X6vpFotxOgs7
 8GEkr5eNdXPO5xd1QVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90929-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A26969EF2E
X-Rspamd-Action: no action

On 26-01-27 14:26:47, Wesley Cheng wrote:
> 
> 
> On 1/27/2026 3:46 AM, Konrad Dybcio wrote:
> > On 1/27/26 12:41 PM, Abel Vesa wrote:
> > > On 26-01-13 14:13:32, Konrad Dybcio wrote:
> > > > On 1/13/26 1:33 PM, Abel Vesa wrote:
> > > > > From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > > > 
> > > > > The Glymur USB system contains 3 USB type C ports, 1 USB multiport
> > > > > controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
> > > > > PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
> > > > > DWC3 based, so describe them as flattened DWC3 QCOM nodes.
> > > > > 
> > > > > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > > > Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > > ---
> > > > 
> > > > [...]
> > > > 
> > > > > +			snps,dis_u2_susphy_quirk;
> > > > > +			snps,dis_enblslpm_quirk;
> > > > > +			snps,dis_u3_susphy_quirk;
> > > > > +			snps,usb2-lpm-disable;
> > > > 
> > > > Other SoCs have a list that's much longer, please consult Wesley if
> > > > this list is enough
> > > 
> > > Checked with Wesley. He confirmed that this trimmed list is fine.
> > > He said he dropped the rest since they are related to the power saving
> > > features like USB2/3 LPM (l1 or u1/u2) and we don't seem need those.
> > 
> > Is that to say that those erratas were fixed in this hardware?
> > 
> > Low-power states of the link are no less than desired is possible..
> > 
> 
> I think it was misunderstood.  We should keep the same quirks as our
> previous targets to enable USB LPM support in certain cases.
> 
> snps,hird-threshold = /bits/ 8 <0x0>;
> snps,usb2-gadget-lpm-disable;
> snps,dis-u1-entry-quirk;
> snps,dis-u2-entry-quirk;
> snps,is-utmi-l1-suspend;
> snps,usb3_lpm_capable;
> snps,has-lpm-erratum;
> tx-fifo-resize;
> snps,dis_u2_susphy_quirk;
> snps,dis_enblslpm_quirk;
> snps,usb2-lpm-disable;
> 
> There are some questionable ones that I'm on the fence though, which we
> should consider removing:
> snps,usb2-lpm-disable
> snps,usb2-gadget-lpm-disable
> 
> USB L1 support is routinely being verified on our devices (in host and
> device modes), so if its power over performance, we should consider removing
> the properties to disable USB L1. (esp since we're defining the HIRD
> threshold as well...)

This should've been sorted out months ago! As part of the initial bring-up or
even the initial submission here:
https://lore.kernel.org/all/20250925-v3_glymur_introduction-v1-23-24b601bbecc0@oss.qualcomm.com/

Anyway, is the following list the one we should use then?

snps,hird-threshold = /bits/ 8 <0x0>;
snps,dis-u1-entry-quirk;
snps,dis-u2-entry-quirk;
snps,is-utmi-l1-suspend;
snps,usb3_lpm_capable;
snps,has-lpm-erratum;
tx-fifo-resize;
snps,dis_u2_susphy_quirk;
snps,dis_enblslpm_quirk;

Lets decide already ...

