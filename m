Return-Path: <linux-arm-msm+bounces-113429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hui1Nc9UMWrVgwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:51:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3346E6901D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:51:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eujTWhOj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b7yWw5RX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113429-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113429-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5824C30E0113
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0C5347535;
	Tue, 16 Jun 2026 13:48:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC7B2E7376
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:48:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617737; cv=none; b=Z1w0oclGKYeb9WMYXA7nzIsLvq2v5ebicctmpUjtcYyabmhRMuGUFbJXn5F3tv9CXudQZaPL9GNidg4XYv4doDr1I1I2+aNq03uWSt/svL5V8Z7cWxHYC3/RKeDCejW7/eGzbFzVPiRLP3DDqJ52AWgGmOFuTjQ0dqkwewkAKGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617737; c=relaxed/simple;
	bh=/RQTCH2NrU5Xfm8tBS5Kl/O5S+5VhYXMGcdRggEnH0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hg5GL3y1ShnUCMopr3nWXU5JJih2N/MEGPKWAIyn0r1sfcqTGzwWopXtPSOdukuPoo8nHilUB2waPIXIIzAEGmiLYxrIxBJiqH7rVNLdFtOohAFfrmZy3XfbNro1FU+4ykc2sAdyc4iRFiX5kMYgWhQN2h0fwhk6AtliA9x1mqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eujTWhOj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b7yWw5RX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABmXv3384102
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fR97z8G+6jgCJqQFZPM27zlVL+SHnlSX452SnbUL4HY=; b=eujTWhOjz0AL5noy
	NigIlm8DuKdAXUdX0pyCMGCgZbnk1Fz0wDsUrfdL7ixMy3W/D+BP6SvUNXMitHaU
	jN21qqR7l0KSXyoLHe5UL0gStrBZM3otEkk5Hig1mvBa54cVQK04IspIjWcDyF3z
	qlEkNh6HEmlKkTMp2gc7eGpBGGaY9610rxvlsnDNMEbFBFt3XvHxraa4j4uY+3dn
	5aN2DHwwH5y2g0/K9MrIUVb809wvTkfcQpNRpkTUHrfwIOHQqtkeb16WsHrMLalc
	5OeKJnDALiKrvtvl7ZmSkr1AAX9udIgHMBGAlneICiYgRTjADSDeixEatbXuUvPJ
	9HAlHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep9rjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:48:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b9d0162aso50466185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781617735; x=1782222535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fR97z8G+6jgCJqQFZPM27zlVL+SHnlSX452SnbUL4HY=;
        b=b7yWw5RXPlneuXvwuVrcoOb7w5IRlZ9EtrFfDJH6cmYnGYkya4nrMDaEEwHv/H8IMt
         YEKpYr3mGq1vO1HXHqp3NdDqjbpxj9ZODFOUygeky2bcIVci4WO7VNJI5uq0joLIJwGF
         7RYPqFuWx06DMEZCnjSAwtAfQ+jGbwYuQr9FaOoNAVzTJ533P1LBv9oIGK9LHxPpoA5u
         Ww397+9qWurZDkhdhyRGSPPlE7lHofi1m0CzaA+YzNsdSiCY1oioZafj9ja0o5JSJJY/
         w6ghGqxp+Vj8VMkGKaD7r07wCzE3Hm23EmM47PkOsnMzhJQ5mqmRb3kyGwhcPyljX7kZ
         2TOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617735; x=1782222535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fR97z8G+6jgCJqQFZPM27zlVL+SHnlSX452SnbUL4HY=;
        b=NE8AjE8ZDCh+7riubYPg+D8E/pxHxJ9G9tgvdSFa2khJFrgWZRi853tbi5US7Jj6+q
         ErnjEJ1Jnbn16nR0Am3Hxz/mnDJ3bCxZ6PtMN/SlwoSuAWIrvJkH3QglWZTezQm0M4Ud
         HQ1DmnrjTq+hJpC6voxhZ5HjeKKgGPS0Shc1/DHWgDGNGGoouRWG/bpaogs1WumAkBg+
         2BA/NiPMGeapepI1winoyDTfPBnqRvCUSDIKn8rVTi5/py9J2le/kNcUT4IvPg68QgDv
         nIdDmOqwUc1jZrk6UhpZ6iCjHJYyxCOZeYrVwTHC6fTVwr0r/ElQVOg0bdSalVXDVYcf
         mKLg==
X-Gm-Message-State: AOJu0YxTCGvnxtggOw6YMii6Um2BmM1c9ODMAff2Z4gPqJuBJLEMFo9R
	ovyKwo3CHtgzaEKgyFnbEJovS7piI74HPSFUg/kbEJnagJBXkx3vkhaKt0QG5WXaMQ+oCNYEMMp
	k1yUx8v0wxZfxktQJuA2HQLlywEXAK1BWJWvxMd9As7IVZE9avIrpbMxpZic5G4/RaV/j
X-Gm-Gg: Acq92OG24sO/m5CDBO0M9D7/V36CRh7rFrdeSRmLriSQXGZMewIwjY7f7y20lzmUoeo
	7y7HVEOcEj9osby07dSen+VKv9xPl8LQC3OxVKpQUUoL3t58DcNl1T95kk30TV3HXYA6qB4qVCn
	kJZ29ajoa5bvopzPfGXuVH9xb+Vd9QZT7NWO9a/2H6tGqiPzyCj2p73kJojqem9QMYnEDTWxAFN
	UNHkZkIc9TVP3kLujSbFt/EcWINVpjqC3FUAsmUe9+G8GbeEQPzjCSSzfDFore+cjsW2+ivFh7L
	nwmOIBYceyPitx93EDr4ED8z2qAlEkrxy12jYi4SlvP4Qv495PBzqy/hdOF8ih39IXx2DRLquvA
	2lh0jAZUG7w/wP+htsxTJXgc0WB5TJ8tYiMyKR06ZF/0bcQ==
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1691619185a.0.1781617735081;
        Tue, 16 Jun 2026 06:48:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1691615185a.0.1781617734519;
        Tue, 16 Jun 2026 06:48:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6dbd7sm645710566b.29.2026.06.16.06.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:48:53 -0700 (PDT)
Message-ID: <3e9a3ad4-ff23-4b58-bfb7-5dda8f7d7067@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:48:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP
 remote heap
To: Jianping Li <jianping.li@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        stable@kernel.org
References: <20260429073443.2027-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429073443.2027-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a315447 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MRSJXwsh2T6CJOjOMtMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX/zz1T65wTGcn
 Z2lutdlMbZr1OvljVzUX9gK3UUOSwIlLfCrPP10wOjzqeV2H/Pl5Q5qyZDtRlJPjq91+APzPaPs
 lR6HQnddUY1f6niKri3Fo7h061AYIjE=
X-Proofpoint-ORIG-GUID: pW0x7V2jpbg8B0Q-cfgRSKosORs6X1gW
X-Proofpoint-GUID: pW0x7V2jpbg8B0Q-cfgRSKosORs6X1gW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfXxlo9u3M/LlLw
 7WXi6GG2lraXBFhpoz14WD/b6EQRzJ4duNKX6HoSbIQ2gwXPX58PPdW7MYSUhm8scZrWpXM4pkW
 Q58B5K5TCtl/lH5+a0rYvoXjJ7RRNjJr0mijIu/lws5FWCsBWezNUHDYMQ6/Oa77CKdc59xvKhq
 aZd4nHwbZC9cGp0S6l3j9hwRh4P6rn6JZpLfj7gV3cGAkVvdzeO4vn/LkvOuZuTFO2UUAb5whnv
 wJrv623DP7uWlSpvy8RtiQNSIVsvNZI2NbjVmdrNjQn/TqzEsfQESFpbrP0hvVN8F1+7Rv8qPPf
 78g1H42+GAxn6Iq2zw/I2I+SudH1XLHstT79qtjdfq4PU39eT/oREYwWT7zpqA4mnCBXuB+1ogT
 fKkYrkQaelSw7JXNNQbFFr2uFQOfTVQdZKEPXB8R6krtJvEyo7NahREXN08SqH6DRvqleV4gSfj
 aoyPJI+53OuvjeQLIfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113429-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jianping.li@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:stable@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3346E6901D4

On 4/29/26 9:34 AM, Jianping Li wrote:
> On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
> reserved-memory region overlaps with firmware allocations (UEFI/EFI
> runtime). The kernel then reports failure to reserve the region and
> subsequent EFI runtime activity may trigger aborts.
> 
> The remote heap node was described as a fixed "no-map" region, which
> turns it into a hard carveout. Replace it with a "shared-dma-pool"
> reserved memory region with reusable CMA-backed allocation, specifying
> alignment and size.
> 
> This avoids hard carveouts and reduces the chance of conflicting with
> firmware memory maps while keeping an explicit pool for ADSP remote
> heap usage.
> 
> Fixes: 90a58ffa9c55 ("arm64: dts: qcom: kodiak: Add memory region for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
> Patch v1: https://lore.kernel.org/all/20260423063502.484-1-jianping.li@oss.qualcomm.com/
> Changes in v2:
>   - Correct the value of alloc-ranges
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

