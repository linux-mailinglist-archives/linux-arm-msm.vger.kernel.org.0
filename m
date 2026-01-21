Return-Path: <linux-arm-msm+bounces-89995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LVZFly5cGmWZQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:32:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 98784560C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD010946D26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1544D43DA2D;
	Wed, 21 Jan 2026 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DegJO6YG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3dh4C18"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104643ED12F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993985; cv=none; b=rkZNRY9Mcea2UN/RRcbBw7RPPj5wuK6csVE9dE+vz69dGiCmBuhWaNEi2VHPEoFD+t/b9xAi+Bws6xGm1E5pGsFcFm0rztPt9TUTBohecvNUTU261bZL/IuVvuCau5MCXYrrrQsi8OeYJKkm0arAbqfqQZwYRgLOrYh5IVczyk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993985; c=relaxed/simple;
	bh=W82zO5p1N8qPAJFgSgyiE4He0afarAefa2tFtiQzfpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYnIeh6VrU4oDa84iOpvSKKVW8PIYhbRBLDlgOO96h/BSMTNNI7QN77vJsUypU9sHebFEbFbMRVtzag/bEaCBlJ4vXn8yn6OcuM250oNCVQC5udeAwPrpoko5zdgbSSxaCTWoKky8Ff4X06ThoWfIoLlHq/UoC9E0G4Knk1kVw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DegJO6YG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3dh4C18; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9iWNM3481473
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xu01O4uXDlSEGNGXJLTTg5rEF5Hdh/2ZsLcSSMpmGZ4=; b=DegJO6YGfHgx/fv5
	uzo/fNb0/Kk8VK7N/zSFyOK3B/AWYDHRg1GNcqYXADqBZXkF7uH4YtQz2VzUsGc5
	O0Uwb5omNjzcCiHomKLQpmd6SSSHHqyfZRILs8JxwBeE+SbkhflNFYw/yeYHM7lK
	MJU5VcB6V40WT23NvadPJP9WZN67L7PmTYuZZm4J3TXzWgQcZtntNtwtcsbZtFHv
	N6KtPzEWtCeD35+19CC/eYvAk0eCyKvZLW8Xz4H5DlUUmoJXOVEo1NtyXT5Lyf2s
	thoPbRj+SG5LV5BwthYA0VYek0/jmV4JA4ZkAo7HpsDOw2huXmYC2fDlYIUeX+Us
	ubZGIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvef0b9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:13:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c53892a195so158849485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 03:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768993982; x=1769598782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xu01O4uXDlSEGNGXJLTTg5rEF5Hdh/2ZsLcSSMpmGZ4=;
        b=B3dh4C18TYu9IZRcyY5nWuiiVkBIIFKVzof7QXTo3x22Tmq3J6ImYqoMPrkB6Jk8yI
         caEOJ31w5nLXXd/QZfYsqSe/AYaPfcgiRTpkG0RLNnKHc4mbWnfL0mxddMLcWNb9EK2A
         McFrhEq8YNmuK0Q4qLEvlkb/L62d5tDCWGmFGnagv5OX59PQtgpSbcag8XAu7T/Y9d9A
         J3jmpioA3enaKFkUwgNd+POxPzC/ZesKq0GRt3IHjMOnTJmgppw9y0E9/AFJ8dPJd4PX
         csEoOIW4E1aAeJ8vDY3uwKpJB1IlHa3XEE5VSwYrBnGCDAyn+6c0kF/580b0PR59Q19N
         IHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768993982; x=1769598782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xu01O4uXDlSEGNGXJLTTg5rEF5Hdh/2ZsLcSSMpmGZ4=;
        b=ToOgX0eP5tB2UkWN4Bcc8A7GamgpLnhr8ygm1FnAHaOPRidbBi29SIfaS5EZXw+TZY
         vovHTcrjQUGLB+ZyqR1Qv43/t6l4DlWqNUEWQipQ3pDf+Lh8gsEbNSIaBrA3tmiqOAEi
         JLF4DJp9UZ84D1DaKpPMKH8pWeuw8KE7xQfZvPwPf2EtjYyo3a/+0xXMqVbPkrL4mYEV
         IUU6S005udWLzMDueTPt53GEqDIt49NiV7OuflAfaTtXOVskJRZH/e0TA7vksLTOIHMt
         lqNfQQ1osoHsqO2KrYWXXm56lxH7D4b36Y8QtB6FYqYLG30J7DivVeQICdKgGwOj67ef
         klTA==
X-Gm-Message-State: AOJu0YydfKdIS1WN8xFph7tX0WSI0IJXjFTx0vXCyy77F6wRSnS0r9zY
	78jaD43bvCM9e0YOK5hrU73oChvK3jUOlEMNICQPuwNAwuJLQ8AWuFCQFdR/BocFLb9YcM00sUU
	pk0goHpnnqMti470DVbmgPiKB+kU5Mf+9egGq5qpBVuEWTeKwd0Oln6PWJNDDdEjo+EJe
X-Gm-Gg: AZuq6aLj/wraGhbwKhNW9Qs92IPBV4n6oEFCguKAwLlEd2MJ9q0UPa+0uBB5klTcAvM
	ANXzSlxyLP1U4+gktJYd79IX4zEzTbpBpVXJ4LTde3Xwhs1tyJqAh0eeschJMAZeKpVMVXMzP0H
	sYWVnxYxaRJoN7SPIL8YMSleaOnnHrMBRcL05WW2xogMJt/MKFfYDpk1xpE5ia7KUxWG3Uoq4DV
	WwjDrFDpXTmTzAwvYb7C16RvJVih7Xvrz46Ymy9c7z5gX/bDD0shryLmoFl8p4vfLE/ZeKoU+aq
	oqLq2lNEy4KkB9pZ6sd39s0/EAo1+CRGIYtUydwvqd3bwFC2O4QqD0jD2IskuDDeJDsQSjZuz70
	wmqoEwVoFkQ8LjA115j3LRwVDJtP5yOmo2VDxN1DnD3aJsnu9JNDw8jedyLMu0Mtyric=
X-Received: by 2002:a05:620a:690e:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c6ca431652mr625886885a.6.1768993982480;
        Wed, 21 Jan 2026 03:13:02 -0800 (PST)
X-Received: by 2002:a05:620a:690e:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c6ca431652mr625884685a.6.1768993981964;
        Wed, 21 Jan 2026 03:13:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6580781b7f9sm2482875a12.17.2026.01.21.03.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:13:01 -0800 (PST)
Message-ID: <4ace788b-6664-4ea4-a24f-f6a5a2c89986@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:12:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: qcom: Add Eliza pinctrl driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com>
 <20260120-eliza-pinctrl-v1-2-b31c3f85a5d5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260120-eliza-pinctrl-v1-2-b31c3f85a5d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7W6Z_zmAdERXIt-3Hx7K6xNrnUE43JWB
X-Proofpoint-ORIG-GUID: 7W6Z_zmAdERXIt-3Hx7K6xNrnUE43JWB
X-Authority-Analysis: v=2.4 cv=CYgFJbrl c=1 sm=1 tr=0 ts=6970b4be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KyTfmqBV2Hnfq8PbPJsA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5NCBTYWx0ZWRfX25K7Q8Tt7Uv2
 PsF2D4cwIvUiJHdn3kRW5WFFKq8uWVp3cUbTZX2kshimoOfBg/juWF+MKKdv79de6+YYLUQrG4t
 o8n/+gX3kEV7b+WMrn+sZRU8DhMEom7iMAuSIRcD5h9WEpurY0vvjIPayL4glCfLQEzTxzUm8Ic
 Ee6nFFzrFbKlZxVl8WIBIHW3uEoTrwOlEa5J7QBNOJSlOwk64V0+YgSjMfaZt5RMfYR8ygmgGy+
 X15eJrFaaupf22GC6pLf5nOQaO3fHY+CtGSc0c/9AlSvgisr8zn461OLmg3cmqdgFf0bIbZzbYx
 IRPE2L7WW87OnMq+MCIoG846SJhmPKRKbPdD7/JdTrDZUN+18YTJSx55XqwGlDxv4XFH0BLaxq5
 8MJ6EYXzS9nqZPAtoGKO6SO6fCUCZrLOdB0TxzipwrM42lMvRXjRRHHM2fL2NS2yErui5McV0XY
 eo56TqU65Jyv6bhMRTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210094
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-89995-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 98784560C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 10:56 AM, Abel Vesa wrote:
> Add pinctrl driver for TLMM block found in the Eliza SoC.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


