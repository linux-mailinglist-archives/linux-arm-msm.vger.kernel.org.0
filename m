Return-Path: <linux-arm-msm+bounces-114314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6ta3I6OcO2pdaQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:00:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D623D6BCC03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:00:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NjD8+yYv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UNNQmDGl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114314-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114314-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 960E2300213E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50147388379;
	Wed, 24 Jun 2026 08:56:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E0F38BF63
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:56:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291377; cv=none; b=s0xHa30DgYP7nEDJOKH2Cl/ceFGL4bSwU9Ux02JK03bomhO+/oh/TmSByOOc1VzUnA9Tr4z1do+ut0Qey2WKPP/4tTKfjolCl0V9NVtDHpQyQ6GSKosdBOw2GUqNznVPCutnOb+jI0LpBWrlhrziRMYT5ULYd6EjIGby/WqCnZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291377; c=relaxed/simple;
	bh=kzRaG/RRyGBVsG2H1tOF4iz0tZn7GqpRc8s9MXBBagQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggPjlzLeXk3Ekz3SYLuFDxBANE8SQTxZpvj5GT/uYxIs3vzDaHXl3j3Ztg2z1pFVEq2GxpREUhv5m8iN+973op2xKlfVAL1BzH3GnaSrcMt1+ZxbqoR0vWObAnM8qUunZu/B+obfUVTKYDOhmzjw42N4bD+ZSR0UC6NrhtyMA8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjD8+yYv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNNQmDGl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uIkI2460775
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fc0eXLhpiinXLl8s0MS2fMQzPNFm340Gafy1Dq+1FSo=; b=NjD8+yYvKd5MtcjE
	50+ggzeorF8RTyv0rCMNmkAlqXzp3XoufilYYEB77YlmGgs5fRaFsF6KvWqv3x44
	GAd6pIucxa03WnUAzkkwq5MX3iz4TcbIv0x2FLWS2dPz8amcQJakd+SuIf2OWgDb
	q0iAN+Wq8HCESO5PQmNXlj4GGOpxKMX+ZcdRyOS2VfamIu2kDoKfqrNjuAaTQFbJ
	v8UP8UX4h0i7DXJrbA+/fEmyV7MWfaGg9k5mYKUvOGwXSBfC+LOyi7qtvzyfr0Zj
	wrXgPVxDsHHAV1R42HsYiJYONtv90PdK4ulwBGmt0ou5PGAMqmKZIXjNfZLkYhsT
	Km6OKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh40vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:56:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso13440305ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 01:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782291372; x=1782896172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fc0eXLhpiinXLl8s0MS2fMQzPNFm340Gafy1Dq+1FSo=;
        b=UNNQmDGl0sGXApFRNpvnxP5LoQLr5jgZXhYz0fg1hK4l8GH6kQgKRV32u7e+14c+cG
         9Ve6yw5CNwY1g9tS8WG2joYKFJAd+Fd15aBlNPDI+kA8Nh5LmGhLDLWPs988Zai47P3+
         MFaZWouW7nuIaYpOkpof3q6wqTADzylpyzwLNJgvyZNvyJN7Kk/Z4VTHvvDXWL7yuO9m
         qpuNmrMxrGZSow3p9VOfzKZTNtkY3S81A6VkJ2oBJDgaZthWkKwnqTNJ4F3U7slNSf6b
         JgkXlXE4QS6oCfIvabtgosZc0hmxkZ1qvPVI6jZ6lWTB5VrrTgvRsLtwy6P+VVXu51pM
         S1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782291372; x=1782896172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fc0eXLhpiinXLl8s0MS2fMQzPNFm340Gafy1Dq+1FSo=;
        b=iy0Y83Qzf65EIgsV7MutiyV0WxLlpT1iJ8l1RcY9rUDLzmkuF5LrpvpmV9GsgMdY4+
         bHTusIKa0xkSspQSxDLfhZ5yD052N7UxC75W74YcXJtRvAr7GakzgVQ9RiZQsBAt0P9R
         TxwhCXF6xLS4fmpoLDg8eRDZ0v8gkB1KAdbU68mdmTT0fdqe+RIftCRBP4kG/FD11AAN
         rYZ+T3/oF4dzFItJk1UdP4LIgB5LSUNdAVl7eQGKqCQFqF4E9d/iTp/hhXIla6Fp4bC2
         GkzOHPKIHLze2hmOg/VccedFOSiVC1a/WrYtGCKC8Rp6+/qfVJ1DU4jcCJvCo11HWkZE
         9KYw==
X-Forwarded-Encrypted: i=1; AHgh+RqfiJXsVFWuqNhMBYZ8etX4OXCEvqi1bK0Z8eeHC1j5BmO2EyJ5q72YkeKzmwETzMXDSfImwMA9WRsD6VgO@vger.kernel.org
X-Gm-Message-State: AOJu0YwA/q6p5iMn2HY/rSpYJKMKaIQ0BiAPRul9X4scG59aHkAn9+4U
	4VGjDQJHBKJ41c4a2/3E7jbJp0xJPOIwi32TqhGZMf+AO3zYv1SSlFs1ErZ7z+ZYIu+Ffd134ek
	sdLLGhJ8aU3lwJeqN38QF7rNPL7rwzexxRd5opfKTag0wZsAB4z+QOg6VSBPxJqz9Gi+M
X-Gm-Gg: AfdE7ckUZ+Osj50ftyFsZ++zQzNNRC2A6V11oDvQ4AUZeQzu62L1J9J0YzDTRo9pvkT
	ByKmlneBI/66TyFziXzORoHM9J/z0CJalQrx96gZpR4YSdLBdar5HOI7XOT+ZouFzBtwToBOnbz
	jvJGUNIPzH9E8dDGoUFJSsBZ5XbLRfdjsgMQfymqve1cdtIQbFiG0Z2zM+TzjPDPToB1l03+dsw
	H0Vxw9Qjv2foZbajIw10uq0Yn9lPtDV2EXIKZ48mg5ipM3HCHeGUvQqqfoLkqlEnz9AIWmeZy+3
	NyPQukjWI8h+ohaKrVpU2+9nQxLBP5XU+iIkZYJ+2MGsq/+T1iVSC8ZdaevAZ+NrMXVPreLZ73Q
	sfsqrdYqwQVFPEoS/JcYlp03fFVKCl2buW+xWj8dpUBFL3KznE98ghjMvIv6nCkc2V3L1ER/qBh
	oe
X-Received: by 2002:a17:903:1b2e:b0:2bf:2015:5b93 with SMTP id d9443c01a7336-2c7e142d0a2mr30176595ad.11.1782291371890;
        Wed, 24 Jun 2026 01:56:11 -0700 (PDT)
X-Received: by 2002:a17:903:1b2e:b0:2bf:2015:5b93 with SMTP id d9443c01a7336-2c7e142d0a2mr30176285ad.11.1782291371464;
        Wed, 24 Jun 2026 01:56:11 -0700 (PDT)
Received: from [10.133.33.218] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af590sm151284575ad.17.2026.06.24.01.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:56:10 -0700 (PDT)
Message-ID: <858ce69d-1d3d-47a5-9c1c-d7608e8dad76@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 16:56:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: fix traceNoC probe issue
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA3MyBTYWx0ZWRfX6fa+zv4B9yxt
 YbfFGL/PDwccLkoVABI7fVoqZ9s3LTllCccpSywGJdKdUSTbpsQDBDnc6c30lM/Us3PQzqsqim1
 rQ/Ic2InKZkW7tz5QmodnFpnGu0M81su0BZBcW4FW5YmVnYvYuIewI8DA1a3eg38iA6gcHKPegg
 LoKcXMouSk8MSLZFYxUD8Yr1FiqVWmEBfL+N5Ln7FJISIohqLpl951gakKPsqZ5hrfpPmZnRrNB
 wd8FzXJh5wEUZrHejf38m0vevuS1DmIh47xjGIwo566C3d/H1nXM+STq0l6CE/hwiYoVb+eI/fw
 BIbNVX8WbuOZi9KxSDIU8RzA06WzbfBTo/lCIioJAy7eZkdhKLkSOJl6sDJYuY7cySAYFZIn61q
 osL7S5TeGUXn7120bvmszvoYG3ZTQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA3MyBTYWx0ZWRfXyFJ10lJk1w0X
 vXLe0jkgb7++P+sqynn9WZqCcNBe6FFypj4RxU1TLjDFeVu1c9EzP1/PFK2kbcUqRFkCtug88u6
 /uTKFpBrJPTSMS96YywqZLOvGCp/pw4=
X-Proofpoint-GUID: mG0DNRDz4nEXLUcgSKs7Z2Gr-7H7_pi5
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3b9bac cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kGvFbencCR2aym9GMV4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: mG0DNRDz4nEXLUcgSKs7Z2Gr-7H7_pi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114314-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D623D6BCC03



On 6/24/2026 2:33 PM, Jie Gan wrote:
> Fix probing of the traceNoC device by switching from the AMBA bus to
> the platform itnoc driver.
> 
> Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 7aa9653bd456..84561b5faf81 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -5003,12 +5003,12 @@ tpdm_pcie_rscc_out: endpoint {
>   			};
>   		};
>   
> -		tn@111b8000 {
> -			compatible = "qcom,coresight-tnoc", "arm,primecell";
> +		itnoc@111b8000 {
> +			compatible = "qcom,coresight-itnoc";

Sashiko mentioned an ATID assignment issue for the itnoc device. I have 
checked and confirmed the issue is real.

I will try to fix the probe issue by adding arm,primecell-periphid, 
thereby bypassing the AMBA check in amba_match.

Thanks,
Jie

>   			reg = <0x0 0x111b8000 0x0 0x4200>;
>   
>   			clocks = <&aoss_qmp>;
> -			clock-names = "apb_pclk";
> +			clock-names = "apb";
>   
>   			in-ports {
>   				#address-cells = <1>;
> 
> ---
> base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
> change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4
> 
> Best regards,


