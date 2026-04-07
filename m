Return-Path: <linux-arm-msm+bounces-102117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL8dLBjd1GnzyAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:31:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 307BE3ACE34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 258F13074D0D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5233A9601;
	Tue,  7 Apr 2026 10:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA5fkyJv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xfekwt8a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D383A4511
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557635; cv=none; b=dpb9HRgq0mumN/Qua0Rww3fd73XEe7OzBxpgL8bRzthMyoRC+uyAaK/7Ax9WyXaLi7/OdFxWlDj3HbQTsoulgTAQfiVBbeGu+y/+LKESkMydQQUnmr9qoAXHO06fEwGyLqjVF0oUDzwXNUjdQYdXAqoT8I5KQqtSN5+TEpsl9x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557635; c=relaxed/simple;
	bh=C9jS0F/gOzlNdQxVxMT4uShJahv/zsqDh6pXRNRZRew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=okLIHZQhUSY6brGVffyyRMzxis62LdqVt5kV482z4POhI+ylZ0ADMfV350kn2e7fH0855cqKiAtAgpO0H3OdWYMqQKZstSJQ9HWhtHI8I9pLpGqZNomcnUYcQPI7zBJuEOUu1ssGRkg93dccGyx6bguBSiPZJAuZdNGyv/EVEvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IA5fkyJv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xfekwt8a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376i4481584872
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=; b=IA5fkyJvl9h0hHVo
	DOIu8XsmmeEekiKnN8+PaChhtIMkjVJrVtWxeZrrpt7ZF/wp/ioF7ruzzSnj65k/
	M8uJQwIELhJ+mzfmC7kyjuUucyTFOIvz7w8bIP1vsHSNi3W/EZgoQ0q7VmrEr/mP
	8v0gBDrC75hq6F15CNUPuzCDqP+jPDSWX/hTNRSC72gSLyTzFkCBZ0FFaK8Ng9iU
	7JP3L5GShHhKmbw48Poz8ofFge/x66g2b8guwEFLgfcmrBcudBfFX8w9tK/bfMDD
	GsP9LsKvQNTt+qpa+BXcD2GdhvoFmxjiCkSoxXc6v/ssbJnaa8+umywahI20laEK
	3vxbWg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9t9af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:27:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ccb129547so16795486d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557631; x=1776162431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=;
        b=Xfekwt8a1/WtVoSxqscHnwGHaShjMhSX8D5BvTsTSJhEN9Sa9lWhFeBLYyRJJmGH4i
         mVyLbgm/nnpl17Pn/dhpec1o/yLz2QZHHqo3kVXPQuUSeF64NAF1aLROpAAcRrms6FyP
         MPcbmsKQ8RuUOaSVrApJsCz1YbgqBExTwNtFV0xRVBTGModShp1rtlHdT9ZXvDV4/LTp
         tg4kJKhKVjkSSstYGvcEEYJ7LPMnmGCh/r7MPpA5AVTQRM/N0pJXlxdFwbOroQI/iBoX
         VDajHDsH+qBqLxDIlJU1KZIwu8akAuXzvWZ2R0Z7ERe1JeeIrTr8o73PWOl5ZjA5ym2m
         M7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557631; x=1776162431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=;
        b=kVhe2BfaaJk8iFZPuMVwD6txurEXF8dKZ3f0zNTzVeDwPA4RdikZtHW7VNRIaUmcus
         OwQBwTYm6tdRQ8+CPFl2yMAjO1ppUWq2zq6Nm9nk+AGgRgKDg4CUs/7xtmzkBBz3ElqZ
         IUJa40rm472OHnIbq3aE24i9hgCY9YtFeLGOoQ/pKjV2N93h7HD++f6tAsszhlc8DtE8
         Jxv0IMnECqTiFsc2rhwxbvcdSw1KOU0aMzXy2+NYmbvWO6RrV5dKpGTk35DebjBxjwDi
         CC1l7Olf6qPDqKHrBxPsuCwNauIRBhE1izqiWixQhku+foMwJxw3pfDfH74JE0AmyJ71
         WXFA==
X-Forwarded-Encrypted: i=1; AJvYcCXpOcjaLjvrQd9FI4vYeHKP0qwhY1tL9PNoeNclPITkRlnBl6XeLdW494wxLNOewYdXE+RSJcfHGdFp5GOP@vger.kernel.org
X-Gm-Message-State: AOJu0YxVBBpBkQRzPisy0cZ5Uq72SA6/two0TbYQOWMzKDj/dQi8MCtv
	jXrxqGOYOtsCSkZw9TFtkVIHlyUf8kpCVy4dTB/8YRtU+CAKc2bU9lbeYaZz6NPNP7op3YGWUrM
	R5MDD1BaXBe6UTFo3J76/PU80Dh1CVTTLfKWN7E+b2x89VN3/8oX6VIcxvNt47Lo9BeFr
X-Gm-Gg: AeBDiettL8yyf5wc9UCZbv+QFOn3sRp3/6Qv3ehhIJ8itBIItGoPmOdb38iV+jYfpoP
	JROHIQhrzmvLb6fRlIui9hnfZyNhFEjm6W43MJTRf1Il7z7A+VrED+vBuPM8JeM3imTaqmpcurD
	CHyMFaobIylS3QILmdC3D+I8YAu9Vs70sH87HKxprs6tuERPv1cg+Zl9FbO2UUwZcKk+AYhKGAK
	q9m3tYZ4sY2Tmstn/ArRwaumrZvUBYr2ANyibTkw4dah4kQHFPgcLPv0ccvYCotRsmrV6lvWjt3
	RLsd1URFq9EQGl0TfndsJY3Uki7VI4FnR9zkIcWcVhMw0D9VRJzTXf5FyJOQeYG5f9/qKJI968x
	cG4T/NUAe61l6+HUFXBhmEp2k0Wzn/WlplqMCvV9TUptj9k5jA7+vR1NM25VUs/xNoIPar9NCuI
	KbNgk=
X-Received: by 2002:a05:6214:e4f:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8a6fefbcb68mr192040776d6.0.1775557631055;
        Tue, 07 Apr 2026 03:27:11 -0700 (PDT)
X-Received: by 2002:a05:6214:e4f:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8a6fefbcb68mr192040476d6.0.1775557630576;
        Tue, 07 Apr 2026 03:27:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec5c16sm538210066b.40.2026.04.07.03.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:27:09 -0700 (PDT)
Message-ID: <42f82377-c30f-4cf3-a57d-9c85d9c54053@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:27:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
 <20260406-m8-dts-additions-v2-1-c4c4bd50af48@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-m8-dts-additions-v2-1-c4c4bd50af48@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4dc00 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8poMKPHdAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uSwIeAtNGuuqP4oK1qMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfX/JYfqI/Oy2LC
 yXLRTQLH6QPNiU7Z6myF9y1UpOyxND2i5TJd0iwLPUbGCg4gJP15XnNwEm0GgV/MaFsExDZr/rl
 7St+3uclgJfxGAkkvJwSra5sHqMAUgZnCujmQ4bq3nvzCoW2VukluxE+9kLZvYUS9hFPT7Vl9Yj
 R1PBeFUykasyZgHDtQjG7M9R02ffqxFW/aqIowISgUVpbdsKSnEcIYMLY8rKO8Rb5LD/1S/LXfp
 1jo9KHsy79Z5wqpsgx0WwQhRkysIYlLR7vUjJC2NMHb81lSOh8ZV023hzEyMlpuUK79P2XfGnf/
 /uXu6MqWwfE62QEFkwj6vyKIrRTPCd10g3yG9aBZokT5AJBx9bFkRYRRDIDmVIxXY4PNVJsrkgI
 J23ocM5fLhzdSKlsGpOMslS94Kadqq8besmlzzMg0SIApIfSARRgyHU8/2h7nEHgI6J9MxknIUi
 SlntEf0Qhi24hQPGwsw==
X-Proofpoint-GUID: fmHBY-Ta3WhlFXVqhH0Uwa7OzWWWyymB
X-Proofpoint-ORIG-GUID: fmHBY-Ta3WhlFXVqhH0Uwa7OzWWWyymB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102117-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ssier.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 307BE3ACE34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 7:16 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add support for the notification LEDs on the HTC One M8.
> 
> Two LEDs are available, one orange and one green. Together,
> they both form a single notification source, so use a
> multicolor LED node to describe this arrangement.
> 
> Cc: Lee Jones <lee@kernel.org>
> Cc: Pavel Machek <pavel@kernel.org>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

