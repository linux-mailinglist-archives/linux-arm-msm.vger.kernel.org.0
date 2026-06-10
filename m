Return-Path: <linux-arm-msm+bounces-112474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XLs0D/ZoKWqNWQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:39:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D6669D18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:39:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ICR/aSus";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=E2KraJi1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112474-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112474-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B89403219FC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A83409631;
	Wed, 10 Jun 2026 13:31:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE6E3EF67E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:31:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098312; cv=none; b=ZChIbwh2vgXcg85S9p+lKrvld2YJiIEF2BzN/IuC4tS5VjkREN4Ar/AlP5cu943+1ZnAwHrAj0nggtDR2vF21WzLdntHUFfCTKEvaZ22OFMYnUmZ7sl2Ub5nNWBFloFy2ohpNgUf5L+eiOBVlzylkp6dYg+wBZCRn1rTf2ojOKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098312; c=relaxed/simple;
	bh=IKjF3NcjCHpUA9fLpGIEglNQEzLYSsm5AlOr/umqTDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPqJfyvZ9k27a1Mzl4iqUjB1yIzyGx66vP5LjvRPNnbLML9082fgeBBRFtzOOomLK8gQ9kbDFSwmSswMMpA73tlIBP8lOzHcJU4D1Uw8CW8CHhnqHdiTTmga38M+D/ljKR4Z+dJHJaoTgQYAOyHav34oCQqLo1pRzyTvNpN6Qss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICR/aSus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2KraJi1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBeaT1138062
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wg9PboEwMxlYPdtB2q8pTY18DjjWx3Pqn276RgTauZY=; b=ICR/aSuslL6b0sMB
	uRfP3A/2hEcK1Nc8h28i4AOggzIaDORne+4X59pQW1/S0tRJ4OUBcER0whl/unCG
	+vhfTOavxKRsjfwy1YdMLKhP+hTxHTXWB7Bf/SCm3TAgt95Es1zyd6pXaVBAWYku
	eb3EuSnl90V/KM9KFUXMCYU7BJEnpDusCsvWxP2NDBEgagLY4TQnGU0iTMY9t6ep
	eiGq2LDoWVfeRYQx5/tjEHX0wG47STekL9AjIQDDebDi0IB/E9ByFVqeeMP3oXhn
	WZsnrQsIsDZm+ls2899gfwSY3fmtue86Oo0rSiT/in50zSoTjOy6ftca83uQLSst
	v9EsFw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2jmgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:31:44 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4865626337fso6151601b6e.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098304; x=1781703104; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wg9PboEwMxlYPdtB2q8pTY18DjjWx3Pqn276RgTauZY=;
        b=E2KraJi1ttiH3AIfRTB2OciUeyyj28ClM25xceTdl1GdmHZ5hIz+VOZW+yxzDnxz8t
         GICbPyJWq+x1Px6sEBMtIZ7ILLGuSG0kcpyCEQ+XqWa0nxJ4hl1YJM1JqpAc4QT1QYn5
         eVXqoqQd6ABDmBW16i4uObkZCqTfvEkAj2Ksdm21L+/vGoD/+jTQxZBWZLmvEBXCRpz7
         1j0ZnWsElhR+f5PR9NatWB3a2McN7mZ00tTcJ86lg34BxfTFGelXkHtDAxPy4TsBUh1F
         TCBUHJb3jHNFIzYmrPNHrVacpUDYkTen0aVowNTlrpWzLQc2DDCBxZjOIi3OT73WkP24
         SR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098304; x=1781703104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg9PboEwMxlYPdtB2q8pTY18DjjWx3Pqn276RgTauZY=;
        b=DMHppBlVY7TRvhxNyNHKaZZxIyVRpRglZB2gvvjMWrSy6woofLxFkOt2val2mib8Kd
         ODKPAVujDZY7RDyovXTmd29smiBvYZJGGs9viLrzT5mCjk+yG5Z9SoJ/pEgRjy17DH2a
         Q7b8Dw3A2KuylS1bj0JEEPMh/XAg7PE8dpFZ0hWJNcpqhBv2uR5RSTGzcvZC0pe5dXbK
         gIhck+VZ0aB+bjJi3JOVxEFY38GoJ0ivP6aDIe8Y0BCnb7PCN682jBZVgZbOz9hbtpPd
         fahzlYw7hC1T0scLic4L4WPRycDMovoRi0V1wenXmpdMfPUceqrzHssfb0OsMkAOTLUs
         qFMw==
X-Forwarded-Encrypted: i=1; AFNElJ/BMymR0Fwp+YV8L7wyuFRslqYBYf15zM/422eedJNgrckZ21a3Y27nKFUYeEbBYt1oPEYd8Sw+VhdCycLw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6XEatPKBRoNu9ZJv5mjlcCCG4KOK0I4up4u+xEHPWjGu7UO2f
	R5zo9CHvcENmsUfahOiyvAxARGky3oNWly//1OgtCBwd3y2McUljNI3bAyweGCmvkNtzmjj03ln
	ewl06qJmBPuehvnu6BOU+CuHXw5CxjZMsqy8B7Pv9HPZ+wh0/p/Bf9rJ+N1SUyIv8aoH6
X-Gm-Gg: Acq92OHZhPAE//heX02VBWWFYx9M1eQ/1/VjCWMh65GJDg2edpmJgn9QP8aQapgTtFZ
	mrs2Op06L+zhFUp9/QT/Q9tFhkSSJMP/fpq349EhorNet25GiTRKGuuuyFAhBuPWjfN5WK/uWAM
	cy31fMEcY1ymxFlMhsjtLiJ1fB2jiRASdUEGW3D1lCdKDe2Tj5KD9Pb68TqO9EuqX0r1To7l6TT
	q3GJcgwLkPHAb4831N/02UFxKM1JCFH+tP2HlODPi5etLLJzW7bBK0oGPFYQ+LVNfv80AbqVOAC
	FL19nE4l0bFeqf/JF3MCKuAO5wGrekWobji+P/wM+WD3G4z2dItzQkrvISpUeGn4ycs/HazmJB9
	wkp/XBKNMY37l09RTR0aZ4GI6qZS/fLAIK0R0abvBKDQ=
X-Received: by 2002:a05:6808:f88:b0:479:ed26:fbc9 with SMTP id 5614622812f47-4868df001efmr14620727b6e.32.1781098303573;
        Wed, 10 Jun 2026 06:31:43 -0700 (PDT)
X-Received: by 2002:a05:6808:f88:b0:479:ed26:fbc9 with SMTP id 5614622812f47-4868df001efmr14620647b6e.32.1781098302891;
        Wed, 10 Jun 2026 06:31:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3e5a00sm557977595e9.15.2026.06.10.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:31:41 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:31:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, rob.clark@oss.qualcomm.com,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
Message-ID: <uieb6ukjokwnppc5zfr6bjychqsnpikwmiy7j7dmt2kgk7k4zi@2stv37ijv36o>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-2-57c70c23d0d6@oss.qualcomm.com>
 <7a330941-8715-4523-9f39-10b57586c69d@kernel.org>
 <CACSVV03J7Y4-ADRNE+4qArqsWvQZ3qmTc04r7vmY64s0qDYFkw@mail.gmail.com>
 <799fea04-e7d0-4184-b9ae-4cebfdac38d5@kernel.org>
 <841a54ff-6287-48d2-a513-a7442d624ab6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <841a54ff-6287-48d2-a513-a7442d624ab6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a296740 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8k6WQxmsAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8xXDVyUwim6Fg5z79ZYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOSBTYWx0ZWRfX7Ll5oDIT1bGV
 vDhEpl0vY0yf/+VsxV14G7AxKZpiRvJrg3V8i/ROJiypkDs4ZbIrnYc6t8pQZM26ePi6bnf0471
 eklygwKsY2N5FQZjMGsCoEq3Qe0ggjTBi5TTyREd9wAc1ngXiGmTqWvadTo+Us532zUJuscmyVi
 mwtMBhkgmgkFywjugiAUqhiRjZvVhvA/Yz1Pkmb6Aa3cTNE+lTYSz2xGpAHhXUhGhKvNbwn+bl6
 83oOaFVRjWFEXWFte4r/Nm5EvJP616Xs1Irud3sWFl+BDFFQUFuG5VwDzyktLvMb9PRIvc/KVsq
 AM/LWGJ7yaUba2wiextPHUBMtSIRrKZ9TQcjzEIsQ4linxzDVE49mRrb7HxJMeiVFejcTxjH9m+
 S9m1FQLYTys5WxO7SaqnteF0Q7oIkshlVs7zmb1yx1iYzA0L4yX0mjs/NmGqbIT/sTf9bWOtZQr
 XHxyIpqjloClq6nx6aA==
X-Proofpoint-ORIG-GUID: 57FRCyxCGtbEgkV-GOYeKwQqu3pU5pUt
X-Proofpoint-GUID: 57FRCyxCGtbEgkV-GOYeKwQqu3pU5pUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100129
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-112474-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:rob.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dianders@chromium.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,chromium.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lenovo.com:url,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A1D6669D18

On 26-06-10 14:12:30, Konrad Dybcio wrote:
> On 6/4/26 5:18 PM, Krzysztof Kozlowski wrote:
> > On 04/06/2026 17:13, Rob Clark wrote:
> >> On Thu, Jun 4, 2026 at 8:09 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>
> >>> On 04/06/2026 10:06, Konrad Dybcio wrote:
> >>>> The Yoga Slim 7x Gen11 is a Snapdragon X2 Elite-based 14" laptop from
> >>>> Lenovo, featuring an OLED touch panel. Add a compatible for it.
> >>>>
> >>>> According to the spec page [1], there  also exist other variations
> >>>> (based on the Mahua SoC and/or with a different type of display panel),
> >>>> but those are to be described separately
> >>>>
> >>>> [1] https://psref.lenovo.com/Product/Yoga_Slim_7_14Q8Y11?tab=spec
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> index 50cc18a6ec5eddaf48542b85387c2d430cd4721a..fca3d180489d4cd3eb2726a722f15febe44f03ad 100644
> >>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> @@ -68,6 +68,7 @@ properties:
> >>>>
> >>>>        - items:
> >>>>            - enum:
> >>>> +              - lenovo,yoga-slim7x-gen11
> >>>
> >>> I imagine you might want different panel variants, just like T14s has
> >>> LCD and OLED?
> >>
> >> I expect this will be the case.
> > 
> > Then better to prepare for this now, otherwise later you need to change
> > bindings. If unsure what other variants are, then at least make this
> > compatible panel-specific, e.g. lenovo,yoga-slim7x-gen11-oled-foo-bar.
> 
> I took another look at psref [1] and there's only OLED SKUs (today?).
> There are however, two different resolutions available and both can be
> touch/notouch.

If the other SKU doesn't have touch, then you might as well mark now this
one with touch suffix or something like that.

> 
> I don't know what this will entail - if the panels are both samsung, I
> would guesstimate the same driver works for them (and Doug was against
> adding new compatibles [2]).
> 
> There's also different SoCs (which will need another #include in DT to
> override, sorta like hamoa and purwa models; they seem not to be
> available in the store rn, but I'd assume it's fine to just rely on the
> SoC strings in the compatible chain to differentiate them.

I think this can be reworked later on, as long as the dtb name stays the
same.

