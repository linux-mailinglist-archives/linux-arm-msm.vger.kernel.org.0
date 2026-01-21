Return-Path: <linux-arm-msm+bounces-89929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDRCBkIfcGlRVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 01:35:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7974E8EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 01:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 038A774DF22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D84A286D5E;
	Wed, 21 Jan 2026 00:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQiSWKGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UALg8ogC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7B8296BDB
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 00:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768955709; cv=none; b=hMKavBU+AfqeSBKAN0jq5Bkr7DwvSp82N9JE5q65QCmrbABfnB8xvEL7vLQASSrU+aKPnwjrLGwSIq3g6aiq7MjXo59vJywNVE01xaOFPh9YtLwMRR7kSF1ExCnd1NEzbo6PziCpmUYjuERJzjvoyYz7PSBbdwKYNqFnMvZv3Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768955709; c=relaxed/simple;
	bh=EQVKceUIXOAz4pHZ2vc1oxOTTlsmcuxaZKBtcbKGvqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSwdDmbZffd5XCDC53vFe8trkwQaVIqvcERT/ooBzK8waDK9s1cjr9Zwba+Is0PL/+D4LEQcP0C+F0AJqA8ULJP209dckESwJFVunjH4Th3Kynnef6MnGrcwQaJ3rY1xRStYESYe8V5BF5/+wE35sC2wdP2QPFDH0hjtj1/nNKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQiSWKGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UALg8ogC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KKVd02388139
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 00:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7fmizEJrf7GPziiprhDIaK1O
	ofwgZqdaWsiyWaFvgW4=; b=UQiSWKGGTaoWHgDuOzagHlnrqq8Vy5pN0x32vgqZ
	LE1BkbM3ngDEeUEObUOlZ4PbWrc+wVae8WqbTiscBEB6zN1dmMi3YgYe1X774scR
	j+WLbWcIUYCQ+gJi9gnFYxLbUwqa+ElPynu8do96KK0m5hVVkljyHAz2/udkM6js
	OLCESf0YWkdRMAi4QRImDO+SwqSe8l3Crl/uBqLH8ATonDOSLrpW2+dF5ilwNi4S
	fo8AWVSzyFFPsdjiUsn/nGTHrbG4EwIY9PV+Ypcfll0g2n7Q/otp9I6lBJabhC1F
	wdST+lq1eP6HvZpjxWIw+6J35XiGCNR2EvLCvORdk+ac3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta7qa8bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 00:35:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c277fe676eso1590679885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 16:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768955706; x=1769560506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7fmizEJrf7GPziiprhDIaK1OofwgZqdaWsiyWaFvgW4=;
        b=UALg8ogC6+5eBRs7xuPNtgM+TP6ONl01++S3shLp5rreSwmXvI+lcxdLGg44Ad63Yq
         AiWweNkbiKXTEtWUrGLobX6DuzTvS1/33B/Q5cB7gmv1BS/1I1mpRs7EqxlCYIm1LU1y
         jJ8K8dUxNDl6symGbNTt4NTgtX6QxoISEgv/R1LHdg/xYk7MY1FkksFh2GSmNaoAUjmc
         VTr3HyhfM9EZ1hdKYD51iuQVjiUvCNHXNnAkK94SWbTtk8PZNL0xMsmvm0xbrbq2Ijr4
         0rCRudDQ2oUp0Xd28th2G94133naaJMSzoAJLa++2kVwGZEyRvcXZE9TED0qcsbPtxCV
         qTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768955706; x=1769560506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fmizEJrf7GPziiprhDIaK1OofwgZqdaWsiyWaFvgW4=;
        b=j/8ekxr2QWFXFWwY/Ku6hzyUYy2nqQKUDS3D7wnlNp9x7WZ+8wq61fyCdagCXvrokB
         p+c+lQZFgTxqClycEAKFV1Ze1k6SZFiXaYx6scPSEwL9M7JN+d1DdOaZTOqYCMXP8x3G
         pGP3/sB4O46Gy413UXa1ZQk2G6NfOeNhgOFc9aS1HStSghaWMqDuGOf7XKqKD8wyFukr
         0EH3SIbNKDbu7x8ISSMmddICwCSKtBgnEcACYyUlHxx8qoCklTS0qpnj0KsQcieQh4vG
         YHmKak50HsOrwy+MAFmLTZbtb1NmMpZSkbcdYatBMAtF5wgW2lMlzPcwoT8NWH/KLLJD
         7DrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0ZXguVWa2Lg7qCNtH+B2J/xSRF+AVur3xANjpiQ/pn+85H/imjHhVbo0E6fePqHWWGpsqxEofILir5K1l@vger.kernel.org
X-Gm-Message-State: AOJu0YxxY79t58xILZ6f1upt0Tg86LGY1B6CvLeiB/HbOo1QqvPmK5EL
	6WroaluZO5/EokWoxJJ7l6jcqXou8T3cru2HNwStY/JKgCVCxFMOKmYp30jYjpMV0mgWgIHuhpc
	5L7RQZmUmKcqSmHUhf/t1rGnrs5CWwmAIVE1MuPmCoAwUfLXf0u3lIi74OOyqeEZq+HIZ
X-Gm-Gg: AZuq6aLpXqZLmj/qXHGrBSV37QdCyn2fdqJ3wcK74TvElq0+g24vP6CjozzR5g2dL2o
	k83FaWNqEjEcOGuN9Jz4X81Ijy0Xiz41Wd/FcIGYsickgM46UofZEwaR7DDsg0nhrp+BwjHpy1c
	d/vgOFW87BU7CE8osupaArsB0YqAj8IEFWFgCo4hzbXM710RMe1Dn0GySn3ldW8q0iR2OMLmsFL
	++QimBD1PyTaJppJ+rYtKWdR49DnXME2l8CuAlI7UwyoQRaS7SNDTvkk2GpD6+aEolftR4wZxyl
	0cHHVl6mmNIvyJ7Zgs7w1tNS8hDbZRyQjxvZ0K5Cw33wQvSWgti4f1MzvRNw2ujJ9GMxvs38jhh
	hKGZY37wZgaPk6XpFxgG1VbMyxya3U2RduDVYSbsvPimFHfpeGyKNFxkpdH5sNvf1d7+noefAPZ
	H86fopgOG9pY8oBkJefUUV8hA=
X-Received: by 2002:a05:620a:4052:b0:8b2:e3c1:24c3 with SMTP id af79cd13be357-8c6a67787a8mr2360539585a.64.1768955706617;
        Tue, 20 Jan 2026 16:35:06 -0800 (PST)
X-Received: by 2002:a05:620a:4052:b0:8b2:e3c1:24c3 with SMTP id af79cd13be357-8c6a67787a8mr2360534885a.64.1768955706105;
        Tue, 20 Jan 2026 16:35:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33ef7fsm4351618e87.1.2026.01.20.16.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 16:35:05 -0800 (PST)
Date: Wed, 21 Jan 2026 02:35:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Sebastian Reichel <sre@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] power: supply: qcom_battmgr: Recognize "LiP" as
 lithium-polymer
Message-ID: <srigqle4tpq265x2wv3r3h4zmzjky3w3uomw4l3vdh6wyrx4cc@ezsbec5vqivc>
References: <20260120235831.479038-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120235831.479038-1-val@packett.cool>
X-Proofpoint-GUID: HGwNqnk6FJzEGePJuPTdp0lGFe0ifW4q
X-Proofpoint-ORIG-GUID: HGwNqnk6FJzEGePJuPTdp0lGFe0ifW4q
X-Authority-Analysis: v=2.4 cv=LPBrgZW9 c=1 sm=1 tr=0 ts=69701f3b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wTZznuHQeFUpxERF2TYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDAwMyBTYWx0ZWRfX34gpx3pqHvhm
 TGhNcm1kWxkoXW8KmyS8fB35vE5GAlP4htt9ORd2nU0s6OEYYS1sgW4p7RBiSQOS8HZfHqi23Rd
 KmAR7vb1eq2+K4qlxgJoC9INvBmPcvXmp+Kz8I19lDaAM6f1KQEddpYr1C1SIIGBblUc/sUcfxM
 Z+BCmIfkOD2HWH/Q+CntU1lSSKsytXti3tEb+co0iLY0pMUQtDsWyxGJpx/aug22J6h527h1L5R
 fcDOjHeTQJzaYXdN3nYGGWHmso8sVB2/jmYhllh7G0Nc+f6K+ON0Peb7NH6R6Lp5utdN47Rn0+X
 k2kLMgymYOFRSaVUP4jOCgn4vtc1HkAUx/ozJJVZufFzdtpXp1pCJiQYeSZwpJ3lDXJybntvALo
 rZVPrPVv1yC9G4Zc1yRh4rtn9KkpUHsXvp3Ot4rI+3EQ/Qwrp3IE5kH0jP5x+ghvhZoCqtvfUgg
 7/bdn++FG0+5jNtPR1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210003
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89929-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC7974E8EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 08:57:58PM -0300, Val Packett wrote:
> On the Dell Latitude 7455, the firmware uses "LiP" with a lowercase 'i'
> for the battery chemistry type, but only all-uppercase "LIP" was being
> recognized. Add the CamelCase variant to the check to fix the "Unknown
> battery technology" warning.
> 
> Fixes: 202ac22b8e2e ("power: supply: qcom_battmgr: Add lithium-polymer entry")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> v2: removed extra parentheses
> v1: https://lore.kernel.org/all/20260117210941.6219-1-val@packett.cool/
> 
>  drivers/power/supply/qcom_battmgr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

