Return-Path: <linux-arm-msm+bounces-95963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FVHLg8NrGnUjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:33:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE222B70A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9EFE301D056
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4472D3225;
	Sat,  7 Mar 2026 11:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhpuL7lm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MiU7HyOj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C16C2EB87B
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883209; cv=none; b=MAqLi3IL92HvP5OXJCBIra55JUKJttQY3/9GWo0HeSLiDsNKn2aDXGZGmH8LgHY7jw51kPWD4X+gdqgV8GtZmnqwkXd2EyDcn4aE+RS+d/ZCVNKPm00Jel/tfUPBi+yFcJ9TJFTTwWabHgbhhnlZpVJl+FAvfgB3WDC790dsj38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883209; c=relaxed/simple;
	bh=dgaocUp13cuZrrP/K/PeQ5T+zCv20OBe9uDkWSAQrdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kL9XNC9k6Pg1F8OVLudx7moRGLns1JoJCK8zmOQVtpIS10DrpHf53tvZ1V4BOaY4yWp4VOjhGXKMNjn7i1wuqf1IdhoNcT5FCwUuaKDDprrjo2BgfFZxuCbZdXAtuCK1jukZN5WqlmpldH4ufiyiNWZpdhgMsvOPMwJg0EzV1hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhpuL7lm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MiU7HyOj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6278NQw0460187
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgaocUp13cuZrrP/K/PeQ5T+zCv20OBe9uDkWSAQrdw=; b=VhpuL7lmzcGNjsE1
	Az2epcH92WHAU/u4841+RGX02rtoysOPjnrGKWAYWLEJ7Pe+3n51QEx9VZTCA7kA
	JW9mC4S3VM+Z9WfiCvB5f8eSsly1+HYpPIValiVfNeIfzkml9HcYmIPHCknyyd0y
	IbsV2dsIZOTS2dsIYMNe/n6Zok4A2PVmbTKOCQTP+STLP3aUtsa8Ti2B2JnIZ27h
	b/a8qbHBvlqgtY4pNL1MI54S63EmvpoMop4vcARPNQKLqryPAjRsF7oZAGhqxYqn
	+dKxfb9AQFnykvONMlOdZdnAg+LVt7b3JcCzMlUm+0rWVmGJVrAtop1/uHcQ+fV2
	97gYcw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcse0ktm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:33:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae669a8ff1so214063335ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883207; x=1773488007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgaocUp13cuZrrP/K/PeQ5T+zCv20OBe9uDkWSAQrdw=;
        b=MiU7HyOjsyJr2mKUz2ZdvSTPao5msybPgLAVSBSgACVHkgzow7QRGpaRRuse7eZ1jj
         WijMl7A/GFZ+2Ah3ePfY+JlkeK6VaZ6DNZOX+XqGcrHp+Da5veUJBfsAaEk2CNNkesZU
         3EWzw4jo3Vsd9uH1cixSvJq6jlbk6QP/GH8vJUBiEvMM8bm0L+xlcfI0EuRBsZIYvp7c
         qw3yzVyl5hn3qMk87BSlBXRQT4JTNgHgFuCUo5B92r4G/vpf6QSHglTCEC/JVcctQpGk
         BuJjoPVVmue4qDtFAWDBRQgs2PJxLIkv9D1QmweKEWhWE+xKFwl0PI2lTE2he4By0AcB
         5Ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883207; x=1773488007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgaocUp13cuZrrP/K/PeQ5T+zCv20OBe9uDkWSAQrdw=;
        b=XNyKX8v1AJQ6e2x66c/tgfEltGt55gcymhEF0WesjjjcA/0vb4+OqX/4UVAswzJQgI
         N2cpJEy9skv7PrU75zGiZKl5QmJLk7MtpNLdN6A//2Uj6/9AAaN91gdCndjmFz58k8Hy
         8CrHvbKPAEH0oYT2l9wGUdaiNCfGNDmNAkhb07e7Fs7rg9124Z8ENS6CX+NpbqtvMcZT
         vX6TQtiXOlTKrXNycwl9HLJgb0wZkKgPtiZoUUO9CkYXWZHgCaNI04CPNdQuro/YeFXR
         m1TRZy9MJfVpflffb6VcuSTDOdW/oxl9JZGbWm4hy5ntfGqZwFyzw8gE1N2ncfSI/Elk
         aW8g==
X-Forwarded-Encrypted: i=1; AJvYcCUY/tm504Rgvej8+rxU/jVgcaEjJDOby93pBnzJKPRn/tGGRo54BBLl2AtNB6qnpsLWr8eDK5Xi8pLABbdD@vger.kernel.org
X-Gm-Message-State: AOJu0YxtcbUSc6Nvawax5PFJDE90HKVgMFNwnttqzxbkkLr/YPJO1D9w
	9BrYkndkbmclzPIVuIZ+OajndhfcMFmoQzR1RVtIXequ4DFDueF0HT/G+Eby5dpfkCR/XC3fDZJ
	7IqjnJGWeLoD+iITY3qsAVP0nBhNT3P/q3rpvHfmTb1U+m0RZvKT4Oo5QQdtFVKcOB31r
X-Gm-Gg: ATEYQzzUPOwtNErRVGHAmN+I6sEtBGmcPRmkOc9jzYpSfGst0vZEba4AzoddQMbCAA8
	XAjfVsdqnKNSQijmRhhNCYCgc0+708piE0cYyztKZWZRrfDEUu2FBkOfJVrHezzXWoQiQ+UjLQS
	VJ8E1p9aqKEd3JILvHUEDAx9K19KLDYn5iuQ03NUmhfLWiDH/4sdGRfVbSipQNJDLGpms1IfMZQ
	ARosAuIjq2saLZxijJxRD5G91zf3dVZO4cJcVHPugkqID6J2GvQr7VoiMYfTeCyGWvwP3PJA2b+
	9nE8Bu54thSaB3S8NaGibQ+M0vDTUIFO52QFvRmKDKiCXU0l9I+vcL48PCz0lT90aaNcPREblOB
	3ugEADEZ6VLgJYyZjzyjax4H07X0P4Ur5BmroyV2bggKD2Uz+UiLfN4k=
X-Received: by 2002:a17:902:f681:b0:2ae:7f6d:d2b7 with SMTP id d9443c01a7336-2ae8244456cmr50128375ad.26.1772883206839;
        Sat, 07 Mar 2026 03:33:26 -0800 (PST)
X-Received: by 2002:a17:902:f681:b0:2ae:7f6d:d2b7 with SMTP id d9443c01a7336-2ae8244456cmr50128245ad.26.1772883206316;
        Sat, 07 Mar 2026 03:33:26 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ad74asm68023245ad.78.2026.03.07.03.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 03:33:26 -0800 (PST)
Message-ID: <a1e6059e-63bc-452f-9414-7e5dbd965309@oss.qualcomm.com>
Date: Sat, 7 Mar 2026 17:03:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/12] drivers: soc: qcom: Support Sahara command mode
 packets(READY and EXECUTE)
To: Krzysztof Kozlowski <krzk@kernel.org>, jeff.hugo@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com, konradybcio@kernel.org,
        konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-9-kishore.batta@oss.qualcomm.com>
 <baaa5b48-0164-4d67-9283-a933d36cf7de@kernel.org>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <baaa5b48-0164-4d67-9283-a933d36cf7de@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IdqKmGqa c=1 sm=1 tr=0 ts=69ac0d07 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=b8NNdmy2ercvHMAPQpkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Mjp9p7PdWCe2BIwuGVv_Fvwppt99h5UF
X-Proofpoint-ORIG-GUID: Mjp9p7PdWCe2BIwuGVv_Fvwppt99h5UF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX20SMub4d0heR
 E3ZRSWvcmVbNS5wY/BP80jedx4fkQtO1ob4MMOzoqXi30jfP5hCDEkTtqmQxQobQCbUt0qZciQK
 CUAW7CFHjtoOB9I8d0FQIbnV+IBCHTtSiP7eCNn8PDSRtgWx+SCincoAiEMCyPr76sDHgCJ5LVx
 CdvlpgK5niCANEk+4b/yZHqMkIAJFqhpGaXXnnKfUWTJJpzGEgSMnbZI/O2Vt7ldckFGSFe20iI
 raiUoaX9BkS3Hq6DIWmmmWgf3+c5HYVJF3EcfsZc4YTDFuFgw/MOXUO5YKDt8/NMyJriFN/5BhX
 utPyPvi3HdeROy7VN6t8WXja7q3xNxDB2VaTIrShNbq73slu8Ecs2hk/KANDHysxPL1oUwkOezP
 TCYUmdAfnFYJgqQBIgNNEnETsvH+UTlFjLcap0K9cWfhx0NpcYwWGf2QO367VDX31DqJ8Gu9umz
 Ve3qxLmDVSfFlmE2ZpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108
X-Rspamd-Queue-Id: 21FE222B70A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95963-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.957];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 8/28/2025 7:50 PM, Krzysztof Kozlowski wrote:
> On 25/08/2025 12:19, Kishore Batta wrote:
>> During device boot, the device performs DDR training, and this training
>> data needs to be stored at the host end to improve subsequent boot times.
>> The Sahara protocol specification indicates that DDR training data can
>> be stored at the host end using command mode packets. The device sends
>> the command mode packet to the host through the HELLO packet, and the
>> host changes its mode of operation accordingly.
>>
>> Once the device determines that it needs to change the mode of operation
>> to command mode, it sends the command ready packet. The host receives
>> the command ready packet and then sends command 8 to get the list of
>> commands supported by the device as per Sahara protocol specification.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>
> All of your patches use incorrect subject prefixes.
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>
ACK. I have fixed the subject prefixes in v2.
> Best regards,
> Krzysztof
>

