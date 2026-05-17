Return-Path: <linux-arm-msm+bounces-108030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fLFrBratCWrAkwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 13:59:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D042560DF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 13:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06720300A12D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 11:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110BD363096;
	Sun, 17 May 2026 11:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCMMVceB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SSVTB+Gt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F1B3064AE
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779019182; cv=none; b=gxD4ewWMXtkY53kRqRuKlU8wV0BbaohHVNLeBDdjkN07xoaCn5bbI4hrhKVpzbVrGQZvhuZZ5JGeswzAcm+5r79tdJm58DelEf15JaqeZypqlVXghhl2/o0wbRNJYquD5T3NVUOadfLrpw2Zsk4R+yGp6xtQRTqn8yzpEsP3g6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779019182; c=relaxed/simple;
	bh=uwcAosqgeuh/Ws6oeipHKBE9NRJcqMoNk+g2JvGoW4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5Rrv3x2uHLoqZ+KcDb8HtVusjiJ5Pm/TC1vga7Akf/jeDIlIUKN4Dvdh5tfwapjigyOQQbYB40koog0/7k0aLz0MzVAwhKaWOkPaj3jeW7Z5z8HAZWDeybjxUelWieFWful7VG86cXEEGgcfuyGyPCa9yyBRdxrgpMy9+aTf84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCMMVceB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SSVTB+Gt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HANRdH1888240
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=If2VTiwv89luQR2PmL2+TW4D
	swboSIiiteX2/ZQl/m8=; b=gCMMVceB2mNUoUVgavly643igLSb0diRz+I/5fG/
	yeyEUfH+7xIe63WEAAOXYKMG5oztK9rIF3qAcFJucuXK0dUjL/IPjYsolSOJSuhh
	dD7qkD6Sej3ZDU9hGqMgRGzfmFqbK8mmtjbxodB6RJL+hBBtFZT1Z54yh4JCIi6g
	vMj0MtaSuhXgCWGevgIXn1mxZDM8gsyb8/k8v9Vl0XJGjERKwOB/wKXhF6NHryXJ
	LdQ9h+19UtuoBiwaP01lLJZjBVFdz8yClM2JcRSbGMhQTCaLG7X6kEnzOU435MsF
	cxLo/xkPPQiOhjhdsIKWlFd2RVh0jIXRFSwHlq2SeS2v1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gwmasg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:59:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso35792801cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 04:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779019179; x=1779623979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=If2VTiwv89luQR2PmL2+TW4DswboSIiiteX2/ZQl/m8=;
        b=SSVTB+Gt7uOyfDkKdLUok4S4JBWIaoQChoie6nJRjPk1eVt53mCl1wdtQRAoxON+z/
         5wRDy7Ej3MX2+6ciBMfgf/GbIntA04NWhx3dMbTOvubRrYoAepKa46GoX2foY1+49WIz
         RBHFn8v1CsCfXzfsEShIbMyOmGjPwmdhnVbDHSuhV6H1a1+0g/eCENvnOVV6fSE/q3kv
         OwJ608dGgNVP5ki96xxcBzGRv8un8XTMWCwnY0Vh49hG5t52WSmQrpkonRD2MQL7lM8i
         w3LuzawqEo/H0lcMPaKsUe05NYclYf+gZQKAE+B/VFmVE2IfJFnpKIz3ISBkeNI/5tiX
         5TCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779019179; x=1779623979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=If2VTiwv89luQR2PmL2+TW4DswboSIiiteX2/ZQl/m8=;
        b=FkLHf8GrnHFI+3Lh8ScFwRbJKMqKSyGKhc0MnRW81bglSUV4W3qhXQVh58l97VG0aI
         MVXlZplxZ+DXTeRh3Fqn1cnwmRV9f/0M7qb6qqj5qMDmgG1pNw1BKOvCSSFdmdszJW/B
         i8Urt9Hwi6JyHREOgQZ7JJVI/Y+Tqd3LkCkeZ2za16oej5JHTU2sv36Cabwe0afhzRkH
         i2sTKCbQJ+vsPk91MfoLB7apTKLyOx+c7B9REdj7hIRn47AxaxlvSDpSf9yZ14SjValA
         nnxaFDZbfeBNEDGb2X3XoTQpADWu3u7R5dFv4pKgI0bxt5B9NzTm3BK3pHfiW07wEVFT
         MCJw==
X-Forwarded-Encrypted: i=1; AFNElJ/Yo6PfOmMKwMc+Ois0CqaD2bxWypC2SNWVoh9OEfUn05+lzxF7b5tzpHV0AXyxMjYQfkOkT46mhlK6JDa6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl3fknjCelD8JnhVugAUil4re4o4ju6yjXw3UC/JI4A4pUURAA
	8+KLa5Vskspof1J1PFquzHUc+YAOqf/6+IXHp/pFpd2SBJYaLTgQQuceLB69x8yHCDQWYimhxrL
	38+0xUbys006W6g4MwTFdGj0gbLcMm0aSRDQXB9vAmjq3K7tw/qrqpT4P9JEIw3FjzVKn
X-Gm-Gg: Acq92OHofwYZnc00YzvMt1ZCLgbu+rAwXuWP4FJuWTniDBL0Ppi//8s2k9/ah98qYM1
	y4SrYXv6/TmtZcCv5GN9dBu78rU1dKIxyY2+DpiuwFyaoZLGo4iy7B8ysv3/tEls/dXzsaagCwE
	YqkXleNyc8iVboItL8t/y5AqggD+YAiXXjWQAxhexUeMRmH+1PUXx28TqnVKn9M13psmAV8Jgu8
	kIEDrvpUgjPFpRWmznqqVpLq+6EhhtNZUOPD7zV0Cxb+U112rXbCx7JRsu7TrtTQgAvvFkZNyuc
	OCdWtyJK8/nhJZKMLolItfYiJpVt5Jo1J+8MR3Zda7Nejc6wvjGFCGcgDOs/dfJis/HqWMK7HCr
	yzYtFmkHcqOC82eMWkxq4LUxSv+9x3uwx3ioJt/FFBw/WVXK6agagQBAra/5OLH+ZlwfDhF/0mG
	Gj90gnBzuZJ7lF3vL6BasijP2Mj4wc95M6Iyw=
X-Received: by 2002:ac8:5cc9:0:b0:50f:c117:1c52 with SMTP id d75a77b69052e-5165a012712mr142397701cf.4.1779019178805;
        Sun, 17 May 2026 04:59:38 -0700 (PDT)
X-Received: by 2002:ac8:5cc9:0:b0:50f:c117:1c52 with SMTP id d75a77b69052e-5165a012712mr142397551cf.4.1779019178357;
        Sun, 17 May 2026 04:59:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c0c67sm4769841fa.10.2026.05.17.04.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:59:37 -0700 (PDT)
Date: Sun, 17 May 2026 14:59:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: Re: [PATCH] dt: arm64: qcom: sc8280xp-blackrock: amend usb0-sbu-mux
 enable gpio
Message-ID: <dlpgdby6m5zsl6onu7rqzzatbq3jiqm5r5gvtxoh5k6lmuzqzo@gk4clmoa762b>
References: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
X-Proofpoint-ORIG-GUID: ufs6npBunDrbxRu00IeyrAKeuu4Of1jm
X-Proofpoint-GUID: ufs6npBunDrbxRu00IeyrAKeuu4Of1jm
X-Authority-Analysis: v=2.4 cv=W/AIkxWk c=1 sm=1 tr=0 ts=6a09adab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8 a=OKCoC0DIYrHrkD67fT4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDEyOCBTYWx0ZWRfX4/itV+zOZ6P6
 mem/hybWHe+7ycDRNNJbk8nETRbFjngFLBxRStnOC2SW8PU8t2uK5aiTCgP0Mma6g6UfaEX7Sa/
 8qeH5V7l2YX1tvNJBXo/Yv2em3+4gdddlx0lY8vErikEj8vOpI9kHTAayxgo36LsHL3owz+uar/
 h0sBK2rE1lO9s6ggpBVhbuYOMT1hzwQXDDfziAcw7kWx3qgbKr1iAJWv4NSvndvXuwCimfuulu6
 b+hgpEnivlwnK5HRx91CQiOPuP/zU3l1vAChXNhsWmPCXmXXimlJUM5pY+BRPE9TNn7+nwR2Umm
 Hvgqh6cR5cIJ1qGVgNFXjSQ6ejbvw58zmcK/BGgQDRr1Ho8Ex4NLun54v+dgnOTccB7XMM3h5eS
 Y1TWNMMsgrOo9qbgVbE0faL+AyX44LdYLviW63NwfYssabHUMOS5cibXGahbsRSNfxHHYLaf7cH
 kI9BZ8dMzZ3xbQsXcaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170128
X-Rspamd-Queue-Id: 9D042560DF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-108030-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oldschoolsolutions.biz:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Jun 09, 2025 at 10:53:56PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The usb0 port didn't switch to dp altmode, investigation into DSDT
> UCS0 device resulted into GPIO 100.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> This patch amends the enable gpio for the usb0-sbu-mux to the one
> found in the DSDT file for this box. It shows a list of GPIOs in 
> a certain order, and it has 2 buffers with conflicting values. 
> The one deviating is in the second buffer, at the place where one 
> would expect the GPIO for the select pin of USB0 (by pattern 
> application from USB1). The GPIO previously used is also there, but 
> at the end of the UCS0 buffer structure). Changing it resulted in 
> a working dp altmode functionality on usb0.
> 
> This debug effort is a result of work / testing of the 4-lanes patch
> [1] on all available devices. Independent of it, it enables dp 
> altmode on usb0, and with it, also 4 lanes, making it even more useful.
> 
> [1]: https://lore.kernel.org/all/20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

P.S. Might it be that you need to set both GPIOs? Might the other GPIO
be related to USB4 tunnelling?

-- 
With best wishes
Dmitry

