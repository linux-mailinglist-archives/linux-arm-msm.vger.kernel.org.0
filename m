Return-Path: <linux-arm-msm+bounces-92594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBZdFPtTjGnrlAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 11:03:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBF01231F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 11:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26B373080DCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F3B363C74;
	Wed, 11 Feb 2026 10:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcpWnrAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWtM6CXj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E133B350D6B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770804134; cv=none; b=HiQRAC5IqwAsWFCMI2xhRU2/9DHPAU+BUUJv/ynPZiem3fJDkMMilyF0D/SBGZH8O9Ht4Kd93ibaKo5Oh0YAToF1fPhWor7QTl7jMlaOrpfov1JORh5us1hA9Ra3LFcaTI4LrIHSxFr0eOExdrFod+3O5UXPh+ynsoSjnRRwkiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770804134; c=relaxed/simple;
	bh=T72wuyPj1r6O5cCFPZ3QgK3AagwmM6jBQS7cfFgmDqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8cSmBJGEjOJbYnTs/IXPOdtydMSxseUBtB2GQCKJ1XhZT0xh/C9ApPArhqBKhBbOVFibFywIfYF1shOjRJA4uGNWdleaqCZT2D8cx/7TUfHzlP4juBOqO5mTHMk7W1cp4gsEe1cTZgBolQl7QmTlUJVPW+Luwco/AabZdcJkb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcpWnrAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWtM6CXj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B67iAj2640775
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 10:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nchpKVdYOXJD7jz73jWfX5Pi
	9SWnLk3tj6catvmsON0=; b=LcpWnrASbCMrGAblunNtuo0nExW4QrsPV1wvIXVQ
	YzPai8UCNNwRzT6MZuvxjLjvh2O0uOquduFrqyo1dey4rrjcUMKFLgl9ZxHfU0cv
	/DTOniWyuv7OQ/ZBqxH4Zz/R7y3O73Qp+TkitV6azeFQOLLssNibQRJ6PSkfgZlt
	xaQ7MF5mL0IEl1vhFsTNVENfc6yI8GAYWf/vci+ys2p2acUADB2oZv25aQMhqxPi
	zTRX9tMeId5yIn7n7C87+iJ/XbX/RtKYPSSIv/xIokJucGPe6w/rMq3XYs+zDYrx
	X6jBcSFoslQhAT1AqR/h2nVOCgdj6kondxSlsyh5JLlvGw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8bgnjakv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 10:02:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5033c483b76so217247311cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770804130; x=1771408930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nchpKVdYOXJD7jz73jWfX5Pi9SWnLk3tj6catvmsON0=;
        b=AWtM6CXjNHq1lgKpdM+OZ5T/XB+MqLzRV0HLgj8utJ0W6+W7mIROrY9pKT6rB4IHwQ
         0sExMyIVIP0T0uo4MVDZEJpQ5xs/kbDvus3Y50JhSaVfMpot1wv+Qrdm9IerIm+uH+gw
         2/JYdXJ7JJLsmWqxA1tv9m7gY4tsv7JNTIlVd5J2D5VuzBDC10HH0eMBnDUQyCCKM0eg
         y305Rw95eo8Guvi3gLm798ZHY1C641j2mlvie6bNj4OMorCsT9OL43d3SuF1DW/PZIUC
         Glaw2hQ5YLkpkIhO4C4po15GVlc3be9Kkzhlx1sJ4DJGzPYwjSy0Qptwh1ug7HtTPPE0
         BO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770804130; x=1771408930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nchpKVdYOXJD7jz73jWfX5Pi9SWnLk3tj6catvmsON0=;
        b=hU5BgfPk7CnaEX92Rg5w2TaQRz06H7J7vyrRhGSIjii8VNpy3Sbgmrauy/kMoEDfuI
         wtf9EHdRK9Epr0Gw34UsgdD4Sjs/ZxQ5INSTIm7brLmbkXP2am7QPJ/sKcLmm9cd7WOv
         /Q8p5OcIR49kfPcqKrx4XcWQoU3/whadivvnp4OYDKuHDVOL9+N1OYgaAPzVkM1zxYWI
         ZIHS9DvZVXDDKox+CiBLDASyp6aD1SCmK11zu1t+XP7eRZpswwjgLcwqK35X9aeWmDNS
         c5Ydlk0TM7+C6y2wUI2Y7WZELHbDgeelQ3/4a11jOttPGm+ete6tsSG72ZC79wQJgxAS
         +SYw==
X-Forwarded-Encrypted: i=1; AJvYcCUEoF8+GePF0QCFnHDOrRSMjh8QPLdJ2B0ZbXHcRUod/NEAG+pn8Rd7qTsq7+DQAtfk/JcmEk12Pm5Sf64z@vger.kernel.org
X-Gm-Message-State: AOJu0YzuMjXBkb1fPJXw1fmVnHKC6vVxqHRySPe2IpezRs0ucjz5r6uY
	NqsMi1xXr4hbi3PfZgnqGZOVUmJuaEnpDcUdkQK+5glZO2RiQGIx5VL2y+kNyU9dzrRqUlZTGlH
	7nZa8Sb2SQo9gNJyql5ug1YPjJGe/yPgiIsE4oIqqTW8Vf2l9IeE0XJWMiuO4qbZRjFc6
X-Gm-Gg: AZuq6aLZDvY92Q7zKSBXCaez2Kvn8Erf9WkmeFgod2CZ/+JEg53Xlr81m3ZGwM72+eC
	HQq+llF90GzpURTmTv2164/WDgnSZxyS6/qKEOlgFR9clvolO4WX/VRmzDci6VMcCblUzAnv651
	e9PESB5urj/9oIqTIvOVTEojGE8WHpoNV4SZyy1yOPzqGL7+DNQ8JJyxp3KJ/DT7tCWZyQFgJdn
	Jb/OMubX6e9mp2lZw49atajHzmCp9ux5lfYhLd8Btl2vjoISzYKiPl5Xv+aE77as5cQe3tcLYG7
	ZKHnhoOIuAF9tVvzFuMhu9Lg0ZzT3sT7Q/NPrld0c+vv6PJ6sdXIUR5M5PY+HDMMVPXWrP729K3
	VBjv3elrb44KfKuARZgSEuMEtdVQYdm8TkFIj1veR3ynTIixJ5pM72pqA1Vx8cgolDagGbnoHI9
	Z87WiT3cBZ6G99Ho0dHt+5jtVqinfHENPsuXU=
X-Received: by 2002:a05:620a:1915:b0:8c9:f996:81fc with SMTP id af79cd13be357-8cb2acffb42mr110725185a.83.1770804130087;
        Wed, 11 Feb 2026 02:02:10 -0800 (PST)
X-Received: by 2002:a05:620a:1915:b0:8c9:f996:81fc with SMTP id af79cd13be357-8cb2acffb42mr110722885a.83.1770804129592;
        Wed, 11 Feb 2026 02:02:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56fe99sm242554e87.36.2026.02.11.02.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:02:08 -0800 (PST)
Date: Wed, 11 Feb 2026 12:02:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB2
 controller Micro-USB OTG
Message-ID: <c3on5e56hqipudpt7uyam2cples3rhadpz324zeg7nebczsglt@bxuy5jzrxjc7>
References: <20260211062923.3794476-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211062923.3794476-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA4MiBTYWx0ZWRfX2knb/ew3pLMY
 e1PyAWKPsWe/vKWzFoGJX0iYNJhwStLRuptB3B9UqEe30dSSKwq3aaJ8QjlF5sYZ7+T+ZDJD4Kc
 q65D2kpcSaV3N2d5ILVQG9gIMonhi1Okw91UAxcWUauNrUUnVgjoU5k8i0bp2Q5HS8z9PWMLxzK
 llviQO/o8SbZmZF+SlzSNw75aHPoIAF7DKnpT5KywPQglQ5EnAHzcTD62ZlCXzDXDjOkXvWu2XS
 2Mdr7IXqebYHFXxvEZ+tyx3hO1hPDhqK/A6sxRU79Dwj4PomZkPYEgeR5wzAz/IbzbZTiP4Td5k
 TuFjvUYTtsuQAcg/k5BwUmAJp3bCbBVl56APOFJ7ETZuF63ykCiXmcDrA+L93tSxoYvNO+FeuG6
 0d4AFBol5W31g1difWX8QgfDYcl2XQ+0dswzqAoRu1kV0ucU4Mxzh0qN3smTyVGgGRZ2X3cbgDO
 zacO31H8mfcLiuLMfeA==
X-Authority-Analysis: v=2.4 cv=TKVIilla c=1 sm=1 tr=0 ts=698c53a3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A-Cq-KxRW6d33O8yOTwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: J13Wx1Jad3NywjsJQ0XuNjjpdIHke6A4
X-Proofpoint-GUID: J13Wx1Jad3NywjsJQ0XuNjjpdIHke6A4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110082
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
	TAGGED_FROM(0.00)[bounces-92594-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AEBF01231F8
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 11:55:51AM +0530, Akash Kumar wrote:
> Enable the secondary USB controller (USB2) and its High-Speed PHY to
> support OTG functionality via a Micro-USB connector.
> 
> Define a dedicated 'usb2-connector' node using the 'gpio-usb-b-connector'
> compatible to handle ID and VBUS detection. Link this connector to the
> DWC3 controller via OF graph ports to satisfy schema requirements and
> enable role switching.
> 
> Specific hardware configuration:
> - ID pin: TLMM 61
> - VBUS detection: PM7325 GPIO 9
> - VBUS supply: Fixed regulator controlled by TLMM 63
> - Configure &usb_2 in OTG mode with role switching enabled.
> - Define a gpio-usb-b-connector node for Micro-USB support, mapping the
>   ID pin to TLMM 61 and VBUS detection to PM7325 GPIO 9.
> - Add the 'vdd_micro_usb_vbus' fixed regulator (controlled by TLMM 63) to
>   supply VBUS to the connector.
> - Add the 'usb2_id_detect' pinctrl state to configure GPIO 61 for ID
>   detection.
> - Enable &usb_2_hsphy and populate necessary voltage supplies (VDDA PLL,
>   VDDA 1.8V, VDDA 3.3V).
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
> v3: Added empty line between reg and endpoint.
>     v2: https://lore.kernel.org/all/2zztcabuf4hkixj445m3iiqdsmg7jju62e3fgupb6kaqirx5lq@2mhs5hcn3p7p/

And sadly ignored the tag.

Let me repeat it:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> ---
> v2: Fixed minor comments on v1: https://lore.kernel.org/all/ad294a50-027f-4caa-a9b4-e145f709b50a@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 66 ++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 

-- 
With best wishes
Dmitry

