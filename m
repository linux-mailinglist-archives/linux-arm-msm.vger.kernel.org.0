Return-Path: <linux-arm-msm+bounces-101911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC34OmsI02lgdQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 03:12:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 908093A0FE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 03:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 928783007C9A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 01:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137C92DB78C;
	Mon,  6 Apr 2026 01:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gzJUqMX/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FdRaeI/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252592877F4
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 01:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775437925; cv=none; b=oCut58dREJS+DlRONj2Ygod4nrNNK460R0OQ+IigmxUc7EnfbAsuAIfSi/1AuS7VvPe1Lq2VJ4+MPTcDrRpGO/p8rli23njb62c0mlh+DaJnUhoIhxlFKBZbJ5y/YM0Wmohv4rx1LPTMmdqTW9X7CH3JI+W7y+FxruB9CgHjS7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775437925; c=relaxed/simple;
	bh=Gzpg4yDUsWAc8aW2BuPjyZeXVNR2WuUCJjXUqKgJM0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJ6Xsr7VgD63DcbvEHn5KquRLdAdEJC4DZXY8xV5WybnNDMRp4/9uqN5X3Blg1Nf97BpivQzkCawUAeMP32NswZU8ELQtiDsEZe9RXkhVYtgjJM+d5a/vjklqwe5jDyDLq5BzOrsWTof1TzwLahdbcuFv3JSZwlWhRfbYWluZJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gzJUqMX/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FdRaeI/f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635LoGhT367411
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 01:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sJ6QF2B9Gl2iuduiO539PK7o
	l4CzootqweIKsqMau/4=; b=gzJUqMX/fqGj0mnu+FKAL3ggrOqqfmemmGgDC1FE
	W5gQmzAFvItdrx7BkytVsu/xWIXKjHL/jn+1tqVNKLwZgUuGVUafa0InuzR6VhDk
	B7q2WYjhySavx2lFhUOV4lKdxwv3qGb+G8CTHd04MYMPBuECsKatU0NUbzlpjh/e
	WJxql5VBf2hMlAxH297ooyQpjN4q8y/X9Yuh3UlX6an79AG6UUX0a21UjHVn1Ge1
	W4shLIKxdaq1X0/zu2QDbxX8hnfBcqJ8lxdtbrDLgN0Y3Bsipn6lYbo/BwD4Yd1I
	xZMxF3NZDF981zt63f7C/fwWXpbU2FeRfdLj4NtdMkBVtg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqske75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 01:12:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50917996cfaso113648591cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 18:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775437922; x=1776042722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sJ6QF2B9Gl2iuduiO539PK7ol4CzootqweIKsqMau/4=;
        b=FdRaeI/fx8jVhnsSKwy+hRqI/RBfCZU4SSCkFGn0QssxBJ+x/sga2gCZpz0DL/GJYy
         jrnD/CZXA2IcgpdQfqKpH4eebU/wwkuGgvVpIVDvcZgWPkAxmfSEA7fK+t6f77rkFREh
         4BoOeLRewcQAyW8cQJ4OfVf9q3IZX8rD4l12+cms3lT2SlZcwQkOlx9NMuez5P5HrErm
         fJ0wTQbL7Askh1Kw9zI8Ksf+MJLjxeXAAhfNkFTHbrkH1AFHa2IRINEoWsdEDypIKkgq
         LcfbP7Mvqb+xcynJe6h0fWPSwoYPYp0m5ttH5L3tjwwh+oQIq/9HUrBp+J5bpNlO7SZo
         dbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775437922; x=1776042722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJ6QF2B9Gl2iuduiO539PK7ol4CzootqweIKsqMau/4=;
        b=OMIYfpnEwNzyG6PRnGN0a2MK3OX4Q9BdYcazHv047xgFoIOML63lMyyEQPxyZCMzw+
         lyrxy5zvkyIcBAVLQg6WK+YnnFuWkMA3T2e1wT2nLbqUMiZSdlkGO5q64Dp8zEgggHEs
         C98j5pPPlpe2I5vf/PYojQck8ZXJiKLr7gGypAlLbU3l9BglHlbd706sIy4qtXHKFNCs
         VheUfvF80UXXKUY+PQJawDudsp3+bcwhjiroM+KjQKG1WBSn4LvHYwt4o3iEPN+UCHYx
         R/MhxCgrHuWDWfy6/WkCTMLPI/akOPv3nMkDpOa5mpBg25p6qw2FaLY6xG1eZYYNCY4v
         +XtA==
X-Forwarded-Encrypted: i=1; AJvYcCXpB0C9sZAckWxPQxBK1O6v54ibxwjzknpPWhs8DDU0UudoBPhNrVt8HUCFmKPWB0/sjyRFwNOOZUeS7adv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+NAYhHLJWew0ZDkGEVDD+OYRT6PL5OUhDpk61GcBHuLHnCyjF
	dgZSFxsYnUpqEjVFtktszL/uy9SjOkYDng5ln88n2C7He5MWQ4JDRVPYYDAIUux/Vx6BD1M24sb
	dg9o65RXyfqkHK9u2/0tpBU+3H5DKXy3ibk4VYZmfe7+pF3hhVF/MsRH3Uqnm76czGh9m
X-Gm-Gg: AeBDieuhmz37eX0r6Ih88O6S1fBWmwtzEQW3hLQ3muYBohcPjctrpnRW8aIoM2s6VHv
	A+XTcXvG9o1qU9u1GOVMMKd9fzN0FsfJ4h0uKweqS/2pnsjTS9v8QEY+7Xmu/Q+WFVD6bQvIkGp
	F6ZlwfW0n7IXWcj4kTiH3TAifu0HdGJ69V6orOtROzoJfsFzMROet4hRwrEejw2cSls+zVKSi5u
	zqwQjNcrt4jNJVWptz++ai02+WCR73Ai/1ZTBE4cTvjczQE2RqdsYQJhcjG2u8RFpNu2Zx2Hp7p
	RhsMjW3Ks0xsTLSLtceLJbBrJswZJwFOqPQKhSZyHfNXLYtnxohYKj7yxYiyhob4vl920Y7GZLo
	GaQKxUuHC7cFrBecdJMozgnDmURAX1QGRTAWifYkpRUAK7650tCIEi8GHJ8Pq/d36yN+96jLxp1
	htbRsdUIMsoNmjq0Ex1DmAESY8Ihum27sTvNg=
X-Received: by 2002:a05:622a:4cca:b0:50d:7c13:6b14 with SMTP id d75a77b69052e-50d7c13732cmr100361301cf.14.1775437921389;
        Sun, 05 Apr 2026 18:12:01 -0700 (PDT)
X-Received: by 2002:a05:622a:4cca:b0:50d:7c13:6b14 with SMTP id d75a77b69052e-50d7c13732cmr100360921cf.14.1775437920977;
        Sun, 05 Apr 2026 18:12:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ca32c0sm3038067e87.36.2026.04.05.18.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 18:11:59 -0700 (PDT)
Date: Mon, 6 Apr 2026 04:11:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: display/msm: dp-controller: Allow DAI
 on SM8650
Message-ID: <xannpjqglr6ag4c6dln4kash5pbytbsvjpaytjyrk75p6esoj2@hanwlnbu7c4d>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-2-daa54ab448a3@oss.qualcomm.com>
 <ozofiq5dwk7luisfa6a4e4wbqw4vuvcs2h463hqxt7uee4aod3@j7aslgp4hkn3>
 <c17e30a7-6aeb-44d8-b3ad-b417bd188dd3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c17e30a7-6aeb-44d8-b3ad-b417bd188dd3@kernel.org>
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d30862 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7EEuWH7kyJsibKM1IGcA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: rWQ2lsbrXS091tn3KR5jbu181H79-saZ
X-Proofpoint-GUID: rWQ2lsbrXS091tn3KR5jbu181H79-saZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAwOSBTYWx0ZWRfX/LdRrh8m/DWN
 XyZfbSr40ZvHcbZjfAWV18MxHukttZmkbSFY46mzieKpdw5Ze3T4lT7RJRH0deUPGriVFoCRx9U
 Vo4tGHW5LAhrkQDd4D/mfwZKN3z/i3+dnYV08VMCbg6QnJ8Cy2JMqZlByoaq9h9kdGUIMVtLsj3
 JzKLvQBylR38vUs2J+O4jmxqGDXLfdHYswF8VK+LLKuYFAXTZ+1mNQXfDorWrOnXtqP9JXnoRtZ
 Z0f/GQK0EUG0ahfMeLducSColPCKZkG2TTvzKJwdKb2+5ug7VCZl+4ctkiDINdrFtxGr7Pb5Tep
 ZLO9fXK2UtVGvSTwc01L8oG6WlW3/4w/UN6eS7W9KsJfzz5m81iGu1C+ujS/d9JMDpdf6Pt1i1F
 1ZxX1jeZklsivPj5SBKO2/eWsSPBXAtysdzyJw4B7UQCWW8lMLVkfkhZRV1fYdhA1ZG1myaJkLq
 HO2cH6MEShKvmLiiHjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_08,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060009
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
	TAGGED_FROM(0.00)[bounces-101911-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,af54000:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 908093A0FE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 08:54:14AM +0200, Krzysztof Kozlowski wrote:
> On 05/04/2026 00:04, Dmitry Baryshkov wrote:
> > On Thu, Apr 02, 2026 at 01:45:13PM +0200, Krzysztof Kozlowski wrote:
> >> DisplayPort on Qualcomm SM8650 (and compatible SM8750) supports audio
> >> and there is DTS already having cells and sound-name-prefix.  Add SM8650
> >> to the list of SoCs referencing the dai-common.yaml schema to solve
> >> dtbs_check warnings like:
> >>
> >>   sm8650-hdk-display-card-rear-camera-card.dtb:
> >>     displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >> ---
> >>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> index e4f17d29343b..f8daaee8d065 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> @@ -210,6 +210,7 @@ allOf:
> >>                enum:
> >>                  - qcom,glymur-dp
> >>                  - qcom,sa8775p-dp
> >> +                - qcom,sm8650-dp
> >>                  - qcom,x1e80100-dp
> >>        then:
> >>          $ref: /schemas/sound/dai-common.yaml#
> > 
> > This clause is for the platforms which can work either with the eDP
> > (aux-bus) or DP (sound-dai-cells) setup. Instead please extend the else
> > clause to $ref dai-common.yaml.
> 
> OK, this binding is not getting readable...

Feel free to propose ways to improve it, constructive feedback is really
appreciated.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

