Return-Path: <linux-arm-msm+bounces-118633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /ICoJN19VGpcmgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:55:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3644A7475E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:55:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EkBfB4zj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VnJBtS8+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118633-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118633-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64ADF3024151
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 05:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846C6362157;
	Mon, 13 Jul 2026 05:53:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B347360EF6
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:53:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922029; cv=none; b=faVhN9WoVgvjCFXdgzHdO13kTB0nWXqFfWBsTxN1LdWsK0QptWpgZcHQuCBaFniuENgvEm36qcrscomJRdcjkWg/5vA+/TXlqLyorV5nMKErqxbzaDjDu1t0asBZ8IaFYXterCkkXT5N64s8Iwoms6frwPbTotZspflxnBC1/QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922029; c=relaxed/simple;
	bh=CBNzd4b4CuEfF2oBe8C69ZGM92jDCQh/5ebA7XMBxt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTN6yUunq9/q+aYMuEteiTCCFUwiWJHpj2T5JWNf8LN7tOg3jOKZu0R91W7sk4JhXe+fP19xZhpuGh5o2EHPGcaJarG6khAU87OfL7mwkfGfihtbKL+kofVi6dD4xXU6vQ7jzpV7wJD6lvzEWcSNEg2Zn58tQ5pCDPjBh0d9WiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkBfB4zj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnJBtS8+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D39wBO038550
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xxYALtCRQn2rR6VAzJLApMBLItQAsRmuuR+Ks9gEj2Q=; b=EkBfB4zjYtqoVFRi
	hvVB8K+pZU4XsQmsMV4drnJZWywKygyXXUVGURFDQWOp9ZsVIL0SPGWnOmwfvqZr
	BxYgBzrQtnVpQPzB4+0kDS/AXag3ppHsSeSW5IYKj/3thaLGMGd4Df8L3lHk6eOQ
	m0m1w6mGjn1PCel7d7BNcwI6/4Q5thsL6e1SXUMmh4CUPSGkUBGkILtBQIPCG1OJ
	EYCmVC0a+A/HeFqNWW6cMELFg7mz5b5phJoDNyrqAhSD3Cldi7I71T1bAyrkVIde
	9EJ4jrW+QCLSbUQQDVcAnyN++qrN/QEeCDgQRAAWCC+Plgrh1XBsBKZQByvXVRvS
	UZfjbg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9mjku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:53:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8894570b58so2025472a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 22:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783922026; x=1784526826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxYALtCRQn2rR6VAzJLApMBLItQAsRmuuR+Ks9gEj2Q=;
        b=VnJBtS8+GkAOMNadEmLEgcl3yJSWk18ILbHWMhcRrrCSOv5ZdVjbJ74ufkuwRXOEp+
         KeD8tbSyUnftfHbdKtjwk+OhvCR4GHQofAfXOngOFHm36Zgyb1m3AetcXThMC6bSgDGz
         2GjLDXpxl5tpCNuf8g8idPbjnKXTaBAQTIFtyYRLaAqFN0/Zt5Q+iEyzlv7+KOb3YUcr
         BvNWV/OSE6ucuoXJn8EoVnYI1y/msri32qL273qRV92M6icDuDlMoY1+k62i/CktYZyx
         Vt0jCSqi/5zoUGOZ0wuDgpothxZbEhLJ9A7DnDPjP65BSB1inPsgS7Co43mmQLtYNsdr
         lp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922026; x=1784526826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxYALtCRQn2rR6VAzJLApMBLItQAsRmuuR+Ks9gEj2Q=;
        b=ElcTvyesfczkpJdHDLMpgs4YVpuC12itoxw9u8jWZ4us3qUuNIXFVqxqmfZekvsIdK
         Ld2aV8L+4oKhBS3nP0sT0cSr4sk+fRJ+vfp0mSdRWhTfiwZmg41LuGkIRpI+60KEYUoi
         9nD3NPjIwzlX+Redo0TQK9tcAQ/lKWxJp1JQrOr6zwPeLyW3jhVPxYNpXEQB5MxR4RsW
         d8xNbpuM3NweDhdy+78l10Yq++2ZkgTjqrx7XLzrtkHYIv/oChGWoXKBGAPprur0nas0
         EAtyxmUN44hi1vn15APv2XkHez2p55xPNNfXsEcWcHXKIEl8KUVClcVFKtXsCdGw0jMY
         No7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqwDWGZ0EHEuK28vIZ0k/KZs4mlQEBOl7fjhx3QpBLjA7w9x59DOEW3UvwdGE/44k7dl+VnRIULYcw2U5FU@vger.kernel.org
X-Gm-Message-State: AOJu0YyiSmF28nOF6RX0mcqlS2RksrFopxmxclqmLPSTQKwy9xJOPO0e
	s7BxuvVCXGC5tl2fMzptUdeTmS7Llnjdu5QDrnkdd49IFf8WuHy1/D2LF18jM87uBNiBzCKRBc7
	GwLAJmxqu468oWanltaUx/ZGhCpFTcKuKAZntfLD7BZa28AruZY9yfDU83a9sNfyqBYF6
X-Gm-Gg: AfdE7ck0sIubHAfag14Qnv9DLs+ZXaUA14lI//iwd5yO1qShO1yFqhml5AhWdsTWvx7
	AqyQPL56lLfSvCN/GozhhjmWcOxbh7QGB0pvLGqyHIBrVUveHCB1T/r0yxuS/rX/IE7r1CHU2wG
	7NCDZGwRymKYewEHTJFldmYVT7BMMk3psNhaZ/BvaAWgGprnzRcXmBNb9yXsXUEUKCUHepyhHt8
	f/UEG13VfK7CB17mzrP52xPAyIVh2FhRVP9y3R7wL1ZrqnbkvpKH5Zq4hvhIR2xVF925Ys/YoyB
	hNcvd/Nvu0AzE/S/OA45TCUuRiGZECe9QZo04nyb0F2s9e7R2BHlHwKpnNxNlZbIATA15h9JOKH
	exjwD6JW4wBekD4yu8NNnhWmf6z/YujiIYLdtA0ulqSif
X-Received: by 2002:a05:6a20:3d11:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c110b166e1mr8007182637.42.1783922026066;
        Sun, 12 Jul 2026 22:53:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d11:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c110b166e1mr8007156637.42.1783922025614;
        Sun, 12 Jul 2026 22:53:45 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm66569596eec.10.2026.07.12.22.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 22:53:45 -0700 (PDT)
Message-ID: <d2c537cd-081a-4a89-b74a-76b8424ae84a@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:23:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
To: Daniel J Blueman <daniel@quora.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <CAMVG2stqOscN2CB5Uq4qVvb3vXOze35-JzqH4GpS8z4R2dr+Mw@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAMVG2stqOscN2CB5Uq4qVvb3vXOze35-JzqH4GpS8z4R2dr+Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1OSBTYWx0ZWRfX3X1hHMpBti3f
 QopuhojrhWJMtNUkRotvsw32gbmo/bppUR+lA5fOCl4p9v5DsJ5WBOAd2nnaRzPQZH8HrFQEqPY
 coI4s9Rm18vqufc/Rl4QNu00jExMhfU=
X-Proofpoint-GUID: jbTBjSLSeJ0thdDC08F4eBHLQ3d2gXUz
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a547d6b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=KFtyBvXnAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8
 a=CFlqIJIDefiTY8DqsWkA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1OSBTYWx0ZWRfX6LKLn39GCtZe
 oY1vCKlkZlzDiomU4JEzLdV4HP2gHGlvcNdbAEqXtaAthSXxgHRUspxGHtrPkLTzSYZuAWcRCa+
 GaCF7l++B4RB7Fkb+Ym0FHYrKVlXsem+XAinN/6D7Oxeel5RFPx8uBxuhu5yeFRmDhjQZC/tBid
 LpSGtNOhi49Ydk6a1Y1rVbpcPWBKDU2FrmtWVrLQtPyKvIB6joCEk9or9zRr/YXDQCQaSA4+6iU
 lv9vFpev4ySB4XVvJdjz42dNH1x1MpDjqen2nbMeI52kwx6NJuSrXNkGD0zvEHKGAzErbQFdaPM
 YNSqPxc90GHSoJsGkqQuoz6usmYumKG2+UAqd4pjExPpYE8C0FmrAcWjsRXYUkeNIVGefu1rox4
 wsAUTnqfg7KO49LWmxvevAT/yH4+ry8vavOJOexsOz6S5WIaRNNZ/ot/7xWirY0ptz3hMrg8x5M
 OD7kNIISC2ApmYWmzXQ==
X-Proofpoint-ORIG-GUID: jbTBjSLSeJ0thdDC08F4eBHLQ3d2gXUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118633-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quora.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ui.com:url,gitlab.freedesktop.org:url,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3644A7475E9


On 7/12/2026 5:21 PM, Daniel J Blueman wrote:
> On Thu, 9 Jul 2026 at 20:35, Vikash Garodia
> <vikash.garodia@oss.qualcomm.com> wrote:
>> VPU hardwares have a limitation where VPU streams are associated with
>> dedicated addressable address range, as illustrated below
> ...
>> Mapping a stream outside its expected range can cause unintended
>> behavior, including device crashes, as reported at:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> ...
>> To address this limitation, the subset of stream/s are now represented as
>> sub nodes, so that they can be associated to the respective addressable
>> range.
> 
> Amazing work Vikash and team! This patch series applied on 7.2-rc2
> resolves spontaneous rebooting with parallel streams eg when opening
> https://ui.com in one or more browser tabs, resolving this platform
> usability blocker. As such, this is absolutely relevant for -stable.
> 
> Tested-by: Daniel J Blueman <daniel@quora.org>
> 

Appreciate your efforts in trying out this. Also it took a while to 
formalize the design.

Stable - Yes, but the driver handling have gone through a lot, and i am 
quite confident :( , that the series would not apply to stable.

As Bryan is suggesting, we can think of applying your suggested 
workaround to stable, and pick the sub node design to mainline and 
forward. Open for suggestions here, if anyone have anything better.

Regards,
Vikash

> Thanks again,
>    Dan


