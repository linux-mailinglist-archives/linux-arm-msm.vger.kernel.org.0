Return-Path: <linux-arm-msm+bounces-90012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFi/ICrKcGkNZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:44:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB7256FAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7C16F5C379A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D94C48B366;
	Wed, 21 Jan 2026 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtMvm23u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvGtBFLZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DBD47ECCE
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998988; cv=none; b=hc/DzQDfC5hSm2x9N/apWa0lMdMeKBzrf0EQ65QGMzGS0OVKu5QWxMvhY84rOvuD7IpiRI3v1eYacitgEuR3j6U+tYpaklUGSYh0YPZWCxzBO9nFEYeHe11i0+qlm2oO6TqRuwNOy5qqgRSPJeeYoneVQsuVRl69wXlpg6/eehI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998988; c=relaxed/simple;
	bh=Jt4RMdVjpfcsC7El8ZQKrqebDhubQbpxJrvUQU817yQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pE6nJ30dnlD5YsDfuBnqb/MEccZQBs2TFmpcfnfmVX+RTCEklAxWlHplLZJbPeWTN2ZpvnMc5688P+GholBgywTKSmfn7PyW00emS6iyz/b/HbCgqVFGScEM90YjJRvkZkuldPS6roVCm9XIGP6SqJvc2DiO0X4h+o1aIxPiZmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtMvm23u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvGtBFLZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAn1Ef3316218
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kTKGtgh0dnnNBiHfuaMQZ3TasKWP1GSdLDtLVXCQl3M=; b=mtMvm23uYIifkkib
	8MulGqpZ0uPF7QNKYMxYaHzAcnmytgmHCKGS2H3leiqqLH61zm29VOgL3+OcC/kM
	qv6oHYZWQDW2Rrkskusyf7f8dZ5UWQe9GjxBDaiLD5UrRMACLAGb3UhBwMMuXH/4
	i+aJmz/y0NKfkjV0Pxo06SI4YslXk0V/teQAT/c4dwWB68UyZhXeHYykbQANT5Vu
	CFCoaqrow+yqEdPHWKe0y6HJ+XTaGlh18ml9Sqgzx7dHgh4+mIS39XT4iMVjCFdk
	YSpCat0/yR1iPNcgb3Q31B56yA8C0XyG1MyLpXKhgBr75CmVCFTL4ft75Q/l83wg
	q9xReA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btwcjga78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:36:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c69fd0a87bso412297585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 04:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768998985; x=1769603785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kTKGtgh0dnnNBiHfuaMQZ3TasKWP1GSdLDtLVXCQl3M=;
        b=jvGtBFLZi+ki4ktAhvxSIVcV8QSQGSa6h0gEPk9PdoBamfqk8VqyMNxiv7qGLl1yGl
         kSzda2MZ/163pjOY2H/suOmG2C7qPpjRJeu+w8OOBgf92eL62+737VlPDywXEpIVvtze
         JmnN6F8y/Y8aEC9BP1HwyFHqOFf44JgBY6VcO6Sc55GaaEtlR0aBjdv4X3ttfTW03klD
         f+gdm9KHQTMWRyRC2X8y14Kmy9dGW48zHiUCBt8sZdBAiJ1TuGKcQt8/4MQO/qzYn+wR
         YmQmg7ECH2TXnqQyqaJkBYJljjcyXxUC357t00wnoXIWXMQ6phVgKdDSMH55oA2LGh3h
         +MiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768998985; x=1769603785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTKGtgh0dnnNBiHfuaMQZ3TasKWP1GSdLDtLVXCQl3M=;
        b=xKT+JYHItXyhK5j1WCnFoeKtO1tMqB+/vlsjlF72farfnFiBEDLiwZn4oCHLEcGJqc
         SChHGOjJUzA0+SFvGO/AetMd36DHBXD5Kntu+Rn2yrKXRBDsOGEXSLtIuXYHdyryirRj
         S+tw4gi+yF849bkOS11Q5R3oZmewIO4F+/a+EBUSsEeHxrIenn+JLJT8PhD0UMJoKOPQ
         dIiismpmgGcrkrF95AwiYbeUDmV7LwzbW58jtX5PCZdgxouZOu3PQusePybW3tuOaxt9
         JLzYo/Ia6G//Dgw0vbA0ozGxGChzbTjjFPYXOY3KoAcfQggj+ZgirnXo9C+zS7zZGXYE
         iY3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHLz6AamfQM9bYASbvsmcAErcZrEAU8E45YoM5FlRRfdfI8zf8nh7HH+qITvU7G821OR5Fldll69L5CGT0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyun20HpgIDTLI9WnzSfFy+vqg6/JnBWoT7KsJIXAq73K1S2kn6
	WRNoM6BGldpwVt2fS5AUevAbXrkSJhx5kAL51MwNaffdHLQmH3PEnQ28cEi6u5MD2MmCQjbaxVe
	9KFByCBnGoRe286cQYavDlQCuCZkBv5Ib8UYh4unlfSy6LfLRHmFSkpU9KAckDlxscdAu
X-Gm-Gg: AZuq6aISYoNMbPbjIdx+Q8VEtMkQ9BF7Fd6FrqiLCYKjH/Hc6K8y4RqORDV+83f/rkO
	az2iqLJ/G7Uxd/+L+nQxMoo3WWMx2KfgADlgQTtqA51n2sRMWoT9cvQQGsxEUIU4P8D1QF2u4ZT
	1x7O0NL6l3MeuyrrMWehddmZVlaxGDw5pfj1gmsP+k7c2rC94NG4208CS8AX5xzxijKxx3AgSik
	zMIJ4Nk9zZd8dznwe+kc83k0Plp4wdk4uojpl7Ngy6wJ4PCvbnp9O/bqhbWsXQPd2Gf/XlCM04H
	GmaiUpAHc1auMA+VRfN/PyteUskOMf9P/HZE0jZsbqFX7hfLHAzUKrSOd22VMOtc3UA7a/az1iV
	bWT3YEo0MADtzL1+YN1QldECUXvZNDhaApCp/VqN5jGzk6JW0VdJY/e/+g01zJGYQKH0=
X-Received: by 2002:a05:620a:178a:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8c6a6703cdcmr1847245685a.2.1768998984729;
        Wed, 21 Jan 2026 04:36:24 -0800 (PST)
X-Received: by 2002:a05:620a:178a:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8c6a6703cdcmr1847243285a.2.1768998984187;
        Wed, 21 Jan 2026 04:36:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm1562952066b.69.2026.01.21.04.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 04:36:23 -0800 (PST)
Message-ID: <2db1bb2a-e79a-4628-95a1-74e72258e199@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 13:36:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: fix
 regulator and SD settings
To: Gianluca Boiano <morf3089@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robh@kernel.org, david@ixit.cz
References: <20260120180052.1031231-1-morf3089@gmail.com>
 <20260120180052.1031231-4-morf3089@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260120180052.1031231-4-morf3089@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sqOLkACyAps6vxdpzEZoq96NkhfubnIa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNiBTYWx0ZWRfX5Jk4xc2pzqbF
 fiZgljyi2KmjDb0KQUnImo20GCyIx2DfSD89dJLDhA/3MehKbba3eEoeJO2YqNEYQcdCEgp8iGT
 veI4OGJin/+a0sOOOU6geWu2rgEZ0nirUL5gB6a9Sx7sdAbn0nTZY3Zx6JVYEHSCtMw9r3ta52H
 SuhKG0qQXVRlEk0ab4yzkdpd7VLkhBJsO21Bn/Lb3UiQn1V+E8SJjURTgPhfVbPQ4dd8tHE0qf8
 0ZzcsZjiM7mz0HaiF+Rqung+ScLs4lPS8gGTrN/pOUGvS+rtd4B1y1tZRAjCwNd5r2iE+zUwstZ
 aei9ogXKhmZRa1mQ1AYn027Ic/c0XglW8VHr5SIvwuGLjkbhniFQ2NRYQA3heaeo0wzkoA/xfSt
 oTqWbyWBXXACp9NEBXo7yL5KuPh5In1rnNhCiJ1Ie9garvBiR+9CiKTksousnCKbw41TQiflZHk
 iL2IoSpMh3OKPS9qlxQ==
X-Proofpoint-ORIG-GUID: sqOLkACyAps6vxdpzEZoq96NkhfubnIa
X-Authority-Analysis: v=2.4 cv=JpD8bc4C c=1 sm=1 tr=0 ts=6970c849 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Tf3bsVWerE1f9GOM5nIA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210106
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90012-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2EB7256FAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 7:00 PM, Gianluca Boiano wrote:
> Fix regulator configurations to ensure stable operation:
> - vreg_l2b_2p95: Increase max voltage from 2696mV to 3100mV to support
>   proper SD card voltage signaling
> - vreg_l3b_3p3: Add regulator-always-on to keep the regulator enabled
>   during boot
> - vreg_l10a_1p8: Add regulator-system-load of 14000uA for proper USB PHY
>   PLL operation
> 
> Also enable the SD card controller (sdhc_2) which was left disabled.

I see the new -common.dtsi configures the cd-gpio and regulators, but
doesn't enable it globally. Should it be done there?

Konrad

