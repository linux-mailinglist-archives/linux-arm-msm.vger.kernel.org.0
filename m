Return-Path: <linux-arm-msm+bounces-112811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nOE1HSYYK2o82gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:18:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3CB6750F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:18:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="I2O7Ibk/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aklI5VKz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112811-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112811-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48D413166CBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9F939891F;
	Thu, 11 Jun 2026 20:18:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6F5368D77
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:18:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209120; cv=none; b=PqNdGUzuABnTiGsuiLDjqRwGWCVxl2PQJhQOiS+QT8SjLOqJFz9gLfDVjmGLeAqhJ6s3EPEzIbIBKqQs8v71EIQ2e05pCNT2BolhI33/LDEaa7T0FbHXJRXFaD2laHoqSxDQgoiWuXZuzrvRXa95Y9gf9cGdVbh1ow7fk7jnAfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209120; c=relaxed/simple;
	bh=DYyGCuBDUK0slA/6RuMYTeuS3GjYvbT22yJ7Ll7B/gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfojTuix4lW5K2M1PY3tCL3AsXF3DSyp5pZBCtUhltYzcxbr2kw7gKZ3Autak+tbem2N9Q3IweqU92CGGzSAoKZtfAlPnh59G08zE8OwNbl7lPd7ayHO+ecRaYGfGCBpGMxPv0GfZYio5HmicCNG5vp+FIhKGGSYt48JHTxlzx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2O7Ibk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aklI5VKz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3QXs4110091
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kpV9CXhTZP38LIhNRCDWw+KJ
	MwHc9eylFcIk37TdED0=; b=I2O7Ibk/kfARV7iSNU8AauOIOCcRi4uWwE5wDc+n
	OFmOBKUA+l1tzpdCFuiwcOrabPjVhzcYW6oQVkE7oBCmg6t/+vV43SJWi2vnT3z9
	uNLWiirhQR5UWJw5K8aGlUW6+eUmiyv0OD+MhU6KBhSvH54oJmzpkT6hZya3mTbr
	rgnX9YeBvMk4Mip6hYnMbEKfCLH//gRbTPBZdDqUBiqci5H9FHVY/wh60i4sQltz
	cJsYfVEfuQXBrG60RoJtyM+kcybVXP9ZdcY2pg+O6uZeYRY/4Gp4dMCTxSGYUWu1
	GDv2za2bdmafr0BvM2sYVRYJQQkGLpqkqpD5hKt938xZiQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014h7s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:18:37 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso82987137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 13:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209117; x=1781813917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kpV9CXhTZP38LIhNRCDWw+KJMwHc9eylFcIk37TdED0=;
        b=aklI5VKz/CVOopdI9zipWIORuIWFQhcdtYtufsycgJF8SqXdpJ8tdxZnl9bsgEK2ee
         8vM7pr8aLj58A2NE9KHcC5hGrupTDjxqqgDJ/k92V7vRSAwvvTcEYAD9y+qLXNNeMZFj
         HjkCxeAALGk8v9366dyjIXBbE8hCiJMVD+2O9q/YK5kWcD+aPFAQuWbg0tuWEibd5Iz1
         O4Jn14ZDKhZTAKGBp8/NadhIaJb1aFxXNSKpBwuDTlVX3wfl4uvkSSaqvmM4sQXNGmsb
         08y+zNMNcT1wdYy151ovMw9QGHN+WRn3J+ddVuyMkmx3+wjYzzjGqzjmoJh5CAjA9ZeB
         xCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209117; x=1781813917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpV9CXhTZP38LIhNRCDWw+KJMwHc9eylFcIk37TdED0=;
        b=jjDocT1YSDUWy1HxPElTlWXvySR8qkCB0exT0T0alEsP2zQ3pzOCj7urj0Af04IMJk
         VFm2lVAJTzpgPRZHCWuohMWSeKsJjFC9ugss4WJSE0chT4jwm0kkGz0YRMLstNf2kvAa
         9KTxadesVAyTimbJAJsIBZlLStovZh6JPYXJqxcm0QaOV0wfc/diBQY+G2AD17PwpF/7
         E7/E/WqMHagHeYgO00vDFJ3jcINLZcRN55ZBZ2gNDfRaOZ7kVZSk2kto4KuAS2ox5z2n
         h+diax9NdPn4XAwvF/8ul4IMzXL+AQQ1uNs1Z/7YqoxhUCoziOsz52ySP4YgP6bmpXJq
         2irQ==
X-Forwarded-Encrypted: i=1; AFNElJ8U+EJCIzfW3wPgPb42Svit9VlGhBFbG/INnsL6PwwZIDbFvzQBaW7pT6g17OBvwDLpcc5GzeXVX0IAATV0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Zu9MX/DeyGFI3DNMlUg49f5FVEEBvubp73gwGnhiWtpjACV3
	1ywF8RFYpatL0RlRLJscLXw3dMHyicqtqbJKR6uAHXVV99DENbGwSNlk8hcOIp3nyjbo6YSFqs9
	oX2IR+HSVUYXPmHINo05+Cqv/Onl1UQdhrK5ud6Iu7cJ39kRYvXNxMI5GTmUBFgL7iycv
X-Gm-Gg: Acq92OEkS2BNjnsT+qQbByr/16hvsF40qju1/7moFX5Ll8cXBfwlaHCD+5oyOnQKka0
	9LTNFGWX/a1Tzg9ZWhBQ6JV5YNhQNNVTXUgmMvussBSA/cYJ/9SCfEQ9KAYi0hrYQpHSl/UHAkn
	8wFa4dgtmBk1tvtDvwb/WOiH0OoaIDlCUvwjHiknQIi5RnirujZ2VU7pYnFAqVlC0Xnk+WLXe3h
	6Dh9PLfmQ0LebHo096XcgOtVSBxemWsOX6M+1ZDWBH+xWj3mL9np3Cm6qYBVoMWkjec+C7Bm+0r
	SQE4dWkFvnbaKRAFQQZlmHUpiW9iNL57jrmYnGUD2hBf5VsRBWnTOv63LgBX7DsgznWt7b9Hp2B
	SI1IPEfgD4YvweiRNc1jXuI6+SXXLenfNYGqMqHsMmfh2O2AXmKysno3j7is9xyesgYV8Ktr7wX
	e6gVj6A76/cK1/DaDAk2YX3zb/HZ73wRJYVF0=
X-Received: by 2002:a05:6102:512b:b0:634:d42d:15e2 with SMTP id ada2fe7eead31-71d5d19c0d6mr3018851137.26.1781209116627;
        Thu, 11 Jun 2026 13:18:36 -0700 (PDT)
X-Received: by 2002:a05:6102:512b:b0:634:d42d:15e2 with SMTP id ada2fe7eead31-71d5d19c0d6mr3018829137.26.1781209116202;
        Thu, 11 Jun 2026 13:18:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f5683dsm197481fa.31.2026.06.11.13.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:18:33 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:18:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: Add Shikra EVK boards
Message-ID: <mxtofzlu3nc5ybmrzyb5n5nijujxk5c6dx3tjajdzaj56asyfx@25hmlxhmwx7h>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
 <20260611-shikra-dt-v5-5-103ed26a8529@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-shikra-dt-v5-5-103ed26a8529@oss.qualcomm.com>
X-Proofpoint-GUID: naih4KA85GlhEk2r8KC5TSDlf3SfZQ5g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNCBTYWx0ZWRfX0XpuTi8Xia8I
 N89D2cALdqphtrw6KdzQiOCh7cIEWEHoFtH6mHSO9aw5eT9WgaCQsPI66bLj//plIY/HtGSUJda
 vE76MYjdYPTmVZrAOgqt2xjfFD+uuCY=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2b181d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=sekFKQr-SxL-p-8QmjsA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNCBTYWx0ZWRfXxJnIJgBQCGjT
 O0P7E0s9M8+2QGIFhItyTZOAv+FLTiLkZLGI1VE2y/+miN07qOk1y1BQ0Cg/MSJcZYB6FMueQpt
 oD1/gF76NIeCvdNmVr4AX8M9JwvDxZwFC/yS52YDim3GtLhSFDmrDQMGvF3I5HDFHFuojp2gWw9
 B8TAPh6ijk32xevmvLvSbUv1FF4b7k6yF/IBiDucb1lmajk9iKPYa3JsjRftvF/3DIta0tAVK41
 hjcb1rYIBWWgSbSJZ43MVNlO/ss2mFXlXFAJBfV4SeplK3gkVM/SHQVi6cBYtEwssz9HyArem90
 o0apBhLK3BFgv/TQQQy7HwlMeUiHJyosD17TlwV0yVDWarsTENl0ojfpHqPh6kJ8g6d0giHiO/9
 rWUmhGKM2luWTFwNF2HePWif0sHhjdtcKPjewPVVYEEqW7joXSnk7So+BsdxUYHvufDa/JKa1J1
 spHaDgxoGCAgyPujLlw==
X-Proofpoint-ORIG-GUID: naih4KA85GlhEk2r8KC5TSDlf3SfZQ5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110204
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112811-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:quic_mchunara@quicinc.com,m:rakesh.kota@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:sneh.mankad@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:xueyao.an@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[25hmlxhmwx7h:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F3CB6750F3

On Thu, Jun 11, 2026 at 03:40:12PM +0530, Komal Bajaj wrote:
> Add device trees for the Shikra EVK platform, which combines each
> of Shikra SoM variant with a common carrier board.
> 
> Three EVK boards are introduced:
>   - shikra-cqm-evk.dts: pairs with CQ2390M SoM (retail, with modem)
>   - shikra-cqs-evk.dts: pairs with CQ2390S SoM (retail, without modem)
>   - shikra-iqs-evk.dts: pairs with IQ2390S SoM (industrial, without modem)
> 
> Also add shikra-evk.dtsi, it represents the common carrier-board and
> daughter-card configuration shared across all Shikra EVK variants.
> 
> Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |  3 +++
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 40 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 40 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 40 +++++++++++++++++++++++++++++
>  5 files changed, 138 insertions(+)
> 

-- 
With best wishes
Dmitry

