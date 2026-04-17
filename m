Return-Path: <linux-arm-msm+bounces-103576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN8NO2jC4mny9wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:29:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF6841F2B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FED630131C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 23:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C13935DA4C;
	Fri, 17 Apr 2026 23:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUJrw/R1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DRdbJWF1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4BE327BFA
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776468579; cv=none; b=kLsIjeUmNpVIpe9Unwax5anmTIw/UZmF5Ciy2y4An9Femf8bDbz/b2uSxkkYi4A3Hb+Fonnpojau+ErvGUCpdze0lyR739MEnEPpEgNHGU6/hpliZvQ4p0SubUxP35lMbZvZdwY5vwjaHb1LJLAPiOHTQiN14uOEj6UNjIzPOJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776468579; c=relaxed/simple;
	bh=i1wj9aA/8YlyZGyvudCzIaleGVZglVR8+NTSQS06GEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqAPcy0nIYgyltUaNFzvEDy6tcPtv7UheGCiicdkCfGg+l4B4L4OQQgZ53Z55DketZd83INoBFD0DNDrFI6l+WXiSbtyndWo2FoD8BvV/ZUqxXn8WsYa/tCeDklfP+HxJpe3zjanQthZAHGNbm3LAN+Lnlnav9sgMVdEz7t+XAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUJrw/R1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRdbJWF1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4GQF4068669
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rHgSNXi6Q1B7a4INzY3cg+7z2v/tmCcKjEA3iSJcotI=; b=DUJrw/R1OpwPuDTJ
	xnj7WKhGQUuHfa78VLKB5ypI8QBhu0brEKA4SXLRJ4VuF/E5AmAopG+/HE8Oc1lj
	PlCumd77754CVpA5wPMxyOjDs3YNaCVYojgUOtQLipPriVk5rpids5oCe+/gs5rh
	JmIrEwh5F/b17v0Dd0tY5PJRF99XAmP2Ry6d61WY42ISRcgbouoc3qIbk5oFsUBl
	zdio9GxEG3zdCMV9sI9Cq8C156W0YMB5H/hWK3L/0BR4OOrRz8i1jCQ6B3Sx1wFR
	U2zaE8uaoKwdOxJG5gY2ZWI09njj4DxfhStbn7OaDPZ/mqqXYsP8fLWefNdGs+uG
	S2eIvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu2mbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:29:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso35354221cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776468576; x=1777073376; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rHgSNXi6Q1B7a4INzY3cg+7z2v/tmCcKjEA3iSJcotI=;
        b=DRdbJWF1qZqhiIxeu237N+xxPMKYpTbP798i7Aoyviw0aJtvYvsoCfFPGT0e/q6VY2
         vBAH4ugqyeuDPNRdm6LCQtbLkrFZpro6433dbUVHCXnuP6gNU2p5ky1wDzAe4pDi3RvW
         eb8ZyACDUv7LwIY4CP1MaEz50jm0SJyq3N68oMSt1b9T/EEf941c4w7UGRRcg872zWJZ
         sSsOxtx12ryAIA76gPBXKNi5j1Z0h2sGzNQNNxYyzgpMrNaFoP8AcjKlogQV0EsY0DXW
         oL+3pJKHLHc5uPc5GHEkBvBkRLUiEc4hidmimDCpxHgmyYjFm4jrteqnOmeCObZz9zvg
         Jv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776468576; x=1777073376;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHgSNXi6Q1B7a4INzY3cg+7z2v/tmCcKjEA3iSJcotI=;
        b=TjJzNJ/p9tDbSHwKMTNxwlwqKUHdaiCQ3p9ZsGEGyVpXPasbob70k0QiQQPKOYcTnt
         +byrFMHMwJR29ad5KCIQm08UW1pzgyyUzQMBT2Nl2YouDDkKFaQ8DgKFgdpFGbh4mg9v
         q7l1g1tL1WxWjcigM2rGPWdIBAzf12C8N9qnmyV0wa+AduV+612L3cAcYx58y0N9gdF4
         0xdczkJNTbyEcfts1MeQ6bOArLcOk9AP3g1O0/1DEFB3LOwBIQsCeHAs/fiWAsmAZ3Qz
         KseFAGFx3Coi9SY9Nn3yS3eXQ+rYj51r8DSW1C8QReRFCtsdoUcwKpxqYRixLUiExTUr
         r+FA==
X-Forwarded-Encrypted: i=1; AFNElJ/061hg4hAM32qo3roQwjVisnq5fBrEMqp44d3WKH0KiMQsOvcC49fuEEpUfcHgrtF0kyflLBWUJw0m0GNW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr6EjCL4aWj5AyWuPNBK6iqzD2qlRpvWUGZra8vh53bnq5I8YB
	H++GlcggCJc99etQRNH3e+ELLUeGZKhhCWiHTLRv8GK5aQH5cLXMHa8GXAc4RACr6XJPIiWH0Ij
	DP0HFxu260JIGkHHuH7Rd7WI0v19nj16gq0CI42otCp9IHJ/16b+dWbiw2lnBLbIKCDun
X-Gm-Gg: AeBDieufmv8rVchpDqUcrrjmrCp5VGd9MjX7jOyVzrJpRAIoUBKSBe2ieku4W9SMKdY
	bNWDJTNUFamkp01N2mDD+vmvaK5Kx/7Nn+A0Hg4EdSQD70hkuA+j2xbKL4T2haypGRBhMopwlpu
	iO/1Uuj8cmUpEk9nVSUYNuBgYqoc7OnaJCcy5XnHJrF2lXkj2TFVcsn4zzeDan47n2QlSWnGDPp
	NXGCX51mGIbVu5L9sQaAhq3oS8HSL2LaSZCCJuFPKkJ+0XJFbuXi/8Ga3ipHc0UBBBnpeOczxSE
	+ixgpxJw8xtCYDji5Cqjl9jFcIpJ02uFzeJd+YDVAygC9JsrT0IMRGN04V/r+Hyoxw5HhuL0ZbN
	istZZalxx93pwLshFfsOl8T70Mho64dSQwnS0XfbatcpvwGsHDwhpNbes3ik76Tpz2gdVpulYIb
	prPhFWmGsrR0rq9n8YxOWBCwj3MyDoQNnfIF73oJrmf8MS1A==
X-Received: by 2002:a05:622a:1307:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-50e36e9c0bbmr70244921cf.30.1776468576345;
        Fri, 17 Apr 2026 16:29:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1307:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-50e36e9c0bbmr70244691cf.30.1776468575880;
        Fri, 17 Apr 2026 16:29:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0dbsm812199e87.6.2026.04.17.16.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:29:34 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:29:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
Message-ID: <p3qh7jhkzgw7w7yh27gia2d2ri7ycbgxeiwdalqboq7yyv3cwu@kwqdzv6ldcx4>
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
 <mxawruvb2p6svks3y4rab7feyn4dhkwe6dosjyc6yt2ozdaual@bvvof6rzm3jo>
 <c5d1578d-729d-4c09-b761-c67e6d3be745@oss.qualcomm.com>
 <48bbcc34-f5bf-4ada-8210-b115f72ee850@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48bbcc34-f5bf-4ada-8210-b115f72ee850@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e2c260 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=DHNw6_5qktLrKIcdsVAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: k5UD6SHbFqgCN8Cipp9UnUMO-LX7npJ3
X-Proofpoint-ORIG-GUID: k5UD6SHbFqgCN8Cipp9UnUMO-LX7npJ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMCBTYWx0ZWRfXwVmSExP1FTNK
 t24W3L8FjgY9RSeKOXKZQTcBP2tulUhrmW6dtvaixoo9cDx3uQROGVjYv3dif7ZhJSSidTZFobP
 QYylft/Z9WGH5WwBuxPD1UuZMtb4q3oCzYnxiJi5hyVrD0oXb9X14Z+DY2skoHNjMsQCNtPgL76
 mNhV0aMBfXQ8yDxP5+IWHMdu626S/E0YcwZcvBlg74ojb+HrqxxrWMY9vk1OkQMeSClAU8Bgt2t
 yj9Nc6JyGKrBIx71lHwrlNZ13da1cvGGlghm04D65rg2pOQy+eV4Dpd7s4IbS+6QsDkwbkmeyVJ
 RfIqP3ekftkgWPYDkX7w+nbBua14XNWlkzLz2xHpF04iUZ2cS4aE4Lq5Dnk7k/XG6X2virpx2tp
 uYD+DEApmVOb4Mr8tP/B1Kvedylt+hBvqsGsph0ma+xgIanRFSkpGpwXJzLM7QsYreHLkuslulM
 En0471ZQkU+rV0XkB3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170230
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103576-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4BF6841F2B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 01:24:07PM +0800, Fenglin Wu wrote:
> 
> On 4/2/2026 12:18 PM, Fenglin Wu wrote:
> > 
> > On 4/1/2026 7:22 PM, Dmitry Baryshkov wrote:
> > > On Wed, Apr 01, 2026 at 02:41:24AM -0700, Fenglin Wu wrote:
> > > > PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
> > > > the definition of the channel status register bit fields. Add support
> > > > to handle this difference.
> > > > 
> > > > Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > > > ---
> > > >   drivers/spmi/spmi-pmic-arb.c | 69
> > > > ++++++++++++++++++++++++++++++++++++++------
> > > >   1 file changed, 60 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/spmi/spmi-pmic-arb.c
> > > > b/drivers/spmi/spmi-pmic-arb.c
> > > > index 69f8d456324a..deeaa39bb647 100644
> > > > --- a/drivers/spmi/spmi-pmic-arb.c
> > > > +++ b/drivers/spmi/spmi-pmic-arb.c
> > > > @@ -28,6 +28,7 @@
> > > >   #define PMIC_ARB_VERSION_V5_MIN        0x50000000
> > > >   #define PMIC_ARB_VERSION_V7_MIN        0x70000000
> > > >   #define PMIC_ARB_VERSION_V8_MIN        0x80000000
> > > > +#define PMIC_ARB_VERSION_V8P5_MIN    0x80050000
> > > >   #define PMIC_ARB_INT_EN            0x0004
> > > >     #define PMIC_ARB_FEATURES        0x0004
> > > > @@ -63,11 +64,34 @@
> > > >   #define SPMI_OWNERSHIP_PERIPH2OWNER(X)    ((X) & 0x7)
> > > >     /* Channel Status fields */
> > > > -enum pmic_arb_chnl_status {
> > > > -    PMIC_ARB_STATUS_DONE    = BIT(0),
> > > > -    PMIC_ARB_STATUS_FAILURE    = BIT(1),
> > > > -    PMIC_ARB_STATUS_DENIED    = BIT(2),
> > > > -    PMIC_ARB_STATUS_DROPPED    = BIT(3),
> > > > +struct pmic_arb_chnl_status_mask {
> > > > +    u8    done;
> > > > +    u8    failure;
> > > > +    u8    crc;
> > > > +    u8    parity;
> > > > +    u8    nack;
> > > > +    u8    denied;
> > > > +    u8    dropped;
> > > > +};
> > > > +
> > > > +static const struct pmic_arb_chnl_status_mask chnl_status_mask = {
> > > > +    .done        = BIT(0),
> > > > +    .failure    = BIT(1),
> > > > +    .crc        = 0,
> > > > +    .parity        = 0,
> > > > +    .nack        = 0,
> > > > +    .denied        = BIT(2),
> > > > +    .dropped    = BIT(3),
> > > > +};
> > > > +
> > > > +static const struct pmic_arb_chnl_status_mask
> > > > chnl_status_mask_v8p5 = {
> > > > +    .done        = BIT(0),
> > > > +    .failure    = BIT(1),
> > > > +    .crc        = BIT(2),
> > > > +    .parity        = BIT(3),
> > > > +    .nack        = BIT(4),
> > > > +    .denied        = BIT(5),
> > > > +    .dropped    = BIT(6),
> > > Would it be better to extract generation-specific callback to decode the
> > > error rather than defining the list of masks?
> > 
> > Are you proposing to add a callback in pmic_arb_ver_ops, like
> > '*check_chnl_status', and create separate implementations for PMIC
> > arbiter versions before and after v8.5?
> > 
> > This approach would add more extensive code changes with some code
> > duplication, especially for handling common error bits shared across all
> > versions—even if they only print error messages and return an error
> > code. Is that a concern?
> > 
> > Fenglin
> 
> Hi Dmitry,
> 
> Please let me know if this your preferred way and if you are fine with the
> concern that I mentioned.
> 
> I can come up with this approach and post a new patch.

Sorry.

Yes, a somewhat duplicate code would be better than having a bitfields
where the individual fields will differ from platform to platform.

-- 
With best wishes
Dmitry

