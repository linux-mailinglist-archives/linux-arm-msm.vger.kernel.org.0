Return-Path: <linux-arm-msm+bounces-116894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ok7IJMPZS2qrbQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:37:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E89217135D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:37:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=enTKzA36;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GtoCMJ98;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116894-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116894-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D21038CE58C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0602D3A7F41;
	Mon,  6 Jul 2026 14:17:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AAD398902
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:17:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347473; cv=none; b=a/rw4xmITcWzDnhiEcuELw6H6TMFq4+hqNw5RnOP7gQcy49soeN3ad706reJZTY8ElVuhuWOXka74+Bg62x7+QE+FJHnJkfKHVRYxCl67dPPDevjUAn1tOOBjgejg6bm5nmWg8SpR+IZ7oj80Pzzxys8rr46i0jiidePwK9u2Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347473; c=relaxed/simple;
	bh=/zUH/jpDDNZ5fLxngC5Jn/a2YZL9l+1abNh1pzi3D/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oku0kvq3KIpMpxWG6dS4WD5DiF25T8mhcPoZJlmsmE/C4LieRs2LN1EjTPWD4Zr8wY+sEiBZDo7oWzPMIpi0f4qjXc/q6zDi5qgd7xL22RxfyRjxs92b+5zsdIasuAaZC7bDeAVr8KemnEVYRZOTNIOmyw5tGnZQ1e9kRXV4SFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enTKzA36; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtoCMJ98; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EDwGd845322
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lguh6kwdApu9mviovP424lJBRMyjPoNgyKby0fvP8c=; b=enTKzA36S2pPgvvR
	9Nje0Ce8WpGcbwfagojt4dqI1aNOXELm629WH260ZXTpz6wwKQg9SnjBulj4PpgP
	IGQpgQ/CrKaveDY+kyUB/jOKA3uVzUtMW1XOdeadgZadE/1+sQkelv9z+j754ov+
	Sm8JZTTwrnY+qiAjl7YHtYs9KgXipbq8u+lSJXSvjZ9ztZjqwIQZPCNR7ghNgZO9
	hIQ7d7EWTrwyBPAyT5rGpxb2SHYm6JhiztQbr/8eoN5S+met+H8T8ydNhW+/4lB5
	SEe+iCKxOglEiIG+tJnk+w3qevtOZVzhcnwjuAyPFCTLKWeDrMO0Mqpejw7TgFdy
	/PWcKg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gs2ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:17:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-380ddac2b02so4539236a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347471; x=1783952271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lguh6kwdApu9mviovP424lJBRMyjPoNgyKby0fvP8c=;
        b=GtoCMJ98cCdTkjfsySLR2804o2oFCJtEXfjvhxdluMKe9k+nGSj/+dyA3QNw4IrB8N
         iwauVJ3tR7eACYdOD5mB3Hwe/14tdIepdeeNkaC3y4TNaf+r1hx5YTK+9X+Z3IT2TT78
         sQsTG/XXwKN2D3ND/a8wXXv3HPbbBhPTH5EumHR7FSx4U9mWC9jrU/C4VXLA0G6xbMyO
         +N5ThoAyJh/3NipAq+8ebqaRbrrdW5y1kiH2tTu0Kmlip4LwcG8xHGh2ByF8ix2E1QVH
         E/1YKvpzAyhal6eM9UgWWGm8CuWU4uNNbx2thWTaw6rdD/3mck1lrBxWW/Iixxq7km3P
         XnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347471; x=1783952271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lguh6kwdApu9mviovP424lJBRMyjPoNgyKby0fvP8c=;
        b=W5NuD2GKfHI6CIsho45yG5b/xI2+iJzLOUbYMu/oTo5CYuRctOtz/97WYHeBiwxB4x
         geh3RuzHBUzrIbqzX+6ap81Y4h4DWY0D+FCvqPEoEuVnorZwu0z2Z9v21RzAeDxb6aSc
         ppY533NyyCVga5Z8iOLlSyRs+elf9zrXl3gqMRmOLqvzdDc3l2Z6HEJUP1IZ9m+i7jXS
         vF2Vjq+dcS+t2TQR6erDDhHkYRTq9iwK0/5mutKvLW6G0bs6y4vLyuCepBN/EqY4HiM8
         PTrNwh14byowzXMMv4Oh6CG0oK53p/Nm1XF2MaAQG3t4X4GfCm1Yx6VYQr2wmNFVmxEL
         udTA==
X-Forwarded-Encrypted: i=1; AHgh+RoEz1ss7umQkAizM1S1919y3+oC4J+7ZLL5UOt8wr7fe2HFt8rVx/MwC8ALksIDKnfNB7Ne2YXcSa6zETrc@vger.kernel.org
X-Gm-Message-State: AOJu0YwsIVJW+mU1OJfWF966llT6vYwGcLR520l2JFAnK3VhIDrDGgNj
	h4p6yu9KHv9wPH4obIrbGuWzvlcQEovD/IcuveFtItpH8/R9mlZddrrR/zAR5neavS1nxd9BZzZ
	ps282VkUjN2oOngBrMjb0Mjh/cwcmd2nekXpNfdikjNr4iIfx4Z25Je0DJNUgAqblUY5X
X-Gm-Gg: AfdE7cmXsUhpkljY8k2npRFvHKkof/D+xUlfQkUrT/K/kcGW8inyjZog1XSyQPsEOH2
	lnaJ2IPYqHrIMo2dP8j2Gc3rrCRXC2IJjg11upEENwIW0xQdNW4NLU9HOJsiotv9evv119UCyT0
	ejfEuCMsQw+KUw8ZXjdT3bMYWdkTj5I60nPY55HZBO/Y0aQemJFxXZ33SwlGMPcNg48f3vt63tc
	yfydtvfyRlSp/uhA40Rng9LR1ELHxrOLQLAcKrc9ESLjONaxxK1ysETQJfj49B8awZ4+aBTsV8B
	jZR8u6JCoZ2R8v9ri0LqEdfhaUbYQIAqMjNYFpefjFx2WxHoy3rZIttyHKR4gZbaaBwDg2SaqWU
	u9IJJgnMGYAC1EnjNU2NXDYGHcgAvsI9EdldopNBdu6Mr
X-Received: by 2002:a17:903:390c:b0:2ca:bb7e:29a7 with SMTP id d9443c01a7336-2ccbf072df0mr8579755ad.41.1783347469560;
        Mon, 06 Jul 2026 07:17:49 -0700 (PDT)
X-Received: by 2002:a17:903:390c:b0:2ca:bb7e:29a7 with SMTP id d9443c01a7336-2ccbf072df0mr8579135ad.41.1783347469032;
        Mon, 06 Jul 2026 07:17:49 -0700 (PDT)
Received: from [10.217.217.176] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7872542sm51500625ad.68.2026.07.06.07.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:17:48 -0700 (PDT)
Message-ID: <66aa42a7-4412-4366-b2f4-eff1c58e7454@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 19:47:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
 <20260702094056.3755467-3-mchunara@oss.qualcomm.com>
 <20260703-loutish-stimulating-hummingbird-aada5e@quoll>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260703-loutish-stimulating-hummingbird-aada5e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3y20ZzDC5H7IxYqRLJWcBu5E5MjN3Wcw
X-Proofpoint-ORIG-GUID: 3y20ZzDC5H7IxYqRLJWcBu5E5MjN3Wcw
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bb90f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BLcM3S37_I9DteG-41AA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX5zEi0gub4crg
 6i8J8QC9w0kBMKqMl2dQY9l2L9ENNd/YknRHe6IAfwgwiL1f63Ta4aw0IqMLn+HsPdZq9IELulV
 9rtidbhafckGBm595pgIjVpsO4vZlQxt+cmzhkpL6bKzPl51a/p5S2NyniaLoeAPGcSIp1hv7CF
 egX1REgPQsbHNS1hx/xlUxQGhJddAPxlO9p06FQuQjauGLJVjyTbUaYelfD/vWaE1pAjgWgVkfB
 cMiacei3+A6nKI18ooL085jZND8xXH5ABn3yWy0Xk1F3iZK0ebSWdx0WoPGPd/9DarXZZLav0Gr
 vncw66MKFseqvIvPzIyFnBJS+2yJVjnLPp7gP10zlnH5PwCW2I7d4pBA8bc56gi98Qu7J9/f8VZ
 0EcMwprVjO7E/I7j3V02EeUwacx7ylPVZaCZ9q0vyVgdPjj58oREs66kXYR1qC7YzSZ1hxZUd5K
 703kp0H/H0H9CMhQvbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX+5/fcEomiXu6
 gCPErCaZ2J52vhgRaX4kzYLrodkdL5uzfYkm1lVxXEcgz5D9xcNz8OFHKk0GO+teGE5bf3VF6ZS
 zzRD3UgQBbOzR8VGvX08k9KKxSZuaDQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116894-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E89217135D8



On 7/3/2026 12:40 PM, Krzysztof Kozlowski wrote:
> On Thu, Jul 02, 2026 at 03:10:54PM +0530, Monish Chunara wrote:
>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>
>> Document the Glymur-specific SDHCI compatible in the sdhci-msm binding.
>> Use "qcom,sdhci-msm-v5" as the fallback compatible for the MSM SDHCI v5
>> controller used on Glymur.
> 
> I do not see improvements.
> 
> Best regards,
> Krzysztof
> 

Updated commit message in v3: 
https://lore.kernel.org/all/20260706141346.4180348-1-mchunara@oss.qualcomm.com

Regards,
Monish

