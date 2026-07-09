Return-Path: <linux-arm-msm+bounces-118078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ner4MPvlT2qnpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:18:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0A5734303
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:18:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aVU644Hr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hjEqnsFh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118078-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118078-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A42D53026A9F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 18:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473ED4DB550;
	Thu,  9 Jul 2026 18:17:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006214DB54E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 18:17:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621045; cv=none; b=LwQyW/zEojKGzIUkJwQxFwBZczaTUPrB7RsT6DWYEL76i3YuMjhW1TK/vPB2HfW83j63oid0+g03pFDf25hPj8ZWUzv7H66Htr86AHc9TMA4r9JNsmiOIXI79YTLRnZrZfc53mItWxQ9dA7l5YC1BfnfWKqx/t9Ihke8DR1w8dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621045; c=relaxed/simple;
	bh=8jCrSeZHB1v8sGHQ98I0I2rMmqYVExTJMSbrKIT/U/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aB++aa4KpA6xNY86u7RQ93xnBQfGnSEvPhv6mHq2ujLj9eKIhZjlDHNFdqip00+UEXPCg8lUvuDgNvtq5xfFayCuaNv6Efb7nDMySV6pOq+ijo89LzSSZ3La+WwrEZ0gu+U8emYB66WlarWxjhErPdPjdf0nG7mwpbf7KCVFG6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVU644Hr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjEqnsFh; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HYVII2476995
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 18:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nDO0ELt4xarDeNp50XpZhJxN+arGp/U3imA7JgKtXtI=; b=aVU644HrqqOoF4nF
	mP8RoEKHZkKEk7dN+pZMQXH3kgreOIqDge4xpwRBL3StEw2hMxfraILexrO8dWdX
	TKyUGOVSuTsLgOq9NPn8HquXo3IUzhIyNUs4IYISnHjMw/of4H9vA/DKnL0yq0Ts
	ZOR8oqFB3QNXyAAHGjry09k21oaMUgJsAjdMCSD0U6F2Ui+dcsU6oMExsoRd59QD
	P6yKHNvFM6TkXKSWNOTVMg7BrZaDn34u+Dnn4zvxKNyrSaEzz7ULShibIYOsH6pq
	yd6Tunz+/C1r3qavbB1y8AVylxzmtrYHT3QTpQXO7fXZtIFx7zy3mTu/gYPzSYK2
	opDteg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5mrk10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 18:17:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfa45b280so184591cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 11:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783621040; x=1784225840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDO0ELt4xarDeNp50XpZhJxN+arGp/U3imA7JgKtXtI=;
        b=hjEqnsFhkSbus0cOs8krbNOeF0NHbagsSpehsj76PkwGKiR3t/pTT6BCFs/SYJNqi/
         qGU/2+BPaUxxqd2+H6ORMbks0UO2+l8/NdhunakyUpmnMCd223dmxLV/Kmkw8CWYDSkE
         Ew4JaF/pFZmz/VKlImU2J83e7J5U5jR4hrt4ri/moTwrUfQbBJZ1H4l8rpJ6DdCtQArr
         pc/ePWe57QDHTjKSzxy01mKWLTZxlgIS226xo04lTtewT2yLcJobT2tggaaX9N/RFv+y
         JQBh6sZ0wKpdRpcBcCZHP7lCMDG85uLS5UV4Zqtk5uNQENiwHRcMiL/tr9p32Y/ZVxKH
         T7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621040; x=1784225840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDO0ELt4xarDeNp50XpZhJxN+arGp/U3imA7JgKtXtI=;
        b=DBia/W/7eTw9JCKzghF3ue1NClPKKpFsfuWYCUV+GGe8zzSsu2rV5/4RoprHgbmL7K
         E6zlOXMiUC0XmblTl9p73SQS25ITlX7somZjuljnaMuzJnFkcB7wHKstl+16hJLID+E+
         5ibVoiPH4f4cuN4HF7uhOm4GRVMtq5AaTwTmaFsKlWD+sZzqv4nreR7rFqXjZNiUHZwz
         1Avyri2wpzy+tnP7Z8PxXoKYzO4BMl+UEYq3UqoKJpWrtW1+VDVeVswIQbgGByqSdGwN
         HENsZ9haDUxD8CZX2Lg1z83zWFbh9BS1Ri+VKKlQWDEPBlxDKFiJuzzUIM/LRIjEYWlI
         +UXw==
X-Gm-Message-State: AOJu0YyuJVNrzRz5rVaij/TAMCLs7g6Czr6cffWiUiH0YtSyzdKOluyG
	aJHwgsctJwLE5UCG5TGtKmypgaJIyRFfrVI4di6OFJl8c42YhPQhtbMatwcWc3jr24ptIki0yAg
	cvNXm3NmpiLgd9kf1AaZ99BxV9hUblJJFt4CEcssNGkeifBSkmcoEmzlYShlhGTn5eIFU
X-Gm-Gg: AfdE7clXrgm3vzmyMqtTxRCqkCdFB8Lpp1Q0N84pRgKdxlS8CtVYEwvJvfagAK26bjC
	CWL2NtHOO0PK+VnVTMYSlliM3NCy8ByX0LstN17e/PvGK9R76e1N5WUMZ2NVT3wvyz6pO3R3z4J
	KIdD6oJcpb0QcXgkRrBh2Ke8tPqggl0SnZT+EhJa07yu6W+yUvbQZD7YgZ1VmKpy5L8BdE8zQyt
	XQMMeFeG/R1Xjcp6YQb21htl/bQutlgJx90bjEYF8SCohYtFJi1CcYXYJSft6mKMHHgP8K5/KPS
	OoxMYE8b2VN/ZDilJ5i0U3jdI9Xr3U394MwUuf3hewnF3HXTCp6X5seEdXAprVDQGsLdTj0jVGz
	c9Lc8EFc4JIjISqw3QWSkBWz0kLdqkyKLG5w=
X-Received: by 2002:a05:622a:181d:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-51c8b2613abmr73375151cf.0.1783621040369;
        Thu, 09 Jul 2026 11:17:20 -0700 (PDT)
X-Received: by 2002:a05:622a:181d:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-51c8b2613abmr73374791cf.0.1783621039927;
        Thu, 09 Jul 2026 11:17:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb30f98sm550971966b.55.2026.07.09.11.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 11:17:19 -0700 (PDT)
Message-ID: <11796dd7-11c8-45e3-8f9e-1dc27da0b229@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 20:17:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qJeP8R8ucgkZNq92ewpVbm1z-rCF6AF9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfX/URLSWTr3f7G
 XOXvTGrTMDOj1DuoXHAHzMOBTGSSjUcJizLSoUxi0G2Bz73wSJDz1bbM746uedK8/XvBbzNdEEu
 NC34ny/BCICEmdeIG6+3XeKhoIMH0Zo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfX+drTp+p04JDO
 Fq7GFPKj2+oMXGOOUzYlQ84NCEUFbjCNqBfGSzkxu/2PsgRth0LbW6ISzhOcLip0YcGvagtkiN8
 Bh8pEx16/y8spkjJzPdmRCaWpDIUwTOstiK1NWwToxLWIB5STTUh0/GfHQNJVfIykwsbo37fN8H
 gvO4HFC5RY0bo228HSrjYNqYnpIyNBZ8JEvDbeslNw8apFJle9kf0G+bn298kCPyxvJQwgP2JEn
 jUSBNzE5CtPhGtHZufQY39trBeXwJE9/MO5iCIpgCl3jwbYjs3gf5pHXxe4xc4VjpwBKIUZqaQO
 7gBaDvdWknPoUpkE94dYyAf9CAGNyBC5X7affPJjNeNgtjOZqkzzq3SzvRPaIO9qDu6RawCYC+8
 ZFJaw9APQBrtKuhzNye81gf/L3ermt7+RhgcwKOmqaTUpKIhBYDnUdZ6qsoQ5w6SyE7hyG9urqV
 bmCR8yJs+rrSAAkAzbg==
X-Proofpoint-GUID: qJeP8R8ucgkZNq92ewpVbm1z-rCF6AF9
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a4fe5b2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=HNkros0ZRfBbVPr8Po0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090179
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118078-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org,holtmann.org,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B0A5734303

On 7/9/26 11:18 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add node to enable Bluetooth support on the IPQ5018 platform.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 6f8004a22a1f..8c252fa3ff5b 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
>  			reg = <0x01937000 0x21000>;
>  		};
>  
> +		bluetooth: bluetooth@7000000 {
> +			compatible = "qcom,ipq5018-bt";
> +			reg = <0x07000000 0x58000>;
> +
> +			firmware-name = "qca/bt_fw_patch.mbn";

Hm, rethinking this, it must have ipq5018 somewhere in the name

Konrad

