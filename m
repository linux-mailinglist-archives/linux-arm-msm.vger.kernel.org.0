Return-Path: <linux-arm-msm+bounces-114523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 16lKHEYbPWpwxAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:12:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D742B6C571E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:12:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ftHyWL46;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AnQ+31Sk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114523-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114523-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7891030409ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52ED3DE452;
	Thu, 25 Jun 2026 12:10:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9816E3DDDDA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:10:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389406; cv=none; b=i8G4PPsb6HPG9U112wgfVCMNDYCHLAejRQOGt1eXk6As0xrTuqiYZXEFXGkXl6kMPo8TdqPGQy9IsE103Mbf4W+dCvZfkgnK0xpWo5z9IsOYW/hzli366Afuh74wDDSJKk/UKBvmoxd8za+Y8sby7fu4ycUz8Bxfge1EG0OG8ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389406; c=relaxed/simple;
	bh=qVSccV+PPFn2ycSFxupGD0ezxiHk4cFL6ejjLet9SOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGH8ZkY2nGV5LG9u+jhBKFOk8gYyXWaNagfhjXrACvAS6rOmvjJhnkJHeg6O2o3nsGM+SbyQqtx03ULfLncsNBNNUw7NTGxh7mDcE0lAaqO6gU50RT9YEYUJsf2bQ7M6bgsjP/WWiDBbDGouTyAY0bgx4OSSCRfq0yGG3wkg6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftHyWL46; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnQ+31Sk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9juMC1470515
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YbxBIHP4GTyNhgGImgrH2ee9ixVAN6uNrqw5mAZsIR4=; b=ftHyWL46+UvCxbEq
	ODj5vQoIGKmTwGswKZQw7HYJHMFGnmI29QoAaaNMNByr7ovED9q8U8gvH/8KKDvK
	rlD+0A5t6TpaXTKvp08VgwtY37MsrbGcpvm/0ehsd47pGv20RP8sNpGzltO6Na1q
	oxFtRmEp6MC2LRl9NWVw0aBd1CXzR+8qcPMWQ3VBqxJklXAOCbPxlvK0PUBnYWvU
	e004Ej7AwMZrj3Kd898PV73Gh6l8gMKVLuIdbLX0gGqRVDqSWmpIEooQZjIPTzyO
	Y4BMb8MmNQxxKT4OVV8W9/BsXt98ggICZL0zxuQ41u8ZRBZO1CBH4QbrauYsLPXP
	jX4jRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7k74r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:10:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517647fbff1so4555751cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782389404; x=1782994204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbxBIHP4GTyNhgGImgrH2ee9ixVAN6uNrqw5mAZsIR4=;
        b=AnQ+31SkMPyHiymIvFs+8Hk2dGYGGTf767RQJRBmKddiNvEC62j3XN+68zsor8tRx1
         prGNatf863q/dC4af5FNlvCWFS1LOHBW6Xd2QU/xBX2L7sKFSJW1hfUlecbiSLsHdkXi
         X6TuecZk/CWnoMjUSysaitrK1idvPM6ZIIHzECKYXNSlVgPn9qIRxNoTFS/0viOLnYgC
         lui6lRoaw2ZXnt23oiNZ9l1HaNpAOF4kS1PeuGQHO9T+9HcGPYSZa92glebPKrUzIOUd
         Wjwg96LGw+UW53qhHZZZPbWUy2T+AWVUaBx3brN9PW3VKR4PzcSBssCl+yFbNXrh+5kp
         /74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389404; x=1782994204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbxBIHP4GTyNhgGImgrH2ee9ixVAN6uNrqw5mAZsIR4=;
        b=bZ6z/sG72evGhWnB7iA8gdyMnvrV+Aul6WOElZPBWO1Sh0X6I0SPRD47c5pZ4W7TfB
         H6TzY1jLj8lmnDcDDysalwtH1HjTTqX9XyDLw2hEWC1kKNScRia2lwCYDrccR1zvDW2g
         hD83CWv8Wk8rLsRDUwuzAtN/JyivbvEvNnBZo8qq3USKbQMCggiXIqgx/eeV0tuSht3E
         BiclIPe1mti5H4bh9DM+teAdmSGgReJsF6nAWmzOp9n5TdQEko10EZYWwZvdcUZ61pz0
         LanAe8JCp8Msx84pnBFe6no2/cXLXqF4bFUBGT2awH10bnZlfECfewQ0x/A5kCZ0x+8A
         Re1g==
X-Forwarded-Encrypted: i=1; AFNElJ+IoGkyYcqe15QAKRWjzVYOTE9alHYnyfSrikx6Mpb7/8fRG99i3J2NtoDBkf2ZJ4ibv5T6NlxtLRSYPZvH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf4Al0AVLM2PVQhO1iGSE6X6vM/WpiHWM+hb39+vfQF5njJTmO
	GYdTcNjM7waQsl4o/fUDpoiSvUOPDla+Ekjodb3zL+WrzUtcCCVpBheDudqxX0HDAIBBkoQzLnT
	HoJC4I+7SHgt/sgLALQQpvdf5Q58oLPY9cfqRjEwgbTsqNhT/silcveX/7p0luFN1szuE
X-Gm-Gg: AfdE7cnp+9g5tS1a2+Ns5lCQP/r6G6AMQRXbrIPBx7OpdWAUIqrvJsCXBy5eQM5RvxH
	hGiWSvTAR3bCM5sVoB7q42ZDbK9ULZUv+ixb3/Nnk+k+sxgaFPAq6Vv8eIRI6ddo+RwQREYnemZ
	W6oJ2dyG+z4aG23pRL9znh8Hcd3CYJ/BHMuJzO1s9KMqzC90TEkx4C23KM50YIg13C103EK4+8J
	60QTyZ90aoQvjX7s0b52HE18aV6N8PvoRWlHHcGFaFK/J/rSh/AKArivUnOimvwfWK7RZIv8JYr
	V6pQdyWUvKQrV+cAg/SspOMp5g/RQzplH5TqSxJxLKX2n26mZpgMfoKwP3SveaC8aJE3cjh9xGl
	n1BVqrysUqABzN31S8p7rNMNAk0/JCjt+B9E=
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr17703641cf.4.1782389403698;
        Thu, 25 Jun 2026 05:10:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr17703141cf.4.1782389403074;
        Thu, 25 Jun 2026 05:10:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe0742fsm166255366b.34.2026.06.25.05.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:10:02 -0700 (PDT)
Message-ID: <c462694a-d48e-4e05-99d4-b2ad1036baf3@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:09:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: qcom: gpucc: Add Nord graphics clock controller
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-6-860c84539804@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-6-860c84539804@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfXzUF5AGipW2TA
 LgAbYhqnD9c5d9tb3jsrJQxK/Ml+JZV8UusGebkUPa81bXoFbbaAunN/CZazsmnuUR67Rv6hZT1
 BqPS/cBxqgdpINavV4JXbJhnX/JRZOg=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3d1a9c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cQiK_xN199hq2pa4WXYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: klkXks4mWkKAdiLzG_D5DthIRwLiyLTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfX2t1z93KvPSKF
 in87hXMUgRmlDjirDQvzNs9nVIr7WbMZ8irQxSyTGJGyO1W/oHne3PySSHGYBVaMAz1Qf1XNtB3
 psW3zugdrGBVfeoPI9aI6VLVSYPY7ZA/dQfG97G06bFebzsaq4wYbuVO1D0A0Acz7DGzeh36GL/
 YIPOIhEFGBHyuhbrHyyEVhOA4I1IwY1D+sADfsruz1YLBYtYmS2+ZSffYKUzKc81skA9QDfG1rw
 caaSAQDCB5jUemku3rwQmRgLiKmCwPxhgbeBqvovIsfZ7fzl0k79K3M6E44r+XKtoVI3WvHP252
 kxeMeoRto/KhouSegaly+or/CrBnBJlFUiCmHKqVEpksrDyOghpm1jiX6M0xaXWQ4Vc7d2WODLj
 xeJvMyQgqoEk2jkkEHfzJwP5LmpJRIZkNovZEgBrofRr7I0tuKapfIXMRfzBwKxykuxfoCP73LI
 2SP0/9fUsL5ZwIRfuoA==
X-Proofpoint-GUID: klkXks4mWkKAdiLzG_D5DthIRwLiyLTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114523-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:shengchao.guo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D742B6C571E

On 6/23/26 12:54 PM, Taniya Das wrote:
> Add support for the GPU clock controllers (GPUCC) on the Qualcomm
> Nord platform.
> 
> The platform includes two GPU clock controller instances,GPUCC
> and GPU2CC. Register support for both controllers, which provide
> clocks required for the graphics subsystem.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |  11 +
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/gpu2cc-nord.c | 546 +++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gpucc-nord.c  | 593 +++++++++++++++++++++++++++++++++++++++++

GPU_2_CC and GPU_CC seem to have a different set of clocks and
resets. If that's not physically the case, please align the
lists. Otherwise, please use a separate bindings header for each
one

Konrad

