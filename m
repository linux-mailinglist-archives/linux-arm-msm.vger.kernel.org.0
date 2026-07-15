Return-Path: <linux-arm-msm+bounces-119210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cy+NHVNgV2rCKgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:26:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF15B75CF7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:26:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jvnlElFp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D3N2dJDx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119210-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119210-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50725303C641
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DA7432E8F;
	Wed, 15 Jul 2026 10:24:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F43343FD20
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:24:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111091; cv=none; b=WFj6DOmDVui5Oc+uMQR7kNHHQbCO1iYNtyAh5ykmD3S1U6h0qlvQR8vjqwP3SNm3GwTfDPB1wjoVbUr/CXP3A3egmznSeuKEOrsO54d5NIq0FBJNIrcEOeonmAokgc0eaOlII/oxjxb1KUJHPG6U6mr2j06bjehMogOr4A9CLkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111091; c=relaxed/simple;
	bh=eXcNUX87zt2YLPyGc7yI0u/x15olO2OCJZ0KsTB3Fpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hDz4wur7AYmlgck9I1BGAkQBof6tyrupIcxQOIsCNvNb9YfF8qgH8LaLjHpMT/lQm7bPtmbROggf1TVSw1OtkDp2PzJcDZ6g157MvgWiYwEdLhOO1nPiuGkKn2ZOMlTK84YQFUqv1CrW+/Gf/DpJUtdLgOYr289vVMT27q4NU9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvnlElFp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3N2dJDx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9bJqQ2269601
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+KXDtuoW/w/jNWruPD8XxFqjMWfRw4by6Xh/mpiNICM=; b=jvnlElFpoeduJZMD
	EbHAiGKQR970nwBUtHO8FlMw7thSGDVWfpcbLl5M1Kj+c20B4SbNC8HtZqg2V9Ux
	9NnS/1ObbFyHU9cr9BAdhaQNs2UiQw2HYIW61KdKt4X4Hqz7WmsEt70sAb4ZyB+z
	j7Erir8FpdzoXhxDVujO+tqA81tXgUsUXDiMqlmI7Al/fsQup/4lKDIGzhBbhb0P
	uP58UdqikQ4n6YksAAQHV+hS26ZY12F5rvK9bdV+6hACFfi74ofD7tD2P5TVCnYO
	BvwUvzeUH20MZ2VMlkD+Jbe9Bo8Yo/0I2rsI9vPIh5zUrZjHu9teB6HvdaWrAb5S
	tlE+EQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mk57y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:24:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eb5f54b6dso94339085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784111089; x=1784715889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KXDtuoW/w/jNWruPD8XxFqjMWfRw4by6Xh/mpiNICM=;
        b=D3N2dJDxRoVmLh0FAJQpviza665Jd6g8dit3E2bhoLqTom3/AHMFqLa1TF5Rn44/0b
         HiY2oeeFUMgMUIKe+gtgmuxB87oratS2vvwsZ/dXx7KBjhZcPIHJNDffNwkOScgcA/uJ
         7klyusz0PPJb9Fu0NPaJiBV5WNckR6xLN7Ml3ESxoiQ63bA5PP7Mvmt1ptRAcW15V8xn
         DAc8muleQ2kORsDBhYJRFIWALdT1ThjOb3+6UYAKbdtoW7+dFgUtQID3Pt3YI8fSZQ3U
         1Um5fLz2/rw4xul5sZQM2vENDH8xMMr+hjOrHppfXcyUDpvPdJLpT6I5qcjG/WnEBmNJ
         qRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111089; x=1784715889;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+KXDtuoW/w/jNWruPD8XxFqjMWfRw4by6Xh/mpiNICM=;
        b=RHaM/40ZDaSz50bjmSsgA5JPP6ohNADerLzLBwLaKbH5QmyBob+kf230i8v7R2hmNi
         TSg/Y5IxvjhOf8aHMblbb8oyVob1qe8JxlzOAEfGM4NesJcbWMm1MPbKUURIudw+NEMa
         xKCyifpEzEmGtbOd2qbEwk5fhanSISBNYriTCFeslcfI3yc6qoLXv6zXQlnf25dMZ6R7
         cepJYQGbTF0g6pjasF2BqjQKXrUaEn/yuOKDiJy+qfhXC1Lh1B5dHqpfkdPQncxon4Yv
         xpxf4UyLvEBhtPZToM2C5O4RNoLTWz8UqaS6tPGs1j9MDa5xVjUxnBmsuui+lilSBy1i
         n0jA==
X-Gm-Message-State: AOJu0YxOrWQGhQYUT5Z77QVBaAzSaE23RO/6DqsT1CIt1wbiNwTFjbcB
	buW1Wd4K+dgyx47sSvT/jItC1PIEmuFfE5F8kf1Greo8wT0xcY5PnqN/5574d28ngFVBPjXwJE3
	JVFqpA/+khl27S+kT53v+5gdphVaBSinxLZis+P946db/S7LNRqEuBaPknfMQ5LR0Nc1+
X-Gm-Gg: AfdE7cmD+Q9AQf3ocoImr0vHRArlvFAcCQJf7CAjVert0bFSzAeOqIBFsdL5jf7zHvq
	oC3MH9uEQU9RmeilmkTENOnTJnnAdrKNUHgrFNHcWw7A0FJj8HlKPp7D/j7acZhhdhOAfXnCV4b
	7cFgIaMNxHb/t0shzCg6ogU5WhDJpntY+eByWOhBTyO9yyDtj/Wp+9w4U+TtRRVmngWQBSD+Hzf
	3Y0Q6eyRqu3/DEr/dk170QB71+UjkYPX/47743VzyDch2PH4SHjoC0g0z/ZXWbuaz2T+gxRSD8X
	KbO8RP0PM54J0K4X2M5shG5rLXCQfVwZXuV1s6cO3GytzT1Cg1YvT982HenHcqEsWtfYGThaEGP
	vYo1yQP/1VNcEHNGVsfNBMQKHn2KC5D/mc9g=
X-Received: by 2002:a05:622a:10c:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51cbf2aad75mr125800431cf.9.1784111088900;
        Wed, 15 Jul 2026 03:24:48 -0700 (PDT)
X-Received: by 2002:a05:622a:10c:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51cbf2aad75mr125800231cf.9.1784111088458;
        Wed, 15 Jul 2026 03:24:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687166b94sm233266b.17.2026.07.15.03.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:24:47 -0700 (PDT)
Message-ID: <e8ef4ec3-7279-49e1-9c4c-4e316c2a42e3@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:24:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
 <20260714-dts-qcom-eliza-add-cdsp-v1-2-525e757a23b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-dts-qcom-eliza-add-cdsp-v1-2-525e757a23b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfX5YS+FoTKq41q
 WfHcoBMGXiPiUOVhylqLYUE5DEp8CzLHLP3Vvou5R0vlseexNvRZIBDUwxJC2wXF7Qdx3n43kfI
 kNpqQP3/I45lWAbcWQjcBZmOikuvZMaW8+jVM9qwdQ1JGEaOemSprlxjHNijT7SatkBJOuYPIuF
 7LEKDMRrRkFlr2l4+bhynpys4NRNRWXJ03w6zKM34Ui453JKm8Rl+X3+iu60OjZTOXP2lbfWaaB
 6I8D7l2nEAevdiwbu0R1No+lN6w3leDGKWcsNM/HoxC4dZb42UpfAX0bcElHaCnQEG/p2xInE2I
 TBdPag/O5tL8fjlvFYb0Niq0B3bBtPKSdgYXRJSaLpexNDVKKVDZjArV3rBy+4jO2CcPytjvNc3
 4Ei7Sqm/mUJdBxxM1yy84sVwK6efZdnV8SeBkRdlfnMWvxmW7LSAHUUWA+Wvv8elsgKJ+wLMexB
 yf1fOoyBfo16+Onr3pQ==
X-Proofpoint-ORIG-GUID: GM83NKwisvJAdDS2zW2DQeOb5MeVkxws
X-Proofpoint-GUID: GM83NKwisvJAdDS2zW2DQeOb5MeVkxws
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a575ff1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tD95H0FGCAwS4eKOgloA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfX/IbRCKt3u8TU
 MHbAGITuO7cKePRLIVH/1ZRq1eWO+mcI8XCvr8+y6wYTB0s0EORJT62FUP9oP0wUUQJUCDOdBba
 c/bI0bsbpRoTH+tDlftJ1FBu8xAwy2o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119210-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF15B75CF7B

On 7/14/26 3:06 PM, Abel Vesa wrote:
> Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
> names and marking the node as available.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

