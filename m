Return-Path: <linux-arm-msm+bounces-118218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jDY3EFTDUGrW4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:03:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3592373965B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:02:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JHrwiu57;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iLzKRwRO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118218-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118218-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 476923015199
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B6E3F9F50;
	Fri, 10 Jul 2026 09:50:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7873F9F41
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:50:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677008; cv=none; b=RGLJB5r6qIr/LeZ+Lnzh2uIqgIb8N2Kbeocc3gowF22wn2Rktvvum2NTuLsaCgf51DjfELhCoWzIOgxoWNH00peoQI80hXkibl9WYxl7E8ubJyi1wGuyi4c+V2dmwEXykJfDAZrZc2TIn0znQ3NcvOogqqs2kIuVy0/3STiT39Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677008; c=relaxed/simple;
	bh=LcLvysn+yktuqmARlxJyynfMTIQ/qlu7hdCwU323+Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNqAjbBqj/F7yZwN5s5VpSmyWCg9SpezCN8EqjV/Or0FoaZ9x7nwgN2Ch4DtsUSlNT79aZmICkVExs+08SyKqyosM3Ry0HUjbmfw06GRRFIMY5XkIbcPVwg9fg4sgfkphedY+PYT+Kgd4DK7OXJqNI0ijC5zlOCwGQVUzomLqLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHrwiu57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLzKRwRO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eGiJ190702
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDV19J10GNAY9F8x0cOrbQUm18dkq3n9hszCs0LdNhY=; b=JHrwiu57lKFsthki
	zJsUoa4pfGAq060Xsu7cyupua7vkdqYsyEDZeAMi2JxfUillZIqDvrg35sYqzR1m
	1+eg7gKKaI/mhpgfZ1+ve0M9sSowsViWDYtopvD9Pmw6yYvqRO0zap2eEt/mVbB+
	LTqGHDrcuT71adZduGExIL6++LhcpQ3jN00R891x/ROiCowZtAbEyz9zK+IZd9bf
	WDVpOO3R3gsq3iAfVfG1mU3bbGAdvnW4+LXMkxuYkgqzoG4rGnUhbbn8ABj3YWbp
	2Qz9le3nxTAhoFMEVd02EojzhuVkk1tRa4DUzbRxfSFBPOlIbfmW+XjwqkMqAQ5n
	gPOC0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n19vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:50:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9e97b626so2397541cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677005; x=1784281805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDV19J10GNAY9F8x0cOrbQUm18dkq3n9hszCs0LdNhY=;
        b=iLzKRwRO5NtAaFzOr/J53K5iGZO/l9gVzBHZAIB3g+KTXCPFLteom/kG5N9rCM95tS
         qaDW/ZxB5r70bvWxiF3J7ewYAhsGk/7hs7d5rBc3D1R0jqSSF4CkYH42ncydgdBcGPOS
         NXwbKFlH5y9kYBIcGqlFM59Q/h1RI0D+0dSjR2Ty13gbjYL+sQRft0whQHtEL2JzATY+
         2HZZBeNXDaBR2p9ULu+dmPPGNZK+eUCKRDEcQT7xjlM8MnbaydQYFw1V+ki+kmGZ5kvk
         h8Km13fbj6tgvZh2pb467fwQL3gTzrDFllT8pSbfJKgbDVZJnWwfquuAa9vbRMwbzsiN
         6X2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677005; x=1784281805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDV19J10GNAY9F8x0cOrbQUm18dkq3n9hszCs0LdNhY=;
        b=GTw0s1+vtutaQu1QD9/cI/geh3mWaDZMz4jFTemeTSyN+mAwW74w94wjCLZNZPQWjk
         iLPb2phG9O1SB4QvsipEQCKzOKVBcxL4ArNZc+wjfqInz+urCCVJh3+xieXihmUUO0Ji
         gdS76av0olZFPhVyze3pQnUBpk+/IcqHvvvzDme8fkLMs+hrp7SCZkTDLCYdqj7zEV9z
         Frj6zv/OJ5gWh8znQigI6sc+HGZndF1VAdaF7yYnjsHYNhYZUKPreVydbK6fd4Vi3iaA
         Pc3LfAp1g2R7wtHcEgOr5NaF9esXIdIUE9lAw0UHeR9b9+EFPcGf4muBSoiITuLg2YBO
         T1Qw==
X-Gm-Message-State: AOJu0YwmF6Ktd4VbPe70Wz74f93vScOSq7Ggy74g/UYZTEPDppGGqZwZ
	xqDRTOxwlkcBKhkKoz9zIRudppKqQeuvKi9GHBu8ykJHnMZVNyNc3BCwJyNjMAAgH9Kif7mVH1j
	VQGy3wYqsJT0OgzjoExqWzI98bNIMUL5Xs75VQW1cyjzswJGkAfAbWrwK3lykG+RMr9So
X-Gm-Gg: AfdE7cm4VmRZBAAA52g8FPKDW0MhqM1HFtCxRX+kIC+ZxBf05GLUXAnqmLcQJ2gg/fc
	reldw1T+x1rQPfjNBBSxV5GjISWmo42CWqGnVHsugi/w2ZnZ1iQB1G4K/VhWeLpCRJCMNi6mPGV
	uueIWP8CBdw9+aoFg5rDgsA4mpr0levU+sFxHhqdojinFMUJrxOthsrM8ZqDgGRp+MvOuEtrudT
	PIRLW+LNoGXfywb0uf6/Qc1zaArKAKBXZzLF2fc9MmVP+ygfcgXWU9os6cBJMCm0puvbj9djlO0
	a/4akmNMRM1zHJcv/YVIulBhNLgHlbB1nGlrZU0AN/Kvlx28tMyzMMP+E7xEhnrEs23ctojXaeD
	1VDSaoAHXcB9ZG5QeZ6YopQ4W1pDo1Yv++bw=
X-Received: by 2002:ac8:7dd2:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c967ad1c5mr64466891cf.6.1783677004723;
        Fri, 10 Jul 2026 02:50:04 -0700 (PDT)
X-Received: by 2002:ac8:7dd2:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c967ad1c5mr64466581cf.6.1783677004229;
        Fri, 10 Jul 2026 02:50:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm10518512a12.10.2026.07.10.02.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:50:02 -0700 (PDT)
Message-ID: <8870479a-7ff9-40cf-8298-1cfb98d1b896@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:49:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: sm8750: bind traceNoC on the
 platform bus
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-4-41eb36fef8d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-4-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX6ri52XmzmBxM
 gPbw6qqv2hGitxxhCFmdQDSyt1G6A3G+9DnV2M1nf+S1i4DNI5UWNMePG69Z9uU4o48UYi8/dlN
 9JIYe2mCglYdAoahDAYfFdNnx1IzODA=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50c04d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gkVCdKvAZl3yu2NoW_gA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: FvOyWODb4QpX3SyfR3jlnDZfVlKqwQij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX0IJu8v1eb4nN
 rB6kYegmISBXBwt1xLTP+xd69bQItNNXi4DNhUt+fQ3JwfL3HkokDbnet7UvQNTfh1ueqPTR4xd
 XR8k7/gIgwU+jEJ5d8ntRzQ77W63JHVLlvFwdsM197Cu/L6UY9kfWSaCFhMCHaqZxeeMlp9aPC2
 l1rYXpiYI1m7gtvQDQCuZQyKtVAfRYRJ0GdzNqjIXa2S6AEVtEu4Td5fPQ1pL0AJDDFd4DFVdb0
 prOJzNiJVjsyytLW77cbB/BHBAaVUiq+I7yOcNOOmghlQB4+sUSzxszdU4vy0gaHy1yj46U5RTS
 NS/6pO5vy5uEH0TgjCbBsj6fuDqhkop/aQExwEz7hGcSdqEFk2dAeAPTK/0l7aL6EN5OuIKIokL
 KBLZHbGXMycsAFbipVig3f1FQJVqZYtiPfBhfKqrYCSYvMSPyC/qZU+k0h1OVLH9ahAZUVb3BB7
 LN+bz2f/5w9QTJgHprA==
X-Proofpoint-GUID: FvOyWODb4QpX3SyfR3jlnDZfVlKqwQij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118218-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3592373965B

On 7/10/26 4:39 AM, Jie Gan wrote:
> The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The traceNoC exposes the CID registers, but the Component ID
> value returned by the hardware is 0x00000000 instead of a valid AMBA
> Component ID, so the match never succeeds, the AMBA probe fails, and the
> device is left stuck in deferred probe indefinitely.
> 
> Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
> compatible, which binds via the platform driver by compatible string and
> does not rely on the component ID register at all. This lets the device
> probe on hardware that does not return a valid CID, while remaining an
> Aggregator TNOC that retains ATID functionality.
> 
> Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

