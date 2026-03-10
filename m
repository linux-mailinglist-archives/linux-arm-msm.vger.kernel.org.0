Return-Path: <linux-arm-msm+bounces-96623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAe6MCwEsGkWegIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:44:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B9724B781
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 172703038FDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D513336D9F9;
	Tue, 10 Mar 2026 11:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8kMFLGE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cAheYGwr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD0F371D0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142544; cv=none; b=oQ3gJdaJvyWMBizZqIfJKQ5o90KGBLwzdN1OncXLX4tSZZ00FYbHWbeNnid15eJWOGHiFu2i7l77eI9UV8cHlvWHQNZugl+to0d6Nrb4sJ0NgyP+mWUoOj2n3Cp4TX/N+bUXJ5AkbuN046KyaEPRGnzlBFiyq96oksIMrh+hSFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142544; c=relaxed/simple;
	bh=e23RxyncAxx3FqQlBslcJy2TwWy5RUets+RAGPvyykA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8ad6KpYgDRYr6IdY2MLvPASycFOioa+xAj4hUX54pgYCRFgrfBK0YuKzCBU5WzpBoZT/HDU6M5pkMlzN8UQJq8zuBjWyiy80krFyTzHsCaXwWk5+DlJsNZ2BQwxrdIFipKa+onKh7cfwYZ/C2ecmxpAw65lAwEveTFHgJB9j54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8kMFLGE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cAheYGwr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9JFiL3587440
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dv7zgZZA/SKABtmT2+R/QPmM
	v9g6nD7n+zpgMrxpxm0=; b=e8kMFLGERYUSLLn0JPuSnaGes8eA9D+PhFMQlgQ+
	LGmwPj5iRBWuT27Yu/DudpOjQm605qSJyV69K9pDUdYXcwnFs2t/EoMkjYzciyu2
	UwO0xHVZabo2gOyfkBVf3JZdyUzOKCRaanEgbWGqRQFdVvcz/3KMGQ9OddPRaTJ/
	XC1huQooBySErVY36SvhPrWx+dz9PRJOAUoWSXRVAzoIfaai8ACrkDlLyV4vXT7a
	3u9JeRr2mJcwqoLxPNnh3E+995VgoH7oQO+Czwz7kDH2Du51NQZL0nswoKH9XJqo
	VnHOV8AEGQNXM3njdmtNBImSov+36poPpEMuJfrm7VeMXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekunsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:35:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd77e5e187so1716282085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773142542; x=1773747342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dv7zgZZA/SKABtmT2+R/QPmMv9g6nD7n+zpgMrxpxm0=;
        b=cAheYGwrWZfeOifW6HMdy35gBHw5b+obdrXz/Cp21B2jPUbuz1NFlPEknVTdtAv/Zu
         s1D1GrOITWDflg8yR15Ao9EyuKhkyAZ96tcdf/+CXeNtmDB63ihPjvOQPInkyrHPDBIv
         H1s3L43dK+c+5BEKGfoFYh7yz8rU30SuQMLOD3vwkcUfAg468BFqF8w2Sd5Bmpu9ujMa
         94I491d3ZSaZGgKM0pnaQzZVkwFuEFFsvFTcCK1XaQLZHyifEpxq7hroZJAQJPOyEZ8A
         AxmdfPQ5gwEmb+dG3QNBJRed0eE7mgT7tZFqytxsmIv8eiad2NGLLGDN/rmisQwfY7bG
         bBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142542; x=1773747342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dv7zgZZA/SKABtmT2+R/QPmMv9g6nD7n+zpgMrxpxm0=;
        b=hQ35U58MocMntMrOnavqZ9RR46OTPU2B6K78sgpHwCa7wAabFp/GuxfGawXof6f9jD
         FB2wf/WOOE1zNSDz4HbSCSVcB9PYPYopNwGI0X/ALUBH7QBrbKDUdzrsXn8SfRMLJrCd
         ZEfC9c3U8hQ2bbagGX8rQ2SJrDOcO8f/LdT+4XeowKAv5myaXsusxuNrVQWYmrkyM+Ir
         gjcigeMUmi2SWLWvTv8ZvlWmxk7ecAV9hOc8zogcrpZ70DJMSmItDdHSBkHT8ZYVN33a
         LpWcEkCQVHMWksACETFdmfWUR7al0VPzLePW6qvtrgaLiU59TbVkE9tBoOipjdcQeQx1
         L1wA==
X-Forwarded-Encrypted: i=1; AJvYcCXxkXJEx7Qa4RmZC+qCmZSpexPlG+VWneOkZq7DbIaGhmODs917PLcIeNflrq3KfxYgfJJh7LoR1fk1xr8p@vger.kernel.org
X-Gm-Message-State: AOJu0YxCMMcaAD8R3/8YBTpToYjm85Bvgq70gLNbb7JDOvn9+z9O3J/k
	W6ZzxDGmMPA6+TC+PP49JBY6b72mDna4PcdEN37GBeaaIwvz3SYZJEUvMEt/Gek1fFRAI5cCy35
	WClrKbrS/TFzEIF9aybSzkZKYv5x2HEw2UkB2yDEaI/13H3EUW8wE2tI3b5vVyLBS/T2g
X-Gm-Gg: ATEYQzwhQbgmcx9Fl6bkbijo4tmXbMJDo91/CoCfE57N7Oik8ILoyRY2PiOK0v0+hSM
	4E9xgBZxKrjILXeuXMkmDISWmDCzxhIJgnHO77RqaWRwbQHE5FCzWfEOleBHUvqDXQ//2xXWdP+
	+0lIVbqx7u+dPYd5mjzKXX1GSZiFr00eVLgzNwNIafJm8qKMOKdnmxVD7TCQQ6U4Vuq9IGNGsZr
	YRsjIwf0nwf7+VSMZmN/NayNeqi0mJ/rSDT/KBfQESbqFDbKFKDcnkgu5HhYnLyx+iAbDLLm5wZ
	gzHDmETVCLx0rCEyeiDNUqeDteis2vcUTK9t6h643fp6fTZP87tBCeqbLVvtUhBH1ezcisiSvjM
	7LzG22VfKBnpTorvYRuYJbhdDZhhJfrvmxGfc
X-Received: by 2002:a05:620a:254e:b0:8c7:17f3:e98b with SMTP id af79cd13be357-8cd6d34042emr1705263385a.15.1773142541825;
        Tue, 10 Mar 2026 04:35:41 -0700 (PDT)
X-Received: by 2002:a05:620a:254e:b0:8c7:17f3:e98b with SMTP id af79cd13be357-8cd6d34042emr1705260385a.15.1773142541060;
        Tue, 10 Mar 2026 04:35:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485419c2930sm118785475e9.0.2026.03.10.04.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:35:39 -0700 (PDT)
Date: Tue, 10 Mar 2026 13:35:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad
 and touchscreen
Message-ID: <7ojvcdvpa2ca4ejiwuqsix2mczcsud32p7j65l2mdd4qrabsf6@q7obiy5otfst>
References: <20260309-glymur-dts-crd-enable-kbd-tp-ts-v1-1-56e03f769a76@oss.qualcomm.com>
 <5f41efde-3bbf-4832-bc46-1e83126301ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f41efde-3bbf-4832-bc46-1e83126301ce@oss.qualcomm.com>
X-Proofpoint-GUID: 5CTVj_W_oisqrN6kLHjhI6mUsYNWBOgy
X-Proofpoint-ORIG-GUID: 5CTVj_W_oisqrN6kLHjhI6mUsYNWBOgy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwMCBTYWx0ZWRfXxRjHN+gbo0ua
 j+U5VoUpiHG6OaENOM3HlMRfMR1KzazBJajdbPQb4nkGjy3+cDTcJbk7qdoa5sn4LEEEV6b4azq
 MNX9fAlUho0auMbOlKtGrI1scNhHi1/alDwpNC8CiSb4OQjBbWD+lo24mowCuTyQfz2wtVJzRkh
 tUZd7Y99B4C38RzZfurfBa5MHa1ohgrmUC8MGRtnLOE8yJl55f3JExW4gz6EBU8HYCGKLwshDbI
 jvZDQMeU+3LkJ9DgCLusdEvGC7BUNf/3hII9DKEkqKCRm1/DzgKyiDqz5bHooVPyewNOtAMR5bo
 6hgAXQ3luzK7SAn3zgpCy0jJJJ/pc2t8TdskskZE9E4vazKKfsfCTMOMcnq6kR0H82WmhywmKtm
 c/5CXtGhy10+UfBmGdOwXPSONww0AyWyZZRR/6gK4WInJ3YI0JVDvYxUXuxbZwThad9WfK61BP3
 3O5MjpgI6tM7Q2nyeAQ==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b0020f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Ud8ISmZHHdJ-mrivEzsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100100
X-Rspamd-Queue-Id: 65B9724B781
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96623-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-03-10 11:48:38, Konrad Dybcio wrote:
> On 3/9/26 5:35 PM, Abel Vesa wrote:
> > On CRD, the keyboard, trackpad and touchscreen are connected over I2C
> > and all share a 3.3V regulator.
> > 
> > So describe the regulator and each input device along with their
> > pinctrl states.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	vreg_misc_3p3: regulator-misc-3p3 {
> > +		 compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_MISC_3P3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&misc_3p3_reg_en>;
> 
> property-n
> property-names
> 
> please

Will do.

> 
> [...]
> 
> > base-commit: 5138081b838d92e1bfcddc7b72b9215cca6e83f0
> > change-id: 20260309-glymur-dts-crd-enable-kbd-tp-ts-c80c0cb78940
> > prerequisite-change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v4
> > prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
> > prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
> > prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
> > prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
> > prerequisite-change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750:v4
> > prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
> > prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
> > prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
> > prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
> > prerequisite-patch-id: 6a291fd702870ca28d64439313d498593996b741
> > prerequisite-patch-id: c96958ab5c5605fb9577645ac5bfe5912cdfebfe
> > prerequisite-patch-id: bfa283218723a48e54fcd842484b004c877339b7
> > prerequisite-patch-id: 346f2db0933c551a039f63b945f989a5c8320657
> > prerequisite-patch-id: 919020405b70d588fa4356a5cbfb44e67006102e
> 
> More importantly, are they all actual dependencies?

Basically, I mistakenly added a dependency of a dependency.

To be more exact, I added:

20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v4

here, while it is already a dependency in the patchset with change-id:

20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750:v4

So I guess I'm only supposed to add the first level since the rest will
be taken care of by b4 when patchsets get applied.

And 'b4 prep --check-deps' doesn't complain about this mistake either
...

Anyway, will respin with this handled properly.

Thanks for reviewing and pointing this out!

