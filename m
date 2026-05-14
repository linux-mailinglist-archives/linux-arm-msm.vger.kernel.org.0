Return-Path: <linux-arm-msm+bounces-107567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HIFIEWnBWrtZQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:43:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD8F54086B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7905430488DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1682C38757F;
	Thu, 14 May 2026 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pq1eVv+u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGItsTCU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8C83655D3
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755169; cv=none; b=H9wL1uYbPlWh/h/RaVkBVVN3GQXAVLOWEiq1udAuNhZlzuocZFfrcy+LDKrw9KOCIUjv20MiKy6BmklKGfePBKAelkTGenOoPaWPakxCRHDIq0YrAskvVsTgsdjjgpzigFzTDiR8Z/TjcBP6B5BXFkcUOmKN6VygD3GxSq2XQIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755169; c=relaxed/simple;
	bh=Omgvvs/zzQ9beUPBnfdtG5GwqD6xIoLj/ECfPcQfM9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cy/ThQd0XiDbeYXTNdNmJouslyLaQNAU9Fv5213FPibgeSftZGZKeQm445tPdHvvagjmjMcYskgVFSc1lBGt/admEri4aIF6tzr8nKc+sbCZX8E1PnTfcCJNYYVqIgbk572BEN4qVGp5frQlMsUWjzH+MCtIQ06byigC92t4kx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pq1eVv+u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGItsTCU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kJQq3640754
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HmrqwqjjLktBPLYsegl1QVtQ
	/F4OqiSh8CElUELezGs=; b=Pq1eVv+uYkACUxAAq+FertIp211pok452vSq7QUl
	8hLtR6SCbpl3dVk1J9ukfBjMUar/my6laEM2bQJ6a7ABCqk8WCKljC5sMWs93+P5
	4LBOx2iXIi8dh/8g1d6NoD49zo3qJ1NVOuiRIzzhbtPDcUbRo/Cpr9fvy6SKz1vW
	3fHbhP9On7dP1dCd9eRSsxuKZMKAh1PpDq9KiYJmyH2zWI2g8yf599k5s5VCUJv3
	8sRAa/IBCS2zBFcvEcq7DDP+VcLg8BqLDa2RHzMXsZeHsKXQnVxOsL5DiWui2+zU
	fJNRWKJyt8g9euXxI5ibrMXH96LvzLe55t9zX/0TtAPyEw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tumg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:39:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so8630145b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778755166; x=1779359966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HmrqwqjjLktBPLYsegl1QVtQ/F4OqiSh8CElUELezGs=;
        b=XGItsTCUQC9bvMswtaxWaIV8dGtOrJKXeRMsTTWbXrBSYUKpXQFmH5R85Mlleu43UR
         NdBy3t2Q2p24EW5Ew+Xg8WbmrBwoiCg1h0j8BPjX2P2vuWimaY5D0Bsb6meRS9DEoCqG
         PnGXSbbJdLB4o09slcfD3JCLdRjH9V4q6PKc1Dr5Qz6O+63RKHwYONCJkc2nyP55yjiS
         PblMENr8G5p7C+lqNO0zyKPw9TapPhUt76n7wtsV0fmauIF8xlF2L/4s8F35JI8JC2Gd
         U/QWTCkuducvsLkErfViObnk2IZ/ra3NJiGNIzOSefr5nY70yDEmTyfHLf0nV4JID8GW
         jRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755166; x=1779359966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmrqwqjjLktBPLYsegl1QVtQ/F4OqiSh8CElUELezGs=;
        b=qPAGRviniHaoTTFJNlMWKF6SgBgsfcbBGUjtphfbfYU5mBkeb/m+BnbhBjHViei53a
         c4j8n5smxi1YAMdoeuQElsCh3uKGcBPPLBTl3Zt84j66fc1pTkE/4wZMVK8zH2odbRrV
         7mjz0c2TaovgNavUfqc+5kbpI09nsUZABA+tzcqwXV+6FgD7oClbBoa6msHQltUmoQmQ
         rCKPwn484rk+75om52vfPsJodn/SDxphwbYdEUqrpUzZxnnhkzVJMc9Zlt3UVeO71auT
         WN2QHbUvSmBWd34nfCSVwbvhXvbeJXhSSU6MvzQvxey9CiMQE3tcn64WiWhaGRQ9Aue6
         UC3w==
X-Forwarded-Encrypted: i=1; AFNElJ8IilZwy368+ZgHw/Xxr01U2Dur514GBQYFZ4Oqo2PKuYyf8WpGNui7dvqHwT/uuL7vUZzRKyh/Y2znp/+K@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmq+cLyxQhIQADZTjkYJmUxAqcmj4ulP74ciSZ0ORpVduGg6fr
	NzOSJgilul9haqqAI4bqz2Tk8147CV7yBP08KnFTYZZZitgr1xT3pGxVxBHB+Z6qgS1GbTEd62s
	MlOkTccP/K6DGnyBNcseysoJ1YCPvxGXZANJXYzDJA+dfdeknLh6y/G/MR901j5RdvAGq
X-Gm-Gg: Acq92OEYVadDbMlJSCkrheTTNS7GBqBH1YtbSykR6SHL5YPmxapzbnFx5jtKLdN4mKW
	FMgFKUe68rZ8075iXgyDSZfZ6Gd4n9WYLNYcd3wKlDWm8DY/TB/C3Unh0wzg5YB8H9qLPkOoETM
	jajOiAP8C3jXrSs0dGrn/4wbSjiqcIeIOZrCFvebVhDo5Isv0SdQ2cW//J7mXUUEo9uJG/zD0iE
	cLIL+WlRuM0RxE6jaXZ8KM3/2TDfgBEf1VzjJHrP0xITVX9gla9cf7v0JKyl/YvbscS4LYzwuCY
	dwG51mMnUIgLC8r26LXFOiQ738rDJDYSnRFso+pHuLx2/YpJf1RV/8GH2TnLgJZl/u1Kh/gneg3
	txJUkC7E23HjybgJ4KRWU5PXbKLreLrAWUKYT4FnnLa3br6YxN5c=
X-Received: by 2002:a05:6a00:1c9c:b0:81f:3fa0:8c38 with SMTP id d2e1a72fcca58-83f03fcc4a4mr7790275b3a.20.1778755165604;
        Thu, 14 May 2026 03:39:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c9c:b0:81f:3fa0:8c38 with SMTP id d2e1a72fcca58-83f03fcc4a4mr7790238b3a.20.1778755165039;
        Thu, 14 May 2026 03:39:25 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f61e5dsm2300851b3a.51.2026.05.14.03.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:39:24 -0700 (PDT)
Date: Thu, 14 May 2026 16:09:18 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a05a65e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CUircwOaNzYOuOtqVfUA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwNSBTYWx0ZWRfX+mzPW/PZoKsO
 ZhYMNpkhFCWFhSY26yFR0tBS/3Sx5VzBXnXrIvtKx1VHrEzquB0IidVs2oixYuHRRx+Lj3hCRCm
 q7DXwf+fRoI3iCVs+dm8Vz3knAP/b7H3iBvRC2No92oAM0H068YZJdKlDFj6oK6w+Q1MwNsw/+R
 nBi3MtVg6Ug0daFGpuMwk2yx58iRCvCjkr0V7v9tBH5xwGiLzv02jc8hvcMBiFDbrh1DjDNdP4P
 cWq7yXFpCZ6Tn0FbxeLn8TVfuqiG66c5XdKOyLFAAPZe6Osi67xIi+Hvyci2ku70HNEaiGEgMDs
 brz9eyzeyaIOvnQ8SM3CcBhWTr/EAkQR9kUN8vN0aETairngCg/cVfpjLUfACjIspalaP7z+Aww
 XVgVjEJYvNO8MDUGrc6K9Krn329Wx1a6gMXzURFT7P0xk+FOb4XFtV91yM9k0xb3akxjPu1ZOly
 LV3zYOX6sC2NgOLlFwQ==
X-Proofpoint-ORIG-GUID: 7mSUoWv7QCZrKWIySF0aUQ6IrVtV9PBp
X-Proofpoint-GUID: 7mSUoWv7QCZrKWIySF0aUQ6IrVtV9PBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140105
X-Rspamd-Queue-Id: DFD8F54086B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.linux.dev,kernel.org,lists.infradead.org,linaro.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-107567-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,hu-kamalw-hyd.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> On 13/05/2026 17:29, Rakesh Kota wrote:
> > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > --
> > > > 
> > > > commit 457abf6e7ac410430c866842e08e602ec3daaa51
> > > > Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > 
> > > > arm64: dts: qcom: Add Shikra CQM SoM platform
> > > > 
> > > > Add device tree include for the CQM variant of the Shikra System-on-Module.
> > > > This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> > > > the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > new file mode 100644
> > > > > index 0000000000000..401e71720519d
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > [ ... ]
> > > > > +&rpm_requests {
> > > > > +	regulators {
> > > > > +		compatible = "qcom,rpm-pm2250-regulators";
> > > > 
> > > > Since the commit message indicates this is a PM4125 PMIC, should the
> > > > compatible string include a specific identifier for the actual hardware?
> > > > 
> > > > Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> > > > the fallback allows the kernel to apply specific quirks if PM4125 errata
> > > > are discovered later.
> > > 
> > > This can be ignored. The compat is a leftover from the historically
> > > incorrect naming.
> > > 
> > > > 
> > > > > +
> > > > > +		pm4125_s2: s2 {
> > > > > +			regulator-min-microvolt = <1000000>;
> > > > > +			regulator-max-microvolt = <1200000>;
> > > > > +		};
> > > > 
> > > > Do these regulators need to explicitly define their input supply dependencies
> > > > such as vdd_s2-supply?
> > > > 
> > > > Without these properties, the regulator framework might be unaware that the
> > > > PMIC regulators draw power from upstream supplies.
> > > > 
> > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > downstream components?
> > > 
> > > And this is a correct comment. Please provide missing supplies.
> > > 
> > As per the Qualcomm system design, the parent-child supply relationship
> > is managed by the RPM firmware, not the Linux regulator framework. The
> > RPM ensures the parent supply is never disabled until all subsystem
> > votes are cleared.
> 
> How is this different from other, previous platforms?

This is not different. In the previous platforms too this is taken care from the
RPM/RPMH firmware side, the only case where we may need explicit vote to parent
is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
may have a RPM/RPMH regulator as a parent.

Even on those previous targets the parent rail of all RPM/RPMH regulators are
internally voted by RPM/RPMH FW at proper voltage with required headroom
calculated based on the active child rails. This was done for all the
subsystems (including APPS) regulators.

So no explicit handling from the APPS is required for parent supply.

> 
> -- 
> With best wishes
> Dmitry

