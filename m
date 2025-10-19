Return-Path: <linux-arm-msm+bounces-77905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1EBBEE3E1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 13:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 984DD4E2EC2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 11:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3539F2E03E3;
	Sun, 19 Oct 2025 11:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gs/FRwS4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5487223323
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760874716; cv=none; b=Zw8WBtr/RGwZwOcNq4xIT1x1sCPDkBn+uckaZohA8kv1+rCtYkVfJzndFzKfZyuUiavNKd56p1j4ByLrZ1a5HgiPNwjygLPeTvnqkOwxBw1jhz9UWL46ZaFWCKFa3N5Z9CUg0Odjtj5S0Q93+3cRhyh9rLhW6CxqcCBUB+q0SpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760874716; c=relaxed/simple;
	bh=ry+WX3yC0owyIWEzTcrXyxVXHHZBHn+c2IrTj2m+4bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzOTyB37tSD7c+UAAp+/kTXS4JF1kIUGUs030lVxmIdzXedlLGufeAM0BKEgyGHwv1fPXGv3s9KrObyxsSYqZeqTiVmmnPsYog6Ra9xEkEFJapc7S4d5e+voaXZOzCX1mXM7bXFwXT4sqtdAU0zVQVDDZw86InkMW6MW7nX+1yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gs/FRwS4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JAk3OK009318
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DW63Gb0AaVNjKV2fenN7I7eG
	eM0Cics4vF6SLpFHkdo=; b=Gs/FRwS4VExQ6YK3mlQJsrgN/jiwk+C8X5001BMT
	FEGzM4a6o7CClgc3KUsIYiYkwIKD3cO0fp93im300h8hJzSEMXSAEdudq57HTh3q
	CXmS70KxCSj5avqx3w3UrX7BPAQZ0dZHVhZy0wcyFDmg/Fra8oaIkOa8Zwhs3k8g
	0tsa5GPHh/eZ/IPsMChYXK+enG1tYJdDynn4tZteAV+V9rhcibQIAwDNeEMEzFj3
	PXDfOuUNnN2fk6uldDV764MS1R+05gKQR0GsaHJNV7Aiv6kodo5o9IIG41DIgpZo
	uqwO8m+uuqGPK2JiHk/hbnj5IEmLEd/BaIAf8nWPSvWINw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27htcpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:51:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7a758650abdso145758766d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 04:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760874713; x=1761479513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DW63Gb0AaVNjKV2fenN7I7eGeM0Cics4vF6SLpFHkdo=;
        b=wY0eCYM/FViLMRsw0rx57ABi/o3LSghAKRuE/shg0K4MRfr6Gogkm9CRqbwsX4rbMZ
         7COYs/5vb4bNSlV6MY3qOCzh+HAEZt58Y/k0ndpnopnFCAwDI26vK05XJcp1FcpVKBev
         rUDF3YdPNIgqRTRvwruhTUqmTOskmpgZhHT635qwn3Q6BBDNh5OagS8nE/9M4QiAMNpJ
         /F7puJWMxHGNOF35H6X+ET48wG0Z8naXaHRtDKfFchHKEWAukfjDRUQ4towmAMOCBFUG
         PzsJfq/Gfxl3fzQgIwEP4rZ8o4rP/XUCwET3YeEZHxvKEPw8gozff4QLWxPC2W8hjyh1
         niiA==
X-Forwarded-Encrypted: i=1; AJvYcCW2yzZX/+BpiI3xY7ffMwQrZb/dtALjMhEr6jgLnKbln1Vo6hNMurGXgclktWWw4/yTh0HLkb5CjtNRQ4Us@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4HbYV4VDvyyp1EIaejtfCMI4rR00dEJjpZe1zDpcgeqkaMz4R
	9usL3tcGVOlEFWaQD7nqS5iulhBHXUvLNB5q/WhKpSUcFIOPNIPMAG4xoDkUhG61vn70mZD7AGU
	BDDW5lPJYd1MoOatU1RckIrvWsbTzDFOK6IdHqwheaoJDI59iUy1+TTu0st7LdcOdLXkO
X-Gm-Gg: ASbGncsNSjPMwjSdxixTNH4OrAzTAQ1ZT20e7bzF0vc2bpDgd1vs7TmOGqdtWRY5zpI
	8YatRlW9iJ7Y5QfWrR5+eOuQV1BqL2CfKaBzDpIxoVzdqEH+R3dm/CfqcJwcidYT0DkjHN46IPi
	TT0kI+2OK2yBa+xwWTc0imYWxiI2ftJ1RJgKiqixVQKdp+9tcXpmcIkuE5EG2ChPrrHvzSnFZA0
	jF43Yihul349AOyBCsRsToYb+BEQ6KOpewGCn4qDJX6iHrveyB2Mb0tnbR6olDVyHq02kMQKb73
	U10LKQzmCHq8d2C8fCxgdn5GtS5c+Bqzm9/I8+JlFK7cpK6HCIWQyVPcsHetxUxrrsVY86YKL5+
	f+Jbu8abcycPu87SP0O7pchuze5e2yEwEETZcYn5RjznjoTbKZtBRO7KPdajWm7DD66DpxpPI6c
	KZfsAcO7+bwhE=
X-Received: by 2002:ac8:5fd0:0:b0:4e8:86ea:9ef5 with SMTP id d75a77b69052e-4e89d1dd2f1mr135423081cf.12.1760874712713;
        Sun, 19 Oct 2025 04:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9OTh4P0uR8SGsBoD2yOpga5vZZ8wKCSK90rD7QDV38t+bgMjYEa6KQh3dtpBpiUYKaycXzQ==
X-Received: by 2002:ac8:5fd0:0:b0:4e8:86ea:9ef5 with SMTP id d75a77b69052e-4e89d1dd2f1mr135422801cf.12.1760874712235;
        Sun, 19 Oct 2025 04:51:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a966178dsm12696881fa.49.2025.10.19.04.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 04:51:50 -0700 (PDT)
Date: Sun, 19 Oct 2025 14:51:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Pixel 3 and Pixel
 3 XL
Message-ID: <3jd4k6sltkmo62taxbqyyuqr6xlivzpwpxcvfv3iynrpyji22g@sxyp3fi4zpmd>
References: <20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz>
 <20251005-pixel-3-v1-2-ab8b85f6133f@ixit.cz>
 <n4xims4y5sssqxkchg2tikc7idkzds5ru7ayidcgxdfx77je2d@qo34qucbebnn>
 <73975160-05db-494c-a7ad-d67422edd69b@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73975160-05db-494c-a7ad-d67422edd69b@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX/KU0FErxdgkA
 FOmu26vdyBL2QdP0Di02mxpkGlMdTnUzUYRq8/P5peYfjpS04823t6J4K8PkucEvy21IHrtQplv
 nlqimHuCeHNoxaAbxmY9FByE6VZLWUqTlsduR/gcU9CdsODYzuTlwQesDK28bGIT+4kDel2BJL2
 ns5ncPTzlNGrUXIGKwNu5XtGeCr38KroU+tjTWi5FJCs1IxIzBWF1eTjXzRiVqpw+LtBJ8N6Sn+
 P4+c1J7uUoSThHVkQzeZ6X3MygSu571A6t16FzNNi+sPIlDvz7NVmB5DEShFam34spa47mxnUeg
 uIHoYgS58UlQBFHsboW6WSiJ/7Qb93M/yePzBtmTHhGX6yyQafHxFN/ftubypUY0N9rrIOFnsAC
 5cWZEED6/hPm2EsJbbFLAF20ykZLOA==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f4d0d9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=uP862qutgqayS25ywV4A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: C2lIsaoYdK8IDs77ep-feLDh3Y8qivUI
X-Proofpoint-ORIG-GUID: C2lIsaoYdK8IDs77ep-feLDh3Y8qivUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On Sat, Oct 18, 2025 at 12:23:50AM +0200, David Heidelberg wrote:
> 
> 
> On 06/10/2025 00:03, Dmitry Baryshkov wrote:
> > On Sun, Oct 05, 2025 at 03:16:29PM +0200, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > +		compatible = "gpio-keys";
> > > +		label = "Volume keys";
> > > +		autorepeat;
> > > +
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&volume_up_gpio>;
> > > +
> > > +		key-vol-up {
> > > +			label = "Volume Up";
> > > +			linux,code = <KEY_VOLUMEUP>;
> > > +			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
> > > +			debounce-interval = <15>;
> > > +		};
> > > +	};
> > > +
> > > +	vph_pwr: vph-pwr-regulator {
> > 
> > Nit: BCP is regulator-foo-bar
> 
> Can you clarify, all other device-tree use this format, do you mean
> regulator-pwr-vph?

regulator-vph-pwr


-- 
With best wishes
Dmitry

