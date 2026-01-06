Return-Path: <linux-arm-msm+bounces-87597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DF5CF65F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 02:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F00CA30EEC39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 01:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FD7218AAB;
	Tue,  6 Jan 2026 01:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfFRwfQt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IBx5H5MJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9EB1FE46D
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 01:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767664039; cv=none; b=JLb+vYvBXo2QnJ5CjhA0l5Byppez9EYhO30cfN6Sdw5iUF0vOz+U1T355ZRJVWV5lM21qeRLUHxaE4w9I/r6edI4wWps86LeThzJJvJ2SKdonElgDhabT/cVsRWSI1HuFDPnmUi2Qi3nSUIgf61H3LR1JiKFhqTGgPQ/feUUVxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767664039; c=relaxed/simple;
	bh=j1zB99R2jHfbew15jr1UJofMXuVDwLUpm2Dzvp2oVRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuM0MMJMTPulKXn+NmZQHNUWvxBRssO5k7EO/V72u+f8MJgl8OmR4SM5RpE8HYTEA5YNSvGb8bygwsx/7SVl5BbVzR8MBa5A84u2kp9MZrZC1cU0eFZXMHvWhyiO91gQOe/gIX/FNtW6xValXTIGoO5Qr0NjBfXEsWIsAmlB/9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfFRwfQt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IBx5H5MJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nLGk2969888
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 01:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eeLeNY0nZswfv917mKMcu6sm
	lNVaPyv3uKqgJvbmbXA=; b=LfFRwfQtjDWxHEr0tPqHkZ7A1GHRD7lPBRtP66hS
	ktthMqPTAOCNrhS5IOveg/EYJN8EEJBnW5WwHE1uBUiih/AdI30ayT6YsbQRJkfg
	cUdVAx04ejkR3vRjKowxGAWxVCYoZNsG+is5ujsE5pjTd5nyMuV+/MDbNtSJ1hsG
	pxVWafJC6yADQYlzvvC0kw11k5ei43eZ8czOzyAnHJgzrkAqlumK9K6NfLA8Sm0C
	x1/FH4Nkpq4vycnYhkZQg82h9DGe2mp5X24vCLbcEaJPWDTcodvrHECewJcO18hF
	RqmhW2wMvHbLBHs+8nY4j3Vs0QVKa8Fkan2xoHV/I1M+rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggsvsb5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:47:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4fc0d0646f9so18048221cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 17:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767664036; x=1768268836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eeLeNY0nZswfv917mKMcu6smlNVaPyv3uKqgJvbmbXA=;
        b=IBx5H5MJ7ssAzYzGxQzEdlN5BVyfvCfII9ZbjSzUFS1B8k3CDKKdhrbtHG8tiP8y6S
         CKZ1E9/0c3h8XLj0/FbWqd4mIEW+benSQDKnuWjQMj2LmEd9UzPhtmKWdFG0rDA1gLui
         CBnBS+HJEDHJogIxJgput5HkBvQHSTlpoUW9yidXmxndq9t+KmMfx77U3n/lrwmQEnO3
         Rny6PEc7wU6AJ7FN96gvmIUYjgVhxIERETpcDSLsM1yGLQ595i/t3cg/5mHC93aa8aWK
         rXgw1T1QuogOV2UTJ65e+wQlhoCxYlvCGJ9Um1UKQWMPvCozLkSej0obYYGqVpEfOoaO
         xPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767664036; x=1768268836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeLeNY0nZswfv917mKMcu6smlNVaPyv3uKqgJvbmbXA=;
        b=YOkpPjeNu09+IbQeZtPysO+VBeSatquxrsC+RcLJnOvqKp5OdSjPV6q+a8vlQn1lId
         xKm8UJWE07Ls9tByn5R7OO4pC0MD1LEgZglzsW9oa85aleA4xvKr/MZufIwU6ko4TokZ
         6E7Zm2Cra7skp5/SQ5ADt1jhmOpBf6t4KBW70AKnj4o2JGJoN0jqE0c45MZ9lZbj3Jlk
         Co6hIcNVOGiBYO5SBgSkHcIGjy941jm4dznK7E8xeIzRMmFehO1biy2zvRK/TFvkzabK
         1UiJxUfoyzAgTpMIOCfzyBEjwtZ+6lg8t+FRtX48MVdaUJ74hoaza5L7z/UhYbsyxSzX
         XHgg==
X-Forwarded-Encrypted: i=1; AJvYcCWKfqd2t0BDCBrTIgdJ2oMVzjZeLoZ1+AtgO7ItlK6kqy+dbezZMg5zkBDZTSGNJi6rrturc1Uu8DQLb9kn@vger.kernel.org
X-Gm-Message-State: AOJu0YzkiULOWw8stTuXHWiftTgSMG5aaxkgveJKYhJdRDmYNQivk7rT
	p8fPaa43QJ8Ur9ssK2LXqEzSm4QU2ZYCfq60BPoy6vIFmgBqclpRNOkVfGzym49xDLs3M7zfr1z
	3wNXpuARcqAolxdSgKi2NCHr48PHbLisXuC+UBZS+y7GQefqwcNCVYtbrQfBPeDG0K5aD
X-Gm-Gg: AY/fxX5u/3QvYLmhpYWsYNZ+GIanX9of1F1ZrqOwRdksvfJPHxEDt53xqz8C2XwcBP3
	SIDf8c+AqazzQkJGN0lVSbKHZL8IwzDdnl/2hEfGjhx2Ui0XCFBb9XBo09FtqpKoDKsUjt5M+zm
	uA1Wr+IsdhoFAH8nplvdZLcZm74YwZGwM+nYmD/dwvDREH3jACQqEN9pvoRKAgD+ZxuNKQM91VN
	akD2UoBdx6Y4B4lBCFI63jqQXnkbFgthiJyjXt/6UDj5wyPno1xRE3LH9quavTfyr0DGlhl5B66
	V2kF4S98TuFZcyMQDmgHHruxxm9zgLZKrvhJAs7X2ASDpOtSSFZnieqRxe9rhMDmTmCA/4V/viE
	6j7gMtRwZ9hk4VX7wUP5DU5QzErfQD3aLtv+VVHfXXUV1JWJJ+YzjCivEB4GaLIpyHT5uilBIuq
	tkbGn7yzrb3qf7yD2YNsKDI4g=
X-Received: by 2002:a05:622a:4c06:b0:4ee:1f09:4c39 with SMTP id d75a77b69052e-4ffa77b0786mr19205701cf.45.1767664036343;
        Mon, 05 Jan 2026 17:47:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8b5wQ1r9uhUnpcZPmLVLUWo5MG9jQqpTpL8R25XNY1olFU8WIhUtd5PhZyWeXmwJWQph4Yg==
X-Received: by 2002:a05:622a:4c06:b0:4ee:1f09:4c39 with SMTP id d75a77b69052e-4ffa77b0786mr19205491cf.45.1767664035927;
        Mon, 05 Jan 2026 17:47:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d882sm201093e87.40.2026.01.05.17.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:47:13 -0800 (PST)
Date: Tue, 6 Jan 2026 03:47:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
Message-ID: <6qvzhyjrxctrrdvhktxkusyhdcohr43muung5paan2i35suxwg@kfl5kkmpv4fw>
References: <8bcf058f-5bf9-46ce-a188-e94954101f2f@oss.qualcomm.com>
 <4f79d090-7d1c-4fb3-a835-a7e4ff96f79c@oss.qualcomm.com>
 <448f2efa-5b1e-4855-a62d-2e375938b36f@kernel.org>
 <c7983b8c-5085-43a0-bd5e-1194df2f0ee5@oss.qualcomm.com>
 <a2b62af6-fe17-4c4b-9dea-4ba9cf312765@kernel.org>
 <j7i2oryel7d5u6gsbb54iaer7amqre2vzwkb6fieybascvonwi@bmt7zmcvg7yi>
 <36cb7d6e-ece4-42c7-bc11-b66837df5fc4@kernel.org>
 <469d89c9-8f6c-4abe-9d9f-b6a47f8cefd8@oss.qualcomm.com>
 <f54dc011-1796-4088-8bfe-be19e8bd9157@kernel.org>
 <bab3794d-d7f8-492a-82a2-6a8a6f80a708@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bab3794d-d7f8-492a-82a2-6a8a6f80a708@oss.qualcomm.com>
X-Proofpoint-GUID: zR11MhwXpX9soPaAs0k6cgS0oni8Zkr_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAxMyBTYWx0ZWRfXxCGDaFYx8Lc0
 mQ2mnTq+OLCRv6O4JHb3kN+7f0cPqGtUrO56gmCdBlMRl9PQPLbGzrtOFeGA1OaB9T6Doy/e6/a
 RtT3/pnvLmPY1qEV+qxBJx6Ox5ggrNsZ9SQkeG/4xD4QBtdSX7w9nL8UrA9e5xyDpeiXpfynTcR
 Rv+2eZdnJHR5CHQPxQk98uCu5YbWdd9TfEreUGdYsC0r6BqPpbTwrrlB3b7A4t2U8rpB+VGavps
 Z9p0fAc3UTs06MoAXB77fs4NXNjVtjJVhnQenDp/BGeFRISqnsG9gye9qPRUCMYM0crPk8pM2nN
 +Yw0sLeBh0DPz9PK9KWiJo/jNASAOlwRiGtA2VkSbYNHaTJ8FGPT76ImNHwHEdm4yRtjhQYVgSG
 Rwq4ENx2Cki+RbEl5FIbIEVK0+yBXLpN0gBQf20/sNcpKxrulWS6DXRTV7D36FxpmlORzQKi+6f
 vhmFjnE3oDQf7fGMH4Q==
X-Proofpoint-ORIG-GUID: zR11MhwXpX9soPaAs0k6cgS0oni8Zkr_
X-Authority-Analysis: v=2.4 cv=Yv4ChoYX c=1 sm=1 tr=0 ts=695c69a5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=o9gZ3E98-_iyyBjGxhkA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060013

On Tue, Jan 06, 2026 at 09:24:38AM +0800, Tingwei Zhang wrote:
> 
> 
> On 1/5/2026 11:09 PM, Krzysztof Kozlowski wrote:
> > On 05/01/2026 06:36, Tingwei Zhang wrote:
> >>
> >> On 12/30/2025 3:21 PM, Krzysztof Kozlowski wrote:
> >>> On 29/12/2025 21:08, Dmitry Baryshkov wrote:
> >>>> On Mon, Dec 29, 2025 at 09:47:05AM +0100, Krzysztof Kozlowski wrote:
> >>>>> On 29/12/2025 08:38, Yijie Yang wrote:
> >>>>>> On 12/29/2025 3:21 PM, Krzysztof Kozlowski wrote:
> >>>>>>> On 29/12/2025 02:23, Tingwei Zhang wrote:
> >>>>>>>> On 12/24/2025 8:12 AM, Tingwei Zhang wrote:
> >>>>>>>>> On 12/23/2025 9:41 PM, Krzysztof Kozlowski wrote:
> >>>>>>>>>> On 23/12/2025 04:38, Tingwei Zhang wrote:
> >>>>>>>>>>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
> >>>>>>>>>>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:

> > If this was the same SoM, just with different SoC soldered, it would
> > have the same PMICs. Different PMICs means different SoM...
> I agree. It's not same SoM, but they are very similar with same circuit board.
> > Anyway, I shared my opinion and I am not going to spend more time on
> > this. It should not be my task to go through schematics and prove that
> > PMICs differ. Authors should.
> We will make it more clear in the description about PMIC difference.
> Since we have the agreement that Hamoa/Purwa modules are very similar,
> we will use common dtsi in next version. Please let me know if you think
> that's not correct thing to do.

I think, you have been clearly told _not_ _to_. You have agreed that
they are not the same module. So, please stop.

-- 
With best wishes
Dmitry

