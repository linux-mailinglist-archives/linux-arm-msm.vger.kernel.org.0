Return-Path: <linux-arm-msm+bounces-97999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECWIGv49uGmpagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:29:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D82BE29E3B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E47430850E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 17:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0DC3D5239;
	Mon, 16 Mar 2026 17:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbePiy9k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZqMQmgIE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5783D093F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681652; cv=none; b=RRnlqhLrS60idpewkKEjXY9wmUDWsq/JR/f3h2d4B1Md8ImhaFY0s5zDOQ9cuyS6Izfcc7gBMISHjo6rc56BOToPKTEuD3Tpj3XEsEr1Zico74lWpilNJa65DaW5d0sKXRwS9h9tgPHBiyc1GUd7Sv3CXBMvA3zy7txwUPBYink=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681652; c=relaxed/simple;
	bh=kJRbHz/Kmj9/f+jsu2tmX0LBtNG5gMiZTjc2ERT1T9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtsM90s6+jzy6vcVJ0CyRaPbJ/xE2TmnONnU//CO/ICPAHsetzIw5WDAM6L8QRe2IUfObafrLfxSkcwxD5oRA3SggsbnlKQnikq2mbv1/7A4zEn092S/jydRZwUkAcZCozGxw8YNGWUaV1d5XF7F6N1Wy3zXE9ZR8sjicNU4jPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbePiy9k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZqMQmgIE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GG6OSk4022233
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVkiGJfb/hoYluJEhR6stCXpGS4CRK7PiadcKeGt7G8=; b=FbePiy9kJj9lOHrF
	XcW+/dz07xoPL/25KQtRiv41mhMvFbJ09Re4cNaR3ZlzE9wrpaXlOW+EpKs3Q8Yx
	PnvDp3FYknD0a9yXOrOEDFRyRWWcoTnmq1z10M1bRDmH5XrBoQ/8Ew5K5XYB+U4M
	FHaMBlyJaxB4J0VdqwD+CGY4VlQI1MoWUm6ov6yrOSOa0jJMt1SjzhlRw/hA659g
	FJz+diGbW14C2T00EezGx89qB2zdzeCD/6y7pe1QiGN5vptGWQZIEtm9Adh7sWNR
	i5uvKk3/9zb6t7hzCxHe33sf8QQkcGSaz22G6bpx+dcWmM6Ed1orcJWRQz45igde
	kmPakQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fg9qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:20:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b051befbb8so20446745ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681650; x=1774286450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cVkiGJfb/hoYluJEhR6stCXpGS4CRK7PiadcKeGt7G8=;
        b=ZqMQmgIEwdZYyjTmb3XYzf4cXyzC/ByQdKWccNOxxz3xOOhlAiSYDmJuTJEwpVnM1z
         Unary135iyizRs5HU7pixNX+mZdAbMRuHCzocHy0Ul5MdtXokSwu1OzgPfB7DIkd4BO7
         xm66dTNNO+7D9LwPpwX3r9CXrgSgHSR1El8kMm8ijTzSJdl76qDF9AusLwxiY2HlvwyW
         0JyoqxF3WGdqQDI+nNhFFljfS3DVTyKQMyNSzV1vcuJcAt7/I8R4lV+JxU0rsBJgCY7N
         gblftfGFe17Wu0r0/0PHOkVj3glIFidrZD3voRvThvk2DD2o8eaG09kkNtsTPFCYmKP0
         VzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681650; x=1774286450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVkiGJfb/hoYluJEhR6stCXpGS4CRK7PiadcKeGt7G8=;
        b=nx4GKFWajeR+0MwiB2AtfzDYqW/UE0F9JNfAs3sqjc/yMvihplCUsqp0pOhwgzewug
         mJS0qBcapsjF0W+vhoaZwCZO5ll0swEogqqc/otV51o8xtqZTqnVDTxB7S58vXS69u0F
         JeWUd42vPGjfEFgs+HyRP3/vC8JJf4Bj78khswxLifX6Td3EMu16iYFp3sH6MFteVmSh
         q6i4i/uOs/sqOkHvBb+zEbnyyX685ZXrNRKOZ7osWNkXTyA9N6eXaFcFJc9QWoOWshq0
         5jSSMiQER+ypHBmwCFbmqHFK4SRCgJOiCI9A52//aoplef/WH5xZJ64IhL722hZCByNH
         wVnA==
X-Gm-Message-State: AOJu0YwnXrxBKTw+9ajEpQ9JxudQsgvTX3lGE83uEa1KwRGIZkYlkO8k
	5HhZmuWP1O3kMexzVgaZPsIxAQi+BjU5cDwMQCjYK599QAh/33OXyroXd8socX9LRzdVTSkiJR+
	+hd/ICw0e4YDrtfAc/e131InZdZ0eJD0YxNK7oHuWQPcUh49hyvMP8VTNz4+thc7Hv/LyH8ZfLU
	ZL
X-Gm-Gg: ATEYQzzLKL0uBZlYw3014F/qv3WAs1YvPAfKXONWJQ/8r+XG069wQv+TDS/dQB68/2n
	kss12CE6ygBxgrNnZh5PQoDUDc31zEQeE+joMManzTz/pkDwS0skHHNdb1QLpw41hCxXN76m9lR
	APAgwpDETcI7XWbUQzfJS/zvvGZu3n1BHJf1FRDMq1qz4IZWGUvNq+nAXqNm527ubzPmRCgFtdg
	y6ccwyJ2QxUtOi6nT/NrKM8BUOP5Bu+mi9HvSYniz1Xp0Y3Rnx7iOP9a2Uj2qAhJHePxZwYMeVD
	eDvpfF28/rYJpbWzuJqXiCvdOlcANTfqdoiTdV07zzPx00n7dW3gTNqaWvGetHy1je1UIHjKs42
	tJdGb8mCSoSAc5kT6O+d2LC/0Z6020QkiUlXPnObL8Q==
X-Received: by 2002:a17:902:ea09:b0:2b0:4ec8:fb92 with SMTP id d9443c01a7336-2b04ec9004emr69176345ad.39.1773681649579;
        Mon, 16 Mar 2026 10:20:49 -0700 (PDT)
X-Received: by 2002:a17:902:ea09:b0:2b0:4ec8:fb92 with SMTP id d9443c01a7336-2b04ec9004emr69175985ad.39.1773681649093;
        Mon, 16 Mar 2026 10:20:49 -0700 (PDT)
Received: from [192.168.1.8] ([101.0.62.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee6c6sm116230535ad.48.2026.03.16.10.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 10:20:48 -0700 (PDT)
Message-ID: <5bd9b257-40dc-4ed4-88f7-b15b934fefa0@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 22:50:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
 <aaf2c23c-2c6b-45e1-a2a0-096249ea0d44@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <aaf2c23c-2c6b-45e1-a2a0-096249ea0d44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b83bf2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=+2ldRcY3HLWus9HqRSG52w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=8WFAAEkrk-lUUCZj-DcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: esQHvZyo4KVQICJMjwPtPeVwaOLgwOOq
X-Proofpoint-ORIG-GUID: esQHvZyo4KVQICJMjwPtPeVwaOLgwOOq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzNCBTYWx0ZWRfX1Z7xBO9dyMlg
 PLZ+BeRDBTEwH9Vohyr8hDF4J292x3gQdvwwnfNyomUS7YTlalX6tOPMq/NXJ2TxOHknxp+eYAv
 TwmpyVVUCrI/Vq3XTeeVxTldbO2e0lm1Cv+PhImZ/GtZ+/HFVGQ71DQ+idyvPqOIx2RPVVbQzLA
 BcqyXGYqmRmu/T4OaB06aKWxAknc9PEAfhwGO8ewInyRlxvBBt8h80t0pRr1gUj7i0qc+SFU46K
 FcoewDCCWBbgL1zulh1zCC5uSmfCbkMAqhtSfn1dEKX3frbipp31ODFmrwA9iwprWaYM5NyDzB4
 +MSfBXTPnu3dg7XfYPBS2rl62e9kRBB7TPHQnJi7h/zoHnIah9cUM5W8I6eNYCsJl7aC4fyPhye
 Bh/Moqv2ywHgCcuTVZTAIUWnntVSI+AVzpRV5gkOQIz9+l1+1bTNTk8k55wSRO2Zmz1eYRvN6Z3
 67gJu5s9WrxQ+yPLgPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97999-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D82BE29E3B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/16/2026 3:59 PM, Konrad Dybcio wrote:
>> + * | Offset		| Name		| Description				|
>> + * ------------------------------------------------------------------------------
>> + * | 0x00		| Byte count	| Number of bytes in response		|
>> + * |			|		| (exluding byte count)			|
>> + * ------------------------------------------------------------------------------
>> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
> qcom_ec_fan_debug_mode_off() documentation only mentions values 1/2
> to be correct - is that the case?
> 

Yes, qcom_ec_fan_debug_mode_off() will only support values 1/2. The
above documentation mentions about number of fans available, max being 2.

>> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
> What types are there? CPU/AUX or similar?
> 

This is fan vendor identification byte. 0 being invalid/not present.

-- 
Best Regards,
Anvesh


