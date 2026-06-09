Return-Path: <linux-arm-msm+bounces-112048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bu1GHvjJJ2r/2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:08:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B0265D935
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:08:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=g0EqkAsy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FaWMh96G;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112048-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112048-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27350300827E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F043E9C1A;
	Tue,  9 Jun 2026 08:08:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107BC3E92BD
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:08:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992497; cv=none; b=Mo97TW3jLXnMIHGiWArw+SKOSAaSUNYNLN1gmaregJFTIYEAUFHXi0lyzTcT/itT87Y5nRLi08DTDe2lknaFUWwxCvpyksbyw5ubgK7JqCNP/RQpzDC23Nv48iVx+Balg9XImgDUutAs4ZQsfPgHx26ZD3wV4I+QNaGpzkNS1XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992497; c=relaxed/simple;
	bh=PEW68TJPPTzmKONo7cR1uoMP/BIGmj3nT9DGPnGgV4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/HDqnkSApUjbJw2ZonbnAVqBbhPvzhHc14/xZJST/ZJ3VDveGvzcr2gyOlkGiGD+dhw2wFII6XGYqgt6VlENhahdUGuIBOnooc3P+oM0AdDUs2CKd1FYFGyBEMJXEY4mBFs6Te5BHQwEDTZnYlP8v/QOmOxVXI1ZaiK67quEwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0EqkAsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FaWMh96G; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rrno2001582
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 08:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u+kXyzw6leKSOKNQ85lHSVSw58XPmJuVb6V5K7cXjuI=; b=g0EqkAsyp+2BU2S7
	P74ZkzQbGhVGEpoH2DJBp/Y+ZreVzx1Re22XjkkuVeBIt9zIfK7UA4+gy/KRk/oI
	H/WxitksaJaiL9Wg97twoSwsawBnep9ISZICjcRqT09hwN+8R27dwFslQSFpQ02g
	+xwS4I0MyT/Q3V4Z4WliFgdVB025bvIq2zn5FUUPEKMU30ffTp3lp2mYaQDJEP1X
	AcmOn17SfT8N73U6oXMoYkcf4Jf/H6/QDKbU9+5qZ6pvwhYv6Lx/ku4oGJBV7adr
	1ZTDMprUgrEKwFr3VL7Ey5mtF9+MLu5xvl2EY2acXTGq30vlewX5lG+BDqBJc4LB
	V0tCAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25r9a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:08:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517647fbff1so17702511cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992494; x=1781597294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u+kXyzw6leKSOKNQ85lHSVSw58XPmJuVb6V5K7cXjuI=;
        b=FaWMh96GeRcwYv3o/Pw6l4DEWFPs+hsemVMs4Dfi6GzjX2mTNJA0dRy1Rhdv0wOlaA
         YGOXNhP+VUJGd1RSzkxZCFlcATv+1RlQiuo5ginZNiTwTETmyljhH7QfAdtAroC/6tt0
         To41/OZR5u6Jx3IgmzZh40kARrNTymxd+Nv6dzOJbrjfvilx3vqTYb4ucXMfgKgy0pu/
         UyJfhA808Qq5qegr7u0thWV1o54gZyuzCwfl+86a5uu9PESq86zGNxchet9+rYAI5j6Z
         12h4dEicG03S2Wslq2rCrkEToWBUgESa+50c5VQDdi+lwdsE0SNpZbf6qC6jCyGDBXFY
         f2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992494; x=1781597294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+kXyzw6leKSOKNQ85lHSVSw58XPmJuVb6V5K7cXjuI=;
        b=W9OJ9L4kYvicxuyL5kAGhR8dnwUQjCdBjQRV6XAGZjmrlm3DTBK5Xc4hAaLFEs7vmP
         612x484mXsKXzc5OLQZpLc3/nC3PFx+cNXcb3qohQN3h0qyJUkrp9kdPkIM3VjXueVbe
         S6veL8P9TOg5q/zC5M3umpy+9OntiLnSVbVr7udmG1c9SGRkjxs+OOsyq0yzy1u/lRYy
         5pa1vSUuHq6gm5rfPODmOe3TMgr8Zjr9obctsHZgGnIB0OCs3xNb2cT8UWYENW3jbltR
         VJZwhdHB3CfzlhBeO/NBEbiZozFlWZs/MICTpwv13yFScfABL0q11/Z/jTxHcRphylOL
         1x8g==
X-Forwarded-Encrypted: i=1; AFNElJ/J+0iXijGJgsuyfovqA1r0CD985IC9t7rIXGVGx734UGZfZz8Zv7YvuDXQCAbjIM/Yk/X5uGkUVT/b4uhs@vger.kernel.org
X-Gm-Message-State: AOJu0YzVowPavI8B4ZmpQJkFX8O/JbBlQK/ScnAAEWQ9KJV2ME6ViKF9
	EyMivIaDeBjgX13vZeLl5iPHt4O5F0IDzpFlMqp6Zvzh7AQa3DksLKM/rbeiyz1rEfRta4rjBBl
	oHRgB9TVbCY2DmENglF4Ma+Er8lwIqsPy4I5sef5oGfbhAQIIy4spis47ErZEaAV3UfUz
X-Gm-Gg: Acq92OHG/Bmn8SHuUYE/jMisPGnkbumI00E5tzNQ1VhCn0bERaBslGxXpLAfKFDBDFV
	P1KXn5zyb1rArXaBSHrzoms4v9ea9DxqxLUU3cspxZGaTs4Iy5/6LdB3f7rcKMn5c7Tqruq5pJg
	t+zZMR4MKHg6MOVXpITJthQpvv3c6T5ueXwJ8E1PFuUMUv4ac5Or7w6I32C/Y32kjUP7bkkcIQu
	SklwuQdb+we7xlnrgChKU5ABjUbYw2sq5jG8dH0HA1ce2buybC6zUlN2t8DrsL2sQhp2B7YVdAa
	xHhM49H6FRb7le5LcLg2vdVBeThOYD0yNvaNSmaDuIu82S7Q9vv6HtnkPOTT2m+QyJst2+st221
	5dqnLpVTB4irInikai9JY8s9AAuIKFDebj3YnSF/aKJV5EG71vDqYBGTX
X-Received: by 2002:a05:620a:6084:b0:915:7c1a:138c with SMTP id af79cd13be357-915a9d5fd58mr1718514985a.4.1780992494471;
        Tue, 09 Jun 2026 01:08:14 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:915:7c1a:138c with SMTP id af79cd13be357-915a9d5fd58mr1718512785a.4.1780992494089;
        Tue, 09 Jun 2026 01:08:14 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8248701a12.27.2026.06.09.01.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:08:13 -0700 (PDT)
Message-ID: <6fbc9757-85ae-43ac-9e9b-69cc292f4035@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:08:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] spmi: pmic-arb: return 0 in
 spmi_pmic_arb_register_buses() on success
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260608-spmi-bus-register-fix-v3-1-7fbcc65b2929@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-spmi-bus-register-fix-v3-1-7fbcc65b2929@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F7a_Kl_QfTmnda8fH_Dkm3bC45k036R0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NiBTYWx0ZWRfX2fr7v/2kvqwh
 bdyt5jBJnptDu43YA0PwCTmymdy1Ps5LVFrvCzVlCed1p+YM8NQ+Po7nsIFfLl6yda6kSAFkjub
 XQ+Xttt6kdu0t8z3edxFRQ7rC9Aoah9Ne4yrPHyHRT5v1dcpF/aSbFPL+Yr/WRMc0X04M2vFYOO
 sjbMLNZhHJmEJjGAP19ktOGnS3RF9t33HidIhVlu3DpXeNgORHLqKDaRAAZTztKSx+2Ggha4RPu
 k7jx+ZVlaRY/5vBGPrLbQKOWLfbpMstGrKR9sVvSdF96YuyOc1mLmZtYnpFNQJvy7gjpWBIkLrS
 /NHFQ/GQtc3hHCg5n0GzZA7MnnHTt4z3YXlW1BlXgjjFs77HvehSAp6NIEaGpK0p4JmSAngaV0k
 YU/VxZjbeza3p+8vzGEWX8gzcLcQzWFFb5WBDBSvlZd4JD3YU+LSPpk5kXyv2UNULKg3CdlFEyJ
 j4Pepr4vZwaL/r9iJFg==
X-Proofpoint-GUID: F7a_Kl_QfTmnda8fH_Dkm3bC45k036R0
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27c9ef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LCqSmTP6Hmll8IGW1FMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112048-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:sboyd@kernel.org,m:neil.armstrong@linaro.org,m:abelvesa@kernel.org,m:gregkh@linuxfoundation.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14B0265D935

On 6/9/26 3:00 AM, Fenglin Wu wrote:
> The "ret" could be returned with an uninitialized value. Fix it.
> 
> Fixes: 979987371739 ("spmi: pmic-arb: Add multi bus support")
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

