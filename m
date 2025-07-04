Return-Path: <linux-arm-msm+bounces-63694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7114CAF91E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 13:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 731C916E684
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A2A2D23A4;
	Fri,  4 Jul 2025 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TefrVS3q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378622C3265
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630001; cv=none; b=TcwNAoPUu5w+pfDOhEoxXbnVdpn8mE2+CwBHVYexFotl5W9DOrymBq5aF2MWVd3zpGkhUVdnB4q1HCKjpYWP83VWT4qmPrU+Fttm1No9jjjqIxDLAKKC/TSVl+tQzSVEK4opSjMVwnQ+ht444pwcCfV7mBZ5mju2RVQ4oGtJkzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630001; c=relaxed/simple;
	bh=MKwHGKOn7w0r1Lf5ecuBq9Tsh0Nc6l+P14YUHUHUuUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1WQje4E1OaWsK4yUen7LyaX6snBpS1tWpenTRAfR+huxvQFmrGcmJaZMFYjtRi6YdTfmBSgAON6o8p7JVvzvw6V2E3CGu7BfJwKoYJFLdyjQsk/lg4I8fWELXqp5009BEtrvLmkrDeadEG6a2IS806qbnC1y2yKGfEgKrhOxOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TefrVS3q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647gk8H005469
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 11:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwHQZhuMFY2xGJQ2mbeCbIoXx+TFpyI6+fnNo2wASLk=; b=TefrVS3qNMZjmGf1
	+igIX0RHUwi8Dg9Ttc83GCuTMBQ4WlzeRsB+Dy5v5eLUIO0EKeamAg6QQsB0vmfN
	IU1qBSN5bYIkGnOgHzBooRvGyK0js5LINnBGeJ9gqk8bEWphG0LiC2KP/Z3VEeU7
	kkKevQffExNE63V8u4WkStfgazMzhh/9N0LeY+vXPuwzaIgGqn18JKhoamsrl3Zw
	SfDwmz8J5frsX+4dMio2rl/viBV4AdtRAbx8c+odapzivuqu03Ogm+NwNvBJwvE6
	4x5XuQ+j9sJgGArbsTrGemE6fkMarsxzQacB9gjrMI2rZJ3VBLSMk2W9PBnTrfZ1
	URTlkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmknps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 11:53:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3eeb07a05so13620185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 04:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751629998; x=1752234798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwHQZhuMFY2xGJQ2mbeCbIoXx+TFpyI6+fnNo2wASLk=;
        b=UIx/6ifnEMetRpmJFNYalNcUfM60iDTaJ8dhKQUuXSg7bf20WA2OomOr28tRj0+bMG
         scVCV0Pij/D0HPWvGITLcvENOXzFSfFn8+apdZ8ROhh+Xzv2W+G7XpyrtQ16NaqAFgVt
         KiHxwi0Qq/MNvZ0P0Osg+5rI9QQBqG780Uabm1LmC+cIPIgxSeLM5I7FCmxDHoNadbFd
         4Ke5Qx31FWasNDTgIbJ6gvmGo7mUhdd3e2eOge2/92rd0GHBxg8vZiOdNKkPtkiQN0Bm
         yNwdiyAfaQWgIv4YUXji3OdvN9k2JniLFvom791iZwDCCjw0VYHHf1tVb+klTaWmyIuC
         Prsw==
X-Forwarded-Encrypted: i=1; AJvYcCUD3Gh9xPD4kPMo0JqF6wwpNZQhTf4BaDZlTVtN5viHTx6meOTGKeNpx9Uo4v+opUvzmaPkIJAAdG7EyEIO@vger.kernel.org
X-Gm-Message-State: AOJu0YzVuzRd3NvNIpXYjGTdlE+JyzUBFx+b+n2Tb0GwT8gVsw4VEyj1
	H3j+L7SYOTVYBgFQn0v5OT7bmOPQSZWMTe67Xtei9LxU4DY5B2Y50r2ErATjN3zI0+8k2a8PNlg
	kAAueHRtwgmJ+OcRSeVCbo8tYhuDO4tYDRfP89gSoOuBQhWdAavgWn3p/nz4NiD1x/gVu
X-Gm-Gg: ASbGncupd+Euqqx8CYEFxuExiutOcmBikUO2kduhTRZGOo8/rxb6MQMwjvxsLXVl3A9
	NuEJ4zKKIEDKXufXeKeiMf/8S5AIMY1Pc150zuu+3AyH5ibA05p5mlRBF9izJry0UF0x79k0IG2
	4Yepqz9vTsfjnFErraGwJJam+Rt2bqjvjg3tYmYRNW2+bxobWXd1lts2KbZtSsn9omtTNJPw5+m
	5NPFSSkmePBWYDneEuZjzzhEmhVZNo2TAOms2upJdc5A6ThQSWNf0rfbsccBrtUorzOkwelk9QF
	Y7qOz48SvVcSRtwTMJyrM/4f9t248bydDUW9Cf2UwDh0DJ1R5griwB+qaboSdWBeRlcP1z1+OsI
	cgzNQdQ==
X-Received: by 2002:a05:620a:170a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d5dcd42af1mr119898585a.12.1751629997924;
        Fri, 04 Jul 2025 04:53:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPlgLXzQaVRDV5W/CN6Yajx9iz9BViPuW1BhPcQXauAwU9MM5dRRtATbVw3ZexdZDIvcZlHA==
X-Received: by 2002:a05:620a:170a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d5dcd42af1mr119897885a.12.1751629997529;
        Fri, 04 Jul 2025 04:53:17 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d931csm164525466b.10.2025.07.04.04.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:53:17 -0700 (PDT)
Message-ID: <c0908ffc-f973-4fe6-9264-cd038b0e5fb5@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:53:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] clk: qcom: Add Display Clock controller (DISPCC)
 driver for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-7-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-7-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6867c0ae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=ygkTYHpWjZnbTFMe8PQA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: fj7K0UCAl6hMJUN9voYNHjzH6QvYa--s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfX1jrRP+/7DGjN
 1ub1FbIoCmg3tLxUL/CkWlJIyHx7Mxw5HaPIDouBXnaW1E/gNxiuXWYADpbh9kRNFOg90IpRoaJ
 VpLZxU4/ZYioB0cd7+N+8ycUSWiZ9WLPz9G3SPIiBnYzOSydXqZkfs7Iiiln/1m8x2PJc6uyK38
 /MTvBt089s09VVO1+8EYzWjFvUyiI2BostBQWaKq/FfTcBe0/FvcHS6/5OmI+Dvpe1Z+Vem/kzo
 GSy0YgcXc6H37ElL0WxhN0aooYxM9ZSjPwm8AWIzdbALtt78hd7KXBibi04tdMygJ+3uw3GitWM
 pmR/OcCOGI4zoItiKMOgvCyRgkm8LRO9gEKyKPtMVlCFuE93OzJ/FZkmOLJQj9A90RDkUbRath+
 iC3iGC0qqWZfWdSKlawG/9+WhN4bH6NHNaYYXW8DfNQdDjJhrLjcbbH34E5hm9zeyYSiTF/M
X-Proofpoint-GUID: fj7K0UCAl6hMJUN9voYNHjzH6QvYa--s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=959
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040090



On 04-Jul-25 09:16, Luca Weiss wrote:
> Add support for the display clock controller found on Milos (e.g.
> SM7635) based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

