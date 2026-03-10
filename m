Return-Path: <linux-arm-msm+bounces-96781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMLfCHibsGnwlAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 23:30:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C55F258E8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 23:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F11493018F27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 22:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C88D3AB26A;
	Tue, 10 Mar 2026 22:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAL6wTjo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0OKDDfM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44FF40DFAA
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773181813; cv=none; b=pPlg8NPnh15D6B+8+YiycQxYbGsXflVV/P0YhIJM5+TPGtp9PLsmYfK1714yA77fzk384XmMWPMd8eU9lJ6tRuQfaII3x/jwQRGGH6qiu1cJJlQBqH7pUq541ylTmRovYWMwux4RagyuOEbkWVvuSLvrvEFw6H7aIG2fXLJazR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773181813; c=relaxed/simple;
	bh=E+MzsQ/XNb5YDD8Kdpz85uaBf83jdRYE/spDSsi/7S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqZyGK3KkUT55i8sIwGKqHbWHxJTKujNlb6lmWfQceatNEtb/gt+Fc17chuDqk6SYKE9PyV+JHmcYBaMrPVy+O668PkA2fr/ymnEcpQHbJVJrZSEcqNA6XD8lQIUYbartT/65t4oVZzNJlPGj4gZxOi9sQVzg5wKDPykjZ08Waw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAL6wTjo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0OKDDfM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AId2A43760401
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qxVdbmYtQiHkpJysUmcujS2L
	t7a1GevGxB0GGYw6iIk=; b=YAL6wTjoxJVvY5pZxsjYm42FCvyIvWImTyIkPgOL
	33sUiwqcons5/Ad528nBUbny8vmSWCntELSotWgMOgXyzChTm5VX69SpQjOlGRxw
	PJ/9tlOoGgk4qehz6lPy+8Lqe/vWSraC0qgKmJAh+Dnuww+S+TanpI6wNYogfDdI
	VMEwgyONIY/VB8pMhXV0QOVTjtDNmaFwOukIcPb2cIKKVrnIiMuyfkzKRO3jSHOa
	9aLnCLfBDwklkSINYtFfSf2gCSL4VToHDYkaw5Lzdncdp2//0W0RuWRSxbDdGOuW
	IeDSoBq71cr9wDEdlFV8i+iiGzr6ENnXqFIrv3Savivvdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8uj9k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:30:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7c4ab845so1420059185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773181811; x=1773786611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qxVdbmYtQiHkpJysUmcujS2Lt7a1GevGxB0GGYw6iIk=;
        b=T0OKDDfMw2SNeQgT6dkfRj4ayl1yEsqbB8iZxXUFG00bnTsgybAUtNop+TlduvJgnt
         f2hVyYyJyGHgY0+b2SEwAC0/1EEA2QnDqSqgeCUUraVFGScpMcm/srb8Z3h2nuLu9qet
         LHWfB4qvl9jkoB4tAtGPKyzYXoH1QRNQwpUMBGP6z8OBGOcSZTjvwE/SHadEbstCEC38
         qMYaBnpQbYbzPpdUYAVsFqDkwS/enBOziC+NuLPrNuqWJGxr3F/4fEH1iEL5ih4W93zK
         CM1gzeJJrTFxbMj4PwtXFpvh3ra1mnz8Fv3UQic2cLcxyyO9DENT8zH7Kw9M98ivNyUn
         Eltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773181811; x=1773786611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxVdbmYtQiHkpJysUmcujS2Lt7a1GevGxB0GGYw6iIk=;
        b=cEtjHG8I5nvhaGOTYvDcaJQC104S9kCGn3lmr/TnVVETR1LrDuKS3BgjZZvtddwECC
         0uwYI3ubzuRiDe3CH16/jXx7VQbCFnv5eq4eBd9tCdV0nDrjlW9hCF/Ut/5P7cSWEJQt
         uDy78Z5DUAYKg3ciMWsy7G+fuBJd8LEdy0ddaZ39vN0lWBq1wpmJtDMHyHLAkIJui6c3
         1ywCXo2og048yZwK2aWr0HFqwopfFNj71xAevv4cz3aqQewQ9VoYfhzYsf4xhlaQr21y
         t8Ud3uXv+bLXNuVmeigduZwGWck1fU8uX9RHJT71iuoqIvlSL638+wVIl4fqGiUWYvzH
         Cvbw==
X-Forwarded-Encrypted: i=1; AJvYcCXMQN0rPv7SNWUUaLKEOwyC8UjjzOjid0H79S5TZXZFFdGt9U8eFCmuWvnNVNng8O3PEoaY5eaTOfF/IdJZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yze3yAn6rWqgesGSvKENS1UNb3BUGBDD3z0fPrU14JmqJ/jxIlF
	3EXXeavlMbnakL/6/3AcUPi1NZXhxKQ54UkJVIdBqJ6mt+iz3lMlvMH+0zira4J1qM8OZyk9Mcp
	L0HzafrrJ61JRScMFdzx6o2xQ7hloSQQYCeslGCBZOLuo3IV9kyX7GVUs7vBQAM/xYhZf
X-Gm-Gg: ATEYQzzG1+b4VgBtPae6jkjIB33HuRTwSeGYSzRUg07MnYL81vlyeKyBRBoReOwEZ/p
	bD+K/ySPvO3id/YHpKN6N2wBYrYY4lMKFY8ByAbN7zdF81ESswwGj6Xx41FHxS5+paICbS6d2AL
	eQabDSItG4/8d0k19+NhCZs4JjwsMZJ7wNc0YP6McooZ+7uyx7Ck/Cr/xTKp+7HCz5XHcK1bito
	93FY8izbD7OGT/F/7AytSaq4aJGFELFTqbsLn9QrfFr4CmcvB8g0nil3BOpNrbyLlaU2cCi0q90
	QNhspkl7SgKLATM6oOYorbq/0Ki3XArdVWMHhVCgCIYN2HSERsjsyQWMHYq1maR9Ev5Sqx0CJs9
	XQHXzTkQgp72O8I8CWIVCKNiof5iely0Y8ezQXP9evMX8HCEIhqea26GjFdW59KLFh0tv7+Uz6J
	GkAfZjqQPBlLxQcW2XisCA5M6aYt4GqMtyG4Y=
X-Received: by 2002:a05:620a:44c4:b0:8cb:4fe7:4c8b with SMTP id af79cd13be357-8cda1a5714dmr74184185a.62.1773181811091;
        Tue, 10 Mar 2026 15:30:11 -0700 (PDT)
X-Received: by 2002:a05:620a:44c4:b0:8cb:4fe7:4c8b with SMTP id af79cd13be357-8cda1a5714dmr74172585a.62.1773181810106;
        Tue, 10 Mar 2026 15:30:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e646sm74637e87.31.2026.03.10.15.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 15:30:08 -0700 (PDT)
Date: Wed, 11 Mar 2026 00:30:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Message-ID: <e6m5xhnexza6fnmz6cczwsrp3ec6n643yjukj64gvync627sl3@2pldnf7ldcpi>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com>
 <ne3i5tmvperssm4pivae7jhmqzvyy7ftkwnacpaf4ukdqojtha@53mhrxlraw3k>
 <f309905e-6f7f-440e-b463-7bda54298164@oss.qualcomm.com>
 <BP1Sd6YH7pfwUcIQzlAHRokbTdR0TiORnTMO27J1CcPV_O1R1HO85gyIJf_J1szOiMAXn2taMlmC2iUt0Cpr4jKjB7wTeukWuIBFzj5eBdU=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BP1Sd6YH7pfwUcIQzlAHRokbTdR0TiORnTMO27J1CcPV_O1R1HO85gyIJf_J1szOiMAXn2taMlmC2iUt0Cpr4jKjB7wTeukWuIBFzj5eBdU=@protonmail.com>
X-Proofpoint-ORIG-GUID: vD-tUqBDc7-3UT4MeEO73aCzMt8muQDA
X-Proofpoint-GUID: vD-tUqBDc7-3UT4MeEO73aCzMt8muQDA
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b09b74 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=sfOm8-O8AAAA:8 a=XOktAL3nDL9lPePKX28A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE5MiBTYWx0ZWRfX788uoVbjFWTd
 jdPq061s1tvIfJU0KcHXtc5rUuXj30Hj6XbCoOzd+NiWWj84kLTVDBofJdtm2dIIOFXQxMe7evQ
 bqNLnqEc3sUpHGPKW8OZ9mOJGcCRW/MMrRi98iRg59D1+PDVCG2zEk1mhT+IQ5JJU9K2X+t0jLG
 DcPgMe2uApainZzF6rl7wvYMflC5YM5Y+SbMn/NiWYi9Ui2Wek9m1GtGGlwFXpMNCXgvuUS1vPv
 Wy4zzGwW2QnrMLVQgj0tvaHyVtGyJyx0R7VlAZwa3K6FEpoSEcEb0tOR0BvhfV2E9g14ZaF2Kzd
 CJ91c3LkPAwQbdU/DlvRIB+OEm7CrxLp/H/1NDv8+p73Aoj2qMYbCIthxKzQnJAz+ValZVnXahf
 62dd51sHo59slpIo6Dawf+WgWr4kVOWDHZMT6/XsOQCqvtq+UvcQbMbxeeLlAtZ8Ws1i8pWjrqJ
 T9JmLltQzwYhZLM7MHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100192
X-Rspamd-Queue-Id: 8C55F258E8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96781-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,protonmail.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 04:42:43PM +0000, cristian_ci wrote:
> On Tuesday, March 10th, 2026 at 12:28, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
> > On 3/8/26 4:01 PM, Dmitry Baryshkov wrote:
> > > On Sun, Mar 08, 2026 at 04:52:43PM +0100, Cristian Cozzolino via B4 Relay wrote:
> > >> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > >>
> > >> Add the description for the display panel found on this phone.
> > >> And with this done we can also enable the GPU and set the zap shader
> > >> firmware path.
> > >>
> > >> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > >> ---
> > >>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 80 ++++++++++++++++++++++
> > >>  1 file changed, 80 insertions(+)
> > >>
> > >> +
> > >> +&mdss_dsi0 {
> > >> +	vdda-supply = <&pm8953_s3>;
> > >> +	vddio-supply = <&pm8953_l6>;
> > >> +
> > >> +	pinctrl-0 = <&mdss_default>;
> > >> +	pinctrl-1 = <&mdss_sleep>;
> > >> +	pinctrl-names = "default", "sleep";
> > >
> > > It might be better to move pinctrl nodes to the panel device, because
> > > they control the panel reset pin (rather than some kind if DSI-related
> > > pin).
> > 
> > +1, perhaps let's rename that pin to panel_reset while at it
> 
> So, something like (plus related renaming in tlmm node):
> 
> 	panel: panel@0 {
> 		compatible = "novatek,nt35532";
> 		reg = <0>;
> 
> 		backlight = <&pmi8950_wled>;
> 		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> 		vsp-supply = <&lab>;
> 		vsn-supply = <&ibb>;
> 
> 		pinctrl-0 = <&panel_default>;
> 		pinctrl-1 = <&panel_reset>;
> 		pinctrl-names = "default", "reset";

No, "reset" would not be recognized. Use "sleep" as before.

> 
> 		port {
> 			panel_in: endpoint {
> 				remote-endpoint = <&mdss_dsi0_out>;
> 			};
> 		};
> 	};
>  
> this?
> 
> > Konrad
> > 
> 
> Regards

-- 
With best wishes
Dmitry

