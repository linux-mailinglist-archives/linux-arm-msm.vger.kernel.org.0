Return-Path: <linux-arm-msm+bounces-113091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PWhuGFmYL2oNDAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:14:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F51683B1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:14:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lHH6tC92;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xu1lS0iW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113091-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113091-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39E48300C806
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DEE2DFA3A;
	Mon, 15 Jun 2026 06:14:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF4C3AB285
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:14:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504084; cv=none; b=VFsqQ8a0EurFpLzVw0v7BQhARyxefKkA7G7Lq7BKfqZ4X9ArJvHOM5ZMWei8FZiaFosyvYO/K6sq5ViRJ7GmZRxnsTXp3uzrZjhG2dKbkCXHr6tbRJox3YJh+S4mtzuAUKTiJC5oWTRZeDfX4vuMtFG5537V8xJEtDJY2uDIgN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504084; c=relaxed/simple;
	bh=RIPYm/CUa09goQMugAIcuhg/UpG0S64W4m2O0sjKqWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVCRwP5JEEOfVo6AlFWrijo0oyJCE211zD5ZDYdDbrsOKA0Ft8Ul7pt24b6j6srJlRi3NEbtXu1aQozzZl8Cd0jfa9JSYXl/xbM7OK26egLuq4eFkMQqtuErtwI+Liidad4omiipxVHg3Tev7qR/DFEYZJr/Io7AJ9p+IN5yfYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHH6tC92; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xu1lS0iW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1hvxe1227624
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YProC4RAIvitDzBqe9nWs3TI
	F6R0TVSPPxcZHWa5Bo0=; b=lHH6tC929dKrqi7GucUZWtN0cq9wJHW+LhvEhXUa
	A3bFcKLduGBEmN8dtmeSNgEhikLtivuQFm2DfhZ75P4Ujin61ZCJjZpCd+7D0vEa
	A/C9wwbI6LSzL2xLFyX0lnJ+E9OpL1iVOTsf67jy26dQt/CYuPEqLAUKcXP9ngkn
	mR0OMvjqCgTyncDNXpgpdRjSkAVRYgkRlBKWwqsczv0yhXxIw5ytMz6g4429aUKs
	eZGD75GLsAJGcJ2pMn0qSgNTZiyP4vTFDPNOfa31ldxfDEta89UKwE5280L9WO6a
	+QGBw8c9jtHbEnHQHFcKh71wmaEOBX4Ub5WsQQ1HdTCumA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffnsgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:14:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842308adb3bso4258628b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 23:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781504082; x=1782108882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YProC4RAIvitDzBqe9nWs3TIF6R0TVSPPxcZHWa5Bo0=;
        b=Xu1lS0iWk08AKma2JpXSSOTX+eHo2k8qbkP8WRK3naqSXpYV5vvlPH/i2wfrIZo/eg
         MpkM7YZgDIydxtCRfCgN0EV/POZ/enQYZBpqBhLY7QxQFqpaInloQUBbLxg/QwzCcU5o
         FLoSgdoYNi9hLL1OZ8IGxzrUX/wX4Tugqhu4odRaELeT78EgZmdsNAmI5xclQMPhz9sy
         L84+bccW6zdsdmRenE3P+pYnWvPawoQa3rmXgbQO8tYjYxEWTGbf1Tlf+dgCIhNhnmaV
         /Npsra2uCJ3+96l5/h7tADJx0lM3fbvkawDcruu6QWX4+Gcp3YNoMnCyqKUZboKR3MKd
         19aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781504082; x=1782108882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YProC4RAIvitDzBqe9nWs3TIF6R0TVSPPxcZHWa5Bo0=;
        b=Av0f4tyf1+qBe6EGHbBfLNt10j/1fMEOT+Q2fO6BkcknOQn3OCEkD804GOogslltLp
         QaGXAj3aygiaTDghESABosmHxnqoJIrGe4NBHjCfLpQgjbGg5sQqRhk1cNP+FagNBsNe
         Rz/019qrBDfSUHvIDiSW/KkzjUVpidTRfsdHD/PilsLCSW+V0kk+JGnbRK7relUkd1mg
         jMqrsxyIBCVGvqq3BDcC1OS3kv/hpk0s6NAVJkIaRJoqisHYywQeX0XdhbA4PumCnz6q
         d9VouchZo5I8xrH90juW9Pu5aU00zFlkylYhKGsPgRg2/WHl3WD3UkUHrR3RnAz1D7At
         5GVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RCerhkhfaNZcb2rXeix98KRgbQP2dHqIu1gRzwrqt1NEtvShbWkEMjv3h/ubpjXkLjh7TSx1eekmJlfvt@vger.kernel.org
X-Gm-Message-State: AOJu0YwDH1j1cyMtLPF8qDNUK/6TahLAhvEx3xH24HmdE+8NiA6T26Uf
	zeUbCVhlI68WTQRuzJP9e9gU4iQ4pVav4ZJRtPbeIo61Q9N6vaFEqpO5PLM5Cy1o5xXqlcHSadk
	keqjH09JmnEfsTb6/we8OLA8rfpVfLqcJKyePan6vrGK6qcmonVh3C5/RDVaaYG8dY7I9
X-Gm-Gg: Acq92OE/21LNMovhNG+bLASqFr+YdIaVGqu06rwk7SqX/tFX85JvDkAtWOFfJMR2Yhy
	zKm51OayG8EVHRKI0PTA2lTu15RXkVP8cuF3gQXE5LiaQrsmHIPoyXorcoxD8Y93UA/tBXIR1Er
	Ey0TqjaF+B9o8t9ibCVFEOllcUL6dkkkp+ijFmjVZl1JYOX3ksFE7f8iT349s3EMTFIcOOeFH+v
	t72TrozBnpzv6+UrvHP/n83qKvyI/jcxMi1DuvTarZykHJhVGFHTnG+ZxaeSE/e1xysVOsikfC0
	h2m4UQU7MpfGjkQ4DV4KJlkn7fWYuNysCmgt8DebXsRo+CP1tYXlEvmV823eANNcJDtY+VVscrU
	um0kJEer9O42SrjLcF14LUB5elLuPC0470SSz6zQhCn6vAsbjLBAGOd0CdmGhAgvRlSS6wTor+O
	5ZbDquf7zAbex3ZaKBlC3gw2JMuP6aSWSNG8toeZq956v9wpmhsiE=
X-Received: by 2002:a05:6a00:418b:b0:83f:250d:59c with SMTP id d2e1a72fcca58-844e1a97288mr10503350b3a.39.1781504081642;
        Sun, 14 Jun 2026 23:14:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:418b:b0:83f:250d:59c with SMTP id d2e1a72fcca58-844e1a97288mr10503312b3a.39.1781504081115;
        Sun, 14 Jun 2026 23:14:41 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9bfe1sm9310494b3a.12.2026.06.14.23.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:14:40 -0700 (PDT)
Date: Mon, 15 Jun 2026 11:44:33 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: tsens: add ipq5210 &
 ipq9650 compatible
Message-ID: <ai+YSXiHMolyk/YG@hu-varada-blr.qualcomm.com>
References: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260610081241.1468507-2-varadarajan.narayanan@oss.qualcomm.com>
 <20260611-active-strange-porpoise-7dc9db@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-active-strange-porpoise-7dc9db@quoll>
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2f9852 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Yz-oc_1U6DHBXyOLHCoA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: j2KPdNycVwlQhpHQSQXo1rOt8B2tlCNj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2MyBTYWx0ZWRfX5/SVobC/u0JD
 85NH01PyF+pFf+l8vybzQ7dVrb0Msf9rdP39rv2hPILzPy1YV1AhfccITFcXbz3TaGoIuuKuPNJ
 saKPEq0mJngYQTLRIcaAsLvfBytBEx8=
X-Proofpoint-GUID: j2KPdNycVwlQhpHQSQXo1rOt8B2tlCNj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2MyBTYWx0ZWRfX+tSzoqIULVHT
 uSY0TYMPnAb17Rzhvcet1NyXVoL17BaSqtJf1UIiGE6EbNNwh3raaVxg1wLSB7T+nQk9bBteQYE
 TthKKvhsPtcloXyesQD9kzv+ez5Y3L0Y0yJnxI8h2Kuyo8r09SxNGKD8DAaC3X9M5y755gsCJX6
 b56eFEItJS4+btA8OOkXZhvLL7WyjIZzfCvbI2BNv6IRWOOs/QgGr1Uf3lbFR30tR+VWiCkoxeB
 mr0APbEB49UsKK/qZ2hd9gXIO2FV3CC2iL4S9StrhSlR3WAnVlISedBfCeD8PSiCYdXBOTrw+U/
 +YtX5ZdtIfXhQ86kYtkSPPH1xHbOakjq5NyZ2OQPilH0b8NkDDkxEu4b4D6Lk7GeB71ZoTvD3sy
 ocrF058dDpRzFIIYjCeTme0kZyadFtL5u+TUnLiZNJDKkYEoReU75oiSC0k5542suz/bL28pCCr
 ojWeZHPdKoFzJmA5IYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113091-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,hu-varada-blr.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tharagopinath@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4F51683B1E

On Thu, Jun 11, 2026 at 10:24:46AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jun 10, 2026 at 01:42:40PM +0530, Varadarajan Narayanan wrote:
> > Add the compatible for the thermal sensors on the ipq5210 and ipq9650. The
> > ipq5210 uses ipq5332-tsens as a fallback, while ipq9650 is added as a
> > standalone v2 TSENS compatible with combined interrupt.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> > v2: Fix fallback definition
> >     Include ipq9650 to all applicable constraints
>
> You already sent v2 and received comments yesterday.
>
> Please respond to feedback and version your patches correctly.

Sorry my mistake.

Have added the additional constraints to ipq9650. Will fix the version no.
and post v4.

Thanks
Varada

