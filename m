Return-Path: <linux-arm-msm+bounces-116028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0D+ADABgRmpESAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:56:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA4E6F7FCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:56:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ik5rPaGx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TRh4rzUf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116028-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116028-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0799731A4967
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB09948BD43;
	Thu,  2 Jul 2026 12:44:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F28B48B375
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:44:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996267; cv=none; b=Pc3x94XqfGCP4q4b9UYR7wGnz2BdaBPlVPMx9xtQDB+NSFuHWITN2eLgtMePKAqNmR46P4c1Yj9YNpHZ4PqqVYROVK2dbONBxExE1J9n+fv+NEkBhltbqy0eNOQZOQS6gug9KKPv5X3R+cvG0S1nUaPZi1q2LyJ57sIhAcTYIiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996267; c=relaxed/simple;
	bh=rlKrTAZN3gpbDf7g0AnbOsJNgR1UGf5weUdB3qLKjO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgLuljGejl53ccjtFq+pL5+HpKg15q9X7U2zDMiELjUz4BLrAjO3twmvV8eN/onN6XBaWN5Z1Q6mRn+ksnN5D3Qpnq4P3rHp76AeRrqWyDfOjoo6MjE7+tJMnanugP7ttO/MsIUwhivM5Y8Yg2Nrw9NOseDGRrzYTnPyvNBRz1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ik5rPaGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRh4rzUf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6627Tt6G3964266
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OBKHpcdbns8eW5+iCQrliCYP
	VrE+t6hY73SlslwPEzo=; b=Ik5rPaGxSMMCXOuzDZ0p4al1RV8uUchNqWHFSPlu
	8+UQNrgBhyPAeIjDY8Mt99SoR9eZgxnG/UDRf3dNNRZJ1LSm7SDwJ2RHlH94fW3Q
	v/ydYWJA7UAK6NdVX9ztqInx0L2M65vC3S24gJy/9+6tjyuIlgWYtCUDq0FkcGe/
	znAAUKFZkbbvSgszjbREY7OX+ki+usyw0pa/bExCCVIndmZhpxq05BqhULNYT3ZM
	VfuXKI0WvAuqK8Qg1OdAZhtOG7+ZZ+K93Uh1/XFw+L+J1g90ssoTu9L1nMu7pQYF
	3fRPIRZXVrUrgilHP2HCA0QLrpC2+CrTbxUpTJ1X+IYFwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc17kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:44:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f6ff639aso292300785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782996264; x=1783601064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OBKHpcdbns8eW5+iCQrliCYPVrE+t6hY73SlslwPEzo=;
        b=TRh4rzUf0Dko1GmlQjOM7hKRpd2abEbPbzzWxDbceDO1SSKvhtg94SV1Dg0LvTxXlw
         zO08F9zAAWfdVs2CZATAgyrQdRa1UkFmMqCHuVKjVXtHWrcI4O4ho6nYSnDsGueTg0Lj
         e4qtlnLUOtguGNLgLHI+GlptDMAd7+zNhGVC8Ssec6oqnMOCvFAmvysBWtsYeLpjsG3q
         EdWFskUmTOVaxnYBoY86suMskwSx1iXsNBz19pRSA3jua9QJnNmWQbOFybF7nvv2gUG9
         fi6Td3GzuBYpwry7ofa1Tl+oGpgdKE7P+UfdraGyKRypXQT2UJ5TI8kn+wrKzqum0s6M
         URAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782996264; x=1783601064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBKHpcdbns8eW5+iCQrliCYPVrE+t6hY73SlslwPEzo=;
        b=WWscVozoOzpUE7UZAFtWZMp1Z/azm28zKllAWHc/ChLo2/mPeRqTSZL1yTpdEgiwxJ
         huKskvl8k14wZvJV//RZrSLCQmK17fpF7hW3A1RCdfvnkjrZ0urvT5yC4dFxbIHYnVeK
         XaG2I7DV6Di3do1TDuXvyVoyYzUMwdI8cghim/2TV21KNSlb9MJFioIz2uokIG3Z5dFh
         MzQSXLuy11Zm4d3wWyGSdsCbEzxINNZrBet8RykxOI8yzM97o7dCDjx0VhHrvyE3aFde
         AY3ybLNO3QP/znSroa3GsKiQ5v9I/XVKzRO+knr6Prf/qQmRGRRW9YQ/dBm3LwFfq4eW
         C4Qg==
X-Forwarded-Encrypted: i=1; AFNElJ8uzS3fw5LQ764QOs+AE6BN3c6H9fMPiuCwGg2eXBWhfq1h7SCo2nOHLOScflGSyydGqzchxzk17ummE+e+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2NL739bqafTp3/ceF1ckyIEaPlR8IXGg99Dh4xRJswrR1jH50
	yHUAnza7SdaV0uKhk595S5yvjZL6jB+V6r6ru8oY0N2YuNJPu/N5RYG+L29uQ94cUASvgQQ6ZX7
	hd+Mf0gQKIJo8YWn8dJdx/7156Yv4Dg8mPLepBXIeNnKjWevrg72E3W1F5n8eLs6DJYKh
X-Gm-Gg: AfdE7cngB0H0MhCGbxqcxyYUjBVpJMSPkGDKMPowIckcJ3nP+pOK8L6AxirrGwo0bPT
	gop+RU1NfZvwb51jv9QfUglCNTQ6M1DHoNBsX6UmuXphFDhHpP75LdZmTJ5e2baFZsjSpjWWZxr
	Yp5l5RGNc4DvZt44xRIct929p19KKXwvTEeS1lfnb10LpxRXlH5kw7H5PlAHRJ41n/v43/kn68o
	y0cVhY5H9jbJr1xVx2bfp9XWgSQoZ9XDg8ly4UTtZzqgN3R+4Ssjt/o9009M18k14kMSk3NQeIf
	kPsr3Tm9QEnVfUbUvX8r376UYVJErxemlGAKwE8gfMiSAWLp6I82K19cqJXIygtn1LhKvcM2Hsm
	gbp4y2g8AfAMIYbsrucv6z8MNV8QDnZoLHURTOoWfEw6+vhbjdIPBTABQw6pCGGKyW9CWM2bxUJ
	LrxeSjOAWs2W+kCS4eo2K0ty7U
X-Received: by 2002:a05:620a:a217:b0:92e:7d1f:d3aa with SMTP id af79cd13be357-92e7d1fe420mr488517385a.31.1782996264339;
        Thu, 02 Jul 2026 05:44:24 -0700 (PDT)
X-Received: by 2002:a05:620a:a217:b0:92e:7d1f:d3aa with SMTP id af79cd13be357-92e7d1fe420mr488513485a.31.1782996263809;
        Thu, 02 Jul 2026 05:44:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89dc2cbsm666470e87.64.2026.07.02.05.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:44:21 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:44:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Message-ID: <pref7j3djctb4pnvmsxvnduaw3o7vtwmekq6kbgfokwjtavt7l@cbsjzpivu7sd>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
 <20260702094056.3755467-5-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702094056.3755467-5-mchunara@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DfaXxRNbOFT2DodShrDmFBZVCBsKzfzG
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a465d29 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=FZAofsGHiTNuLk9495wA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfXwhYaeovORRAn
 beOtvfw0ko4A4gd/wTsffBd0oVvf1TVjyZRLGUSZEnBf1uK2cx8IyK55wOMlR45LeSJb/ntPhwI
 8tDtVtnLldqa5hlrL1fH7MXnOECQRfuyJOtOke0Sh2x1oPT3Ty4buSyB5RGv8mu6mepVLNRNGti
 XFBCng9pxaGsAQrvQw91AtrezkzQgVIr8qgUGqhjnAT5WkragtkSm4U5axNxVKrCmKIjs41Es7d
 NluzWxtxCo5sqeCIi3bTWRVw+5+WJKytFxoMOhaCAMdvpshaYrfQWKTvZQQ31UY0uB2UMyk7RMh
 sV58NY7bt3tgCr+KzYJlk7Rkz8C9eazJNLhOe2LPkEJc2Ek/MgC1kxZZwXWne24xBqc8p7kQMPP
 YsdIxPza3Ri/LBGe33JcHCBXy3Ue37fPPlHJ4BBokylUepKv2o5lz2y9AfWLAWsGGhXNPu8A3WE
 nZHeXQQqF2JxPq/nceQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX9EEQZ7aPVCBN
 HmUDicEVfHqh2U0vRU0pPh6AVg/MTBChcbWKlptw6r/CkvWW6nti4oWhIT7iKi9b3embz+mGVj8
 3XUtpdCzTDIzl/d72KrsobG59we0zZ0=
X-Proofpoint-GUID: DfaXxRNbOFT2DodShrDmFBZVCBsKzfzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116028-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FA4E6F7FCF

On Thu, Jul 02, 2026 at 03:10:56PM +0530, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
> regulators and gpio-based card detection for the platform.
> 
> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

