Return-Path: <linux-arm-msm+bounces-102306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJd2AKEn1mnqBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:02:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F063BA36D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34B1A3080C9A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 10:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB493B6354;
	Wed,  8 Apr 2026 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDswb93o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkxwJ1v+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC2F3B6C0C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642402; cv=none; b=BiHKuf/uQ2jhx0+xathqYk3//uZ3jaGoZFFBVY/qb/s+TbRNLu24GfJbQbu3reHqlgBV93ssvJRGb3izD3RsbYitNl9pKOrHultWcwRq+/TUMaCfYqvInR8ua4CWpBVfIDfDPh9oj78SI42Q/AyjHeZwZTzUD9MtgSOjP11+8dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642402; c=relaxed/simple;
	bh=mBi8lFLIKMzICVhQha7ak23yOXt3vD3HD6QrPuHi4Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1/HqnqIIQKb9Paak4GA43FcsTZ0yeA8Omyqg9Rr62GBtzBUoiUg/HhPm7h7mXtpWScSONLMi3vckp+2QssJF2mQDP32VVOEdK7k658R+wbwQTkOZnCAT1IrWStqCc+mdeQj2tYeqxZLN1q6LbualrB5tHYet2TOUahTamxxVnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDswb93o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkxwJ1v+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6389Lr5s2411822
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y8yc3SWGU0L+F0BGHaW8P53Qu/1P19jf7doWt69XljI=; b=CDswb93oo4dExRKV
	p0bg4KOuTsdlVXIkgmMaSPIJCYP4W7sVZ9PVuUDmovMg6ZI/QN94WMZbMMD6YYH8
	JDDpkZVbXf8xeBXLlzGfepboVrWmwdffBqCh+he0/EE18hZHrnpM/4ltDB9yhSCe
	sJmWvdgiIhZzEmTEatUABFWs/4mKzlJHsOjM4Cy2NAJr9huSwvlZC7Dq6hvsJMPQ
	sS+sJCKcUevFRzdXc76WyT4VfvPktw6U4HbWAanaFH3HF4ruYS+5KHjD7SHWIjXN
	tnPrgJFuDZK2v+44biJ3/YCnlSPDxbKlfbRhqeAV4GOyXunW3JqiHKjuvK+3Dw05
	GzA7ZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vb6hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:59:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb456d53a5so153056085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642393; x=1776247193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8yc3SWGU0L+F0BGHaW8P53Qu/1P19jf7doWt69XljI=;
        b=WkxwJ1v+DJdk/z52iHqwIKCE/RPNNgRXiMWL8EI5Iwvp2p/mSvooFGqSQ1wqVssCwk
         /MtyHP4mqygaBNqDuPHKculO061aOh5fBAYijUfvy/CGf/HH+yHACDSPbu9r+8T+Q8ZY
         VCuqw1vOALCvPRpIswXGklbTRjRPzBxfgpbtZ/IBJYd+iGtzCYWz51UgLMkogYvF/Tzq
         gDDnv8qEUnYB6yqOWVUohjFM1XCbbbmE01DndspIAY1RvlvpUwDS/6eGbdqq/NGIb+UP
         fLjkBVPFn0TGNINf3SrSIsXkS9ZO41CHGRJpxxkMoYpJf0CuuDh2S7WRKOrpIjmmBOPi
         7Yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642393; x=1776247193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8yc3SWGU0L+F0BGHaW8P53Qu/1P19jf7doWt69XljI=;
        b=gNe/F06K2RmP3eiuO/CJWAmbWtQRSeL+9OfdW7qcnB3cVeL0VMlqsI2/ap5NsIHGmi
         mPOjv/LQ8vvCnq5bW6zrBtNjwhQJa47ibmCGpuPIkTbcPOypzTB24D4dNql4I3dGRhpa
         zQqZJjkwBtYilFt8NcXc6H+Darntvzsem/RoP0W+RaB3IHVM4UnQrRmxeECNNdC6XKZM
         bmecdPIX269HbyjO3it7o8sbyCima69jyXUtFfppe7I7rPUOCFBfVsblSEyUOBxmKtZY
         8reTMM7iT1ik5ao+1+r5c0pASBZ/AddyOERVzWQ7zvSBnZbnDQ4jzJEznA0kUyXUqgtR
         2d4w==
X-Gm-Message-State: AOJu0YydBQteDjzzPqLyYRAmsdNH62MG1muuYTYEfWEp7ACMqzTzaQQd
	MwUQFmj+rm/51CNlW08tYnnkfUdGU9NahkIiwRNCTFL3BNTpLHFoSGS8nlh9CYRaVwMxomqt5YE
	JpTpHlQOF5SlzIhBD5YovLWOuL9K+Y7bBrcmtfBK3Iy6XtE7zFkywDqFlCu9tMBEipVVa
X-Gm-Gg: AeBDiesCriC5NnukxujCpmiOMwxt57jIN9axW5HG1wSQwzB+tY5jnkGmrhyd9p0YpX2
	bR3H4A6UYgJrarp06vwriaA9pAhZXYKOSnZRDM+AukuwKjI4OQc8faCX5xdXHNYruzA3IH8kGiD
	V45/98bT4V/DROFcsy2TV+o95hfQKwDoS53I7dBcr0rySgN0b4HJrNlECblWpDWd3zs5/Jj/FNA
	EWG3Enz6x4+1y74LaB6dvxu1zLOde6QP7EGQUJ2bq8czsHY0bkFXO1PRH/dKiIcLbkjQPBhmJyf
	lO9MjXxajVLr2RLGTOx0e18otAvzTxaTam1e92y709UDizdWxFrFXoDLBq7UByYy8eFXXXdnDUQ
	WMQZwaH3vUWhfWmTpfZOcIWQR8u5PiF22AOkbHBCIq2aAQ9GYUTr1Qd65FqEcXMyC1dCMb8y2Fq
	ZU+1s=
X-Received: by 2002:a05:620a:2682:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8dae2489c96mr319301385a.6.1775642393447;
        Wed, 08 Apr 2026 02:59:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8dae2489c96mr319299585a.6.1775642392995;
        Wed, 08 Apr 2026 02:59:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034b9284sm5221704a12.22.2026.04.08.02.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:59:51 -0700 (PDT)
Message-ID: <1f6727c3-d10d-4f04-9492-2cb99c95d1d0@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:59:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MCBTYWx0ZWRfX4zc9EWA3u6G5
 NIUGnEwc77QMEKUwUXjb86jQbqeUQJMKOF9uIHD9Sl+Bm2k1vckH1+h8GkzqZHCpo86fLnejVBT
 IFq28tciaf+1yl017f6Bkwveju1qLA+jtI5fSUIdIqEu6B8vrsy/xsqDaApwG1rkK/FjykF4Rdt
 dtt2BZC6+HqqaDGtoK3gWppDAuSUCJ5vo5sui05AwcUukuJLf5OojztEBb9rzzd21CWxvmUSBx+
 lJkAvyMDq/7rcbgFrVIiXwJZTSbiGEhEvn4ASXoNL7VZr3qihQcsK/UGy05XMDiFLAtE/eNZmCl
 AtKLBi0KSpXk7LSuKm+W1jvwNW8anG2/UFxa7/UWI11909XbiPS2dYDh31Auxt7MKMfh/kQiMyb
 LRv8NJkIgvvefcE1rb0aN6msfK2fdpGt68P74u+eih6I7fRWeIMSjxKwS1aqvF8AeDQ7Xoa20fP
 Qkn5Gu0rJ5AX3qm1Spg==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d62719 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Zw2ZyFplH8TUw-UW1mcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: aV3OK-ISlpGmysNlTiN499uP9Q-10k54
X-Proofpoint-GUID: aV3OK-ISlpGmysNlTiN499uP9Q-10k54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080090
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102306-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1F063BA36D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 3:27 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

[...]

> +static const struct msm_gpio_wakeirq_map nord_pdc_map[] = {
> +	{ 0, 67 },    { 1, 68 },    { 2, 82 },	  { 3, 69 },	{ 4, 70 },
> +	{ 5, 83 },    { 6, 71 },    { 7, 72 },	  { 8, 84 },	{ 9, 73 },
> +	{ 10, 119 },  { 11, 85 },   { 45, 107 },  { 46, 98 },	{ 102, 77 },
> +	{ 108, 78 },  { 110, 120 }, { 114, 80 },  { 116, 81 },	{ 120, 117 },
> +	{ 124, 108 }, { 126, 99 },  { 128, 100 }, { 132, 101 }, { 138, 87 },
> +	{ 142, 88 },  { 144, 89 },  { 153, 90 },  { 157, 91 },	{ 159, 118 },
> +	{ 160, 110 }, { 161, 79 },  { 166, 109 }, { 168, 111 },

This list seems rather short.. are you sure it's complete?

And could you confirm that it's been synced for the prod verison of
the chip?

Konrad

