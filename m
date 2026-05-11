Return-Path: <linux-arm-msm+bounces-106988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFdBDSgNAmoSngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:08:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 304FB51315C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A792D314A1E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC86C43D4E0;
	Mon, 11 May 2026 16:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZT2af0rW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4Rp7YOn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A743C074
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518318; cv=none; b=MpvyLpNiIPe9sdCaJONPhprq0VNuipiE4NFZo0WHBfjTFbLPhyhqeOa/CakHwnHxrvDV2Aa/r2lSfkblLkPnejwcIHd3wvn9pWhZASN9fA/HV1Ip/8RsPw6PkA6vBivlJDRGkwyaArQqzcT4cAdFngEwMqTIDyE/CRaB+mu4iV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518318; c=relaxed/simple;
	bh=l5km0omBz+PU2uQln+PYGPhd2uNtw8IyzbYdICQxO4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcIs+xUDETGkHaOnTeTXghzOHqiFzmPaiHXm3nByvpjGbvBfjrQii8583xwsw82a2k8wQSidGHeswFAChr43OcW1zhde/DAEtgib/u1r5s+GPd90e3+HhowqHKM4g/SsvDBpp/D+dcHNcBdaf7fRyt7GE6YogRn0yB0+F8mH17U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZT2af0rW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4Rp7YOn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BD5CT91258479
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A4bylOWpFQSI1VTsJy4jyU4S
	AXUBAaF1g5Vevo7vFR4=; b=ZT2af0rWbcKl6qok2KzB9/KtnhvuEpNdfzYlfavw
	FdH20/gFnJ2huQS0CoEp1Hz7ZD2+/qXAZK9p0WFylleMyks1gXl9C2czoc821odT
	u3h5UZDtl6wp3fxyXgXYS5M25xBUFze3D+Dz3aKP9f+wZ8RATJ8Qd5KoPqETGE9F
	U3X60cEOHRN76VfQnTFeiGHXD2omgp9J9AIt/1ORSIjcg6krnycmbvRFG4nmtoYX
	G6E/80U0nrwyhGNOSZ/3NdHDn2uAOGyCEED9/fbCmkzsJK0bdndDawx2eF4jxp+X
	OkEXS8qu7Us8Q4jEYTSsrVQSuYqD3sWywv0xfTX0St5Tnw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag229vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:51:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c827adbf00cso942260a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778518315; x=1779123115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A4bylOWpFQSI1VTsJy4jyU4SAXUBAaF1g5Vevo7vFR4=;
        b=h4Rp7YOniF+wEuPIOxW7s/sQqkn+jmNmDffn3/dSrGZH8uSRslg+ve8V27QwbBuCh3
         lj96bsmKv4S08fPFQ7cC4FKVCuaiIW9qcjiFSZWPS/1NAUjxV3j20xe2ENtzj70PcLxU
         1NqpcJKoFi8x7WSlXrwe6nf0hcUww1ZwizpZVbQnhZ1fXDiPk9ddWPbONy65ZUIjCF69
         Ue0ls6Wp1/uSunSJQtTeNFK/VAC+sQMbOpAs5Bp77M9RCmZsRmgPW3ZzEhvpQL3pUcpc
         KWuVaMxssr3nzWspHu/fFYNr5I3ySbA/PtRjrpwafdjtsly3sJ0eowDK0be7Uzdmi4OE
         BRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518315; x=1779123115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4bylOWpFQSI1VTsJy4jyU4SAXUBAaF1g5Vevo7vFR4=;
        b=diEnPU2j+ikO1XtEsD3NTtwFJW8dqiKGy3kXlcgkt36Haemu79Es6C+qrDVovTAK9K
         fHhr82lTE/iUaqlOJud/iMT4MRmxohxNhwmnx3PUyXIWrqFQU/ARg+NE9AAoqPe3yx58
         nVmp5xIxLicKp80RS1UZ+BMvMmmgJjjWeobp4EsOf2jiJN0w7btwW4K7OjgqUP55/Fav
         Jw9Yv4C6kQrfxLa86GvdndfKs/W5qSYYXf4LdcvTFvGKWRMxQZEliod96iN+TUlsvtCr
         0JzMXMFDksNBvdoZtZXddd9exgvimwRKBU9kPOyESJKxUV7zDYTXy55ffvlxwFWEYVE1
         6uWg==
X-Forwarded-Encrypted: i=1; AFNElJ9dmqlJihRtRH6Tq3scIkVMaM/Mq2osYAK1slWAcsh/ph0IQh5CWw967ZzNmwCBjMCHNt5XlGF/EntAuQwl@vger.kernel.org
X-Gm-Message-State: AOJu0YwbHd6hWAs+PlkrnrpxjOyjRoF1y7R5OLJhS9U4drr8yavnd+k8
	I1TZn41ABuDXHBC2YXEUDEz8MKBSHVFD2SnBWhd9nTSWnRnMEKSGB6AQbY8A9lZhBch1anMP3UK
	zmD/3ykDXToQdwK83vOSJi5NP9FDtawIe6h0D/aZVVQMnN2qgnJzV93+ucRlHXV2qsswV
X-Gm-Gg: Acq92OEr2JSV/3bTBEjHaMZ+RqXzNh3a50x/z+82Q8PPn4JYU5vy4lTIQBhbwu/zln+
	mgdFiVgQhqBbwfb9cltHFA947uEolAkK2AQ9FRe4Zqy7YVGqihbtU5kSeZlosG0VRiQYr43ZLZk
	aiNwH/Hi01DaclDUVrdGax8mI/CtViOrdp1uq5B6LKDb9t9gxdI9PqvdHipN1SsQBMBmBA4fWzT
	OybuBKs0sAiZmnOzf7ClUI1eg+m0eTCSZFw72EVcvWNwxOAC2OrVvIXVP8y8XNLmzwRICjbFkKZ
	GjaPWadfdH/Gciv2mVt+UON9HokaOP7pMRN7amqGZ6s5g7KcmOyadCYT953mlOz67Uk9yH0ox9I
	Co2cvFHbJZknUaGu7XNHs28ovq06orUO4bSVSVcQmyAjCVRa3UdVzxTJcmSA=
X-Received: by 2002:a05:6a20:3d0b:b0:3a2:d0ed:f1f8 with SMTP id adf61e73a8af0-3aad4426d43mr12203977637.30.1778518315045;
        Mon, 11 May 2026 09:51:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0b:b0:3a2:d0ed:f1f8 with SMTP id adf61e73a8af0-3aad4426d43mr12203951637.30.1778518314442;
        Mon, 11 May 2026 09:51:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267711a67sm9693642a12.20.2026.05.11.09.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:51:54 -0700 (PDT)
Date: Mon, 11 May 2026 22:21:48 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] firmware: qcom: scm: use dev_err_probe() for dload
 address failure
Message-ID: <20260511165148.qxz3v5jtwysiosjq@hu-mojha-hyd.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
 <afyajZbt1hjEbgvY@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afyajZbt1hjEbgvY@baldur>
X-Proofpoint-ORIG-GUID: Bmlxo-k5D1W4plt1KV_fVnrMNEDZyeWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE4MCBTYWx0ZWRfX2Lf3e+8I4uCq
 Adfi1bEYEWmsMZ2AgFFWDrl1zNqBMbPXtf+PfwEaNBCht+j69yyH3i6m/xpUUPWoVjIXN7GJwBl
 8h8LO3CgD+rUelJKZbfBYzo+ZKoI3NC+sOa2iieXwxPeII+weAL76397JT4VMMjwF61wAVNC9QL
 X3xkxpTxiy/rNqg2H/PuGs6+1rhjw3xMZc0FSD3ig6kc7Is/tw4Kb62rHtLNAKqL4o58rHu6Lzv
 yddDn2JaXQs8THV62hHhYL82GuD3MgnIb1N8LEEUtVE6/Q4RPTLlox/QbKrEyic1ZSAufl2cRSM
 WeUQwtqxgjbc5EDIXT0k5rvh7v/9i2gegQaWEZFz0X634cpVQwZ2L91bAodQkxu5kaEwuypb0lt
 RLn6PtLPxTkn2pvGvu+kCvZ8FwtNs6aDTVfhioPSVBn4lx2LZ6tKlt0FdwxYRdStM4m4piBaOMQ
 PTDbGRfsHFBlfo/nM6w==
X-Proofpoint-GUID: Bmlxo-k5D1W4plt1KV_fVnrMNEDZyeWs
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a02092c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MdV5vAzaB1W4e4OnXksA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110180
X-Rspamd-Queue-Id: 304FB51315C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106988-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 09:01:24AM -0500, Bjorn Andersson wrote:
> On Thu, May 07, 2026 at 01:37:18PM +0530, Mukesh Ojha wrote:
> > Replace the bare `return ret` after qcom_scm_find_dload_address() with
> 
> Describe a problem, not an action.

There is no problem here, It is just for consistancy and an extra log., Hence,
just the action.

> 
> Why is this patch part of this series? I don't see how it relate to
> "minidump SRAM destination support".

Was making a change after that line in the following patches, So,
thought of sending it part of the series.

> 
> Change looks reasonable.

Thanks.

> 
> Regards,
> Bjorn
> 
> > dev_err_probe() to produce a consistent, deferred-probe-aware error
> > message when the download-mode address cannot be resolved.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index d9ee180388aa..f65b132004a5 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -2762,7 +2762,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  	scm->dev = &pdev->dev;
> >  	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
> >  	if (ret < 0)
> > -		return ret;
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "Failed to find download mode address\n");
> >  
> >  	mutex_init(&scm->scm_bw_lock);
> >  
> > -- 
> > 2.53.0
> > 

-- 
-Mukesh Ojha

