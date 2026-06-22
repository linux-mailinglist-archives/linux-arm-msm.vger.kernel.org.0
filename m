Return-Path: <linux-arm-msm+bounces-113946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QNKBDUPxOGqOkQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:24:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5236ADAD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:24:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EyVAvCok;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FJbKFu6P;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113946-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113946-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 537E6304AE47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF8038F24D;
	Mon, 22 Jun 2026 08:18:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E15A2222CC
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:18:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116339; cv=none; b=PPz2D6FrbBfY6wEnHl9Wy8CjfU/ovi6nGXTJqwO58ph183RiYcTbf+Wc6K1fP/4lOKvjY9NHgIAZwCYprm4WJ3M9gmhWwCZgJIgDA1e01hgd4sa7xXOtpeTycnfNco/PlcuwkX7usTi+vV6g4R82t2xORIQP8XoD/r9yOZEjXZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116339; c=relaxed/simple;
	bh=gzbW8KMMFoevV9vlfAg1QRwV0zyCbuKY8qtxOknWfbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKOhSEBb7y/EZI572A2PGxVWy1qppGSSsKE9Oz8LjTqmjHt4P17kU/4yPOZtenXZdBQ+FhmBGeDz5RrwvZhCps2N7kLzAU8lQTlTSbALMsfQRKBxo3dym0IOpXtFT3TAsBPXxrRyQCbYSSxoDN6OUIbtDOHtd8TguK08WGVIpO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EyVAvCok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJbKFu6P; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BjPU4183711
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nv8Snsf8/UAmOmTkcOfAhaOs
	FAB/+15iHJCAk2BLzs8=; b=EyVAvCokXtCNoJcAUzl35tCUzCO5cNkWatqeH71Z
	mZvlJXeWXNbr4eRlTpiPH+gf4kMntkYH0gDAQESfeJnAklGwcpbaHQoWwbEBGZ48
	5zG0AevSl/VfXdJ4ckZcA06oWIpMtKKgDN6jkh7oznq/FyxPY093CNQKJFlTg1wO
	3FE0VDtcKmi8GZOXflMEmk1fnTxupottPS2ZttPNvsJFmSGx8+LDKN9Llif8C6py
	6LvYVCB7/3cvIwe2e2djCr3+cp3Ee4zxd4zzUT8ebcanOzKXY2eoBsMVduyEWFS1
	r55Fglmd6iFKJ76ecKx4pGK4aohsJMQlfX1p+sJaZ3KvKw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h5kt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:18:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9159c4b210aso797198085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782116336; x=1782721136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nv8Snsf8/UAmOmTkcOfAhaOsFAB/+15iHJCAk2BLzs8=;
        b=FJbKFu6P24WL998Q7CyGtB2UE1Ci9Cie1QBf6+XaibAHqbx5+voXc9duClZ517zId1
         KVOX2r+dvBtkaeGqd2x3GsOsbMCEWy6hc9sILl7og4KemNv3jv7ScgzGTyIKTYzLLVGM
         z7r7cvCKXsr08fdzbjcL1tNw6aPDcA5Fj3UaJAWiUZxZrdFpOth2gK8bxwS6ckGFImhe
         ndL44FcOcjz0xVPOlscNUump+mWhzotVH31ZwVa3T9X3MCOZB3RB0C+DIUjFL3C8Z4OY
         Pn3+HnvVJ3RiELHqQnMkJGWlrIomooxLzYAM51aufILFi+7A+ZTOuQUA5oPko8kvnrSW
         tftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782116336; x=1782721136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nv8Snsf8/UAmOmTkcOfAhaOsFAB/+15iHJCAk2BLzs8=;
        b=V5s1O1vslcAgajMgedQ9Pp0BfW3GsUji0qVwCYJRLBx6Bu3n3K/PXo/rxme+9D3GxU
         /HPsG/KKnBInPgxUr6uy8uhE/WNfeve6mCNn+jApwTSFEuTVAKHoLXdtMfP5D4r9mTqJ
         WfRv8rxaUYb+4vX3I/fsO8piURrQEbbxxOHDMe0xNlI45JmhFm7T7cYPEOXtoDTkXmqS
         +5421ix3du+neJhrNLPKtBCgrOEJe073RtOs0tEmgaDXbzT1Noyh4eiM510DUyC8+z8k
         +1tRJMz088ALACDw9Kv9HO/6Q+vVGTSVf3yddzKvX1H7HIIDNNy1eqlq6LHWQvviDyRn
         sS4w==
X-Forwarded-Encrypted: i=1; AFNElJ8o8zwml+b8AtNjp+p40gH2h/ZVQZq7Ee+wQd0XNbyr3E91oJUS2pF6ZbpDhdVfPiu4cH66/Z6LGtsAlSel@vger.kernel.org
X-Gm-Message-State: AOJu0YyW579Om9SMBTGpO0rDXLjaenhyaHTYaI0t0htruaibsGzeDcec
	T5BA2jKgRcwJYWTM6eXVC+jyy4oF6XC3zNtAxS47S1nnbSsbcfr9bdnbmQT1AVgsIMCAUdDlzGK
	alZe+B/efRMFWXoehyW55skj4PfoH7R1EHbUlj+lUXorblBWHvWWg3YlNLVKzZdSFr1Qa
X-Gm-Gg: AfdE7ckjIx/zhZBwIIser44DviJVldlZpNAUz3Sau4LElRl2C548YDyh2h1pjwBmbWF
	9dyVgDRaUk6BwsfJ44Ak1s/oKfd8uZlHSYhRSIjHYC3L/IHeJhPEOA/cAAQpu2yNaJcKJ/3bn8/
	OemIXLoWUE+R+UO3pafMLEq8EjeF2GkQkpkMi+ea5GV01ppcsw6z3P6+jarHvouZOJTpB0jW8Ud
	cx4w79YvUtCpwUKx3Pjd8MRRrXgWqHe/v/ssvLfweHJ9H2JtDPka1iNgcD/Akb+5ve2PrQ4PR7H
	bBRXPMsc7pLnNHeQhLxGOhGOH6iaZMdAbKwoC5pvH+UbwoS3MFJ6GIW5DJiMd02MyXAiJ2vLY78
	m4ZKGpwlbbXCjKfxbe1feZw==
X-Received: by 2002:a05:620a:468a:b0:911:e11e:dc0d with SMTP id af79cd13be357-9208c71d126mr1714216985a.24.1782116336249;
        Mon, 22 Jun 2026 01:18:56 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:911:e11e:dc0d with SMTP id af79cd13be357-9208c71d126mr1714212785a.24.1782116335426;
        Mon, 22 Jun 2026 01:18:55 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7ba08sm277432825e9.11.2026.06.22.01.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:18:54 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:18:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Message-ID: <erlfxo4gcvuaakuggrgroniiwofdrocgtje32idibknj7kb42g@pdh7fo4x6ief>
References: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
 <20260620-glymur-send-v1-2-fc4a2cfd107c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260620-glymur-send-v1-2-fc4a2cfd107c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA4MSBTYWx0ZWRfX7ngeB5vTZV63
 WnWx+nIIAhPD4jzRH/+Z46LnsaVW7oiIFLoiNOBIlZ9HpH5uY8SwOYgfHHNLGSRC2+gHOBfFt3u
 aWxE6F49fTpyDW0hC8Zuq6j5Ahpac8x8/cpvCvCw4HZzXBMWp8YJcykxn45iRO3YsWVpXxAu3UR
 C0ETG984r7MnMeJPjUt2L6+Kt/DS2eyfH/u6Y/Y9C9lS+rl3w1hptAHqefBANBcsb9XhKUS5ugy
 KjVunscoZg71hswXHASGMqDZajvo+sfTLhna8AtlVS4YJYfhWqvoSnMirpDg4VlhyfkPHYQGNOf
 FgXYpfwBZEroYsV+HHz1FDmX/B0vU4+P2f24Cipvvf+Y1NQixgeYZJLlVhNvvOccaY2OrkSFinC
 vKVPaBMLJ+UsKccm8EzP/GPsHh/X6zwZuhQ5oFry103hiPt5opOmzYbErXGSu3etIHafGrOnPmS
 XH0PZ8yDKeVVk3wfneQ==
X-Proofpoint-ORIG-GUID: fhdNCH8z-9Ot-uqCBjyuA9WaRwLOaT_s
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a38eff1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TaceBGDFNAfD8QJXew4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA4MSBTYWx0ZWRfXzPkJ/naMakMz
 d24aOhqGSd/qa6c312u4+iI0zCKHC+jhv0K9tqj4zZebF5uXMueyY5HsSJFEn4VkWa+ANmDnk0h
 BctuD03wfQbyEz1FI8UkQrRT2IJC7H4=
X-Proofpoint-GUID: fhdNCH8z-9Ot-uqCBjyuA9WaRwLOaT_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113946-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:jason.pettit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B5236ADAD6

On 26-06-20 21:50:42, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> 
>   - internal eDP panel (samsung,atna33xc20)
>   - 2x USB Type-C with DisplayPort alt-mode and USB
>   - chassis HDMI output
>   - chassis USB-A host port (usb_mp multiport controller)
>   - internal eUSB2 host with the Elan fingerprint reader
>   - NVMe SSD on PCIe5
>   - Wi-Fi and Bluetooth
>   - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>   - Adreno GPU and GMU (Freedreno GL on Mesa)
>   - audio playback and capture
> 
> The HDMI jack is driven by a power-only DisplayPort-to-HDMI LSPCON on
> the usb_2 combo-PHY DP lanes rather than being a third USB-C port; HPD
> is on gpio126. The LSPCON is on an I/O sub-board with no I2C/AUX control
> path, so it is modelled with the generic simple-bridge "parade,ps185hdm"
> compatible used by the in-tree x1e80100 HDMI-bridge boards (the exact
> bridge part is unconfirmed) and it needs CONFIG_DRM_SIMPLE_BRIDGE.
> 
> The &gpu/&gmu enable, the audio nodes and &remoteproc_soccp opt into
> glymur.dtsi SoC nodes that are still in-flight; those series are
> declared as prerequisites in the cover letter.
> 
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-4-8
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 977 +++++++++++++++++++++
>  2 files changed, 978 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f33c4e2f09c..b10629808b76 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  
>  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> new file mode 100644
> index 000000000000..795940a99946
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> @@ -0,0 +1,977 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "glymur.dtsi"
> +
> +#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
> +#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
> +#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
> +#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
> +#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +

[...]

> +
> +&usb_0 {
> +	status = "okay";
> +};
> +
> +&usb_0_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_0_hsphy {
> +	vdd-supply = <&vreg_l3f_e0_0p91>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;

No redriver ?

> +
> +	status = "okay";
> +};
> +
> +&usb_0_qmpphy {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l3f_e0_0p91>;
> +	refgen-supply = <&vreg_l2f_e0_0p94>;
> +
> +	status = "okay";
> +};
> +
> +&usb_0_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in>;
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in1>;
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l3f_e0_0p91>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;

No redriver ?

> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l1h_e0_0p94>;
> +	refgen-supply = <&vreg_l2f_e0_0p94>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in1>;
> +};
> +
> +/*
> + * usb_2 is not exposed as a connector; its combo-PHY's DP lanes drive the
> + * chassis HDMI bridge (see hdmi-bridge).
> + */
> +&usb_2 {
> +	maximum-speed = "high-speed";
> +
> +	phys = <&usb_2_hsphy>;
> +	phy-names = "usb2-phy";
> +
> +	status = "okay";
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l3f_e0_0p91>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2_qmpphy {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l3f_e0_0p91>;
> +	refgen-supply = <&vreg_l2f_e0_0p94>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			usb_2_qmpphy_out_dp: endpoint@0 {
> +				reg = <0>;
> +
> +				data-lanes = <3 2 1 0>;
> +				remote-endpoint = <&hdmi_bridge_in>;
> +			};
> +		};
> +	};
> +};
> +
> +/* Internal USB2 host for the Elan fingerprint reader (usb 04f3:0ca8). */
> +&usb_hs {
> +	status = "okay";
> +};
> +
> +&usb_hs_phy {
> +	vdd-supply = <&vreg_l2h_e0_0p88>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +

No redriver ?

> +	status = "okay";
> +};
> +
> +/*
> + * Multiport USB host: port 0 is the chassis USB-A port; port 1 is an
> + * internal USB HID device.
> + */
> +&usb_mp {
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy0 {
> +	vdd-supply = <&vreg_l2h_e0_0p88>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy1 {
> +	vdd-supply = <&vreg_l2h_e0_0p88>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy0 {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l2h_e0_0p88>;
> +	refgen-supply = <&vreg_l4f_e1_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy1 {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l2h_e0_0p88>;
> +	refgen-supply = <&vreg_l4f_e1_1p2>;
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.50.1
> 

