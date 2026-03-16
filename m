Return-Path: <linux-arm-msm+bounces-97824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFU6JX5xt2n8RAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:57:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4154E2944B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:57:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F00383014BC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7B031E854;
	Mon, 16 Mar 2026 02:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBatx45T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUUFVkJY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6262131DD97
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773629810; cv=none; b=B2Aj+WeaO5wPTaXwEqLv5ROTfjoIAt2iTRhlZsdQdl3xtjtiTmlMoac4abiRXA6fL81dbH9UUlFGOtywlWnTeK2ecB1VpTsqL0gqZNwXml6AP9cyjSKxUkIshuSTpPj4CB1qoxg524LnCxIArf43iMfCXyQnXmqMfMjMosE8268=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773629810; c=relaxed/simple;
	bh=lOx7WGljVCrNPCezw8jw8F0rZM4RZZWdggDm0L7uf5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPtNu6LIQMsElEdyvb4iK3ewlDT5JgwuXrIG2HGvxI2JFMMnw5Wtx16WomFL27kIKj7OQVLHIKVH6NYfEnP7qvTPoEBNqIslAB/h0WGb7sq+O28H3q8h7+rAZeudVPsr0CMn08W8zeuJ5nU3ejC/NuTV2SxGS1nUzqEemmDooeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBatx45T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUUFVkJY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FJOJck2669333
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7t58FQ1sZQ91jnt77vuhQFHEqLIaGKlIsv/co+Cw4I=; b=fBatx45TrsVD/DyI
	6eKYxYG3Lvs64KvboDhHwYIcrRonhFtwgVPiK00ZXmV6mm8DO74SEaa6MTUXR1pb
	IN1ti8ejYagX0pcLktDTymsXdw/Gamt2D60InWxpI4x7Tw80OF5ag3ZGTY8RMU6o
	oUD3FC+eBO508iS9KiXldXCuLuhOiDLHNPfAt6+m/0tePbwAaxWkGLpLaWQbn27h
	hPBMf0UjGqP8Qs2OzOilwJ3Cc/z5VDyerA3+oUpWxSecAH+k8W+EXGPTpXtcHdKA
	E9i9QL8WbtOUEvEBmDmbVuVql5pq805kmtx3OXGq1flUB0FrNCmsvOXKoLMs6yRk
	lLVUFQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw042418m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:56:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c4ec516e5so119934236d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 19:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773629807; x=1774234607; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7t58FQ1sZQ91jnt77vuhQFHEqLIaGKlIsv/co+Cw4I=;
        b=jUUFVkJYNClC2D802l/SgmQoMyOQd9IbasoUAX9foKo+6fMUJ5Ivs18Pzs5wBZqMDz
         1JVzJbw7JTVPnvoGJeadsHVU4a/A7fzJRFfOWJwg0337+K0f8F68obfJvJMTUbyZX8oH
         alubFK6XEG9ekiWilwiTWz2xGYHXkFxHzOHqqTau9AyI/7XI60AQxF5Wc57zC/VSRfJ/
         OJ4yVDJrEtTOUYS0AaG0unwYSUFeuweK+Q/tXUsfixrattLzMT0oiHSeZNfQk4gwNFpH
         ZzrbzjNtcDe6XrDnzPrhIVFVtvvDDU+ZZhQcmXTRGBRg8Vq1kPVgjjYw4+eyUgGxkvwT
         0nAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773629807; x=1774234607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7t58FQ1sZQ91jnt77vuhQFHEqLIaGKlIsv/co+Cw4I=;
        b=lYDht6bToOMXSMq8enABKEQ35xa6tzaY2usumCo+lki0EnNp0egQEhM2t0q9Hgzjlf
         s2Y0iCCilTczK2cxE/nnYm1N6rF+KzuxjfDtwt0e0pe467XQRk9FKjZ/bc06VMjDVecH
         DaBetrCFCZkghyGLRxwcGTV3v108rLFXs8PgRdYMelAaDk+ccOS6JDlwb+fWbO0uHZTo
         1LsOjNjopKOcddW78urHcbw4FbxWAcdWkCu89LMayyBolC5MRWL/9PLAE9jKak4fB4mL
         cRrEH609xuQuWY02RQpxJxyK7KcaJr1owquieJA1QeHkTWfn9tPK5J7VnSA073cqllhI
         aOkw==
X-Forwarded-Encrypted: i=1; AJvYcCXoi8i8S9Db0QwWv67XwZaNCLtyrq9vG5vzU0rr0kokxAvseMOq+3Z6ubv1VQpurXjfV7vzfsVhxxGkqyjl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2loB28F1HjP9RsPmQy2U8iTD9CM336GwyoB4PlwEPSx2N5bIq
	uvt1ZW5vLSzzhdWgi2H1EfivQ0+xr+JivuXC8C7QkkRI8etYLuHfIZL8fF8BLRUm2Iuwn60kDWc
	1siz4zpUc07kXNArI57tJuUCIOaJoO9DCZkNCvusn/bsTyJMaCUfdBn4mygUpRWwEdMor
X-Gm-Gg: ATEYQzzTFFYE1P24gETubTQ0sY5r3ZEFrA0PqPmTNfgoLOaUu1vP+B9vHLSTiIRgiws
	Z0X/2e3waeqMH9NUjlQb2jWi3XJeHg/FYMYhqOs8RzQZ4ie29oNaJBmrKEsHTnsWpiYDrWFfTV7
	AzyE2QVbqYIzuWHphmU7z4BZeXCAT7c8pJbcSGJjfJ2IqZXwlgaeW4ir2EORiN3FrcZveo+3mV5
	5KFk7CmfBGHq4E4MsVJ9KzFEFTCARmrXf539hUDpYaC7zvuE0VM42jWUUKqUyGLEvhz0ZMCsJ5F
	pyml58z5RBcN2wys+UeuSJ9u0DVa5EuD4vQOOkyP5brUDNTqUhp3Dn3q4LCDhqcwQBeevSRvyZd
	ZYCaXvIJbQm5OdGRSolEch4GfcM78TkeghzK3QLI/tL6uAUK7n1w975x3l37tPCoTx29xtRzFDb
	ytd2y+hCk0y+KiWi+335amq5mlwygdU68bOpQ=
X-Received: by 2002:a05:620a:468c:b0:8cd:b315:7399 with SMTP id af79cd13be357-8cdb5b5a7ddmr1529631185a.46.1773629806582;
        Sun, 15 Mar 2026 19:56:46 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:8cd:b315:7399 with SMTP id af79cd13be357-8cdb5b5a7ddmr1529629285a.46.1773629806160;
        Sun, 15 Mar 2026 19:56:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366682sm3117442e87.72.2026.03.15.19.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:56:43 -0700 (PDT)
Date: Mon, 16 Mar 2026 04:56:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/6] arm64: dts: qcom: Make a common base from Redmi 5A
Message-ID: <75jgqzlkh7xgdtwyqnyny4pp37czkpi7p2qx7givpwkz4fco5w@aaugsmkvmr73>
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
 <20260315-riva-common-v3-2-897f130786ed@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260315-riva-common-v3-2-897f130786ed@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyMiBTYWx0ZWRfXxVaJ8576uFaf
 Yet6ONlRycIYD8eugxzhKNex/lj77Z7UCCz/+7FzWrH/qOxVXLndUSJ/bnUrIQSQbBj9vQv7P1g
 XqdFpqthrfw+DK4zuErA05A5stTZ3JBxh0r0HKKYHB5cHDFPlpMzCRiNjzmHxGKGwjYpmDS0+1b
 WjC+LnoUdZW2keuTuDuhAFE3QhtftxT/odIye0iYi/xla0vSj+BpDIqhm8B/oGClzMkFgkrS0y8
 e0ygr7LA2MwU29i0NooOuVCkx+BEwKtVMxxIIocTp62jRPAZ53cS20m4pFZDAEif8D8Z9qWrWzP
 DNHrjIp4CknCmCl3k5tyCrfUqhmlg50HNSmwD2+PfvCacXWs1OhF9Vh3qgYNbLutT7XRaczNVDx
 hx6xPa/0wTvvFBcnAKVPiuCb+du7AzR97PwPsaa4SHl05FQ2fD20NWuh6Tyygcy4VOFHomnwG/w
 ovf+GH30HASLWWBBnRA==
X-Proofpoint-GUID: LpUOoQvWrX_2qE0xuO21qzCzs3PlEaCy
X-Authority-Analysis: v=2.4 cv=SJJPlevH c=1 sm=1 tr=0 ts=69b7716f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=hBsfu5BoBQgbZ9FLN5YA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: LpUOoQvWrX_2qE0xuO21qzCzs3PlEaCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160022
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97824-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,mainlining.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4154E2944B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 05:26:20PM +0100, Barnabás Czémán wrote:
> Redmi 5A was made by wingtech like Redmi 4A (rolex) and Redmi GO (tiare).
> They are very similar, make a common base from riva for avoid
> unnecessary code duplications.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   | 308 +-------------------
>  .../boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi     | 315 +++++++++++++++++++++
>  2 files changed, 318 insertions(+), 305 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

