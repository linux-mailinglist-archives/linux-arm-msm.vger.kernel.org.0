Return-Path: <linux-arm-msm+bounces-97175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GALlLa2ismnwOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:25:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B021270DDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B12AC30EAB47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FA13B7769;
	Thu, 12 Mar 2026 11:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S5jOdZjP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eewqqH1y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BBC3B7B6C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314641; cv=none; b=moKQcUuptECjPperQLnhf91CKCTk28cb0QqFNp122fJ6Y6gXc5/Q7nAXVxDVRVyQDqFmX82zy8Y09Lxa2J7WZ2P+bha6XBVA+lMRuxS+yOsiPQZDL9bEC1SMgxjvb4f3drccPN3tPGJLSLN1cJFW/xMluX5MSEDfayzPwKA8BHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314641; c=relaxed/simple;
	bh=8WtMuG9HhwlWuEd7m6uU9JzaJCnso9USDOfysbX6NT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUCqk2sOERJ0amsBODcnsDuojKNlh6b2i5hQrnqRtfdkpqcpNCff0BYItZO5/ezKwJi7f1wPjBPm+vs0CDkjVhQ+sorCFcQL4S5KSNZ/kw2hVXF4Um0njF7IJ6LNsgz+/C74ECk8XUACaSeApAEhpvIMgtMXsrXHTiqFvCQRpZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5jOdZjP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eewqqH1y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C2bhpJ1740058
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDZsmUgPgmCRkU6O7+g5TUfj
	tzfRO7LzoRuw6/d7OPU=; b=S5jOdZjPauM9z8SREhIlkxPD8vsbwC9qTQ1eGFyn
	XPaAQ/NvBb2SbVnylA+7MxdN1tpxpYf8Py64199eNt+ReSK2xRV9ihKN1x5u+iKy
	Ziyw/Ak/bcUyFglhuA4+VaHw2qZ9oDtkLS1cTw0qtq+mGYuGerOCXbqPSpQqd/8H
	RPndctAX+FWI/2hgwFChs3VYtJEicVtHCd8JeutwczrezqJWLEev1FhQVccAgNEC
	sAJ/Y3urduzuJeSXyLcsKP5kAhQAwZZRXKjRO01fa0dMljeNLe2LRWm7suWtScMw
	mreq897WAm0ibIdySI4cnvPn/ZDaDhDRbmI0RgboraV5GQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdh989-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:23:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd39bso700806085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 04:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773314638; x=1773919438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDZsmUgPgmCRkU6O7+g5TUfjtzfRO7LzoRuw6/d7OPU=;
        b=eewqqH1ysT4cZr8JS6H4M4lsQbSRaPN561ozWHx4WOr5gqc4dgHbWElbEAGPf00Con
         SpcUqIanb3ms/OwSlKBVqPX//7yAHs5b8TN3FJytA5ALATeqMK9gP3SitX15tJ9DPzcX
         Mc8EyiZT6MBKcTbpaL1ag8ps3v+0+n3CbYNPzy8mTNbIvfBKRle99u/Tj2xlz9etTRmd
         AEIsGbdJA0cZIEFXTEXYbqyx6bXq9WwwO4RJCqN5rQpqhaXhN1heit7IyIo3PyMVwqng
         vXan+gJsXc8LypHtyP+XnO9oPURani1XCAdBEli1B9dyLevLo+hquonxm8jQN0uzENpD
         FgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314638; x=1773919438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDZsmUgPgmCRkU6O7+g5TUfjtzfRO7LzoRuw6/d7OPU=;
        b=ej7eiicBBROmiHs+CGFPka+HXn8cMgC1o9Di6o7W8HIKGLVsXa3qt2DBLBXRH9spVx
         4AlxMgOYyKy+YQxAoCn2qxNUM8Om8rWUK6xVlJlgWpUbEgtBIwJxvoC9slhHjzbGmo+z
         qLKPLp7cYL3Ouo/gfrQPx5Qd/m5NHZQLDSe34kJaHESbI/WFKkFsUdfr5J4M6FnWVEmu
         M/VH71elzEZmG5Dv00L5jQ3dmTcyfYWp9Dqo66IZa5uFxguVY9Bk5eL4PQufZ2ajv/69
         3lNkGLG19UFbAbwGbGi9RgJHwFZIodrgCbpez/3Z4bAEqNlpjmT0RumG2JzlLpQSWCBF
         EpAw==
X-Forwarded-Encrypted: i=1; AJvYcCVptzEUieX1r+lmEzr1Ktn0nuqfqSYeoVj+WoJ76Z96BT79dRSMgAbfm6nvhBF1mFN8iU91wxEFB+MbjL0c@vger.kernel.org
X-Gm-Message-State: AOJu0YwqqQgL5i7+SG8zmbiIX2ZUEKkPAG/I93zC9kF9elixbjfSoug9
	lws36tV5s4A3HWSe2RYSP0YqChSP0SRjsxnH5odZFymjbjRepqmuEow872PCJgLcfZFb3qngpes
	8VYig8GsH8WKPh+4zctsx9KS5ghnP0OKmY7Q2gdeH/r4H4F0w4T1okYvcy5zj1MgpP5+0
X-Gm-Gg: ATEYQzxVpDQVJN7T3r8tE8m7U6nS1K+W5GQ915oyyauIkzFr75PtIEZMVq6ux6RW+5V
	kPsjlqOVMt45eY8d2ZSlcwleLlHBLelP/5Yeei7mjmBUty/FL4hH1Tzidlv6fQWfmqT/CS8c4+5
	0PpZIQcI4mB//cVvnbhWijf3c96v8ivsr+IgkYEx3exJRfQSdBBfOehYP4yys5m06JMCIr2DBm+
	TM/E/0ntwyUhmhJC02ZXU3+vxi2yzGnHITqCQ0LjlfBVQPQsuNHLO+cxD50/snofzf8FrDkbz8J
	+O+xgzG6/DhWHUbC8rJvQEvpHmnjW/Abc99xrftWjjvcb4wRN9sbHNOysw0bQFd1JwWSaDPHZdk
	5ZeTrddpiKzEC7JpOGE+FRUJuJfbEva06kA==
X-Received: by 2002:a05:620a:487:b0:8cd:a76d:630a with SMTP id af79cd13be357-8cda76d66a5mr426250085a.42.1773314638096;
        Thu, 12 Mar 2026 04:23:58 -0700 (PDT)
X-Received: by 2002:a05:620a:487:b0:8cd:a76d:630a with SMTP id af79cd13be357-8cda76d66a5mr426246985a.42.1773314637522;
        Thu, 12 Mar 2026 04:23:57 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm279697265e9.9.2026.03.12.04.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:23:52 -0700 (PDT)
Date: Thu, 12 Mar 2026 13:23:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v6 5/6] clk: qcom: Add support for Global clock
 controller on Eliza
Message-ID: <y3h6ufq53g2ml5xjupd4q3t6btkw4jab6wao4pnhrocjr35rfo@rdzi2x3p2h44>
References: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
 <20260311-eliza-clocks-v6-5-453c4cf657a2@oss.qualcomm.com>
 <abHZ8Y3NmsNj3IXR@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abHZ8Y3NmsNj3IXR@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA4OSBTYWx0ZWRfXz4dHR7YTgOtW
 WnV6DLmaVrQub/iYEum6XSCtReSkd5WSRy50UgLm/lv3/iez+u6GTo2t16114dsXfhP2S2h1v8n
 5ELqwk49h2la4jBVPHadp8JUZ2qu5Q6QWITlQvtNKThOpAghLlTV0egCj1q3JJ6FXAr3eaDVAIN
 u8nYwHvVlui7m3QjVAYfJ/k75/A3yITNEGixfbXMe8eXBL3ryPi7FCE2XGRDM7u97KyIPQviupw
 iPEsPV9zvQ96CEsKUSCSVn1pUBuQ84NlPOW/xBqnUZPCXf/Hn7qS4xQo+pTQ/6DG7Yj84bYKGqo
 wyA+VPWIVjVxQGqBBFzDmSVFeyhOW1HxQBDKvQxz5wko+Ugv7NdSwXwdEAPDQXtp05HwkxnFlOF
 p7se7qe+EEMJxwEjh75VPS18oagdKAyDh4eqDU0JcaUPDS575uY2+L3QFl9Y4mqMjgdkJTKSmJ/
 nvNinRnCm4kqf+bU2TA==
X-Proofpoint-GUID: XlXT8V6J2HsHD2TDmUAlFBdNtkoKclnw
X-Proofpoint-ORIG-GUID: XlXT8V6J2HsHD2TDmUAlFBdNtkoKclnw
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b2a24e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=jjayl0T0PnkqsG75a-cA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120089
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
	TAGGED_FROM(0.00)[bounces-97175-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: 5B021270DDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-11 16:11:19, Bjorn Andersson wrote:
> On Wed, Mar 11, 2026 at 04:46:35PM +0200, Abel Vesa wrote:
> > diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
> [..]
> > +static const struct qcom_cc_desc gcc_eliza_desc = {
> > +	.config = &gcc_eliza_regmap_config,
> > +	.clks = gcc_eliza_clocks,
> > +	.num_clks = ARRAY_SIZE(gcc_eliza_clocks),
> > +	.resets = gcc_eliza_resets,
> > +	.num_resets = ARRAY_SIZE(gcc_eliza_resets),
> > +	.gdscs = gcc_eliza_gdscs,
> > +	.num_gdscs = ARRAY_SIZE(gcc_eliza_gdscs),
> > +	.driver_data = &gcc_eliza_driver_data,
> 
> Don't we want a use_rpm here?
> 
> I merged this for now, please send an incremental patch, and please fix
> the tool that is used to generate these patches.

Sure. Will do.

Thanks.

