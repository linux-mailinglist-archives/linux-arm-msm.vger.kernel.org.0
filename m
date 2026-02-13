Return-Path: <linux-arm-msm+bounces-92823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBMEG+Nqj2l5QwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 19:18:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1526B138E23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 19:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 664FA30214FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 18:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47F826980F;
	Fri, 13 Feb 2026 18:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSPhqAaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pxy0petO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871F8274641
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 18:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771006682; cv=none; b=nY2TP52arJPiuKXBybm1bQU7LUNIOYs2VksyQp8z9ZRrl8asjuN3kAY10blIj0+wPZ4lg3stGMo+eq/ychgWcDQeEXjbKNrTqe29MjTV1UGXkPVjFmazPHy2GK0WzEUjPKYH7XBCnrzZHSEWnfoOW8GlITwDVFcWIWtNxdnGTFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771006682; c=relaxed/simple;
	bh=Do4BGO1LGcHGvCJPpurgH3E9R2Ist8VqiaUHKtL5y8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnELmjcR9FtW9isMsm37lBH+XkkoFbCAVV2FaEVgoBHndiyqxjsvD/nWEHiFAPQjYj1K0O79xIjl5TaNlT/1Kbf66uMBkjdVDoj39TAdzl0OTbtGM5b3WJnazrR8OIphE8Lz9UkXX/aPGi026baQtCQTcyyzi+hBXNWeS/bF2RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mSPhqAaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pxy0petO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DFL8RF3891194
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 18:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3SdWpZs6y9lD7M+9Gt2ougNs
	RDsaLktIwBXMbAcdzug=; b=mSPhqAaVolMHDdpabzyqkpZ99wtSLj4yZW8Weiy9
	p+jpaQKF1nFlmL0TSFIQ07UP0kA8Z6gFm4p02edS29gUfyxYHqYBEhD9MMzQon7f
	RpbECtNFDStBlNwgLWLKN2DZ8vMoF8zqvmqWfeAjSGFumvoa+5OFVOr7/iPQ12IO
	MuqtgYey/sV4Fas2bovWr3nvNJKGk/OwC+FOfnFKDuT7OD0Wwvzp4/GwO+/EBnpY
	r2YWaJfLZ9ko9XrJj/GP/vFGxU8KKAPMOP7XvqocBvwccmsBvemUAa9IaYPlNloK
	UhnYfVMgWouL0+OvNLhXDI5v4LfU8NPrsQQ7MwXQXs/3mA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca6h7rqwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 18:18:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71500f274so146183985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771006680; x=1771611480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3SdWpZs6y9lD7M+9Gt2ougNsRDsaLktIwBXMbAcdzug=;
        b=Pxy0petObSpM6rLiHmx4UMW2ZOnLKPxrfYLkbcV7vK38YJFR5FjkLRFCSbbdqKsJ3K
         Wx9mSk3S4kSSyVB2j85NqbYEpwpkFnbv7TrN7+zf4B7RCZEf+0+wam+A/igbEeVT2JzI
         iaRGQWX6x87zOGiQ/jVOoc5oBClnjJnkS9OSVcVi6GoW+8sUo+2lciTAUm98IVxQ6EG7
         3oaTcU/NfrufTxqDg3rGfZ2fxb5R+EwEc5TvGiqNeUvgfopgV6jySw35ktiGoZcijRJ2
         cIKGc07jbWo6XeBq4NNl5rQ4GCrm3fgn2ygiQ5kDeM67SWHUU9plyWGQwsMd7r91vxZR
         fYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771006680; x=1771611480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SdWpZs6y9lD7M+9Gt2ougNsRDsaLktIwBXMbAcdzug=;
        b=OlhvKMACGeowU91A+sGP40Ce7Eqh4PBsBzECDUYwnh2kk3c9R5clDZObCG/IMkUchR
         YQtv7lxuLCnhg85VQIafvcDRP7FM1mI4jaCwHGulQhIpo4n6Q0nAW03lsECicTYysT0v
         +yibUwIn7ihbeIGlnSHYsU4EJowT8wAg1C8EJxp10IB7WO1ThK10DdxU+41gHzDY5U+/
         FguWyglf+wMALheuSAx0O6EDBDfXoMyhy9cAKl8vF0nLXXPPfOqnHd12EnJ/NGtaJkAz
         eeOPrxU+6jTsf6g3LNmZSbzfp4lSGZ+Z+4RGIJuFVbSeJHnd7DGFDy8w1+2daadUCn2J
         DAtg==
X-Forwarded-Encrypted: i=1; AJvYcCU5ul4zYu7QhCgTue0ejF/hpc12kfnZyBBF5efM4eGEdXdQcKzvgG1FKt9WrqAg29pjzTFNNraHm2Gg2t8A@vger.kernel.org
X-Gm-Message-State: AOJu0YyJczJB7vxm/pWFZIoWJW2s3N87AXY45Ztku9NZpADJGiTfznCf
	r6DzBz1QXvepfqaV4RTs0Te7qdXANfIytYDktikM4NUJlaC+iOgqrgO4q6vZgnVm+YUUotKB5Ab
	ugEAyRo+MtzRemQmK9fftBZyrGljmOCI9k7RSgKx+elA38SvHNDS/fYS/Lk+jqmMekmWI
X-Gm-Gg: AZuq6aJJr/he0nB57/+J6Lwp6fpabBwAcfrai59mLuvUeHkr/bvHInGVXpHy1rdVNLW
	PnsJKGy/DQ4uaPiFblE8RfmtMz9rl/OAq7oFb0PvzQcnmurk1mmJOPorWgH8CqQxeaoKSD4rtWb
	OOqf6S//UAUkOOWvGa60MF7pUZ0BOmp2NVCvTtmvoYnQIWkFtwhF8/Ml7PFpMG9cOEVt4qeO6IA
	tkXNcvQvecB7fodxptb+XEt6EyNw+bs6Xkdeel4+SLu6O/nzewbf+R2lDYolVApyp7Y2YgbaTyr
	5EhxWyq3P9AtQwrjLcjsLMEKPW7KRY5z1JR3VjetxgRxCb/Fm9sU0cddrYSOZFE6nEiScS/IS9T
	KrL+u56EmqvwofSra1h9J89UsCMhqC4F94+ghkHwHDmGVnZV/zxGVRhbepZz9LcL9Jb8LkGeqm0
	zSB8/0X0FmSvgcf1Ua4Lqf9drA5YEC+Mot2XY=
X-Received: by 2002:a05:620a:4406:b0:8c5:30d3:d6d0 with SMTP id af79cd13be357-8cb424601d5mr320830285a.48.1771006679867;
        Fri, 13 Feb 2026 10:17:59 -0800 (PST)
X-Received: by 2002:a05:620a:4406:b0:8c5:30d3:d6d0 with SMTP id af79cd13be357-8cb424601d5mr320826885a.48.1771006679384;
        Fri, 13 Feb 2026 10:17:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a4f5fsm1710581e87.56.2026.02.13.10.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 10:17:57 -0800 (PST)
Date: Fri, 13 Feb 2026 20:17:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
Message-ID: <k2eu6lvokuh6pilmipztfqufffkmxa3zylsxz4lad45ow255no@fvocedpr3qwp>
References: <20260209-add_pwrkey_and_resin-v2-0-f944d87b9a93@oss.qualcomm.com>
 <20260209-add_pwrkey_and_resin-v2-1-f944d87b9a93@oss.qualcomm.com>
 <b0ade3b3-f2b3-4dbe-9e21-920bbda1d077@kernel.org>
 <20260210082612.3xakor2yo4h3dbra@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210082612.3xakor2yo4h3dbra@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE0MSBTYWx0ZWRfX3fO8LF4N5c8F
 8S1KLO2vzCDOx65hsoJtev7UXQiVoTZSOZ+5g1fQTzJr5fX2mbowkZTHEqCNwwZOv26NT3cG1d+
 5YeLKN1FQlsOBrKhaQKky6Ncd+GLTqh+FB/xcHeLVYCUVZZSJkLUY3kdYqIwf9i9nhbIL77jB5i
 0EkH6+hJbTfFHJBB/ggMULfx7ps8C5ey3//8ZO7uDq4sn0698YgbnxxoZA478vFuLMdLovyy1Fl
 Lj6z1Y1fafJ7OrNOcthnmoVr5TIm24wqNbLSnBQbh5H0/utZnw3dsgTXELdng0acjkVJJC8r/Wu
 Ga0QBOnswFsGQKoMKLNpYKC5L1IX5gXO+fqeaoqq76SWEV9T114/wTzjo4uFf6IRm1tZZ99EyhD
 Lmo2uyylsKu6id/O8l9F9lByBwWOlBSkaV2f1jvqAOh7OIWhXz4p4SW4UJjzp87VqdH2WeK4BSJ
 hjVCSuEy08s02UVwrUA==
X-Authority-Analysis: v=2.4 cv=IaKKmGqa c=1 sm=1 tr=0 ts=698f6ad8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Z7Cru6KvyN3eZcMTe0gA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zUj9xgAygqKIVKVm3HHqjrQ4Us5wH_Fu
X-Proofpoint-ORIG-GUID: zUj9xgAygqKIVKVm3HHqjrQ4Us5wH_Fu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130141
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92823-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sonymobile.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:url,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1526B138E23
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 01:56:12PM +0530, Rakesh Kota wrote:
> On Mon, Feb 09, 2026 at 02:49:24PM +0100, Krzysztof Kozlowski wrote:
> > On 09/02/2026 14:23, Rakesh Kota wrote:
> > > Add the compatible string "qcom,pmm8654au-pon" for the PMM8654AU PMIC.
> > > The PON peripheral on PMM8654AU is compatible with PMK8350, so it is
> > > documented as a fallback to "qcom,pmk8350-pon".
> > 
> > Drop everything after ,. Do not explain WHAT you did. We see it.
> > 
> > > 
> > > While PMM8654AU supports additional registers compared to the baseline,

I can't find PMM8654AU either on Qualcomm.com or in the catalog. Is it
an actual name for the chip?

> > 
> > full stop.
> > 
> > > there is currently no active use case for these features. This specific
> > > compatible string reserves the identifier for future hardware-specific
> > > handling if required.
> >
> > All the rest is irrelevant or even wrong. We do not reserve identifiers.
> > If you want to reserve something, then I need to reject the patch.
> >

-- 
With best wishes
Dmitry

