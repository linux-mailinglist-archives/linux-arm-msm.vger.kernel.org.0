Return-Path: <linux-arm-msm+bounces-96594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBStANr0r2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:39:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D46E2497D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24B57301938F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D504A30FC23;
	Tue, 10 Mar 2026 10:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDwyEmHV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HK78/KAm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F118371040
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139150; cv=none; b=FiRnLihTa9hxdOs4xBfUeRdjWdhnSYuzS/MY6HhX6RZJTdiPBxzU36+oXNNcn5DMun/tl08tnfQYmYjU8YylselITJl7PAplmFW62perhO/ZnwXyd/08BPxH8glZBFcsYij+cLtTZxMxvkOz1l/pl/Mv789gcqqvKWOIf0cM+6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139150; c=relaxed/simple;
	bh=fP8O98OPBK3agQxFodoAANoQ6TaOINOYU8yt74cg8ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSvC6mQ//fhgYj7BshUDhNv1aF0o55iQWM1cwPnEUYfOPqocfZi2G6F+S1UTaDv5EHiHtBo+m1/aneKjnpzDogxJY5vLWc0t5bARgkHbj6IoWq2zDSKM6Ni9IAqZH5CCxSr5gRvuywzjyMbJgehJJhv1Guk0C5mArS2zBc5ze28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDwyEmHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HK78/KAm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A6VLx02021448
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMz4jhDlfWwNY9iQLLZN7mOTPZWJN8ov+NL7HZ8hb6Y=; b=GDwyEmHV97sJBrPe
	BK8gPC2DDtSlLgq/QoSFFKMw1EVcCuBVse+71R6XtdhnKKaJAKEpBLyGvTXIWt7S
	yfGqMVWYvM0TKk2HVYUPrNd1zTkAnsZL4LHrasDeII429da4cC44EoMjnY57QfPI
	/Na8QKfK2NAB6gEMIDI+bmQph7NIPjLB7LdgtCmRnOJFiJV+xx8sbWkeP+5zhc7R
	mSW9JdawCYpMZxMMM6z8Ae7VwFIJJh2l8W0a5c5vlie5Qb7bfomhSZ9bGYQ9CnF2
	/vu5qBsWqkITg3jNxV9Ivam+qGUGKQ08W66djPRYY4YUWGl/hv8e/aTDWYY+8pMg
	iw07EA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w8vt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:39:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd84cfae34so105047385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773139148; x=1773743948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMz4jhDlfWwNY9iQLLZN7mOTPZWJN8ov+NL7HZ8hb6Y=;
        b=HK78/KAm70KdL+1edfDX8AN3kUonnnQfWuTKSnRqkkzriEqXKUIVM82T43b/6ulfT4
         mV09F+viTJDvXt+Fh570D5v14UGWWw/vzg1bBS8zS9y0Tr6JjjRFntoUID8UWeo1Stcd
         JpIO+zSyPzfb48U4tQmu/EMlyJXJ0BD9L4dQHU0M1vfmIGk0WleGUDYjuhrjp3MrpaWx
         SrJdV2pLRztdfI4y6r69GaG2WaYtRcs+Xa0DI9URhKIzQUqiKBJVs/dIg/2+wQDdBHaZ
         nayMLC/qB4DzuzT0YxFb/WcnrVGTqrO9Zl2Z7JKjpXyXURZHJI/Cn7ix3wGib4p9HaKA
         95Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139148; x=1773743948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMz4jhDlfWwNY9iQLLZN7mOTPZWJN8ov+NL7HZ8hb6Y=;
        b=WhckVzQot+ID1z4D4E3gZl0h9/mgB5pf/8E0LLMR/cIEjtUir6O6QUFDpkQq1Dgt2Y
         ADQIW19fOWvvjo1wVwZ2AawO5YS0ruWhkf5RYcWcnyOx6moimxItArO9DKvCmZM511bf
         bsfEkDOK1tNvMgAYwpldrpoYY94poyWDTVJTTW8mBg+N9+jyuBzk9l8QoHBjjFodNzC4
         3g7Sjq7AVetndoOMwKC6GYw9yRuwM9D3pJW2ugd4tzcLWCNOj1w6ysM3xBFB3olYAqoL
         dCFNNt+auIAqXGOd5T89n0OTzMCIe3FsB+VcZYVHacVruTdZGF3S6Oba2kKFYdQg0+Ie
         s+WQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4CnNXPIUuEJhsw2RHZa2YAZArAdaLUscYlFpCqllubnE6PqECMG85Pnzl3spSaU2eRPWOThBPL749W6Ks@vger.kernel.org
X-Gm-Message-State: AOJu0YxE/iSnIcOhVCKr6kxAh79bG29NYtiRjvjb4/RlnZwa4OWhS59a
	Oir08JM1dnfYV17Vz2Nop7QalvDePaeAUsMOuq7pvHqMj5ogpeXhy+AMMArv4UF3urqJI9bj1FU
	BilLSjn/cYMw2WETa1ZFmS7x3Px/70lHg/fbn5SSPyL5ICukuItStoZYnNE/1+akEfX4z
X-Gm-Gg: ATEYQzxOUA5scxzizjwL9kqOq8+EY65gC0e0lfq0Hy+OhZgc+GenRFnOvf2U1yTHXAd
	Fa2kB7ztKZVKNuwrqsz+kygB+CHGR+0KEOVRjYka4wwod5DgCPo4rawmQgpqkay4Hp6DN+UExaE
	DoLifTYdIfBXMjdC5HLH4Pil9uu1+1ni/svYxVGwzvRlpy2pLjOIV7CwCdQehDttVn51hjvCnsn
	fbvm0e3xHT4ZU7BCenKevIBaCrAb8xyZGuN8GkYchdbM/hRnty4ojtCm28ssdqefu0azyVdhu1t
	rgfiO3bzKT/tiMvvq2jUbdkgk376jdDMKCFSfXyxJDgHj5fvYM7xNQUUNr9o+di6kcZxr7dxZyc
	nEjcNSNJYEsk5qEju/qiRn74huU8IOAI8jvRV46zqREtUis/hys3bX/SqbtKI17O99NeXOsEA/g
	+BazU=
X-Received: by 2002:a05:620a:8b17:b0:8cd:7fac:a2a6 with SMTP id af79cd13be357-8cd7faca57fmr608063085a.0.1773139147843;
        Tue, 10 Mar 2026 03:39:07 -0700 (PDT)
X-Received: by 2002:a05:620a:8b17:b0:8cd:7fac:a2a6 with SMTP id af79cd13be357-8cd7faca57fmr608061285a.0.1773139147419;
        Tue, 10 Mar 2026 03:39:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef4827esm460632666b.2.2026.03.10.03.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:39:06 -0700 (PDT)
Message-ID: <63de1d04-adf0-4608-aeee-2d5208c100ae@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:39:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: Add Monaco Monza SoM
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com
References: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309152420.1404349-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309152420.1404349-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5MCBTYWx0ZWRfX65xTJ1DDl1g9
 TJnHEHgtzVAw52hnlbSsMYhuURf1Ui517Ww4C5txeVldmNnzcBNKaL50SBu6BCjk+ACjEq+o8G3
 UFqUg085FbkOLpuf1EI/PPBhADwmBG+odjsOEURRaVP4d3XgSSx+BTrVD962BmfYFYHkgVJ74C6
 l7cVE9PYWaov9nIyiiqXrD5TFNb2C8IyQybapZcXzL6vjKLzwR0Tp9VzulB8sM95UzYJcG27JdL
 GAH/CYVuD58KoiG+zDSF//gFrzsKLk6xPpZfyO6SgHkKWLgOrp7a5IciaOeI0EUyO6I77DF0PBq
 oL9Ry60GntOF7N3lggyypetmRvqr7FimazPLkEbugyTKhxRqMf0dLrQ9QIBfcaqFwIx5uuwOlq5
 oTxrFkLy9I85XUl09nV948w/sqjTiFrhHoNe4iuYwimGZ3R420alZP8iXS1E9JMMrFvsEFL48QF
 QlYfil7C+JXYfaK9RtQ==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69aff4cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eQA81Jyt6kpvTzy5W_wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 53XwG8N_6jxq5y2Yv6QZCenabmV6teSQ
X-Proofpoint-GUID: 53XwG8N_6jxq5y2Yv6QZCenabmV6teSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100090
X-Rspamd-Queue-Id: 5D46E2497D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc];
	TAGGED_FROM(0.00)[bounces-96594-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 4:24 PM, Srinivas Kandagatla wrote:
> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> The Monaco Monza SoM is a compact computing module that integrates a
> Monaco/QCS8300 System on Chip (SoC), along with essential components
> optimized for IoT applications. It is designed to be mounted on
> carrier boards, enabling the development of complete embedded systems.
> 
> The following components are described:
> - Fixed S2S 1.8V rail
> - PMM8654AU RPMh regulators (PMIC A and PMIC C)
> - Display subsystem/phy supplies (DSI, DP)
> - Enable GPU, GPI DMA, IRIS
> - PCIe Gen4 for both controllers and PHY supply hookups
> - QUPv3 firmware declarations
> - REFGEN always-on workaround for USB2 HS PHY
> - Remoteproc firmware names for ADSP, CDSP and GPDSP
> - Ethernet SERDES supplies
> - USB HS/SS PHY regulators
> - On-SoM eMMC
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

[...]

> +/* PCIe0 Gen4 x2 */
> +&pcie0 {
> +	iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
> +		    <0x100 &pcie_smmu 0x0001 0x1>,
> +		    <0x200 &pcie_smmu 0x0007 0x1>,
> +		    <0x208 &pcie_smmu 0x0002 0x1>,
> +		    <0x210 &pcie_smmu 0x0003 0x1>,
> +		    <0x218 &pcie_smmu 0x0004 0x1>,
> +		    <0x300 &pcie_smmu 0x0005 0x1>,
> +		    <0x400 &pcie_smmu 0x0006 0x1>;
> +	num-lanes = <2>;

This is already set in monaco.dtsi

[...]

> +/* PCIe1 Gen4 x4 */
> +&pcie1 {
> +	num-lanes = <4>;

likewise

[...]

> +&qupv3_id_0 {
> +	firmware-name = "qcom/qcs8300/qupv3fw.elf";
> +	status = "okay";

Other nodes in this file have a \n before 'status', it'd be neat to have
one everywhere

> +};
> +
> +&qupv3_id_1 {
> +	firmware-name = "qcom/qcs8300/qupv3fw.elf";
> +	status = "okay";
> +};
> +
> +/* There is a HW/FW issue preventing proper REFGEN hardware voting
> + * for the USB2 HS PHY. As a workaround, we force REFGEN to stay
> + * always‑on in software, matching initial bootloader config.
> + */
> +&refgen{

Please add a space before '{'

[...]

> +/* OnSom eMMC */
> +&sdhc_1 {

This one is out-of-place, alphabetically - please move it up

Konrad

