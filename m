Return-Path: <linux-arm-msm+bounces-107570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APQBAP6mBWrGZQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:42:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 664D1540805
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07C28302FA3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DDD389104;
	Thu, 14 May 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzTSOTQv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E8fMiGDT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8160385D9F
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755322; cv=none; b=R0oeA8J/2z0SnmpF2q5CJ1HmtOJvs8F05eyEiyLrS6gNmjco0WPjiTkkSvZdfPyqf4kiTgA1H1+IKq/D7faZ8EN2OSFSwn+i1+kP3sfM+oXXINsWOIYQ4ai+7bqdXBaihIalaYrzC2bUwwmtP+0xvfDKbB2nW9E6/vMQRpV0tZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755322; c=relaxed/simple;
	bh=44VD0T0bpMhW57Rqa1pjNU+Tx+b/FPZuIa/q0GXt/no=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=giqQqOA6H3m2p7aS4DAPBeecPzGatE8nb33nSYIbNHdBIGFt4jIvwoZ6GTsfLsUi1wZOZFdaVReC9R0GhTsIw4+To0MMj+YDifiNoTplH7/6cV0hnZ+ohtSqIs5CGETjR+45eED1IUWLaAp6GpD5eQIVplxvkzais0+x5iEQ5ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzTSOTQv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E8fMiGDT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9jwnH2009855
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPKozL8Bn44pSJ9LJCFbqQRgLLCIqXXmM8frJNhG5ZQ=; b=pzTSOTQvm9eYi6Hh
	Sg4LiOWAdzFxxZPQZIcdOReqHklfHrQa1npxWi6468lTc+ScYA7hQ47SWrxpRfKC
	qOOrGyHf9Ej4UgIHAnXtVEM2sCDuKGKj3QQZmjJw8kDccD5ky1p+9yDernNzha20
	hjM+g8K0NMfKH7BvwmArmOl08pxmHGlNOQwytgj9aIhtUnlxkp0q35ZrxDxsvCZu
	UL7hrQG/ULKd0xkb6e/o9jtG0SBFkv+56KoWERP2iIYWRob/9MZ2TcHvaZhgT+kj
	8h5dIGqACrWEbm2yLuJDhqVEMXNkeUqaSE80W2PWgIhvKQG+hWJM1JSUFdzyBKsy
	goFgPA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hhfn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:41:58 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95cd22ec862so453364241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778755318; x=1779360118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iPKozL8Bn44pSJ9LJCFbqQRgLLCIqXXmM8frJNhG5ZQ=;
        b=E8fMiGDT4qGGEeiBxPWmnDQEK38boKudAId8zAR4fQ7zM+rjGru3J+klovGgdraXZ2
         QcRiCuGazEnGOx+4DdiNtpE8L649lKUIZ2idaIPn8gAUdm9boQr0rBSnyT41tH65Vt4G
         g6ZXz7alvSg1p6H7d2rX/ZTcjTAtDPnu/2W4kBInvTkpigofY72lasp1bz7d4F6gHV3a
         OgQ5T1SohxNKZpIjAlePMDwd76G9dljO3LtxzwCtxw4cZBP30Hih3MbcpXylvXjOmG3P
         fLNw35/26/B+KQPBV7S6jmy9LJtqdlod+RSySNCBxCaKeiIp0e0lb571Okkkas3lhHdh
         cOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755318; x=1779360118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPKozL8Bn44pSJ9LJCFbqQRgLLCIqXXmM8frJNhG5ZQ=;
        b=rzlnsn37Vcppv1FxuwDP9wiS7s8085jwPhGDbr5T9sp+dX8wMPNAE8KFLwXzU/8TJA
         RLY1cxuoALGuMHaQJL7TWWCaTkmCQ/oqTN9AVI8C3nFvoOjC9fnYvuhLhxYxTXArlP0l
         6ivKfyorjqaZ1dhO+/+uZlzugXs/f/At+5Db5ib4ltJkaxr1mzMLxMX5b0X4taGUPfS3
         W+ywggzsArBVcX4XzaXoWPJ27HldhwAHH1Mqg4RNodAwjkTzJ4dZvzrbwKGb36c0CMyg
         kkFH0HeOUpUWP6kjsQJfyVwfCxbjTuM3wY0wHCKl2OJokv1VNZ6Vi222oLFCSu7uzKSH
         k6Ug==
X-Forwarded-Encrypted: i=1; AFNElJ8CsNQG2lfJGrsIeB8iSatrGYBFRCwhcNY/ZZ20XQXo9l/FzMv628+RP9vw8zBuc+CPM/l5i7/bIq8c+AYm@vger.kernel.org
X-Gm-Message-State: AOJu0YyAbB8QfNnoaITBYyoYhAEknaLZe2k6Ra5LyVlCkllfqFxd86k7
	KxzORW2VdviFdu3YsXheMBAH69XpD248HbgvEJpAQVciVq5SIQjRyTtB9NDKaou2oNZol8AcpqX
	t6jJEkCeExYw0kXBJzkp0DmZUcUwCkbFZ9TvjynLP9Gq/uvgAAVRPfqWDcG0kArTuH/KH
X-Gm-Gg: Acq92OHzQ907X5C1QYyyzaW/mCp6sQNKQDwnllJ6gg3NotfChJ4/ZEwhWOwdRO0jCnB
	+710mDcfmUasWHgkDgZ/4Ej+8+4nTp9bUYbcszsar8ob6ByajVVwt3bhlsTDKaJLcPFsqb9TRab
	znxi3XfVEfCqP0UFiJWpCOtLkDRG6hCSdv+F7flaqvM8Bto3IGK4Ow1MkWm3Y+Vpx9IXoFtI9BK
	t1gyoMM248LZ7rExlhj9JqVOXAXV3TSllrU5JlvdgV2lW7UeMnSfzioErKFtD97zVvUd/xEWKK4
	l4rFK0Mn/WUt+vfW6qGK8BkbWvi7nAgAaQ2Dz1SVQTg3xibPaAxC10QzuWi/GNg4PTk/BxKhwXt
	eKnDh8ZsWlWcdqMma6IeovDU5CqrQtrmajGKEPKVjIoIqHU+Ip+UFPKlhWN6MoGTa6IZfA1ynyK
	Kqy9kv4bepPeRF9A==
X-Received: by 2002:a05:6102:2924:b0:60f:77ad:4bed with SMTP id ada2fe7eead31-637757febb2mr1344337137.7.1778755318337;
        Thu, 14 May 2026 03:41:58 -0700 (PDT)
X-Received: by 2002:a05:6102:2924:b0:60f:77ad:4bed with SMTP id ada2fe7eead31-637757febb2mr1344328137.7.1778755317984;
        Thu, 14 May 2026 03:41:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm74825266b.24.2026.05.14.03.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:41:57 -0700 (PDT)
Message-ID: <38cf589d-002d-4e36-ab63-8f8366609e0c@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:41:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XoyB0U8U5nwazbsNdD0ObMo1VbpCMZG0
X-Proofpoint-ORIG-GUID: XoyB0U8U5nwazbsNdD0ObMo1VbpCMZG0
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a05a6f6 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8eC56JA1x6P3gbDAbPwA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwNiBTYWx0ZWRfX6EJCwJs66F0c
 BRFFqz36JMEQkONWiWu14+mEYszKbY+vdGvdYJtEaPzTdK1v1KwUQCRRQRqujuRUakLzOU2Up3j
 5mhFJAeLanoCXelo3hud0HMqMMPcj47g66bjtD2Mg/u65JZhR8Y0bFVByYhBNJOv+MLAQmQzYkq
 bXq4qG0VKFlowCpGlbXwSarMDtHn9gqkkBIA81A1TIqx9nCiOKmCFxoI5o0UPyHq0dRVXH20mW5
 LKM2kOlcWBsn4jMyneMyFAgTBMAMhCB8kqyiY5RI3qEAz35yvPkEpfDO6Gg6saKqlik7+/cMLR9
 7uBmTJGpeM/qvlV29wha4GSYF21OwaDfW/s8dKhVtkmq6f9WcPL6yu9AFPsDKbPyw7OsWGb50rm
 Hs4GajGonyMVRZTuU2EXMLfsI+gjJwty5HgzwbXcXDJUcuVuhrTTV0WSIYpr6aHob/4oAdEh9vC
 DI6gYKd5dUvWxxghapg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140106
X-Rspamd-Queue-Id: 664D1540805
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107570-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/26 6:05 AM, Varadarajan Narayanan wrote:
> Use the icc-clk framework to enable few clocks to be able to
> create paths and use the peripherals connected on those NoCs.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

