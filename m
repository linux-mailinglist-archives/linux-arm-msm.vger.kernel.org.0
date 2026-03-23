Return-Path: <linux-arm-msm+bounces-99381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDxWOjCUwWkKUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:27:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DB52FC3D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDD66305BBBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFEB371055;
	Mon, 23 Mar 2026 19:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jrT9ZyIF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qtihk90E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3B53932DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293916; cv=none; b=T9MZxLvsUcJWmSgycI+aHNAcEHOj1bty086vOH3tNXKP7FRRefa7z3/3x9y/wDcRpmMOt7g0oFnF6AJbUWrEwTyevwYEN8dwAJDT40u3TeCKBd0Oi9saVQvUEeXbJQ5A6y57dedl20r0t32YR24GT3/lPa970m8CpiV//5YMSSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293916; c=relaxed/simple;
	bh=VNt3oIJPeAitMvEk140461nWaP0kgJIgg7on8kLFuTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKBgNw9lWljL2uc3ZyQSsXY5xwCjM00O/a7ZXMZdraiBhkX4Tv28cvDB8necLnZw3uQJteKCeBJVJEf9yKkUngZylR0xb4To5krVTLOKVeeGx1ZM69kOO8pQ0Ew21SVCy9h/1ag2ma7YLfVQBtJdzwja6bmyW5OtKgoEFQ2MTfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrT9ZyIF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qtihk90E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqW073817318
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n2cn6VL+YpMidlTbJKZrRD/a
	6COYTRrqbh5Y1jb2KDc=; b=jrT9ZyIFObFyqLxe5jpuSUT3QyfuHsvIV3Pn2LFF
	QdhsRE6nY+7hFhFy1+3O02olLpdy1Dkqk6gSiVRu+MUeudAgB2k0JEeBhJR17YV1
	SiX4f4YK9bpAHrXcm59ihMH1QpfqxHSdBC4JrCCG7IowuqwrrzTTLLppwR/HTt/L
	JiP4zxp9mZD3+nzz2/wBCE/PVpySrqc8DHaRCEKvdihR0dlrgwdnLhhb4lvs8mOW
	4vPOwgsj+YFBKhJ/eKwrMiEPRmC64J1FWsmSgz3hcDD9X50onQKmhzZ6/06zBc9p
	ng2bQ73hUvBVXCOKf/ZpU336Iuvg99h4QQdy7Yav+bri3Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w1j6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:25:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b44f7b7bbso223190721cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774293913; x=1774898713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n2cn6VL+YpMidlTbJKZrRD/a6COYTRrqbh5Y1jb2KDc=;
        b=Qtihk90Eop+inkRLARRsuVJ1xxHr0x1iWPaq14RULx3Feu87PVDRnCP3cDC6atcmB9
         XUhzFLi11BDXte3ikxCCMQI4wU9lsPJd3nHyeVYi3xG18w7/OnytBmkl7Fxt5FMArBHB
         V8Y7f65ipvt0zJI0a2UWzJakHTyznsJONoV3UiTqOsxPQ/IKM51aQLvD68oMQXc62J2r
         3PDyoIig3NOnJ67GOZEQtAzBun33qtgzPV4EeAX3cROiKv+U15qGlc+pjLy8nYiAco3Y
         oEtOFE0ToKomg5MVCwOBJ7L/NhQjOQ2NbQVp4hy+n57hdjUuvo3xp96UEebobJMBfP8G
         BZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293913; x=1774898713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2cn6VL+YpMidlTbJKZrRD/a6COYTRrqbh5Y1jb2KDc=;
        b=JEuU9zqrl+OUMSvbe5Cn0POkEA+1i6s9TCTYQqGnttxgrlVJc/+iE7slg25QZ6yUaD
         RtD4AOa6aIKeuyKWqQqRZwj79E0kniB6UrepMhuyxxIChNdEPNLkj9i0c/A/YX493g9C
         WD/27VAriqdMMFELOJY3paqLK3ho9LNuZyd9kaYGo5zZPVkcVvbfNO739S2v8rkQveJF
         4fBtCQG7F/TXarejrCmeSoPQ/DajiGdP9Y0koxD2Z8JuLirdFwPeevt5j6W5SHtfbVsy
         dYCJX1PysClvSmtynyYxE+YVpjxL6IfW+9BxbynaR44Gx5G1iBGECiplqTB4WzGmixbZ
         8Aug==
X-Forwarded-Encrypted: i=1; AJvYcCU/lP0Prayfxq4zwVFRkpAn8F1YCEZ1uDNz1WhgkBXktevhggfAUKGj6fvMDadCu3kHQ605nW7rj3nok6ch@vger.kernel.org
X-Gm-Message-State: AOJu0YyxTsiOXb/a87utp+DXhGU/alWLdILiyQ6bPLUyvcva4Mz/E00P
	rEMi3QrPuoYolVT+kk2Esc0C+26JsK/1SdGBrCBW3ybhPw9+w6vYjAEu1zIDR/8g+NyzWDHxq8U
	vLCpgH4rgK3ogX+e3Z7EjdEX59aey1Aj99heJ8a/bk2bOTpMd+HxS0zNxdZwbY9GB6ZuK
X-Gm-Gg: ATEYQzxLszhuCJVKkiasJvRKrEpXP4CbqOktX4Nerk31hxjlqX0c7vScPet07rVrcO/
	FNfl20Fd1rIT679bWJdjyo3j7Ih9sKbw+XH+5Fc7mHVWc41ZFUs0KU+qgSZ2ref+TrVspT91Gim
	yYKd4bmEHQecxNGEWM9VpTt7AE6b27XtKTLN//kNc3/5qfNaAm/Y87yhvgtvgfwIDCSPhaKFyQD
	zFMM4N5UZCUB/VkS8iONAc/turYLc3vMIAEau5Tkcd0RqtpbagLKTQVouNduov6p5hTRlLxy3ub
	eqPIculB2HG5lE+RU8Wrbr8iwJh0cd0NXBJQeRH+Cc5WV7vLnUVSr7E63K7nerwt+CTqDBuYvoI
	UZif98Y0wvgf0GMUE8JVX5gLUfEvtOHo1ievdu6L39tba7EKy/g5Rie8EAi9fZsoOJXLpZ5wjtJ
	nko8q+PDqchki/MQEMZaGIT3n9j9L9EmmUlQU=
X-Received: by 2002:a05:622a:2611:b0:50b:4e65:95dd with SMTP id d75a77b69052e-50b4e6598dcmr119728621cf.62.1774293913003;
        Mon, 23 Mar 2026 12:25:13 -0700 (PDT)
X-Received: by 2002:a05:622a:2611:b0:50b:4e65:95dd with SMTP id d75a77b69052e-50b4e6598dcmr119728291cf.62.1774293912559;
        Mon, 23 Mar 2026 12:25:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305e31sm2697048e87.64.2026.03.23.12.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:25:11 -0700 (PDT)
Date: Mon, 23 Mar 2026 21:25:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
Message-ID: <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c19399 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=XNfRLA5X0yr4rW59EWkA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: R63re-kyRn-PVyRxwEgV-h7kpStkvzNI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0MyBTYWx0ZWRfX/1cNTniRIhZJ
 Vg8aE+4j3n/6KMzqKIU1M9bLzlJb2K5TX/+2Xlmk3BMIIwHl7qsapXQCpPqiaf9yo2gYBzEHuDG
 oX2SNPoUtpzKt9hedXaGNCp83Fou0Gwzd3b4fyTfePhc35mY35cbg7aSWxglxxlrds5CGcG0DQG
 CTD3SIbtAGnnBpvQok2ZtZmIa/OR6NA/8v2nkMbfBlloGc0fl1n4EK+MWvrN5d5KquQDgX3XP6g
 3rO6AAB5Oc1vbV+qUF/4gT8vRFR8h4eC8o2qUffMo1K+K0kDBDg3t7mEwThW3OYHOxThP32ojhC
 IuWMZJgxgaLPWS0fW6ijGD3AC0+tdlDYpze0c/FSUeryrFjajYuTepal9dzj9i9uw5YxlYN8OSw
 G6su7VDX13B3GUxZl3mE5e1QTwtMBG1WTWMneP6xQdQqJLEWV7FyGg80FyfNHslCtqHsfPl1YyF
 A4/WdyCd0/jDi1mqAZQ==
X-Proofpoint-GUID: R63re-kyRn-PVyRxwEgV-h7kpStkvzNI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230143
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
	TAGGED_FROM(0.00)[bounces-99381-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68DB52FC3D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 08:57:12PM +0200, Abel Vesa wrote:
> According to internal documentation, the UFS AXI PHY clock requires
> FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
> the UFS controller fails when operating in MCQ mode, which is already
> enabled in the device tree.
> 
> The UFS PHY ICE core clock already has this bit set, so apply the same
> configuration to the UFS PHY AXI clock.
> 
> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> Reported-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-eliza.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Do we need to apply the same fix to any other platform?

-- 
With best wishes
Dmitry

