Return-Path: <linux-arm-msm+bounces-112736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HpKEBK6dKmrKtgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:36:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7B567165D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:36:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hk1ydX2f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZrCQRirc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112736-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112736-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D08DD3073480
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDB13E451A;
	Thu, 11 Jun 2026 11:34:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A683CAA49
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:34:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177681; cv=none; b=Ll+tRQgShcwGIBKjY7z1CfxEtynPEnptTcfG4vpEKXHGAhHicUKcrYBIrcRPR9+Bm+FHWwWn3vgJGrMqUlnWO1HI3aC5h9KEv3Ho4d9S1q8XUY6TL/mJTnkeDYPTDX3W//FM4QpSdCfRTUKtjXkB7tbDq64mL9Kd47r/bNRhy8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177681; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jEyVPlYUm36qkhqxh7zOSvjNlB4PjL6nrBKHIQ54s5zv3/6q3mr36fDwwXMK5Pwm4dpPtZQBX9hts3ZYNajZiInAshvlFd2L9sQR6xxCiemJzghA/Gl9PCa9h+AdRXvVZb7obkFpQcg7/eWya+kZm5RSzmplZvP5xbUP/vbSNeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hk1ydX2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrCQRirc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xRXt174136
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=hk1ydX2fW2byFRS+
	7TEOI5TI2gAcI0DaNyzZmxj4hMy4F0zdekzJTP49Ok5Jpa61uWQvOTzC3b9sfj3M
	xhFzSt7kkCA8eIdIX6I7jeokGgnxlqxozjAnL+YEuZR5lOIyKJ6brrfi3fLpNjte
	H/bLQYg1PVQz6RyaiWVo4vu/sxotomuXrSok88rTOcrNQKsfSXeARDslrNiitIND
	OrN8qKH8DWUMUfuWKPg9AscNYvS5qHwb4gq2YXmHEiu58c+MiFDSQ7usT7oRE+WS
	f2/sqBo4LHfbGnVdmvjosThZ1IkSubE3ttoiqT9L4NIfUZyIO1XIGpDj7yTxm72C
	n15bnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vb3re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:34:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51759082206so23371981cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177679; x=1781782479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=ZrCQRirczWZue/zxGQymlD8k5SQe4B5CfwUv+thfmEwY9MuHFd7Cpjraw0nJcwXOjk
         JTY2wrX1H6P3/uFVB+tIHsOhcqCwiMoQXVUPbj4gkm+F3BlsvDtkK16p+t4e8ysbdFZN
         290g/WR2J5wg+l3LHZII7a5B7c+5xvd1Yqj26yFu46NTq5k0YmIu9QJBXmyyYd1hh683
         uNKzilVneA8EgizQPKuQCEWROImDibgri0sjtZigrwlBGprTz/qD2lRtMAV4JYy7Bxp1
         /Ydjqg0HrptA8Eye5eqHxf2cdEqfuNcLLBU7h5pQCeI2cG0QL4tcls9sSBbns2d88Nih
         xeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177679; x=1781782479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=oQrYTTx9qlkw4gNglvWKMT2wyVBFfN0tGs8FYZ4S9N3Fp8skWzc1GqabQb7q0LBN/S
         zpffHf46aSsoWPoApNUQ5MzJn2/dsbxPfS/ISmgpyPoH5KkQxjuNWEcX8m4/BZX8Bk8E
         wvjCZ3usDs+xCUXY/y0nFgk185LepVCHrqb87WKda60Na+XSi3O/f9wYeDvLVOHRNiDR
         FCbKpw0WXf6F/rT1wbahJfhBtqb/nmmlPEFaR2Hiq930aneeOsYYCPI8gND+lOFmQcBd
         HoDC5j8PXJ+t0idT8x1oVjYGyOzIB4OFn/iZ/SYYeOmo0lQx/U23Vii9y0AjWKuSZH00
         j6zw==
X-Forwarded-Encrypted: i=1; AFNElJ9YCLrZ+D8Bh06DajxXcyZworaECuNBVWsufUQWC4MIofZi9Fulw4xo5aWwyRTzRqz/XrOmOJBg5q85HL4u@vger.kernel.org
X-Gm-Message-State: AOJu0YznTBmEm2/u6qjQWz3t1QyWS/zk3Bjtl/jgNtIexy4MGW8h6sfr
	pVE4W2FMsbl5cFr/1WWFhL1Bj1GcqD5x50tvGyjaPktbfww+bfdHmOP+dOdWuMd1QVTYuf5x7ij
	AnUMLlatit8nQY6DbR2fLpFWVeNBiPnAlwo/oSepqx9zOIHg4pl4Rd/83t0SatY3Kn4wk
X-Gm-Gg: Acq92OEdkPv5Aq0Rq4+6t+69mcsIp/AEnwWOJucMx2MAauu+q/JevWL7NR578mTMJBo
	2Mx/ViS03PXkE1ptEPA0UNp3J3JpAUfIYMka95IqGgyqpgJIVNka34yVN9ajEcqsIhtcsGRn6R7
	mzYukNM3cPtZPIGRLuW/naRqB5nyO1Su3Akoprpn4yb+MPs2AFZsBwhUSzHFXQATEJOjQSamkSF
	jU5ZJfFv6EJwmhQLUJqubfCcInFj1+GVIWY3xz7ICp3Eg4vIvO/73nDO46xy97kTQ7pTFmPhpZd
	b9YmwXwprFjhkuyksGSEtbNtj0f71LOXSU9E/9bekEoQelufw6CQnWycVSoANluurhRQTa1FFP+
	PcRpUHaTuHKhVDO1pYtIMQe06hIy5y78f/NwitrmEagRzjOA9LXk7yg3H
X-Received: by 2002:ac8:690e:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-517edcd71a4mr23346071cf.1.1781177678994;
        Thu, 11 Jun 2026 04:34:38 -0700 (PDT)
X-Received: by 2002:ac8:690e:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-517edcd71a4mr23345771cf.1.1781177678587;
        Thu, 11 Jun 2026 04:34:38 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f1478csm54221966b.8.2026.06.11.04.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:34:37 -0700 (PDT)
Message-ID: <9eb7a44d-d3c6-4571-bb81-459035faffaf@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:34:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/18] arm64: dts: qcom: sm8350: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-14-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-14-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0Ut1QcIeZrnRNfUdu8qNdQMMxNzjoUhF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXxiuDaGJ5gM53
 5tBGvrqKBT/lrDDlspuxj0uWo+TXz1n6py3aIByQGKskA0iU4hjfiApDPb/LanUYSiaaAYh7hjy
 uGPVj2ubNOzuaB7b6OipwU0I93ZuH8A=
X-Proofpoint-GUID: 0Ut1QcIeZrnRNfUdu8qNdQMMxNzjoUhF
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a9d50 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX7a1SgCJmJeGK
 cRn05TLDCHQ/qNbtYsLtiCjVqW/NefUEti50Rwa1AVFf7fCbr4dxTEeqv8gZZEYTb+EiGHHnxKF
 E6Wi9qoWsrKKEKe1JYiDiWups51xBhdBY/Pivmka3Et/MnuTtzA2l0GlX8a3JcsNFphIMVqSGCv
 7wMiRkhBH8eAHPmRA6932Gg6+/em9ffVSu9dC6Dx5A1RhAkamATHxhv9tMllmYI7Xqf30tr8Ll3
 eF+2M3YMjwZ7q4suRCeUwS2Cud2Qzq0iFFbqJHntbhhufHSYXBdEac/gQrzb87wT+4rd9FpSAF8
 oKLDqBMdfp2JKxI3evHgGLOFrm7kLidLKrr5qEBfWkye8N+J3Q5CFkdaE7UFtCt53Hlc3dI6kyu
 VZ9bzbJopxSROEVnJ9vu9MkeiD89KJggor/gzzp1kF9OygdhB5CUTlUiEiet8NCAx6QtkcVMZJI
 DpBAoONVH5ma412qT+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112736-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD7B567165D

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

