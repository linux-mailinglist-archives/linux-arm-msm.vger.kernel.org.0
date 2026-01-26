Return-Path: <linux-arm-msm+bounces-90504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCRMLio9d2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:08:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACCB8670D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63DFA303DAF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0965E30149F;
	Mon, 26 Jan 2026 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrgGHA8K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="am4XSoFN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A033064AF
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421870; cv=none; b=ZEuhrlBilgVeoRUh9KOe78GyUP/iNDxfJZdUaJxKy/WQHuTIwfMzhCImOGVLBcK6mPlth8ZffVibuqzjsg2hd5WLeTBKTxHpvThqAgrwsA0fFPsO8CqdN9MzSU4iQWcpnJnZFWG9dS+KygIYCXgCujVv1ibn7Hu0lOb6BWq7TaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421870; c=relaxed/simple;
	bh=Z+F/u19UL5rTbSf/EztVBQq9QaHj8tFJ6v+FgzvomSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7rpyg/534NjzW1iasqzKwF6tLAyG906wolSQbhGAQcw6fbIcAAVtpsjuhNSjkufCxsEAOs641FlLhuifYXu+zyzUAqiaci2w+YAVj70KNJ1uHQC5bsPXsg1nrXYVXqwm/CdXLi8pN5Ffk08LueFWhEF0laOlAw+nV6UQrS6z6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrgGHA8K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=am4XSoFN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q9BsWc1193548
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gs5+EbtKiqDfewspPzrWTCLBUAj0hB8KK+jzGXQRxP8=; b=PrgGHA8KOMHbsgPM
	MR5dDuXJwQVCLbMrif+fVaaKYHanG40EHdW3e9aety7iVtHiCDI4tCJORvsnn5R6
	bSX+Zn9Q2oSjyw7a+DpHhR86mgdZ+UJtYUTKp3AQws1oM1eNkFpQWfGMP3VT+vfM
	balfsCdig2ktd67njMs1LpZ3rykBlJ97Cgg/DFYocORYCacDgNVbK0Z3br27vrlC
	5gNYPbdR97YHh1aw5MtwzsJhyzKQH5PR/3vmlOb+kV5DrAdDt6ztxXIbcJpAh2CI
	cAsHSQy4o0j867ySgVxM1YXbA0pWM7s61DkakWLHsKOsx4P1hdRM43zAcrB5Rq6S
	9JF6gw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3hc54v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:04:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c53892a195so92238685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769421867; x=1770026667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gs5+EbtKiqDfewspPzrWTCLBUAj0hB8KK+jzGXQRxP8=;
        b=am4XSoFNeDGRbY//iQLNM9K+8tBlSxw+rVyp1oUgKKyRcCjLWLjRdCHf03vH3tnVjQ
         5uoHrjO8qtWggNgUPeWceHwb/G5MUqNcBBkykva/585OL199FSdSfIBSXqKH2rmtqYnj
         dxUk7KiWybHzlNBoA1xJvyzOggQzkDUpFMXKlagmL6QZHUDOJA4vYBjJUb3M6OozWFhX
         rfw/dD85PLLIX4o3c9Wo0oof7E8eEfPgl1gJlKfd/wBbqlB07w1zrDxSKcPkC2bTL6CV
         17sERvsLUPilbGUgBreytrDS2s3Du/Hivlr3ksm3i5ELzUJTmYurUvlt8AbSDz10N5wX
         lRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421867; x=1770026667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gs5+EbtKiqDfewspPzrWTCLBUAj0hB8KK+jzGXQRxP8=;
        b=xJRT0RyuQf9cx+jZ5IO9PC0CrtgYOQQkpbziDzDjc7bqqEM8ialm8cifJox4VgsgsA
         BTa2T7bLA34Wg0lIkelQhG31WpU4XBcQYEiA9Va5eXKVeudNO1s1/U5ZV8cKuAzgdbF/
         B30t3mBMlZ4A9oREI0LxgFgacq66YZJN9rAV0eBgnACofnGErCKneInWuTx4XqfMiMKE
         UW95Idb5zVhdW9yrTwo9TKf6CtikDuisfbq3FX1nBEF7hgJmJYL3+KpY5ph+xVw0wqSs
         edh3FTiTBqzZBnHV9QhmbH0+hUXnLQelWDEkvtGlOoT7dJOB+9EvNSyY7GpsgriMdnBe
         kAxw==
X-Gm-Message-State: AOJu0YzRQOrPgT/B+QFpOvOymLX7yDE2FPdMU4QxD6cOfKQcWfzcn5FU
	IJRJ1/noRTcvzonUUJ0feVi8JGXXeYa49WhHzvon3X2j7/wHU3pj2/std/YPL/nWFIFsVm/s663
	KBb8EaMvLONnLtsHNYizC5zqsZrMqXtSbN+tequ/rOmJGbSTLf04nWuELi2KwFayrUC85
X-Gm-Gg: AZuq6aI25bBZUWNv/0rM0Uti0BqX3VTB1r2GHLvnuH8JUiRHZkxJPLEqTq1psJ7BLEn
	umSJUowOswP9+IxlR+z/s7ytMyUG9x1InVQWPyWLg19tXbmdDLr6lwb1P8sJA7RERUhD20O/8s3
	uD9C6ieK14eofmOOajLqQbj1kcVzsZibqYvy+ChCPLl9PWPRv8oWkrDRkG9n9Yc9AwXz9daVEr+
	MbnsmYJxH4+ZtdxUXKXVjwYTzdRWoNN/Xg0r0Sabj7MTuRILhVhRG0VpV4vz/nExB2IUa6BJoXP
	t337WtzHBMLOJFhQgmJQX1OAIoSVcQtyU6fbejsSZm55UO9LGiWqtUh3JhznpB7a57oQtWZkO7C
	+5t3D4RevoK4gX2XeVamNHQ9LyaytfX6duguuw4oAKNAEB6BqXgjNV8qTdPmq/MmpDig=
X-Received: by 2002:a05:620a:2546:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c6f962d60dmr358759085a.6.1769421867220;
        Mon, 26 Jan 2026 02:04:27 -0800 (PST)
X-Received: by 2002:a05:620a:2546:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c6f962d60dmr358756885a.6.1769421866776;
        Mon, 26 Jan 2026 02:04:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b965df4sm4871727a12.31.2026.01.26.02.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:04:26 -0800 (PST)
Message-ID: <7338fb15-e452-468f-9d32-5805441dee73@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:04:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-evk
To: Xin Liu <xin.liu@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
References: <20260125023521.3862114-1-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260125023521.3862114-1-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NiBTYWx0ZWRfX1cGbCGV856XH
 vYGFYFo+i321BPOzdRU1APFnRDiUWLAw1wgnjlih9nDWhCa5cBTx/huA57ujQskCW8GNRGXFD9Y
 vx/3PCICoVAxDQi0xUXEbG2xH6EjoivgfMcKdi7Yv0ouYJDGDfGSE7nF4nUMyhJfkuOOsBvszeX
 iOA4IBeqsRJesGcrp4X4kCC2ricDwOisGD4IxQb9hJZqk4U4z8hZnTMlpE/UGwz1VeH7phyw6Tx
 18BIIETLpILp/Oi5zHgiWuxDkgqG9GGU6kz/5SF3PxcK9UoiA/V19M8PerUaKmuDK6FGpEpdu5R
 4yulRGjmR+AUn0qwcsRPerf2lglGO5WnsH3B4/ar4GQjzQBAL+X61gZZFw9FDwdGiCWYe8yqusB
 P+DCv+gyK5TiC6fEfRgRDXbTQcdXnQBGR9hEwOzB3V3tqAaqICY2Z3HVRzbjIy1o6H9edFFei4w
 HziRhlihwIISyQu2L+g==
X-Proofpoint-ORIG-GUID: kOCS-iG7XfpqRr8t15kt0uZGEUJMOIEf
X-Proofpoint-GUID: kOCS-iG7XfpqRr8t15kt0uZGEUJMOIEf
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=69773c2b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GMn3xwL4stY9rUjJCzIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90504-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5ACCB8670D
X-Rspamd-Action: no action

On 1/25/26 3:35 AM, Xin Liu wrote:
> Add support for building an EL2 combined DTB for the hamoa-evk
> in the Qualcomm DTS Makefile.
> 
> The new hamoa-iot-evk-el2.dtb is generated by combining the base
> hamoa-iot-evk.dtb with the x1-el2.dtbo overlay, enabling EL2-specific
> configurations required by the platform.
> 
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f80b5d9cf1e8..0bbfb385cfa2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -14,6 +14,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
> +
> +hamoa-iot-evk-el2-dtbs := hamoa-iot-evk.dtb x1-el2.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM) += hamoa-iot-evk-el2.dtb

On a second look, the indentation here is wrong..

Konrad

