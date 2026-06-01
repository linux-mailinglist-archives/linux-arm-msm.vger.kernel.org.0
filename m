Return-Path: <linux-arm-msm+bounces-110559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL3jKdVcHWoBZwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 12:20:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C02361D38C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 12:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FDD83098050
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 10:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98223998B1;
	Mon,  1 Jun 2026 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnu6MEUu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GfGnOd+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E16F3ADBAC
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307945; cv=none; b=EkMOYV3t/7oSwCxs3OUZzPGbyJZ7LbaZzcYgxa3dER/crzqYFnoUzkXL3ADKG+R6hkGjVtmhgIKWH6uXG8tTzh1732K6VeJErtNaiUjtox+L3bdimqcMxZTBrNkyoAx1k+n+MTx7wG3YLdpDXZeX8CMnROf231d/6GweZ/+GHVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307945; c=relaxed/simple;
	bh=3qd+bUcCRmxWQ6qq6HCzanIQQEG6RlxxdSZi1YMjlBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M31coXf5jYXj+XSYf9PrryLP0uB+h0OGyLkhI4PPOlnLGhdOO6E5mGMgI2SAqHN0fWnAU9pkwsMKIkltqBXAz1pzPXMALH570LiiN8RMGRVD1kkt6ZBbxW2JkCcKkrZNrlcuMAqy3Ns1gjItmw8pAhA4JySbL/FMQhEi7txLdy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnu6MEUu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GfGnOd+i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518Qji8717597
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 09:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HrzQqPLPz1VqcZr5wP1UufzSV6HxJFnkF9CggHs5h7U=; b=mnu6MEUuU+ymQj+z
	aYoDcRsmvMGvkid9qInkqsSDE9FgEEKxvm+YxxCs1TDbOLNRFNOKT7R4J64p2AKs
	OYVIjdn+IdLprxHhpgjCH9oMvJIwDzcWrOnG7fQvHvLXYnClx4nvSwZu1XJNPbYH
	iVSTYGfXtACaYmd49+Vu3CEkHq70Fv/AB+C5eYV8NxbYp8qrgvPY0NH0QnmY9V2C
	4xqH4v5OCjOvM/1wthlu9IJsJDdDwwdqWtK1sslcGl50Cyydy0at5noLAjpTTMmt
	kGsjMkvOc79B/ZJkRm4+WzRN6QXLEQCVSI+IW984qv3Kj7QzQZacxyR9jc+V+4wA
	XQ9LFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98euet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 09:58:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so34360135ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307934; x=1780912734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrzQqPLPz1VqcZr5wP1UufzSV6HxJFnkF9CggHs5h7U=;
        b=GfGnOd+iHqSwZocbpRDSEyv2M0rSyvRKGYoQrpOlfi7IjTd6LdH6Q7wzrCPrWXndeC
         gwvWkt8Nj8I2fFf+6ufkaIn9PQGYx0uRUpMjUeYBQAjQzNlnzN8T48ndFyLmZNRmJCns
         HgM88AtUR+QgwoN/HsO1Ey3AsayWiErXE8O3O2duYo6jmZuA4Ucd8e0tVy2FacX3ck0E
         SVRJtHrGn0ZxQHba3GJJQiYHrzu6MeC23G+71stXGrqjAxdIBG19WiNBpvSy9UOB8F35
         adIilynTDnXQ8Dsa0ZK7hG2wEkLrd4+KJo2Z65A3mGPPSUPPJ41f46MwpZrqeINRpDva
         MSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307934; x=1780912734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrzQqPLPz1VqcZr5wP1UufzSV6HxJFnkF9CggHs5h7U=;
        b=YwGOetxb0+vWSMKkcPLgOIjfqRDCr+tJwP5h/ADdJPtXHNFXbMVyblAwmQ0KQj6PDb
         m7KRS6j9p5Rq6EZ2hD4C2ns1a+rpWTK6sWnSLYkdJXbmNIG6e+9YGfSWKFirPXGW+UGg
         rTaWzJ1JAk4lR4JM+Ig1Z1wO7X0ZSlIt6tLtojyrOcwM5AtWYN0kV2o2/vKB/uRTEAuT
         Em9YxPygks+WMQvW3xnGLnrehN/TlIoYM5UY6W+HLmg8cjM2HaU2zNYJTNoQOrhIH8zx
         Z3jrYNH9RwjRRg1eHegCBdfvY2ACzKUXjkDlSezJobcLiVxYJ+yiIfekYGynf8ikayxO
         5hxg==
X-Forwarded-Encrypted: i=1; AFNElJ+9Dxyy9deu+uzNCLHO7CD54jJoLh7Ris/FuXQX3gQUXSjDa/AuVFKVeWAGcgnFqi3430U/fAzIgPxzlrsZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxE7XIDolUuaiXMENUSbpcldcCIvp9dija7z9s4KNkfdtVvYX6C
	5dchUrrJDb0ymQuItaOJ7KJuK5Qwr0VY0g+YZmXK1Ckn1XMt/iJVKLUX6EcKASGK3BhWfAb1vWs
	+DtGtMaL0KIty0nsNrawVb+4Gb454KWHVMha3lfCYGNeVbR67nbeiLkBEo4v3wWrKMVfy
X-Gm-Gg: Acq92OF2DtG4KikGxSpHRF+IFCB+JlT0Z9Lobs1H0deewayoGHpt9OheFCizxdGC9hG
	rdSdg02ITpoCZiKUKNce19ej+Uczhq05YAtWzIYpeh2zxJv8jiBudumwY8xaUf0kZGerU41Qqsh
	tn+w3fhgJozZSXWoCa90v+nHo+34xU9nEjBXzBV8R5F66EGAwzdMBcUzyBoTdScSC/8XYWokKqr
	lpXeZ8dAE1Xr74hDPaVTxVKsopqovDZ9IFkykFSNe0emnBSo9m1bY3PDkvlTl8e3nuJ6y6DHtrN
	hmA9SN8LK0gw+NJos0zCP6GjovrFNrqxJi5J/cP2IiHzFMMglHzVSX1WLYLU3Ssb1eztgWai3dw
	NvPjHJQtaM8yB1bKvOhpCNYRus7ULnWkurZYn+k3x2px8hCEilLl7zJxIBEaO
X-Received: by 2002:a17:903:8d0:b0:2bd:c5f8:504f with SMTP id d9443c01a7336-2bf368d9ee5mr115095995ad.40.1780307934378;
        Mon, 01 Jun 2026 02:58:54 -0700 (PDT)
X-Received: by 2002:a17:903:8d0:b0:2bd:c5f8:504f with SMTP id d9443c01a7336-2bf368d9ee5mr115095655ad.40.1780307933972;
        Mon, 01 Jun 2026 02:58:53 -0700 (PDT)
Received: from [10.219.1.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd8dbsm104282145ad.21.2026.06.01.02.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 02:58:53 -0700 (PDT)
Message-ID: <0d6e3664-0293-431a-b498-17612f0dabde@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 15:28:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] Bluetooth: qca: combine NVM and calibration data for
 QCC2072
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, rahul.samana@oss.qualcomm.com,
        harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529180431.3373856-1-yepuri.siddu@oss.qualcomm.com>
 <ungiyrkfjmykhm65ttfchad7oxgx3d5mf6frj2xnq7mdudq6tw@hqwq5ms3553w>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <ungiyrkfjmykhm65ttfchad7oxgx3d5mf6frj2xnq7mdudq6tw@hqwq5ms3553w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1d57df cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vznY6RU_P2PhIyVQoCEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 9Yi9vc8NgsqQYgnGW2I7JoP5idye6DI6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OSBTYWx0ZWRfXwdMlsypyKUgj
 eiBeYTWbXd1xqYkuhqPeAadi08afvD6ZEu+1YqlF5Dn51zbWBA0MQnXqmmcbG894Rux/JYGbmJN
 rdxHvikZmv+E2q6QkspaJ/eX10gsVnWTZ568zzeh13U/W4hy5CnXnK6L+5SIhF+Sl0YXQhJ/kyD
 XpMbSvKW8/hMCgCsQ2HAwPa3uqsGNGpsdAdGu2sCyJNEUmdHh52OzjfyOBi7wpnsZEAN2WLHjfd
 jvTZ/ZYoRv1u8vAAJGKAGGvFOWEDihDcujaKSHyeeSWCoKmWKDuoSs6ewCxbmNVB3VmQ4k+7eFH
 UjnwF+z8Q5zZJe2gpZKUM23UO7emgmfoU+9Bdx7nX2VaKGE9MOBVxBHIb/h4vcFcEvwf5h7wyZ9
 WO6nMLeKSl+/RCGczjL0BT/K7cJuhvSncstt78oCOAxC4tZSVYp+3c3/drCD1SNt4SkgBByQxtt
 ob/x/wxuFoKoMKgK+BA==
X-Proofpoint-ORIG-GUID: 9Yi9vc8NgsqQYgnGW2I7JoP5idye6DI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110559-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C02361D38C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 6/1/2026 3:20 PM, Dmitry Baryshkov wrote:
> On Fri, May 29, 2026 at 11:34:31PM +0530, Yepuri Siddu wrote:
>> QCC2072 requires the NVM and calibration data to be delivered to the
>> controller bundled together in an outer TLV of type 4. After loading
>> the NVM file, load the calibration file (qca/ornbcscal<ver>.bin) and
>> combine both into a single buffer with the outer TLV header before
>> passing it to qca_tlv_check_data().
>>
>> The outer TLV header encodes the combined payload length in the high
>> 24 bits and type 4 in the low 8 bits of the type_len field.
>>
>> If the calibration file is unavailable, fall back to downloading the
>> NVM alone.
>>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> ---
>>   drivers/bluetooth/btqca.c | 47 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
> 
> This is only patch 4/4. For the future submissions please make sure that
> you submit the whole set of patches as a single thread. Or, if it was
> really supposed to be a single patch, make sure that you generate your
> patches correctly. The general suggestion now is to use the b4 tool to
> maintain your patches as it significantly automates and simplifies the
> workflow.
> 
> 
Noted, will ensure all patches are submitted as a single thread in v2,
and will look into using the b4 tool to streamline the workflow.

--
Best regards,
Siddu

