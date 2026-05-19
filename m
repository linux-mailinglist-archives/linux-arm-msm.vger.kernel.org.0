Return-Path: <linux-arm-msm+bounces-108448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DZtOsVCDGr/cAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:00:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7393C57D0E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0268031159BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDEB32B13F;
	Tue, 19 May 2026 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ei8rYPlj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gy+25Dim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9921A32B10A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187660; cv=none; b=tCMqfWUDLWMox4e+0d1ogfFbVJ9FGbFCjONOs8vFS7C1Yf+q0dX6T6nHKrJa97B8L4/8Xxa4/9TS0X5PWQrdm+QHMQcCsj0UBCMMDcllcTNupKncq/VpWkijHzWkANRfodnKAeXoJlpXWg1yhU9p7HywJX145qCepDwd8Putxuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187660; c=relaxed/simple;
	bh=yzHc1KrwjhHvrLapddPECGSX00VBdLIHE41IjyQ90GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uo8w54LWk05uHMLoCHNSuhRQHX9qlYkYHbVez2LIcOiVzeJp3XVzaJQa7d0nUll1R5QVgnkREEVyVQIMDbxMwUh1DIzscaZcqUIxGyuK71HRNdoNZaLijdwIv4pBScnczncHww4fNb9kIqoraFKFHhx0NiFyGI8dOgMBboNzno0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ei8rYPlj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gy+25Dim; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J89ZO81146343
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWmB9KzPMe9DxK/PQCkNZX5bHmWFcsUK5K9kGfphZKc=; b=Ei8rYPlj/vf9zcGR
	uZzcR8gkATmw37dBpVS09/wAGfBMJ5M7eXF7i7nL8KyUoBgMcAhxAEk5CCl0VQJd
	xtRY8x4O9rPp/oKJRuRUdknaxIqWMm/qvoiPJOCHKdlCl0ib4Z2tDVt/SThzrtgK
	jjACPda973p8jFjY5wt4EO1Bogh/nYdvmfbOqLvHy1MDrYik8FrDsqrgGESMGtlc
	V0pTNvYh5egqUaPp4hNBCNfBewq8xwuY5klZxC6kDf8oWjbUEH2Ah1ZTU97b2aTt
	8zLe5oeFrDBSRdZRYGHdhiBaqi0ADH5cxXyBOAE9RAo72ZEZR8fQmaSJSyVSwGDj
	wV/f8A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7ej33n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:47:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50de6db1eabso11126221cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187658; x=1779792458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AWmB9KzPMe9DxK/PQCkNZX5bHmWFcsUK5K9kGfphZKc=;
        b=Gy+25Dim+pqzHHEkF9lGYvO/m5CfQcaiGYbx4m40t9jmy3Rj/IrDa4hmHU/Cpfy1JV
         dawtZfSFqUtfJSEfzaB0TH8neIqqvaUyS+1evz7JTTX9Vw+CdJ125A6FP6FqbflJdpB6
         z+PXWcz7oRkGapsPv2p8i7dOEHP11a5E6VCuB8Qpw3Z76WI06dnciN/ZZJRAdll3114k
         XPqW0CJN0sOu73mwAM273ty1Xuvds/iUvMrgNthA9yPbcZ7ArFblFz2fV1sRRd4mJTaN
         f0h+i043iePDcLDiuHAu49p3/ZU3dse8IQVugIOaxZvVkqE3HxqZbUhbKhks9PdEPWXI
         3JZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187658; x=1779792458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWmB9KzPMe9DxK/PQCkNZX5bHmWFcsUK5K9kGfphZKc=;
        b=fDUabkJlR5ebZzkEXJOYklplF8AGWShQnroduCSn2bFg7RPFLHl/fwBTbizqjxvP3R
         XZVWSI13PQ5ECXY5TDbL6ggIwTsUI6g0+MQa4OvQfe28j7nZUyJ8VzAxCmbeHp3hor2E
         5n1iwYaWASTC+vOlEkmIxCzalnbk7+j5qecyyoGxRWUxG4dHsb3oI2iGWHceLEPJ1l/J
         yf9M0SQtIK2vPY5Lr/7xhRhPcMbfwbY/2YqJv5ulEWWjt2GaJLQzIqlEWAs0CppKQdy0
         nu84LIIxGHtTdBsh2q2DVIM18Y7AGoZ347A59Jg+f1QIQQJO2ezNgiKMSnrwWZrGiueI
         KWZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Xs/TKz3uG+1l0eZJaDPmhImsq14ZgS4luq+Fol6dl5cW1a4h0oAXpHzZfFViG6dE8dUxu9dOGX2eNeSlY@vger.kernel.org
X-Gm-Message-State: AOJu0YwukceOqL+f7BJtbrPPBh6TCBryGZiv+VA7Ba1KDe/OrquS2edM
	4L5lGYjSzCJPSotTXshF4GWMSYHtQDsUIYHFTwymgXvqYVz1iwQJhz24QeqOXVqYkkMiGU1voQs
	mLi0HYjAoOsZgaAbU5ZG0ZfZktke1w6sTODrj1jM5V7INxGN/nZ/x+5RlGeqYHBasrU9E
X-Gm-Gg: Acq92OFqA6jpoGSc9Lv/hUp7AvziNOldTYdLt4jJx7AfZnfZ07Ml46sU9Sg/nN06KCq
	smSCcMTOPhxh7Sca1Be7ob6G0jwsO3j2d+w35gUCUwBKQ/CqRQfa4YhuXGUyLyXgTV967qKsd5V
	Ux/ofYOoBLugN3lmqoJgGT67fUVpomtShrz4sOpbx84zIPtlsUiY9t6ZxePApSqHBC94NaWMs2W
	kPnVv7xBGRgs1/CgM/rsyEYMStYfFdPq0jnnMgkfd2quO3R0BgTQ8wzTYQpW1+26A3qRV+pBIBv
	dgYKlbImwqgyNM2DFyn9bUo7LENkH+3ciBesVf5q3LeXM7Qm8n8avGtztdp8l+iC3AZL6AW3tLu
	4f8mqXl0j33hbNzUECpgPcwKyzi/8HCqgMJDo6xL2ZFbRHYqQhSUlNKxf9wBRLRvfJzSzpgIaeC
	VzNbyjnEg7iHMKSg==
X-Received: by 2002:ac8:7f10:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-5165a0c922dmr184664821cf.3.1779187657929;
        Tue, 19 May 2026 03:47:37 -0700 (PDT)
X-Received: by 2002:ac8:7f10:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-5165a0c922dmr184664441cf.3.1779187657444;
        Tue, 19 May 2026 03:47:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ec000csm693210366b.60.2026.05.19.03.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:47:36 -0700 (PDT)
Message-ID: <ef1edc3b-a34a-48cd-bf68-572fa57babee@oss.qualcomm.com>
Date: Tue, 19 May 2026 12:47:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
 <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
 <20260519-first-wine-bulldog-a6a4c7@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-first-wine-bulldog-a6a4c7@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c3fcb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ZX6by8Qv5zPJwBpBueMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: dP57KtgsfphZki8OMgpp7QKN7KffD0cm
X-Proofpoint-GUID: dP57KtgsfphZki8OMgpp7QKN7KffD0cm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX6llR9ktOE9wb
 Q7xcEfig6ZdddYjJ866gGz0cLsJSos1EaOhPe9+FtD4S15+qcdB19Y3++iv66fsDO569rzVikhY
 XasLs++L7jT/SfVSYK2gZANa/jqirvnjI3IYdyUgIDami88/Vxp8ak1MXl8TRxJFe+L/G2RWIv/
 qQsaB5w4WjuRgCWYD/Osgk8R7r8letMzCOJwqwO/G3PieKIH5iLvoAj2zWhq5UVYg2ADbBw7v1Y
 slLw3l7yQU1jhCEv+zN93sBIPFG92b0cnjPVAiXzrV4p+KVJYF9q889ffiAUw5QV91TQ/wZ7S9y
 Cf6X8cC6Os24GJZ/42nh2IsDwxEpePh5QtwqIbrsP4+Snir3nDRe4YJKbHFVQT+6IvmXJF3QZ/n
 dOk7Mh50N3u5Skmhy4Q9aFvpwlh46BOZ+P2JW+NYdI+dAOpO6MMz07JictgW/5UfEh0JEbMRvFZ
 GlzlC23lYnP8MLm64fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108448-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7393C57D0E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:35 PM, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 01:55:26PM +0530, Rakesh Kota wrote:
>>
>>> And isn't lack of monitored battery property enough to indicate that?
>>
>> Regarding monitored-battery — its absence alone isn't sufficient. The
>> BATT_ID line on debug boards is pulled to ~10kΩ, which is used during
>> development phase where some battery properties are still present. The
>> same ~10kΩ value is also used on some genuinely battery-less production
>> platforms where no battery properties exist, making auto-detection
>> unreliable. Hence the need for an explicit DT property to identify
>> hardware platforms where no battery populated. 
> 
> I don't understand this logic. So you claim you have debug boards which
> do not have battery, but define monitored-battery? Then these are wrong
> and fix them first.

I don't think any pmic-glink device defines a monitored-battery node

The firmware is in full control of the battery charger (maybe with the
exception of some coordination with ECs on some laptops and maybe if
the vendor has some very in-depth custom charging hw, but that's
educated guesses)

Konrad

