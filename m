Return-Path: <linux-arm-msm+bounces-116673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6YVXIpRiS2oeQgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:08:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FD770DEC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:08:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EiX97yx3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kKjbgzET;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116673-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116673-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1109334BE10
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34C83C73DE;
	Mon,  6 Jul 2026 07:17:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AC03BE165
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 07:17:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322248; cv=none; b=T3L4caa1hRdoN/Ut59eakcJh1VGUc0mw8tSHtOcgGK+r9cluL6UkOvho35tj9aExoWaJlVBKTPfaijmHzJPLTQu4LBj9c5EEln2MknhIM6bMMfso5sLZDcZOvT1ih/Uj/Gf+/ENxKNhnUnSejDi+clO5ImhrAkBQLUQMKfrruP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322248; c=relaxed/simple;
	bh=TrosSIkA8zcvisBjf1v81eYJN7X91JBl+nNpD+xIHeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JF3AXkUHFX21fkOo9p1FuTPyTH9/Lak85oOxa9zzlijp4AyZoM+wFO4ot1DQJY4dTTDs8KwtHeGUxrwvcf4uD4Mt4dcACK/Kwcnfj8343ejqaFPVePNJBuqKnEKdJuBM/IOzs6fnOdhZb/h+9+E05ScsprbIql5uZa3nt6OCEnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EiX97yx3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kKjbgzET; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641s9n3614842
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 07:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ol0lAZcpxm+72VcWnoDUZEtqTZ4u+FEu/knKGZeZ3qw=; b=EiX97yx3+PgvRKHn
	nd1vYRkMGiEObl2ApunJlC+i5L3/AlpXvUsjALB7b5dp6L3qDKgzxkv2lHRm3g9H
	4OeHguC69J6xNE9bDeMDgVYjCq0qfTRXPEglHgCSMbFDBc9yHtAkD6Yeik8h/mdB
	9Gas1uBs/FFwA3MmYRoESkpZpVnkQWQ8jZ3vhxg2FJRYrd4Nx2oE070cMH+RMzQP
	2kb6v+t/L1Xdgino3IVA+RTIM8cwYS+nrpuWrJM1hfMeSnSEmBxVDa58Mqt0ue2y
	/bXFgdG8zZ8dX2U27EvTxLHGuhg/mulgjkp2p1U8p1iD9rB0fDVag3udYfImxkOy
	VkoNfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvn2dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:17:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91ed0e140c5so493389785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 00:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783322238; x=1783927038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ol0lAZcpxm+72VcWnoDUZEtqTZ4u+FEu/knKGZeZ3qw=;
        b=kKjbgzET5CLus3ON1Hl1H/Ck0x1DQJObuNmIQvagUwzpYNpL1QTyZs5TVJjv3GrHXR
         Eam4VLgB3E9E3zGyRqHdXLtxbXUAsFCjBm5Bm3/3XXUy0AFCNsXIEK4NOL+E/goo6mgK
         00lzGBVJcYkhdDQBuBGfaJvDnWCozuJqvzfpH/XNHexIa5qS0tLpu0CSJfnVh79HDgP4
         Q/DfQW5G9EkQxQ2QVB98+xGRjL7tAFhDTLh+JF9CB6tddQc0EWh2lQp1efflmZlIgZfr
         lRQFAcfN9TSvq5uw1OiQY1f9A01pu2ZrIWlI+GJ8Tqt+PwCrEv6/TeNiLhGbJ9k7+Uxd
         Bvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322238; x=1783927038;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ol0lAZcpxm+72VcWnoDUZEtqTZ4u+FEu/knKGZeZ3qw=;
        b=eUdKQ9O7fPg8AW26ku3mQYMI0ppL+lgvSsPvgvjkduf3andZhTySD6kUr0Myf8uQ8/
         udKh3whn9nXyRjyqdGgYeWtkPSxxc5GQkn6myNEncWW+yv/7CjEXLgmGccQfU2QLbGTO
         05FLmHKIXgqzDw3wuQgnGMiUsZ9QQE3EbV6pA057p28bqRcIh8BIsBilSxdrwn4akGrC
         nTDtWMXwhrTgCXvxX0RUaWFuuWs9vFTl3d7ychd3IoFLmmNJmNXKFdEL9wYMsszYuw5Y
         QWuvli7kroQR+8ex1613oMKF5/bW1UrHJaBLfladbGGF4/bUnAzTjlr8SvQTDxZJ7Ilb
         nMSA==
X-Gm-Message-State: AOJu0YwaSrLIsmVfbNXsC1DMCWboihCO7sTy7hQYgNy+qAHJ5oTX6Sf1
	NeOaFHMoa322rmj4ZHiDvCPeDDBAAm1/XXuPwpwicJk0HgHtxpD19Bpe55ViV5iYST482g+hhgT
	mSMhbS4/N+oiGsFqaHnHo7BDrN8lr4zUGi+GhKqItivz4I8VHHwQTMKb1NU8f5gCjJjS/VKNR6Q
	TA
X-Gm-Gg: AfdE7cm1Y4cLocY6a5+HQ6c0uKySaGpnI2yiaKo5Cxg6HX/INTK4Lx7ra7TJtLLjzCT
	JuxJnXlJkKgn6KafHmXg2PpzmbKv7L84kZ26uhzYqyLUy5/eseiRpMg5lQ9SUugCjBLxI58cbRa
	oP9L9qVxWUKSRMBN32v0YpoVIrLkVpSSiYDemhLchT7EzPm4Byel5u96k4Rb3TzV+rW4v4JkPES
	0AOdkxGxCuRoQdzp+VNBbdeEGbvedhb1+PcbGerCF82Tu1bHhantj4PMDzFUCbMoZKR8MOf/K7Y
	Cuqz9xIvYfrh6FEzxx1h6146sKiEddguuaDZaaGhhZLS0w9FPbXiLfPcH65SSooMQvgmhOBghxQ
	bQbEFMUhn2wyS6GM+WGh/FBWjflSY2UMMAoK6ujnV
X-Received: by 2002:a05:620a:1710:b0:915:4211:baa1 with SMTP id af79cd13be357-92e9a3e1c78mr1094811985a.33.1783322237016;
        Mon, 06 Jul 2026 00:17:17 -0700 (PDT)
X-Received: by 2002:a05:620a:1710:b0:915:4211:baa1 with SMTP id af79cd13be357-92e9a3e1c78mr1094810585a.33.1783322236644;
        Mon, 06 Jul 2026 00:17:16 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb62d3sm280504225e9.8.2026.07.06.00.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:17:15 -0700 (PDT)
Message-ID: <68b98abf-4cd9-4906-a774-2b798c4576bb@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 09:17:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Use hyphen in node names
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b567e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=-bRoeWwJ9r4bXZd27MwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: SwaMIJmOejx5xE7dE3smgrbOFf-tdb1D
X-Proofpoint-GUID: SwaMIJmOejx5xE7dE3smgrbOFf-tdb1D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MSBTYWx0ZWRfXzWKZDz9d3hyZ
 aZEyMmgu/69fJkDIbQi7vbJi8ItqeYXlBKXJwOsakIsaQKp5M0LcUlj2VWkR4Tkpbmx8ocM2hSs
 kxlBlYxMo3KeH9WmZGOlHXGl5hsENkP0MznGEVm0kjPJbF4uROSXoOtaWyKoiXeS/3CwAaXklKG
 LE6v8WcBVB8Lryq3gQH9BhkR3GA70xUD4sYZQ1XdUjC/NXeijuRl+lfVljSExnsx5UFkkv+qCXY
 G/80G7g8stBX12VdOvdMQW9GzwR1lIoTIJzObrkHUG9sKhzR5TbMCCFr5U2nz58Ma0rhynfaEMX
 nW8CEFgbXZUDqtv0sKCusLCJiYDatklTfzrFg2R5ADshLYHX6vKsBZuyEiIXaV/4Uu9KWh/Mrrg
 EGobh4THwvcOngMEzNw9P3J094GJgFs6csL+m3vv86awnuXbe+fg70klRyzPDy3izUGXlPGHaYM
 EdC+6JlKXkFbvMDgdFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MSBTYWx0ZWRfX+YM29ADc+Ywt
 b4ahNW/1ChEtX8TDWdGAuv+mkVpVUPkmzc9I643+eypa4nlSbxQIgogYhpGRGSppObaEQ4hVYSU
 NAb/UdDRxsOViBPdAqiXbCrijwC3LOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116673-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24FD770DEC8

On 06/07/2026 09:03, Krzysztof Kozlowski wrote:
> index 7393978926e4..0796d9dbe158 100644
> --- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> @@ -136,7 +136,7 @@ ramoops@81f20000 {
>  		 * ABL is powering down display and controller if this node is
>  		 * not named exactly "splash_region".
>  		 */

If I only read comments... This will cause DTS style checker warning.

Honestly, we should not accept such code. Bootloader vendors were told
about ABI, they just ignore the problem because they can get away with it.

> -		splash_region@e3940000 {
> +		splash@e3940000 {
>  			reg = <0x0 0xe3940000 0x0 0x2b00000>;
>  			no-map;
>  		};

Best regards,
Krzysztof

