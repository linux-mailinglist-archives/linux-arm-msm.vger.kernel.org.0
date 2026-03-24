Return-Path: <linux-arm-msm+bounces-99753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIajK98Qw2lKnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:31:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 122A731D58C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B50F63120F55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2F73C65F0;
	Tue, 24 Mar 2026 22:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lt1sMeAv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ko+LEu6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30D33559D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774391045; cv=none; b=gH4nI94ewQhMel7oGHe/0cjcdigTO1oKZFX6r/xos9cwVcP53ortRy82KIS0pvlCV5o0UPgs7E5AR8lbOZ15kiPG4yvXdEp4fKGO+zWd27kVlR1gQ7H0Xa/KpKldwujCUlRGB3tGkNARwKDpO1hJvORs2ptotU+0qXzAeJR59ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774391045; c=relaxed/simple;
	bh=N1tKpnex4oilrEsmQihojd2Y4bKB8LOuOcsMPkqHzEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwy6XhlL+R3CyvFsg8wcO+W0Ouc7/ghcqWsP/a3ygS16Dc+shDP8wTHI78rpCGROWUOXQlZYfwXvR24FF8XsoTZ0X6/xZG+vTYEmR0XZFTGe0etHt6a7HpxO/QVgHp+iKR4OeGrLxwBStj8N4GNVQJj6P6zdTUxWpoGqQ1aR+7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lt1sMeAv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ko+LEu6I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCtEK2807976
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WQ64CWnoxSzy7MVIuAvuzLD3
	ASs8pn6BQBkngtvjFrs=; b=Lt1sMeAv2/1LY0Ttgv+L62rn4OA3bFljZY8lrfXO
	Is+7oh5YtvCDM3fGXFjPPjuiPJ1FKRA5cbsfT+9fGsUXKEVlRAJQu5EXbUj3QJmo
	JMgnCVqNDhlcOM9dye4+S2zXf7Q94xNrQMviqLI+S+MoQ5V8gb6gr4zMtkC52NJE
	fXCw4djfeiLVPA0uyOeZsZdaIjcwbfkOnubp57rFcsB+4NCH0X1GXjJtGJTjREwy
	9OpYP2JNsFulqDlXl9xjNsHObn1Tra9f1NaUEAAPhao6z7Nw8+vOP81k6ty/DQJH
	TnBK8ykLn01tfjxcLT5Rvb9gXNQqzi1t4tMwwtQYtOdzaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ejaae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:24:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b323c43fdso118834711cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774391042; x=1774995842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WQ64CWnoxSzy7MVIuAvuzLD3ASs8pn6BQBkngtvjFrs=;
        b=Ko+LEu6I6Hx6U8ECw1BYL9046XshW/MPlXSXq1x6Ux+d7UaaKEh6qJuQP82OJ5olzw
         0BVutbgh5wBjauQmhyZcoNSpwEHvNIoqXE2/E//2ZrjwoEYkl3z/Oj2i/djAprQ22Tje
         8oZCsDQIftveEqMHoj5AQbk9P3NKxe0q0+mtaRRZgVBIzbLLP8c5arWow8yigC/xhOdA
         2CloMGlvinQQefy70OJadb50mLzl/b9CU3gh1cuvvdF29EUrwLaOcA9Egu6pHWGUUFeo
         d4kOgtoubKRTHGnQYxeUbniIaFPSd1Gz7xVZ7lS3AZNBq5NWMiUNRMNxKw4zWuO1oUGI
         X7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774391042; x=1774995842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQ64CWnoxSzy7MVIuAvuzLD3ASs8pn6BQBkngtvjFrs=;
        b=lGHw+ULJXi1UjDl6TKlgmw8nHrMyIPTRz4CH4n5OXGVFZjatEB9TWcB6/znRpBV3Wz
         lJ4WeS7prKo39mcFMvAnkCc9BiOuM+GWmhWU2Quln78QVAloPYYrncwYH1pfO9GlGisT
         y7dzOY80J0Qo8b9s9iczPLZZniDwnRPCf3+385OfC+6pTStkW1Ny9EzDhhls0CiSPucp
         clCSTu5DCut/68Q4XS9K5brNAaTCkPB2joW9+MOyBCCddHkJTXXCyQchHHyoMkPWTeh/
         Z0+79MGfvtW755kwK5/FRBycynuhGXvDwGudUBRy4x6jF/KhnG/st8rZzV2nT7AArv4f
         t2lA==
X-Forwarded-Encrypted: i=1; AJvYcCVpdXdadvKOtXw8TUoowgIGcd5ZhFKzpsyG2rzMLNNMn41JybFNb06iRLjdyT5ut8Cum212L69HcBosEiLJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxGPD+R+Ba9YY7ketBmMKYOkG4j6hfrzE8V0wfWNnLXp/89ETPV
	Fdb0tdaebq5oZmnZYFLaURO29tWGRAnYFEZ7OnrZasOCZoDGzWB8POneKjzWks2M9UeScHnNftC
	p4hdfLJ08qG/0F8AnA3RHP7VYZCnRD2WctGthPbxKWUO9XHs5hGm5PRIxBEv/RX45LH7VoTJZD+
	2/
X-Gm-Gg: ATEYQzw/B8r1I+8YXmI79LdfGMyM8HkyZOyEYAQFMUuQNNDzMrJ4UkXTpbtFMObi/OY
	K9N2ikB8GcKl8uoUNrwT3MUezfT8dzUbtD8E4fB+40b8qzGnWx9QPUatKUa8q5bWMUR12SD/pE2
	kNf6TKTtal4NIAVqim2i2o9zX7HFM2erWsEaKRFhdBACZjp59FyiCy+ELoKUQHg/kDwyS02uxhx
	5UNtGpmJ9ZW6+F6wChhrjkUrXhqWVTmkq6JCBZ0AV4YTGnBUFhKol3c7p/lhEtViVvh3bKNCKLt
	aY+PDRsFMFihqNaX+utv9zitmg/2DfHe1n14XOuBGtckoXzKL7tfyVsa2/4rfgdX98ce+nfUCs8
	kGcbLDPpHoxN7ONNz/W5md8xEDmScs+XByOl4Uu6bIYCLMsHtjjeSImvWfIr0cXBjZwPFTKBHsB
	KZCYLjT4w92paJm9IWXXarf5Eu+5D/wgDhdi8=
X-Received: by 2002:a05:622a:9db:20b0:509:d76:fe5f with SMTP id d75a77b69052e-50b80d24615mr17099331cf.17.1774391042011;
        Tue, 24 Mar 2026 15:24:02 -0700 (PDT)
X-Received: by 2002:a05:622a:9db:20b0:509:d76:fe5f with SMTP id d75a77b69052e-50b80d24615mr17098901cf.17.1774391041460;
        Tue, 24 Mar 2026 15:24:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207393sm3518042e87.50.2026.03.24.15.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:24:00 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:23:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 13/15] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self'
Message-ID: <5hmynjbeful6ovl6phytya3hpbytrghtpfoi2gq6gatg2diz4x@j7fouhrrb4wx>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
 <20260323-judyln-dts-v6-13-d89f07897283@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-13-d89f07897283@postmarketos.org>
X-Proofpoint-ORIG-GUID: dhZMd98yNAg-k1XzeaYTiVWhzC5s67GI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MiBTYWx0ZWRfX7jM+wIy35cuf
 qJ6jE7LeChXDFAm2Y6iTaDF8+Vor6YLx5O/5nicrERMmD65qLzAt4VPKOk3eMaKN+Z7TH6V4Yjc
 Snk7g6TmOIVgkY2XerETTEM/ED1EJ3njNvV2AEjwAdQEKWXwzOaczwzKqEEy/KLx+ynJ3yoH0+K
 V/FbkRzhO1HGcL350P1Hu2+GoAA0zuJyS/AgGi9wCv8qGDM3rGaX70gttoM1mOmcsMItzG/jv9e
 DBhG/IOPz3gL2JpkuEXgle+76LKeuJj0bKfqM+yHZAdTnkvGkRyFQuVoO7RbBSDsaPVuLXvfwW6
 kGiDgvyiREx/tlQOW+H1+sfp3tna8KC/4dAp6uqWucLoGu+fzJoCtsbv/ywBoyZJWAotUpx0GiL
 3reNCCTf/Mss8aUt891qA9mWoBmUzkkd2Q7QPQ49hjKj5hFuFfrUNh/cHH7dHeyutEoy+STvvhJ
 Z4UX20fmlh79hxvC34Q==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c30f03 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=Kt3gK3lm-ZoS_3LmuawA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: dhZMd98yNAg-k1XzeaYTiVWhzC5s67GI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240172
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
	TAGGED_FROM(0.00)[bounces-99753-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,postmarketos.org:email,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 122A731D58C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 07:41:41PM -0700, Paul Sajna wrote:
> The modem firmware for this device doesn't preload the IPA firmware
> and requires the OS handles that instead. Set qcom,gsi-loader = "self"
> to reflect that.
> 
> ipa 1e40000.ipa: channel 4 limited to 256 TREs
> ipa 1e40000.ipa: IPA driver initialized
> ipa 1e40000.ipa: received modem starting event
> ipa 1e40000.ipa: received modem running event
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

