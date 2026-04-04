Return-Path: <linux-arm-msm+bounces-101793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L4xEkhn0WlvIwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:32:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9772939C3E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2218300A633
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 19:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99E31E5B68;
	Sat,  4 Apr 2026 19:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VsvnX7mt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O20rIRc8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AE328CF4A
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 19:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331140; cv=none; b=j9CYagzQ6cx5ra0e++QyLHgvyXOtdiVQYjMT8syBnsSYBK0eKFqrmUGA0ihkbJrHl8v9unPJeJy8muo9dXwjtZZSulIkxAIKUw5GKP4ondMLZykt2+/KqbbCHUVX46afmK9QcDPTsW7Nh+OeH6jeEacloEybwrZfYweL0u7wokM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331140; c=relaxed/simple;
	bh=P59wxhS/eZf+tih9Ucd1Y2vlFDKd91+TPwFioemXu74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ED71ahgzLXs/1SeUPgVxC7ma4EJJUNCIu4GNuNbT5I+bnuwmte8DKH7RPA7b1p5j2iv+HpFbRYklKOyw2r2sqEruqOfCuJqVNHVgHpty6AHrAeGpEsAlxj4gplHwosd708hmOx+j7ILNJPGqx1UDA08SolFehydEOkM1tsrvVfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VsvnX7mt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O20rIRc8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342qqXZ2199939
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 19:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tad8kd4RNcjtZnH9hTa4D7BY
	grzuPRE6PH6K1deeQOk=; b=VsvnX7mt2eiGoHRkJLU6IWKwU3rO0IBuAZY5cGoU
	nmzDpvbpZjoyO8pv7UG6jTEXXmnn3CPtw+OS8igFnQtRCcyE3DTn3MEoO2KHdRsB
	FdqjCneOWNS+UwvTu47wNPELwm3FG8IzlX/VdoexZ1+GYc8Bn9VI2yoawZPs99Xi
	o6hK6Rk3gJ57BRDWmmitf8zx9vpX34WrKwwGgBtguqkQWVp+qrpwM98dJ/W19m2S
	ZUmdtGlBoGL7zc8ObTKqgxZnB5Q6WqEbQuA57j2iQpEabqKFJ3KLJdWk6+Z5Nln8
	jNGhiwmY7hKBPvmT2GcIy008gpV1/FnRKG6xUqEkOcyaCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7u9dcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 19:32:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso72888261cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 12:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331138; x=1775935938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tad8kd4RNcjtZnH9hTa4D7BYgrzuPRE6PH6K1deeQOk=;
        b=O20rIRc8PhCklOSn1EuY6zn8e2cp/KsqGJJmuPOgt6rq6FSFGSMkN4rpM8z8gZtnsQ
         tUzHZFB2otQ3Ra+kd9A+ZqdFLFqm+NSj1YfzcJSTZZ64SgpwbdU4rRIv4hxEKy9CTHI2
         IPR8GUCBO/P8JUAS0562OtMFbq4twnZRMjMdvPfbDpEfo49kF9+O/r/qKOdFvUZnO34+
         hJAAZuxhKk5lAZVO07cAwU/gGjPzXI2ocbJ1HqnAcyf3mAFMzQA4ipmukG6kZuNzXnXl
         creI14kqn6z1nC9BxO4Q3r+b9pA5gpDNOBCNhuFgdKBppTBbquiGL+Q8GXn8xa8aLGeF
         EhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331138; x=1775935938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tad8kd4RNcjtZnH9hTa4D7BYgrzuPRE6PH6K1deeQOk=;
        b=eyO3wnsStifeDroIbNDGMBDjsGbW5T9ky1+pLIeApm2x84FViyvcpihX0yT7NwPrZU
         VkZ0PtjAGjrLT2QRPTFDGS1dfCFiD49Z3npDHLpgCu2I/vltQQ+lw5597kQpj9ORmYP8
         JCH0y5ZEfUIx3ceu9uEVALDA3vmWNAB8muR/auV60fwgFWF43T+JAdMVHVmlVchR9v0Q
         y1gVQiTc3lupEqTMOnUNBtrMxXmb21rMQ8fcgyGC69c8PSwSl41DGU8jc71VFV2brotP
         iukdruvQ9jZ65uiKFFO/xr99CdbxMTrAG9OdP3fwXynAHDb4A3ncSjSH71uT8bSi9mpp
         Zgxg==
X-Forwarded-Encrypted: i=1; AJvYcCV4AiSt094CUBNjZ9aL7IvYZxhzsrGvrmtq2gxHixDZGhGCO7SMxw9gZ1o2iVA+Mf4RkeoORqoCBZho8xf7@vger.kernel.org
X-Gm-Message-State: AOJu0YzuXASyH7o4LNWGTgw6FsU7V/28hV5xH+V0wAhiFrqh6ElrphsR
	rrZ/e+Sb9l35d9EROxFafdMuXbEe4dNDDOtfvCcEBNdXp/qUmUir8DHWmFY3wi/AE9NYoILFDM+
	chAyg6h6JQeitU2YkopXNXc3ryQfrNuNajtjVg304JNRcy3mHRGIP+IwsA/h/K5voCl4A
X-Gm-Gg: AeBDieuxrK+CB8FEgC8SBOeY5BtBCMRXmEz+062tJmD/oYAdkcbUURu1493zQMnz2AG
	4kpKj/PWlW6UeT1cj/sbXDjcLwWNBQ0HqY284cwadkoooCoBbMGrgMLBDx1r4LR3HdFaaw4XynN
	+FV15V8KdNs5Knv6Vcu3D0uKAH/7Dhnn1YenHbyVRXWVMHYx1KQGNA78mfjGJGqlQBycR9Klyqw
	7xzrye+1XMbbOMT/6gbmejkZJAnI4YWsA0jxLqLIiNM0oUxC4upaUCdfJ5dfsEsTSgxUW0vpZPJ
	IdVH8GsuZlc5rUvrgLFrpJQAmH0eLTcmCilh4XZlrvyHMJkMA5UC0i6KmG+Xe/R9HrJsnYqyVv5
	wB1HbzFwxcZTwIG0dJnVmSDF4nCJBgX83DUzWagJ0g71y4fbc8qSGNZq+BObBocxm1vhhuCXkJQ
	KG+WFRCOdWZ+mVaqAGz/8c7uYOhyXwMm59lVw=
X-Received: by 2002:a05:622a:1191:b0:50b:8c01:210b with SMTP id d75a77b69052e-50d4fcdc4b2mr140141031cf.31.1775331137800;
        Sat, 04 Apr 2026 12:32:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1191:b0:50b:8c01:210b with SMTP id d75a77b69052e-50d4fcdc4b2mr140140641cf.31.1775331137373;
        Sat, 04 Apr 2026 12:32:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdfe5csm19878701fa.15.2026.04.04.12.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:32:16 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:32:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: hamoa-pmics: define VADC for
 pmk8550
Message-ID: <vfstzhr3ak7ykt54piolx3puuagqepfs5b5x4o3jnalzxylxfv@vy5mrcdm2ilv>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NiBTYWx0ZWRfXzUd88mqzxTcp
 Tvewxsi+ojE8wk1L9mRX2IdQsXoq+jCbsjSoUxA4XV66l/Tu65M5JUghjXbVQFsJkRWz5OfST21
 t7bERSl0QldcYFSizBC7ZXF9Pk/nsy9HWBEZWDmpay3yIVISXIERpv4VU1CCOURF/AOb8zfYcfj
 KZVgH9nE3p897YGISNdtklaTrJOL+LDCI/ec2XKagK+Z2iM7sQUhLgycc2mSSbL024uBEnJ9f4/
 c1XFFylBmh/3qDLfWQDxz3uguf4a4JV7ORuJ6pRJhKRZWhdBnoE4GjXM+/FKUFz/MKL4LShuNfB
 Fcr0FuOxtH7WyHFs22WRF2GVZPVoLqK0uPXLd3qN0+ChzOAtRECxINSEIX3jqhp0e2Cfm9vdxKJ
 RXITpk2himSYku2uhncWQfzPAJZqNv9zTTa2vx6TZS+I2YNi2pSXZsx8SCYPmBTXWboBD2Gsh1a
 da79NQrSSXtpvSKXprA==
X-Proofpoint-GUID: 7ZHWhyrzI1SdnhqybjASn3PEbZE4N8C-
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d16742 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=I76Qk8w-AAAA:8
 a=EUspDBNiAAAA:8 a=V3ZGfVdA7sYjwwZOGqgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-ORIG-GUID: 7ZHWhyrzI1SdnhqybjASn3PEbZE4N8C-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040186
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101793-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,vinarskis.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9772939C3E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 02:55:16PM +0200, Aleksandrs Vinarskis wrote:
> Follow pattern of pmk8350 to add missing pmk8550 VADC to hamoa.
> Register address of 0x9000 matches example schema for spmi-adc5-gen3.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

