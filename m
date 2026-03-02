Return-Path: <linux-arm-msm+bounces-94977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO9bIOuqpWmpDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 16:21:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9051DBB54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 16:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D39AE305C3F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 15:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2939F40F8F4;
	Mon,  2 Mar 2026 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCsgkvcX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0FU09Cq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E874014BE
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464649; cv=none; b=n5+wqgm+RcjPew505/lp1ystFmRr72IWGIPiql9s649IvlEdlukJFzdb6n7edPopwx5yJz/YsX9ZsoddgazFaRn1a2iaU61S72gcBapzIEIG1D4ykaw/pqKgn8KG2krNaK8nGI2OYbNxgN6mH0mPdYhZTVN6l6SzlezA3ikh/r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464649; c=relaxed/simple;
	bh=VKavJLKjXdqJ9GIJxI3GsuIAnVoeXut4ppS0s+oTqbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjJOcF1osI6lWC8EGJpjOXIOxoJ81W9vpZPzAS76Q4QrmVXtXJ+carnRdSZGc6HcjA9mvnNDF3w7+fAlLA07QjtHHaWfw/ZAYTKPCd7Ca4WIHOVk/79B2QeC24X9i7x5n0eNkFED/DfRJgbFxXe9d44soNqfTiRLsfg4mQ4LxEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCsgkvcX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0FU09Cq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622ESAFT662196
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 15:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yx4P8oh5q3RrjLn9Hi0TvipgEU7ErnVSXqn5SHe2Ya4=; b=lCsgkvcXMYVih0MO
	JnsmwNMWYHzLafbbPs+xUOywmiQRKkEdaantsVuvOrHKQkU6FsFshsLin/oN0k19
	lZpl8ISN6OydAuRY0hgnXugQSzBVvRPcj3ZXpinqWVNpNSaTwvTLIdm+/TzdeUmh
	6aloLSpBOQJ4yhITqXQmlhC7TK6gm7hXtcrOyOCufSMGkkFvuavmDJXg62hs1HbS
	650fAocdjJWE4+qsTkW+HZe0RE6wvTroWH+40JTGlTuXrl289Zxy1NwEFqcBVq/n
	mL9SinfJw00Yy0SPA2mZ1DNTEjPBuK5HQgnRnu64PpkUb/6IQPGSAGJW2jccRjD0
	O/+8FQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2shu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 15:17:26 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94de9d162feso51421171241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772464646; x=1773069446; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yx4P8oh5q3RrjLn9Hi0TvipgEU7ErnVSXqn5SHe2Ya4=;
        b=U0FU09Cq2zuJ8N6ifnS0wXy+YYTuHX8IWWOCuiUkDncuaZE7L8D+5dDP4h+AzCKyqu
         Rn16+S7Op2daSfqo+fNpT24lNaoeqnRLA8fvn/76bOAExAJJj3HK8tulbKMzQQooVuVg
         ZfeU3pjdL1ieJOjeWrM8nx/cMNEH8Tc8EF1nLSWPdcJffvmIAk9BV44pmPWTZi8IBoSA
         dgI5PgAC1RsmzLKjd73hH2TvaWuuWTjb+ZNmBGpW28qQfbTmWxIksqg7moW5I8QOPalf
         n5Owdp7XVva35m+EfCChuIOiDVtc2e1p7usalZTSPsrmuadIg9vtA9KPgqiic2uP+A10
         Dc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464646; x=1773069446;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx4P8oh5q3RrjLn9Hi0TvipgEU7ErnVSXqn5SHe2Ya4=;
        b=A+Ef8+gmwXcUIBVaEzOOijp8go71WESOXAiALLux9KYDREibnzuZG87EqGlGpBUAHN
         q6Fbdxh7Fvz15F/DK2CvdOacNvy9n40z6xS0+IqupVYEj12Z43sDgfMdpElp0SI0obqG
         GsivxG8qnwJW7R8g0Jqdwc8sPDKHqj1E/6xmfEQHqs70L2dI0/JdJlXhuQkKYXpTX1NQ
         fi5klKtHuy4nG/oa4688KBiuGGtoiF7kfdlJ2Wr11Wi4mUziPVlYRcVa7SUw0mNB0ibJ
         qVjj6yODRIyay+6wxvd01ZhhtAhHbg5oFB43dJ02DTCa17Sb1hm29GcBXjsi9iBBIFkk
         cMtA==
X-Forwarded-Encrypted: i=1; AJvYcCWC2iZsEGSFDrNSCA094LE65L5jmaz0TJ7Owf2Eo9LWWfnNRshswjx9/zHFfdHQRpQdiL7KorbyvDkxtU9V@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ5yiIkeqFoTQQP0ATd1TCqq/9vUl4u5t4lP3it4uXAaF2Oj2H
	jlIXDPny4WZbwNlvS0uqxcCy0jgYQloF7+TwK3gOa/xARrBSHpCT8KjIQFBL0VGfiva/ez6niz7
	0VFhqvksSSke8cJ+Yg94QIux7l4RraKBjb25hOCyQYDF22woAsaF7EjgnSX5rfvjW4sFn
X-Gm-Gg: ATEYQzxAoqfyzJ4qC0M0AmSl8zr5pOJ36OPO1gXUlJHVtD5mmCMoEXnXW/PWl8ivrd6
	iQ2Z9hzAUVoudAXLi80XfurHImMP0nDCuLyR1f/VtnY/EW3QJCwxu/V1wi1fCU+NVmls/vsPX9L
	54NzCduiaeOfynVSy1lHgrIEydnXfnYxkMqn36I4zgohAOJZnF74WJodJZwWp91IrhJ/+Og3Uop
	3CAb1SKapo/6Rg4kd55tSgKR45kqaEBW7G4seA9V29/Y5dvKF0HQUdj7PeOiAFfq5+ohvoolEwt
	SV0WRXHf7w1S5lBZQ+Veb5y5xCturiKplVH3XaJVNUcCsT3rvnoKcKArRV7s8Uhun2h9M/ashKD
	89eIQXVOFWbk+6DAGMBDxbsg2Ls8qG2oZ46pxxvqTK2mBEx44DKMIj+p6H/dpyY4Zq15eOWKJ0l
	7FrWj4QtBCrITPZRWif8Da2aW30Bs4+Q/i584=
X-Received: by 2002:a05:6122:d04:b0:544:c8bf:6509 with SMTP id 71dfb90a1353d-56aa09ec812mr6247224e0c.4.1772464645531;
        Mon, 02 Mar 2026 07:17:25 -0800 (PST)
X-Received: by 2002:a05:6122:d04:b0:544:c8bf:6509 with SMTP id 71dfb90a1353d-56aa09ec812mr6247160e0c.4.1772464644891;
        Mon, 02 Mar 2026 07:17:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a122dfdcecsm11223e87.65.2026.03.02.07.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:17:23 -0800 (PST)
Date: Mon, 2 Mar 2026 17:17:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <g3dclilgoee6a2dyfqdvk67asjb4ptur5nc52iqqeqpiiourpv@46xstae5zsy3>
References: <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
 <DGSDE0ID17DQ.XQZNKZH5UKPO@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGSDE0ID17DQ.XQZNKZH5UKPO@fairphone.com>
X-Proofpoint-GUID: FdelKw3CZd4WUlRKHSIqPE0lQgC_5xOv
X-Proofpoint-ORIG-GUID: FdelKw3CZd4WUlRKHSIqPE0lQgC_5xOv
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a5aa06 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=nwaUyU7bsG4C97oCFwUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyOCBTYWx0ZWRfX/oGUjxnd9S8/
 lUuXopOtJmAoYzsX6VQLVo4LyCOkM0yY6zGWIZo8zl3RZTyAyyJI+vKRMhGLGsXaLgtzqbBMDBB
 uTdAZpmoT2emDHyW/xC/OVSygURasY5CDir7ro1eUGQFFEarbVgB/4tJnpEMFbYyhxoiS6HXTFP
 1YShJUH8C2VxKjuEzBcGeFN+hURPdjNVSKKe4+p3k+XL/3kThFL3NC6k1OLtai7Jen+vaF7ttiL
 E+SYfsvxceq1THCkhpyx3DZkb3QAxe5YvNmmPpxn3KbuA7LKEsYWNQbHEcRjKWtfzHFQcZeIMh5
 +pexWzGb73qgDvdb0KNeFJkwTxq2W1IDAoRYvhCd0jNaJT7JPydgXWurg+g+/8okAPcz5NsbgB8
 W/n3J0afRIBFt7cVC9ENnAaORxabCDYjq6MMtrjDBvxasJzPMsbViVmoZwc5MgQ27DEH1kbc1Qk
 im0t2UEwzTdYvWVIqYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020128
X-Rspamd-Queue-Id: EB9051DBB54
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94977-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 03:35:36PM +0100, Luca Weiss wrote:
> On Fri Feb 27, 2026 at 8:05 PM CET, Dmitry Baryshkov wrote:
> > On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
> >> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
> >> > On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
> >> >> On 1/12/26 9:25 AM, yuanjiey wrote:
> >> >>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
> >> >>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >> >>>>>
> >> >>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> >> >>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> >> >>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >> 
> >> [...]
> >> 
> >> > Please correct me if I'm wrong, if we drop dev_pm_opp_set() from
> >> > dpu_runtime_suspend, then we should be able to also skip setting OPP
> >> > corner in dpu_runtime_resume(), because the previously set corner should
> >> > be viable until drm/msm driver commits new state / new modes.
> >> 
> >> That matches my understanding.
> >> 
> >> > The only important issue is to set the corner before starting up the
> >> > DPU, where we already have code to set MDP_CLK to the max frequency.
> >> > 
> >> > Which means, we only need to drop the dev_pm_set_rate call from the
> >> > dpu_runtime_suspend().
> >> 
> >> I concur.
> >> 
> >> >> For MDSS, we're currently generally describing the MDSS_AHB clock, the
> >> >> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an OPP
> >> > 
> >> > No. As far as I remember, MDP_CLK is necessary to access MDSS registers
> >> > (see commit d2570ee67a47 ("drm/msm/mdss: generate MDSS data for MDP5
> >> > platforms")), I don't remember if accessing HW_REV without MDP_CLK
> >> > resulted in a zero reads or in a crash. At the same time it needs to be
> >> > enabled to any rate, which means that for most of the operations
> >> > msm_mdss.c can rely on DPU keeping the clock up and running.
> >> > 
> >> >> table.. The GCC clock is sourced from (and scaled by) the NoC, but the
> >> >> MDSS_AHB one seems to have 3 actually configurable performance points
> >> >> that neither we nor seemingly the downstream driver seem to really care
> >> >> about (i.e. both just treat it as on/off). If we need to scale it, we
> >> >> should add an OPP table, if we don't, we should at least add required-opps.
> >> > 
> >> > I think, dispcc already has a minimal vote on the MMCX, which fulfill
> >> > these needs.
> >> 
> >> I have slightly mixed feelings, but I suppose that as we accepted Commit
> >> e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the domain"),
> >> we can generally agree that it makes sense that calling genpd->on() actually
> >> turns on the power indeed
> >> 
> >> What I'm worried about is if the clock is pre-configured to run at a high
> >> frequency from the bootloader (prepare_enable only sets the EN bit in the RCG,
> >> and doesn't impact the state of M/N/D at a glance), we may get a brownout
> >> 
> >> This rings the "downstream really did it better with putting clock dvfs states
> >> into the clk driver" bell, but I suppose the way to fight this would be to
> >> simply set_rate(fmax) there too..
> >> 
> >> I attempted an experiment with pulling out the plug. MMCX enabled with the
> >> AHB clock off results in a read-as-zero. I tried really hard to disable the
> >> mdp clock, but it seems like the "shared_ops" reflect some sort of "you
> >> *really* can't just disable it" type behavior (verified with debugcc)
> >
> > I think, in 8996 it was possible to disable it. Not sure about
> > 8998/630/660.
> >
> >> 
> >> 
> >> There's a possible race condition if we don't do it:
> >> 
> >> ------- bootloader --------
> >> configure display, mdp_clk=turbo
> >> ------- linux -------------
> >> load rpmhpd     |
> >> load venus      |
> >> set mmcx=lowsvs | mdp_clk is @ turbo
> >>                 | brownout
> >>                 | 
> >>                 | <mdss would only probe here>
> >> 
> >> *but* that should be made impossible because of .sync_state().
> >
> > Yep, sync_state should prevent MMCX or CX from dropping under the boot
> > level.
> >
> >> 
> >> This may impact hacky setups like simplefb, but as the name implies,
> >> that's hacky.
> >> 
> >> Relying on .sync_state() however will not cover the case if the mdss
> >> module is removed and re-inserted later, possibly with mmcx disabled
> >> entirely but the clock not parked at a sufficiently low rate.
> >> 
> >> 
> >> TLDR: reassess whether MDSS needs the MDP clock, if so, we should just
> >> plug the MDP opp table into it and set_rate(fmax) during mdss init
> >
> > And what will drop it afterwards? MDSS will still vote on the MMCX / CX
> > level even though DPU will change the clock freq.
> >
> >> 
> >> >> The MDP4/MDP5 drivers are probably wrong too in this regard, but many
> >> >> targets supported by these may not even have OPP tables and are generally
> >> >> not super high priority for spending time on.. that can, I'd kick down the
> >> >> road unless someone really wants to step up
> >> > 
> >> > I'd really not bother with those two drivers, unless we start seing
> >> > crashes. For MDP4 platforms we don't implement power domains at all, no
> >> > interconnects, etc., which means that the system will never go to a
> >> > lower power state.
> >> 
> >> Right. Might be that 2030-something arrives and armv7 is gone before someone
> >> randomly decides to work on that!
> >> 
> >> > MDP5 platforms mostly don't have OPP tables. (I'm not counting MSM8998 /
> >> > SDM630 / SDM660 here). MSM8917 / MSM8937 have only DSI tables, MSM8976
> >> > has both MDP and DSI tables (my favourite MSM8996 has none). Probably we
> >> > should start there by adding missing bits adding corresponding
> >> > dev_pm_set_rate() calls as required (as demostrated by the DPU driver).
> >> 
> >> A bit off-topic, but:
> >> 
> >> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> >> 
> >> 96 is in DPU. any other candidates that should be moved over?
> >
> > Let's go through them.
> >
> > All SoC except those currently supported in DPU require SMP (shared
> > memory pool) support to be ported from the MDP5 driver.
> >
> > Most of the remaining platforms (except MSM8994/92) also had HW cursor
> > implemented in a fancy way, in the LM rather than in a separate pipe.
> > I'd really like to postpone those, possibly first completing migration
> > of the other platforms and dropping support for them from MDP5.
> >
> > 1.0  - old MSM8974
> >        I'd rather not touch it, it had bugs and I don't have HW
> > 1.1  - MSM8x26
> >        Probably Luca can better comment on it. Should be doable, but I
> >        don't see upstream devices using display on it.
> 
> I have at least two MSM8x26 (1x APQ8026 lg-lenok & 1x MSM8926 htc-memul)
> devices working with MDP5 fine. I should've probably upstreamed panel
> driver & dts but they haven't been high priority..

I think I have been saying this: having a panel & dsi enabled in DT is
the only way for me to know that the display is working on this
platform. I'd really kindly ask you and other activists to get at least
some panel drivers and corresponding DT bits upstream. It is really an
important flag for me.

I can propose some kind of bounty for those getting MDSS+panel supported
in Qcom DT. (Beer at the next conf we meet? Some stickers for the
laptops and phones? Mämmi?)

> 
> Btw IOMMU support is here missing as well, so no GPU support anymore
> since 6.17 if I'm not mistaken.
> 
> > 1.2  - MSM8974
> >        I think it also had issues, no IOMMU support in upstream, etc.
> 
> Plenty of 'issues' for sure ;) but apart from GPU driver having dropped
> no-IOMMU codepath they should be fairly fine, for what's currently
> upstream.
> 
> I think also here, plenty of devices that do have panel support but not
> much upstream. It's kind of all the same though, nothing exciting. Panel
> driver with init sequence plus the same dts enablement bits.

-- 
With best wishes
Dmitry

