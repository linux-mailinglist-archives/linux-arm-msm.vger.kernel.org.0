Return-Path: <linux-arm-msm+bounces-100541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPh7LHnKx2kLcgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 13:32:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1912B34E697
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 13:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3F76302F6B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 12:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D08B67E;
	Sat, 28 Mar 2026 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjEH4Skf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PFZN2VSq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08D223EAAF
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774701175; cv=none; b=t8ZobBC5LEgpkwVZ++1pE5ahjrmIEg/tNMIHouqWdXK+amGX2ZIv4UiTC23PNcJjrF5pY65rWtVUrUwBIQ4yQizfzGXWJn2mlRtN7uKQs925jRypmg6FtroPQieftc0sVjR8T4Fs3q5vbn9/3KxFWy4HXw20IkVsM6pp9Mo8ndY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774701175; c=relaxed/simple;
	bh=giZMbyB4TBmhjwN3fuaqoO9FFQ80IGzzaQKVLzkAGjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RH/Kvs12GSHI1+fuNpzlIoKBd07aH+mYQ9WpAdqRUroU1C607mcAkDV89rHwKnn13lfFQ6VuYqE7w68oIyW/B193HA9nmNbfwOjOvfmi6ygxzA0q/Q05N5+8P2A7VfuzDhd/CJe1jQkbGsrkWpBiwa5Ypm+QW7kOBEeSdNdRNuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjEH4Skf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PFZN2VSq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SB0H753541008
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 12:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zLIE82aKADzB228U1GH9uwyA
	RHJTAmhtB/2IjfL5YW8=; b=UjEH4Skf9ZaoMJjdK+YZFva0Mr5jcaf3VeBd1hXG
	a1W4SjwioaxztUoW7FwkuGikzEBlBsj0UtlTdbZygeX5s8CS23qAPiCSbCvj5TdN
	xA2X7P4p4ObEb9z9iCTxECDcQri1+8I+uCwaJGKN+Zm4f2NwyfX2fNbLeFnTbLhh
	Ik6RZHJ7QlbH87IfsBliEUDsVKtyDyVL2i5QRet3XeQHzkxf1eYmOWDlD6vVtgOq
	xHBzmDEP0gQ80znQQh53b8XI+yU2wtqYK8kPHOQMONOzkJs6plC3GtM0hYJvAns0
	xYr8jJAvK7EhHn766szgP+fZTd55cfPoViPECHXZEgeDuw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66048vuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 12:32:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b802961ecso40282841cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774701172; x=1775305972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zLIE82aKADzB228U1GH9uwyARHJTAmhtB/2IjfL5YW8=;
        b=PFZN2VSq4BH2V8oVn7SO0Z1y3RL1IWtBzbWqLj0i6Tf0yOx8Trw6AD7TKswRcS8WqW
         Vtcxg5SySRtNKXq6LfdmLMAMk5V6kU2ZeXdDb8N6s7xu8EuDgcYCsix6VCE0vVJodBbI
         HNk9Z2JrTZ+tYjoMcTy4IQpfJVgV+SzXWB13aEQjcQOZgLtAC+oF9VbzXWt/VSx8ibfr
         Sxd91DntpIcl2PFiXHCQmdrR99z8h4chtLXz9iys9uAkgJuWhAaZPLOpwu5xAukPVzK/
         ETk3Wl/z/4BRc76VgX2Cs29AAlJwM3o6J1haXsxLwv75Zlk7pNdJ7HAb6kLM4QMZzWY/
         8+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774701172; x=1775305972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLIE82aKADzB228U1GH9uwyARHJTAmhtB/2IjfL5YW8=;
        b=miOdrUJqH4g4gVgEe4y2WErUB0KHEa7nsgu8H7RrMoW39z0t8Vb3tzYYS+OyvtHRCP
         LsSlQ69bnh7OE5huxrUAeadrbMvzQKQV/ucagdVGEWogdOunUJQXIBXpQ9+y3sz7TRdp
         06CCwfFXgmG5eiBwWMgSIeE9efeDpa7SKoWyyuu24F8PJoGFW3zmQ4LCR/mkKzwecqVT
         A5W2f7caOuHMJbfHMz8JzqPV2WrvoHoPpYW/yjhg0CuVxfdZNcWl8M4WKNcqWUTtE4pm
         5ZHdUoHuhb0zHz8oMpVkcPsL/wRcLG/hISET8+JCPMSt4Fuj8mjSC8SBvEoyuArgMLCg
         ai2A==
X-Forwarded-Encrypted: i=1; AJvYcCW1nsUUPkYYjBlbVYcsx2JM9Z/Ks6InLtGZ83n1Imzz6LL7gNwqyUW2CbyRK7L9q/necRuyZSfh2jr+wt8p@vger.kernel.org
X-Gm-Message-State: AOJu0YzTl52Iu0BXlQQ31f1DjfzMZSHt5/l1mlRPqWNribqucDv+JOrR
	9igbarkrVl6asENquTbbEzqrwMAFVZOWWssZvmV71FGrOBFRQGlR8tKwBxPD9DxdDhV+NN/1Pn7
	E6I/T+hpDJTIfXL8zJyml4J39umF3qFU8czkKFjElGut760HeUCodH+KqC/O3kRvh8XO9
X-Gm-Gg: ATEYQzyrXF7PcKVzVF6Dbzn4wvpaPZxLsKRkKJGcYQiRmrTyip8fY2sCadMWXR7Ys3X
	qzVCVnAiIGiNcen9W8DYD/We4OyIQXPiTkSVqPppESKosTgBPBHIUmHhF4kYAlYIo2UVNdA0AzX
	LAOnzJxJlN905RupjkH53sRjO4OWSSWDK5WTmZT540oNXaE75GHxipPMdsP+3Gvweh+7VNt5d7s
	NoqFC5d4XWpKaFOZ9607Wzizsk/JSF89uT4UC0g8MzGusEiAa/G7wKc+rBLL1tpIkI+PvtM1QUB
	PjLyRZidZsxgEWZB2OSbtANbmuLStek5oY6RyL9TlTQT5xbQSHVHgKoGItfByT3Ws43BjMBWe7Q
	YENv1CA9fkiCkFqWeg6fH+K1W6Wv/GGr5SyUN
X-Received: by 2002:a05:622a:283:b0:50b:3f50:178 with SMTP id d75a77b69052e-50ba380ba43mr79328881cf.14.1774701171751;
        Sat, 28 Mar 2026 05:32:51 -0700 (PDT)
X-Received: by 2002:a05:622a:283:b0:50b:3f50:178 with SMTP id d75a77b69052e-50ba380ba43mr79328361cf.14.1774701171143;
        Sat, 28 Mar 2026 05:32:51 -0700 (PDT)
Received: from oss.qualcomm.com ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e265fsm5125925f8f.1.2026.03.28.05.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 05:32:50 -0700 (PDT)
Date: Sat, 28 Mar 2026 14:32:48 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: eliza: Fix interrupt target bit
Message-ID: <gjld42tywuc7ggxzslcobwwxjr5uiwgukj5tj54ipavhpi65ny@easgpb7t7wli>
References: <20260327171240.3222755-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327171240.3222755-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: 0lLAq1w6l7S0HIhNTY2tI31p_9uqlYec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDA5MCBTYWx0ZWRfXxg6tb6CFt3t9
 1rZePX6zD3vFUm8DA9StohjiblS791ZBdK1rpWHsTstJVZEitINb0b4bibWvf81Q1D+go5xXgLV
 OqajlwYGi7h25KpGbXAeSGV5G+FZXLLIiwhoyemQKgHxsKYeXJcP/kRsOFPdQtnLJrHJ6OtUciq
 mukHFcOqGzFN/W99DfnB41L6iKEixv0NFIvUPDgCfF1XGhrrtMx1T+pQIH93U+qGa2ylwc+2eUM
 nPL+e1cnO/kSp/UVCvxcWGrf9mZX3SCp+bqMmTaSX7AJsyuiUCC2TwV+Ha6ErAQ6XpyXZfJN9ma
 JLn1A/z29Q8Sv3OhWJgiJfh2n/oD/mdImDGCfuWNo+mYomBURA81gNW+3eeUTbnubwxtAU/7d2H
 QhMVCSlPk65TBSxZoXgMUjDCSbzZ67U6zBi3qr9u74wn52pOQzdAIgvlFCEajjpeEKaL6Y00cFz
 JS6Skd1PtII6QVaUX6Q==
X-Proofpoint-ORIG-GUID: 0lLAq1w6l7S0HIhNTY2tI31p_9uqlYec
X-Authority-Analysis: v=2.4 cv=G/4R0tk5 c=1 sm=1 tr=0 ts=69c7ca74 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z7K5_F5WLHyQu2uRg4YA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603280090
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100541-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1912B34E697
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-27 22:42:39, Mukesh Ojha wrote:
> The intr_target_bit for Eliza was incorrectly set to 5, which is the
> value used by older Qualcomm SoCs (e.g. SM8250, MSM8996, X1E80100).
> Newer SoCs such as SM8650, SM8750, Milos, and Kaanapali all use
> bit 8 for the interrupt target field in the TLMM interrupt configuration
> register.
> 
> Eliza belongs to the newer generation and should use bit 8 to correctly
> route interrupts to the KPSS (Applications Processor). Using the wrong
> bit position means the interrupt target routing is silently misconfigured,
> which can result in GPIO interrupts not being delivered to the expected
> processor.
> 
> Fix this by aligning Eliza with the correct value used by its peer SoCs.
> 
> Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Thanks for fixing this.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

