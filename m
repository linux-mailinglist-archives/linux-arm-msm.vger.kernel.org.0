Return-Path: <linux-arm-msm+bounces-107836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AiUCzQEB2okqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:32:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A254E81D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBDCF311ACE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C4847D933;
	Fri, 15 May 2026 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBbZAao3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UH0iSs6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7900147B406
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843938; cv=none; b=BroKMWUTIHxuR7E8eRQMGwaN0R+UZvoO3TS6rk0Qb3wNDaWl9B32Ji4hfhGqH/IhSZS5btOdpJ+L/f1H9zzRr8JxJsXmSbzlgeLDwPZVsHoE998Bu0feC9ZwqP7L0+kFZPAtYqrgNZ5y5mRBzI31NiR2Sjgcf61MWpfKFfxaM2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843938; c=relaxed/simple;
	bh=UJVYFLt+7s0EoA6/cGgIfQ4tKtgAjAXLxZYsq54yp+c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mA8Tjmx0o85UUgz8CxGbZ7UzDyK2KzCOsSt5f4RQBa2CEGMks5zIAkvkIwqc9AHfGO5KypqFa6pzq3hGVnGiW/+PeSLDjkrlyTelDY4nIkMl9xrHe/OzpwPhelYHI/mr0/liFp9eaB7T+T2yN3xPxgFbkUa4z3Hyir7a2ASIc6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBbZAao3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UH0iSs6o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F51wOK4008229
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCGXkWeRm3I5kdOwASc8lBJELQDGMPw3e9LMXhleB4U=; b=XBbZAao30viDbXZj
	xpKBXDPxtl8gV4AlXbfxTZ6nVwKhUCVCKCKmrGDWJraArwh8WKLIzMERe9wzhytj
	gcU/noia15CYHRUTYz4KMOWBYffz3x2Dog6OrHMxNYw2qm0fVDRpgUgsnstl34ZG
	8TroHqRVjRhS617HCfJfwzLbsgCwgEER/36Tzq2rtyCAxBDw307b1+uAcRIPoTfz
	5hms5Bn5u0r27SBl83+EiG1KT9z06Fl20bTksqImeBdT4b84SLVmUs/bq1eyZjzO
	C+OVsxYZ/15p9OTiV5JNGUA0LVw/ZBPb1FnxGequrAGfl3yBDQxyyB7ES78zdc71
	w+A/ag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su0wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:18:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-368b0dc7731so2752464a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843935; x=1779448735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KCGXkWeRm3I5kdOwASc8lBJELQDGMPw3e9LMXhleB4U=;
        b=UH0iSs6oMs5StRuWXcOUWLitp0NfErR0IoZLOpvOvV7K4oKw2Uq5EOSm7BStNdg8U1
         Eb9g7Y1eUs+l0IZfsKDcFszG5GBImQ/MmPQdp4kuXA2Vz1lpMwiRWS8d70vjimngEMHN
         ZHCKoWkhzTb/wS5TobSHSjMj12ACJOFMZrsD1vKYWm3FK48cfuJUXZAobcBTNdwuJN8Y
         HlgSqOGyDFx3u1zorfQ02tpSr+g2bhJGGLM8cWePhxhPTDjqxit6enWby9q9PutNoUu4
         alQdER7ACEQghnnc51uFZxWWFNgcWCnakIIIpqLXjKqhZBdckQW7XTUX2vXQVUvbduv3
         niQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843935; x=1779448735;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCGXkWeRm3I5kdOwASc8lBJELQDGMPw3e9LMXhleB4U=;
        b=KIIZ/dr/WXV931xpk2klab7jSPGYLhyEYgIxGXEiCIwgvAKg/+J6Go3lMiZ0uyjRb6
         EnTChgU0QEcmMH94EjvmroIQsNls5Z/PoYp88r7fInMVwGy91QKfXakM+HVV97OV7cgA
         u/Hr1m/MAEGL92dhtWTd47gCoF8GPjsQXZ/PaANdPopskwNa+UlaIfZlrSXk2x/3X0q9
         fQUqay5QAqyAGH7v0JvXMlTQh+Vugzmr5Mc7nAkY5zNvTXMeb6h01wJguhjqnUPkj0kw
         Cz1vZQKu4p5khLJWgephLdvibztPad2YtZXPfViI4Ln8Ubsu/YC6GeUvniSuHLYEhDVH
         Kztg==
X-Forwarded-Encrypted: i=1; AFNElJ+oEsSkIpLGgVhSvx0Z7e/KtT9KM9kamQAvz2jGpahRF5I/qERVb5Gv8o0BwPLgA6QdHT57Rqv5gu69Wbr6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1lc8tyUFtRho27BgbcBHMdL54YRUSB5RhHQnpk7IkpSAFoSK3
	TbCRqR+zaWSgdvqxOvOfj6o4mSOBeAtL0cl+QyhA/x8Poqn2lD9ocq6vxJzv/P5pUwGJov4e10F
	d2YRjenrQs3N2haG+LM6RlqXNFV4OGk07LS609Q4Ewl8hFZS5w3dTiTYRTRzYz1ci593bvlm1TL
	qe
X-Gm-Gg: Acq92OH7ckuT08jRebxVbfqxvVc/eui+TPMuB73ymHlK4Q+d+zzuVQaYGNwD94RBDkS
	WNA4YniWf2aF5S8sI+WzEJ3IZiEOhFteDyrfh28B1IvktB7wo83Ur68d/uvseTk8pTn+daSRYuI
	d1/RNVSguhgbMwH9qUAotzhx0jeAZPaSMAkjbMgVVRNjC19QigCKTvtWjhiiW2DWHkF4P4Hn803
	Mt6zEw5dA/TnswFHVOSyddWRkEOjayuQcwTtkDwJaW7Gpz1gADNMcIPFmKNdmFI8nXREHe2gL1Q
	72U0oR43U6fUu1qUDoLKUDrtpp3fiD6FDDMzIiujj1y+dfZKVPXk3ni11TB4Gt7XZhTyfFcOZ3c
	KwG+2oeKPFAoLa1mORQsh7p7zfd0zfHmXlunC5ra96EhPt27dvqD0sg==
X-Received: by 2002:a17:90b:38ce:b0:365:fd4b:24f5 with SMTP id 98e67ed59e1d1-369519c513bmr3273076a91.8.1778843934510;
        Fri, 15 May 2026 04:18:54 -0700 (PDT)
X-Received: by 2002:a17:90b:38ce:b0:365:fd4b:24f5 with SMTP id 98e67ed59e1d1-369519c513bmr3273045a91.8.1778843934003;
        Fri, 15 May 2026 04:18:54 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126feabsm2470123a91.6.2026.05.15.04.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:18:53 -0700 (PDT)
Message-ID: <11c63862-5e8b-9f3a-5479-706e672879a5@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:48:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 03/14] media: iris: Fix VM count passed to firmware
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
 <zfh3hb4gowxejxeip3l24jub2z3xh26pzl5xmjhjos634c6e3u@y26yubeb7v33>
Content-Language: en-US
In-Reply-To: <zfh3hb4gowxejxeip3l24jub2z3xh26pzl5xmjhjos634c6e3u@y26yubeb7v33>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z5c5V3s5u3Q-jUkwdudhxWBkxp_spXJD
X-Proofpoint-GUID: z5c5V3s5u3Q-jUkwdudhxWBkxp_spXJD
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a070120 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Xy_6AgtP5T3jK3p2aAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNCBTYWx0ZWRfX5ROz8M/V4j2d
 yL4tVv9oXiD/tkkyTpN5YItBDcbcDuPwP7asn9bn0ggXwNSVkti8hLIAg9X/5t4nPpSwfCfLPfg
 IMLwfGFRW/W8hj4m27yerD9U4I7KMxXE6sSUQZzvDCNru1h+UGypDW+Lhy2iPHOsXW6CQOVRI1+
 11uHx/jAbB7t8yN6k3aVwIkkTbJRBLPRLx+rbSiZvMXnQtr2UFCapfpCoW9icVDRSzbN7R5lWaP
 T+ydrxUyVZyIzgBARbHPfdxPV3Q7TWgbo8pWIEdMDY8/DBI3dHy1a4fztDRq7qLSta4dfKcs3vq
 UycMYczL2zXoORdA4yXHt94i65tk0T4q+h9hmcOIk/gHqaUFn8AV9vlzZgV7Cp72mfHrlN9+40q
 ztOGlZgca1XXepb8Y6VBzoeK6nWs3zOs48yDpbRBGt11vZ3XQOjpdCli8+NR+6FfVaYbjwmpLwK
 YFAFDu64jeES8yZ+BiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150114
X-Rspamd-Queue-Id: 8B8A254E81D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107836-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/9/2026 12:50 AM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:29:52AM +0530, Vishnu Reddy wrote:
>> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
>> the number of virtual machines (VMs) and internally adds 1 to it. Writing
>> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
>> remove this write to leave the register at its reset value of 0. This does
>> not affect other platforms as only Glymur firmware uses this register,
>> earlier platform firmwares ignore it.
> The explanation is pretty suspicious. I can see this write in venus
> sources too and it was added in the initial submission, dating 2017. The
> driver targeted two platforms, MSM8916 and MSM8996, so this write
> predates Glymur pretty much.

Thank you for the historical context! I checked with the firmware team and
confirmed that this register is not read by any of the platform firmwares
currently supported in the Iris driver. Regarding MSM8916 and MSM8996, those
are not supported in the Iris driver.

>> Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
>> Cc: stable@vger.kernel.org
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>>  1 file changed, 1 deletion(-)
>>

