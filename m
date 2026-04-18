Return-Path: <linux-arm-msm+bounces-103601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIHMOlW142mVKAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 18:46:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE57421AA0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 18:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE37F301186B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 16:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E824C2DAFCB;
	Sat, 18 Apr 2026 16:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXWVbuWI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h23e2wKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21521DED40
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776530753; cv=none; b=SthOhe5bf/hLGmSotuI1EyzBmAGKTFiosKYH/MIvxNVLPWXsdmd3/lVOu3vAw/LN1g5/JKofelPgyHFyISoNrkHLprRH++89GgGYK8WX8zLJ9CMyWAG5NI3CDfeZPuvJOzW9Q2zepjU0vhcwquLxmhJGh8r61rIfaA1V/bJ1zzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776530753; c=relaxed/simple;
	bh=T3ogW2iorPHrKlN4Csz7hRqiCqQ2aKbewaDJgkrFG3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0MjHq47rRnvLbob3rvGodifxnKJZW+xj4c2Trzjm7pPG2JgR6QhlxNlV/Gi87H/Dt7HXZTvWvcleuYZK+aqvpY+0rbvgPSiMnMXl2ZA87FUpqPzUoupRG3E2YE2E9CwjE7nM2UKmmAmRW+vOI3VQ+v5I+ilBVyhuJckTFqHs/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXWVbuWI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h23e2wKH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4UHO81410564
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qYOBgSOW36gFbpuV/19POEEa
	CpRmiqvhCP/9Vh9X9Sc=; b=KXWVbuWILH5GyIN22UyvY4rqBci/Rv0GyFgzjvoD
	lrX9K1EGCrRofdxuoW3gDNBOAtCnmr5qjOwI+kf8phE61y1oZNSNutKGO5duHWqZ
	B7E+l/E16Pus8Q9uSLu2JGmOgx6Ve0vA96AUl9I0Pdt3z4V9DSLzPZTBmYn4sG0t
	6ObYZJt3o2uuXMAY5gllY1U2SUXcmUY9CRp5eJcLsxLw/2rJePkHpkwm/KShoL+5
	aS18V+XTny8/5tdhnsImwJGqudZjfpjUR58KUR8+DMTj6bmHAdXNRJ+KYstsJIDo
	+Mq1d5wlUQtSLanM2Rah0Nb8TymcpJO/f25P0j5SN4x2TQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2qah4eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:45:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acd145817dso41686546d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776530751; x=1777135551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qYOBgSOW36gFbpuV/19POEEaCpRmiqvhCP/9Vh9X9Sc=;
        b=h23e2wKHS3Dm+r87e4yu78ir9nGAbbtFtZLrFXHmKGKa0PKpCUtgP0jRYBsCxWpnb9
         6z4bz05D9XZAWfrxd72cXhaGhUmNO5Go13a0q7qQ+J4qlkqax42tzt08IibdsmxfKxZz
         k1yIIjUWzDrCKwZPhvNjvAdYSYNX4IvHAq03Xyd/6VH4E2cJl53PJYWyP1oJpvqw5jLR
         k/BNU5BW+D7x0SgMNZv++9DIXATGTo49KVfa9rgSQj3n7BrmMgD7YPuvSlY9mpC61zML
         DTEKTWT5oI64Dr9HlqJ3XL8lWnNj4q7WnZSsAMdJEhp3aGSKE+CxjLpQHuNTPozHiJEo
         YMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776530751; x=1777135551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYOBgSOW36gFbpuV/19POEEaCpRmiqvhCP/9Vh9X9Sc=;
        b=nefHRuWKXTlE0wFvjs8wES4MoCRBiJYIyGgvQ5HTthd3jfJ9KQg8eviZMngtTWIpef
         D/GAEe1GufJfTfLd6KNPmy4v6teODnvmTa2s1hajKoaGYsSTbpHFHulg+PZwDFCV2OaT
         GVv3PlbFap7gKxsx/QhF1MEjKC3VjyDeGnPWgIbweqWDt5MRiHiKGxuzYKc1TE4yMh2p
         tzX8ZnN5APKJO0s9V8nt6fJdtyWFvDUuRE/s9dBSvJI28QUZeAyYJQhAcH+vMohi+akr
         sqVwsAfHbgqvWKUiDyRS9iodWB7OLb//VOvhowAkVVREq13lcq1MdlERETDAw+GdkOmU
         U3cg==
X-Forwarded-Encrypted: i=1; AFNElJ8op42niOE3c8Cc4rQdLy8p/hDHbSbm9K6A6/V7UJmI6ViVRphmt4+JunV8Gs4QaqeLH/ffhwbAX3TPOFwt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0uhjKBhNU+kdTpDuvKZrjOEANN/NCaHIajFE6i6RsszVNZI6d
	P0buCl1JrsElxrhJ7nXut3COtmsO8Y3iR1/qjhKLJ/fpQkFiH3x0rK6HlvdOGbjVD2/ZyCbzunQ
	JUwxlsMlrmUJ8xZbo4zc2DTtVrAoECg9tK4+cgfKnguIyUf0PRJqlqAEqGWzwAinjvIN7
X-Gm-Gg: AeBDies5drkuTbrs5qQLx3LJ13YSCqZYUk/59fAA8+oYiJYjBLRf3n35JrolHwS0tFc
	+HMkVABftRjV0Hio8RMFr0w/rwmuSZ13dBMwYhYdNI9j0jxfmM2u6y0dFiGVUjMF99ejJmcJrBL
	5cOZ5kqmoXCimFAkZXtYp7fX/46bUcc+LnFOH76EBK+uE6elzr+CYjY8j2XugXqmOoBR4HdBmLA
	TCo+YfaLsgibN1cilGlAA023ziEW2722UkV7sxHUNl5SV9PlfrEO2C2n8iTCIMFhye5kiUqWXqg
	Y9+Uv13H5DplVv82dlRLbHKSwngDZBa2eSGUMEQZUkMNWKtaSRMVKQdHIJoOwtJUduMIMocU1GE
	sRr7WBq5ufrJARQ+1G/swhq4K9BQ7YM3NmwNmOiaA/Caelr+ZOFmYC0qDva9z9IXqK001TC5m+9
	i6/+GWE9fZyjsu3iM11Ly6iVxA5ysCmFaoXd1uhcd1xqcwfQ==
X-Received: by 2002:a05:6214:e4e:b0:8ac:b204:3238 with SMTP id 6a1803df08f44-8b0280cd9bfmr120627876d6.30.1776530750898;
        Sat, 18 Apr 2026 09:45:50 -0700 (PDT)
X-Received: by 2002:a05:6214:e4e:b0:8ac:b204:3238 with SMTP id 6a1803df08f44-8b0280cd9bfmr120627426d6.30.1776530750474;
        Sat, 18 Apr 2026 09:45:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1209sm1468024e87.43.2026.04.18.09.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:45:49 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:45:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 06/10] ARM: dts: qcom: msm8960: add SCM
Message-ID: <ux57o2rnkthojbucnam3ih6hmefjlimhybwghywcervqcnfg3v@in7xfev4vjqe>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-6-007fda9d6134@smankusors.com>
 <d53f1499-0afc-43e5-bee9-ae76df3c6910@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d53f1499-0afc-43e5-bee9-ae76df3c6910@oss.qualcomm.com>
X-Proofpoint-GUID: 0T4YujHJq0PhRQIc-KNfwnZHIoAIjc7f
X-Authority-Analysis: v=2.4 cv=KdDidwYD c=1 sm=1 tr=0 ts=69e3b53f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JV34PUTpeUbgs-AlXZcA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: 0T4YujHJq0PhRQIc-KNfwnZHIoAIjc7f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2NyBTYWx0ZWRfX0hY09IM+yTZD
 hB/WEc/G421ig40ek06lVF29bRNt4PW9FXedWdoonJhXGAQeSjHp3kwyapGdaIYxAgw9qld7NMH
 uR7SpPKrUjt5XqgQLGf+BciL0OrkegzRJzqb9bgOnNK9Wl7XsDIlT+4QLW5H28rHjHszVTgKkYT
 NyFfncinlW9dgMLcsrsPCz8cFteDjdHPlu09GEoKBay/HebouxD64QxnQ9OxDBZztnReo5Eferb
 +ebcr10iuptHjv7+SDTSDOzsxKnfXKYwXIZboeKf3TzGxCEbxgF/dBNL98bWtp1Oi6NhO1r2xHK
 87ZaV1cWDOVC/CHo2jAkTexTEsTPCAAJ1uI0Pu0ZA6B4fk9v7p717f5njIdvpWKfogNa2oFMHla
 MGyS+r7F2ONH6Tng7DMsPh72WJst/E+1EDJuO23BgZ21vku+sTK9GIAcoVsC2gvH+DtL16ddiGV
 wUGkr4dB7H9/EN+UqUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180167
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103601-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[smankusors.com,kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4BE57421AA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 11:46:18AM +0200, Konrad Dybcio wrote:
> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> > From: Antony Kurniawan Soemardi <linux@smankusors.com>
> > 
> > Add the Secure Channel Manager firmware device node to the MSM8960
> > device tree. The SCM is required for secure communication between the
> > application processor and other subsystems.
> > 
> > Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> > Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> > index 1d5e97b6aa4b..bc3fd55e524a 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> > @@ -77,6 +77,15 @@ l2: l2-cache {
> >  		};
> >  	};
> >  
> > +	firmware {
> > +		scm {
> > +			compatible = "qcom,scm-msm8960", "qcom,scm";
> > +
> > +			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>;
> 
> I'm wondering if this should be an interconnect resource, but from a
> quick grepping, I think this is always supposed to be @ 64 MHz so
> perhaps not really

I'd say, this matches APQ8064. Let's keep the platform enablement
separate from refactorings, especially for those musem-grade platforms.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> (please tell me if you know more)
> 
> Konrad

-- 
With best wishes
Dmitry

