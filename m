Return-Path: <linux-arm-msm+bounces-97206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aE4zDBK1smmYOwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:44:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D8D271F49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B05FF30416C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DCA3B27D5;
	Thu, 12 Mar 2026 12:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="peV06Vot";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8M32FgJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AC43A6F13
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773319330; cv=none; b=f2pjt6GBPBGtCRuV+OPYlnfbDdj9SrSCFmKx7EAZZ6t+RLdCSX1gIq6HW+FkEVMsEisqXzdsp6D/naIAXwubptPRmVGjDMJ1O8KsDvwSEdQ4QPN8mmn9X+6tHIMNxMQl7B4sVUo5hjVdQb90JsjeS41ypVUppLAfPexIOfjO9r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773319330; c=relaxed/simple;
	bh=0PQ0/XQ73v/0WqhYsb+N961/91xmQqZgb7S9127C+RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xx5hKrFEscIYGoHiPnas6zxghnn6W+XEA/UV/crsKbCOxgaW5q9x4E6cpt2R+HAmZXPz3SQ/AP2dLE5MpzCWXAvBoSN826yq+4797XzyaeNRsu7+TJveRnMvf9pov2Nh6loYbv6rFb95eWylkiiNfWfg6IXvAk2/8yfqgCC2GhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=peV06Vot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8M32FgJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C7e1WY509757
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dxYbGWS7A2uPAt1u3WZ8zGH8
	nQnJB+uBws4EFBR68HY=; b=peV06VotM2L0IZMJSxFN5DLWvkmiscSfzNL+XaRy
	ciAKk51Cbu8JLm8zZr0g5YB51+U6pfeSYsNpz8K7YJhjTckxRhGqL0jfhsxZaoGs
	1onHkVYtFYeOxSqQRRGU7ixtMS8F4LZHBUj6NqXIat74bWZsY+4aBQPuZ76Penno
	I2tk0UYrEOMtIxUAXZRRrbDD+gBWH7NzTSAjDehlyNPN5V7H6FaPekjE+sj7pRpC
	Cj2ZIw2+B4rTQ5LCttseu9gehKm/qZIbZt0iQUdxFY2K/NGnxB4OjONti9yBlFPP
	WKKaWADziL3fiPjKqcAl1aboMMjzPMbAcw4p++aKAiztmA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w0rem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:42:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81506677so570907385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 05:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773319327; x=1773924127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dxYbGWS7A2uPAt1u3WZ8zGH8nQnJB+uBws4EFBR68HY=;
        b=j8M32FgJouGnd/bEOtHmn06KoCwq7jcsLAEp6zbAi0d7os2a+kFE4r2Hkue5ab4vdx
         jb9bOX8f4S4EqG2UPcrCQ+xD3dGaxcg9+0+xqy9TPLaIYrR8sMHaXgImibPLaZhhSilF
         cnB4gIlPwYqL7nAkDZigVkzOAENTLJzNWGYw88Y3qbdAxBnBSb9bTZKsn/knJiaWEvDG
         QjMAlVsR0u1z7/9rMpoCZWYCmyxEI/JsLjTXvm19GQJj4vw8DcKea22fR78GTChRzrX2
         VtYSYH7Rpwi3dSpPt6vMZMKhX8AAluc+4hERnjmfGy1wh4v+o4LRFf9PC8ERq7XUpXFh
         n5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773319327; x=1773924127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxYbGWS7A2uPAt1u3WZ8zGH8nQnJB+uBws4EFBR68HY=;
        b=rj8iJOrBLIrwOdLqvhm8ozBC0YXrX39s/Uexm/8Fl/hHhjvPXvs776daQhP1brCIz3
         qdVBAOECTaztvkuBJZ7JoNLAxKOLz96fQzo5bXfg/ZmFYbTKXbLrkmI/4c35kpKJ4VlL
         1a47xZZW/sm1xBdS34gkOrTTynJCIUK2rj43YpVisrAKtVkR3ezMmn3JSLnynXMJczmy
         JNFtXviERiBVhPIYR1pqQ4xXR6S1HaZhVIL+lJ94thdC2T5iydzZpJC3fMWib5x/7Qox
         vXPlo5ysUsQtNIBoi0mUB5i72+S6Lk2whNWrTgIpP9S3mqR2A+u/Zn/2ndoqMnA+h6f2
         CGew==
X-Forwarded-Encrypted: i=1; AJvYcCWYHyTxIBiPbYekNejtPjRS4NbuLL2YadDcqKxfv4DRyNTAMWBASdfRoNrweHChSQzdplypAklmyAjVsQsQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Pzx0dfo6lu/N19JNjO08YWiQW3mu9H8/BASxLf7l1fCdrPtF
	rHnlIPoLyBEzJcH20ZT2IxOabZg3KMo43YdoBeODGmQq0zVaT97ps24GziWFTzkG1HYf8QALOGL
	qUtSUC1IGvs2F+tnnEXP5/4QZQ3eI4N03297O8MJ6KebWve86vTzK3ClvsRT0sDD52taQ
X-Gm-Gg: ATEYQzxgOuYpP0uOBU6VvkRe2DJCKA5nxxwblHScQmVTAQtxto2xiS5ru1YZV7QmsmO
	flAFVuXRaYCtWX3TOg2l7BXUuriIQYrCf/hKOrokfp9YKErBxxiE9r1+n7OGD//JPhhkFnYaUeu
	PCPp/yYDO09aOTgGUJMjeHiMWCpt9rMVUCbIxUP12J0WG4Z5XngpzlTjepaGATxkeIFzfpCu68w
	EidTgj9DUpK4psK5QHmtwy/KdgRFNHyK90OODDCMiTzaBxadDV/n0JBHhzabSORHeTsy03/JSb9
	ZARdJhfcTMHN0ViONtqZRWYCyIhKbzcjQammOTYhES5YWK7bD9tt5lag2kIH/6ZZM53e4Ja4tst
	n0atfHEz/loMKaFwOugRmr/DxFZMD7XS0xA==
X-Received: by 2002:a05:620a:2906:b0:8cd:98c1:7640 with SMTP id af79cd13be357-8cda1936d56mr772679685a.8.1773319327179;
        Thu, 12 Mar 2026 05:42:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2906:b0:8cd:98c1:7640 with SMTP id af79cd13be357-8cda1936d56mr772675685a.8.1773319326614;
        Thu, 12 Mar 2026 05:42:06 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a18ddedsm114132685e9.0.2026.03.12.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:41:45 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:41:37 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] pmdomain: qcom: Add support for Eliza SoC
Message-ID: <7jsbcdkszog5gimte2gobdemasp3hkf6dxcag3bbaq2rhkb43v@skyla2nujuz2>
References: <20260302-eliza-pmdomain-v4-0-e61ae2bac805@oss.qualcomm.com>
 <CAPDyKFrvMieutLjHkL_dvfm6X9OpLsuGn_SPp1-FeBO5oe-zhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrvMieutLjHkL_dvfm6X9OpLsuGn_SPp1-FeBO5oe-zhg@mail.gmail.com>
X-Proofpoint-GUID: vhsdcG7Jg2YJMjgLA9CATvBvRdufTN21
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b2b49f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=qLcI9j9LDp0L4sTmIaAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwMCBTYWx0ZWRfX+ZPQLJPIJQYl
 Crvol9/TIW9nOentmY7xQwSBetadY/gTUMbDLPBH3VY86Wg9+3j5iU7ofZLBy+codY73GlhqvZ5
 opfdW5sCzrruBH9iQYRhrXk0uS0nkC5B/XkqWq0tPN+5oyPQo5ZdyPh73ODPa6AGYcQfNeynSwL
 SeMcTa52Pj6BbPPMr5KPsUlLUCMRMEVP5OSZRGSvxEZrAysfBYP4CZfLndWKW1MSDOv/detcBee
 bu4mpuNyGyDLixEwDMvxeALXfXJhntUGNQQfQVZ+QkUmB3GGhKNmKplpHOtN1CWpHeVD4zp87R9
 49eEqSRTjFM/zMkoCiW4/xIcvGYoToaDt7J1boQ818SnNPzYbpG/4mzAySqCjptJMWZ3cqJGcdr
 A0P7lw0TrUxtEC9YcfFtN7dP+ZNSaRBFgosZxDiW0iEV7+PW+Rfxbrj247k8qNE6mvaQ3C7mT1Z
 F/Ikp4NikudUK5mjhLA==
X-Proofpoint-ORIG-GUID: vhsdcG7Jg2YJMjgLA9CATvBvRdufTN21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120100
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
	TAGGED_FROM(0.00)[bounces-97206-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 53D8D271F49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-04 12:25:10, Ulf Hansson wrote:
> On Mon, 2 Mar 2026 at 14:29, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > Document the SoC specific compatible in the devicetree bindings
> > and add the driver support for this SoC.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > Changes in v4:
> > - Dropped the GMXC and NXP2, as suggested by Kornad.
> > - Link to v3: https://patch.msgid.link/20260224-eliza-pmdomain-v3-0-6e13d3aa70a1@oss.qualcomm.com
> >
> > Changes in v3:
> > - Picked up Dmitry's R-b tag for the driver patch.
> > - Re-worded the commit messages with better explanations.
> > - Dropped the MMCX and MXC entries as they are not described
> >   in downstream and not used. Consensus reached off-list.
> > - Link to v2: https://patch.msgid.link/20260223-eliza-pmdomain-v2-0-23fb87eb70ef@oss.qualcomm.com
> >
> > Changes in v2:
> > - Changed the MMCX and MMCX_AO to the PDs with CX parent.
> > - Picked up Krzysztof's R-b tag for the bindings.
> > - Picked up Konrad's and Taniya's R-b tags for the driver patch.
> > - Link to v1: https://patch.msgid.link/20260216-eliza-pmdomain-v1-0-c51260a47d6d@oss.qualcomm.com
> >
> > ---
> > Abel Vesa (2):
> >       dt-bindings: power: qcom,rpmpd: document the Eliza RPMh Power Domains
> >       pmdomain: qcom: rpmhpd: Add Eliza RPMh Power Domains
> >
> >  .../devicetree/bindings/power/qcom,rpmpd.yaml        |  1 +
> >  drivers/pmdomain/qcom/rpmhpd.c                       | 20 ++++++++++++++++++++
> >  2 files changed, 21 insertions(+)
> > ---
> > base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> > change-id: 20260216-eliza-pmdomain-dd10911bd4e4
> >
> > Best regards,
> > --
> > Abel Vesa <abel.vesa@oss.qualcomm.com>
> >
> 
> Applied for next, thanks! Note, the DT patch is available on the
> immutable dt branch too.

Thanks!

> 
> BTW, in regards to the immutable dt branch, is that something that you
> guys are using or should we consider to drop it?

Bjorn ?

