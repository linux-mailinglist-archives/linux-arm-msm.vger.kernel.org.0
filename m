Return-Path: <linux-arm-msm+bounces-104132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLBJA/XX6Gl7QwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:15:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB438447257
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A9AA3066BF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0023ED120;
	Wed, 22 Apr 2026 14:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUqzcDcP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDDEny6M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC533ED101
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776867037; cv=none; b=FJIqTOFwGCcDmJ0p634uLtCj17rSYAQYR8N41MaLTzdwiQHM2z9W8yHWRt6BLGCUEMjUvrtn3Mn8Ho0RdFH153Gh/SrD+ivcV4JYvo6PDiJiuXDZekRMsxISQ8bd6ToZmrmp9x7iskWmzoPO2VGOtgLCADbeWcvqchUYQvs3yV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776867037; c=relaxed/simple;
	bh=RpYjaPec1znN8luZVx9P1DlZtHJSoiNUyzaWHmQtS1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dz0QvZpMJ5CFF1JMaEB9iEZnoo2lKU6qJu/5b+XEqv3g84eXTIGvtGYtAMdLQMUBtAHTItBOk8KLbLlXXLyn5+c7NG+EnkzDhuvWc8pwuArM/tTxxmnEuxnwX9xWNq0gxwnFHuHUldn5F6f1u/fL9deCiQB1+u5W2jDsPlvehcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUqzcDcP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDDEny6M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAGSij4051047
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MQApk2TA4Kgh7BCHVEEKmfYFj4yHwg7EvzAss2naHg=; b=NUqzcDcPw8jga9gZ
	4tU+rB22SfcObJEAoSjEJS5RMxhI1sjE6EFy++ZVvQQcTVHkpk6VUS0wZ8MflJt+
	iWDR5o02Js5yadAzOHP0+1DlS7keQ9UG/ZqGLDu+g+4akJIn8WfxPUvQIld5ppNe
	8L3vAvsJzJ1BURQPm+r/n8qsfx6ACZk3KOIKm3SqfpioQHavkbzZ2hK255ErYvSH
	V9ssuqmozlW/qF9ff+N+SJm2yCWNWJV9XQVpySlpDwK8eLLQQsaF03ygJbzzZ1nO
	YKElWdS7zDngAeLxuNgthnJot+7EDL1GOh9KKXb5MvBgNPEjlbXOeBAHxZh3gn9x
	DjF51A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfksxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:10:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so6603328eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776867034; x=1777471834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MQApk2TA4Kgh7BCHVEEKmfYFj4yHwg7EvzAss2naHg=;
        b=KDDEny6Myvj1SAgsZim85hx2Jv2vabFYaTeKyTV7UuhBfvS/omelMuWDvz2f/yHJI6
         CDUp3PFoULmeNxOXCDpoJ7dUVR87HclZ9qsOfd8gIFHx2+TVT9FceLaABrrhstW/k6LJ
         hAtl51M9e3t/BYl3HnBtajECougB/tCor6oTLYSmnygBiUrYn3HXlOya9VpqOTEm/vw8
         wq6Om4YhYne06rtQm7WjkbIzZ6YgP58ygmozjNa4JjI9X9Q/I076Lwu3EjCDw3zY6Eq/
         0Om4qz0M1obdH0OUXDcauLunqTfiQ4x/F0S9nHiNffMuVsoR0ATogw24q6vQ0ytk/jd5
         KxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776867034; x=1777471834;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MQApk2TA4Kgh7BCHVEEKmfYFj4yHwg7EvzAss2naHg=;
        b=V8Mj79JXrckkB42ve5qeg9EMndvMeusatvPPPxfv94APF+dXtt8Hop2F4Zo6yGqMRV
         FEOAWnkss5Z3InG3XYtZZw5IWXyJ7KYuSEBDzKw/GZchNURnuFbAHtaitDUGjMjK7AyB
         Mj7xT/2LJHPGJN2b+OJykSAAumjUZLxzQvnGZZAHdE1UlBeWNhePOL1Q21x2FTlJVF/0
         bHSZfNw/OQZh7nR5ofTGE2Uj22ok8KAvULpOJJNyqgMdBgKX/PAoWoZmNm0hCRMZZ2Dz
         okjKthOg5C7+VEVXIO9+XpbuZVm1VdxLXN72EWe95g/rStxJPPneuv487u1M2TS71WOf
         naEA==
X-Forwarded-Encrypted: i=1; AFNElJ/OE8GaCNGeAhSIYmsTm6u5sKyPT5bFM3Qs1s72DsZxt4alZVXHVB4kWAoYZa1rK+jYewc/9MXLYH0/zM4i@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0jCaRdWFKPfg2YkEq0Jx0xh6kti/PjTiWkUkpmBbfRRurqwq4
	F5ih9vyiIpjcYGyVvP2Pm3oOBeMfcoBVc/V0GrVEZkKltJ2pRCkW4+GH+behEUyafXk/HI2fz4e
	K6YBX2kppVcbWLhtOxM3dBqGGo5i96jpEkskhKnVMtllyaYC8gr9MV9ENv91eoWja8rL9
X-Gm-Gg: AeBDieuZ/OP8gntalAIxK2u923CNSwEwXC8KR3Mo1YnHy3bFWazb+0YiO86SFfSNw+D
	8XMXxNKjNvN02ww2GoW6E8OgD2iSq+Y+bbRKSjh1ranGG0A5g7g5VxLGXs2ra9YX2fwoWWh91bA
	0s2EqpKXfD6lF6eO4Lz6gYGOT3usjIQJOZsz4iiIKf3jnC+lTH8aFxyQqYXMpdt26SjAUj1HcsY
	hkusO6QtpS5YZl/41sqqNq0XbZemcLwghwI3ntycMz2RYwFBH6PyI0BrMhfNAyFcAkXZv7jqpjI
	UBtnPG+oJe6v4mJCTo3k5HEwm9zLbPatJy8/YxzvM7wVqOV/6QjvscygtB8t0tdUuKcTriW0rCA
	4e7sb7IQJFqYlF6qBX6rQyoV6XyApA6cxH46v6JT4+DP2lQDJRymO1t6jM989cN4NgbOx/t84cY
	2HWI0AIyajb/Xa+DzC
X-Received: by 2002:a05:7301:f90:b0:2ea:7901:8d72 with SMTP id 5a478bee46e88-2ea79019c06mr2915510eec.17.1776867034123;
        Wed, 22 Apr 2026 07:10:34 -0700 (PDT)
X-Received: by 2002:a05:7301:f90:b0:2ea:7901:8d72 with SMTP id 5a478bee46e88-2ea79019c06mr2915485eec.17.1776867033456;
        Wed, 22 Apr 2026 07:10:33 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm22601241eec.2.2026.04.22.07.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 07:10:32 -0700 (PDT)
Message-ID: <58edec29-831d-44d1-b574-4dec8985ac2b@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 07:10:31 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260326043320.2507890-3-varadarajan.narayanan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260326043320.2507890-3-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEzNyBTYWx0ZWRfX1DDNtlyANQqL
 kt3Kp1qqmovcFoXavOayh8jUHSyP8e/ggbi1pd/Y137WaIdd9Kwqc+CSU0tsVEGdT0yy13ky+tD
 X555d/2BtUZ4/bxcf3gL5JGdrGGydzs8iTGsPin9CvaRBjMJzKQSOaxKUWLSywfrpjclB9+zT0t
 mPo9EZvq+Pz2QaXH6q2MGmKizSGMGZE5UPs/tq2FHjPoImnPzMEEsJHPUgQ6rQH5Lm9rAX5Ydwq
 mXTHsyLlXGKdQftZ02A4mzq06nsTJDNcaRANVgTga7UJZAp66C94anuWIHobBAF/iEiB9qtTu5s
 QiH2g5j+cvjI2rgEmZ1ImBfQlG4+C9CB6ZsxO4wFy3XBh8oHaEtVf/7OG3TOg8A99/rfwIO6AQM
 Lfk7lWAf7+00OWstSYu1dvLVl52vc5bKXOu1P2dJhBvmnw6WDWsuFzJHV2qdEKwL3AbT1l+bPiz
 Uk2atwl34/OfGS72bBQ==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e8d6da cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=K7Ul_5t053zlMiIs22UA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tqcRUqlhUVgqz5-sMQxGyYDvqNpJKo8D
X-Proofpoint-ORIG-GUID: tqcRUqlhUVgqz5-sMQxGyYDvqNpJKo8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220137
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[quicinc.com,outlook.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104132-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB438447257
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/2026 9:33 PM, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
...
> +maintainers:
> +  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

given that quic_*@quicinc.com mailboxes are being decommissioned, should this
be changed to either an oss.qualcomm.com or qti.qualcomm.com address?

/jeff


