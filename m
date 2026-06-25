Return-Path: <linux-arm-msm+bounces-114449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j3gdK67LPGr+sAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 08:33:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B1E6C30BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 08:33:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X2re8pFr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kxiZAuJP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114449-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114449-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C103130080B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 06:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D959A332623;
	Thu, 25 Jun 2026 06:33:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4647A2874E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 06:33:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782369193; cv=none; b=KtknLfBjMxp1ZU0ExHHaezPmV7Y91HGASd8L4ObN7DMbAztZB8zbyYcwPbTN5uzzOadHciVxfJqs1Ui3PwTjShReyp2Y7KhvsMK62plCDxcBx68/mMQZb7G/WR4Vlro1QopZxDCHyIrEHfwginubu6Xo31Zjfa797/6dk96zzEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782369193; c=relaxed/simple;
	bh=zUuURgUP9U3t+lULijQHHNFBSqG/wtzaWiF4f6M5en8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLaH26VyVZH08Y3h6fmhtfjOuSo+Eo4oSVfVVzsZa+xPn+JGvOj5CiGkm0wDlIcxqww+DbekTQ++44JKiuUR6WfTMUkdBMf40v8iz8iIsLuIeOZbvn0FbmcV5igniwRVv2EiI1lkwP8zkt6i2V6O0/M05uVZE20z4dI+qQNJJVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2re8pFr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxiZAuJP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eIej904656
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 06:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6sOtvMwkjGEp38Md3ZvQ22p0VIbafa6fUa0A4gMPWk=; b=X2re8pFrEyw05F6U
	alJLHIL1VggkVjhlalyMDnN0Md8WiKlvM4LNk4LCTUUxMaY3U1HMzci1LMHt8hs1
	dqvG4oDq28ldg8521KV1IIrt6VGdNoNjQLhHEiv8S7O3OEXqViF3yRLDxuM9qsNq
	VDLEy85MFw6ikP1NxBkWT9VIle9nx8+crQYXI2FvSTeqw+lUSl+gg5vui8BsOczY
	755SIOnsSiRI5C+3INf7unJoJqK1YTi4ognqch6uMvAD6MeRgBS2IO5iZ58xkSv3
	66mMY5GfjckXRcmmcnHXLRq5aYRIsDD4BnRb/xuj9wpcTIot8bxZLIubm7GoJFxX
	5m47zA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dtx90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 06:33:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c011c7cb9so5539477eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 23:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782369190; x=1782973990; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n6sOtvMwkjGEp38Md3ZvQ22p0VIbafa6fUa0A4gMPWk=;
        b=kxiZAuJPVNrNJB3geLtVRViJpRnCIkRWvbZh7qQzmFeqAZe376e4/+M9QfZyujPY7Z
         Ke54FGPipUwkgfW69TySF6zg3sg7Bzx1l+WZx1T1EQE4DVbYcTbxebuOqcRK/3E1lSzD
         MmZcmTgl8ldtXeMupvo+6ydfixDNnSTvpJvx0hHZ4M9lyIe0AynkD64d4mFtDYazkv4f
         CBm/uqcYheNHiMtRhjc3DdDDh1lXV9xNzGCjdJoiVVHALAYoCCqTRH5fMjrfWJ5tSnbp
         8cxNRUhfyBBvYrUjETdWwe+194okpoWwWMtYpF6MPlD0yysumLdGrE4FvXFacI5mz3i0
         Gbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782369190; x=1782973990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6sOtvMwkjGEp38Md3ZvQ22p0VIbafa6fUa0A4gMPWk=;
        b=DqIbooLMuegXPK1cOGZAhHgs96I+XMvynUTHUKr2npq5Ukjvbz6WgifC+q+F0CuP+T
         HDholYNLepKU/jw9wWa/5AVIhdY9DCldSEdU2tSBnMVLZGaXQAnm1qDnFIaAxhWSnHOA
         0sNphDQ66/qqAy9liBGZjtPDgoneWPjhEceero9sMUtB15QVLJqbQFxWYdvBzEqY0yUO
         6CpE192yL4nD7cwkhuaY8YMohDlQ7Z3hr4e2a26ygBNZ0RMeZU33GBjAwI2rWwjUm1+E
         VkaX5MA9TKltYTa0o2CatxRyMgepREIdSjOkk1cZ3kpETfWrCFCNRc9LG6k9ws0akVW4
         FIjA==
X-Forwarded-Encrypted: i=1; AHgh+RrU04K/uB1E6xuoVbwyz/9W44Tuv6GbYzZizekBEnOqKM8y62UvAY9VkHZUIyrM6mXUGKdtzISSfyQx5JDl@vger.kernel.org
X-Gm-Message-State: AOJu0YzYaJOd5IfoqPRmGZtZRCIlg6Vu/beVq2+EpMPnq3Mg7Zrb9+iA
	iQqwABfZCFda48WttTRgIuad49AsN8UTuf3kfk5HMeEItQoutCbdXQuo9zVrqxoogPcnoSdVwCl
	jRv1oq8mIKIo9sb1HhweEQMG2lkF32aMZ5q/uaBmlf62un+dK1tNIm97ynyzSOoXRjkswnzeyOY
	76
X-Gm-Gg: AfdE7cnJ8YFgKV7OjJPCVqdy1kunIZfzLfIBBUNd37YOhLs5VfPrzkz8SFo9mjS8RTr
	ormRkvpGCrv8AxvK6qTQV/krtdwXn14fEqJUe3HV6+CG+kKE10vRIok0H9NRkGHO6uyBtaFYLJG
	ZqUDoPvrZBhelpCw+DMuIsEjuFEQvORtP9siJZ/qv0BP0aWOHcw6KWhfiPIVs5zJmNIY5LbgkaA
	O+Bdf1OO/4J5aXQZvaDDrfDP9U2e2kE08yZPBhAzrRvWMoNEqSm4A4vg9JusVN3umNpGFekN/A7
	ejimy3JAbxa+VyN7LQe9tJQQgvr+58QePgaZZIRoLgIvVGtigOFv4bT2C+dvqTdcUDobTtlFU5V
	qhyXLXvNMqgJuymf6jqmhN1MtETYeW4pmw7BQGA==
X-Received: by 2002:a05:7300:7c21:b0:30c:6847:c2ec with SMTP id 5a478bee46e88-30c850a9096mr1457982eec.32.1782369189816;
        Wed, 24 Jun 2026 23:33:09 -0700 (PDT)
X-Received: by 2002:a05:7300:7c21:b0:30c:6847:c2ec with SMTP id 5a478bee46e88-30c850a9096mr1457928eec.32.1782369189041;
        Wed, 24 Jun 2026 23:33:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm4864802eec.19.2026.06.24.23.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 23:33:08 -0700 (PDT)
Date: Thu, 25 Jun 2026 12:03:02 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260625063302.3zwtwexqobreyywh@hu-mojha-hyd.qualcomm.com>
References: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
 <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
X-Proofpoint-GUID: uetvrVJNAZQpt9ogklDVgIMbUBtsIIVq
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3ccba7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=DTZx51eUWBSITSpPTcUA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA1NCBTYWx0ZWRfX4KRM4DeH0PGb
 77kkQ3I8502VHqa7dCjZuA48/udNecD/rTURcD+JqZzWfUP146VvKdfcbrezOFZpM1DYORc3RhL
 JZFA06qoAn0qyluWp2jP2fDy3QW9IFI=
X-Proofpoint-ORIG-GUID: uetvrVJNAZQpt9ogklDVgIMbUBtsIIVq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA1NCBTYWx0ZWRfXwTwoX6D1h6Mu
 nV8f/ekqr0yRrZxFVLEUmxZEk9xl2FE38rXKsZt1AXICD51KUlE6G2iPlK8cBnLCuNipEx58n/N
 Vn08Db91MXaslJIb60WMtdx05mu7XZ7HO6dSPBhsiZFgVif8WG1u+J/NbENUPHX4owusbrfusLX
 qbYhjRCcNi/7p2tCvW/VXeXyKmHFpWhGEyrmb/Cg7msShSNgAc1/jPZ4kVkhRBxcllRG3S0e/Ad
 4bbkjIQ8TVtmu1doerVZ/PcLgxxvbwu28ylrd7iB8Rtl4U32449tciLS0cRbojl6hSDfFOJL+aJ
 d0SZglfIlABZGuacWAJV19I+SPR2GonkmKhT0gB+kT2Kg9fQXLj2hONYnMkBLkl1ovAnCMWCSCJ
 m7Vc5demxVr+5Zg6V6dVaYrFyP6swFTElqbF5s4UNGYucPLl5vLUxfuZeGrLgkOhZqDbtl7CxXb
 Hrr51u7cIAXA7PJPbxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-114449-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url];
	FORGED_RECIPIENTS(0.00)[m:miaoqing.pan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0B1E6C30BF

On Thu, Jun 25, 2026 at 09:14:41AM +0800, Miaoqing Pan wrote:
> 
> 
> On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
> > All the existing variants Kodiak boards are using Gunyah hypervisor
> > which means that, so far, Linux-based OS could only boot in EL1 on those
> > devices.  However, it is possible for us to boot Linux at EL2 on these
> > devices [1].
> > 
> > When running under Gunyah, the remote processor firmware IOMMU
> > streams are controlled by Gunyah. However, without Gunyah, the IOMMU is
> > managed by the consumer of this DeviceTree. Therefore, describe the
> > firmware streams for each remote processor.
> > 
> > Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> > devices to create -el2.dtb for each of them alongside "normal" dtb.
> > 
> > Note that modem and media subsystems haven't been supported yet due
> > to missing dependencies. For GPU to work, zap shader is disabled and
> > in EL2 mode the kernel owns hardware watchdog which is enabled here.
> > And for wifi to work wpss copy engine memory need to be mapped for
> > WPSS firmware to work which is aligning with sc7280 chrome.
> > 
> > [1]
> > https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> > 
> > Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> > Changes in v8: https://lore.kernel.org/lkml/20260522115936.201208-2-sumit.garg@kernel.org/
> >   - Added a wpss copy engine memory similar to chrome for Wifi to work.
> >   - WPSS does not have firmware Stream, so that was removed.
> >   - Added wifi streams similar to chrome for wifi to work.
> >   - Removed this patch from Generic Pas patch series, can be followed
> >     separately.
> >   - Moved Sumit as co-author as part of modification done to the patch
> >     in the past.
> >   - Added some more kodiak's board variants in the makefile.
> > 
> > Changes in v1-v7:
> >   - mpss was disabled and will be enabled once the dependencies patches
> >    get merged.
> > 
> >   arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++
> >   arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 52 ++++++++++++++++++++++++
> >   arch/arm64/boot/dts/qcom/kodiak.dtsi     |  2 +-
> >   3 files changed, 65 insertions(+), 1 deletion(-)
> >   create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 6f33c4e2f09c..d2cee1190954 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -164,7 +164,11 @@ purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
> >   dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-fairphone-fp5.dtb
> > +
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
> > +qcm6490-idp-el2-dtbs := qcm6490-idp.dtb kodiak-el2.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp-el2.dtb
> > +
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-particle-tachyon.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
> > @@ -176,12 +180,20 @@ qcs615-ride-el2-dtbs := qcs615-ride.dtb talos-el2.dtbo
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride-el2.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> > +qcs6490-rb3gen2-el2-dtbs := qcs6490-rb3gen2.dtb kodiak-el2.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-el2.dtb
> >   qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
> >   qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
> > +qcs6490-rb3gen2-industrial-mezzanine-el2-dtbs := qcs6490-rb3gen2-industrial-mezzanine.dtb kodiak-el2.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-el2.dtb
> > +
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
> > +qcs6490-rb3gen2-vision-mezzanine-el2-dtbs := qcs6490-rb3gen2-vision-mezzanine.dtb kodiak-el2.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine-el2.dtb
> > +
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> > new file mode 100644
> > index 000000000000..91e4cda45b49
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> > @@ -0,0 +1,52 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + *
> > + * Kodiak specific modifications required to boot in EL2.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&gpu_zap_shader {
> > +	status = "disabled";
> > +};
> > +
> > +&remoteproc_adsp {
> > +	iommus = <&apps_smmu 0x1800 0x0>;
> > +};
> > +
> > +&remoteproc_cdsp {
> > +	iommus = <&apps_smmu 0x11a0 0x0400>;
> > +};
> > +
> > +&remoteproc_mpss {
> > +	status = "disabled";
> > +};
> > +
> > +&reserved_memory {
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	wlan_ce_mem: wlan-ce@4cd000 {
> > +		no-map;
> > +		reg = <0x0 0x004cd000 0x0 0x1000>;
> > +	};
> > +};
> > +
> Is it necessary to redefine |wlan_ce_mem|? Can we consider updating
> |qcs6490-rb3gen2.dts|?
> I have verified that with the following changes, *NON-KVM works fine*, and
> |wlan_ce_mem| is only used by the WCN6750 firmware.

Thanks for the review.

I was unsure about it, hence kept it as how Chrome kept it; I am
fine to keep as suggested as it seems to me these regions were
only needed for wifi-firmware mentioned, and we should not have deleted
it for qcs6490-rb3gen2.dts and idp too, will do the change that
will make this much cleaner.

> 
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -26,7 +26,6 @@
> /delete-node/ &adsp_mem;
> /delete-node/ &cdsp_mem;
> /delete-node/ &video_mem;
> -/delete-node/ &wlan_ce_mem;
> /delete-node/ &wpss_mem;
> /delete-node/ &xbl_mem;
> 
> @@ -1686,7 +1685,6 @@ &venus {
> };
> 
> &wifi {
> -       memory-region = <&wlan_fw_mem>;
>         qcom,calibration-variant = "Qualcomm_rb3gen2";
> 
> 
> > +&venus {
> > +	status = "disabled";
> > +};
> > +
> > +&watchdog {
> > +	status = "okay";
> > +};
> > +
> > +&wifi {
> > +	memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
> > +	status = "okay";
> > +
> > +	wifi-firmware {
> > +		iommus = <&apps_smmu 0x1c02 0x1>;
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > index fa540d8c2615..2486d15fa2ba 100644
> > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > @@ -91,7 +91,7 @@ sleep_clk: sleep-clk {
> >   		};
> >   	};
> > -	reserved-memory {
> > +	reserved_memory: reserved-memory {
> >   		#address-cells = <2>;
> >   		#size-cells = <2>;
> >   		ranges;
> 

-- 
-Mukesh Ojha

