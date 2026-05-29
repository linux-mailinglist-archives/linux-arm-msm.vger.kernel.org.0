Return-Path: <linux-arm-msm+bounces-110305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePtYEBitGWpEyQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:13:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C99604608
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC9A031BA61D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE62365A0F;
	Fri, 29 May 2026 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBBCHTOc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3UIN9uB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12338262FC1
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066765; cv=none; b=lBFNBq8iBEjRNRrKvHfIJEvlOzqlyh1telccqobrm61tgdvJNinLAXZbcRRCZm78RAsSGTuQyQBVKBMxdiZYgrRkSX5r+vIu7kUceezlbgvNXnMim4egj8ky5YxybM9B1HPB7qvz4TxoGoBPxZaVcflIfUvB2yPLciUvrBMxQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066765; c=relaxed/simple;
	bh=LfPYj5e8/zw9cGI75cLdnQ3ttyAfynladftm7adJcno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVdBHEA8b5FaI2zKP6mDfV+Xp01qxiI/cjD9rgfzVUXfbnPJZWm/+krZos8FArZafLk3U0eWq3SW3Xqq+BRcbAyYaifx1221kNREDgfgEWMfuJ+sYxSvx+17j+FWil9RjvftDzjyETtfb1Vt+8409oDusq7X7lhWhXJtrX26QvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBBCHTOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3UIN9uB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLGNS154898
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfPYj5e8/zw9cGI75cLdnQ3ttyAfynladftm7adJcno=; b=dBBCHTOc6KyVWWkn
	Qj73bATiXfDeniSqg95Okj48ji+dNUn4uI6iIygFvVXmB2rmX6ID6yhBgFhwhDIZ
	BB4zmtjKkPzD7tuhu8nep37zBrVjRkor9dBsaJUTw2YrMoYyLzcyR7avOBwDOxud
	TzeCFMG+a9u4LQc7DjwqiLsDWOuriazD/o3+GrJTlLe1KdKuxpSevvyhzvKi1pCs
	5D/6o6DnWJniKjvcQVl0WafeprQi16HFXOoXEohh1coAIXsLPXQuPPZQj5jnFX6M
	X7uOKnMN2WKpowL8rr3XHF/W0QQvC6I8pI5nTeg+r8gV9+e3AsZXVgL8ocQJZxbl
	lI9xlg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eeuy5cam4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:59:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36781927b4dso8560281a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780066763; x=1780671563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfPYj5e8/zw9cGI75cLdnQ3ttyAfynladftm7adJcno=;
        b=R3UIN9uB4hwo8K8ZQRscwg9W9rI4TtoAw/w2ewILD5x+6IkvqKrAGSrsG21Zb2LxKZ
         VKGXkLS1Ru4cqV/zt63MEUF49ozBB3JGD8Z8A7LULwmT/nEOumzboN9qVo+z9V1eqUVT
         sW6neFr7/QHPow1mZ272ZtA9MD1VEzG2uHsjgv3hRIzUvS9/lYTfK5D4Zyt/9NKySEQe
         8nAa3Eqf/lfO5x/SN35MwsLag502oqNOIW5u2FaAb7xG+ijS6JPbcAq0M5h/Dxe9T2hl
         YTKEvfxLaX/PQSvDipcfiChqOyT9N9D8NKjYNOEQllI/vHA+3Sw335wLNhwJX+jAdiUP
         5qVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066763; x=1780671563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfPYj5e8/zw9cGI75cLdnQ3ttyAfynladftm7adJcno=;
        b=TLPkqzYsJ19xihOuNGd/3PJCsm4ueeaW+4owVnh2X2Kd4i2nglKhdxPI/wKvW9Utt8
         PmMJYPumfIAZ0N1FpBtquK82nlb4PNd6AaoeUe+4fw+pOs3ViryHabvBQd6d/2JNOBTW
         dRzMhWrEEI347QoMY6zrMZ21CCXoBoQ1Kc2biUIjjew2yZsSzfd2nm5k0eMjV4oCFfTj
         VHC4UWe0DUs8kY2xn4izOFnwdXOABWZZCPqGTITGK46kiHluTZASdv2U/u9+FWZkJEfm
         MVIqR3yaqhlncQevthEm+FFkMXG72GEC4sqUM28bn164QvZQpmS/7XI5nwOp/xPC7PVW
         TXPw==
X-Forwarded-Encrypted: i=1; AFNElJ95xfuYxTTPLDTtc1Dz5tD79V13zM9waxmQrEGuI9ksBt80/2ue1CJItLDC1QVxNDWmYOr0fshjzmhaTS8o@vger.kernel.org
X-Gm-Message-State: AOJu0YySuoQseDyRryM+G/1Y5XwnJPa5nDp7KZomh6KMVjcJt0DJJuaf
	FiuLm66edMIY7PhGY7i+Q5t+eJFDIPPxQA8MqukgP5swUufv+wPFNo9q2BPyJpelRfO0SoZqc7+
	m8Xvt4PffoMpFJG2YoYD6hZuUADX0nT2pbKEnElJoRDUBgqu9Y7D9X3fhvLFva0lum/wQ
X-Gm-Gg: Acq92OEKyE4jJFdLaFEhs8qMRZpNbv6MEsSkIDh1J4KMhlB1o3IKngmiVecbEixpQO0
	za61kWjmRuxEfowrqX3NKVn1ML4xhC13RaJBaJd/P819zRsnGxbHVaj07yecnKt6JGYBh2VBp6S
	RpdFG62Hf4LHOzWmVMc8tVnrpzO0NLvyIJ1vOIN1eVsPH9g8R8p6Cpoy9lnx9Ti2RFYX3KwVwmY
	cZ+Lponl+k9S61DXv2jMt6jwTv/XiU+Tl1JFzUzIEk2AX+IrxRdFGmiYmqitO/f1D18DgT448gG
	d9EIm8HWfFWMHWPjvp5gozfIuQaUZFhMB7ldeGiLX813AOs7WCsUf2CkQO+CnjyjVyu9tjrFpUk
	90DGHv/MORIG7z++OU53fDQjGBDwjiB9mVZCfea70YFnFh/eAMW/M66SroM6KhOYPtA==
X-Received: by 2002:a05:6a21:b84:b0:3a2:d838:bfdb with SMTP id adf61e73a8af0-3b411deb1b1mr3867893637.29.1780066762723;
        Fri, 29 May 2026 07:59:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:b84:b0:3a2:d838:bfdb with SMTP id adf61e73a8af0-3b411deb1b1mr3867851637.29.1780066762292;
        Fri, 29 May 2026 07:59:22 -0700 (PDT)
Received: from [10.216.22.197] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c858108940bsm386644a12.5.2026.05.29.07.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:59:21 -0700 (PDT)
Message-ID: <df7cadcd-05f7-49e3-9758-369575126292@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:28:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add psci_sys_reset2 reboot modes for Qualcomm boards
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xin Liu <xin.liu@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPtykuvH c=1 sm=1 tr=0 ts=6a19a9cb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=cSNgkP9xN3AXbRQt_EoA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 1vU6oGaXS0l3alYP7jSHeMKu7uOizY5i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0OSBTYWx0ZWRfX6o0BPPP4r6Lq
 9YfGuvSc6zgzRS8kQruooZBjmWuW7dgISXDQ5d6fi8XgcuQWMGQBy0NUpPTm/i+aY6A2A6075bT
 /TlQlf/69aYl6OE7IX2D89RcgabBCv9Qgwc2u0FocwKvljFIryXp5zc47rwTtxhpXS5ubE1nbLG
 fxuHz5xx4FngyD7iDksqeNjXH0Y/Ux19hvZ9T4C53L1hCunqhVnIbxpIeQchfEG/4a1aYdKt8FB
 yvIt772q8UTmNiWUrI7XUHVeL2DEGQ8Y0L7p31G+ntwULyUMq1stV9gXyf7deXnGV0tH8hIGJge
 J71Wfz1ual77Wxog7QLyOmOlZ6Sa2ZQ7Zg0f+5DJA7MpDQTeeXyJxPFIU6o1cxL7foEriBYI9kJ
 0vvDTwgaFwlDBiGltGSs0cTkp4dB2lPG6KJp+kDitbuoMXIVB/t3ROCNf75nzalW65NIAbF4SrD
 VhmgqpPmok0w97BPylw==
X-Proofpoint-ORIG-GUID: 1vU6oGaXS0l3alYP7jSHeMKu7uOizY5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110305-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[anurag.pateriya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9C99604608
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/29/2026 7:41 PM, Anurag Pateriya wrote:
> Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and
> kaanapali based boards.

Please ignore this patch. I have sent v2 fixing the commit
subject line.

Thanks,
Anurag Pateriya

