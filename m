Return-Path: <linux-arm-msm+bounces-110985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yt9oKJE0IGpVygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:05:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B7663861D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:05:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p6c2DNWx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OfdwU7M0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110985-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110985-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90550301F48C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 13:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92D347CC8D;
	Wed,  3 Jun 2026 13:57:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFEC34EEE5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 13:57:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495031; cv=none; b=OPzKN+lw1mPnc+tyUREkAqGG/QnaPYcAGFZpHo4JXGIVScEk7r+tDfZboKKOsAzWkKrMmFlCjYGAtbsHE4g3ybkfgPleNZ3Ssl0MVRm/2hDIp1juzIYaM03nkg4l/oJkVrkpViWCU5+B1yTC0KFb5cI1ZcYdRjPyhxJU0GZSdO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495031; c=relaxed/simple;
	bh=BkjMKW7+8FnZOZD72U9LhPB34EKJWNTUQ46uB0uxy5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdIiPWwsf/lxOfUGk1MAErw1QEzw6vUfkFJONkxU8D3hy6TiIJ5rAlk1rTvS6FKGuji1pKOm7RtMGdWj4+dMlIvRzeauZQ31lAyPRnUxjoib+wfybS1/01u+l4WlOTdrKtX76EEB+lUSg9RKA216da2arAPTwO+uTRiCd5cSHLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6c2DNWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfdwU7M0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CdRVU3077858
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 13:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KVLNU2hz7lrMuAYHKsdh7imO
	5qzntYmAuBVg+ugqAkw=; b=p6c2DNWxfGqwaNFrcIrbCkS+18fjdDPOk7lxocZV
	QyzHZ+81J6yNVG1oVmA++zJUYEa7q6t7NLDPQG3DT0xQPR9+HBYk22t2MW1bq15+
	7/vbqwHrfQDyt1MB1cKH6JvvLDcXgP4hkbzZG1X3KG6CT3fxeGnRaOQEDid2xhxw
	FaQq/0XMAiUEErslP1KUFnwntiAqswy/N5hDv/HSr3C+/ccP5hSUXZOGvlmiW+jI
	oEtJQDjkzPRLdGDIsfa/6BJA4dVOgpZnhMUwmmSSbn6vU54MNbnROQir5nj/uILU
	RR+hByJ7Phb6B7a3UUJwZZaNxDzz+RdD7oyv+YjpvteY8A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbtrr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 13:57:05 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9639e28bccbso616263241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 06:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780495024; x=1781099824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KVLNU2hz7lrMuAYHKsdh7imO5qzntYmAuBVg+ugqAkw=;
        b=OfdwU7M0xD/+8zwE41WmpnWz55yuhb85QSxtB9kx+Ad73ZSB9jt639PzEi++xnOdHU
         JjhNbHc9OH2rfaDWbM/Z5VDqM0i3ep0EAuF5AbGJAphd9jvcPEl/gAibc/QCt4vvs70B
         boeeoE0e/Ry/IAWricYxrPClySn1sQX812UT5Js3JMGjeLD+W8SF/HsqccXSpysuTidV
         L/+yiVWiuT9QTPu7cthRbIIiXcYtNTN+798DN4zHTt9FWcUJhWeqKiiIowTzrVT4PDr9
         sloXP2FfQWvoMsLhTV5wHgXakA+GMs9OAz3+3c33t201oPXKGlSjHj1CCw3R0uDR3O8c
         /O9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495024; x=1781099824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVLNU2hz7lrMuAYHKsdh7imO5qzntYmAuBVg+ugqAkw=;
        b=V1j32q4JPV109yE4LZ83KPx7XNqlcuZhRkesakGFKyOrId2LGOYK9tK8DxD3kOycrx
         U0LGGavWBLbWbfpY0VPeNaytOhm1nPz1O+siNdKmRCTXzpv5PM3/BYbysa2yt2oMQCNq
         BmzIYQ0k2UGN/rTrjZJF5w6oe7ywS7AEIQZAv3nWouEA5Qk82WSLPh1mgaoFSdd+/fb8
         UCQK0RgR1La7KU+x8QZQJM6iDsnK0GGWZXofcEXjb4BWFmCUmJDks2COcwqkf8N1wmqF
         6PiJysHSjk++1bdmcFCW/kXB/XELaiKH+vg8U/xQPtSBBI8MMexKCVATnLHd3IzwgAAV
         C7Yg==
X-Forwarded-Encrypted: i=1; AFNElJ87I+GgqCZ4SyGGMSnMkPR+/y+OIPAMMKKixpBVOaYges6JPk0Y42aQRxx514Gsi2JjeJh7HChdDg+z9BWZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwO2ZuTrDUEsP6DsfxljxEpGD+nMAxIU0WgQRplvUcC3NaJUUUf
	EjeXJH8Cn7O3TgDDrNazIieHGsPkQzp6cScU+1pm7cV9XN2tN8bXuEWkwpICQHvFnd7rK+jzckj
	k26S6s0JYE6XsT8gpBW8N0sXLi9VSWpwj0WVPPZEU5qv74IcXudKT/sQ51+tt1LL0jYKJ
X-Gm-Gg: Acq92OEQnX3ECzdnUGaKRxcFEUpHprTccTZ7HRlQRpkc838Ldg1CKze2CzBXy6A72Lb
	Gll2iOizIOIx3bHhJwIWwlQZSsEwptQgPFza0lbBiedRo8/svs7b9n0ubAzMKqo5fJGOa6G9yhX
	AASaRTOhPkBxZFaWm6CA8i/NzAVoBivrE6m8xanQe6FO/kE8nV2V+f8kQffv8FN3wRfDQx1Vimp
	EGhzrlIALEbPAv/5bEBRbyWROPpMRPAd1OnvB5sICrbvLCN3b1gxuLLWnnAdyvpZbwirinHiuAP
	MLL0MAGs34PpgmSzGR24HrZpNsIXOukWLgXjPLtzmnmnNMUGZPy1vqqWdaQq/887QPG9TNyqYqm
	NX9+TDiAUUdpHsjRRyOrzD2+YMOR+1rtBGkwFVnnjkgVZXaNFffo8S/vJ7o4EC0CJzFlOTJEVjc
	3QqcHfHSbCI4msZulTaqLGFczzjvlc94joa9ZtJzlPqjKoFA==
X-Received: by 2002:a05:6102:570f:b0:631:2a82:111f with SMTP id ada2fe7eead31-6ec6efa43cdmr1764526137.17.1780495024093;
        Wed, 03 Jun 2026 06:57:04 -0700 (PDT)
X-Received: by 2002:a05:6102:570f:b0:631:2a82:111f with SMTP id ada2fe7eead31-6ec6efa43cdmr1764513137.17.1780495023488;
        Wed, 03 Jun 2026 06:57:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907a26sm672601e87.35.2026.06.03.06.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:57:02 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:57:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,vendor-init-seq
Message-ID: <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-2-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603054809.565723-2-github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNCBTYWx0ZWRfX3Bro6bNypc5j
 qa2gG7OuKetBmbzcmUrRuFEDCP+TFRZ+Y+bXGccVVP4fTS9lH1918K4hOLZLfuZhYwDgJRHaGjS
 AbjmMBev9itu0qVQAGaOi0HMldkj8EqgAy4GRScNQZKEWW0/PcmupqeFcYGs45iMGHSnJ3dFHLq
 MNpmGryGeaBr2DUVBpUK1CEpsTx0zCAqpd9d30OiPTNphNQkNa/+i9nDJNJmL2XTnW4UJKPbvzN
 cQCMelzpQdbfD+jA3pc4y9VYRP298I4kRlBr+szpbZub18iOLUu3QcRRuv2i+WsGoGaLXsc166G
 JsElyYdrpcmkpPb2eGMi+/SMAtyiouErZEU3fLuzE/1rwPdYyAaKQdaFg1M1kbvbnKfyIo1ykcN
 NejVZB7VGCD5VMXiaCpD/K976yaIpHHOf8K4qkyuLxKmS6/UlUUaw2i5nr97mTa+Y0xi3eDr+rm
 Lx4BV0t03ZtVgRlGpDw==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a2032b1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=DB10H_R-sGS9ZoZ16qMA:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: ZNxV1EfBUFrY_uwo284d5xfX6VILGc4o
X-Proofpoint-GUID: ZNxV1EfBUFrY_uwo284d5xfX6VILGc4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110985-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,b6scawz2cqmq:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04B7663861D

On Wed, Jun 03, 2026 at 07:48:08AM +0200, Herman van Hazendonk wrote:
> Add an optional "qcom,vendor-init-seq" property carrying raw ULPI
> (address, value) pairs that are written after PHY reset.
> 
> Unlike the existing "qcom,init-seq" property, the address field is
> NOT offset by ULPI_EXT_VENDOR_SPECIFIC, so the new property can
> reach the standard ULPI vendor register range (0x30-0x3f). MSM8x60-
> class hardware needs this range to programme pre-emphasis, HS driver
> slope and CDR auto-reset bits the legacy msm_otg driver used to set
> via platform data.

Are those register writes specific to the device or to the whole
platform? In the latter case please extend the driver to write them.

Also please note that writing raw register values is generally frowned
upon in the upstream. It's not easy to follow those and not nice to
modify. Instead, if some the values are required for the particular
device, please add corresponding values to the DT using the
human-oriented values rather than the register values.

If you have questions regarding any of the bitfields, please ask here,
we can try finding the data for those.


-- 
With best wishes
Dmitry

