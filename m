Return-Path: <linux-arm-msm+bounces-93094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNPuAQw1lGlAAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:29:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B53214A656
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 860A93004609
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE09F3090C6;
	Tue, 17 Feb 2026 09:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Af5fWNkH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmlHj9Ie"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79D7308F3B
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320582; cv=none; b=NcwvrsFNx3PaW+92uFzHso1eA32yC/O5wsOBdR2Nezw8zGkpk8AEmnYXXwNQEV2RRItbhUHsgdX6Cqq4K0BPYZ4LkmsplBcw9/DG0ybYnmCGQjnlzSGihSoEGwR5Y9qNwvlkNN1//k/jnpG76WvM4OH7e/cN5FOWjzevwI3p/M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320582; c=relaxed/simple;
	bh=mqPwGTGo3r897ZNbRAYLZVX6lCs0huG/a5zP2p59sNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gm3wkISog3jfZ7lIrHQ0QEym4Qa0HFjUT8kGGgYUF+Phy7/5hHQSwLhi2tc/X480KqN2tSiVMmfbNeiFa8W3dgLK8p6dGh5rrxSHfhv96bSUihU4NYUUTsnC6c1zIOUtFgEXTmE/KIkkRaw/ZLyOr1029fWZ1pQrwTbqaoGXWQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Af5fWNkH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmlHj9Ie; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GH4RKR985178
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PAJ+8ZH4GA3UgmlDTl80DaFGepw/jrlHBe1aFbiN+eg=; b=Af5fWNkHN5Qlf7Su
	kQDcsJRyyn2UkSV1epFnT04VAn2RG6MmPLSDzfrkaYgN+LfP/iAWEiwtz1iWKm4O
	wCWDffWWW1fuMjTmL6amwN8tzJSrUBbmx8c+avKVlwfqlW3VNKxGgxeQWXtj7M7X
	oc5x4903/SzR4iE8L2nsK9lQ1qmTBd1IQ6J/4BKt77MxxUAr7/artx2+E8xQOVkP
	J8gZWPhoNZY1aIuXnvebSKH7i4D0K/C1ylIgJpR+bQinmJ1BQfbFt2AfV3J3rpyZ
	UpqaPxvjeHVrl2L/cnvISwoNkCvBxQtDQ5ZoOIKv2xkT6AWCXh7lsuE8N0nNDCMZ
	v76dUA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap1p9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:29:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8946c23cf90so31958676d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 01:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320580; x=1771925380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PAJ+8ZH4GA3UgmlDTl80DaFGepw/jrlHBe1aFbiN+eg=;
        b=OmlHj9IepyhAGzHMIbBAm9K+IIp8sQbMw7G2qed9GtwH4HQe0PsMz3vG3aY1+5kOQ9
         7J1GpLvU2w1OiMQOSqCuoNspPhZwBlvgjyzQU/2Iu8KHo3S84ueAk8uESYEmKCCuX16i
         4Bdh3ukfQiAnkA++0Nwyv+D/ibUL0yUJM8BwbPdyrKOtKfb/nokclmpYbo3Dv+Rzwxy5
         tLMfqyRcrEr0Ud0l4bQUw3QI4URQtwW7GOmQ9cz5FZRPaInPOxAi+tph/5+gvRVtu0aQ
         XY28ftKwELNDHtXIfdMyNptReVuksaLHg7/sa6upQ63R0htRf8XcpTfqUBnX3KvQ7QiK
         P+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320580; x=1771925380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAJ+8ZH4GA3UgmlDTl80DaFGepw/jrlHBe1aFbiN+eg=;
        b=B2ubGh6CN63f0VoxE6J/ZfUSFGG/tqIye0X4noqWgY+DqIzKjKyrkl+CHZuHjgbN4B
         CDF152AuBJh2usOKez8j6oda+BZB+wjY+WOWbeDzaOgervin1G4WEgXe26oQtACaU4AI
         tRMNr9sHAXuo4igqhdF+u8U7FiMROpwM8ZDwUqC+cThIwgIv4hDKI2oYceZ14qAzUqWC
         Tc0iofTALon4CWkWCF32aO4BizmwiiP34wwhahpAt/G6k+6BDBAnwQt7pYWjsboD2+KP
         FCAZg2CPEsPvBEWSvPrNIyA4FrGkxA1/gSHgpghJPl3h9s15YXh0zFGhzMaG8mqA6cWj
         fqHA==
X-Forwarded-Encrypted: i=1; AJvYcCWpS56AIiFtrJ64XT4VkUAuy32kIybe0nWJa3RECtBzWoN5tvBhQMrufXkLbeDnR66EPSgTWWIS6xxSl4EB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5xp4WvQXKHaBVBS+EOSGRlo0pwZKDzDauolBVnows/FE+DgP/
	LPBvvnDFz92OmbgRmRTDVxftnILQQXnvbgFlcCH9575wlBARaT54ZleSTIr/+ul1P/dnPiwHklQ
	zQwLQke56zC7bbfgnFpGqMsctD+TI5K0b2wiFBSk+izj4p8wH2itGyEMDOdRBdRiC4MFq
X-Gm-Gg: AZuq6aJp2TsqUfBs3rrgoR/MxOJmJyfHaAn/WrgoR64A+QXQ+LkIix3uGPGJlosmm/M
	1FXEcP4jbX7gpYfiJl3vXQz2b9C2skzEE2ng/XikUveqfFGCjXk3aIryGYnxyK0tC9CEkIhjSBz
	pQLC2Cpn9p/xVCPbleJZy5X0pepbglTzfUfTbe00ZtKjrZ98L9K2gR9RRq+hNllZ7LhsBkkpD73
	PMuwR88RF0kc59O8yE+CTYidwXMZtVFgNqr9MhGpRXIuTC2Du9ZkyUzi7pbq+73oqtuFDtf1/iw
	0fDPFhP7w2udLK1vmHQMzbI8C+RxChhyziivDZFI4glXoTi/pVS6yN7osr+kXaDyNn3cNyxkDfP
	rSSKsiac63Ry59Xc4rk/u/F0qyBxdE6HYVmZ/eib3nUHRet43mmZxO5PpCa4G+LZ3Gwgo7xZ0JH
	oNwe8=
X-Received: by 2002:a05:6214:8093:b0:896:ff63:5e6a with SMTP id 6a1803df08f44-897347edef5mr142990466d6.7.1771320580166;
        Tue, 17 Feb 2026 01:29:40 -0800 (PST)
X-Received: by 2002:a05:6214:8093:b0:896:ff63:5e6a with SMTP id 6a1803df08f44-897347edef5mr142990356d6.7.1771320579722;
        Tue, 17 Feb 2026 01:29:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc763bacfsm337458866b.36.2026.02.17.01.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:29:39 -0800 (PST)
Message-ID: <0d318ba2-5ec5-4eba-b060-9c8a2fd3defc@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:29:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: add support for pixel 3a xl with
 the tianma panel
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science
References: <20260217000854.131242-1-mailingradian@gmail.com>
 <20260217000854.131242-7-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217000854.131242-7-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OCBTYWx0ZWRfXz3K4CdEYvSt8
 OK2b1s1Jhljq/c3NX3HOawuJzpH+aL00cY0xbwO2TCMOLVQOl/v5n9XmdEFjJnF30WQ+N1xlPP3
 QSaHmIeHKQM1GC+8poCy9ExgGuOCjPiYXiGU3jEXqVTq/neV50N7Xr4bHb1SWRVJdgGnAMiwSaU
 ND1f7QLsLMe+5b0d4heoVqUkaP0jf6UdET1EQ+apDAFhSGx2T24rqNrph3Pv91JP9N/N83IQLvC
 Xfu9Gh/OSgmmkQIBiMUBnIRDexIzJ4LaiUcOjd2k628vE5V/WOI7DSzgVVv1Q4n+2zcch2VrTDp
 Ar3DpSuA4ezGevMNvBuqg7xW9pRzTsZDlfZWfNk9eLV6YaDDWWYtUxdUP8fGDS6R/wzkLf877QX
 T5XyLE8SgRzF25R+rVQZGM3xlngGG7is6Gh7J40Rq9/651/hNJQVI5HQD0+Zdhd2izQ5GfmciSr
 nBFrv5IWmJwFYYlFxvQ==
X-Proofpoint-ORIG-GUID: TRKnIvM_8pHbMne5HXMZREfbihgBQ444
X-Proofpoint-GUID: TRKnIvM_8pHbMne5HXMZREfbihgBQ444
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69943505 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=nkUbddICNmq_qF48:21 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=i-uTSsb2jE1798FbZwUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93094-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B53214A656
X-Rspamd-Action: no action

On 2/17/26 1:08 AM, Richard Acayan wrote:
> The Pixel 3a XL has variants with either a Samsung Display Controller (SDC)
> panel or a Tianma panel. Add the device tree for the variant with the
> Tianma panel.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +&framebuffer {
> +	reg = <0 0x9c000000 0 (1080 * 2160 * 4)>;
> +	width = <1080>;
> +	height = <2160>;
> +	stride = <(1080 * 4)>;
> +	status = "okay";
> +};
> +
> +&panel {
> +	compatible = "novatek,nt37700f";
> +	status = "okay";
> +};

I don't really get why you disable the panel/framebuffer by default if
all of the "includees" enable it anyway

otherwise 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

