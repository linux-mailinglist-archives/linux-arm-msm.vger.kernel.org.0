Return-Path: <linux-arm-msm+bounces-103065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOATKzX33WlolgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:13:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C873F7003
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E190730C3EB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB93F38E5C5;
	Tue, 14 Apr 2026 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnLp6ODn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aT3zwIse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088AA38CFF7
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154068; cv=none; b=PLbO4xoqLosgH2gHrly2xEnfIhkd5FP0JtRScWRrDQbEe/pWn4UrCxVESms1dWe5jDKP1ossoojQFg4Gd1f+3KRRQTtpxu+e4NLHSvxQYIUd+pzDsRhjbdVXzcV4LxgWQCrI1eXGF05QZM6nwhDeIznxkO4Kc4t+oImbkWOaSEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154068; c=relaxed/simple;
	bh=OLKOuGsif3V56u3r9kWEhyinaZAk4o5fTK6aRtlhGPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bEWGm5UHIRofUwOD5Ns4ZxwK9o4LQdlEa44YryjJkA57dhmOlXVcsB7Xn+ENquSE8WyNDhbnM0ChpvoWGFHJZwo1QltxeL6ZJDewLwtSm+9rJv9G9KuCVkYXLb4M1nMXKJnPP6HkVcXYNgQjC3MvZGmATielQ84X3+QhEZ6Fdt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EnLp6ODn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aT3zwIse; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6T8UJ2633484
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCvJGpb4ACAKcgA6XiUMvnz54WJai0NryWLAKWQbpm8=; b=EnLp6ODne3qDdvqS
	yIfdoQNxYPHN9fl6GOGTsOukGYDaKjeaXKZ1zOXLmJSkxUyQm7AfQYN226zNTQqL
	S9gRLD2hmdtrMemFRQj6MlnSheOKn5CwC8bWhRA4hcCDRrbfmmSYLmBjPYR6u5mV
	TEUm9BEqhc0UrrWFKUKOTzvEkvF6flnhQ+gVkTG52yXsXczYAPtZp2AkY3KMKU2p
	d8ZZiDix+b1NqgJ7bCtVDTpw/xMFWdwseFWzb3SkKzrO71xObNj2i6yty5XDU+Ef
	lp/mamo3HuYM3BU2kUCHH9E5jGNm16LRa3Hg5nc5uwdtae9uQAw8MMlSCv0jxk7C
	lXH9Vw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86c9qhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:07:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d1d81dad37so128234985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776154065; x=1776758865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCvJGpb4ACAKcgA6XiUMvnz54WJai0NryWLAKWQbpm8=;
        b=aT3zwIseGz8spfJWsIkHraVuy6K39GGTJTT87ooJ1+ZdafLEEbZkM94c442GJKINGe
         9oWJCLMSR//eJqBKXAy5xm9EnMM8+XLOHZsNr8xbMpdSxyekv0vjzNf0ZWTGIJS49EgT
         9h5pQ855BK9ecDmzHmQq7uTgi+0lcbE69sEalmX6rJNBckhle55WW0EQmeZ3sTLb0VWh
         mb65v25k2rZv0P0CGqwxbBHy+PlHonbp/2QtXcrzb7uPh/zTbMgPQWarDRjnIEQdTRmQ
         HCKDcrsvfBuDeRELSaGii8uPB21m2ehwD31D/lRboFYN0u1RUZTxIqWXJLOuCsWg2BUP
         LVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154065; x=1776758865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCvJGpb4ACAKcgA6XiUMvnz54WJai0NryWLAKWQbpm8=;
        b=CwkxgmGex3BupULy15YmzsFM2vXtf3h6mRqb3mNnddueNpkBPEBYA1UG25ELawZE/Z
         9PaN0m1R3b4K3eA1YFqoAombOfDnrpRKSQBtrukY8AbYrDQwdbnvD7YeH5DneFYfZaVH
         MS3MeBGWSCvhBOgvlWh+K3S2SAHd3AIuXaANd/RZGx5/pAfLEXzS3PTbyEiFMTdLb667
         ZsGZBZ8PA1SW/cH8VZCFmKzghekjWkOHHFQUHdx1cxYX6gXii1ylB+0+97vKZ4wtiWyx
         1DKmW/vV4BHXPl4Ah+64fAfzjKZMt8J5TN0jHEEu4i0tfAGrBV34A+lbpaZR88v2QCyM
         WSHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8siIHogoTaUc7R3pKgIm4UphmYj2ZLibTCjgGfn+IXWW7rij18Ql2F1lfRRkuHWXSlacexrghci+5G7RuI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj8abOTTVCglW4uwUabI3BSAbhdgZdho7VztYhpxtlK/4rNA6z
	EEb5XgHb/5yCXuVdMGPXuYuTwEN3TYo7tak7GkFPKT9oro25L8GVgeECJHa7jvv9uiS/qZPuPkt
	PAO9Ac+7BYitHt0NijS0sMqdJT9pipc08kIHi4z7iN151r//BiVSIajvtqCG1PGnf+Run
X-Gm-Gg: AeBDietSx9XfyW6StP5YhfKg0jB+Kdep5yQqii2UaaToG7XGMdez5K+QalSkC3cByzT
	CUOgz91J/BOqUSWDl4u+pBk4ZbIHUjnNNwhbcO7pwqsxYZZ5RhWfv2Yh3CiEpvMoF7g9cwmpmCb
	th9hqVIBwJRGQ/An5yzAhBtHg/aBWYOmJeDcsuy8i1J1CX3yPSE6swllzl3JWPHaregf8oX/2qk
	y5Jm+GneW9qTzyGvVxbnRsybWzyr/seZ8arU2N3fnDCqpstaz4NsNIHDG46Kep0cdM49acIeN72
	usmJgPVNsTegQf5mj+0mtB83en9i2EFjOT48oZFyCbtDcv4YkleKc9auboczu02o3FXWrRVH1kG
	A2em64JMHIuRc6cs7VPqI4nASATh6fJTB3uz2eWCb+pDVV246vVkHDY+aP6ME7MOCNc6jikkTRk
	gctAOon2A9WJhtpw==
X-Received: by 2002:a05:622a:1f95:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50dd58548f7mr167580951cf.0.1776154065131;
        Tue, 14 Apr 2026 01:07:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1f95:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50dd58548f7mr167580671cf.0.1776154064640;
        Tue, 14 Apr 2026 01:07:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5824sm376075166b.38.2026.04.14.01.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:07:43 -0700 (PDT)
Message-ID: <caa589af-f026-4664-8fb9-6b23b0e087f9@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:07:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
 <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TrUS08wIZAreg4j05aU1IIjdwie-iyqS
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69ddf5d2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=wxLWbCv9AAAA:8 a=cgleJTQgNJ6gBMWI9rcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NSBTYWx0ZWRfX1wkZXWiGRAyi
 nYdTuRf2TFpC9p4C8PtgxDdanMbCAh6MhiVGf6h+6EBJ8JcPudFMhWZtHT88EqdGxkrY0Ca6UMo
 y59ZSW7uWXGMqUma9lQCGRADK0wkTu/oXSZ4cyEdgeETkN+qrgQwQZfDPzlu4L5Ac8kUg3+etpG
 6MGKHpAly34HsmEnAIB01wchSztI3SOcKGniRdDmLI9BUorPLmxuH/36P4tBaA82cJiKEz0Abce
 hebZYnEAFxdzCDNVWw9be9MTZlW7/5S+Dnzhi7A5A18SUxYO/bfEusSM7IWL5ofSwH99GHsmGUQ
 ExpUmKPlboeQFfBCyxM7P5+1695BBrxtQRiFczpELov30zKCTR1GiZGFO+bB95Sn8ZyeWPfhu5N
 68/gnYQY6a4kYy19wyYbzYLPoCW0ihKdAXXHXmRWE4XVJJ0KYAp/OoPQoYNFHs3yvMtMSBJWmOQ
 YBKA6bfGbihejbrVOIg==
X-Proofpoint-GUID: TrUS08wIZAreg4j05aU1IIjdwie-iyqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-103065-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,smankusors.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 12C873F7003
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 10:06 AM, Konrad Dybcio wrote:
> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>
>> msm8960 uses the same clock descriptor as apq8064 but lacked the
> 
> This doesn't quite seem to be the case, some fields differ and
> apq8064 additionally has:
> 
> QCOM_RPM_PM8821_SMPS1
> QCOM_RPM_PM8821_SMPS2
> QCOM_RPM_PM8821_LDO1
> QCOM_RPM_VDDMIN_GPIO

Ah hmm, the MFD driver seems to provide *all* RPM resources..

Konrad

