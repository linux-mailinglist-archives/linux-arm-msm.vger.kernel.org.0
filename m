Return-Path: <linux-arm-msm+bounces-92317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD09OvPsiWlpEQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:19:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EA95C11029A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 991523007B23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 14:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28B137A4B5;
	Mon,  9 Feb 2026 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/LhlzOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NG2csGLh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E86D37A496
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770646757; cv=none; b=j5jWk/8NMZqVaUYvLhPMlBd5trTZFhmhuvJUyhyJW1nfxDv9maqWoixIVysFhe6sZJZhvy/1YpxuJjMbtASWBJZ4zsokqqCfpG803R4n4fQIUrJI3+MlWbbchf8do8ZH662KxbAm3981p2UtzjYiv4Be1rR8U3NjKmHglFVygdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770646757; c=relaxed/simple;
	bh=XPFh2Ag6zGvydfz6L+Jnbh0+i9223oPt+WWIVKrcYuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6SsAih2Gl/BjdGKWTDvXIR6yBthVGN/c2iqBCim2XwR3B6036m59R5hBFeYiQziNBDLavydjup++dR4hiNKCa0a3Owkpsgv93mCflsbhkjzldHiggrcgfpnuZ+x/WmtfL5l7Q2A1hsAsM94s8Z0xgnVzF7k6A1grw1Kb72jqbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/LhlzOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NG2csGLh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619CGp813436712
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 14:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSdinS9MZhMRJxcN/p73x4tRi/m7WMlrBa4rka5jvPI=; b=m/LhlzOxPqDpIT64
	otHdn9gI5sAeZGIItb9/EtTar5KIFaUFrd7Bb17RQu0VJ8/rO9+aRPfcHemTNiij
	nO9tNCZii9iZsmM3SMup/L6+sAdKK2aCFNOOTJIDnLWoIAFnoq9JU5ScNfF41mZy
	Gzgh/3GYk1VYJLJLjEjYkMfr1tzK34WXsfuPifPinNGf7Zdcn1PJesUCXvhh8miP
	rzzJPa5MDuKF50JPDOpEd+HbxWOwo1LOAv2bSx67WL/wgaktgHk4YklvxWb3pLr6
	ZmNnm/7g8K/8bMv09PyfN4whJRRrpkWedUZCCAjMVE3Ct7j7DQTkFklIV2pbQL44
	DaPo2g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7fev8ce8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 14:19:16 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-948b988578fso16553404241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 06:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770646755; x=1771251555; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NSdinS9MZhMRJxcN/p73x4tRi/m7WMlrBa4rka5jvPI=;
        b=NG2csGLhLce9QCkpFZl/eBT7mt24eePe1dZOD+gX6nIpYDHpalqqfUfmySvRN5YVIA
         9gIUgPJWBoikae7XnIaII+plm9nS+TYhFYYGN7Ns/zhg2nNN/E5X5+Q3Io6aZFJV63CH
         oCjP1EcPjSIl4o0wWtW4bDpSu5P3FBb+Av7WAiGnqNzu5mkFCsZRafyorHGUwJagdcAu
         wuvrWAth6t3RflPfnW713JHPo+koeB6lAbAZ8ih4uPqQ91KUXJaC9ZEk4wtZFw5It73K
         Qcwdf++8Cx1P62op1tQjPMlkA+dQY66ypVe58RH+e35ue9bjIoxhGY0uTheB/ihfsXzr
         Sgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770646755; x=1771251555;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSdinS9MZhMRJxcN/p73x4tRi/m7WMlrBa4rka5jvPI=;
        b=bKTrVVP7fUjDIvCj+lSOfxkmukpf3Q3Zu7V4x5KMivQYS+1ipo5hXhY24nb+ZL1RCf
         3cKb4OzF33NBX1+14nCJUFOupQveULs9ikS4A0csHrMo0VsKnhdpHmuIAZ5+E6Ld5mcx
         oPIlQ5pcKgBi9Rzs+uen/gKjL87orhtqMZAHpA1sg7oz0gYYODIKZaHsS3rgh+Emt9KM
         pG0uDUYtJoRmG2PryoQDQfoX84VNUPLdKJkaX/ud0+hu+cn0p7SamYwGkoWJuQeuhU7F
         pOThTF8GfXcXxicVJrq8kOdJLHNv5zpRQSuR/pKa4j/vOSkPgR2kn1aN2ABpwUBC8aFR
         On/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/NqFeW6ErTaR4Iv9gx3PFru0twwTk47cZ4QjwWMrBPUw53JWlA5e3w5nNE1O2LO1yCqfb9kuYHdDPf3er@vger.kernel.org
X-Gm-Message-State: AOJu0YzLaKE4puzHZFLQ2KxcrtRATu6KhvPpbRcNSqZUkuweb53KB/pQ
	yG+U63R848rx3Cc+D4o/CPvn95TRc5lgc8wc+iujysjUv+42fJ0e0o4yjQcoawgg7aV5A5O/aiL
	wi9wJ6Qjc4gG5H36Iwe3RS9HTQwdfJ4nfVm6bqVt5wKYuB1eL51fR5U3M11ykhi7ZNkLz
X-Gm-Gg: AZuq6aL6hdk70llkMjg4WY+eCix3VDen5f/KR5L6BZ9aA0emMoihgjVPdMIhrktb4nC
	dbEgTleaRkJoLocj/I43x+z1JQWj4H4eYs90ubOYix15wDBFP6p9Hsqrk67o8O3eYfBu81WNxuI
	y7XnS+YOxaKc1dqRHQA1qDLT4RQ3npLy5yZsUbwq0y9AImtkSYM9IAOFyl+XVYPBFi2SHFhHJPc
	zeE2TL6yBogojXgGQM+tqrRt0YS1/B9OvkybMoEIL4OOyeA+I792ZlBMbV5GerQhsjp4D+fr2+3
	gtatdHgNF4nTlRaYL9by1X9K6PIPVhXknx2Jqjkj5dgrHqgaIKD+BAeOmUCn/8E7SjmLIIlzNuC
	NWcam0pgVYsa2BDaPMFmDIt7FJdgMPwdaMKgbUEgDbQWrSfjY+q8Dx3UYUmjUJLWoPID91CE7pf
	47vKu6+WrMouZXTNALumYY0Jk=
X-Received: by 2002:a05:6102:290d:b0:5f5:487c:83c6 with SMTP id ada2fe7eead31-5fae8c4a87dmr3666982137.32.1770646755481;
        Mon, 09 Feb 2026 06:19:15 -0800 (PST)
X-Received: by 2002:a05:6102:290d:b0:5f5:487c:83c6 with SMTP id ada2fe7eead31-5fae8c4a87dmr3666972137.32.1770646755092;
        Mon, 09 Feb 2026 06:19:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf713fsm2668816e87.1.2026.02.09.06.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:19:14 -0800 (PST)
Date: Mon, 9 Feb 2026 16:19:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] soc: qcom: pd-mapper: Add support for QCS8300
Message-ID: <pfciamz5tzaacc7bzxy2rbtsa56smjlgi5nfb6ch4o64slyjbr@k2uyahxugjyq>
References: <20260209112947.930853-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260209112947.930853-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <onubc2qpbazy4kge5ynedl4imihcrj3btlo5aqvmxubk23t2hm@rasbihmw56gi>
 <3406d478-50fc-45a5-be06-713a9151e0d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3406d478-50fc-45a5-be06-713a9151e0d0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PrplBJHvi0_7XXtg7CnbsS2vYIHaAPOk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExOSBTYWx0ZWRfX9mohw42mcGRy
 juwzi6kEpOz9tXQ86ZLN7MXWF2PZvfnIUQF4mCElp/HSnMWecGE2yhf5N4RD5O94T80v3Mmm7+9
 vt9smgmG1Gx/EwQYOmmPtS//skIapvYrz+q20Gl2woghPL1rQhFuAkoCMNmHEQDYiKfDHx6zSBJ
 rkDYZYM0/bznrl9lvjRet0/W8lcs1JFW8EXYGQFOOcrJ1m4JDayt8L0amnz4NqFIhAd3C0tvrUN
 qrQoOrYBsyy7LUMIztXbzF5vKWl2P46bSik3kTXmsmH+GAgIIQIH5t2izep7XkRCG+geOw3p+G3
 plZOJxSliJQu3mXzETy3QYVqaP4GjjYqvmfW3xfDmJ2bP4OM0+4l9GStQUZn77A5H01JPui1RNd
 5QZrJEEiyus3ucJN1n9sBC6WG4y1PPkeAiFE4Tf2IhazEXJBD2xh76GT2YkE/7dsuRwbsYYIlE5
 249hmKPsll5BSuvWlQg==
X-Authority-Analysis: v=2.4 cv=F6Rat6hN c=1 sm=1 tr=0 ts=6989ece4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=GgJlbXbcN4LysEiu4KcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: PrplBJHvi0_7XXtg7CnbsS2vYIHaAPOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92317-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA95C11029A
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 06:49:26PM +0530, Mohammad Rafi Shaik wrote:
> 
> 
> On 2/9/2026 6:11 PM, Dmitry Baryshkov wrote:
> > On Mon, Feb 09, 2026 at 04:59:47PM +0530, Mohammad Rafi Shaik wrote:
> > > Add support for the Qualcomm QCS8300 SoC to the protection
> > > domain mapper. QCS8300 share the same protection domain
> > > configuration as SC8280XP, except charger_pd.
> > > 
> > > Add an entry to the kernel, to avoid the need for userspace to
> > > provide this service.
> > > 
> > > Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > > ---
> > >   drivers/soc/qcom/qcom_pd_mapper.c | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> > > index 8b899ec7f..32538e659 100644
> > > --- a/drivers/soc/qcom/qcom_pd_mapper.c
> > > +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> > > @@ -413,6 +413,13 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
> > >   	NULL,
> > >   };
> > > +static const struct qcom_pdm_domain_data *qcs8300_domains[] = {
> > > +	&adsp_audio_pd,
> > > +	&adsp_root_pd,
> > > +	&cdsp_root_pd,
> > 
> > No PD for GPDSP?
> > 
> 
> yes, There is no PD available for GPDSP in the Monaco linux‑firmware.

Why? What is the differece from GPDSP on Lemans?

-- 
With best wishes
Dmitry

