Return-Path: <linux-arm-msm+bounces-90843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGLlKgLweGkCuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:04:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D047098235
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 04A45303ACB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7118361DA4;
	Tue, 27 Jan 2026 16:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4Jv2PHZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQ29HVZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1B3559E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532695; cv=none; b=bNbbPGvAAnuY18JF6PnvPaqPrY3t0NSYVLBvnjmPovl470fUYPkfgIuWmUHi6I0Mq4Cn+9xT428ARp0xRcfYRL/bm9D5FvZejqc00vMXcXR5ORkZ2y1dX1Ip+v985MtegmwZsKgZMN9/8UZAAcjs6sAyEAiFRboj2QBXEkjVPFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532695; c=relaxed/simple;
	bh=N91x1RWXG9wW6NZaOouglwYEsLKS0pw0JpaN96ynASE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQt57Q0CIjCbhdo0MSk0toNCLXwssb/0fRTBXHzniBzE0etoe5R2LP0qfcMM9DuGqZL7YqgMQ5XfzF76BheQYuXzU0gqCNS98vtlVn8wNO0X2p6GZT2hWB/9PQSsm+N3X9Ol3rzxX3SOd0B3k9RT/ixsa20PQ/L++BT4FHTM1f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4Jv2PHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQ29HVZW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RDlFok658425
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CyyRyKi7UoH77WgG3XX9XJ5m
	NmhBhAXp8DjsvD/vlaY=; b=D4Jv2PHZYdBhMDrD98pNwkEdz7241thykVkKmfVw
	CVM5Oon9SptyVE3r1AvmbPtw1St3lYh4+s4WFJ2z+DTb7K/cPbjLJ4Y+BUtqrvhk
	WJJmRIXQw3gv0ABA4ktb71ee9UtJjS7A4wsqqNce9FwSxHu4FLEHph/s6agdAFPC
	WwbwHhUuaIXUeYGuWaVBJXKDbk7nIIdQZ7QE/3t567SATjYVsJy3d4pLdAAKcmlw
	dRfKq6LM6oJMCddaA6logbS5rz4aJR51WvIWiUZmEvfDN5aJsdQjsu1IUNXnklc3
	Y0ELxN3A0whHYA7tkB+AWoEUjESniIt3tQLIJXTseIG4RQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxryn9xky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:51:32 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f57cdeb11so8412224241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769532692; x=1770137492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CyyRyKi7UoH77WgG3XX9XJ5mNmhBhAXp8DjsvD/vlaY=;
        b=iQ29HVZWUcDkaMVtTGlJL5Al+Kz8MyouRJAFK5K6J9OMBL5eClhbUWK94k4pv+BP4G
         5WJrW0uZPcsKXBiwYOg/ShKparKbPOj3BHbvKy61Pt7xrs6xW7pAqBQ/X05byu/jALaP
         B48w3Nj7hIzA6wyAo7xxE9h5vs+vtTpIy2xPeiQor1Y3+zGDcdNs33w+neWdxIt9g0gh
         lmRokYm/QWNwVY2O09H5qzpplHJKJE3B0C0OzaFSGdE83G1qJNsrYkCqCUOWl7R72Hh/
         k3gpW4nX5ofEhd37uB10robSvbtzLP4whvVprbzTREnE0w2oG8oIUcf73PkzTZutFIhq
         Mc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532692; x=1770137492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CyyRyKi7UoH77WgG3XX9XJ5mNmhBhAXp8DjsvD/vlaY=;
        b=tqDmjNew2EebbQpoKmJDxlLm17yB9gwY6jRXMZYBt/1lUQt2Tpxb+IsnXy+sUHpFLg
         JcbGlO8WeZQ1CEd4182gUobvX8P+YqAkVoTpD9yHxj4HlTmTrbE/n3zZWb74T2ZPvuJj
         AeYjWtq2M2yimxO+NiJMu5Mucesq8VRAXLQ6gvCqj0oSjXprt3jxbA/V+/lkeTBdYiYw
         r2HFvPjlKiC4e7s7dHlrCmMwoN0LjqS6GZBVrQu8flbvQ+dLrn4ghJFBXlt8dOiNYXsW
         Pv25vLdOxf97X8ycwbNX4GXWzcNnA1i7PWABFwJxj8Xy5+YyLxxZV/3AipPdDEyWGdzC
         sEAA==
X-Forwarded-Encrypted: i=1; AJvYcCV1FqB8u/zAsTd9lKpWI/w1oTwFvmTmVxTbwtyfmjR1sAZxqyhF6+ybDAUiZmHxt8XZhu+2QcnQbpxpnfSw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ZcSDcTy4sfWcUYQz21Z0OFjUzXX6GxhnOZj/iFbylxZxtcoF
	U4u/rs15cgH5ojAi/T0GuiJwghmyRNSAO809u+N1WJbhogdvXztzCDOZNpUV8bPPzj7ANupLVDv
	J96137hMA29r3rpMF7j35O/BslEJ4BMSL6uDiisobPXHGjlbPZsCIPE+NANZdZqSX5qGZ
X-Gm-Gg: AZuq6aKf/10AScV32GgoPMd3K824TLgXNttXeZmsNNJ0qNDK1mN6HsCb/Rao73JYP4J
	H+gG369VnqyiZVlmoZhwC8H/vMNKZobajIIbcJIv01zMTp6iRPIelNlolWGhRxbxHQj1xbO6vEU
	OtLI+HwZboE+m5okij8e4yu8A71sgTwZcdzsPtCIVp4T1U59pDl0mmACCKfLkBoRY8YxKooNQ8x
	7h2pq+78Ld7oOz9p+soBLh/Ao1zKNjQEEVT/PMOoZePWKHSc0NJl7gp2JaXZ3T4k0Sc1CQJM82d
	uvKMWSZx/aAHx6xWGpBPB4bmKnQu5RDz20ocHqR8PjN46H0GlDlktaj8rvG6UCNnCOwOsLBxwNO
	Nz9h6sikhtTu5Ue4b/i2xI786tY5YPrG3jV2EjBZNHK8NOUE8rL+EB9BJloZBhw907wRRYvxygf
	S+G3ble5hEk4s4Hbdx3Jz2gig=
X-Received: by 2002:a05:6102:41a5:b0:5f5:402b:7eda with SMTP id ada2fe7eead31-5f7236260dbmr773799137.10.1769532691693;
        Tue, 27 Jan 2026 08:51:31 -0800 (PST)
X-Received: by 2002:a05:6102:41a5:b0:5f5:402b:7eda with SMTP id ada2fe7eead31-5f7236260dbmr773791137.10.1769532691134;
        Tue, 27 Jan 2026 08:51:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bbf23sm40703e87.89.2026.01.27.08.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:51:29 -0800 (PST)
Date: Tue, 27 Jan 2026 18:51:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: talos: Mark usb controllers are
 wakeup capable devices
Message-ID: <yxpb23ffawznmb3syb7k23kz3lcnk6ta7ppaw5wcq3s6witkoc@qnakpsylbuyu>
References: <20260127155537.4088709-1-krishna.kurapati@oss.qualcomm.com>
 <20260127155537.4088709-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127155537.4088709-2-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zvo-33pxvWJYsPnEZ1MwnIRYhGF-miFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzNyBTYWx0ZWRfX8A9ZTpYxpkgb
 T5fW5CMcGp5SXcRtU/HwCgNjAy1JmpZbZiebaEEIDE5aJuJSdTcEzAWyEaXeCy18HDWD/KgwnJ4
 1XLz2NDfhX2O+QzmBkXyIX9Kv1Jy4uvTOUmw44zd6zby5BjEXo89dZUmi2BngLWTkaJX9ZtyX33
 B2gaQiVYuA6w9lyjETqiV2Bmr5hn786JEmRqtg9PFMFFkuKsOCWqfXepy8pSBtMIeXpzCluRODg
 4TzY2IERqPoswC5J98Fw2lun8oBCRyggqm/hJ5d9EuimdaR2WgTkdUb3y+fNfVdcj7Xc9XFKbR/
 FIEgxFGWiazFPxfz4aj9v7vCsHSBvBNCrIqDm/1apCm1XK11uC4mogLLhbcLrnm/8W0oY8nZ3U8
 oRrUo9gMWS/i30key1JHQN9RTM2ngB91/wJ8ARRI+OK8wK2IFgjgSLLUHmWin3sVMa6xYsbZ36Y
 3yzUIhgmJ/EtYmGRNjA==
X-Proofpoint-GUID: zvo-33pxvWJYsPnEZ1MwnIRYhGF-miFV
X-Authority-Analysis: v=2.4 cv=FsEIPmrq c=1 sm=1 tr=0 ts=6978ed14 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=o3-VG2yC38D8sthXnsQA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90843-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D047098235
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 09:25:36PM +0530, Krishna Kurapati wrote:
> USB controllers on talos are wakeup capable. Hence add wakeup-source
> property to both controller nodes.

The order of patches should be exactly opposite: first refactor, then
add new features.

> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 

-- 
With best wishes
Dmitry

