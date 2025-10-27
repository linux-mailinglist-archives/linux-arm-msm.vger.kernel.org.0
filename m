Return-Path: <linux-arm-msm+bounces-78952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 487A3C0E744
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B79518880BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CF230B527;
	Mon, 27 Oct 2025 14:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HboQBENh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5661E307AE5
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761575503; cv=none; b=lx/3J/bAcnldFxacXLhn3jdfSkYUF8KLvFIW/24sOx+3k8RDPt2M0fXOh5z24vIpADMxPzCq8HwnGctkfMc7QqFNJChrtfbSGaJtZbsgU6Sqr1LD6FO3qAp7Epbl9MiH7qAk53ykwJDr1vUbxpPRYnnLHfOeLJWYKE3PsUmrTEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761575503; c=relaxed/simple;
	bh=jSUdrDctU8ZOWR9YNGP6vXFYmPv/ipEZl8cwDsL57v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNnwAA0U9HS9axJVAaYx+Dtl1xd6t+pLfLRpuBTHzWw/Op0g2V4080LUbEuS9MOodbfvhxIJYnesS8QwjZ/wcKpnujo+2oAopZjphBqL8UrjHQbzM3ZkZTNKLKSlgQkL4w3wKWsrho281E97NsKWuUByEnmZ+U4eDC0AcO4y3IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HboQBENh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RBK3MZ2547860
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJ/oV+cYqr/8D2B4smGZ5hJY3orMCaMqMjktQtWtFsY=; b=HboQBENhgPMr/GO3
	KmdNGTJ9Ohg/LZ7WrmlLaUJ1JCvHUQdJLIVSHVSujcDan4RpG2JFjE4ASaLyntoF
	lyALKF1wzsRfdCsXEthFIYTl+SNT/qr/VGhOSS0cHrVCr1nKqzol9nLz3u/ZfPV1
	W/SPoDXcMo5DCRy2NShcebybxtmEWI6S74NBwceufZEaZLg+Ne6r0F+Nn6XDKixy
	KLXjj9lGgkTrpEdCN20DGzpiLH+Dfx5RbuZodYnAF+y1y1HIi8ucOzKMhtsacG3I
	Abwqe0eQfytV7QRjo+2ZLYZni44k+YwxK/4/stTPccjc3ulqqW4raWf2wL+/knYg
	Pk61mA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2ghn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:31:41 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-932c07ad3ebso8808947241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 07:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761575500; x=1762180300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJ/oV+cYqr/8D2B4smGZ5hJY3orMCaMqMjktQtWtFsY=;
        b=u7CShUCh978Hk3s+QKJZqBuE9SKQmTD+Av00Zu+yBh9KEsSFUsDe3kspLQW6AM6oEe
         rzkunuOj4Dpp7pQjAQkP1Mdkn8OabM4vvdLsmhCn+xG0wpoLEGnWIW4xOWjxfiC6oaNT
         pKMkfRXANvlRFjMfZuklJeMUoCgR0rRYK4imcesQTu8Wd+rQiSM5jZ9lodHpg2Szw949
         e6fOyax1Mf7dj/jhyt7OyAxMBmVX7IFkKCoddPHCxhu90eOhOS3J/9g8dZjXINMNRkIN
         5XHcmSrSa5Hq/lVefuvF+AUuHaeSp5vGIs2pBpYv4nxo4FfQFYANzybCfk6wIeSVErT8
         CG6g==
X-Forwarded-Encrypted: i=1; AJvYcCVq+sELWiJcH9OOFfECd3R6trvIdP6uINUXFR3qvAoVtyTauDM0ab2roiLDXAX3IKzheQlVWwLW8CGzcrei@vger.kernel.org
X-Gm-Message-State: AOJu0Yw64RnRgSG9iad46pHNPD3Bx5BjNsR0H7jEGyR7BimZHknOluWY
	1J0Xrj2I96aAIvGsqiD7FBwOlOGX/yn3slaJjbP0Ct6PAjuLV37QWt3kKfYXbsjIkQCag5xUmnv
	l1xTvOSRZ51tpC6+o1SAi72/gx4YbU6Vq5hVnJyyxmuZcz6GehyW07uxg3czkfZfYBywB
X-Gm-Gg: ASbGnctcvxd7YgbDxNkcKnaz0pJkHh5cKFULrijQNAHOa/xslRom1rOeEDo6Oz2Q8HW
	AaarF/GmIoqz5VL7LIpXyN1qUIQQXcWPxsXVN59x7g0qSwrm0q/F8iYx0G/rHJ6yxwjvWWttw+z
	q62vZcwXGp0U3XNIeH9iVZit+XW2JgcgYS6gnpGtcfM7ADFsv+eAuNP3KbLdKyrhLUuUAkg+5zs
	y37aLFo5PwH779UB0UcmbQPwOYSRuF5aJvBswdjaDyL8f2068pcrC5yBW70umISRcFUemXSfhV4
	YpvaiTMX7QECfCcVC7j12HMFdST1+XYhczLoJeEn/sFAv+htKxVbn3Ed2EeIHq2gq/S2hghNy2f
	6qZo1vjV8QYLkxOH18mWGwZ7KLBB8hgyQsPFMKLxL/QI+ayRTyK9A3mAERRsK0M1o1eUhKqkSx4
	weepaubcKa+H21
X-Received: by 2002:a05:6102:a4e:b0:5db:383e:7b0d with SMTP id ada2fe7eead31-5db7ca26a5bmr36420137.3.1761575495593;
        Mon, 27 Oct 2025 07:31:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6nK4YCqAYC+uwXKW/CbSci1wNrGe4DF1/5A/Nyiz2sV3wdxX/7PyT+uiNUI/bSJbJDtpeog==
X-Received: by 2002:a05:6102:a4e:b0:5db:383e:7b0d with SMTP id ada2fe7eead31-5db7ca26a5bmr36225137.3.1761575493679;
        Mon, 27 Oct 2025 07:31:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41c30sm2381997e87.3.2025.10.27.07.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:31:33 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:31:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] regulator: rpmh-regulator: Fix PMIC5 BOB bypass
 mode handling
Message-ID: <hwsornfn3rv524pzrudgscxffbvexdr5c3ko3th6sdakx6zfdv@sg6awizr6mzw>
References: <7wiionjbjot5psapobmwcflecyu7pz3pzc44c3horsvjfj6yfp@f2iig6hyb5a6>
 <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-1-5c7a8e4df601@oss.qualcomm.com>
 <on4zcfs5qdaekc7teo2iq6vpw7o2mp6yiqjkbznxo7wcxgutj3@nb35f55fkugv>
 <61c299af-c4f8-47a0-8803-306c08792b17@oss.qualcomm.com>
 <xlki5jwurnixdxaph5mtxg7sfks2cww3xbswgtf6dbn2z72o2r@smx5hxo6obxj>
 <c3fac2a3-dc89-440a-9958-f2e904c42f5a@sirena.org.uk>
 <7wiionjbjot5psapobmwcflecyu7pz3pzc44c3horsvjfj6yfp@f2iig6hyb5a6>
 <20251024080358.rkebbvg7louwbo6k@hu-kamalw-hyd.qualcomm.com>
 <20251024080358.rkebbvg7louwbo6k@hu-kamalw-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251024080358.rkebbvg7louwbo6k@hu-kamalw-hyd.qualcomm.com>
 <20251024080358.rkebbvg7louwbo6k@hu-kamalw-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: ivAzJhSw3KxEea5y2HWtQC3OHUkihnX2
X-Proofpoint-GUID: ivAzJhSw3KxEea5y2HWtQC3OHUkihnX2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEzNCBTYWx0ZWRfXxFeYw+egCup/
 Q1KXreF8DATNOQaRb8jtmd8jiemvEpExVwdUNRUXdc4rMQdQIWoTNJcX5lF4CzIuh/SEQ5X1IjN
 M06xuZxAFPgaNVVY0I2zGd+tbTwFEoC4UyuNEDc9OzkG1ehtbQ1bS8GXNEY4h6H+xgk2cFdt/PD
 3szFiiv5ePg4SXNRU+N0va1P0MPzo5LPILBym+VrbpSq9wDnpiMoQp6rzPAWrc9GAlnME2fPCpK
 CIyzPayuwvNthyopsdbBESfkzx/QAPvAR6RpKzioqv2djiGddSNUnChSDJT2YUbVFO1bDt3SPGf
 0FJyB7NC1oDcK01q0uebEnrTGuhz4//p8RLNGMUr0c/qamf4j4JS9VbJzqfbF6877MQ8iPGIN3L
 jXS5H/MjvkLB8Oe+lfDc9msPH0oWpQ==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ff824d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=MjDJoloGj8gcxCzJeMkA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270134

On Fri, Oct 24, 2025 at 01:33:58PM +0530, Kamal Wadhwa wrote:
> On Thu, Oct 23, 2025 at 02:37:07PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Oct 22, 2025 at 04:15:51PM +0100, Mark Brown wrote:
> > > On Wed, Oct 22, 2025 at 06:11:46PM +0300, Dmitry Baryshkov wrote:
> > > > On Wed, Oct 22, 2025 at 04:58:15PM +0200, Konrad Dybcio wrote:
> > > > > On 10/22/25 12:23 AM, Dmitry Baryshkov wrote:
> > > > > > On Wed, Oct 22, 2025 at 02:38:53AM +0530, Kamal Wadhwa wrote:
> > > 
> > > > > >> Currently, when `rpmh_regulator_set_mode_bypass()` helper function
> > > > > >> is called to set bypass mode, it sends PMIC4's BOB bypass mode
> > > > > >> value for even if its a PMIC5 BOB.
> > > 
> > > > > > The universe will end, the Sun will explode and Ragnarök will be upon
> > > > > > us. Please describe the issue, why sending bypass value is bad.
> > > 
> > > > > I think you misread, it sends the magic value which corresponds
> > > > > to BYPASS, but one that worked for the previous generation
> > > 
> > > > I just wanted to point out that the commit message makes a statement
> > > > that it sends some value. It should document, why the sent value is bad.
> > > 
> > > It seems fairly clear to me from the above that the driver is sending
> > > the value for the wrong device type which is something so obviously
> > > wrong I'm not sure it requires further explanation.
> > 
> > Okay. I'm sorry if I'm overreacting.
> > 
> > The bypass_supported field still needs to go away in my opinion.
> 
> @Dmitry - one way to avoid it is if i re-use `.pmic_bypass_mode` and
> keep it  `= -EINVAL` for the checking if the bypass mode is not
> supported? and drop the `.bypass_supported`.

You don't need .bypass_supported because the regulators that don't
support bypass don't have .set_bypass callback in their ops and as such
it is impossible to get the vreg->bypassed flag to be set.

> But do note that currently only BOB type regulator supports bypass
> mode, and this above change will also require modifying all of the
> existing (and future) configs for regulator types that do not support
> bypass control.

[...]

> 
> while in the current patch i dont need to touch any of these above
> structures and just add new property and define it whereever
> `bypass_supported` is set to true.
> 
> i.e just change these 2 bob nodes only.
> 
> static const struct rpmh_vreg_hw_data pmic5_bob = {
> static const struct rpmh_vreg_hw_data pmic4_bob = {
> 
> Please suggest, if we can do this in a better way.

Don't change any of the nodes, the necessary changes are already in
place. Just fix the value being programmed for PMIC5.

-- 
With best wishes
Dmitry

