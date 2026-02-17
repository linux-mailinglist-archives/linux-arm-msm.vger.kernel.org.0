Return-Path: <linux-arm-msm+bounces-93101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKLrGTw7lGntAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:56:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0E914A97A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15BF43018774
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4125C31A81C;
	Tue, 17 Feb 2026 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbHFJkUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dXSu26JP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1603131A7EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322150; cv=none; b=mGeWkMfv8JvWFumzaTU+g1UaeKom1XkVS8a7InvP4z6v+Hlj97z6mIABerab6gwRUY62p7HO4b47kpNoYlsym+3yVfSISkhi80QOqsAOYRKAkgvMmmJneRoAUc0MGEDZ30IPFryfG+IJ8KxTaRi55K68e6Iu+OJc963t68i0ijE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322150; c=relaxed/simple;
	bh=oY+fgxVJMC1euNm2QqMaakLCgd2D21WoopvIQGCFI1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tcFQ44zaS7+OnGlNCz/hNVzPI2lu+99+YQQmtCVswTZ4EuoREdC5mrZtlCvFhwbGGtXDOS8qlVup2hJ+qOd1MaVu6zXPCCMs7mNc+wGMLN0SA0TQBNE/XpvndZT5F44P0Q5NkVVNoMdBIRboLj2DBdWNcnmJeNbjWW1pz6jAh7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbHFJkUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dXSu26JP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7kmJ910705
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tZDvB010DcisVsobvsm9FaJSN87LTi9deVu7cSebkU=; b=SbHFJkUSl8tWbq2a
	ek42CZLfZBMMeQFObaJJJm2NWJb/PwDawmTAUn1ripkYMMI08z+kGpVDCsl1r9y+
	7f6/VmKa0Uzopg5wyc6O2rSoOaDBUpDo8xMWOAOY9pD9pxTS0HZLpliL11LBfz2H
	XO9wZ5ZmT0lfqQXUi/KiqXvjCzDDlXTvTKtU/Ybw+mtE7FjBgFyOtK7deMBFKsMv
	hT24Srj/if8onSAXeUMkWz+O1R5PXHDTYIIBRqP5z87pZvCjmRH85qXaHLrbw5z6
	DnFVoPDiakPf8d73PS/TWGycR2Ia2JlAoonD64NImljs0Wnv37LtGtNzc2MBEna6
	GwBLSQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9svvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:55:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89547ddf32bso30513616d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 01:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771322147; x=1771926947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tZDvB010DcisVsobvsm9FaJSN87LTi9deVu7cSebkU=;
        b=dXSu26JP3qE6QRtTY0p4QeOnNMPUvYIJWUZUYB+JC4Byk3sDEXe/lFjTmjmH5keq+s
         +Z6eS0Gf4t2eMJOJ0q4eBHlprSWgmukPlijLc82YvhDpu25mM66Oq3Hd0c/j0IatE2Zh
         RT8fU9aqFKOxx2gMVXXrBxmvOznJJ8lXBGcNQUUn+LXzjmMrML78pwUrY1DTLU1Mxyvq
         m1Ceo5eREWgRrnECYELApJtUQnaTtzEz5PP+Q/KogO3NWm+2JFjhMCQOhY2ZmnTzh+nx
         ivo93vK995FNt05qBxR50T8OKQSEO91xBh9AcvB0UkyC/NC+FybOGfNiqdshXVibFq+u
         h37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771322147; x=1771926947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tZDvB010DcisVsobvsm9FaJSN87LTi9deVu7cSebkU=;
        b=YdI1k7oiGMLtFimtXNZOc0zBx6bWeTMg7xVW7g3adzKFW23iNyW9BjTVf+t7JYC449
         8YxJFqN/jEBxqzkphe1NuZ+SKaAyRj25wtpkb4vHyMdlcnPUQ3zKieG8bZrdCh+8Irma
         vlFfDoCZUu3AN79JnF1HXLKbu7hMH88O3MZ3+SlargPdgqHy6NP6zUqZdFjMTRCOc8wA
         HTG4amG9kw/SGCKgptF0vIr64cTidrjSQMzHWJ+/42jlOyxI5z/UhI4beKCk/oQa5gRq
         GayhHnHYfZH2XQSHIL44OFt2KNXnZRaEwKYdIf4ztwL3r3xUV/hA8BEZslQw7Nx/95Br
         FUlw==
X-Forwarded-Encrypted: i=1; AJvYcCWulLWT0Rxgv0oAEcSoTXwq6QQn7QG0YL4AzJ2p4PiODhSjLUtSy/SDR2X5HoAmplztkiVD555NAcGquNVP@vger.kernel.org
X-Gm-Message-State: AOJu0YwAugkLGyLegH8WydZMDJ9vE91QsIOalwE6bpcZUC5le0qQeTgk
	QXLsTdmXgaclviYoSmfsV/WlOHPTwo4osjuAOy+q9gUxi09skjXF0SVdUiH7pxscsm4VmEUjNmx
	6p6UEezq+hQSVjrh1kxgUfLnUEuOVtzKpLNlTA/ZcwRS2KVgKR4eKEmakhD5GoIVxr4nJ
X-Gm-Gg: AZuq6aIQ/OOPAOKVuUaAdIejVjtuuKgNTK3wcjUIW6nFU3An95A51lO7/54f6w6Walw
	kZJoVx1ofqqwrlb6S7nYZw5Uj/u7fHDqgiTxw0Nqm9e9nsxdx2E9Tf9QibR4YXRuRpRP23T8f1+
	pfL/XIobHrPDNxq9hTAdfcg6JD2FVtgzv6oKm+eAp4XeupFNnxa6xWvClYkem4OASKEPTliX06J
	Msg7NgY71aAwDcMR1nPHXA3x+PxfwfaPmbCZMVpQHk2vTG0kl6wKoVqwbSyKKRQlJ2sVMqyx3Kj
	mCA5/wmVglgRH4DtbIN583/ZhanQ7WYmjzQWYGfSUrQggfLtLuKUbInGfM04qkIM4YvEKlDnMAY
	zv5AFwmGJc9FnSUHMgHJJngvcuwJiy6bhLhXc9D8OYhvL3TzCWm92fmhOftQfbuHtWQQl15InpP
	AL9R4=
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr139028456d6.0.1771322147208;
        Tue, 17 Feb 2026 01:55:47 -0800 (PST)
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr139028256d6.0.1771322146770;
        Tue, 17 Feb 2026 01:55:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766459fsm343188066b.45.2026.02.17.01.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:55:46 -0800 (PST)
Message-ID: <6d7ff022-f2d5-44b3-aafc-db64af4c283a@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:55:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260213-fp6-hall-sensor-v2-1-ecd113d4919c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260213-fp6-hall-sensor-v2-1-ecd113d4919c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA4MiBTYWx0ZWRfXx7gW5meuWHuB
 lu8luctPQlvDUJBn/XKyZmL9DPi1ED0mK+hXIZyH7d4XtLXeD5t5OkQxHvy1A/FBKAipFaxfNxK
 YIPAmsgQ6hxQwsYs8te0+9rkGrk/jq9dIvS/tLB0L+u82ZZ0aVtCmmWZy4AA1vmBakcDaAvw1YU
 Imarjm7n9KyQEEeGQKhz5xrtYA4tPuoV6AllPShUq+DExbsmTOQ+83dMMerl170AaFDJcZKkkPO
 vqGVW8/othqZZOpfd4yKTdieBYsma/rI5jbY395SMog/OUmrgqgxIT8G2FwL34dzqbjlWzUv0Ee
 TmWGivrBMg7bNWwQq/0R+CkNiroJ3PuXeU2GvSQAkeFIAXpib3TCqSOv4d6Cf6MPmmi7P5NQlaa
 OXoE44hbGn0GfhB0+bBbbRDydo5SYxjc4dFNYOhh0QiuGR42VN2J+EaQ/3wlJWkBzehNP+mvRYT
 /69zhAEHODS8sk53BIw==
X-Proofpoint-GUID: 2d4Fz8rpHK8ObixObbB9bLvPrnT0sI61
X-Proofpoint-ORIG-GUID: 2d4Fz8rpHK8ObixObbB9bLvPrnT0sI61
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69943b23 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93101-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC0E914A97A
X-Rspamd-Action: no action

On 2/13/26 3:21 PM, Luca Weiss wrote:
> Add a node for the Hall Effect sensor, used to detect whether the Flip
> Cover is closed or not.
> 
> The sensor is powered through vreg_l10b, so let's put a
> regulator-always-on on that to make sure the sensor gets power.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

