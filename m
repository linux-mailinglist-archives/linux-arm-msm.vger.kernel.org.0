Return-Path: <linux-arm-msm+bounces-116959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cj28J7HZS2qibQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:37:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 382697135C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:37:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A+kE9elW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="UH/f0SDQ";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116959-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116959-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D99443001477
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5334314AE;
	Mon,  6 Jul 2026 16:36:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B20F433BA4
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:36:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783355815; cv=none; b=jLrh4RNZc2wfO2zqCAnGsUsM29j/876Bg0bO6rvEQh3urguwGa78wNgXzeFTwkk+pMXtMeGGfAw4P9PdgKI/YfoF4s2rGZ/3irt14xMy2OoDRiClkuZlxLfFa7R823zWH9KT76n/wwWSIUDFzMGD7kWs5usSgr68JYaRjrJkpvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783355815; c=relaxed/simple;
	bh=oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kb46nQW4AjZ3I67rlJVHDR6CcWIwjIXPKeChN/G8f8eIXf39kRxLghmZpGWb/yJzOXWRcZZblB9qkT3pbyP4Hvvedn1kHNkdw2Kd+gRjPCyl1K2bawsvUT2HZJDsc3ikjGLCTK7DuMkEx87tOROgpFpLEI51peJLXAUMmwyq3D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+kE9elW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UH/f0SDQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6Us981547
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=; b=A+kE9elW43k3JhEE
	wG5rxbGyVqiu2EJsjUp4w8h255fyh8Sp7V1w75SG1Ng9NMOdpwAOQmFB8YKd5QjU
	d7HSNSGLcZaVU7dC713562ldZ6524HIU9eTjCknQ3KlIdtBzkUwj4nGhH9tCg6Ro
	rmCpvpmSDucwm88BxcOV+oGsUYlUaOFo0KNIwnZJ1O/wvfe1FeYeLcl9poOZwNmL
	RqZYuT469qkFJg9EG1djaMfkTW0CTmzC6c19Z7jY7BAgY7gfmOju+N2koDZjgUhw
	WLyE+QaDhqQvpN6lbTAdalxfKEI9w0iWF56xBTM87k5N2fLk4qexXlL8+o07U2Ys
	f5UTEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgt0nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:36:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e9c0c4492so74576285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783355813; x=1783960613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=;
        b=UH/f0SDQgInkmWTVt34AOjtZGNmU1A70qPiaIMiYzNB/oEqQXoYtF8PVeAc6F0wQwS
         vF56ydtR94R3WQ7n9rje5mSQTQDr0vOIDXBODnp3XON+dTWRNrr5HDWl8G4Yqhv5X9eO
         /DKKE9Q48WG+KGOzats+4qfQeSuHCYkpySUKO3kl5j/I4ea3HVR3Hn3sdNiDbtFBWN1G
         cniSBCun6IKrW3CMVGMwEq2vJbTavK+rUYZTWYD3yRg1ZkVsg217AW3IPdm5PV33ecnS
         4vCayZMFEVdRMqXFU8VgRjBh4kRrvlmJLmZ+BDhCaD7/RX8vIcO512eUQ3CuyrNrhiET
         vTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783355813; x=1783960613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=;
        b=PLE+r69ePFvwcm7nc1lXU6wx45biaRQhBXSFsRcKRiZkoj1E4IXCq9OJfH+od6yc0k
         HKDfIHpDzXO+p/wv/fAe2mLbY29gbAUw8PQQ0tBb7UO0gPYbbHh5TzC4AOBdCu+3LlZY
         ZcjvQs8iUE5QF64ss0rbWXqgmHsy2FY28G6p93IfoXR9bN+rRQTdh4CqA3qRDX/9dxwp
         qUczvS4RRLd53eVfkO5QVRFJNQzF1lotUcemSn0KCm3CNR88e1z+Fl81tju+Bdz7Aa9s
         Q4omGbJP952Qk6iv0o5kgocMk12FNehEMzRU5q0sm/1U33zaWRXRyD03rgmNOuyV0XON
         81+g==
X-Gm-Message-State: AOJu0YzenYvPOKmjKtfbNXBdN3qgCEGcFQRBnCI8YQAy9eI7fKZnQ0Lv
	booDMcV+TFHtkGBahyXaypmkN9ex0wggEgHUUbvuv18jexKZyb7nzWaqH1b0Fkx3ykltd1D/pJ3
	NmRe3x2tD8zBSq8cHhPCGgHghw1FHwWPiFB6oX6V0vKespWo9c91saWNMSejkJ6DiftBb
X-Gm-Gg: AfdE7cmefPz4Ny7pDAy1T7XxlojUmoesJCmKbZsivlv3Q4bDJ4t9oQkz7MnPEb1jvx+
	zkn7103WRdoLKy4XIWOqi8u7ypNPi+gp1J0ZzUDejZ7h/RUATU7ArlGNMGk2V/xY4wJ/sMcdeZ5
	1kuBnfXFMRwwsSvs8kGIWTrAgsTAphu+JKR1HUIaENZ2UAtfwvoTsZFq8Z3GFRQdRby/GXHLpfB
	GBFePnZZbY+umLpsPxL1KgZTKUFohG866gn+37B1lN24Vgxxy2lCKRghR3lfUWOTIg1m2pEa9rg
	Nph/J0reoe9HJOK+aZlD52UnaUbbO9ubI51cbAL1zqzqWNf173CwmbQqG8BIORb2rcxUcoLBUKV
	URCZzAaPGUXwLWLQJnKC7H+/xTlo4gtUKsKE=
X-Received: by 2002:a05:622a:7:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-51c4bdd7802mr101176541cf.3.1783355812363;
        Mon, 06 Jul 2026 09:36:52 -0700 (PDT)
X-Received: by 2002:a05:622a:7:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-51c4bdd7802mr101176081cf.3.1783355811741;
        Mon, 06 Jul 2026 09:36:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4588sm4668489a12.7.2026.07.06.09.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:36:50 -0700 (PDT)
Message-ID: <7cfbc3dc-c1c7-4e4d-afe4-67a25084f607@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 18:36:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] phy: qcom: qmp-combo: Correct pre-emphasis table for
 QMP v4 DP PHYs
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me>
 <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
 <9a203e5e-5d16-400d-a507-8b68df8eb017@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9a203e5e-5d16-400d-a507-8b68df8eb017@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hjxcX83QCPGOPKNuDkbAhCNwqv9qHvcP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2OCBTYWx0ZWRfX9LhQC2gx6eI2
 3aGu4YNypPt10ct5sTQBNMDJEdc3uP3nk4+i7eiQbeC9Tyfdtd3ZlhFJ8F4CuG+6mQOfpNY+KhB
 SLqsoG1f56Yt166lidJWKNUmBAIz/Gon9g3v5gYq3sq3KpYD70hjM7/3Ng9OovN9HdX9EI7p2FV
 8ZC9iVN5rjYD/W7sq/OfJ5e1UMW6zmFnby1420rU1FWriQn2CrmbGsXo3sEO7zkYUuIkXdhjwYi
 BoqmAtvkd3ux91j4j/rEDP17XpC3h+uC1kr1yhSg+Nrb+s3TEl4ZP8AR1xZAIC2NvKYXOTpHQJU
 I60+3XcKE8m5U3dpY7xzULYMdzXTSEFa+k/fZDvuddspc5h0hqybkVNCEVTiAwl57GmAsoLGgvF
 hXk1l/6adka+eqdh+Jd0fbZKy8EVvxYwvBzuMJqCwi4hUhQMJPx+zRKKhUp8d4IA9kigo3IXriv
 7lZRX9E8xPYccUne1OQ==
X-Proofpoint-ORIG-GUID: hjxcX83QCPGOPKNuDkbAhCNwqv9qHvcP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2OCBTYWx0ZWRfX/bcgk/pfwKIQ
 orL3S2zxnJnYJIeQG7n34fCkdmsZxbd335hSZm44uv8V/mV4k2Zahd7V9XJVPbZorytXC9z+cKn
 ueUiyg1HcDPS+FOhwH4CmPq6g59NtnE=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bd9a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F-ycRNR0_AuAsNl2EYwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116959-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 382697135C6

On 7/6/26 4:44 PM, Esteban Urrutia wrote:
> On 6/23/26 7:36 AM, Konrad Dybcio wrote:
>> It seems like 8350/8450 should be using what this driver calls
>> v5 tables, with this fixup:
> Any updates on this?

Dmitry, could you take a look at my findings?

https://lore.kernel.org/linux-arm-msm/4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com/

Konrad

