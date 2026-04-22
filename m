Return-Path: <linux-arm-msm+bounces-104146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEwEBlfs6GkdRwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:42:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A74BF4480BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9AB33034903
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D704527603C;
	Wed, 22 Apr 2026 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="om4gPZcj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNJ42zLL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13272344D8D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872454; cv=none; b=jAXtMGaHk9Yblen0d/hZI0NtqqIaCqCoQmEG1cV+2yp2budZIi9+rpXUbKEcgHdTyD9ZlgncL6kq07I3gquH05B7ohR+X9X/vK8oAlla+s9+P/6HxkGP7I4ezBexyp1/8uS4ISjU+EwLOQxQ3ZX/JdCKqmsIlw4AGzKp+y0cfEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872454; c=relaxed/simple;
	bh=gISfBUTrd3rk9lDywwx210g2IehhkT01roF0u5uVCbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDqr5vtNuXOmSuB1rSkj0geNt/Yb27hYS6H8bkcgciSZtRdGH5VXJXwWZGQEVZ/P5EXG4H6yMqxdmXFvtQbJKYv7SvOAsKvhTQCDdMld0RKBretbXufNphNiRPLy+Q0YlizKp15xMey8fSc+T7YAIOGyE6o3YNGMWh3lBHuvLkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=om4gPZcj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNJ42zLL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAf7QA4051154
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hsOwuU5VF89mii546Kyz+61LRVFRAUl5bGi3Mv6LCuk=; b=om4gPZcjbZeOOwSS
	V1DYCEZQGYf9c5yZQ8ro4btSBeNiwFOrpmIDspDkTL+CGtgPa60g05cb/5HrkYHF
	lJK3WAKUWJ4xqe8oUDsoVzpJNB32Bl562NrNZGgfczpO/jtdaJKsH73tGHGeQIYD
	dO+gCvMoFPqhOYUIrNYfigY/giCnOZouzgNRNFinjh9HDNGfyPkchP2zsDN4GFj7
	DpmkHicgco5Rei9Cm8QY4R4kbP/cFLZa9MqEQYzhmhbFOSkM5GDI8yT2dTgFB4Y1
	I94JQpY5+NJ5QoElp3RfAufWK1XRVrzxS6YdlbIyp8JmeCnxEFqu1kT64GxY0Xdl
	PILBCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfm64k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:40:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e5a336b44so38162921cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776872448; x=1777477248; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hsOwuU5VF89mii546Kyz+61LRVFRAUl5bGi3Mv6LCuk=;
        b=XNJ42zLLVZ2yYQA9yZKbKvlfgFbYttQYywnPkjeECZAt0LibOM7ijauxdXPKoRfgAG
         P3JnkV6sqI++I/5nDP2l07ND7vYGrY9xshdb6QFAubjoKxihT/2N2V9Et7T/iOywNFj7
         ZitZxEJyvgd7Xnv94sp9Jzv/9vVN2daPymlLnY3drGW9d33WbDfl5nIDOMBPtVZ4Ok3K
         U3viTbRHkWU1uG46JAJWsgFOdjzEAvmtl4sCNtOGoYLZj7soNgfWn0xyywdoHs3MecBF
         tgl0u4uGg6DfMrCs8sybM79ko803VDtTeRQrclyaZ+XkV/o7eXMs3mRW2Cztfgr8k0bU
         QFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776872448; x=1777477248;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsOwuU5VF89mii546Kyz+61LRVFRAUl5bGi3Mv6LCuk=;
        b=lsdOzAKAK6FmhQS3+Qqkj3uOQTodu/Mhl7q++U0TCgiet4lyvAC4KMP6adlRjjuqih
         DRhw/l3AXvJ7yB/ixUK82WWgePK9Tb/taBku8q9Ee70122Z59ZaaIXlBy7vOUggxkOlo
         NzjeLiJrUQznWARXioPA59IESDIhRdqegmefqy8cCUrk+WtPgvthjgaTEnZxxoMIQD3u
         kpWQORuiWcG3WGkfv2bGl59KGgbdptFDPcjWb+MA9tj/07H/bHUg1kQGeAT+VYtNSG96
         aZWaEjREhLU6zUkaEtGn0ADSyyC4UvDRo76izbwZdIwIL2rEb5NQ+TxzcZvA/dxa/jmd
         aujQ==
X-Forwarded-Encrypted: i=1; AFNElJ9B75BpbFFdkxtT8f7l4AkxJlprp51OgcD0LgdeA95jR+3C7/LmguNfpRmnfGquACLDfU1+scbhZvXQJniM@vger.kernel.org
X-Gm-Message-State: AOJu0YwcxiQAA59xThCusNzTfLwdSem6DlnWatbd3qIbY3a3E4r7AOCc
	U/BBApbcd+yB5BuF5drXmzRzxE210XHdSzhE2KtlofxsKwmx1wIFSulLeBf63mwNUoTR5qL5Xku
	IksqI2V70K+n2Muy4rbWz1hA2SUQiRZh5A59aKnNch8WB/5jpdlcVSuTIxQhNcFNiLdfc
X-Gm-Gg: AeBDieu6/1TtacAlyraMZArO27YnVFabSu4seBPSyUpyp2d5RVEgivPFXSspeTlpOKL
	P6tlbHJdlAq2Or+3ji85uCVg62AivaSfUQLmXbbARMgoS/cIOTmVYiTd77OLcaqr2317NoPg2Om
	huh1lgryJESIGTHNlHb91hLbXlDiWv/r4c+almHDgyJHLXkiD2B2J6X+JqyRDVNempCB8x2RJvf
	H7isqqhy0O6bHIZVtBF4RlwNgN0s7UQOyxATEpXxSotZTEGNcRUjPwvD3UBPhPJB6EWZkC1XkQo
	grVo2WzD4Xrmrnx7DPEZhEu0+lq8uiVrAXXlk0bwUedCaA7s0iG5LFFVKXJ4Cb1hYX29+xvb/od
	haOFk+2Pdv7JWLSKk5O9DYRr2KDv5XgmLwkPILmBVHhJmVvvrjaCxSd+MPzWlhWnPgirjRzRJ9V
	iOM3sBnkMygzwcM9C/KcESkuYrIYChJSRONgZHiUBaEqtjnA==
X-Received: by 2002:a05:622a:6782:b0:50e:5eac:cf7d with SMTP id d75a77b69052e-50e5eace505mr3977581cf.25.1776872447902;
        Wed, 22 Apr 2026 08:40:47 -0700 (PDT)
X-Received: by 2002:a05:622a:6782:b0:50e:5eac:cf7d with SMTP id d75a77b69052e-50e5eace505mr3976581cf.25.1776872446447;
        Wed, 22 Apr 2026 08:40:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad11fsm4473453e87.14.2026.04.22.08.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:40:45 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:40:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming
 on Glymur
Message-ID: <losxljshogx6zhqdbyhgqq7oagonbvnqf5shrkv7hvy67o4724@oq5n7fg5bbxq>
References: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
 <CAO9ioeXT0jxu875jBsAbOVrDqonASWSmmxJbP0AiitXb-gUANQ@mail.gmail.com>
 <a967d7ec-66f7-4eaa-91e3-0a96e5a8ec7f@oss.qualcomm.com>
 <b21b1f73-881a-40bd-aef6-5c34aed0e266@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b21b1f73-881a-40bd-aef6-5c34aed0e266@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1MSBTYWx0ZWRfX9kT3xQoPbeW+
 d42+TRhweQqTeFUD3SGJhvNWFRfrH5NG72hqKlhmuOZA84fPiS/s2vH5sDunRZ1oAYzZH3RQdgc
 xzEJ1xv3EPorhUUgIS/JYnpO3S/NNv+gz5rX6Xr2xS1kMRA96qPAtlmoMcQdVIaXQV5rPNDfaxK
 s3EQljuCdnz3C4aRt2hAg61/2OtNMbRgaQEaBFu7yQxtoHQej6G23bGuGSFDi8HsoUy6I4ujV4S
 rkh9yXzaFz5uRRXXXPy5bptvdRWs1nNL3uvHYBVj209eTfw1m1ldKw69icJTZEtzhgSPmJnsgfh
 phVmXEudWAkqHpXnUCp6y9XDN6ACzN2dyU8FIK1Pfv+iAJmhwtT0bBaizEk/h7gvhU3SO/oGHxb
 3QyT4lQl2olsf515Fq4QIEL84UKfEQUJX9n3Fn7wGNKO+o18Jhwg55M78Xys08ldhIMsART/g+r
 jtYYjbMRk9pLZ+6NMkg==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e8ec01 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_2zAH8VQ4YyU6FB8qREA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: fxrWVfW_zittTfFFJf75LRHWFWlkIDce
X-Proofpoint-ORIG-GUID: fxrWVfW_zittTfFFJf75LRHWFWlkIDce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220151
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104146-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A74BF4480BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 11:54:30AM +0200, Konrad Dybcio wrote:
> On 4/20/26 4:18 PM, Mahadevan P wrote:
> > 
> > 
> > On 4/19/2026 6:48 PM, Dmitry Baryshkov wrote:
> >> On Sun, 19 Apr 2026 at 13:16, Mahadevan P <mahadevan.p@oss.qualcomm.com> wrote:
> >>>
> >>> The existing DP PHY PLL and AUX configuration for the Glymur platform
> >>> does not fully follow the Hardware Programming Guide requirements for
> >>> DP over Type-C, which results in DP link bring-up failures.
> >>>
> >>> Update the DP PHY programming sequence and PLL-related register
> >>> settings to align with the latest HPG recommendations. With this
> >>> change, DP link training completes successfully on Glymur-based
> >>> platforms.
> >>>
> >>> Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
> >>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> >>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> >>> ---
> 
> [...]
> 
> >>> +       writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> >>> +
> >>> +       writel(0x5c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
> >>
> >> Are you saying that we don't need to write 0x4c here in case of the
> >> reverse mode? Was that changed and why?
> > Yes for glymur it is changed
> > DP2_PHY_DP_PHY_PD_CTL
> > Normal Orientation: 0x7D for 4lane; 0x75 for 1Lane or 2Lanne
> > Flip Orientation: 0x7D for 4Lane; 0x6D for 1Lane or 2Lane
> 
> 
> Dmitry asked about the other register - DP_PHY_MODE.
> 
> I checked the reg description, and at least for Glymur, BIT(5)
> (the difference between 0x4c and 0x5c) says "take bit 4 into
> consideration, otherwise let the HW decide". I wonder if we need
> to set it at all, for any target.

I think it depends on the orientation GPIO being correctly wired from
PMIC to the device. I don't remember why, but it's easier to use the
software switch instead.

> 
> Konrad

-- 
With best wishes
Dmitry

