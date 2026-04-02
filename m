Return-Path: <linux-arm-msm+bounces-101493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EClBA+ovzmnIlQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:59:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 631D738661F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A874830B9748
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A665039C632;
	Thu,  2 Apr 2026 08:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WwdEYzko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OverSMh8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5767D3988FF
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120006; cv=none; b=apXqc7WY3eRE0qpSWKT/YvXPJeHCGN1ORfGhgV/LiwOACXhDteVz9W/rzDdOlc7pVn2aW9HtLteTSZ2SEY1HytNbntWWVOvNZnTsHgc1tb4RMQUOHi+FYqd0X/neS5LXInOH6f7Vsw1DedSE+W3g10oDSBZeHmv6J6w6ql59Do0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120006; c=relaxed/simple;
	bh=S1G+2gMXsKrDNLlfzL1NOLue91bXXM/HrhPE2rvpmdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iMl5tZgxzNnYK7mCXcu4JfSql3/MV21aP4i7rAV2gtfHMZVTPeigdv4Xd6Teq5Ms5+ev7M3V4lL1RxEXMkO/cnHaOMUpf6pivSMjinn4xCBrgIOMTrE9PaAuGnDaH4ajciC9QYo+zmtgiG0X9hIV6D/WvHudWGFda2p5DEe+QGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WwdEYzko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OverSMh8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63276CXp3955887
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qWlhH/cc3mCuVRrupRUD6r8mHHkfA1ig20MbqEoQEwg=; b=WwdEYzkoIexIQxdQ
	SbhBqDAQk6v8DJbo5grDF1IzilV88SmkVvkDoKHpqgBypQtCP6MTtSPYD+IMPz3p
	8KdEfrjCIVxPN9nueBcXlywG9se9fadUUCDTx3h6pYfbBldksQavPnIFXny3b2gT
	+boA8NLSLqeltakVZJ7QI4vRNlIGLbUk1wxHvDQgXonJTDVy2Bhepw/wAy/xEiC1
	5ym+pdo9WWvVvvWPWlWLbCoBvD206SioyRoGT03pe5H3RtXxJrkDHPF6reAw+Kbg
	wfoeobdHL2g8Nk2JnowNk8irlpNOBOhtRH81KkPfKkTJwGPqi/1ekCu/tS/oBJ1y
	GChfwQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5j9uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:53:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89eadc12c84so2931206d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775120004; x=1775724804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qWlhH/cc3mCuVRrupRUD6r8mHHkfA1ig20MbqEoQEwg=;
        b=OverSMh8a8hC8WZCQlT/OBtHtdnVenLjm0yCNc5dS+mYFK9fLH4gprwjX37FmMAwJw
         7XGDnfjxxGjXIuQgcY5aOTzOO+7D1LOSgmh5XBzfqR+TswRZniW9hBeyvO2XmiDv6Wo2
         bgpYgYjRmNk57adZaX7arjqc0szO/zDnUx5J2evxO3ceUpEAHdzcNStPSGDxEYrbj0Xq
         ebJYg9WyJ2UMisXv4WtnGVspUfRgNmGPvrf69y3m4Jk62VWBStu9RCVJMWCytlLJ0jo2
         i3b1aUOPy/KMdddYW4ai3x11UaQDCAtnOXze6ssCCnnh9XRTPlWB0z7swGMWS6hyBD7W
         D6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120004; x=1775724804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWlhH/cc3mCuVRrupRUD6r8mHHkfA1ig20MbqEoQEwg=;
        b=FQ8WdwnliC1Tra5ehyxHtBoGzWXvNh8t2l4SlD2Sqk9Ge2LP9LT3OuUlmXtW1c5SWI
         XZcTy+bTjMkzzILQQnZ9KPOqdMCsjMEN6J3oIxGoviSkVUYR56ZgZ+ToTATxL5IXMvG1
         W0X3vnLvW/srvqiqhsKUfO1v++MxnD6F1SHGk4LMP+k/jHbkhjF2QhufksAtPHRDZM39
         G0S5tYy3JKbptjriF2KyM1q5l8apd8aS92PjwvqqElzJ/0l43l+cU3CuZnW9/spf4kD6
         zl9wWsUHhFiffYuby1jXlUSBLSvDEiJfNJx0wp7ZhvbmxWdfzg8S5fT5Y141De7G9Nlo
         OcSA==
X-Gm-Message-State: AOJu0YxJiwi2rEa6nZSHCKnOh5N8cfL5QLoHdfwbGpWUuyifXdo0Kmwz
	w7xJsL3GGMgvC2La4VtglW49uVaaVU2MGSoeQP+Q28VtmMECqd5XNDsLOR+BMmaX/07+LQKVdUc
	/zVv0UktjwYafSNjo5JmLuy4oNvL71jLyii908WRZ9FYHAXFX7JnFxOcBzMoUcT/NMaWG
X-Gm-Gg: ATEYQzxEUzT7wz2AsfMPpQgwr4PkXrna11d4dZvpGhgCuLe4XkOnR9LbcD9FtoAVC2g
	LeBJtkQMQ7pao7BmRiYzHQ+xjCDkIGmJ/n+KeTABr5HT+5XvrTqduDpiM1HUWpqE8XbUrv/j1j1
	u4TY3hv+pLysWjNURiJyMHmsIkmjvk2J1SVcFJx9PbTWUQrAHLEaYXgBEow1dw5/VPPSPC4FoC/
	wVfE8NdWCswythNCl8uUyxOwouCHFK85ARPgruScHCO8HZMLD5xySnUNTUhkS8ZIkRMVLy6cXj7
	yyHgJSF7Epk7FE3VsqSAHBbvw9n7Jw+9cIIMPPnrq0Nnwtlkpg7DJUHk00vbwSwNXWlrUV+QMsz
	YDfeVPyD1GS0kCR65NxVnnaBvTws262MClpqxYfVTpUAG7ESWUl+ImBdmzGQar5rcF+lirOBNpk
	Zgpe4=
X-Received: by 2002:ad4:5c68:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a436f0bb5emr71493026d6.1.1775120003676;
        Thu, 02 Apr 2026 01:53:23 -0700 (PDT)
X-Received: by 2002:ad4:5c68:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a436f0bb5emr71492866d6.1.1775120003251;
        Thu, 02 Apr 2026 01:53:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec5c16sm66160466b.40.2026.04.02.01.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:53:22 -0700 (PDT)
Message-ID: <16595c9b-a59f-4243-9041-e6c52418eb56@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:53:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] ARM: dts: qcom: msm8960: expressatt: Sort node
 references and includes
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
 <20260401-expressatt_fuel_guage-v3-1-9674cfc0b5a2@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v3-1-9674cfc0b5a2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69ce2e84 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eTI-YJAz-J8MpRop-NgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Iu9YpVV3kcZ5GsdMYXYBo5SBpkqQu1DO
X-Proofpoint-ORIG-GUID: Iu9YpVV3kcZ5GsdMYXYBo5SBpkqQu1DO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3OSBTYWx0ZWRfX2BS4jrdZG7oN
 Jw3xnLbnp8+KPuCENzaE1JekT0U3EYSm4+nvQUI0q+bW7XiCvduaA6z10sHgkyrm9hGZbY1Ls7M
 MV5Sx1su5gdUTAFxTaHR+6cj5YwdZPyF38Dyvf1RZqx6sn/6Wt0uM23RxWdJE4U9DZXriFxrU6x
 4Z+r7sXDEUcA6Yh6qz+mDvSWCkn4Li09QIslECsFCkAf6QbCfx/e/O41XW7A3O9+sxIIE9CQoKJ
 gEwyiz1tR/sjbwPySUlATvVb8uX5Wdh2fz3RiKQ8dzixd+5Z/RK0NwNNbuQViuF64egWzEnwHTO
 CA6ZTBQflOGjJwFMSnleFn8GK+NYBtdVntGQN3ZIpQmGmRY34xx7wPJY/1+1QCFJga0av+i3xF6
 IlLEbkxPyVdYS7WJ7Gx/+6MrBjWc5Vg/L8VFgbNLs3UUebeUZI6DSqLJs/5oyxJp+umWuItUav7
 qD5BuP0UtXLR1u4XQIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101493-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 631D738661F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 10:32 PM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Reorganize the DTS file for consistency with other msm8960 board files.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

