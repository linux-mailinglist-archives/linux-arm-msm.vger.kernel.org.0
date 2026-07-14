Return-Path: <linux-arm-msm+bounces-118947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9bQHNCTRVWq+twAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:03:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2956A7514DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:03:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=joa+CjY9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J1YG2BEZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118947-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118947-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8E3F302D136
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04EC2372696;
	Tue, 14 Jul 2026 06:03:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7C32E7635
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:03:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008993; cv=none; b=RRKrqWVWV7foT5nhR8oi5QuIu2snUfzAkOQjoFPSgUp/qJD9hjnOAiI1HaUItOqXDdoANR0VptlcCinENJFpDQd55N/nCWNcohfWVswB7rbi8uNF/7yT1TB6H9jL03fRgqct63eWwP9Q5fIBQ7vCKLD31Zion5mbxTa+BAlWxIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008993; c=relaxed/simple;
	bh=FyzPBAHmnVYFtHiMn2cLnHG2YhPDqr3a55ITi8nzd+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ra0Z+5pU49XPA4ABsx1VU52bteV+Uc8OMO9WBM90jPPBrrSE1MTjhzJddyneBzjiMMVZDzrNz5uxhUVcomb0RiKvLNRUc6NK3XbohJNAo/z7eXFmWRS9orFKk7tUVujaXL0Ymr4RPecn1VtnkTQ+j1gabFWDNsLv5gkCVTE+AEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joa+CjY9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J1YG2BEZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38I9C3506199
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dqf5IARV4VqE33qU7795ksc4HZHjnF6QVJ86C5gf5vE=; b=joa+CjY9C8+dKtSC
	/G8vjKawYgY4tKvujz1F7spLQRaseeldx4iFtOpreLhanKaIbwg3XUhm8upsxT27
	IrcabO+qvAVDCED6W0XCpebtK0s8/CYPFebaxqT7/5XSQaT0FyrCLHajhgC+ga5+
	oXgt7wDWbcPl40YWXAs0VCxbukfd4jBkJ03NLALSeYjHHLQ5/GM/Skb1PG6J9kYu
	Vjj+DhYDQyRjH7/sg2Nq0UjOH4O7LFynon6WpJ3AWgBL6Xhm6+W75wTWBihanDKr
	5eD4wnzBQ3F/6+iED/4HkqfFRpOj/MisPfA6bQxfDIskq1Ybj8Vb0Tn8lWTDgjFJ
	nNieYA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jt8mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:03:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so75245085ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 23:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784008991; x=1784613791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dqf5IARV4VqE33qU7795ksc4HZHjnF6QVJ86C5gf5vE=;
        b=J1YG2BEZTCr+pebn7ioHMRYTkXc3xtxuiK068leJBT8PUbddEYlzSP4Z/aRmOEW/4B
         DJdZz+Ga9yf2MAadnNWOlXM4u5x4pbAPnZNRTmkvnqbCVuCrjKerysDA4b9oxwW1SGP+
         bEGvME7aOf+LDDjY/Xr4m0kDZPNa5qzpt8EuOwMm/bn7soZLXJOPFqDGmcNHahHrcBHj
         u26FxgHpDVa4CesxJh2XNCg5/K3hSsGN/vP+bMzFMjfE2ep0AeRGyGp3fsG1Zgc4fRqX
         UZCkemaNknZvT6+K3WxfBAWJEIBRu3EOYe829iCwsDIOBR1owCwcZXllgAt9Q/kczhCF
         ziUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784008991; x=1784613791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dqf5IARV4VqE33qU7795ksc4HZHjnF6QVJ86C5gf5vE=;
        b=hXpDbi+b4gjj/A8dq94dWXAaDq+/R3ilMD+lX9Eu8bvJNUzRvdYWvbcFCgMNWu9+uA
         o/HfjS7b8BmYjbYqwNta4i7cvXCPOR/xvQImGmD1JV/S+kUWP850opvEgATQvS5sesiF
         nJT9wGCiNd+xY6Z6AntSPQ4oMkaGe+a/+BrSatMSVExdCeduK7p+1AQOZtQI2sgHtjbL
         9nGWVfQ2r7bDedIvGXJ7C8t2pfj45AGpDV7Kjuco4UNk68GDUyvOW2KdJMUVqOGnmotv
         ricBSqApCRoCotD8mZGlexLieJyUjyVF0i6XdGovAoWBR9NUj3cEuth0uQilvfq5jcAq
         6iew==
X-Gm-Message-State: AOJu0YxJ7cTMw8j6lNJzzR5rkBN/rGFCKhCZN2lXr8++c5kzfSDuxv4K
	U4xFjJQg5oOFLmZwXV3346WqxmpYb3Dmvo0HcepKGmjgcSX3aSkc1phZwPWbjG9xSsE5dYzgS0j
	nDUFe+qxD01qHSa8uqo6IzCOp8XQOTJ7ZWmya+mFVIFZL3C3/KZsxxxHsR+Lx9YUETH3uKXnbrb
	qtCLc=
X-Gm-Gg: AfdE7ckMRAsGzC88VymXNeiGhuv+blJQb/zx6iz1BJPVGQww3fHb1eN7dXGd+pcyL8R
	zDP7o6MxDNvVJMYd8Ot6MC7JoPDHo+PPdKPBw45whl0GhMHlN/oCq/hGnMy/M5NdHOlvBJ6yDp7
	rLGVTELCjkPCUx4fHzEIjLsadTY5JY+er2K5rMYoLfDVr9rMdcG+T7hxkz/t+fisPqQPkl4xSgq
	WRNEQ/zR2+vVQKbj4tRUX28xs7TfPZ2q3oFHzEI5D6SyoeccCWqZEa83TnvNxnzzjKmhaeEMiut
	OnDptXzN6tPwgjdedGd5BfGabNjG9ITV4E+M98RqUaDgtNDOFJV3AvevRwHHM73Z54Os7RS5FcC
	lPOoGxhuTXiD8msrUfhbLiLG1RJ4DbD5t5NQ=
X-Received: by 2002:a17:903:2409:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2cee9a6501cmr24050685ad.4.1784008990728;
        Mon, 13 Jul 2026 23:03:10 -0700 (PDT)
X-Received: by 2002:a17:903:2409:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2cee9a6501cmr24050405ad.4.1784008990282;
        Mon, 13 Jul 2026 23:03:10 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb76asm113416265ad.12.2026.07.13.23.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:03:09 -0700 (PDT)
Message-ID: <e3f3fbbb-f1c0-4759-975e-db6e11849362@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 14:03:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: power: qcom,rpmpd: document RPMh power
 domain for Maili
To: linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260609-maili-rpmhpd-v1-1-c8f976377726@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260609-maili-rpmhpd-v1-1-c8f976377726@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a_QUSBccUfbwUSBj0g5vGzZG7D09dJA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2MSBTYWx0ZWRfX0pEh7TdjNEUR
 V8OmM/WSKoFpqj7/pLWkE1eMwTtRswZlffyTFWixNiEGa5wOH2Vxc/CzhqLezQ2cCmbQQQrChWo
 S4VfM2KFokVndy+rKeJYYJ0HB7fZAlAkt/0idavHpnDUyetwgOSU0pSeHGy8N064vrNL/hISCVQ
 xU+K8arPRl3qgTyQyZt3bcDf7ERzzW7wZIwUFpiG2uRUYGIZ4u3aNGYVhdTyID/gZDPl9rQrXB6
 kzOnB5wtVlrtUnITzeI348hkC7eCBNf9INj7ov457sBIggbRwcPJmxwUEWXNaxJxgUmAOHbuhQu
 KcFyGPCQrPeDU7p2zwvi7vfkTYPRalME3iBDioUubygaXsb2kYfuOWvdpafq1sgrqbEQjBLM8cx
 mibKhi8XtwrxOPLEnmOzqzNH987ulHOu8wPk88W71VZujvnmFR9XDnTDSZn+n1WfHWXtLE7OaDT
 nkH/7eIx6Xh31j9m9lA==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a55d11f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=M8z8ihAFdknKfOSP2e0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: a_QUSBccUfbwUSBj0g5vGzZG7D09dJA4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2MSBTYWx0ZWRfXyw+KyBT3k0Yj
 DUnq1fmdii83sSRq9zhZLclp6mvMh2vtO0JiNgbt2ZGofRfnOmXT+R+eako8LvsmYV+p5Bs7GDI
 zNZqKgc8/2ETqFO8hlSlYRZXPMXOjKw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140061
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
	TAGGED_FROM(0.00)[bounces-118947-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:ulf.hansson@linaro.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2956A7514DB



On 6/10/2026 1:43 PM, Fenglin Wu wrote:
> Qualcomm Maili SoC has exactly the same RPMh power domains as Qualcomm
> Hawi SoC. Add "qcom,maili-rpmhpd" string as a compatible entry for
> "qcom,hawi-rpmhpd".
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 0bf1e13a9964..9f3c8cbe9d72 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -73,6 +73,10 @@ properties:
>            - enum:
>                - qcom,msm8937-rpmpd
>            - const: qcom,msm8917-rpmpd
> +      - items:
> +          - enum:
> +              - qcom,maili-rpmhpd
> +          - const: qcom,hawi-rpmhpd
>  
>    '#power-domain-cells':
>      const: 1
> 
Hi Ulf,

Just realized that you were not added to this change when running 'b4
prep --auto-to-cc'. Can you help to apply this change?

Thanks
Fenglin
> ---
> base-commit: 3b7a18a34e8d3b14c7c926f033488a0350de9759
> change-id: 20260605-maili-rpmhpd-2079035fc51b
> 
> Best regards,
> --  
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 


