Return-Path: <linux-arm-msm+bounces-93252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FB3BwV9lWl8RwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 09:49:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C52215448B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 09:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD1373001CEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 08:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94A926A09B;
	Wed, 18 Feb 2026 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpFn/idK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TH9TuM+/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DD82FE57B
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404279; cv=none; b=uUxdRvIP5aJ6fc5wsvf51F+Njz+EB6au0ybUg6zrp7sDP0/58hGNhGc4sBGXWmvUV4nW4HMPlQzieyWxrc5cpVajq8K/CVSSl1+wco/OnY6xT3IgPHmIzC9Src6c4w4178UBwa8NI/fM117q9BbHvsP+icaq+DSago3LDelghtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404279; c=relaxed/simple;
	bh=ZWt45yH42sDKPvaNptuhnbtCXjsl75kDpLBkxKkK3/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vh6WQ55EFo2ir6YdJ0dAs/s5bJzFmpD39Tn+55zAwugVgJUV9/bVmhnz1q/YIw29YX0EUi3xU1lU7FgLOr+aQWyf9ikcNULkVQUit8x3P6qn07Zy+v7b129WpnvRsPO79jcdC9H/yrjFjEy22Dr2JSJFvt1oILSmTA/pWIIqOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpFn/idK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TH9TuM+/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HKqYDS2784604
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 08:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4AGbJPnQwFvIJpxdlL3I9UAJ
	Z5tojgKAthjJExwJ3o0=; b=gpFn/idKggaBGEOlGCSvJgBX/yb9vG+qv3U02/Wk
	gP1kOYxh0dMP1S70/DN8MwJHVtdR/YOi5TsJoAZzvL7NVugMn9xAzv+aiwTyQLBq
	tfbf65/TpvqwM5lMU5omQUrSWI7UpKTKBFd9Jdvk8mP0ts+06vY3e1GclywsVrYt
	3GWOUa8Bp61yfbUSttmCqmEXYF8iiu9l8CnzsBhHtCu5APJGdc61mNLjRqTD09co
	52Z9ZeVtKX7dU/R7v7ILLBFxmWvDhNlhwAjnHkqAJ66ZGRi0OOE83j/ry3isF6pi
	nrysXgSz7YHopUjNO6scKb/HpZvqBXOS6YiWWyyPpcx5Rw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyrk1j3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 08:44:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4a241582so2878243785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 00:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771404277; x=1772009077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4AGbJPnQwFvIJpxdlL3I9UAJZ5tojgKAthjJExwJ3o0=;
        b=TH9TuM+/eTOksLLdb3d+uFBZNi+NDgsuXJTSy2HToBhwygwYR31egp3VXQ7pVs1/4y
         rQgUtmjx3CdNEup71JB3Tshzwd/AxmWrT9UCa3LmiXVhyLCswJbxma8J0KTj5zEZwY1k
         BWSvgMX01PlWXwQ8AyA7q2omju1ue4f4t7XCrruzv4gBxIJfVScaxPXd7mA67UOR83fP
         lf7sdldtk0Qzfe1b0iJFagV8dRjqnTvgNblUFbMzZ95K6i3Nnw+MS8kJ2d/0LMUf7SN/
         xhkK7yvH4v7iGyDYNkUYbKENF+4EN/Tu+AGhaJo+Lk1oTCoGNdvtD6qNjjCQYMWViL9e
         GgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404277; x=1772009077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AGbJPnQwFvIJpxdlL3I9UAJZ5tojgKAthjJExwJ3o0=;
        b=SWwCQ4obzJ5R0+gIoQLNWhOmRgvt2ugsNFgxWtdX4K+PSuBkQIklECPrUiib9ZqnaZ
         l381J+Ygt4yx2mEx+0ctjC9NgXofKVM9ez5+TMZmSgKpKcDmetPmryDFxCCQPbt0XmGg
         jwXM/po/A0WmdeFBbcyhvrIKasODM+ZkkHKwkzAfc5UpySC2JfKx4yxRJOB7wwz6iNpc
         k7abOe4o7LNsfRCNl2tJFLukeTo5s/cO5379YL+ZlM0wJMNy+NRR/CbZTRIVQeZhf6eI
         h95DVogQJXHKA7XbnTejip67rbGHe29JSugCxZyPUX+q69bInjyPjkijBS2CQLvud97/
         JvBw==
X-Forwarded-Encrypted: i=1; AJvYcCU4lCFUwyTxWl1BQm+uv7Q1z4wTbOFNLm8eBC4kN5DV70HY9MmYhUC+zUDObV6kYWnJsFZH436hvFS5WkoO@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/u73AHumcdSPwB93R1jLuRlZ8jz4xwXfhvPjUerfs8rEgDP/
	43Wi6G7sqfNAmsuNEtcEG7CUEA789yu8Qny5x2iCVZe+s669wE6QJJ7GnqAcaqronGX4L97QwA1
	PRISnKV6C1S50vJ0gX9OhPgW5f880iK49FwH/MH5zGWENRzQY+erxHKq1DA5apsYTSr/c
X-Gm-Gg: AZuq6aIbo4QHHte8VB/xB5e8N28WLjcl8xOWo0uuymkPii9U/Lwc9hGKeSGjskUoTrJ
	ugSaKOYrf1UIbNSXyqveq1HZEnjk5Z/HmWulwJqc0qQolQ66BmUcDuTR8imSCLycV10MYkmwkqu
	sIekTJv7+ME1LuCvnJM6jevVW2JgCYwVBkUzDDVpvRx7/i+jHPVGieZaQbYkXo8BoaTyo783IVP
	nXh00uUkb5e/wm3LJ8sKoicWyWuhiMnKE+IM1zDbcH+Z5lKvlpWjEc2IJhNJ5f3cM1Cw4hqxfPd
	0HrRgHqGqSvbLkRxsXtGrHeBQ4ngt9udPEwzefQb8oMo+LNsyvXpc7CCNDRfblnmOBPyvygjhKO
	SsikWFJj8OBwDj6PSlu7Bz49fsnGbZRvqjT7hl73QUv4GNxLJhZ8rXFzcg2gKM3ynCrkqcevBB5
	LTsKZhpSXoWr9e3RzPYhtMvA2uhXa8JNyrLD0=
X-Received: by 2002:a05:620a:3f85:b0:8cb:5477:5269 with SMTP id af79cd13be357-8cb547758f2mr1364564085a.3.1771404277178;
        Wed, 18 Feb 2026 00:44:37 -0800 (PST)
X-Received: by 2002:a05:620a:3f85:b0:8cb:5477:5269 with SMTP id af79cd13be357-8cb547758f2mr1364561685a.3.1771404276625;
        Wed, 18 Feb 2026 00:44:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b051asm4338028e87.72.2026.02.18.00.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:44:35 -0800 (PST)
Date: Wed, 18 Feb 2026 10:44:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,rpmcc: add msm8960
 compatible
Message-ID: <7gdpb64yu4ydcgfejfavq4g6vc3rz7cn3h7shle7gx6upscpki@podywah6acxh>
References: <20260218-msm8960-sps-rpm-bindings-v1-0-bbc11c0d4f24@smankusors.com>
 <20260218-msm8960-sps-rpm-bindings-v1-1-bbc11c0d4f24@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218-msm8960-sps-rpm-bindings-v1-1-bbc11c0d4f24@smankusors.com>
X-Proofpoint-GUID: R7MwVGEw5mSh5OZt7UuXhxm382ErBDal
X-Proofpoint-ORIG-GUID: R7MwVGEw5mSh5OZt7UuXhxm382ErBDal
X-Authority-Analysis: v=2.4 cv=eOweTXp1 c=1 sm=1 tr=0 ts=69957bf6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=wxLWbCv9AAAA:8
 a=HlxF9o-pF0jV7hyblJIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA3NiBTYWx0ZWRfX8KNesxShILI/
 SHSi0Em6gQ161n4k8RUwCaE8MF+rBAjqaWKFcKmrj8EVNB6s3o9/QGJfBq+28HD5iW8WizIEyGS
 21hA0ZOjtYZN3BNTHJAuBibfJsPmkf9g78rwM7U6sxY93uThKfDYsm0tsF/WV9eGU8e4hSyApZf
 Nh60iaJdEbKF8slRcsELUYZ38AqTqST30w7+gclmnI9ay0TH3/MWd6qWPEFfGnIecG53QiJvq/7
 FmCkleBtRLRjHDfJcEtDH6YBktnEQzUFO3a43QwTb8E34WhcMY5Af0ntVkkJ7Dy+9pWj16p3q0j
 Zx4X7Mkj+ji7Sat/6uxHrdTbiZRYrViDd9/Ox6sRRjtngQ55mXi/I/aV6zrVzQB6J06dZvS2l+2
 JhxsEMlns66jBzw1RyrNshbGxC2xJ1cYggmMoEEVgHN/YWs4eUxaWMIu8e0AmizMqJRI0L+BMd7
 Zv/qyzimzRSSyxAFQcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93252-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C52215448B
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 06:59:05AM +0000, Antony Kurniawan Soemardi wrote:
> Document the qcom,rpmcc-msm8960 compatible.
> 
> The MSM8960 platform shares the same RPM clock definitions as
> APQ8064, so extend the existing conditional schema to treat
> qcom,rpmcc-msm8960 the same as qcom,rpmcc-apq8064.

The way you implemented it, it requires driver changes which were not
included in this PR.

> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..f84d08199e47f45ecb176d350eeb7df8c3ff506b 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> @@ -36,6 +36,7 @@ properties:
>            - qcom,rpmcc-msm8937
>            - qcom,rpmcc-msm8940
>            - qcom,rpmcc-msm8953
> +          - qcom,rpmcc-msm8960
>            - qcom,rpmcc-msm8974
>            - qcom,rpmcc-msm8976
>            - qcom,rpmcc-msm8992
> @@ -90,7 +91,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: qcom,rpmcc-apq8064
> +            enum:
> +              - qcom,rpmcc-apq8064
> +              - qcom,rpmcc-msm8960
>      then:
>        properties:
>          clocks:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

