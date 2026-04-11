Return-Path: <linux-arm-msm+bounces-102798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLntAjdz2mln2ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 18:13:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B0F3E0C54
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 18:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 265313034EEE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 16:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F633B530A;
	Sat, 11 Apr 2026 16:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sqev2Pvf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewUUbVKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C063A9624
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924019; cv=none; b=u4cyT0o1obvFLox9w/UvURffC4s4BaJDDp1ArNLJaewJM4dZaqLi+cp6wW50EkVLHYUahXr7aT/ZJjfrYIJjD85H1Z/mnGqcW8VaLPVvou0hEcvIs+tkY9xGL+i5xAeddL2AdfLAuJvFLVThi+FFENxQZawr68DoXNTUpEIsJAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924019; c=relaxed/simple;
	bh=XPPk8xVmWig19KGwQtcNAlRM8tu8IDnHngD5mjhrpNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxcSZ4JYUhMH9dWOoyA72fgy7PXX+L262G/LIJHyqKOJrKeJR6cyQIvUMKAWDKRdkIGFX6N/6AIqcJsj2x01ulcm2ZwFe6L0AOJp3jp56iFq7cRA9y4D1mQzy0P2+NQOmED9N/OYm1Cv7PXLdLNxL87Txe3Of6O8VFIGnphzUgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sqev2Pvf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewUUbVKg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4mFqJ1837269
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 16:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dYtOThaUXkjyjb+N3FgamB0q
	5USepL5VcBjzyb4LiJk=; b=Sqev2Pvf4qeLg6bgvbnjQS4xel7qArO9j1WEGMQY
	a7N/syoPWxhP07ILdLFrQlaNFuytIEqgcjY1GZQwM3r8y5+h4zhUwuqFkuDFy31W
	7+aDKePebi312FUyIUxVRiPMGxybLcr6siqiXNCYRWeB1uk0rsYPJ2ZKYtXhml1l
	9CHjiMcxOgQtigS1K9+3XxInmWqzCTCLL9OdHmOkwYO8pLUY2RiyMx0shpMzCln7
	nT7jJPiv/bKTSEEACiM7/lbx4gF28KZQacA7ii4NFebDcO9DWPU1xMDgg1our/Ek
	HKsW0SGfffsCluHOHe9Zrn4Vmoo77S8xCmIIqIt6cHsgug==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6gykt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 16:13:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4076dc16so48827441cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 09:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775924016; x=1776528816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYtOThaUXkjyjb+N3FgamB0q5USepL5VcBjzyb4LiJk=;
        b=ewUUbVKgtuiOCFhs5k/j0liWLk5mrecFeD1PrN47loy5jk0DqoU6jDFc43UDJCZ3gD
         H5rI16etqrzrClXEj8L8qR6O3UkIERpMS66L9iWSRSrshlft4OXEwiPyofZiFnji1U6S
         N92NKb6VrdIylVxyg7Nqt7qfZhD5NZKyukW90IAH1QF1qLjBcJQGkaC0croWcu5pp2+r
         65txrLn2Mmcu0V9M1/wpI5gVWn8N3vLurHJYsfd3gtLMtoV1FXCNQTZBE/07KDpcT2w6
         HFrnl99m45BGHexgVF0wf2o8ScaDAi1Dq9cXJoepA2E1T0ucaGGEawFhlau9uX18A856
         Ehjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924016; x=1776528816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYtOThaUXkjyjb+N3FgamB0q5USepL5VcBjzyb4LiJk=;
        b=dOLEStImVEkfAIzwNZedr/898p33NFjV3w7shyXL2DWJTyFixxS+8QrdPlYDlhupUf
         qzF93xFdjE2fK6HzfQkpWBMQRAWmriMB+75eK9xaytuVQK6dgvuwyqvW74HNXLaDbAa9
         3aZGwLZtJ6y7aYoqewXBo9ZAhnO/oGdGX4MHh5WfQAQPkoOwtMya+vC4CUvcguZ5cFmh
         QCoiHcdnbDDhjK/XUILXJtNB4NspBzOxZOBbut+Zfm5p2bDYLCCkWU03gYUFe0RKt9e9
         m8chs5poBERlrrK84yqO21jFXXpOjdQ/7H2Ai/8ikfNGgMbzj67CvjyojIzYPsUGMsdn
         t1pg==
X-Forwarded-Encrypted: i=1; AJvYcCV3MCdi+PxrhfiF54ih1p05Rm7yKpHEGmcC5A2xSp05Uc8CSZ/DpKprq2Aq8Dy9Q1YPAGZwmUrt3Q5LSp8H@vger.kernel.org
X-Gm-Message-State: AOJu0YyuxWympw7+bTKjPuGieXW1HYweC9GSg755keNTdO1i36XzNJLJ
	Plwt+zvHKX1LlYh1xVFRhUH5+U4FRdvS8n2avNqhWTp0r2cWTYPdVBXYgKZWpcZHG8PuP1zqVld
	07HJ7hKEESrYJovBb8ExC+5GgN72lK4hsqnbNIITvePc/eo5VTVF/cY2XLsEEJOMolp8a
X-Gm-Gg: AeBDievViC72fMEXXvWLH430ysUTpPmPelxRC/ItVSScJLkZnO01DJfTdT6PqKCZ1nN
	3ntu3+Knv2XP1+eMJarAEl9uDm0/gZb99H5Oqh6imX4dB/2NfYNyft0m9r7v9t/nnv/n71FnmuP
	RNNSOMe+SPd1k9ju1kDLmgqhP42765CdX/hKkht5j1tUDzi2VvXtGsDZ2pwV8Mmn3TKr+llueuv
	sGTdH7G49bSrg29Wv+YLdzZSMudrGLmLQyzY1qSGmF1NCxYPFObZgO66htamIIsINJrdjTtGy4t
	uL9aLZE2bHk2fGuWbje99d2wcEQ7AIC8od/tuuCQ0/fSkyjvFgAeTEWrZQ7P+Q1xu/qfqPOB0Pf
	rhA4k5lSZwBoYnog7zHZDwuJsgmYHiB+eQDCaLhdb3+sP1qDrbTo73nB4vf3D8xMX6IIPdCy04O
	GGHL2USdd4gdaP2UR/U05G7DPg1US4nlOvu14=
X-Received: by 2002:a05:622a:8e07:b0:50b:277d:efca with SMTP id d75a77b69052e-50dd5cc6a72mr86356431cf.38.1775924016586;
        Sat, 11 Apr 2026 09:13:36 -0700 (PDT)
X-Received: by 2002:a05:622a:8e07:b0:50b:277d:efca with SMTP id d75a77b69052e-50dd5cc6a72mr86356091cf.38.1775924016132;
        Sat, 11 Apr 2026 09:13:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeef3620sm1490179e87.57.2026.04.11.09.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:13:34 -0700 (PDT)
Date: Sat, 11 Apr 2026 19:13:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/7] media: qcom: iris: add QC10C & P010 buffer size
 calculations
Message-ID: <jeqhravjwd2lnea5eqejvqfzb3v47dmnfgq3l47n6raztzlsu2@qd6ecrz6nxmt>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-1-428c1ec2e3f3@linaro.org>
 <753kndrdrq6j67c3l7uvwrsj2ino7vb2chmvfwzmppo42kcd4h@x5wcdhdpzje2>
 <bb7abc44-ead0-452e-9429-6c6350ce69ec@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb7abc44-ead0-452e-9429-6c6350ce69ec@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE0MCBTYWx0ZWRfXzLksv2uQMVuY
 9ZZOYw5gcMNm1vkbfh4lXS6A5I3O7VXLw+ywLWvOLB1PSXBGAOy1RmKadBRwVWzYViCbUZb16u5
 PUwTZwj1fzCIkTUFk22wJtnzpk6F6TIkQdrmzjW5X7tqogNSpdGEAyogVDNIyL+Sekf86hr0J7Q
 Ior3TTy1q648bmTjyh7ip7aqxEd8vUSK9I2V5+5mO+Ka5GJC0uaPRYId3sLtzuCE31DT4q7yYo0
 W2DzWHFRSE6Bk5dPLv0Z48iAmKuFQXRr1UvJb7r4GHXti254zptVndRL7jYzUUUcvJoyZ12Btzw
 C8U5QzPyrz6sUr2lTxshjrMVVIoIudSRX93B1ahdt8wnkuFM+n+nB2tc9RWNKdnnv4MFlMUXBC6
 fYM1O6b16k/Ymp8HZD5Jev/3d4MXPJmBJfbjbBkIO4L20RNcBkiHUxE7KAm8RPh5a5c/0KrgWTz
 gIPWBKBQ8it2afbam1Q==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69da7331 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=FiFl1KPSSaRvcISL4aUA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: sejWdONfw6SMa6-02EsK_tUriqzgQz6Q
X-Proofpoint-ORIG-GUID: sejWdONfw6SMa6-02EsK_tUriqzgQz6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110140
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102798-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79B0F3E0C54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 09:25:04AM +0200, Neil Armstrong wrote:
> On 4/9/26 01:59, Dmitry Baryshkov wrote:
> > On Wed, Apr 08, 2026 at 06:43:54PM +0200, Neil Armstrong wrote:
> > > @@ -204,6 +226,55 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
> > >   	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
> > >   }
> > > +/*
> > > + * QC10C:
> > > + * Compressed Macro-tile format for TP10.
> > 
> > UBWC-compressed format
> 
> I literally took the head comment of the QC08C buffer size function and replaced 8 by 10...

You can be better than the previous authors :-)

> 
> > 
> > > + */
> > 
> 

-- 
With best wishes
Dmitry

