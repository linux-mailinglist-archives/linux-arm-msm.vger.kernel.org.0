Return-Path: <linux-arm-msm+bounces-99708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNgoKjK9wmlflQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:34:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B18319155
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D58973012CE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B743254B2;
	Tue, 24 Mar 2026 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R53GXR+Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3lkMvjf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E821390CAF
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369743; cv=none; b=UJen46FJ0f304t2yluXaN15KZ0jlCGjcU2kXd8Fbbf18vDs7eTK3ZE+KFAwwZHdVLZG8Qxvh60U5yPUA84KKKEIcwZykafUXGP1yd42m7bzNoxkdkwhWZPrYyN156/RL1cocS9luTA9TF6sRUf0nOxl8CwV8ARqPCQYRbG9qrJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369743; c=relaxed/simple;
	bh=+PdYSZs4cfDhvr60AqhtuiYKz9hydT0q3cc55xpfa+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiBC6YZ6LJw+4Qm6ZFvAZfgT5WWmU3r9NMdqt0BygPTzRckzWRLYEZTUg4h0Yy23E5G2dSuaAq9JMZAmzCCheANmJjDrUYaH+CH4GWgvCPUur/ba0ypFIv8tBCelMvL6H2lEpvcGKtyZDY4rDG4ZqZZf6cXPPzkPZ5qtnbtVRUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R53GXR+Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3lkMvjf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OGArjb3904165
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GKjf4cMxLUU8QBL3mtbVgd+l
	CX2aI/lvG6AlKaKpvPs=; b=R53GXR+YV3VEMi9a8cGlC9i6QEaJ7N8a9SNunDzc
	2CO1EWETMsKiXFaVG0FX/7KPcHpOnVVxkC6MSeqRxE0r7EymyzYc87Aw+OD24hpM
	dhf1Y4lyrbhnUxXocfULyI0s2pMzjtxYkiXlCB0jJq97bz6XqC4nsAhYa9mDWHLb
	9jZ5ZaowfTiH41jkUjK6wZFMEqHFznsVUnplDocAovmTCulEo9T2zS7SWoJjXA59
	gRAGv1SICQ3hLj/32leZqvdsFSmUDtC2+G+8AHZv0VBTsrpCT5kv7acGo95FN4Td
	fel0RUvzMIepCeY+9mJ7RCi2/1uERHg5V2WhUGCx0CeuRg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0juuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:29:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090e08dcfcso88268161cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369740; x=1774974540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GKjf4cMxLUU8QBL3mtbVgd+lCX2aI/lvG6AlKaKpvPs=;
        b=E3lkMvjf/FaQSXoMK5V3hNEyCCUVE9sPa/6t7H6W3bcrYPPZTtUpqsoNmmJ2XJIVDw
         5wU8xHNU7dHhrrL4wS3UeOVAE08FdcDclx/V4aWTgQVHIcOufsxfhNinm4TBuOlw9hrY
         5q8vFC1RCTlOOjSuDGspmzLLTp32KQ1V4Tob5dYZy6fN9uvIdF8cjrlPjpOcE91pk5Cf
         HLehZv/LN/0LISxyhI/wvi7pLW7FN395Mojt9r7Karf6RJdUCMj92Bv+xpqpFuKmk0x3
         2PutPC6IhIDCym7BeuHRyITXqA4GsY5HJ3hPAgesS6iWc5I6xuEMgCXKwihVVDxfhnVz
         bD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369740; x=1774974540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKjf4cMxLUU8QBL3mtbVgd+lCX2aI/lvG6AlKaKpvPs=;
        b=XyxFfcXvi8eWUCReOf+LUfgWQXfCcfurjoakYBFmMPmYrdA5JNmghwUWxwi5OxVMS5
         dFWY6KP7pofU5XYaMeONPbu/l6QaunEN2wxNC6ZTIi+AtCOFAaIcoTpIAEXw/dSRIaXu
         i4W8QxcPj/i7lAm5s2CyiskC3ui5xys66Zx9vYpK89rXta+12Br1WpU5Y0wMIeMZ+mWO
         Q2kT9BDU/TsVhYFmNLM/VhlIYaPPwp5Hl/R7VUJiakXBRzadbG7iqcdo1QlQq9sYhR0z
         xi09miPKPTUOpJQjVbA80mcRa0V3oMGk5TcONxzfKLUpt+pkgK3tDWSWocR0cIsl5FxB
         iruQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDyEgL8HaaNfdAVhyjGYeRZMn04t0kv16/5sHJVPLFvUMHKhjrd/VnBcVB9bhjD/1QpBL+mrqgEV7DBpit@vger.kernel.org
X-Gm-Message-State: AOJu0YxziEdAaLPTYaYQ+SNqTmhJutJ7KufCNOKxtywGTKe4VyXKiKnf
	lYEPo62uyKfovx+/0ML1RaED3OOe4Igwci5k6FGXdCJhncMyfJNKV+G6+m3L9grPvHbdAnnE0ks
	KpSDTfp3BuY8MBMttaOgIIjbOUMaJyEBlRwHN14koHSEwTScrJlaNDnVwHZFy2Fl6hZ13
X-Gm-Gg: ATEYQzzpfw9mMaVJuGPT8kZH/zDVwvax8L1GZT3yVqE4BMpXXp5yJcEYZ6dmj43cWmI
	D8ROMrUcsSZT9/CgFMNDpwIXCrAC2hcKtzGTuxPeH4BZlWaSDiGITEyw2B95ClycYP0Y8uEMi1f
	s2nJ4Ot6wrwxQrIeAcsm5Um1P51UEeQif/wkyH2sem08G6Gv6XlT2mo09hb/AXJvGuPaynFD598
	TTNGiYFVvGImLLP95ZX6G3xVhBIl1aszj/NApI1xuXoUjKYYK2ncj9GzGPNUPwnJ8J9rsrFRnRH
	PsZT3blG4Mf0uL3qzjGwMWQYG8S4VfwuIEfWBzPqnKprbT9UvBADsbSUgKG0fiulMtN2cNWZ2cW
	NdehVS8DctYNO1/x6BNI8bOcNDXwtS7ZgNQ==
X-Received: by 2002:a05:622a:343:b0:50b:4755:949f with SMTP id d75a77b69052e-50b80e333b8mr3887211cf.43.1774369740202;
        Tue, 24 Mar 2026 09:29:00 -0700 (PDT)
X-Received: by 2002:a05:622a:343:b0:50b:4755:949f with SMTP id d75a77b69052e-50b80e333b8mr3886671cf.43.1774369739624;
        Tue, 24 Mar 2026 09:28:59 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711702191sm58206105e9.5.2026.03.24.09.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:28:57 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:28:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: patch mahua thermal zones by label
Message-ID: <nr2mw32rfqczv3wtfyqokqxtrahvbypxtf4jrvznucvp6ifjo2@jyt3fod3cvlm>
References: <20260320-mahua-fix-thermals-v1-1-8957bf976c90@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-mahua-fix-thermals-v1-1-8957bf976c90@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gcbOYrSwJdgbzFZbPGLM4B2EBBGPv3Uu
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c2bbcd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HjB67RblY9aCQUFlO1MA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: gcbOYrSwJdgbzFZbPGLM4B2EBBGPv3Uu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyOCBTYWx0ZWRfX6i62sAbC0HIz
 CyftyGlHEpFxOkIJ5bICC2lVfPyaqh+wrP2qxuPn/K7gVZ9X4fh6sZLp7GQtP0PGRxsdxkN5KTH
 sV3alBzoieX/1V3qgc2robwjz1AVwZxtUMwi+Mmk/RwqmQGbG3gOc+IzwUG95uV7jKxT+e4H7kb
 C7AlJ530Y5bW3/6sHvpXKrK2dzcASivH8+g6UZEBoh85/9nLLhVSagIeNzdLKnfhGURpiMMhnWC
 BAnoOlR4+rFYdk5dltxLq2lX1whQKHhz7gZCIy7cZ/yIzR9EUFduylDeJR8tmNwZgj9c2klAyLw
 2aycPm99bTEeZHqFkhHet8jJeWJk9LK86xYx1UkEIIfOgDPTLg6HDnY2hk+yeraQgskQ+LUTRYO
 Np5g/GkqMoC9MEV/jv/cgREbvXtCjOkSmfwKswU2CK1Y9+Hm4dL3i6arw1s4mLU0e6FTnU+Y34h
 Xx+bPlIpuRkaLUDN7hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240128
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
	TAGGED_FROM(0.00)[bounces-99708-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17B18319155
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-20 04:51:00, Dmitry Baryshkov wrote:
> Updating DT nodes by the full path is fragile and frowned upon, it's
> easy to miss the rename of the node in the main tree. Add necessary
> labels and patch thermal zones for Mahua using those labels.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

