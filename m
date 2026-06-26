Return-Path: <linux-arm-msm+bounces-114693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6YeBCoCbPmrhIwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:32:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B38AA6CE82E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:32:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UqhEW8qK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F16O86Ft;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114693-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114693-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B49C302570D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 15:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E477A388369;
	Fri, 26 Jun 2026 15:29:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9413976BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:29:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782487771; cv=none; b=bkyYsR9X1LLo8dV6gaChedMz/SbxuQzclnZJvjM0SN2nlw9hlWyioJos/r6SjJxf14F17P6CHEwwUOCQbk5RUMbOBMd4RbTVlO0y0cuJAy02WiqMlHoTgCDk8/yx54M6Rlj5Pgrap7KOh0NvJdnrRCo4HzGuROMGpXxLIthGiiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782487771; c=relaxed/simple;
	bh=qznWgINjW89HZ8XKIFLhN6m3p2kCb3UuuAC7xhAjnnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfYFA0wo4oh2zQVRE59Na/VMBJhQOaxX2hc6qF4C0KjGFahGScHv1hFECJzt9OX0t9s8eLl32LhCXaqgy5tnfhIEj3TyhcgbmOADg8Rry3NOAAVpAA3jZXXFsrzSNNy/WwXjiij+wbSlW+pPUBM8D6OFLnt1or+PNlmaC6JKoqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqhEW8qK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F16O86Ft; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF40Dx1198859
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1vg18RtT494U3bFpv0heAeJOQn+0JqtY4stHDRp+6s=; b=UqhEW8qKS9sKsVcC
	XfA59BwtqBqPIdcn+JE6PXgTAhbq+3mbc+NJ74H7dGvMThqLoxGU23oZxnbE80f9
	BdlrPmYgA0nBwr/PA3MWiPnpslXuplL6nI3DzbwjcJZKq9AfUYoxNfRV8dCgZtk1
	0h9ABYvZPql+S5rpBWLg2LrULClpJHAi5m+p8jounl8J5J3LLDclSaLW23wKSlE0
	nqaIOLK8fs+AU4IRpP7fpF3BaTRUcbHQstR4qc/inFov9i6Otg4gSTa21Pfrs2BW
	S8PU2erYH7irXUm2y8K7skaTF/cjsSzY1joFJG90Hid+3FysOFUVf6XL6n9pifiw
	HHIbBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1t0qrj88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:29:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517796be724so812051cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 08:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782487769; x=1783092569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1vg18RtT494U3bFpv0heAeJOQn+0JqtY4stHDRp+6s=;
        b=F16O86FtdJpO3O+QgiRXKiHqLAvybnQ3aMHAN8UmpSeZRu00uFBpVywn3SDYmSRwyr
         0nfjZqF7qEhJifh6IFvU45xtLnhKxweIrCDvW6EOh9stgPyXPO/l3Ez/uerAoWg7SbSm
         C0hucnrgxwnI8y/cb0dv3JrKIksVuRDWFWl7V2tyJlJweeipDx+EMMpGdUmyvGgfO82K
         aWjsRWYMGs2KwOuvuVeHZp9F2Zdq8N62KjxBvLFX+O5IiqHHDGxKAkTydLmfprQkZATt
         /mjK4M2x/YCIdMAC++R0AWsvVi1d4dq1QfKzVofxqJ2ItOQ1J4rvZFsrFpEiOo+z/lYF
         IuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782487769; x=1783092569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1vg18RtT494U3bFpv0heAeJOQn+0JqtY4stHDRp+6s=;
        b=e/YZAJ4glBomRQFUgFXgrgI3EiVQVOYcvxeArZBKmi3d4pYdIUqSCuXw8jTO8jxm4z
         fajpqtxbQpiqPW0UcBnvddCTuG7ZYTQy7UjObvhq3nDqMmPYyg5yWR1/xhEaH28nsSl8
         dUTO+7RhNDcP7ACXQw2v2u96JH6i+J/CXoRbJj/Mh7PC4wQFbjFqU6FwytadOWIZKGOQ
         3SDaU2rt8SwvJAt88xyv3Zd5QWWa5WPq7k1gZKWYtA2EWSMti19BKh7uaR4Z4H0pduNc
         5hGkQG5N5KEv4blauFLpUQqZKBytA8vzK8HRXmqZBDG5cNISFusJ4RpKVgn5/0daNTs/
         9t/w==
X-Gm-Message-State: AOJu0Yx4ioU8VE6r7VVfB/xLj7tJr/OotroI8W7SIoXuRJBir1KAo6Aw
	PXD/LBHZ6hkWTG21CDmJYxT9bMoAiVknZ2WiPnxG4tHHFVPgxTrGqdbV+rtw2sLafpVHFVw8sM5
	g6cYywZNVvXmwTd4570llYbnp0W5dCVQ6WHObiXAXnXoloqRupANyy1hm86t9kGCSPqI6
X-Gm-Gg: AfdE7cn0WWFmulePS4hGtWZNmkv9K1HOiuQWExTz0inD57qBDKLLkyfFZbZtubZDQJL
	Z3oBchv6eQCYo1nVPRdNtOJWNyIZP99IIKqOwDZyJJ3CgsFr+Y+JQ1OuSaJcGIfmFPexjqmQD/S
	5oe3yD3G5hMcoExolbo/6EZl5wfpAKzoajupmD29fLh2PsEbVOnMh3b+Wb/7Ee+dNI7tpV+kLPv
	vYAy9cSDQSQFIFEzixXw1SDyBIh0j5DGoEwGvjTF9RhNE6gzYNNHWEDvYnICnaK2XCkOzfVG3yb
	jrpomQXVAFad8Dnl2GXpiJbKn/yGyrjhwL5pjpwD8Dl/DpHiOjIGGTPDVK8rgrJnQyTY55UwcfQ
	qaSeuIDv5YVy9BNef8dCl+bk9Tclj2Fc7P1c=
X-Received: by 2002:ac8:5e4f:0:b0:51a:8c9b:6493 with SMTP id d75a77b69052e-51a8c9b9492mr4776191cf.10.1782487768412;
        Fri, 26 Jun 2026 08:29:28 -0700 (PDT)
X-Received: by 2002:ac8:5e4f:0:b0:51a:8c9b:6493 with SMTP id d75a77b69052e-51a8c9b9492mr4775551cf.10.1782487767667;
        Fri, 26 Jun 2026 08:29:27 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05b62sm355657266b.41.2026.06.26.08.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 08:29:26 -0700 (PDT)
Message-ID: <8f45613b-7046-4a68-8023-8abb8efa697b@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:29:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
 <20260618-enable-spi-on-sa8255p-v4-4-f5b5067e7e1e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260618-enable-spi-on-sa8255p-v4-4-f5b5067e7e1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyOCBTYWx0ZWRfX/b142DCqdUAx
 IDJRmHJYwCPbYMcfQsIkTkE9jmKhjusAhnhJQkmu8mUKithgpeO4sZlHryM1WZvLokY7RbO9vWo
 H4M3nF0xixqNz2UfSCHkqDabaAV4t6k=
X-Proofpoint-GUID: OVxPZz8Lk4mrVAE8mvWTa4PYH2_OlIlz
X-Authority-Analysis: v=2.4 cv=StqgLvO0 c=1 sm=1 tr=0 ts=6a3e9ada cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=wYGpMCW26V-xmeov4-8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: OVxPZz8Lk4mrVAE8mvWTa4PYH2_OlIlz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyOCBTYWx0ZWRfX0AB0j1+JgHT3
 NPOFnYcOxO70bJo4F50fXlKyUn6l0FjWuEWwgCyjDz9iu4Phpt90taumZjRgFg3JtPnHUaqc/70
 9ldc3GjGArvOXt2MzNto0dB/UPEscnQ5a4Cnh6KPkW5j91SHFqz4szGIEVT1k8twJcBiJHW6urd
 KctyCjOmRwLMro3xnMaxldv1wFo8+CLbvZd7Xe23+ekR1mflestq5dMpHo8GNU3C9fgicRmXeEF
 h2B3dNgiK6FcQs8rFq67qbRyudZQCcOpRxR+S4L25JDq8k4OfbB1ibRqT/7xV/UJFAcH99vEvMZ
 EVp1BSF8s9keiOgu1B3cdflcE7auOupPiiPpUL0ugxbfjydFYDscgc/xV7MaZhMwvEBVvnYJFbn
 CxpV00mvGxjMS+jERq0AlSdDTnH7ltKatoTXdzDzomQJA25e4MuAcqneq1s+eUAZkxhPWEphn2O
 Kai6Co6n+A9vUFPKOGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114693-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B38AA6CE82E

On 6/18/26 11:06 AM, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
> 
> The SCMI performance protocol manages SPI frequency, with each
> frequency rate represented by a performance level. The driver uses
> geni_se_set_perf_opp() API to request the desired frequency rate.
> 
> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
> is obtained using dev_pm_opp_find_freq_floor() and the performance
> level is set using dev_pm_opp_set_opp().
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

