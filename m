Return-Path: <linux-arm-msm+bounces-100361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPT6GX+jxmnrMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:34:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D642D346D08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1244E3099687
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975A6332913;
	Fri, 27 Mar 2026 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppcDKH2F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpYsQAyM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E3322B72
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625287; cv=none; b=IildEBTgyCyRQ9J3fQIe6wVxuVuvHAtNgZhMhQxoNwbxt4+SFneCBGHoBytX4Is5+JCwApZPz2gtQ+Cm7dYu2KM2ep27g7wQaHqffKANsMx8A5sCoJaAYOqK+PHBlS6qkl2oHS/MKna8+VMcrWacV8M5uirmcroykS5j+pMNSMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625287; c=relaxed/simple;
	bh=of9T21fRZVkOWoQoDd05G2q4zDxLbmQAgk1S8SBDqgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2/cY8nsQzmKfjpXeSaCNX3fGlEyNwCyGNYERfyqRUuiLA889yYEfib+ZuDlsAUpDuuHVaJZPb/G9sGND5SNjXlQ/diOGUQR5mYMXdNVjGhM9GeiJ7YIe+Y/3q+y2qwLAgr1VDkCJojJW+rVxHlaM0MJdoDwka0xwodA8D2gp+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppcDKH2F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpYsQAyM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhHwW881604
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rl9NioBh97mpHdlYqyHknnjK
	G32/1QeD4He/706pcPc=; b=ppcDKH2F7Gqm+Ky+KADF5mz9pUo5rWXF0jfWFFqL
	Vbq3aHAImReMsYmhS/E9inVwYUiQjcr82cVWPVQ3LSG+qT/OYL1fSaROcpD0wYol
	rqhbYBhewEUasTOax2vvFp38Olz+ajC6dsOcIcO+lW60yUxdUg5Jayn92rg2Xxs2
	+YuefdmdDzebRZtVqdfaFI3qikl1cAz32WEEByx28AxxYsVMJmlflJBVfz603p5A
	+gEsieYNQyW5W6Xk5HzRQGphN98y2ulSH2GINtlaxdk2/WIdAoCWB+gONBEkBPvj
	cXNKoPXomuc2Go/XadzP68dnzuVXZnmxR5WFIHZyGm0akQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6kbrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:28:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso31115331cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774625284; x=1775230084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rl9NioBh97mpHdlYqyHknnjKG32/1QeD4He/706pcPc=;
        b=gpYsQAyMKVroRf19cStoSLSdR/0sUcLE7JV/agdmiMv/OX1uHBX/1VVq5OVrahOsBG
         Ew7JxNnL6aDd2buEygxAw80AWRuDMwh0xnRymx8ijWxnaq34jWqhjLNgX7CH9x/acFYN
         DIIcsmnbVncsZsq5BWutgE0i7+pP1Wx2BquYl/TKsE5U8sE44cvd09BUsBfis9Fwz3Gk
         H3q5xdPacQGPMKpBV2ocXm3p6Yr4BI1ECZ6OfOF1W1yaQBKFFvx7AdsornRDzue3t97i
         k90eZO5yLeNRtbDWxeAIcEKSZ3AEtOwD1SfV7gLapbACZ57mbR3CfmBTEqnqZFiXdtgo
         /Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625284; x=1775230084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl9NioBh97mpHdlYqyHknnjKG32/1QeD4He/706pcPc=;
        b=IdfWZpo+Om9GPW7k2JxkalsuYg2OBCYmq3Nd1nx7osWQc6SJibBqKtPNTmHMb0d9CG
         DA1Xn3kRskoaZjv2d2ru5X2WMxOjMaFWbf8rwO51yypOfPAj3UmMTsPkHI6S3VIOhf74
         h4p619F/43RzEJuvrWMdUvRPpoco9dOhRK+GQDOFhZXtSqbs7E1BtCeYaCqdb77bqYAE
         71gtk/ZEZ3SUzqBAOxg81EKSxVD5b40wibwdpVeqPHwqId2H1Z7EPx/xV2wEFZSkbBWL
         GzEq8c/KGKD0bPVF8cCBNoHevef8bVh3DdFtSy4ZpEaHV4TIOdBQVQVK29JMdvrokO0e
         VaQA==
X-Forwarded-Encrypted: i=1; AJvYcCUjTlrpUwNiEBWq4TsL1Wl0CERy/ADXRRAzat82y2D7Dbo0+EiZbo0Vjb02DzJBqxvwmRBaK0wGgQRRU9GT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7hmU+82mnkEtEFGePv1iomPig+QSe/dFJ0A1imxB+mQXNLdY7
	dGWyKLRd2RKZHZgwaV7JYX9UIxKYQqUOmu3N9vpSZhZ5wtZ2Hi/lv09GsxMWkzi6yPncqhpp5ID
	RG11yklibOPvWcLvWjT8vNG2sEJnNXReB5Qp7THTcQSqRJVq4/Eu+Gk0RqbQTazKAb5oUvgzEs8
	9h
X-Gm-Gg: ATEYQzzjLJhsKBPUhrp30fYZkxlTBbidn6p4uau39Hybj91rka5Le1cUDejAnkhLhoP
	UhIAMtub2l+KqlretIWClRmT3BaHs3L4ljokB79UQ6h009LmdnjA6WBCxpZsLYaSy6E2t1heNXt
	Ny3V0V5tpk6HjFE9Nu1PUqvtLJdsJE0xfgK4z003+l8EottPgh0CQSDUvyOz60Ef3JALfngJFwY
	N7NQfoGV13tWLDuJi/+vbk53L8lBiiuJrgSSBImz8jqVqUYQbReMZ+Q+FiNRE3pYez2bu7bgV3j
	/gwLzPpHT1FVx3+NuSed8ZoJlvSlYZGYkMBkCGk26X2jxS1EOePP3KK74DvWj5jknIUluarFgWi
	O8ybsdjAE3Qee3pZ7rBf5BifggLsqb0i20A==
X-Received: by 2002:ac8:5744:0:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50ba3836e2dmr42094941cf.18.1774625284274;
        Fri, 27 Mar 2026 08:28:04 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50ba3836e2dmr42094071cf.18.1774625283511;
        Fri, 27 Mar 2026 08:28:03 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727189cd1sm17513285e9.29.2026.03.27.08.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:28:02 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:28:01 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add thermal sensors
Message-ID: <opfy3ekoo5phtdnf67k2usspi4vhb27wzrxpjkqzdovjbnirjx@qyym3retvffj>
References: <20260327101225.382493-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327101225.382493-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6a205 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=imO6bpS-6So6pA60xL8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: sE5VCABcBLcFVKOhiEN2M_KSRMviIYem
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX8VvFpVTdtZYm
 diQLDZsFtNq5qnX771KFPIyUXKD1mjdrb/0vHe1fTDSV54UYvvZRpaOaGTLuY09uIsBjKJSSKak
 fj+XHCAod4nl81kCttFkvnWALntnK+Nk+/EwtVl7f9076PBmTdfZ4p7mJf43iZSF4uzluIAYhlh
 +/P8JqVFaE4QVC+UyvmIGEsfzOmyM8LODQNo/GJNBsIHJ9kLhW/61p+MwTlpL/8tyDeCiXhWRzO
 Wu2m1xAmWf5E38pyIdcxakqrzpNd4uohbMp/roc2HGD7xGCdnDurrj8RoLVhlKY38ZKNieD5h6W
 tBL6L2tey0L+6dWo1if7pIeyUAA1Pzfzu6KCn3Ap6fy0U9i5TcDYB30gKoJfg22oPBrjjteyjUu
 YrUfToSGauC+rzm548ROGf02j81n4WDsuDv7H71naG1fWNRpm4ylLcRC/aYcYoO0JJCqkYdK7Kj
 nTS5aAXLAyxZVMjH76g==
X-Proofpoint-ORIG-GUID: sE5VCABcBLcFVKOhiEN2M_KSRMviIYem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100361-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D642D346D08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-27 11:12:26, Krzysztof Kozlowski wrote:
> Add TSENS thermal sensors to Qualcomm Eliza SoC among with thermal
> zones.  The TSENS is compatible with previous generations.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

