Return-Path: <linux-arm-msm+bounces-115067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mXwgHt5nQmrq6QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:41:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2EE6DA660
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:41:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lk12HFCn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h+5nmyt6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115067-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115067-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A24A30AC204
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D66409628;
	Mon, 29 Jun 2026 12:32:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29C409127
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:32:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736369; cv=none; b=naq9TlWSJJYccH83/mEgnApviHds2oj7tRMRe3ig6g1uOBSiOpioN8otu4jF0A4m7JBNcGyWAotlbDu6S7li32YuOXYneqO+HEV1IGe2XibVxtjt0QYlOYGzG5l7AiHIWIsPdyeRbmXLN6zwdXDICGW57A41LoX1y8Omb3gtYcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736369; c=relaxed/simple;
	bh=8efsNnD8ZlOsUYmypbKzEmPSzrjsDpxrNYVfgMTH7F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y27675wKTASXBLieeSi9ZKhO/rb3ytp7KSK/RjzrSltfDR/rmPtMcNE3nr8HpoZ8GPCAX+Gatj6EWi0QTbN2oZ5pXussmYIcNEGKlRgkMEr4NYRQdsflK3f+eBGAy+l12Lyl+n9mc+Kg83V5gZWi3fnbOjXbVD/4gVEe/WAXFHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lk12HFCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+5nmyt6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATK802656157
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sg9b45lWyYW5afGwbosga7mripr2JnazhYSqMcE1s4U=; b=Lk12HFCnaKvFM50e
	653jd54V9RwoslGrx/MQZKA528gWHRvtjXFGVAXy0k1vjx5qoU+bvkd3DELQgXGy
	hngiO9YhJ6sPtRss1vsak1q/07Y6rfmnMIa+IO4ayl9QZHCksyUcdt8i2U3Q30rr
	s5n8e2AwxmJfRZfqha3t5SZ5RySHhb4dffJrjTujEz0pUcwT5z2MOehlXvXQzEqO
	wFw1II/JTTfxJNzPBeo5APDxuI16nk+coPWsjh8uo4foBmomuK45EvaXWRPm9MYW
	JFuezkOGidTl1laXbtFZPYN8a7JD82LFtA4QIE8lK0FBUWyQu7IEkE5N8ebnHPm5
	xEEkBw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7gsrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:32:46 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-43cd2d12617so4510297fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782736366; x=1783341166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sg9b45lWyYW5afGwbosga7mripr2JnazhYSqMcE1s4U=;
        b=h+5nmyt6phnVHzdPRN2NYOMgxwhbiFgymdRveO3WmY1DadcQkiSYC8B/GSBAnVrw06
         H9mGER15thKCHR/YjV1TBOn4S9LOMHPpXCe9NhbUsIk5Dy1uWVacucclXXaxo3S8GzOP
         douZpiFf1omCNNdrIVSJC1enxw+fkF1NQHmPv94AkcepIsHbtp0XLx/bTcCdfpXrfDpu
         p72KRKR4oBm+DmNqNXCcWyvyaJi2vO2IFothuXMzq/gQbsWZQDuY6dt+9DVjfhqR2++u
         Wm73Xa0Hedfipe2s20fIRSfX/O/KtLdBb8lfm8Y0vY55H73zO5luzPnk//8aEG6nWIbi
         OC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736366; x=1783341166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg9b45lWyYW5afGwbosga7mripr2JnazhYSqMcE1s4U=;
        b=k0aFtWEK7Zw2l5U08YIT5Gl7CWYk5QEZEcp0bcYfNp2cXVlXFtg/wWAifJ9dxhRAau
         /gwIdAPvi8B871gw3P34i0v6aGemk/DocKENwpdbYYHwx5GPymOznZuhFZr60Cuwa/wb
         4L174t7HJesCAe/GXtu+D+oMwUYPTnYNCMWXRSC6Xpur0EOOtVIkprB1YBrfxf/S3YLH
         mON3XqDBRhOGBiT8qjjBfxTyCOwDgSrLbb0VII5clfapOe+EVEtyWxb6zlmGoKhreqYB
         78WnxBUwFsX0AyH7+auxxlNM7HXlN8ezENKS+8wj3JlmADJ3G/J89YTFno+03lDnTKu2
         79qw==
X-Gm-Message-State: AOJu0YzAmUk5oY4uryuAJOwHpwbsAHG+F9CmSBym8DkviZ6YwqqLm86l
	i2qlCikdxL1HXvRAIkrT7O5TLmy0ByjQFQzttNte6REF/Pi0pbj38soDo/jJcLWqEBB+DeeDhL0
	lo6/eKqa6Ua6ChaZSh/w+ahzyIA8nXgD49ezL/2jGyoCUUKxQwUF3sAHq0tH0J7WW/307
X-Gm-Gg: AfdE7cnyfHW7VFSLYIS4xuy8bXf3YIZO4smcunyGvr898N97O4d1YOzOLAtPHSfX2kq
	DjMRzCt2w9XzrJnvuj2sVmDAM6Y1/JOn3pCLSC9AIqjJxwTsmPwXZIwHwgRZX2vqIMUYtM7H1WZ
	U2keco1CgUzwswxQwysEY2JY8VH/5mygDb06FJCoagV5NPgYDaRJlFPeYVHMh34HnJANusmgG59
	hBNi67Wx2klIMNlXW/io7Wtw+wzqH0OuqhJ0zLZLC6vlNBQbz8CEQBeLt+FHRR5TDpP3To7pIBk
	sTyY5qqZOhaOQrejcBFoIUR3wajQUHjOaAh/3sXB0WXWv6UgGHiObzUrf/1yjHA11pcZN4S10r8
	pnG+DwpEKMfkpoCc/Vvu2bRpkudwLHHs3YgsqyBpof0s=
X-Received: by 2002:a05:6820:2085:b0:6a1:50eb:2121 with SMTP id 006d021491bc7-6a150eb239amr7050236eaf.69.1782736366275;
        Mon, 29 Jun 2026 05:32:46 -0700 (PDT)
X-Received: by 2002:a05:6820:2085:b0:6a1:50eb:2121 with SMTP id 006d021491bc7-6a150eb239amr7050210eaf.69.1782736365902;
        Mon, 29 Jun 2026 05:32:45 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472f0e7219sm22179629fac.17.2026.06.29.05.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:32:45 -0700 (PDT)
Message-ID: <d3be45ab-0390-4d0e-8d5b-330a48c529a1@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 18:02:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
 <ba96f5e3-6b6e-40b6-b6c1-300e862e8ee4@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <ba96f5e3-6b6e-40b6-b6c1-300e862e8ee4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMyBTYWx0ZWRfX0Vdmh5Ee6lZo
 N7yGsAmrRTifmkTql7fJre3Sr0ehRJv6tRZTwg2YnIf6TaEf4yj9McF60zRIvALKxpHICx1S2+q
 5EZO/7u/IeGjZegN/e5a9WJU983QictiduXooWdpW2SfYRZzFWvw/PoiFpMaL2BMspzv/GKKdQp
 iQ4N2iHH4+VZc30LrblsGJN2jZ0/WBArI+EYQUeIg6itULsdiQRvj3qzopB2P7A37mMgybV4Znt
 LIFzhGujlCDY0jQN/JxJCcNplEO4sEKjDpzCtKXute+ayfiwyW+gunuesLLAhzIBBzWaZHh+3Wh
 Nxu2F+SbqfY+m0WLJbvl2iCqij7x+vrhyKOpQCMhVRpK7jXOAjNWM88JFhLJjYboXEldvSIxBoM
 h2YWV5yT05HxhO/9o/op3whO8j4qm7j6XVTIH9tHSfGz4Xq2o0K3jTfH7n0U+aAdNPBudymKjKt
 2ClgZgnDMfy7fXlr3OQ==
X-Proofpoint-GUID: f3WlE-hPYt6XewOMVyj7M_8QG9xwUe6M
X-Proofpoint-ORIG-GUID: f3WlE-hPYt6XewOMVyj7M_8QG9xwUe6M
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMyBTYWx0ZWRfXwIBqY3JHMkoL
 GR0WSuaXPqf2dWDIjhHD9TUDFh4BLYMZi/buoIgAiOqema+N7s/QYByJl6VPve4MAEJh1wU3+od
 autV2D9Wv5Ckuy4RDL3R4Debl7wXqGY=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a4265ee cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=s5cnJLgf_xX4dDY0o-gA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115067-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neeraj.soni@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,bootlin.com:url,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E2EE6DA660

On 29-06-2026 17:24, Konrad Dybcio wrote:
> On 6/29/26 9:35 AM, Kuldeep Singh wrote:
>> From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>
>> Add the dedicated ICE node for kodiak and reference it from the SDHC
>> controller via qcom,ice.
>>
>> Keep the ICE node disabled by default in kodiak.dtsi and enable it in
>> board DTS files where the corresponding SDHC node is enabled.
> 
> Is there a reason to disable it in the first place?
> 
> Keeping it enabled it would ensure that the core is parked
> if it was left on by the bootloader
Yes, observed an issue on kodiak Soc which supports both ufs-ice and
sdhc-ice.

CRYPTO_INLINE_ENGINE flag can be set to m via 2 configs MMC_CRYPTO and
SCSI_UFS_CRYPTO. In default defconfig, SCSI_UFS_CRYPTO is enabled
default and hence, CRYPTO_INLINE_ENGINE is enabled irrespective of
MMC_CRYPTO state.
https://elixir.bootlin.com/linux/v7.1.2/source/arch/arm64/configs/defconfig#L1325
https://elixir.bootlin.com/linux/v7.1.2/source/drivers/mmc/host/Kconfig#L614
https://elixir.bootlin.com/linux/v7.1.2/source/drivers/ufs/host/Kconfig#L62

Kodiak Soc supporting both ufs/sdhc results in initiating both ice
instances which in turn votes the clock in driver. In general, ice clock
suspend/resume sequence is later controller by ufs/sdhc controller once
the corresponding ice instance is initialised.

Since, qcs6490-rb3gen2(having only ufs storage) doesn't have emmc
storage but sdhc-ice DT node still probes the driver, later sdhci-msm
never takes ice instance(as sdhc_1 is disabled) but ice-clocks are
remained voted on.

This results in an issue and hence, trying to fix it by enabling ice
only when corresponding storage controller is enabled be it ufs or sdhc.
ufs/sdhc are default disabled and enabled per DTS, hence following same
convention with ice DT nodes too.

I am planning to update other DTs too with same change.
Suggestions are welcome!

-- 
Regards
Kuldeep


