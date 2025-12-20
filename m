Return-Path: <linux-arm-msm+bounces-86034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59604CD333D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B984C300DCAB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 16:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B852F619D;
	Sat, 20 Dec 2025 16:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wp6ueLzG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IefIjCj8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E632D663D
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246850; cv=none; b=bqOCu7KF3Trs1WfPmvL6Z/ZI+EKVOu1S/O/Wk0S7hRZMokAlVeqp/tQRicjdXXlJQcnRvjkcivztUNSv9UDsRts7vtG/h78IF5pvPRoBda/bpZBG3JDPW1g6YFEFJSeIYIy5ZV7kgtZPiAeN47YRd15wIhNcW9rRIwUkkiabV3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246850; c=relaxed/simple;
	bh=IB+lZOBDIOoe2tfy3D30XNBuTJAJeTzD0SXDBR96cKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFyV6bbHnDs1AeROvPzwBRxOmjTycQN21c3qaOPunnXDv3AEgIt23aPRQFn72ls/Wr2TjctLSLccTwP9OkQrd3sKd96OXZ9oHCRA3uSoPMZ0SQBefUH8BrC2G6Y71mmlpFNstn+lwR/OgEzQBzTO/26soJJ2zJEMSKQvEwv7Ug4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wp6ueLzG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IefIjCj8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKCW1sb376166
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2tmOVV7WWq7NYUTAehonUE7t
	8epgvgLjU0TTOfgALYI=; b=Wp6ueLzGXsVsXXAeSkcxl9CLCnugHMXqkkGzNO1w
	o7Wan1MLpofseP4Lw6T0cS3mLzw5fnuOHY9kvaGD48290J48OJ+j1RpMZVWMcRhk
	WLAC8BapMRruUdaeprf8MbEipwRbqRmouYIhWaAtxcBmIGQd2akFxLWe0zRqs79y
	Wmb32y0ywN4AzomZMYSHBjo/iQUIoHGx8e1mXamK0DndxcsVDZRlFw1cgwDqrHxW
	p2hhBunl3XU+5cemdnComUpPEnlelSLh517BtrTAV+XlErxxfT99Q4Jnn3eSsI5j
	IIleUHETU5ZZlNLPbeVuGrbu3vJVdyJxe6CoafB18g+IDw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mubgwsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:07:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6ceab125so69506761cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 08:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766246847; x=1766851647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2tmOVV7WWq7NYUTAehonUE7t8epgvgLjU0TTOfgALYI=;
        b=IefIjCj8S7mMwkVixCJROrAAGJkFV/F6SR6TJ0PCW2wBCcW3Kv2Cfk5/LwGBwiow+z
         Z4HPlT36ME4BFmAv22WSccm2mU0d2x/RKmL1L+dlWR0XkX2AYNx1e3qsNpC8Rkh4FEyw
         EmoGXt64jllibcu+/valVuWYpfZyMKQO5BH7SIFu/yMAHx3Thh4+c/X+nq+Ute3kDyDR
         VMJUIs+bbvi70gQn5RkDDI6np0M3XRXJuYE4Pa69LdgPI2wYjhi6sOMpC8Qz4VFw2PKg
         BgNObHmzmmaQANkMXezfVfUWiDGr32htdQq9sCz/LmIYaVFJrMC7UyBCYW4akaPV0PQs
         gXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766246847; x=1766851647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tmOVV7WWq7NYUTAehonUE7t8epgvgLjU0TTOfgALYI=;
        b=WLcK0CLwlWD1Im4qSmLxhsnR78lUi3IngrVd4YGGvABGBJdKfZq+lVZxKgEj1dhjWH
         WPBhuFYWAIJeoWAPr+8wLVjneH3vVY/7GGTo5lTOEVBBzCPTQZcSRCni6WkMOSUFc84Q
         Fw+lpICs9Y5eN4uPVxn6lOCJ/sljez7hMZqnHV5sYOkZEm8LgQBmqRzoXNanCLXx9VTv
         PkomxEXqIXJZQYqX3D0iHWJjvBNPVnPj8k0NAPTejAppu5/zlLnj+fPGGlOj8mwgtj3o
         7LC3NjBFZqZ+fzsC/0rXS36+cPXhsDyAjbwkc1LQT7ybZmJyb75XJsv0i6OrZl2x9eme
         fGTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg9slSOrDOXAH/jrGde+UsVziEEswv+rwRB1B79hwYC/K7iAsurzmGMQqCoPiD8NRC+sQkGru1Vy6VHmuw@vger.kernel.org
X-Gm-Message-State: AOJu0YwFntdylMsGaWUkQzOO/hq6E5/re7IE58EfDxTKl7NFgXdoZvQJ
	dIFTsTP72ZG04bwS8/DRpQS+SqZ7nmXs1jS/w1xUoURxs1sQiEJHqrdCak8l8lEBiWo7iasZXX6
	S7RZhJnK2a8S5JGFqj/QRBzvhM83DbBQ9dStBUDmrVU0ghMxFMDCY1M9N5OryRahNZBfV
X-Gm-Gg: AY/fxX7B75l5G+6F6Yu4SSRxISg2+7kmxHqyJioDv3k1aeltE+YwQB4gIiIMoF5yE4A
	gACcbCB5lAIy0XOkAhqqcnTWdPGZgnlhTpjUvhw+OzsFgOn+zzBeHThX5hLWbm5xheh0IzAHOF4
	qPA7B6aUOb1kj4ViVhxwU8J6BGor4luYFnQY9685T65U7kVrojSz3jrs5uAGKij110raeeM8JlU
	ukCK5CwGhFRaZ4tKKJG94cOA7DnhkGrAMK7ueWkiBpUBXaPJd2R2Iz5LJYWd4bQfChZn3mtV/pX
	Q6F/oFFf1/TNEZhRP1q0fyFgO8aWdKLrKIjXDEoJSRMEsPnWVbGeLGHnh1bUfvU7kJo2Ou/uJOD
	tQZklRZjSmskuCs5eSb/sQWFmqCEjKa1e2nOlT+JYnk0LauQRgmN9y9uT0V+1GHubv67pW/P0+n
	m31LRNcTwDgXaR5JZv+BRiYT0=
X-Received: by 2002:a05:622a:1314:b0:4ee:173e:c73 with SMTP id d75a77b69052e-4f4abd944f3mr99688061cf.60.1766246847134;
        Sat, 20 Dec 2025 08:07:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSd9Fr2KS3cOReqDVFeBF5CRq1+87IRTRxXT7I6xyqi6SeDGdC8UilIWAI7uHDCQMNi4PqAw==
X-Received: by 2002:a05:622a:1314:b0:4ee:173e:c73 with SMTP id d75a77b69052e-4f4abd944f3mr99687351cf.60.1766246846559;
        Sat, 20 Dec 2025 08:07:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd7d3sm1585357e87.27.2025.12.20.08.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:07:25 -0800 (PST)
Date: Sat, 20 Dec 2025 18:07:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_
 instance for primary port controller
Message-ID: <v5buejvhm74dg3lijza7dqdqcpfnei775y32j4n3cmripop6mu@rxaijm3yaotl>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-4-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220063537.3639535-4-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0MCBTYWx0ZWRfX4pCg8k7bSVnY
 Npz/Dkq2WHeW++SlPeQshmno5e+cJnAfXoVlzt9+1VamhomXOwahuAzn0fksypIEWKRP9yxXSRb
 +LvFV+TPXvbZMIwnJHTESYlatLZoaAwxR4BY+SZjkZlKXpsFCq9uLWu2cQG8MsjcX/TT4Oek+J6
 5tD5Jign6EkCZ3TTNuuU9iH3KmSJIJXKpU7tRRKZhCTqb9R6XN06S4xxUg+2Vm7m/HRhbHhx5qc
 SwcdrOYOZ5mRRwEKIMNuRioRqOci4kVbgUn204Iei0b3kaU7sCIByEcBU8+KaxRprrBcIihmVtE
 vL5qQRUUOHvi55+1tOhpeQxD+j2aqqj5fSZx3oG1TT6L/XB2zpjEqV8D4HOCeU8p3YMlMIGFpWj
 SjHZbX1xcHYr69Kjj7qKaCiTxL//usn6NRQtxKEyyBD8ng0g8ytfn2JgovORCDFf47tieD6MLSs
 F3930hVtTdDVs/dUyMg==
X-Proofpoint-GUID: Fa6-g062jElUtSCAL7mSoo_1v0b7PJ_a
X-Proofpoint-ORIG-GUID: Fa6-g062jElUtSCAL7mSoo_1v0b7PJ_a
X-Authority-Analysis: v=2.4 cv=KYbfcAYD c=1 sm=1 tr=0 ts=6946c9bf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JvPiKryAJ1kiy8otdmMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200140

On Sat, Dec 20, 2025 at 12:05:36PM +0530, Swati Agarwal wrote:
> Rename the hd3ss3220_ instance to improve clarity and simplify usage when
> adding a secondary port controller.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

