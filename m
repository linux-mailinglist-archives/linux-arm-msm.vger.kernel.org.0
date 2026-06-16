Return-Path: <linux-arm-msm+bounces-113309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H1KKM2qfMGojVgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:57:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5545C68B1C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:57:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TYkLzOHt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fRq7fTIr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113309-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113309-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 305A231393A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B9E257827;
	Tue, 16 Jun 2026 00:55:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FEE1A9F96
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:55:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571305; cv=none; b=Kgyhdq4kThPhcAXcO5AgsqtHdGPlAj0vilMiiJRpLL0BMge0eJTyRucIlhlqhtTRiUVwMzJx+c+8CmaEzDxvabOUvCGGWWOG00qGUk3W5i3M22q2Q0BKNcBkDBH6cNcy3Wof/GSybOoLp4sYrazJa2y8YvNKpZ5Nz6JUl+sSsLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571305; c=relaxed/simple;
	bh=SJ31mK3JQy19OP0EvfHyWXGR1AXAJ6g/2vEzJhFf/js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRK/MQgcIdsCjplkZrHN0BlX9L7esau6puuHZPnk8rMGjEZ4K4jnZazijQTiHSoRxIw88L9jf28xW7n5fHKiRq2/ED57lO9hzy/gVhjK8WSrx+rBZMG+fVnkIXfonHFjv6Y59j+fo//WRfuLZ9Kmkp2b9kUPR+qohjAegk2BkTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYkLzOHt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRq7fTIr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OPTr2064163
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bfH1YFfB8DVE548OmEdzvoO2
	Sfl2pDVWRVr/GFOchFI=; b=TYkLzOHtjzBiErwXALB1Dtk0csLDCxfFkRoQbiUK
	1lNAL8oCGQ35BWqBCa+ot6DYGNZSitul+QeXeViMXgnkZxpqDiKcy/0BZeXJEN2L
	cIvAD1aWbzYsuBN5teBejW90E+x5NRObKUThM4xwyJlizsaTQ//F6HWl4PlvMOk3
	qmZ0CNkrXNt6wSneaisyzRpxyaWPWN/jy2QTSE9QU8cJVgnxRw48ltOx/8oug5z4
	rO+dH29NaDmjURZxmspmmqiAGzYvvVoHtTxiVX7GWZwGtTdCpTMyvBxq0o23mR55
	32Qpe+eakA5qohbjufOjtKgQ15NR/lHkn6FMqaPBZE68LQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteguuwn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:55:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157de5360fso908001085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571303; x=1782176103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bfH1YFfB8DVE548OmEdzvoO2Sfl2pDVWRVr/GFOchFI=;
        b=fRq7fTIrP6iK2+H1KEU+CyxIUU/HSuzjXeyimR03wgbB+SV4GrpOE/k6+27YxR52he
         wB2JAYus+icNx0bMpZksEqUnkV8D6AyLO3hkGkBIMxfZHvghZC7a/Q1l8xQNibftfIZi
         uwXx2ZKfP65qkyB1TqVKYJI5TqiZ7hx0ZVEL4Hftd1prUk0Dx/AJYNJ20/V2ho00xRHh
         ovKo1R80da3YnH/L8ErLrvmvwZiJKGZQvwxuFw8m5i7UgSzbdjsT5jd7wW4SDAZzrAa7
         z7wVebAdkNaq4ldQR9ZPho/VZNjeXk+iTGxsWTQJkv4uhIb1tJxpn1tDtl9ALFI9vyyi
         EeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571303; x=1782176103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfH1YFfB8DVE548OmEdzvoO2Sfl2pDVWRVr/GFOchFI=;
        b=VCnsADtCEITYTTbe6zBVe3L0Bp0svro3TS0vkn2Lrr9lOsuao8EtyyfLL6ZhTB8MBW
         mCD3UOqoRwWpFFM8F6/yRBNcGcC9Vz9Me5Y6ks6rWwtC9OGAWqzDpI9wN4araIu3Euj3
         3sdkAmV2BUx3dHEkJRgn+Bz28ZdAaddYy3BmrPt+3kYHijL+H0Kc7kGPf2cm5QPmsJxk
         zVdVq7VxKtGN6SwvzK+Tj8b8zFVgN3xHHsfHbHtTIwgcyztPI4cYx4SZss4hN+lQW6KI
         plRy6UlUc2iECX8MFnEFqSTaKr0aOgVHQ59/9ONFMH1XxDx6FR3y5HjDI6MXnMbRd3Ws
         B29Q==
X-Forwarded-Encrypted: i=1; AFNElJ+UADk0f1+o2bMW/wCBODRYpZRhZJw8htLI9ujGCkk5I9lQD+B+vwiB4+Yec1e5XmsIBJ26TQZWts0yPxAq@vger.kernel.org
X-Gm-Message-State: AOJu0YwAEvwNgTrI+ph+CplVB+8Bu1s7ceHpi5gqJyotTFhUyjBxOEg8
	9d+DVMzggY5WZCRy1RLOLIKQ/9kTMvtGMVjh6/VLnjxqFhbt8Xn3APM2fZdZbqPGIayl+DoTaj+
	WQ3h6txvmwXYWl/YapEs4+cOB2jesaBfBdulWd2dSNgqybCuctTdP9f5Dh563xwC7O8Rz
X-Gm-Gg: Acq92OEhEl0oRAUzoeJOBmyx/u0i8Nd7LPD8inRYBcKCyPS9gR5a8TspJboGQgO7j5S
	dYIPblahZ0p0fw9z3qnPYeXq0l6dnxgkVMYaJg68upY0VRwTYIFZbTsUnhmkAgLzdx3BdZjCBv9
	mKIb67PA9y4tdNb97ozxui0teCh2Q/YCGJZ1VMUqp06sW5CRIYYa4jVO8vvW3Z/9tAiKTq/W1wi
	BMVtMOjYV4HFd3vMecw8vW+d+eBGGX91sjAUD7SRuwTDlk+gwoMJpRu/I4F4n0XdOvt4dzRiopz
	gmOB1Zo5XyHIDsqqMJrzmffKv7484ap9D/mYWCFN8xjydMgUnAqFcscnWFjrCPPkEQ0JV+o/mMw
	c/YTwq8ufIFpR2JrNBx/HMEximYH8X8IQnIbhjgm2LzIrFuQM93rhuZDGjEw5pq9kIGDVrTp7zg
	l1pVUvtrTw48hfUN29itm506ApCPQmLkDtsxE=
X-Received: by 2002:a05:620a:2985:b0:915:29cd:306c with SMTP id af79cd13be357-91c2c4d288bmr257335585a.9.1781571302552;
        Mon, 15 Jun 2026 17:55:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:915:29cd:306c with SMTP id af79cd13be357-91c2c4d288bmr257331585a.9.1781571302114;
        Mon, 15 Jun 2026 17:55:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161f2fsm3158366e87.11.2026.06.15.17.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:54:59 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:54:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V1 0/2] arm64: dts: qcom: Shikra SD Card support
Message-ID: <boo7p6mgop7rarfu3rfsrfah6eq7zp6y3sf6mdq3hsejtacwxx@yl543m4lj47d>
References: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX9qDgTTKpe9ho
 DPemu7KWAv4OUN54hEBIZxQBhVJqaS4B4xib9TN7yDdGMGmmjRzcZoJhHKjXnno900G484Lie4V
 5rpeX/mwXyeO/q0NyN8l0bt16tDUC13TPD0X8NOzZ1i06KEc669e4yXpUE0STbPumL4NSGx9U+h
 cnqjFPRkMRqJn2p4PFKAjMm8+vhjCvrmTvoWMZLdtsMx+J94ytwm2j86mM5Je/SPFLhirDNlr1h
 jrXiTlz9jRo+7RAs7NdBxvkFd3oJL+xi+wm9HRi39ggWE6qwQd3pzYyvF1OjxY9iYc79WDWIF+o
 3X18RaB38XxuG/S8/v3quZbg5Leov6A0Lul5tDdybYTWP/xWLyqaxtyMnCpe+WmoKooYUegWNzp
 7J2OaIqhbaX+u1WxTShmPoXieUElTIIgq77of3XtqCGs1X2tsNP1d/R1s06wQqpH3QG4OOo+rHU
 GpmETF/t8uVVRIQstUQ==
X-Proofpoint-ORIG-GUID: 55525yhPJh1R-lyiqsjerzWewhb7HcjZ
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a309ee7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Sqa3oZAXkj-0WgPsOd0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfXzWVXVVSczQs0
 ipo/9IJ4YDnA0Vt2fIXXCoUZl04KlziDzFsz2FG+8qYL6GMp4VeOktLIR1igAW4c7WFsk8G/QXL
 ytNC4tDkHLujjrzKdgDzGR6fMGUoQHI=
X-Proofpoint-GUID: 55525yhPJh1R-lyiqsjerzWewhb7HcjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160006
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113309-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5545C68B1C6

On Thu, Jun 04, 2026 at 05:50:43PM +0530, Monish Chunara wrote:
> This series adds SD card support for the Shikra platform.
> 
> The first patch adds the SDHC2 controller node and the necessary pinctrl
> configurations to the base Shikra SoC dtsi. The second patch enables 
> this support on the Shikra EVK (CQS, CQM, and IQS variants) by defining
> the regulator supplies and the card detection GPIO.
> 
> Testing:
> - Validated on Shikra EVK variants.
> 
> This series depends on:
> - https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
> - https://lore.kernel.org/all/20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com/
> - https://lore.kernel.org/linux-devicetree/20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com/

If the SD card depends on remote proc, tsens or cpufreq, then something
is wrong. Maybe, the way the serieas are organized and sent.

> - https://lore.kernel.org/all/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com/
> - https://lore.kernel.org/all/20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com/
> - https://lore.kernel.org/all/20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com/
> 
> Monish Chunara (2):
>   arm64: dts: qcom: Add SD Card support for Shikra SoC
>   arm64: dts: qcom: Enable SD card for Shikra EVK
> 
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 ++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 ++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 18 ++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        | 93 +++++++++++++++++++++
>  4 files changed, 147 insertions(+)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

