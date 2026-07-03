Return-Path: <linux-arm-msm+bounces-116357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UVpnJXLaR2pLgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:51:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0166270402E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:51:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dYBxKI8z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JkShtexq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116357-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116357-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6901730215A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5061D28469B;
	Fri,  3 Jul 2026 15:48:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C333270EC3
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:48:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093722; cv=none; b=Oliu1SFYs9NI/nBmrX7Jk1l+Vhwz2uksPMpg+tZe/RV9oyba7saTB4nDNhOCF4mHWi62XkobDs+SC9XBFb37Leq3X/Kmi/BmM7F5DJeurH2avhHB9FF/5YHGM+kVwleCO1qa3Ygc3QlJT9NnwRngQWIUw/9/9+LVEJv5At+mDGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093722; c=relaxed/simple;
	bh=+kphoTvANLDKHMDgJNzN8NAjl3dMOmN6aFLAl4/R3qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DP8JYD6BAIGa5tkhhKuwHzBWUInfQQYczZN1mPrLCRD2HA73f+wyKYEdlMpGfpzeN8mMjuSnoaSUvAy9R2DQMoxwLYY8oHYTd9qqM2PQDrsPDTZRYNY25+/GOz4KtgyHZ0CDPFtQq+BRHdGdq6pLmi8BhnXof86d8jrGkvoufB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYBxKI8z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JkShtexq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BNeRX2994867
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 15:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uEU2G8CSSk6Zshq/zPfEKAJegI9f9YQqTxeUAIwcCk=; b=dYBxKI8zcY3WHh5P
	jPgSz3GQTvE6Zv2Z+SZKtYPmIqL5Y8kP0ydk5D+y6iAoBbW0BgP5AwPQw7h/q9GY
	nNaxhQ4ijGe/wq87kbgyqipDDCB5GcbQu3YYSsQfsorkTYW06eOU0Y2g2q3s95u9
	DUmwN6jOKDYnySPFykHDwvw2sWLBcaBF5JeGR6HJ8o3I9Hweqj1xQGc7cDLP3bKz
	Kbg5AXqKe5lAjAY/hlBw5m/rmObsumiS4urriyjMAPCKG5xNYAnwHwtiJ0Zvc/bK
	KJgyLuRaYs0Sl1JV0/fM4tfJpmfReEbb9JS6uOB74q0924VtduYXcBNbQV7KEQdm
	QZ+B3A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n32c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 15:48:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59d595bfd94so247532e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783093719; x=1783698519; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6uEU2G8CSSk6Zshq/zPfEKAJegI9f9YQqTxeUAIwcCk=;
        b=JkShtexqH6RzXwU+XAxyabd9/GkNTaEtXv5mOpVjUPqcHZyJAagYHEPRI0b6VGS5Sp
         i0eQ1hLaYQI9ltLFDFnFHk12KEdIJNWqlHQ9jms4va2XU/let8ac8Mo2LZ7rZ31oph37
         fTytd4cRQTudmR0S+EkQvQfsJByDv6m2iGTs4+SJMCWcCLkcmyeFymTrF4adw+46+Lyh
         MlwE7MrAbpODMLznzdrIrKMDv7Gw/JkimHQKDzXL1eFj3QEXQuYh4a7WrcCxVVTi/SMS
         TVJrRU3fI7Yzmd8zgAS/H1OQ7Kjd6LliXQOE1Hm6ICJmpUPNZEE6574O8Md2aVpcX1Sx
         ebhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093719; x=1783698519;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uEU2G8CSSk6Zshq/zPfEKAJegI9f9YQqTxeUAIwcCk=;
        b=W6GlPQ5VNws++NhwxwvpfShAiQG7q46b5ktaMgo2kNKg1t0qGF7GMaVpU9HpCdM7AP
         EosiKyxHJoxlwiaj+yTH+6z8eU6BbRVeN3z8jISqGPGh1IOEc7kYAA0CWRytUfgQ2DpR
         p+GnIwksBrnDYQZcTHGyd1y3s63bCU2fVXPn4Yi2UIAWazu4BovBFGVt6lOeDsVu2L4H
         +ycmieWiY15tzywEec40uruPGq6y0C1oDGME0H6lvQ7HM14W4SNhHcwoVwb83ZS8GMyZ
         6NjUNhZjv0KoHdQJzYLaGHvD1A81h22a0k8/2Ov+w1HtdUWfjRAAH8+N1Odowj88SXSC
         xcuw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+C3nWkL1nlyf0xgqBpj+KIJrOlSoaBZWgno7XbFmpJOAwdTZqzzAX6ww20QUkDBFNV1hTfSOQJ3r43jtC@vger.kernel.org
X-Gm-Message-State: AOJu0YyGNDYyOxrOp6I+YfzNr0NsPp+HxOrvh3M0Zg8qO0/cN2cW/DXO
	FOY7pKcyGsMHiIFF1FZ51TrVOIzK0s8LtxXyJ/DA+tDOsspCrI8IT2vMBmZayg0hAfPFxES38BY
	7eHMjz/SNjKDoOEaYYz9fJ/iQ0CupR/ua5MAe1hb9LVVKkr/fBk02wNp4HtgEK5qdjGMw
X-Gm-Gg: AfdE7clr46CyY6ySPmpmltpQCSj50ahJlYHPzoowMnzPCmHbRYrJk+eSe5eF9E2BHNA
	KeSqiT4wpJvUFkcTU3fZTZ2Rr8NK7M3iPneSxTTxOqTG8mmmWQujTQw+qGSZFi4tuvQCIucluxO
	ghKbq6wbfe+uu/FreZ7gKO4ukNRncTB5kZ+Onb6tBRrMNdiEhBiudcaxa3vFYtTDaH8mpt9MZAJ
	32ZSrZz5Kl+sOBj8mWoyQKCeFBrdb1pXZITanDJ9AJiR5kKuEkHayQBgVoQOm3ZcwvVuF+45dAp
	6xXbvp3Cs5v7++g9sDK322hRooeU8VD/6J3LDh8+vNOkDt007bE5p6Vmx6TxMOklapqimT119y1
	vcIWkeqZl5E1xedsAIiZ9KdO1rbzyrctbJqy+xvai6E+FaMbqVTs0NzwdooM24D8yX7cfA3vZKP
	mI8gkpJMUUdk+qPq+EObFoYDf1
X-Received: by 2002:a05:6122:c83:b0:5bd:742d:ba77 with SMTP id 71dfb90a1353d-5be1028b9c1mr26712e0c.10.1783093718720;
        Fri, 03 Jul 2026 08:48:38 -0700 (PDT)
X-Received: by 2002:a05:6122:c83:b0:5bd:742d:ba77 with SMTP id 71dfb90a1353d-5be1028b9c1mr26696e0c.10.1783093718195;
        Fri, 03 Jul 2026 08:48:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm571958e87.32.2026.07.03.08.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:48:35 -0700 (PDT)
Date: Fri, 3 Jul 2026 18:48:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v4 06/10] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
Message-ID: <pli4napz5xis7i24oum73wnaecvqz53nxy7ek6mftlxsq7qkyt@nc7jp6oi4fix>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-6-3882189c1f83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703-qmi-tmd-v4-6-3882189c1f83@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1NyBTYWx0ZWRfX3OZz+8xSUFbT
 UfLeEkczCOV+C0SvIiTVGhkOA8JT773J7rip8/ukpdU5SepoqVzTfne7ntCV5+B1wh6vx+w3BRC
 feKJqCPd3uILuVEk8WQdHfiEzFvrGW0=
X-Proofpoint-ORIG-GUID: N9cSqhBcHA3R-oDdD23dFljRdsVlnxUf
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a47d9d7 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=FiV8zanugsH5vQb0BJEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: N9cSqhBcHA3R-oDdD23dFljRdsVlnxUf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1NyBTYWx0ZWRfX9MhYS++jMIxc
 BJsw+iOKVSQXSBdzbAmDLpdhW02yqu69biKo4MUUyqWVkFaQHDMqmwytfshDsKkcCbb4AUSczhi
 sTcPHMeYDejdAD2Yua640YRQB4xRkp6ElQLQsfS0/p9CLBXKekp+Yf/vcGRpvOdgbI3t4In8qkK
 ganGIxy9lw80Mi86BZNalVQGRA7mcCStif1adXJBwu9D8ZVNhDtG6GNW8q8N77DhIZLG4vL0gdw
 qUiOnrC7Cr4P3HrwFOUbveHODNLfANsydEfJb1mj2uHEclWbV3h2ymt2AxvJJ1OSqf8d7olja0V
 HzxbmB6qSuLgUXMZ2RB7wPouk6bDsH/Xpg8L8kZW7lhnsN00LY9x3wRgAFa/hLDx+AYPZYSTIfS
 BDS9Nn3MwEkMYK18hEz07sDbTjYrTRr31D9G+wJlyvMSCgzaJXnVOc5EVeXOqfjq4V1fzLr8pMz
 VfehI3gtsvyE7KNMx4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030157
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116357-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0166270402E

On Fri, Jul 03, 2026 at 10:33:09AM +0530, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in kodiak.
> 
> Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
> for modem when it reaches to 95°C.
> 
> Since the remoteproc_mpss node doesn't exist on non modem boards, the
> cooling-maps that reference it cause DT compilation errors. To fix that
> remove inherited mdmss cooling-map nodes.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi               | 134 ++++++++++++++++++++-
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  17 +++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  17 +++
>  .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  17 +++
>  .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  17 +++
>  .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  17 +++
>  .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  16 +++
>  7 files changed, 231 insertions(+), 4 deletions(-)
> 
> @@ -7716,6 +7722,8 @@ map0 {
>  		};
>  
>  		nspss0-thermal {
> +			polling-delay-passive = <200>;

Why? This applies to all added polling delays.

> +
>  			thermal-sensors = <&tsens1 3>;
>  
>  			trips {
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index bb5a42b038f1..400d128132fc 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -24,6 +24,23 @@
>  /delete-node/ &adsp_mem;
>  /delete-node/ &cdsp_mem;
>  /delete-node/ &ipa_fw_mem;
> +
> +&mdmss0_thermal {
> +	/delete-node/ cooling-maps;

Don't kill what is unnecessary to be killed. Remove only MPSS maps.

> +};
> +
> +&mdmss1_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss2_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss3_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
>  /delete-node/ &mpss_mem;
>  /delete-node/ &remoteproc_mpss;
>  /delete-node/ &remoteproc_wpss;
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 37a3b51323ce..187bc2899191 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -25,6 +25,23 @@
>  /delete-node/ &rmtfs_mem;
>  /delete-node/ &adsp_mem;
>  /delete-node/ &cdsp_mem;
> +
> +&mdmss0_thermal {
> +	/delete-node/ cooling-maps;

But MPSS is there. Why are you removing it?

> +};
> +
> +&mdmss1_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss2_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss3_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
>  /delete-node/ &video_mem;
>  /delete-node/ &wlan_ce_mem;
>  /delete-node/ &wpss_mem;
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
> index a5ad796cb65d..1e190ed18ae5 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
> @@ -22,6 +22,23 @@
>  /delete-node/ &cdsp_mem;
>  /delete-node/ &ipa_fw_mem;
>  /delete-node/ &mpss_mem;
> +
> +&mdmss0_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss1_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss2_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss3_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
>  /delete-node/ &remoteproc_mpss;
>  /delete-node/ &remoteproc_wpss;
>  /delete-node/ &rmtfs_mem;
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> index f47efca42d48..8e8dd4efd8c0 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> @@ -23,6 +23,23 @@
>  /delete-node/ &adsp_mem;
>  /delete-node/ &cdsp_mem;
>  /delete-node/ &ipa_fw_mem;
> +
> +&mdmss0_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss1_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss2_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss3_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
>  /delete-node/ &mpss_mem;
>  /delete-node/ &remoteproc_mpss;
>  /delete-node/ &remoteproc_wpss;
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
> index b721a8546800..1e9d7e7b5fa2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
> @@ -26,8 +26,25 @@ &ipa {
>  	status = "okay";
>  };
>  
> +&mdmss0_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss1_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss2_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss3_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
>  &remoteproc_mpss {
>  	compatible = "qcom,sc7280-mss-pil";
> +	/delete-property/ #cooling-cells;
>  	reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
>  	reg-names = "qdsp6", "rmb";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
> index 3ebc915f0dc2..6642076f62c4 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
> @@ -7,6 +7,22 @@
>  
>  /* WIFI SKUs save 256M by not having modem/mba/rmtfs memory regions defined. */
>  
> +&mdmss0_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss1_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss2_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
> +&mdmss3_thermal {
> +	/delete-node/ cooling-maps;
> +};
> +
>  /delete-node/ &mpss_mem;
>  /delete-node/ &remoteproc_mpss;
>  /delete-node/ &rmtfs_mem;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

