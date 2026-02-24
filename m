Return-Path: <linux-arm-msm+bounces-93950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKzWD6h0nWmAQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 10:51:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54A184F2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 10:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 793343043BCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291E2372B32;
	Tue, 24 Feb 2026 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFcHJDPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WrY/Cu3N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B5F36AB45
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926690; cv=none; b=W20x+1uhqpjKG7ptbU7CTcXh4jR5vKPIx+KzHws61gV5NA0KcoE95uW2Y+iOGsb3Vl1EZVexg7okRKqv2xR2gpWdlYeWIj/+z3x6WLdnvCSINrq77ylsSQv/FHZZeucm1AmVAvC0oBc0NcDizOXmuunT909i+7h7dj8iTyew0N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926690; c=relaxed/simple;
	bh=zFhH6mV/BzAsFmDghDXzIskq9NOQRf0vUzwBxynZo2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mz6rm1QIc6oRXpj6AoPEgbBcP02FDAKhsuLzPlvHprUnE69zdLS8AQPUFMFWBnHb+xtnvOo4Hl3K2ZWlTTNLT0R3nuizwd3u49JxcV1bCW6AQ3it81/ooFi2w6V+RxRVJyvJV9BbMRe+dKRy1SXfRUTboLvHFXjVcUsohAzrgTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFcHJDPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WrY/Cu3N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LvNM3125618
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Ozg5KQxkZbUpcAsSqTzyj9T
	MGI9JFbx2Fui48y0Buo=; b=VFcHJDPA7giBl1Eg4EVKfwLhLxvwkPVZw+I7aOJW
	6ka/4b1eIpKCmdxH+ClR0ZNX4AcgiOExPgeGGdF8BQfRWhVYIO78cLMbJUZI6vDZ
	iaSXAJYAOAA+0+hHzcB+IePAjnChSVi+taxFhu9qiTXqzTVDYZE6aZTFFE58rjvV
	/XnXHlIJdvjuC9HcGIhFKDmi2RWzSwpxhLPavz5hq9Rj3j9Bnro2lQSCDr/flTPa
	7UWL54UJN0fRALW5j/6IwvZm3dOyeA7vmkKVMfXB6gmT53pcO9bMLBeW1CrQgO/D
	C2Ij+ZDcBhwfBfma/oLy45nrpXrklD3YUjVLnduFBi32pA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8tpmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:51:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c7166a4643so5159792885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 01:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771926686; x=1772531486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ozg5KQxkZbUpcAsSqTzyj9TMGI9JFbx2Fui48y0Buo=;
        b=WrY/Cu3NJosIGspaadQZY4JGynJ7jgUQkEn+3tD9BoKA4DxtzFJhjbmkZtzY8nLV2W
         Ippxq5ZLvK3pWiBd4nfjHm771o82BQr0HmApXbWKxE7f5ziCP8Ey4aolp2H20kIx6vzi
         ZZiApvJ6GlV/KK0KXDVetTvyFyiyBYWFTifZ2YFwe/BUJN3pP4niumLWG37m8VdIloIi
         XsDl4s+I4BVHVlJ/8FyjQv7Hgcz85m9DJ1zCLZ+Gkw+kAFOoJc9CVP7hzbmLpg8pnPaY
         m0jyz51JiqJitg1T7+bz1hBaQVBKqoZRcJQO14O+5jcwK8wvvh5Tu+WD+NFz7/S2vvJu
         d+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771926686; x=1772531486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ozg5KQxkZbUpcAsSqTzyj9TMGI9JFbx2Fui48y0Buo=;
        b=u9+FpYwC8/vlUAoGsxrCu1q23IXf0wmdCeE/+PKZABrOOkGG3w7SCJtpDHqv10rVQj
         pnSpP/a1VRmY6yHrPGth0btKWmjZHIdTWBBH5wzky41LkLGGOh5nXPBIdePCpGVy3Z3/
         eBrStJHbwnJek/DhhXb3vcNru1DvAxBiT0RCQtzeXw8TQvMWvMUAmBPxEBCBvb2E4uzv
         sVtmKxPaCquleFDWF5c92+1JPDXrGUgJbT5EHAyejIkt68OCHWnt94MK6inNZc2gR8yk
         Q9Hk0xG2LXI1SJZWHvKLAbhKP/eSHQXl83XQwMD1/hLoEB2t8khmRzoaAQSdr0pDATyn
         uqkw==
X-Forwarded-Encrypted: i=1; AJvYcCUUrLyzv4Pubd88A96ks/Bl9FmSpUzFoxdyryUFPoDbCTOAeLm4aqUCn9teVM4LUA7Gs9Qz3s8IpIJH3cfj@vger.kernel.org
X-Gm-Message-State: AOJu0Yww4QJhnZQNT2tCYamUlPJaRpjXQHVIJXK6FWCXjtsRYekCbcdC
	SmWlpgpo9SSN49beTBFVJctTniXEJttynyM/2dC1cI1coAV4hQXHsGTNNwPkAa9yCSbZL64W5T9
	J6FzceCCrzIGWFBS4EtB3S2H6q5lI2QolS45NLkhHyIXY1zZtOAPCGPJ+/OnDuZUuVPqn
X-Gm-Gg: AZuq6aIWkqRFJyQiDF3GGiWR3yoBN4EhRbTtiON7Gb0LzAHasKzBHXgCaTYTV2h2b0I
	jBTKnzUTB9D0BLcQzIDaDMrT41R9JJbZi0Y9IK+3y4qEYiM4lqk9C9Nrpxr7hEGCZ4qNG8G3MyX
	WGnkk+2g7KKUhmgjTkbMqrg3sK3DQqS3beoYzXTof5OvxTxEe6iF7vTzXHVWf5WGChfvldMhEt0
	BI+I/dqti+FU+XjIBtn/6ktCNpiekvQ8TuLRRxFbGzg5eoaBrag7cnz+wNyhtsUOWDscbmXnEtc
	jBladT1h4a3ysQzYoQ3e5KNqNo+9CfpzUj96gjOPd1borG5M4XtXhZKiWjZfW4sZGJ4oxvt/6+5
	XHy03sVboVOztCFNsVu6wDDYxjwpCVpMi4DR15xSjpCEi95cPGn1i+2zFaHri2y9Acub90fPIsI
	QE08kb5n4Z7nsEPry0MTlTjHHx3WcrqzFtbTg=
X-Received: by 2002:a05:620a:2905:b0:8cb:5176:ef8 with SMTP id af79cd13be357-8cb8c9e6256mr1277713185a.8.1771926686366;
        Tue, 24 Feb 2026 01:51:26 -0800 (PST)
X-Received: by 2002:a05:620a:2905:b0:8cb:5176:ef8 with SMTP id af79cd13be357-8cb8c9e6256mr1277710285a.8.1771926685819;
        Tue, 24 Feb 2026 01:51:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13675sm2075448e87.21.2026.02.24.01.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:51:25 -0800 (PST)
Date: Tue, 24 Feb 2026 11:51:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Max McNamee <maxmcnamee@proton.me>,
        Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Raymond Hackley <raymondhackley@protonmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8916-samsung-fortuna: Move
 SM5504 from rossa and refactor MUIC
Message-ID: <bnt54trgmwaubeulwrfisfmdwxnxugyruuhblrm2zdwmh4qjzr@57mzjv2vdj65>
References: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
 <20260223220514.2556033-2-wonderfulshrinemaidenofparadise@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223220514.2556033-2-wonderfulshrinemaidenofparadise@postmarketos.org>
X-Proofpoint-ORIG-GUID: CqmSxRt3jZgC1Uja_NThSsWatuBLLavt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MiBTYWx0ZWRfX1i64aUH/1U7z
 ZA4boQqnUDhmeD+7hmCGhLqES3d9JLH2nRU/zU0QLZZtoYM3GC90jZFVxUQke7DKEwsaPjHQ5ws
 X+Goywt6ilq/5yqyfXBQHNOjNiIUkk6ZQnKq2NExjMPpsV8ksaFZIShJEkacG56M/XyLDMLANGz
 KTrgLiAQ+YJJyzH3wd0g2r6bjIagcV9ZapUIXEDEd6BZR6P1YcgiOusc/MnqMBUD0gAEVZe5bnJ
 o/vjlB6HWmC4ISqRSNoxXX3c1v19spaC6G8oTn7pxsCY0rQ+qcIh3vV1X90x7eGVoTMzI//RAJy
 BXDVrMYKvS7kthyIf8DtzBkUpJMByrQ17ncOvDQU4d4Xz7jxC531sgodkcEk/feeU+1eEKXAF0x
 T1KCIYBdNqzIzD/EKYCW1DVfTpgoNRHdkv33pp50i+yCAHE9NLpd6RFrArjari6sRC24NkXB2kp
 7KUPhUiofIeY0vLERSA==
X-Proofpoint-GUID: CqmSxRt3jZgC1Uja_NThSsWatuBLLavt
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d749e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=CDg4bIe1_nYBnyjI12QA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93950-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,proton.me,gerhold.net,trvn.ru,lists.sr.ht,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,protonmail.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE54A184F2F
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:05:12PM +0000, Raymond Hackley wrote:
> From: Raymond Hackley <raymondhackley@protonmail.com>
> 
> MUIC varies on fortuna/rossa devices, which could be either SM5502 or
> SM5504. Move SM5504 from msm8916-samsung-rossa-common to
> msm8916-samsung-fortuna-common and refactor MUIC.
> 
> Disable MUIC by default in msm8916-samsung-fortuna-common, and explicitly
> specify them in each fortuna/rossa board.
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
>  .../dts/qcom/msm8216-samsung-fortuna3g.dts    | 18 +++++++++++
>  .../qcom/msm8916-samsung-fortuna-common.dtsi  | 32 ++++++++++++-------
>  .../dts/qcom/msm8916-samsung-gprimeltecan.dts | 15 ++++++++-
>  .../qcom/msm8916-samsung-grandprimelte.dts    | 18 +++++++++++
>  .../qcom/msm8916-samsung-rossa-common.dtsi    | 19 -----------
>  .../boot/dts/qcom/msm8916-samsung-rossa.dts   | 18 +++++++++++
>  6 files changed, 88 insertions(+), 32 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

