Return-Path: <linux-arm-msm+bounces-101356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JvuLE0kzWlkaQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:57:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFB437BAFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C64D930749AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 13:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD953CBE6E;
	Wed,  1 Apr 2026 13:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P50ugeZ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGtfr8HH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C44543C074
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050809; cv=none; b=bRfYw245XOmmWXu8e/fccMtJIBDwjMh7raMCURr3x0ufq6HxQh0nEnl4Lwgq1rrHPeV0jgJitrAFQXAtn1q0BCf1y4oCxc3S2AA3gccSiTGG0vGTUOexgyh8l8iPkvVkzQOFtPp4TGcvgxnw6HPyUtYFenAXo2NbQEkk3JrZxE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050809; c=relaxed/simple;
	bh=Lg85m4tXxOn0+aHB//mcZAgObaEYf2ZxGTjmLeHnESE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mm6bBISdcTLwp0hvhavCa/LDMxzJjYx9a4DcMUazYXS4W1TMVkaTHC5rdejSBZ65ilyhkszin+7V420PYsLtFnfTY7Z7O5MDit1gJ8g/4tcWZwpmy/DwH9LqZ76ggL0OtN365tXqaf/SYQ9MBMl9wl63sPja77TUcUCc6lviZEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P50ugeZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGtfr8HH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631AeOtT3363200
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 13:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fM6yG3SOaP5F2rQJ4EN2ak+P
	lwQbCFS7X8DdkSKQYIE=; b=P50ugeZ6MBe2eRriqxke+GNGehjiREcJeewAWNgH
	pK1x8ohcCyd/rUHvSq7THuhkWwTFLq/Iu6whJT1nwkw/3Z0EoIrupn015R+NuwWN
	6Nykw2jq103HOFxEIXbBBkolObmQHzW5RssZJQ+VYhkcMIoeIVySh0MPsrvmLeyb
	ZUnpjw6j1JFW/DX/RwF1LIXv1JbFOK3lpRJ9Xd4gteQE8bCW48vmtqdLkKLvLiYy
	4qsuYuZrPjNez4biSKyE1rIBg23K2NWViXk8g1KycKFyaMznh07wDT/GBy2haPro
	M9RYdAfyWYlRQATFzjzWzFVG1gyetca6JIXiP9V9jORHtA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8nddkqe9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 13:40:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4661881eso85825861cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775050807; x=1775655607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fM6yG3SOaP5F2rQJ4EN2ak+PlwQbCFS7X8DdkSKQYIE=;
        b=CGtfr8HHx6XTmEN6p43DfYbD84BMC030w0MKq0csa6bUhMZF3YO6kCRzt5I5HQ2Bg5
         XWprkH3WChbe2F9X7/n9LbPu8mMqu6K8s+oIYshI0zQM3cgD5z3ZPmAYVlyuhuvy1o5v
         HNg6ABgnTdQMqMG9HthMUYPPzV3+GMnTAVFCwPYgEjFzdahwA+hqajB+VBeOQU7uJOvS
         aDwX/QaB7eJ4XX99w+wk3I3puyBeHKYS6rb9SLnNacn2mHVXOIoL+sPKw/kf8JwpmpSt
         URnHXfwHDX/Fj8oEB71ScQnteazB6J2XGGf6ZUhQWdOrGu6iAhm3FhfZvppL66v5UcCf
         jifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050807; x=1775655607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fM6yG3SOaP5F2rQJ4EN2ak+PlwQbCFS7X8DdkSKQYIE=;
        b=WWjR350jy5piKg/LFB1yY2sP1tWvqSlVdqfVG/XMtEelA0RKO23K6W6oSv2lhjpGnR
         8L6yeDJvipz2qofXFBptOugSL5JgiNi0MT/KiCYL5rri/xoFoXvuCoDkLfeUX97xbp60
         k/L8AvmEP5R2vK/k+3/w6Z0Fx19MuC/H9Q0s+skaks6HmlFSmZ6j0wojrPV/F2zMWkHs
         loue9h/BMML9JxH9+7i9lNI6UGETh9asvZWtAcK4Xv98xPQYQtWa2ThY8Xf32xAPVN8X
         /mN9ZhDOisghbv/2ci9tJQimZJLOghSSTS8DWEJ0KKvmvlQJUOidFiti6EzxitGoGxcu
         9QOA==
X-Forwarded-Encrypted: i=1; AJvYcCUS35QsR3PEOGBepEoTemlzW5aojyHezg2Q7t2vB3eKsJrlKSsJMD8KMmVMpOD1E1/zHP36acw/iDHqAQfG@vger.kernel.org
X-Gm-Message-State: AOJu0YwMu3tMbZqoK4egTdl+14+94tBK1QGHzvgOjPZJPEYwZgqWmbrb
	u+RIIlrEKajV0Bg4l82Irr/pD+inTVjszo4XK4nG6P8ubE8TLRNFGHHJVmFcCMTdC7EOhra6cC7
	eV1CSbMNvAQtLcDTZedazi9+GdXuW1jA2BSZZlLRGJCzbLx3b+SoC4FMUToCtyzhj/cb2
X-Gm-Gg: ATEYQzwV+xhb/+IBQrrc6PHg1vnkXhJb2xzVg6paI8PT97I1cdSXwRgLD6zJ/Dy7GQm
	yMA83XEyBhedBhNtgAeWf+8/ad5m5VQReh4ZAuM6pOFsv85kRwc5eIbqES4FwNsQqfsKOHiP1pO
	NPZ+4DqtLD72ONY5c5wu5hqAvZj1PTTcjHV9rP0PXXLKwwrOG3EUbWgPSQhXe90TmMxskO7+5Kj
	eoI/8ktRQVymRDVxTbsDQL1XT/cWUIV3jHlyHAwME1ySN1/wOWb079t1sD38FB+J++Xih/rYHCv
	6fa5IBLgm5YEru+EAvjiTzk4QveI3JNskLtitT8rU+DmgCJ85yGlEgjeIPaoJQ57+E698tx1p5k
	pEfyXLStyii2vSU96jP4wxg34mU732RptOwmHIrcfEWdXONZ4IAxpGLFAyfPCDwegmcDc3N/NEE
	jKd1EcssItyAItqNbk4aygtDqgo5E99aFD4Ao=
X-Received: by 2002:a05:622a:a0b:b0:50b:3d1e:58ba with SMTP id d75a77b69052e-50d3bbf72a5mr46841441cf.28.1775050806472;
        Wed, 01 Apr 2026 06:40:06 -0700 (PDT)
X-Received: by 2002:a05:622a:a0b:b0:50b:3d1e:58ba with SMTP id d75a77b69052e-50d3bbf72a5mr46840671cf.28.1775050805835;
        Wed, 01 Apr 2026 06:40:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c419b631sm495441e87.52.2026.04.01.06.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 06:40:04 -0700 (PDT)
Date: Wed, 1 Apr 2026 16:40:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v7 05/15] arm64: dts: qcom: sdm845-lg-common: Enable qups
 and their dma controllers
Message-ID: <pnnm7beyy7ef7buy7kdg4prqnuuv2rrxb7xxv2aemcw3x7tqbo@kx7ndapf6ub3>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
 <20260331-judyln-dts-v7-5-87217b15fefb@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-judyln-dts-v7-5-87217b15fefb@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=ZfUQ98VA c=1 sm=1 tr=0 ts=69cd2037 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Gbw9aFdXAAAA:8
 a=EUspDBNiAAAA:8 a=4a3UZYCyxYPj_-8OAHwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 7CqeyTNS0OfEgydB5Y1d95v-5K9Ie0Hq
X-Proofpoint-ORIG-GUID: 7CqeyTNS0OfEgydB5Y1d95v-5K9Ie0Hq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyNiBTYWx0ZWRfX+5Tu+6vtkStY
 tX/d7zLGQ0CWj6UchP5vtmqrWjJT/raRTmNeP9BSdV1p5NEAx6CG5RxF5HYi2nQP3mGnxJBoAF4
 3EYWEL29ielQ+4gy0abigNh0mKsOA6hi3zcGl9JM/HrSM5keNvmvLsTy/b6bXc+aJ1uRY07C4Zu
 V1hcDXRIdh3u3phoYcPIZoig4cPZ7BNgTQqY+QQsR0MTaekTR8Yx7KBX83tKbGXweTv35QQQojS
 fT0HFbOvjcGoh/FG+idaKr96mYyiLEQYG5WlR0pbW44mLxy7eyFccOBu9Yqz4yn+2n74bbBCEVb
 xCKiJJ3QZfAcpqA6TxQv43OPoguff0kusPJp0sVSDe3j3m5u6F06b0cYXcgSj3k/jtPQZ7TVYFJ
 zqlyDEpcLS+rxWcAxzPq/N1BaiCce9wJaob5SCfQualx5bLfg554jM1OhiBUASt8SZErXHwgAL+
 Y5pL7jX1fWpGhkeLI7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010126
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-101356-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DFFB437BAFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 08:15:10PM -0700, Paul Sajna wrote:
> Qualcomm serial communicators required for i2c, serial, and spi
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

