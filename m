Return-Path: <linux-arm-msm+bounces-109221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMwdHM8mEGpQUQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:50:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C935B1771
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35DB6302A7F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74293C4B79;
	Fri, 22 May 2026 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oe69dqVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuacJqW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194BD3C2787
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443244; cv=none; b=dLGUOBgWk+3QA+z/4ldG9bV+2J6qcCugeVyY+fi9lXQbUBoKm/9axuqJ8GoZdGVM7M9JHG7lOvRlygnFzb0lZ7AHqCpT/+QZPF3Vg3zbOTBD5aL+5HaygC4ytETCajmqvq/mGR34YS3H0GGm1QPtUrg6jDZo2RkjcmPtTJ81Xe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443244; c=relaxed/simple;
	bh=zhynE7fpfbaeCJI0HZCi9xd50jHaLx72XtaP9KIszcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OsODo3SnbYMS2iRYlXQqS16s0HBn0HNZnX2Y+IzYqCmb50CuSaxpddaLKaZlfue6Eni4JnY8214MQqIxbkmr+D86/8QXrNCJUhSYi+D1owMyIj//CSNqS+API5ZOQ/Tj5kzdBx2BT1EjGOIKgJvP8T6awjPHbO3+YzazuNQoylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oe69dqVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuacJqW+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6UEuJ1298051
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLasbVuHWA6jDYVcffIJm6ecP5zXaFFkBR4wHX/Ep9I=; b=oe69dqVuPm9wpef1
	KJbK8or45bMHeDFGIaO2/+EHV5bSg8BPin9KWxe3iNSTBcfROaix82oZM62IPfQo
	5Vvq8FgB8jA65wFnus46C0yUUQkIa4E1ow6P9R4a5X1gqDZydpgGNArsufDwedtl
	53r7jJ7/b+oi8ttOGeLC/aZbLOdtMH9Ozbs015q1+ZX7epoy/htO1aKTYW/xVTyg
	WC/WwPqbiQhVygtnZbtFLhPsEZP+qm79/CMaZ8bB4r1jAnm63MdXB0SYFa0tlIQ9
	eqEcxk2rthKglyr5ve+u+GkbC/It9xArwAYLBdRF3pVmTj9g7VAZGBFUWdzuu8ik
	kQp3jA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0abwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:47:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb39de5c54so171461785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779443241; x=1780048041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLasbVuHWA6jDYVcffIJm6ecP5zXaFFkBR4wHX/Ep9I=;
        b=EuacJqW+/bSybIH4/TYayaudd7NkOQFSO9TreQV7pRSDMvcYTwyqftqBNHd6308CuD
         HoA7uXiaPU6X2Xl5QP7zKtx26BM4jfUF5aJlcwJpr2YqvdRsbiYNf/bE8WBEP1KrGYTN
         wU/TW6D0/jsMXaDNKy61sVOMaeOmZUVgNhgMwks92NedyXEirxaAHNl0jdnHJpRFphog
         MwgjWoHiAEqi/ZAYGVR1xc/1ha7NwoaMBrypRQBNttZ2KytIJrbT992cN0/pWEPkM5MH
         3+uLVBNlXi+Fd/5N0pMFjkmOyy2h4+nSGXy+eKBWI0ejHZlxbdiZPlOhvYFlTx0OtwWQ
         /MEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443241; x=1780048041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLasbVuHWA6jDYVcffIJm6ecP5zXaFFkBR4wHX/Ep9I=;
        b=T3pnsXWMK1GdyHjD+F6n1lU6HiZSr0JU1harF8rjRco02IaBigL51IgnUrB8xdcoP9
         B1IrK4OBHXVlZI5SWlEBCB1JM85GvXAvRQXE/hk7ND1OtfOJQ8rGplQ26qb/LxBYh1mc
         eUoTVYDryqukhFt9aBXPYCBYhOK+sq8JLrvs6RaHZ+ypu51Cwy6veMnRixrWAkOwiOi0
         EYoRcbAzdxm2OEOVI5kluafFidy6hpedTm0J1KrIeYIskpKSNVg2b53k0gsezbZXkmbP
         dLfCLi0Qqe16VQRqpNvLvuez96ZbzMJWa+zrHyesa9uNo9YJcBM1iD4goTDUid7zpUHY
         XuOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fscc2WYl5TuUX6zZmWKuVk55g28+ZDlxiTyyiQMeIYGmAMNkLKJe/vxRkpLnK5G7m4oiLfXv2rdBsTwNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwKV1i0YOXOAZGS8HQzYuyMMny17EMNHpVXz4pyySNxgM4LGKss
	t5rHQMXvFBzqfu0Imghn/lCRbImcA1C9Y6ugdZofy6o1BzE7m4ngyOPLevuLC85LQkuSPfLB5I2
	/RrZ7GYTCmWIJhzjXVvItuq4Op+FD+kbomZv5s1dNPAda4u2DXwpzypEmQ8LIZo41sy5I
X-Gm-Gg: Acq92OHM9ydWjR8jorsGMMH5v78NiQwF6wQTzwVdI59jQXNewg6ukQvfKnNn3tMyeK6
	u9vcmjQpZ8qenTWDn0pyGIb7mcwhXLyRQz9DlHb4BiyLQPGMRFWrohETjawge/onsN/VB4Jvbvo
	Z4iXzNwnx9Q6zDgFfG+tTHCbwZQxpWHLgyvISKJsZLcoin0PRKpDc2MQQFdw3IkJfB1JSn0S6br
	jur4WVdniydOpn3AyI30sEr3lO/R5OHoCM7SP2BhkE/GUQ9bdxefAgwr2Z4UxUFCY6CQD+yc76y
	q2KT0C/dtMsnH8H9b5fD7/m/PKqjPBGFM85oh086nTlivrAYSvSkhBTd06eqXACR53aBtGPBwDI
	4iRUElop/b8JSbpXlo9Qi1u8NrZbAQzg/UX24i1d8TaizGp3Z1aT8QXAw
X-Received: by 2002:a05:620a:4711:b0:911:1263:fb35 with SMTP id af79cd13be357-914b4a3f840mr285196285a.7.1779443241330;
        Fri, 22 May 2026 02:47:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4711:b0:911:1263:fb35 with SMTP id af79cd13be357-914b4a3f840mr285194185a.7.1779443240934;
        Fri, 22 May 2026 02:47:20 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm465344a12.30.2026.05.22.02.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:47:19 -0700 (PDT)
Message-ID: <20d202af-7a63-410b-bbfc-cb695d0f7f46@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:47:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add QCA2066
 M.2 WiFi/BT support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
 <20260520-monza-wireless-v1-3-9f6942310653@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-monza-wireless-v1-3-9f6942310653@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NyBTYWx0ZWRfXwtx/vQ1G8acE
 4v9vR/mGIsf5N/LE+48flvWcVa/NhqO9LmuLdZkzrRjFYwFhXIljFjO3KvN2VGKB6bxobK24cNi
 ycwGNeUsuSdgH3djsSZl7UwNHmHECYcS+2VqXI3B6XeRaDGLDqU5+EP0uWFVPT/0tWBbVVBsS0Y
 YhQIJ5Jd3oaNR2ujHoGhRRXEhoGACmmU9ZNVzNWNaBSmo2kO9XZ4htcJqWNdwGtQhBoomcrg8gg
 vYfc9Zp3XjK24SfYnEbhm5mr2yWAMR05VBVtgyDrQzye+avV8/DaFieMnkXrWXi+COhuMf1ZY0g
 BoXbEjJamBW6j8o2c6VWiE2HyTZhteT5vBY3+yQF0O+GTYpnbO6GcLYXpv8wviNDjGOlefSKT73
 LGnju5HuBxl8hZ2IjFiKXfq44JdBxltV7d30KEfBnoikC1qqavIxAT7oLlwLXIYyLo1xptloXy3
 Y2AGeFIcDoX51tMTfxg==
X-Proofpoint-GUID: fbpuWK1u7_RcynMhvoNq_WlMSCpbE4Sf
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a10262a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: fbpuWK1u7_RcynMhvoNq_WlMSCpbE4Sf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109221-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34C935B1771
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 1:01 PM, Loic Poulain wrote:
> Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
> Arduino VENTUNO Q board. The module is interfaced via LGA and is
> compatible with the M.2 Key E.
> 
> Add wireless-lga-connector node using pcie-m2-e-connector binding,
> connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
> the Bluetooth interface.
> 
> Add pcie@1,0 downstream port node with pciclass,0604 compatible so
> the pci-pwrctrl driver can acquire the power sequencer and enable
> the M.2 slot before PCIe enumeration.
> 
> Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
> (gpio56/gpio55) used by the power sequencer.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

