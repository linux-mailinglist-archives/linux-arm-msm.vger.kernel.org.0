Return-Path: <linux-arm-msm+bounces-93927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CEWB+1YnWlzOgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:53:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97702183524
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ECC430276A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8879364E9A;
	Tue, 24 Feb 2026 07:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2Vtt2Bw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gokRPlrz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06973644D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919571; cv=none; b=rrQvBhJay7IZfbpaD18hl9E7RCcpL29TEghZ2m2WU0idiN/vE9mYrniG+9FXZyRMGbCv0PEA0XMKU+IeCq+4WamX3D9ZfAt+14TM0gLEQzb198oy7PFrdfbZ8tRRvJptKGgbGNWcv5GQ12FJOLzLSPdcMrIuxigzRw0Dh+Gpi2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919571; c=relaxed/simple;
	bh=WkbttYc/JaSVCm8lMgfGU8SHvGp7GHJ63kO4RYslO4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lS103dQ+EVOPaP/48wqClwyoXOV8NL7dFgCXgfPY/t3Vmvh9EDBmJbAC5orqc6l9l90OuuWQXMTZj4DUnAtZbzAZHG0P0795RwDpq+7+jIxNiTuVVxH8AgPWN4Qt6mKK5aPifFa0HPF4y8gc6oxYX40ZWnBzDH7wnNDcftXHdd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2Vtt2Bw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gokRPlrz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LRNN2807883
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oWROSRKbi8Flf0IpoDBD9rLN2E3RlAFsrMmMtf5bQ84=; b=X2Vtt2BwhOJHVXU7
	TGCjc2UYHtUh6Sjno2ZR+2jcqYHi/VOudthfMThkCX1Wu2Xae9f4+2Icot39s7UU
	jPc8B3ArGRbrMaBR7+prvKem4s2wqcphQG39Wqa5gfdfBFlV5LFt2Zdn0yorjcrH
	U1CrmJ6QrsjSCSI2goCEuWPKwsaDg8PTIuoC2/crmKzVbGFIDkBv5FfIiT0cZ6nF
	gjkgIesiZ9+ApY1o7wwWInlaNyrwUePvrzo6lhwkTd12G+BJrfUoXH8cQ4pQcr2Q
	W/DShidESkYmsyGNqSWCIlYsasrfW6M3dSRdyC7jfaTjWPbQd6B9yEv7wi1PRyPG
	RWdkHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8rbcrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:52:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506bfa0441aso547012901cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771919569; x=1772524369; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oWROSRKbi8Flf0IpoDBD9rLN2E3RlAFsrMmMtf5bQ84=;
        b=gokRPlrz6Adagxu9TJLMTcD2gL2Vv4KUX+WnxZuByxMd1h9MEdz//NoVYUK0+HC67o
         Hk+Z3ziTuRlG8DjEAG3Kvc8XSgvPkIBPGsYQ9w4JAR80XyecFXj0uC1JipQJ6gKJ6qZp
         I05DRTp4Jj5Fxo+Bpq7YI329NMnDlvtu4QJOrK9LXXT5K5kAk7OAxbE/S8WvUlMcrROG
         xUBx5k7Nhxn88HzMgcaYJBmtbhRxnl9RP4ULvkhjjQYhk4NpwM2VFwx6lmErZUdF38DP
         74/a+0q2xBD962MQ5SvAE8agAYMto8DQyMqWI+eM8tBxGCDOug3iCpOWhdTnYxvquqRT
         GydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771919569; x=1772524369;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWROSRKbi8Flf0IpoDBD9rLN2E3RlAFsrMmMtf5bQ84=;
        b=h9sxGzBDJdAXpTRLkuNqtwt89sRe4NacxnEeh3xg1vRCfrp7WI0fhBOv1zF9BknKMf
         tXTDLkznGO93x4y4J5/6Gbq7DK4FvZYATdeH2oJtcXC+K7trqb75lhOxqTPqJUdHLIqT
         AG0o+PGbnPs6YRi/ptobMYSHbOYnEiqp8V/Ft55FE1l0squGYfB1QnDPNW6hzH0+6+m9
         USTWkBwc7vlais/pyLukk1KasxO2fCDpDct+Lh7hmxF383XIFR0HXuV3E+ZbtISFcrx1
         2g3xejpMPm9pwk6WyvYUGqcwj6/7qw6ANc5X4atdUFOOZLPQntaAzDmcsRmviJTag1VX
         KOHA==
X-Forwarded-Encrypted: i=1; AJvYcCUcmbE0+IPhNhn65dDDeOnDr6DRsWw6/ADbkCfsVdG7P6lR1YDnVFCp63mZVItXm69Bm0sYhSL16dsh5h3H@vger.kernel.org
X-Gm-Message-State: AOJu0YyWHSSO3CdqMA88DpSicq/ml1jGl8tm9yyzLcIUSiRRMAp7di2W
	QvL//nzAJ3xuRKzo+n2v/MgImJqWm7EKsJikYjTiqnSd7Y7n+EZhWsIjz7tsJoQWFE0a/prEo9U
	7/rMwIifBK5vyLkFvuT0eLJg/SiIDSlU91Btl+1+YYuGl9DgHxgizvkAVaJuq/2E0NdNx3fftuf
	rF
X-Gm-Gg: AZuq6aLAwnGAdMnhrOi9gSfyZ+dclzavTUTFX9ZuDEuiTXOFYqC4ft/Akr6k8bSoDCV
	gvvwqTFrmPHq5TtCwouAzBSStnX8yFDzDVowpexX2hx5p9tewsslCBEZu+OeSqjJLcuvJXyWC9N
	OoPYnQethhlG73FgwbZiTn3a4e/dJIGekUOteORUZdeGPjtyFJasJTeu7Naf8PA2m0l9XZwPBkR
	bGjeAN/4U/a3e1fNy8gESvGfMjY4N7vdquAybVthsB6EaNZF8ejrwjiq3y5wVCHbqXd+20GQPc2
	mi7EjTUExsbXSbqJt9tOu1l1jXNRfvKIkIsghYtHn7w2SXPLg+hHXjR8BXERhY+ipva8ZScgWp4
	McEtT6VpEXScijDR8OHWWFgu9u5GF2Uc9GWeRtzVtF6s6A8ZagTBFELsZrH4FzAtSN8Y8O53aP6
	zA8+0kLZhPv9Bry+xKsK+rNk/f2L3P31POst0=
X-Received: by 2002:a05:620a:4455:b0:8c9:f996:81fd with SMTP id af79cd13be357-8cb8ca0a8femr1535443385a.33.1771919568914;
        Mon, 23 Feb 2026 23:52:48 -0800 (PST)
X-Received: by 2002:a05:620a:4455:b0:8c9:f996:81fd with SMTP id af79cd13be357-8cb8ca0a8femr1535441385a.33.1771919568333;
        Mon, 23 Feb 2026 23:52:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78b3e76sm19114091fa.10.2026.02.23.23.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:52:47 -0800 (PST)
Date: Tue, 24 Feb 2026 09:52:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
Message-ID: <iy3yypj2gcl6znygsyoxja3lh7irrl25snqnbxfmyhyhqgays2@57lyx33bthh6>
References: <20260212-rb3gen2-upd-gl3590-v1-1-18fb04bb32b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260212-rb3gen2-upd-gl3590-v1-1-18fb04bb32b0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AUeYc6zaHmTINw9TvpT56fEcnq11vA4_
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699d58d2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YjueOEEBwl0Zzny-YbAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2NyBTYWx0ZWRfX7A+Dt/JO/ei1
 HkKHvkPLdYqT+6Gy0Cw3ID8CEVGYIN92hG93bydnQS1qbADJIpIXDYwXDE9meGlRhv6ccwLWRvu
 t2QowkrUi/x11oq6LC3DGWhzCVcpXJy7FX5zL+LzlfpMCqWOTKL+y5Ez38iNLjv8loYoRw4NN/Q
 BaqS7j4yknUWatR6sOt4JZ2j8uRyAOlxQcAs6urrMFYtxbk1yDn8g3UMEBZqPFa+y75vpXJL9XY
 QoSutB6UIUybcGSDSouvQ3HIL/vS7i8LqP6auwyyBn9a6pDlcYNwTPYI7ErqLLRC7gXw+ytkH7B
 kmFYho3I62H5s5Vu8UaOF+Eahe7tXVI6IdSFNP7BhNMSf02EXLosnZgIHDRwb3cxL1EpEf35Leh
 XLaAtbqbHm2AoMMnSzj2K7+CeZIuBgVAI/AP0yK/lS/8EzqMwiuTYfqbQdecg+yK0IzYc+CTrhy
 w92RxFwKOkuWYEVOuvA==
X-Proofpoint-GUID: AUeYc6zaHmTINw9TvpT56fEcnq11vA4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93927-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97702183524
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 02:43:46PM -0600, Bjorn Andersson wrote:
> The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> interface.
> 
> The Renesas chip is powered by two regulators controlled through PM7250B
> GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> The Genesys chip power is always-on, but the reset pin is controlled
> through TLMM GPIO 162.
> 
> Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> allow it to be brought out of reset and discovered. Then describe the
> two peers of the USB hub, with its reset GPIO, to allow this to be
> brought out of reset.
> 
> The USB Type-A connectors are not described, as they are in no regard
> controlled by the operating system.

Nevertheless, their presense in DT controls port's connect_type as can
be seen in sysfs.

> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
-- 
With best wishes
Dmitry

