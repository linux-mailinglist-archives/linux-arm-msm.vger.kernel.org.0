Return-Path: <linux-arm-msm+bounces-100073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLV2FNsBxWlZ5gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:52:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D654332AE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AEC023013C73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 09:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D9233F8D4;
	Thu, 26 Mar 2026 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4q2i3cl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNPli95R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EEF34889F
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518016; cv=none; b=nqUddiIHOjfByksBnn45jv6yeTHcBVHNbBqzSYYX/vRDKvlWVfc8th4qheonByZGaBf7/oRu44ynDHR7vJrMYchQAlNlf3qXoKJn111UdmfckLDKUHqmPR42GZKK4HUQjodRTtk3EWozYvKzWjqi9P07pOWlKu8FrrmX/p+qUiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518016; c=relaxed/simple;
	bh=cIepne44jy0x2zDmcPWadh5Ql6TCY2pHBP38cCOEhhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhRmsaglz+E8u3aNwk8I7BCEn9/vMvqPBKsHQh1fMqW13R8/ucIq60hG2v826GjDR4QGxxF4k9cWDtkMqb1D3cQv9uxuIysB9do27y4Pri6oTxOcYSeJ8zjKNJ5DUwCBcoB1/wIfr/YKCb9yxLV6J5lIN/XB1Ind8NUJyUMxmlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4q2i3cl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNPli95R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6BW6a1965152
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=; b=b4q2i3clmFLWLUal
	Fw9ajmi1yQdy0w3xl3tJimwEnMBh1MXHGgSBxql+fTAAkDJzrB2L9xRaVxP3hbUQ
	LrpgOeVS62PLtU8ag0E9FP6NQ/S6JdjnPLw7F+Av118rTWkuhZfKPlKG9CWExApH
	iXjkIFdScIL1unNnPdPxbqSS5MPLEN6gsuYKxr291SZ7TiFOcBDhbHIGAGXbqWm5
	8i5lKH/v4mZ48HSdUB7QE+HSF/uTVemzb3WquA2iwEAucOPiBttksnMTEP2mLwWp
	k26hIWziTGYqLQTMo2FT+7sxUZzSmwFRbZ4/40wLkE/Q3GXdjWfhxDRlvu2ZC1QL
	4WBX9Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4pymj7qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:40:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cd541c0edso3430806d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774518014; x=1775122814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=;
        b=CNPli95Ri1ZDalFJJWpVS6C3KvkNdkhblbnz0l33osZvNrRVYXzG23Emix95Z/6XxO
         SkmQjEakwBh1Thk9QnpYhXhjjZIUge50wUy3bTV3ddHaaVOb+g2E6wGLVrRvBDCkW36S
         PnPgIOkWevldPkOgSubob6fB/y/ql3a8WsJ36Bks9gAX/wVEijbxXwRIPrHwiL1XKlo2
         /+hm8keoQbFt5cqVTeyXcnHDXCjODlrIy98beX+mIeCaTqH+zZyW5bCGtaAh3NKikZlv
         UEWvST+MuNYQAaVgxk8tq6hsrSEwag1wPKQ/2EsGcHsmc6hfC/9s9OUdynjbl99B1HUl
         U1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518014; x=1775122814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=;
        b=Q5PzIiAkdu1yRV1sSLX2l7CAvx0k13RY40xk7aIyrSfv6o1sCNLsqZYcl2bs6MJMc0
         tDhWocvlJHfcTllGkIBxLzjuVMIgldUygE1blv6T19rbWF4/kJdQGG/zCo69kinUD7mg
         vNBrPr8jAeBY+z3v2ChDTcZNOsl7B7JNQ+dtw/0KrRF7aGbEV9iPRIDAiHul8NMVqIgM
         28SJW3+XsjY37l58yXXE+7C90wfIt44e1JyUIYB6mDSW23NatRIGVGW+iKsBsiBV3NeZ
         21WxlOmDzFcmQwDQFdH5jfDMGsa2m/jO9LSQDVNkFEuYfmlO0j5EjMbbm0b7RSdG1+x1
         zrcw==
X-Gm-Message-State: AOJu0Yz3zYhs2AGJ6pC5JksoBD3udDrl9cwOLbq28cDJcCwxNBhhB1T0
	8/qPMdsWEgZDPgYk8i6zZ628U8pvrjFB2bbYH/wjEsWSeWh16dYnWqoDZarn+3qZQUVw08Xi9ej
	yGlEayQRZt9gt5CfofGSNYouGrahKDMwQRrAqGrFwwt7Y02eWV7QlfxrpUS1GXiTQh3bx
X-Gm-Gg: ATEYQzxsFIdh1z2frg1sman4081Zr2nsbcco/L265Ayub7diRirFAWZYxg9N+MaMMDu
	32WpEe3e8aoXJNqUyRYe2SZQZWoMVqspQrf0/p9CacW1LowYaXE2migpMB476h3HM9SRw8b4kgR
	Nz5ZzhMjobxoZE4RdWVPmkkVXcPwCV2pRcVVleb+c/GWe/h/elHFrLAgP4l1XUULqGJsUV9GZja
	6VJmQbUklyuXib+hRQOYzPeQtPDXoX/Pd3PlAPVn0EWX1/syd6Zc1wYefX3XJ6H/8CS38hwvz/B
	GULUK1wIksI1fMDuqNgs+jwRu828BxlLi2SIzzsGP2InqgMyuxn8l4zGf+zi0/dXdJFI8LrPNYV
	sIXpkjyO9OSYr2CaMlB7K5LbLpcEheMaa/tZnt2tqMAKodELEiDJgM0jFU4nGic6PCBLb8ZWIw3
	DLjnk=
X-Received: by 2002:a05:6214:19c8:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89cc4baf508mr90673626d6.7.1774518013926;
        Thu, 26 Mar 2026 02:40:13 -0700 (PDT)
X-Received: by 2002:a05:6214:19c8:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89cc4baf508mr90673456d6.7.1774518013540;
        Thu, 26 Mar 2026 02:40:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20264ed6sm94765266b.20.2026.03.26.02.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:40:12 -0700 (PDT)
Message-ID: <834f159c-c1df-4738-898c-13e89df53957@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:40:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FJwByczzahF1G11V5UrNmAEepxCo_rYZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OSBTYWx0ZWRfXyG4+IH/dNEEH
 46gF4XkMOieOtm7zLWp9bdURfqfx2GNyHeb53Bj9WLF0FXpfGj8QBLf4xkAmqC5PlLTIjOpfk5N
 sHGnAJIquqKbIme7mj+ktDi2hNuxVzriYu2/m4Xs7qIrk3eEPh9KkoCAKYf0qRAg0aa8RVYsQXA
 tyHI5Yr7BKudgqS8VLFKs5TsCYGCwAuwXCVyODwJiZlw6HJ1Pq4dsP2gvNoTXpY7C98ZG2WZqvs
 S5S6VLPSVcDyITjSXnZZj5NCR954lxcxYh1/BJrw5wheL6x8lyXoLg1AbkMWpU9GdhFVDKJX3+w
 3YRd5Q2AvBdaDJ3qEc7CuFWt41Q0YIX2Y2wZcoLEfC4Z3sjyWE1Ji+g8PglB6z6Ute07FeN5Tbc
 q7xlg4WIlihCp7+L2pveTRnH5v8VaPIr82YCBg07zPK2GfSbL20I6x9jcY2Y7kBMJ8s1NQE1Q1Q
 xpavodBA4oasAOs+v/A==
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69c4fefe cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6skNi_Mt2WqB1r5J5RAA:9 a=QEXdDO2ut3YA:10
 a=fFR93BqyA14A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: FJwByczzahF1G11V5UrNmAEepxCo_rYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260069
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100073-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,mess.org,baylibre.com,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D654332AE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> Enable the vibrator on the PMI632 which is used on this phone.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

