Return-Path: <linux-arm-msm+bounces-108430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOlMNSMvDGq0XwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:36:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B5E57B657
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B98E2315A715
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBFA78F2F;
	Tue, 19 May 2026 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQcLFjLE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ka1LGDMX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D49A3D7D93
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181624; cv=none; b=cGDqHnxrtVa0M7buSqfSoh2bbd4s4ofd5LSx30is7OMcpKfKxzCBOcWVXFSnSbk7GxKTYoLIiTxEa7AB3aixjfJAwVCqploAfB4cln2KorRYYQUHeuoUVXfGOGDzMRZuV4LCabmtavvagJDDn204sLM2X8QX7Or5uPE3vp+G6f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181624; c=relaxed/simple;
	bh=/1G2YM0mi0+Na9VXH838CU21tAtS0ne8GDt3z3YbPlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIn9RvX7MbI13NTyNH/T1lJhVQo26phHRytnp6REfNyBVO6mgvEVO3yafDzbwPd5FmMqTHUVFYxSwzX//rVqcMDCXttIKqfjw6v/TUuRD2NqFTgQedvJLaC5x77k6aTR3UzyTvCBCH4fyHKkkAOAd13dehLPdjdn+10cwPFhgdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQcLFjLE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ka1LGDMX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5aMtJ867353
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 09:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4EVF9b/U8+xGgbPxnxX6Uyni
	Fnd+a8L/34u03xz4KWU=; b=AQcLFjLEhH1hk/EOzBZwyYsT4r09VlvfoXIYA8N2
	rEduk/UlK35i9ejC8Fsbu3pcZHTPwI7o8l0PxLsCxVj7+X4xnZARgqYS8qNcAwWm
	DaiGbNtfLSkyFD7+YQBXWBKvMQcQbrd3g8eKjjoUBHHSI99RXJgFuVlkSB9/fbSl
	ZOwRymRqhUhPpefdyoMQxGsJLRM6wq1fgEDT0PAzwu0QII3zY6ySCw4TviQr0MPn
	NaKdOfkjbVtGKohhWKClHITZx6klG6oUCn1wALDNc8KrQflNQkU4YGoeihUVZXQW
	jsQOxdC+MFBf4AuxWW1ZeeTjy+tUlD5Q0PyhQrC3/Yc3Tw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1gwdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 09:07:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3663cbff31cso8663480a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 02:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779181621; x=1779786421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4EVF9b/U8+xGgbPxnxX6UyniFnd+a8L/34u03xz4KWU=;
        b=Ka1LGDMXV7F6Xp9yNqpbIjXTVCH1N9mOLmC0aUIb+mbdSUUsq/hbZ1Wily7+siN9Id
         2Y2ZljwOg1FU+YyXBmXFIe8R9zp9iuHOE6TtPWGgMro4RYK3qE6E9hWmmssd8WLjudsB
         4eaLgk3f6zRGVqtpv0N9SS4pLte0Zqamizww8zpTpO1sLmY85xHazXVI+hYHPIs0u84B
         kX2y4acFDzDeKkKekuJKv/aXrKN1IUHks5iVmvX/hhR/tFmutPoppU473qg0wfxTgDm2
         yYvO5h+fccsowWAmkii1ZoXrXz9sTQeUeeG2sn4uAwL0uU2DnSH2wbQ7ZuQ+rS5dwQXe
         /WsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779181621; x=1779786421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EVF9b/U8+xGgbPxnxX6UyniFnd+a8L/34u03xz4KWU=;
        b=LNJNb9Ky1MwBM9ndmEROnVeLXn3qLhQP9GKFxkBUfbJFo2Ue8X88NeKJqqFZNofdEA
         vttpPkTmjSyO/driT5i8ZYDkOvIT2M+cbUnysaMSFIzTRVsbZRPq1QvEoljkD8j+joMV
         yMpCMp4839BuxvPt5Fsl8P+hCxl6kCU6mcxDuAd+fKRwS18nFpP+dUUVdJhZNYyyWaH7
         t+rtoTceYczaW352tNNw13/wm2BouCO0jIInzbt0TxPNYnE7P+059CnPBF+pjwz1vc3T
         2Uwh4WXOa1qTDe5YybbX25lp9OoFfVQSr/pgoQgbFOVAJvJPlu74p/VP5AZ6Mtm/9LkW
         Et/g==
X-Forwarded-Encrypted: i=1; AFNElJ8mQ0UFnWkcbvFPBIe8NBei831ClTcQH8+F5tio8/Gl2ODcwBMJOd9d4heswUiarKptlFUZXfIup3s99mBe@vger.kernel.org
X-Gm-Message-State: AOJu0YzTvo76St4FKnR0BL/YGsgkLaubjjh73Dw2V3xI8zHetrtl/Ylz
	VluTm9ZYd4KnJwZF9mMU+NOAx+SOGc8k/4R/lWHVuM7Ae6ODUGADEy90KVrUD/mrIHj1QVE3/Ui
	IZ9iDLTwXP+z0arULu8ZU69swhetEmNRE5mp2+QADj4MtxBKTxv0vT6ZsAq7pKdjGUQmVKAHMa+
	hi
X-Gm-Gg: Acq92OFPSl6XrzUq+iMwNHCq3Y0WhSt7G8HiC7tQiSbauUespPJgIMqbC2js0oNb49c
	7GKKBJso/SrRTm4eVXW7AplDP0S0zwLO50fjdRnhAWnPEjr6SegBv/dfYQjkIJNgbyZFFST2NbQ
	uaywf/MxNN6gDmLG/HRqkssnQDEX+BXeHI0HW6dGeBxpynuGfaEEaBaUg1xql22MDRXw0V2gNFk
	SzGEw3Lp23l2oJJLrETfU5GQgzDKUfI+gaTsCNJWXJloy+lgcRJaBhf/zCDkzVfbEUD+OSw62R3
	lSEDBAWRtYZ6zWa2OQAiaLRvcmMG/wcNvdAPFyc05zLUfddIWIUa5I1EoZCtIyI3uGETgzwe69l
	qbZ2oWUQ9SjcCmiqSAXU0S7Fds0Y7vXiFXaWGa0cy0mMtKdk0
X-Received: by 2002:a17:90b:5486:b0:35f:c729:de9b with SMTP id 98e67ed59e1d1-36951cabdd1mr18772378a91.20.1779181621343;
        Tue, 19 May 2026 02:07:01 -0700 (PDT)
X-Received: by 2002:a17:90b:5486:b0:35f:c729:de9b with SMTP id 98e67ed59e1d1-36951cabdd1mr18772345a91.20.1779181620769;
        Tue, 19 May 2026 02:07:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951059f4dsm12998884a91.0.2026.05.19.02.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:07:00 -0700 (PDT)
Date: Tue, 19 May 2026 14:36:54 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop unused remoteproc_adsp_glink label
Message-ID: <20260519090654.ubbqrkemg5lyrllw@hu-mojha-hyd.qualcomm.com>
References: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
 <DIMJ0GE2UNHS.VVZVQKVBXBLX@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIMJ0GE2UNHS.VVZVQKVBXBLX@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4OSBTYWx0ZWRfXxoGOAL8useDx
 rxfi2LfDb2b/UjiJdP1rAJBv5bMHO7p3LaFgGl+/6bS3FYSwE+cfHmLDcFmkAfHrsdfJ38Rk46/
 W5OM+7TD6zKN6MGn8pPrC7iYVM79XP3yHDRKO/s7iYCC5/rzFkgbPWMO2zAyW5vTVj4F/iBWKkw
 X6cJeVyKtQQmspUspD+A6jtrNmDYUC7PF2XRpaghIsEUT+GBjqx6SGtpJ9Mk+EN0VSy7yUex4u5
 3//EA5tItqLthzdmASQyt+EiE0IRDNdwhGvLQ+1DtyjPsNwq+ffdl9XILnIVszfA2CDTZeD382q
 24RA8Qcbr15ZHOjh1YX4nuRbagi07RYwYKU+jHoJe+PSFD4aI+B6qfEzyXRztB5W0fTLAGZDHte
 Ptim9He/uGyT+q+Boim3Niub9FVBhsO1DJUqcpg7tz+U1zIv0v80G2P51lqt1wpQDDaTFzwmqHz
 TQdE2m96JBkqIEoRfAg==
X-Proofpoint-GUID: yWmpYNsaJYV_Ha1i4Rs-Gl4x2Ibx6HfG
X-Proofpoint-ORIG-GUID: yWmpYNsaJYV_Ha1i4Rs-Gl4x2Ibx6HfG
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c2836 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=C6TfXvH_hCnuVcG-yA8A:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108430-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0B5E57B657
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 10:55:57AM +0200, Luca Weiss wrote:
> On Thu Apr 9, 2026 at 8:13 PM CEST, Mukesh Ojha wrote:
> > The remoteproc_adsp_glink label on the ADSP glink-edge node has no
> > users in the upstream tree across all affected SoCs. The only user
> > of this label is qcs6490-audioreach.dtsi which references the label
> > defined in its own SoC dtsi and is left untouched.
> >
> > Remove the label from kaanapali, kodiak, lemans, monaco,
> 
> nit: Not from kodiak, as you wrote above.

Thanks for spotting it, it needs to be removed from the mention.

-- 
-Mukesh Ojha

