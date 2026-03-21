Return-Path: <linux-arm-msm+bounces-98989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIxPO3NCvmmhKwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:02:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C412E3E4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01CE8301CCB4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 07:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6300309F09;
	Sat, 21 Mar 2026 07:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0ULBMtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MeZvsQrC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691642BE05E
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076525; cv=none; b=kbldSrKG7D4JesYKePqZ3JcuxV6N/+3BgopeQjjGc5pOT2zCW/MI4kBAqwZC5l6Cj2+dh6MeiFv4+baY2HyOr8K6wCht6wp0eMOe8GZF4sEHjGMoaccYS4iNyn/e7/bxs6QpcSMuz6n+tHlAn4ng9hJM3NJDAR2pQPg/5kcfWzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076525; c=relaxed/simple;
	bh=5u02XgnLOl1nM9VIRGqhIO5H60GCoTiXnFrL90a7cFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0hfKsz9Pz6qFUUUo6+y90bynea8rOdqKpY0oT3aXnodow8DlUrWwrFRXuXpFBbxgWPWO/7G7fF0AmWl0tn1+7N99oH2zZ5v6sLJOxx98rVoEmeh4MiQR9kmlIQaPmcjlRBR6P7Y+ZAEft3cNbNynNAHmefFG125bE2RtwAGzE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0ULBMtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MeZvsQrC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L3jqUH355071
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 07:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F1+zN2bFuHDO4Dnbjwp7azYL
	oYdf87yVpewfEpXF2C8=; b=S0ULBMtmBntl+XYfrJX6oPnZULRmPPBlJZb1IweZ
	tRfk3xgyBHWdBz8ZkWKzKmzCm2zSacaUgA+lc13AZvsI3xgROAnbX5s/2G74dAzn
	0y5g0RkdAHDCa+9MQdsJeAH+Z9nnCl++VzStYZ1/jDkNa8s+PpRmgU3adcSNpriQ
	O7V27AjPuUNPObPTeHfWMtCxmbsHJnTfr87Z9bV5aI5848YYZ2bfecUXN6mgwMxO
	Vso7d4kAGYRB+Rxcw6IfAnsYb4PDVcnYyBvGNKJ8NGUuInNTWkFDbt8riyUfAecb
	RFNodmrq8PqNjcGArH0c6PJ/JDW7yTWnuUxhC6lhcIGj3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5r7s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 07:02:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b380cd5e3so107442561cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 00:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774076523; x=1774681323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F1+zN2bFuHDO4Dnbjwp7azYLoYdf87yVpewfEpXF2C8=;
        b=MeZvsQrCGM4479/Wdlx+cNltCGS8U9ooWrmQEfIgcPMN4XFy/cBYMzRVr8bv/OC1Gt
         L8cRD7CFmw1amxUcdNiGT8btfzMvMoVSI9ULWotbH7Ta2I/zrfdnvW1HDTfKdbsCUGq/
         xdeRbl6QQJmjkHysishdL69Gj/msqL+dCWWoEmnTGmtPNSZh1u3Xq6kuFJGFoiV6/Ztk
         S9RxwsbTiWwn5dw2/Br9U8rSUDx7xX3hAJdPdqEIeHYg9u9tiVgYypxhjUcwwzFvegve
         ksier8LX7yp9WHFrm9GMSHSkYXT/acr8TZ2yU+aLxh6czHTURGLuUaL4jsm0r9rifN15
         DsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076523; x=1774681323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1+zN2bFuHDO4Dnbjwp7azYLoYdf87yVpewfEpXF2C8=;
        b=QK2T6cY5Scon28Y1ViL8gyLJ1KEBi5CGDnboonAjUkoB/uiyGnkSxllzj+P7yjJdAJ
         EUyTqlMS+YWMW248fTs3jtuOuATzVihsdO5XOw4F0v0m3PuTo/SqW1/Dpe1rAio5h7lW
         eFPk4ijJxD+kfdAPtTrOX4G1se50a5c6cNPRY1ugHVUwfpCDLwhKOUnbFNgwOCpEFiW5
         NqDQF89egyARUwlZEl9o7c1OhQnqVYj3g1M01RC8P6fkitrT43Ybj6GI9dAGDVHgStjR
         wFkhNynT/I2X6hk5qY0nrzqQw2CdQyrd9+uxwtXvYc1DUuUZ+ZSDf+rfqvzSJsdMYi07
         RQVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEFWwtbuhvgbx1xwbpuQnHnIxoFZuVbNlGr/XhCaTXtpvafYkhePrNQibwjcUvSXJRKkfYHDwYJhf7Ifz8@vger.kernel.org
X-Gm-Message-State: AOJu0YyV56EfIX9huC/9lH6+0d45CajCL3Mlnv5CZXwBX0XmieV8z1De
	eMueio3uxe1ByLjO4dgoiFGossWKvWaV4GVprVHxzMqBuda/1e/hP1XNwkycLrtfKe0eHxfO48U
	0dxk4lX4AZj/1AegdYaa1rI4rK0D+cwkIwLsKOXnTt7KEJMevkXAISf4GGqTprhVZfP7R
X-Gm-Gg: ATEYQzz20ZQK3ELHulaSl1gqseXl5LkLCH8LYanAVLGmb5Es++Aan0T4FarAjWqer27
	ZvS/C9dQ7XGmaI2c5LFAqPSInBRwKoQM3Dl80oSPmFSv03/GFihWJNfwa2DJctEadsrV4MM17hg
	tkCmC2/ejFE4hyMtK5/GfCdTlIkKumTTY5z71efb7urGFju7nDJ4LM1WgfTWgwtK4q6j0R1wRJW
	ReLBZshrdPlnmiZAedyetwLNqPiNyXT98LjPwoEclvlV6/OgV44tJup0XXtTHW5IiUQoWitVOtz
	H8Qsg40aYHba9GkgiglRdVwlR1zj4sXm5Ecc530Zf2IIEcWJPVl9GlweyqWxb+YB3YvptNW2ANx
	9mcjOpBUFCzfmaUjeEcj2RhTATl55ZDqIIn8LyNHVGIob9sQT/ufoB2mhjvNLKJMf9nVXa4F+ce
	fBCRgroDYgE9E3mVSy3TuNx1+Dh1VPDh3Po1Q=
X-Received: by 2002:ac8:5905:0:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50b375e6175mr86368861cf.67.1774076522885;
        Sat, 21 Mar 2026 00:02:02 -0700 (PDT)
X-Received: by 2002:ac8:5905:0:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50b375e6175mr86368551cf.67.1774076522385;
        Sat, 21 Mar 2026 00:02:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530bd3dsm988211e87.73.2026.03.21.00.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:02:00 -0700 (PDT)
Date: Sat, 21 Mar 2026 09:01:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>, linux-arm-msm@vger.kernel.org,
        Petr Hodina <phodina@protonmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Set higher
 touchscreen i2c clock
Message-ID: <gdwkcwne5amodws3kh7jspcrvf56fivj5c7per5m2vhfwbcb4l@kd665sd2yjy7>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69be426b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=jB8_oC6jW5EHyFLWiXQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA1NSBTYWx0ZWRfXy9k83zCrOLKf
 5GC1NNTL86nlRima8eqlWQTxscYVyBWGE2VEUjIIsXpGJaoSgBYKP8XpnkEE6Ck/QOM6B1Eord8
 NkroASU3xQRRn2pCiorkKwi336lcZlzs08n5VdlKk4MrJd1e4pOrioSz1nbjV8Jor+jScHpwjOR
 SjeAPc0tBg1oTg7jiDJ5RYxnBqGq4789tICtqJcZEd/u11YGWS8Ky9p4NA+q7Vp9qADSR2ViInj
 Ee6QIh9/NbaHkk4lwLniFM52Mfmp1DKcr/NaOvOx7l/zAso1j7vT+eJEQjXeE4eLHmPbPuaVR6y
 iS6KPprnDIM+M86SbpkX+AT831uQ06TSZFOkEVuQolFvDmvS0CR3ye0hOhwRkA5vjIBEgdNZpiM
 7/AL3U9xx2dXeBgM/RoyYZhKC9MODjdAF6H8sSZkt3V3IdtslH7FBSxu8E7/wO2gCXxb6ROysBi
 tjvir62LwgeFRIs3ugQ==
X-Proofpoint-ORIG-GUID: wKYuk_vPnmg062ESDFMhdURkRwNNLIPg
X-Proofpoint-GUID: wKYuk_vPnmg062ESDFMhdURkRwNNLIPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603210055
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98989-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,dylanvanassche.be,vger.kernel.org,protonmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95C412E3E4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 05:29:06PM +0100, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Sets a higher rate than the default for good responsiveness of
> touchscreen.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

