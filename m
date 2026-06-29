Return-Path: <linux-arm-msm+bounces-115170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lYA7NkGGQmp59AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:50:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1826DC495
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:50:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cakNeJZC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kmsnVjuj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115170-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115170-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DD0F309C4EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74821416D07;
	Mon, 29 Jun 2026 14:34:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE654192F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:34:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743694; cv=none; b=DnvVTeKL/XQ3TmMPCy8DjyB1L0lKCSfwfQdZskzw1vM9a0471vqiRp9qj+J+1ss2nEhhpVI37VvzvnIkDMxkaxKDc01hn8yEGNiyRKBvgey0brE4mX3/qp8iXcuO8InLuQ7aAsowUKlEtiuA/y66xv7gvhTdC9sB6lq+O2zTVQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743694; c=relaxed/simple;
	bh=d05Fycd2bYo1vzS1RtKd2HZ2iWBH0Agkyzhv3yB91pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0FP4wlvh50sMHylxTjltnuPuQrU3BCbHhOqe/nX283nCf6YQSBh/9/KZY3OSE2NncDO44Hfrwd3DfVC5sLDa+Scajk4BPvXrgInCHvhE1KLTf+uu2nOoshMNd+V7lTQtlRakNY89IAeVdPgsIdRbEzvRUwvRb6xOKjdBFxsDrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cakNeJZC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kmsnVjuj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASwV72641470
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqxLsFSIjpjpgfIsOF0zA+8yLigOIjsUeyr/IlQVCzU=; b=cakNeJZC3hkOaDJg
	x5BeMewWb7qRGF+V1MWGBoz41UrKVB8l+Xdz/ZnFv0BDS0gyGoEiV8dzTwa81ZQE
	ejsT4pWOBbJRs36ULqtLgn/YGEgslOPrQaCqyKeZliyT2Euh8nVrdHoI6yB+Krb2
	MywU3DDkZ2aZolbNHMThMC0uNfSxiYh1XuqIr/9kY/lb5IA3F3jViITOCjaH5pK8
	IAjxb+1ypiYLo47pb1CJdswPEnkygWzn48HqPt2tVR1wTJWQD/gGPRExL1QTvpF7
	2pu5DeN8Mw7av9oN2TIk8CcsDtizuE5ZyOkXVn6Y6az2ZwJUp2hzJOPdCOwUTPFR
	J7+kBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3npesa98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:34:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8ee253caso2312351cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743691; x=1783348491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqxLsFSIjpjpgfIsOF0zA+8yLigOIjsUeyr/IlQVCzU=;
        b=kmsnVjujkr84UsusCovTuhtg1awcT2LOEJsQN5YvxHhafyNgBfQ8ssj+lyyO1O2jfu
         Qo7m6YpBDg4ahYjSr2ecRGAkWoeONak8z0NGip7/fyo4loKIRGrHAdi3ltNjAM1HaLje
         gwyrX/mR2B6/pAOCeug/YTPRBeHHGToj0cz/4YwDQ7JkyNamtDAismcwoE3TTtW4mXc6
         rPjnr0A73Ig32PQHaGo0vuBoOYQH1yMnr58YGPqxLhNFMXVXvdxtAe9ZiC4t3J1a18MW
         XFahEcylgaKhZDjDhn+xyUM59eAwzN8DoONuCFKy+AkG92cAq+qF8mDkfsXggRxiGyzw
         BKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743691; x=1783348491;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqxLsFSIjpjpgfIsOF0zA+8yLigOIjsUeyr/IlQVCzU=;
        b=WDPLT81yZQTyyGDXSTVer5wvxapFRyHgVuEthFfMoQW2bjBgtI2J7AHDvG1CotsBJ+
         du6NbvYELFG+FV7fRaH4nAPMVdyWBEoAtuFZ2nIlWeS/I+i41R7QJJx6+ex4eNJ0nK2v
         +Ewz0A7L+TmJ4CAyW76M4otR46RmULGZ/mnavfogWqlj2xIt1oB7sivqIwCrySNeUC7q
         bLfe7ohZVIFgC8XiNGssab0NqzUZ30znKgs0lQ/22IfakPX+8JQAhwcsccQYEAIbkhM1
         0srpzVHN8j1JcxsCdf4Lt9KuJrGPBLCDSqCGI5Nd3SNs6nw8hnPLrSJI+69g+aK8eEPO
         Kmjg==
X-Gm-Message-State: AOJu0YyRi66YWgr/FSGUSsr4I2uMDhd6Vg4eQhLwLkx+Vg6FCKvR7ml4
	bjV2xIrXl7bqLqPjB4ED/ycmqh85NfxXkref3gPw6qchrSdKsGobZbphKFEyAYnM0pxib57Vgc4
	rk53rSE+gG4/smGuajvtK1skVAxU43eHHp1rZK6WdcSg8ktcYyO519VW9e4vG4B+i8iDO
X-Gm-Gg: AfdE7ckB7henzdXFQ1MKFUzG3JtKJRAOp/n7iH/XtlBRYnvUPJevKXMpymIZ1J8x+BZ
	5KkH4YSrs8MdqnOCOHbVwjpks3sRJdJTf+wK5CsxKLBtBqhIIdLFBkZ3z3/43SDxm6NuMST6doj
	WxbG3Mj89WLwYIHu0RmePKaVtT3kAZYGXW151sguwWbZLNTM2DHsAy7ScGQNw13mqXiw7ijcKAb
	X+k77B2GAnLZR9g3t2oRt0vpOJ412vK3tqB4KioTJoOn6p62uVBjwrl85gP1WiPe1qU+aXzcuVA
	5z3cKDMkR6xcCh/7fdZi8Eij3WDXJJyhc5e+iLSIny5s+rfVsXERqqBHFhbPGfB3YX93/zRjwaZ
	v4Va+8vdyLBmOCQO9XBqnvTlU0kC5ruIj19k=
X-Received: by 2002:ac8:7dc7:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c0a85c063mr13123671cf.3.1782743691069;
        Mon, 29 Jun 2026 07:34:51 -0700 (PDT)
X-Received: by 2002:ac8:7dc7:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c0a85c063mr13123191cf.3.1782743690417;
        Mon, 29 Jun 2026 07:34:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1250a80b04sm289378066b.34.2026.06.29.07.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:34:49 -0700 (PDT)
Message-ID: <64691236-178a-4fc2-a9c0-f053b7944e66@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:34:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-10-2114300594a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-10-2114300594a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMSBTYWx0ZWRfX8+DVIat0GDhc
 nejYLUYT4EgPGMByqG/liTdIMpfgg0fc8u1DDKLTZ4wGQ5GW0yJK8ieE2rU4q33Q8hesw2SOQjq
 ylOcTnUPHjIu5mjsQbKO/wHy0DSU1dX9775c8XT1moWhGiDOB40FaQyL+1mMbHxTnRwFEfB4rMl
 Ynep4/5yxRYduP0TR5/IzJhblFEaL4/b4tg/2F9xNrTPvSH0lpmYnb2BDHTpSy7h4X1GmEwyzmr
 6XBZx17lKKZqM3+mLVNtYk5qfvIqhHY18yIKC66Y2tomWPq2IpH6x0Divlsr5OGJ2TYLDNBdncr
 UwXS4J9NvCvvyPGl6Dh5IyW2KugHnvYhci4Mvx3LeGc4jr663WPbvvKS3kq0Z9o2hIx5kPeWG/q
 iCSzaNebdez7ouDw3MNESQpZ29TcgTX0zae8YwUW6zDmluRkvTNle/kZBG8XnZtOBYGKxsEdCnX
 L/a0Y7b/qqK+bCrFfjw==
X-Proofpoint-ORIG-GUID: AbNfEyKs_Q2fE7sZa6GDbZZqPYdRJrrf
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a42828c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bA5z4lzVfraiEpfBxBMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMSBTYWx0ZWRfXyi4m6c1MZj6L
 EOtLL9fIAEE9gcOvYfKLSDqTnj1cjlWiXc+gqpyRUa7BT7l0fFiajIHq8qgGI17Bvu7QL1Ij8WH
 B3ORi77L2YTyu3+h9nr7k6d8LQMbLrU=
X-Proofpoint-GUID: AbNfEyKs_Q2fE7sZa6GDbZZqPYdRJrrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115170-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:yepuri.siddu@oss.qualcomm.com,m:miaoqing.pan@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E1826DC495

On 6/8/26 3:10 PM, Komal Bajaj wrote:
> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
> EVK boards using the WCN3988 combo chip.
> 
> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
> board-specific regulator supplies across CQM, CQS and IQS Shikra
> EVK boards.
> 
> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
> with register space, interrupts, IOMMU configuration and reserved
> memory. The node is kept disabled by default and enabled per-board
> with the appropriate PMIC supply connections and calibration variant
> selection.
> 
> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> --->  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++

Split the SoC and board changes

Should most of the board-level changes go to evk.dtsi, since
they're almost identical across all boards? You can e.g. simply
override the supplies in the IQS EVK DTS

Konrad

