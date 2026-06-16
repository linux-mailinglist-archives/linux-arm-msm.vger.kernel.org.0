Return-Path: <linux-arm-msm+bounces-113397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id exZjFDU8MWqRegUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:06:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB51568F168
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:06:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BsscBhV7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=afAuqzi8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113397-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113397-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABAA130702F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A400943D4ED;
	Tue, 16 Jun 2026 11:58:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140A843D4FB
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:58:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611099; cv=none; b=BQjUFP/99qdSVJc/fgAQ21UcvUrsLL4zFCXRlPvbpscjhTF1WIAb2yv5yPM4vrKBEqx8He41mJBAfwMbbUAT4zczesZ3YbseBJf2ZSiWSU3OCCqxluY4MMDAlmHeYGdsGTWQWzCdbxduElE6sVxkKuYP7Wh6aX443VfyhXtobqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611099; c=relaxed/simple;
	bh=Yr8lXVIAWkXgrBDr2OgS4iUFMLjDYwsygBnWvJVr03c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFb4sZXedYBdMNu67iO3l/deIbfHvtD2HBixBQ4JSplK8QQf8XHrTvhk/i7ZQ647OvPwckWk/3QpbOjA4sqO3uetLUk0FCInPW6ndTKuKJ5KgcnHkNpNMI6GxY0Ykxhu8KiENgl93p38kK4pcmVIbAEz3jG2wJVC6t1bgCKl7Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BsscBhV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=afAuqzi8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9Sve2846268
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6cYPSFoG/0e4M1JnmPrRoWDSlgvk/AWVR1/ScU4SAY=; b=BsscBhV7QwZc1V6C
	biXaOgq/iUL5gzyyiVMI8VWox3n+1L+X+FscBoa6QxScpl/DnDXlhNJv5BbNgam0
	wuRrPnxKm/ws8gUfGcCBU/PcuF0qJKjmnz05A3z2S4NstV71ZAehxKTpRltH814U
	CKAts9oN6CZjx1ydDyAjtGk2rAYOXsCKwvdD+MJmlciaUcoerdQsnIMu/8gApqq1
	Q7IW59U6xhGJ/+FTZ65fQsGWRNKkrDQ4qTrvvH00flnSWY5XxU+Ev6kduh9vAC8x
	eOv/MdIuaUyeAxT0fqherhdilY9eacjqT1BalLHQ4GV3RxF0WOuzflteyo+pZJxl
	H0mEyQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8ka6mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:58:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915ccc2d4d2so99264085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781611095; x=1782215895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d6cYPSFoG/0e4M1JnmPrRoWDSlgvk/AWVR1/ScU4SAY=;
        b=afAuqzi87XlYhJdN+hTKYkoY8QeWTbHZ3sxVCKbD7+Z8aaNp3SU4rAw7V0WDlpGOIV
         r6+NrCoGK/djQe249V69aKT9F8xZC3xCHkwEP0ELk3PspRYcF1nLarQkdrVMzO7Gx4J7
         FJi7s+WfnQwQyPpB9e4IwOSsRDC+wNc9+d5tX3xT3GtWZljFfV9afEx91dWP7ZXZbbbH
         d8PnBFrR86Q+5cuZHG7UokhLlKtLVmff1Enu6A0WScdVNaiA0sOgpzl7NpWHM74jENzM
         iLmH9tHiGTMZ+DrzXqBvwk4wx9cIF6MyylA0ITfKVaJPY7YBQZxDBzoMKZEHjoh33kM7
         Mwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611095; x=1782215895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6cYPSFoG/0e4M1JnmPrRoWDSlgvk/AWVR1/ScU4SAY=;
        b=Mc0W9RlWT7Hr3gHABqSMqK8zSP9i5F9I6PFyrE7ivZoVsnf/XchA9RjOEfRZp1uP0F
         C3mMP8kfYDBeiKHsCrEHWQwXMOsIjWny4LvbyIxWeEGqSzqriS5i2ajUh7DXUdx3KitN
         m0mTfGvl8VHXYgCjSxuPe3qHOZrZdVuxG6dOWhidGilxt2FoHcaZjIaY/1pU6swFwgHQ
         oopIUKmkUFPpvLOpFwwXi4Dwh/U0vrYmNbRiCQjcRsMpAsMwX7njrmAwqtkZ2WvwDAJt
         vQOe0GHCQD+N2ACwkaEqzQAZCXAn9hMXmlIFrGeu2wG0Vnn/tsRGW+Mmre+wmW1FxCZ1
         3EDA==
X-Forwarded-Encrypted: i=1; AFNElJ8MIw41x1kxSknuqkmCJUtxoeAwAfNEgSP6PooHoyM+FQuJq9TDx17cJWHgB9rzEoacWYzjrAaAT6EWzMnY@vger.kernel.org
X-Gm-Message-State: AOJu0YxWHtrvmjNAcjxbC2rt7htSbCSlCKg3D++vgr4a19iKd14VgrLs
	qn8EW1Kx8+fe5uFW2zbR04uWmf6+DAwM9YsbBtF3h2OKJas3Ln3vnQilmOBuksstHRVaKnxixhO
	hDihgt742R/V2C+lw1NeM5nwbjKeUN+hEa0GjA5PgzVJrpr4sfHlSbHPm/h0HEXKU5Mt6
X-Gm-Gg: Acq92OH2s5Qcfqp0P7oeZFV8x7mysZZYIeanAmWJQ1xZXX39uZew5qh8qxkeuYEAUOm
	6FMv9mDnoM7Vc7bULOtQ4rggfmiCbNlgYpbA5a3z+knBNm2gU6bDyHCYm0XVwLXPQc2yuLmkzXU
	MSRMQ5fPCPwuaQ8pMPq0+syKVs9znH5LEQ6+ji9Gs9Cjqa2WcQjS7y8ooeUhsSS8Rvbv+UlDdw2
	h21+V0/7rRKN7JMufh6zF+CMspov9ZIBQrvou+z6Qhru7kh8JmJl5OtFvZ9Khv9nKFj2DZKMct1
	XmeHss9ktgY9hEZCl/fWRYno1xlq12YKpKOSw2JteoqFG4wtLggYlGLs9DkPOQjda/QLrU/c0Of
	tVTzpY1/uA/lxh8b+0Nh+YPoE4ayvfO0PJ8KRQs3oWh2cLQ==
X-Received: by 2002:a05:620a:1a20:b0:915:f92e:9b with SMTP id af79cd13be357-9161ba94c2dmr1711723285a.1.1781611095358;
        Tue, 16 Jun 2026 04:58:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:915:f92e:9b with SMTP id af79cd13be357-9161ba94c2dmr1711719685a.1.1781611094894;
        Tue, 16 Jun 2026 04:58:14 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb83420e9sm615905566b.45.2026.06.16.04.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:58:13 -0700 (PDT)
Message-ID: <ea116849-718c-487d-ae9d-50e839e44c6d@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:58:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, rosh@debian.org
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
 <20260607-rubikpi-next-20260605-v1-5-7f334e16fea6@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607-rubikpi-next-20260605-v1-5-7f334e16fea6@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfX8gJgBLPJjWUZ
 GLD3ouWR9FPSneRBJrgeER4+jFliuEmJuyRvO/cKPDjpPqohpLNLW31SNdvBaUTdSaWoXrDTM//
 OShfQwILQza6yi7hdwkSTPoqZcr3lmPJdmMqEjbMyt1875H6640J0WjTNx1U2HanVeFcmwOXXb/
 fQZPhD7EcDAOpFdsRQ6as0EkKLXBcgjTPGIKHuXPjaOi/YRRUxuYTzui3dWu+4WGyp0mRE4KAvO
 kCVHK+9qB76AUXTS6DpVTGpzQ5kC3HLpop0qGIQlJcm5Ta+7auPNt4dd3H48SC5GEhBohpN9AnX
 DiF8W+opgl/VtSySnRlgtkjH/y7bNeSj86WtlgcpFHFADrfrtwc4E2s9bO51o9zAgXVwQml8htX
 Ibm5Uw7vNv7MBC6wBajJxhiLiQsf4WT6ZcAhVKX+EbetNPfB+PUm3RDHeLkIFgxBd27/YacJ3eu
 OaH7ToayI3QkdMIQpPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfX+xsZB6SKH7oZ
 iEECi9X2FYMgDnfpCcVF/pGpfgil4w8QwtaAknmKxzgVZXMHgAaaNEmT1rZCgZnvIFBBm5uwQ6A
 OXtEL4b+c8+6+UqqqF1+GBiKfvKHf4k=
X-Proofpoint-ORIG-GUID: 8rtoP1LxN1BDm3ZrWj9hsBMBGO6KD8CK
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a313a58 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Wdb1h0LgAAAA:8 a=BqodYhQyOslAVxcsot0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-GUID: 8rtoP1LxN1BDm3ZrWj9hsBMBGO6KD8CK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113397-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[thundersoft.com,gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:drake@endlessm.com,m:katsuhiro@katsuster.net,m:matteomartelli3@gmail.com,m:zhoubinbin@loongson.cn,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:rosh@debian.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,thundersoft.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB51568F168

On 6/6/26 8:58 PM, Hongyang Zhao wrote:
> Add audio support for the Thundercomm RubikPi3 board.
> 
> Enable AudioReach and describe the ES8316 headset codec, the LT9611
> HDMI codec endpoint and the SPDIF TX/RX endpoints exposed on the
> 40-pin header. Add the sound card DAI links, LPASS pin configuration
> and ES8316 fixed 3.3V supply.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

[...]

> +&q6apmbedai {
> +	pinctrl-0 = <&mi2s0_data0>, <&mi2s0_data1>, <&mi2s0_mclk>,
> +		    <&mi2s0_sclk>, <&mi2s0_ws>,
> +		    <&lpass_qua_mi2s_sclk>, <&lpass_qua_mi2s_ws>, <&lpass_qua_mi2s_data>,
> +		    <&lpass_lpi_i2s1_clk>, <&lpass_lpi_i2s1_ws>,
> +		    <&lpass_lpi_i2s1_data0>, <&lpass_lpi_i2s1_data1>;
> +	pinctrl-names = "default";
> +};

I'm slightly confused as to why you bound it to the DAI node, others
seem to couple these pins with the soundcard itself

> +
>  &qupv3_id_0 {
>  	firmware-name = "qcom/qcm6490/qupv3fw.elf";
>  
> @@ -1006,6 +1061,96 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&sound {
> +	compatible = "thundercomm,qcs6490-rubikpi3-sndcard";
> +	model = "QCS6490-Thundercomm-RubikPi3";
> +
> +	audio-routing =
> +		"Headphone Jack", "HPOL",
> +		"Headphone Jack", "HPOR",
> +		"MIC2", "Mic Jack";

Let's keep the first entry right after the equals sign and align the
other ones on doublequotes

Konrad

