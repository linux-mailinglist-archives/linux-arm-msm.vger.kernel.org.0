Return-Path: <linux-arm-msm+bounces-112744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wh60MJ6eKmoktwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:40:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C0867171B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:40:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Yph8hWEK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N3DPlcGO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112744-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112744-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 531C7305F558
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1431E3E8332;
	Thu, 11 Jun 2026 11:37:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E03F3B9DB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177837; cv=none; b=cUg1iGNlaO7NRhOTs5TDEBqNlT+orwHpvIyQVPF+c7+4YRvwuJzkzRZYA9yEHrUdVu7ym9vVmjnGj//zgruyBxEqlTOtBwr68WSb2j+tn/k2iJaCokiih82E7Ius/eBj2QFlwpUQy7X8QSfGGf22lFzBX92btTwLzK0TKNdbpFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177837; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJezZ7s+EzRfrcMMF+iCe2tnYr2l1ZPvZotO3ehAdYS+r9Az08Rj2DG46jXcjH0cAC8IaaTbKDzB2ku8dq6YWEJanBh1hX8GzXjJ3gSfUhoFGXKn4mU6X08Gu2tKv+ZvM8/BTWb/7hduL+pPV62jHCA2wWgtP2Q8ewZ+twnSnnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yph8hWEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3DPlcGO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xJoP2890193
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=Yph8hWEK9U2jD+Ij
	kpO1+tTYRneGR8B5Wcgo+UTgf5jYgKzt84TevFzpHktkzjJ+vHUZ2K/Bay0zcmyx
	SsnJqms99SPsbCBjj3lX1+QorcRQ3V6y4TtwSPzsgaKRWiPIHP+LNiPvVXswPkjn
	QehB7WlBfn080Tadnm6ibVvS49Far4nurNWwqkibN0TaZUmK/cfcyDsaxQZpjBk2
	a5P+6foElCmP5M+s3+wrjAvRG6FKtcA88h0ZVfSlTqShm/goR1Qftlr9rU5mNftm
	ntFROFOgeBkAKHGC0vB4PW1767i7/ogCEC8+qHbgBrBH15z4jO6+qCMdRCo0Hz6J
	cA3m9Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79k4ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176891d0a9so20045851cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177833; x=1781782633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=N3DPlcGOMoXITzruhh5OS8HNvnNwCQG2ipPYTGZ7hyTdedUUkhrzRTA9EO+ToLDpur
         M1vKhzmXN1z6dmizR8hSUp5saAw358Uh/ZY2XBteFDQULqVTWn3/hXAHU8sKfX7n9ygx
         wS4Ja1zSYALQCoC0EjNq9LHGeYEqZNWxPNXRkVDvUXInt70QRe9BTI6IQr1iFdegr8p7
         ssxP+WNRFdJS+Jh231dnKZ5wrj+z5EIGLZ9zRgdZjgVYf6Ri3hAAVqQzz7Bg/Rwj+BUe
         B2LySDJfQ2evTtmNx+KbIZuq8FBiTxvlHRsP1LpO01r7Hr6cZ57LLWhm9JrB8oXvtHjP
         keRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177833; x=1781782633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=Znb/I434D7DWFMlm6rBaGm2wzU/2ss9yhevHCncqaD8hPSfjrj2va/+svjVgow24Yu
         chWbU9yKOPUwbRl5LtsG1V/vHpjdnkGLo+u28iB4G1O7QY/rdh1D6aZhZriIKLhBxs1/
         C4QLh6FDf3o8D6dQwkH1zJGg+sMGK8FWQ8Fhc4xiZxdoA+AnCKtPtJ3r7dzXMgSltvR5
         mwvp1Tdrs4s8uJAqea6qQ8OKqKlsukjWAQq/dFdim3CPjj8ivD3lhOL+3egUdQlainIJ
         6QNRnZRxaiNGhs/amXy5K0ixXp+76ZrKMkZPg4eSdePfwVDLGZclMADaEciGl8/GUoEg
         /jJA==
X-Forwarded-Encrypted: i=1; AFNElJ9+avGMJNJ+0PsJmAW4i/uXJZAz4otyRGDClbhqz6/GNaef5YWuBp+gOIzPViTcl1Uel1XWXWrUdRBu40Lb@vger.kernel.org
X-Gm-Message-State: AOJu0YzwDiH/a3lZaF1GaXxWRbfkJozcZa6bTPVMPBVumIWbXVNYXsKR
	WFpklyHTKhTfF8u9RUGBK2B+f1nHiSnf/gygFsCNur/HmJ1Exmpl9nY1ro9DwtbUL1t+EiOoy3q
	ZvJl+U4QB/6BhCbl/MXcSwSRXcMacg6WV2tyiK41AkVwYk8HC6RB960LsD7j/v5djS8/f
X-Gm-Gg: Acq92OF+f3OswBtazouA7DWxAW+8qEsOBe9+DaC6BlU26T23c5AhB+lyVs/Q1r4hrqY
	I/fNU3VyL7bR3hqkxegMtlX1yt4X6JIrJnXTmz3PY1DhdScEVLisnZdFGzAcUZ/sHp4bOKWJFWz
	y2CLgQpV3ByseqfSQszt6xeLAkOrxNT5WEdG5AGHJE1HFOHK0WGZnO7HeVSq2tddmEnZj2hdTPn
	d2wftQGa5lyMPiwoB0YTmm+BeIY9xYt89P/gMoiHAMU0umY6O6dIyyJtDGSNY5rJq6WOVoh16Q+
	VjgWaphId08GXtkI7K/7H2BcTb3oHP40jT+OtFhz2ASMZBQ1NBxLoIMd6C6GKQwO/la/LSSzOga
	MQrf84OabdRUIsJCaQ13Jm2kFxQqGMMGPSLLhn3YXvioXirKDYfJhBWdj
X-Received: by 2002:a05:622a:4ccc:b0:517:6d82:9d7b with SMTP id d75a77b69052e-517ee1d205emr21557641cf.4.1781177833025;
        Thu, 11 Jun 2026 04:37:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4ccc:b0:517:6d82:9d7b with SMTP id d75a77b69052e-517ee1d205emr21557431cf.4.1781177832570;
        Thu, 11 Jun 2026 04:37:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f147e2sm53745066b.7.2026.06.11.04.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:37:11 -0700 (PDT)
Message-ID: <7db96e0f-bd26-43c1-b565-8886198b1fb5@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:37:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/18] arm64: dts: qcom: qdu1000: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-10-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-10-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yQkWkAemNt0Xi-_0RBZkm5JowMBn7wp0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX46QG8tUzlJ9r
 ADmfE5auZLKbT5Ln6c1V7vMKl2RbRzN7XPqu4IdKgkGyqvIJZGoM9r/E/BfDd4LivC5pgDoUEpP
 DvET3JC2YeDB+RCYW2s63h75YFl2MxZLq1WTlqX4fm1KkIcFUpaesB7XHBjigzTBfZopLQpEHCv
 0jBmpiYtLRgkAE5/YMX/qqigVuYGPnSkDdcM6YNJPjsOlA/irPltJccO+2/qXmHXQXx+NXTLRfQ
 nxO7CH4PDHrUZEbTL5O/3JYjwzrSnhJY4HEpWsBX+W4uublMwizSLCSoMpxXbpI/hJcq1cWvY1C
 yoJdb2n9MtoQnnBwuWtF5uBUHTml5fKz9pIJ5XDdP6tns8YTA8nka6atAxNqMDlOoyKik9cs8VU
 NWTx7GdMdRyHxTdz1tsVcdBG69pSf8Ovd0eEMHf5eHNBDxvUjmFynqHdT9iSFXoalfBm9QbR302
 Gb0hUXTJ4g9PidEyfgw==
X-Proofpoint-GUID: yQkWkAemNt0Xi-_0RBZkm5JowMBn7wp0
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a9de9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX9jupVYlsCLSR
 /0lyXpSZjWWMuvfKIclSM+3TUUl3fXOlrEPEG4Hz+SAsdrNhMJUHwmUQ4yvL31c1/RqSge7h/b+
 BZKAHMS/O/akiwe4/mJinm0RM62XTyg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110116
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-112744-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60C0867171B

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

