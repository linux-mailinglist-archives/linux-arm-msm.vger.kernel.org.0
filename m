Return-Path: <linux-arm-msm+bounces-101722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPFGEcUZ0Gl33QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:49:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B18BA397DDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED2D83001036
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 19:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7031E3B27F3;
	Fri,  3 Apr 2026 19:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljFU+Elm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8tLWBY6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36893356A0D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 19:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775245762; cv=none; b=JJxNgbohsL3AvfoWx91SL5dnj5JrXMSzOgN6mch3HT2Bad4o+ppxUP4oSYoinCH0GxTrrEtDVpX9TLwbhhS6UQl6hm8QSaX3fT8tAlme9D6z9eShTuyEdvKrpTx7lsP3dglkEiLi/Pv7wJWTIaV90Ga0xA1FWnMVfX6GTXz0uyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775245762; c=relaxed/simple;
	bh=E/MEol8eQU9Ru8/85tTBQOKC/vbjiV8qy4fSQdX8Lgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ir3g+g3EV4G1DzCtUSuTW8ZDiiEVYJf57gdnMVs5M2XHNPf3ys6avcgbklz0ZIwhyDjQqWmsCuecUIip19MrzrTOLOkM7XGtpUI54VO2w4Vmowje+MfvFhrrDT2NrSUlQrZdFgBGCDayYdEcCmK2sA4SGmBps2iA1znmfpxi2uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljFU+Elm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8tLWBY6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EiWVk3772507
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 19:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FnbzQ0+kPBsD3j5Ea+HpiYmN
	FMg1/HEChynq2UZ0saI=; b=ljFU+ElmXmVvJ9ZmxmqtOunH16XVS/hYVpNYPbYY
	LhP8P548bYwDUIbFlopctEtQIVsSucXm6GLcZ/IsUaE7PJqeAXbc+Vy4grD2FGvg
	1GYFz/jM9/IUGHt/6DrQmNCVHOOTh/s1HyREuKZdyt6Yx+C+jy+FVZy3ET3ZS6Qx
	W9rtJRjLMMwbuDLhrZ4KpNR0IlfzTCELZVq/VJ+o5QGmGHNrngSbuf0CWfm+KlN2
	H6IdPkh2nicTFVNjZQ3Fv9eEpY+zMhjX5Soy+ZSlgVDLAyX3+mE6o4zlPiOXeny0
	DBd0/ezhQYilvaRoMLwiFQT/e1aAI0vQ7N74wsz2u+jtfg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs4236-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 19:49:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso53114401cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 12:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775245759; x=1775850559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FnbzQ0+kPBsD3j5Ea+HpiYmNFMg1/HEChynq2UZ0saI=;
        b=H8tLWBY6TGkuQun+ZS8SC9eIwrgwiVWtJYLqpyf3r3UdJix3+LfMZRGQ4C+JE3LaLs
         9CwpB4Y7fU6awUACz01pjTWp2VbqfbySmSb17kYpqiDNGU4HzkmeEV0j6ilw9P8ksJpA
         +VNKW/A20age6E6AolZS6jFkIQ26HSgEMYE1+TDXf6DiFyQqlJYulenYWozeDdD+T9Js
         Wr1hOUxuF8R0idHBuUhYU842qPqyYehLgZNTJUIVQbDhC3d+Vu/A3k3J4yfyYfSrtby1
         GJrzg3cFXERNazwjrzfa9NcZxi50j2Br/98j4I+YfK9JXadrumTHDh38Wi9bvPGTIqa7
         FdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775245759; x=1775850559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnbzQ0+kPBsD3j5Ea+HpiYmNFMg1/HEChynq2UZ0saI=;
        b=JCsgDJifeOetT2SfH8TJhQuoVRuBYucNpvdnmSrL5jdM9JkRzuPxHzxe54f4VZ8FOP
         KylOMjowDD6ChiIZqR/s7Ab0tejj/GQxNLP7tnEnYJzM50DLEu611roHe53r1xbGDlAy
         v05fL9pjVnJ664I/xpHbEf+vw9AX7pPe/3Sb+DTdTuARhZGTQpHvZY6JVQf5H5qYfFH6
         FngDb8qaajIt9We43a/0HgeOkXSFJU538d6efTqNL7JHY1aYmozhfUVeteRPyrWOzBbd
         qetNKgtHNYi2eAhecd+JJ+u0q0SxsHmP5njukxNdy5/wJEs3K4uK/xofFfISHYMBIl0r
         gH1g==
X-Forwarded-Encrypted: i=1; AJvYcCXrMrpq5FVwYOwUZei5DCfJHurBdvrxk5XHrKtthj1hWBCfTIbd0L6DYG+Qq33aoYvi3Dn9eeQHUVrfA3q6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz6UfzMl0UcjZdIcXlhxRkAxSzyxeSzV3Ll85272OG5s5t/rdJ
	AIQ8UbMKaEDYfTdBWFrJbztsFV7H6BglDw+S9P0NHJ+cf+cTcnW4itt/BGlxuBlNooAR0Nl56L/
	cZbUnBnDhLfW4QoE/ktX4WBt8RNkXh5sqgQdbW0XMByZReq2Jpf/mo4RUBcS1u830W1O1
X-Gm-Gg: ATEYQzxaNphPh4tiz6ld1fN374yxdP7YgmWXr1Qdop8DzX9iGipeCScYcHIvJAaA33S
	NuizFljbkvogwxYnczzGBXbw36jRm6asknZegugsBx46YFrF+5wJn3V6jsyV0vGee5pAeNBy1GW
	vIOgu5qndDxoiJmfZ50m0zxcQrQg7KA4ozEJYECwBMoAvaVKA21iyP+Og7HHCLDv6bJ8NUeTWkT
	4AZho0R/29+jerQsCWyPyvYBjZfEkPpypzaxTNF9IFPtIb33HfAzrcXvawLE7xrlRfvOafBHO+o
	udTIfPXxLmw84sSUBPrR+7tQJoXx6oHeGv+R/TnBc3e2P1bWiSijux7v4nrplQrxh9/weRWbdQS
	wZlWcJAe9FYLZGs6rfOveiRJwN26UQhT03W9xu5vbcxLXqM52+/L7g8PQkXQGBWzIHWewpWW6hj
	RHtcnTLkoKEjd09fhDjNZfWwnrmP7BSJpflFw=
X-Received: by 2002:a05:622a:1312:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50d4fc1856fmr92018921cf.24.1775245759222;
        Fri, 03 Apr 2026 12:49:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1312:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50d4fc1856fmr92018721cf.24.1775245758810;
        Fri, 03 Apr 2026 12:49:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9ccffsm1627486e87.22.2026.04.03.12.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:49:17 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:49:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH] phy: qcom: edp: Initialize swing_pre_emph_cfg for sc7280
Message-ID: <lsqxzcdcwut5y3xog7bfo5erziffc53vqrikyso5oujscowta7@cx7juz5qph5w>
References: <20260403-phy_for_next-v1-1-3d336b555019@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-phy_for_next-v1-1-3d336b555019@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vhQ-5Rs6HLcYTPI6libApTlQbou_fBPV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NiBTYWx0ZWRfX2Ho/4iqUk2C5
 jITXhsKNX9rACwxoSc2hg6NMoeWumZnaLV8B3ebeKoWabwngsH1ArhzNhAExjzlW/9p8Er5T3zo
 3sfiPssa4AgkljvGNLcMho4HgpAlEWWFLYShWUqCKurLbWKnm71xZWkY9UrfwO9tuVjG6T6caDA
 mjJ8u/e7AXHonZphlFDLIDqQYwksIdQPisikhswaN5WbD2DI2H6aaXSFyW3bQGm5sW9b2pSSFCy
 h18xcxLcU3Kuc+8ASBBkUa/OLpAwJph6DFBFK8q6UGO2VaUPefcCKeZbA0ayO7i5WrdKIx4MUx1
 8UXfpOaqPKS1QNmZ/rwX1Rdv/aco2AL0RWmtApg7qJhE5Uxu04spEtUC9yx+EUZLeBJbBjhi05L
 XPIz4e8pkL7bHze78hB9hgPMsy4g6EjXAR2zz3Br0ofJ1gZ8bFdMQ6p/PtIEVTKtompZK2buh+C
 H34L87AsF7yRtM4YiYg==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69d019bf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=e65Mx4sqn2E3a9r97x0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: vhQ-5Rs6HLcYTPI6libApTlQbou_fBPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030176
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101722-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B18BA397DDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 05:54:56PM +0530, Vishnu Saini wrote:
> Aux timeout is observed on few monitors like Benq BL2420-T due to
> missing swing_pre_emph_cfg.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Missing Fixes tag.

-- 
With best wishes
Dmitry

