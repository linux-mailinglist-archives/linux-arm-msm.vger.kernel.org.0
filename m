Return-Path: <linux-arm-msm+bounces-113254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RlIBFu8/MGqcQQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 20:09:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AEE689123
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 20:09:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IpemTdun;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fhKOB5ai;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113254-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113254-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B628300FAAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA41303A0D;
	Mon, 15 Jun 2026 18:09:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE2A3016FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 18:09:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546989; cv=none; b=fLm+gDx1ultySSG9KHydmCI2u2yj38g+bZwX7EmRiOQsBzKZ/0D4ft1BdkJh0M3on6GoIHaCP4TwocwHJPpYrnakRQluNraYFtw0fznEJWL1Gu9Mp+vxlw/KH/qIXyPNigP2OIS/UiSLPk+UvX2oVAQ8u+u/hyKFuaZdTBfff8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546989; c=relaxed/simple;
	bh=+/YIfAZx6Y1TDdcNE4r7VNCbv7pZjjigABYxTNijrxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6Z6GiV9AUqIMpow6TTv4xJzDFqVnjQ3i/GgH64Z5cZa0QzvuvqukyiC7ec4sSG37KmkrHk0vbI/yjuxWhgI0Fc3PfKrpHRZpua8pSsA8kFEY7l71hxNZPZU9v15scJGkTvxSGkLzjcTxx9Cik/gZ5jD6xgGCBxdyW02kQokyuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpemTdun; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhKOB5ai; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhZ1j430566
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 18:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZXH7NQPKLN5DjAC/OW8MEpdTAtaJcMt3HJcX6yL1CQ=; b=IpemTdun7BE4c8aM
	G6fZoFhhPOLEPP5lstIw3n4cwYIrk3xrb4FW9e65UKhxXWlylVWLyBPrtTCm3xBc
	NNZSY4rCfBVEiiLyvZVssDD7+lEtafo6qK2ef74/Vw1nC3OK4mLEL1pRSZs6K+VR
	jw+9zYofXd9aJfzR59fYbcqXpZgFoaxvr8dKnPGy3lFCUNINRfHidm4IYMvNtDZ7
	6++Ko5QqRDZcMIDzUWDL4KMLMXHNeiGspqJfvEkCloZ9leneZ8Le5RSgtM2Txkng
	rYhp7SzBv+Kq+/pnPHEWSGuuiRys6ki7+Scc4u/DpQKT/uACkQmXJ4bPpqVOFCfl
	L4Qoyg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteyda7d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 18:09:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf2bc4371bso33221515ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781546986; x=1782151786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OZXH7NQPKLN5DjAC/OW8MEpdTAtaJcMt3HJcX6yL1CQ=;
        b=fhKOB5ai1F4PYg7vn29LzT85DzXwgg69jNQL+8bn9V95EsE5IP8eB2fTYk8CzyqgVT
         2tLBc/wFvFwiefRRMB5a5LxnqhctekgdvgKizi0yccbKMdz3/zVQ5FNUvhyhHkSdHR4V
         KVnpu3qE9WnG9Q47cJUg4hhiMAcabRJkV8UWj25yD4iDYRyxUxvqquVdOWYPHfediVnN
         JMxTzVWhstSOXFDKg9WC+oBcLcQZ/83s8vdK3aUqheFmDyEEmVHDeiX3/smUQRVUuE3q
         Tj9nyeGu0llUul5r8aT/UMzplL9zGCDnOpH9NTVdvq76d9dKfng5ItUHaKn6ovsWvhtr
         yOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781546986; x=1782151786;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZXH7NQPKLN5DjAC/OW8MEpdTAtaJcMt3HJcX6yL1CQ=;
        b=DfmPEdKp8C1yf9wU7Wa/OJvTCsG1hDhM4Sv2mZ+GfVWRucY2chmqK8iFUFcCuCN8RW
         Y4zQpV9RDm+SzkbPix6JVGgnbEaMhg33pFAINnmRs26VUZVtiThX+GTogu9B2Hl9Jh69
         N7P4zWDuu5AucMN0TQEkeGaKQ0K82nM84zWeRbxr1eO2yxSsm98XVZdl0I+QcKD8cq+t
         FAGEFWGNg33PRZ7Qte2lyz9Zj4eO9czt/VG0lzR3piLLhdRLwDaaXDXq4fPTUeUVmBNz
         QD8SnUTxm7G7WxoG5sTYpW3Q6VbAxRQFFHHhe/aAApDPLa8S2qpOiZsnhU1QbZZvdAp4
         6k4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Lx1+P/eLpK3IlGVLS8Mt5c2ewjEQRGvwjbQIHtOgkXtneDW68h0HxAoRJ+lKLOBLXD4sSDLTjaGVTkg7a@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq8J1TauQXstnJHGMWcsDdeH+woMPSeo7rM+h98Y08Cg90KGQD
	QBVUKIShje4Aq+28dXzwepELw+6CYHpgzvOHYc5z1UGDJM7lUT82PyplD9eK5sEZUMPuGve8VI9
	CR5qSy2Mt5itJbF6VZFGwWbefLnRxjrZwiofoSa+MszWQFx3J+2H67+OKnU+sr4Kl/ZQ8
X-Gm-Gg: Acq92OGRQ0b1edM1n8dZLvwUZgHmKSy+qVrr+0haYi3KMQtTCm1qqNv4qnejw0bO1e6
	YSYoHUSlc5bNP28llDBwSkHMUOKJBBfHUEwZvYShpfyARZtBWi1FWolrt/qkrtSeEBYv+gZKppi
	nsZ6UnCuCLu2Dd7wmDvmvX07zQqGadeFdiVkTKjId9wd71ZOAggzqnyk7QWYZ3vOfkJV7V9wZKZ
	ohMz9Gp192eOyW4O+Srxh0WE1HtQKujtGs0ZcW5R+4o/tND5EBb4leSuxYofz771lyMVPl9ITDU
	4ZNXlNfKG8lk5ekQrmcE17CKEElUbHNMSe5Gx8x+hPbC8onKwrY36f45+jjwLJLLzW9q6Pp74SZ
	S7w7Yy7Yu3hVZ+Khs+C6DUVi5V9RkKym/wXVAuqf1tQCQyJU4OP5GYCnr
X-Received: by 2002:a17:903:3a8b:b0:2bf:2d0:8877 with SMTP id d9443c01a7336-2c699b739efmr3749595ad.23.1781546986469;
        Mon, 15 Jun 2026 11:09:46 -0700 (PDT)
X-Received: by 2002:a17:903:3a8b:b0:2bf:2d0:8877 with SMTP id d9443c01a7336-2c699b739efmr3749245ad.23.1781546985957;
        Mon, 15 Jun 2026 11:09:45 -0700 (PDT)
Received: from [10.187.126.18] ([106.221.183.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e535csm103379135ad.6.2026.06.15.11.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 11:09:45 -0700 (PDT)
Message-ID: <f4e0a95c-bd4b-9eaa-f06e-5b5dd7c6ee84@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 23:39:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
 <20260612-iris-ar50lt-v4-7-0abfb74d5b3c@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-7-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s2cnqJBauj2cVHLo3cb5EuJlzYQLVmjA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE5MiBTYWx0ZWRfX62qu2vWPiHKm
 FdJNyTN2aOygk6TEqtmLlQ4HgjdXw8Mg4bw+ovUKHCPKF5Jr+fp0YP+0yLjLwhIjbI+JNWfYFbl
 6v9ZuMzt8B09GG207MLCz7Y7ZCPkBDg=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a303feb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ym48ABLkKUHSTpi9L/JoRg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jI4A6vEBTXP-BcUGSgUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: s2cnqJBauj2cVHLo3cb5EuJlzYQLVmjA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE5MiBTYWx0ZWRfX8B/JuArTKr4q
 FPqLtE/3NIcH7UFWvGC2STXnRTDcuv5YJURoqElWKyDSVDTXLvcf7lmfh6H/qhbQSjnmj0R0QA9
 QvRz0xdDUYiakBNHBdjPyQGUkatG+M97PRPdkFh1zswjJDQycTpZU3PAozW2AO8vnKORVkSY+pA
 ipTwEUoqfCjdeMYg51NQeh32uUL5W6wTA9f7St6VIjqCfdzMlujfRnzj7uz/96KkKha+h3kzbmb
 RyKFs64q6g21pzH6LK8dPllg6dboisaGbUsqEwp56gHl6OEh5bxbU3iTh6cCFLqdC2gEtDIrBfT
 5C8ZHle0gDJ1JLET7QnwcorHr+AkPXujgXXyU1UAi3BKXs6vFSIObqve5MZr4AqrU01hlewnrpf
 h1PV/NcgXPv3A8XFiUOnnoUhWAdhzKpg0zbEdpszfJlBb1exbNSgOjOxqkjUt+tnv/26DkiG56e
 nooSptBKUe38HIMISHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150192
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113254-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0AEE689123


On 6/12/2026 2:55 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> AR50LT require explicit instantaneous bandwidth (IB) voting in addition
> to average bandwidth (AB) when configuring interconnect QoS. This
> requirement is due to QSB (Qualcomm System Bus) 128b to
> QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
> which is not needed for other IRIS cores.
>
> In preparation of adding support for AR50LT core, introduce
> platform-configurable IB multiplier and enable IB voting for all SoCs.
> Existing platforms default to IB == AB, while AR50LT requires 2x peak
> bandwidth.
>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
>  drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
>  drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
>  drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
>  4 files changed, 9 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 81fcb2854772..accc1627defd 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -316,6 +316,7 @@ struct iris_platform_data {
>  	u32 num_vpp_pipe;
>  	bool no_aon;
>  	u32 wd_intr_mask;
> +	u32 icc_ib_multiplier;
>  	u32 max_session_count;
>  	/* max number of macroblocks per frame supported */
>  	u32 max_core_mbpf;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index eeef453c583f..e2fddc29abc7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
>  	.num_vpp_pipe = 1,
>  	.no_aon = true,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
>  	/* max spec for SC7280 is 4096x2176@60fps */
> @@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
>  	.num_vpp_pipe = 4,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 261db38a013b..64cf182d67cc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -116,6 +116,7 @@ const struct iris_platform_data qcs8300_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 2,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
>  	.max_core_mbps = (((3840 * 2176) / 256) * 120),
> @@ -146,6 +147,7 @@ const struct iris_platform_data sm8550_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> @@ -184,6 +186,7 @@ const struct iris_platform_data sm8650_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> @@ -214,6 +217,7 @@ const struct iris_platform_data sm8750_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index 773f6548370a..caeaf199cef7 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -18,6 +18,7 @@
>  
>  int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
>  {
> +	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
>  	unsigned long bw_kbps = 0, bw_prev = 0;
>  	const struct icc_info *icc_tbl;
>  	int ret = 0, i;
> @@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
>  				return ret;
>  
>  			core->icc_tbl[i].avg_bw = bw_kbps;
> +			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
>  
>  			core->power.icc_bw = bw_kbps;
>  			break;

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


