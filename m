Return-Path: <linux-arm-msm+bounces-93156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIIbJotflGnODAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:31:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FD514BFB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99FF1301778B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C52C341653;
	Tue, 17 Feb 2026 12:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpvQK+Mn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2vVqiyo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1E8340DB8
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771331428; cv=none; b=RsvjfE28O1aoVYok/bc8CZNaGKz3IWcDawFvcXovSZryrx2YTJEDu+yQjd6OPtE6LM9+1+sp0mazg1C5V5BB2JeNgtAmumkUgvCmfpVef/NVon7z8l+FHlBtDC9V8Zy7D5ejxa1ifClEcmWE02HHrY4f/cCSAAItnw8HgAjR+9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771331428; c=relaxed/simple;
	bh=iaOjQh6oj22SQAOvuDXoKCh79HvL3yEC6boAm8Sbarw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjkB9qt2EOZmngDWbfKA/CGBKGQ527SDSOx394RIX1o52WdIENvK/LmgMO+4HYQ6R/fX1dNc9WhS0T4PW/GW6V3QGoNFU7RoyF6HrNRwNf0hwSLNQaksz3IG5OWUtJxJTIJleerznEXjXkYuUquhNdULZCsOAq3Nm7lv3Ww65II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpvQK+Mn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2vVqiyo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H71aT73392808
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fXjw2GmP4lQdAtjniPE9MY2CqejpG7o6YmHO6qB4zSQ=; b=lpvQK+Mnpsr1OXoG
	gGSCb37+QAeYAHvYCzWdmMGX4kzOYeT4i9K1YtQRtonZvF6HNWv1bbdiiEmy+7WE
	ooIHyk0PLYeq1V1QnFCVODEJWJZm78gF6gqnlNkuP+3JcnGQomzqIytit5Qc93QQ
	Ft/3EQPgGIOHJgzSnzWEKk018nd+Vasq8hHWj9ZVjQC/Ao6RyrEN2zLTw+iGE5Si
	FiYGeXJUmEq+NOyitvYqdlvHRPxNbABIUoZfQbuUlTnoBhX4Ggowb8YcwHF+q2PK
	x1ZLfMGlXae+jwQhS1O0ChZcu/SM4zr0Ps1QhTUqog2mwpLfNwvl4J7STbrVvx14
	k3BQVA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5khah04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:30:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-896f5c90f07so42944576d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771331422; x=1771936222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fXjw2GmP4lQdAtjniPE9MY2CqejpG7o6YmHO6qB4zSQ=;
        b=Z2vVqiyoHhajwwzDyt0pnqGQJPBcZj/7BT4h6RCRlSuv+ylWc/ra8x6caw6b/rUR36
         ZSIB3YQhckYFm8SYEo473Y8TWoA8GLDKQ0NTFU35/kXshSMAOzHR5Opr7cFmNtbL9aXC
         mW94RLay4rYzMNBCftU99WOpuqjg1gTP7echJCcFi9RWWIBhGVtvin+cMJwjy+uTi7ii
         bCmb26SFyFpe19DnbPjeULs7AtGHk/G9bNzGsnzb+C23f3kyzkZumm37E5k7UojAS9M3
         aiIB1fUJasTzXLNA9y/CSsp13C1KIpjC4XWELxF87yQHXoOvJGfTDyP4ESUEtw6F6JI8
         5AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771331422; x=1771936222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXjw2GmP4lQdAtjniPE9MY2CqejpG7o6YmHO6qB4zSQ=;
        b=P+ZoqzNe643CfAJgmM95tWMPZdooBb3e8nR5ZlkEL8zA/TpVWj4pYjNO2Am3cJ0cf9
         qZUSjMZK/sIwG/7suBOcqQm0qV/knKkUsjiZ10Z6P0l9xr2yU8FHAFVB8ZjJtpR0efC0
         DzeskvUYqi55HIEjCVQWpFtGLDLrENYB7tomfYpH2V5rXWeY++nm5GBhQvkTH8ulYa3/
         9HAEe2uQF8G3qf1Pot4qf4Mq4G//u746nxaG5lIgLtpG5sC7567FuoFLcEdv8xihTemD
         53w5JJ2CX6USuwMuzKLkWYtaG7im0RGconZApzgpUMFiYd2cHLeBntULRdcXedJoiPK2
         qIjA==
X-Forwarded-Encrypted: i=1; AJvYcCWyeENiM7LQbVDS1MrMlfgEjPvhVfdJO/p0OkFsHGAlnfiTWAe7/tTHSIgJIL8GDor2j1tA9qgSVoHS3/5n@vger.kernel.org
X-Gm-Message-State: AOJu0YxUkfdf5p39cFQZkUYL1YzdjeKadHkHLU3/nNevoIo46LkRjvyg
	68fV6tuiRrl+qrjOBiTvhJd7mkLVlB6BoytR7jIdQBKtBz7ziVBmEq1TH7O5fC02JhYiRCDvXvH
	TTSaMqonxydAImYNLjoaEOYzpIizBb8e3ljsvukwI9WzXC8RDBbLoRcFYcla8mq2vtJcLBF4KBa
	PP
X-Gm-Gg: AZuq6aI8tjW9E710PjURkgMjtpVFyWJJ1BkG5WyZhFH9M4JEpanm5OFzo/5v7J+NkRY
	2CNqBqKId0vT0LbpeIS7PvAkgeHzfgxy9e8Afy5rz0/zLJsReAU1R1/eqDCLVQ1NF6Ppz1TJc2A
	mgiQ3U31Hphm9c+jU1vy2Xlf6uOHZPZe6ItpsHnqJcXZqSyaaQT/fOxdCImm3m9cakcDDSIkOqM
	yZ/+8RWZQw5K6RlefbaDTOzudJzBPMBRfG7mywaoFKhJ9gEajgvTx9jTdwqwAtcrdiPgYj9bb0N
	rDgxxT6oZSpRqS0imjJXCynvLUOPhp70+FbYi927BQ+FqF1+uG4x/b1n7//UPbPSC/J/69LrXED
	HJScho/a8ikoz+E2lsIJOyertDFLC2YvHI6rrxgh3Hd5wXfNMSi0ZnhegzBNeHXXBSKPoRO/2aa
	hQyq8=
X-Received: by 2002:a05:6214:4f03:b0:896:f9ed:be98 with SMTP id 6a1803df08f44-897347ce6f2mr139048326d6.5.1771331422411;
        Tue, 17 Feb 2026 04:30:22 -0800 (PST)
X-Received: by 2002:a05:6214:4f03:b0:896:f9ed:be98 with SMTP id 6a1803df08f44-897347ce6f2mr139047476d6.5.1771331421773;
        Tue, 17 Feb 2026 04:30:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735d66esm336267166b.4.2026.02.17.04.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:30:21 -0800 (PST)
Message-ID: <253ca948-07cd-4ded-8e15-619589f2d314@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:30:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco-pmics: Add PON power key
 and reset inputs
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260209-add_pwrkey_and_resin-v2-0-f944d87b9a93@oss.qualcomm.com>
 <20260209-add_pwrkey_and_resin-v2-3-f944d87b9a93@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209-add_pwrkey_and_resin-v2-3-f944d87b9a93@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=69945f5f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=1fdw4J3Q9qDLbzPSb8EA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 8T_krSQ4IZQgbtLfhr6_lKFwzqkrWXVA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwMyBTYWx0ZWRfX9NVPJJj2dsLF
 bt/R4qeubCiIzPlf7F8W2bJgZeXnKIRsUja6xLH38Nhr/hXQMKCYAVpLS2goFc10JWgNWrxZ2fF
 w+F0tlvVQdRTP+VMk1fS8iURMwpFXYxkbDNY6mtPdYhF8hhpb0Nv5dQWHI8BMyuaFRzlTommKgl
 yL0Vj6XiyuVUG75BAukT6aZYtDzOtsLKKT8aE+O1LgJaJthQJzdfpv5aMWD/1L4/Zw/K9FX1Hwv
 lPdODNfQa/DE2MeXBcOyPKQ14fDkZ/6wVSbAwWkDHs5azVufxsme+/6MGI3g3sHyAn+vm6pTE21
 jq4tl5sCZjMay7Z15GtPnHdNrqkFEvSIleOrcoUX/5MaOCFVdLHB/ENy4fqNxdF3etlFpHhufxi
 a7AyZZKOFRd9tWHK/lx1oRWm1huzxtRSzC9+Qy6VKHxoIF0TALW9nezWUrPPYfZuVk9vakZlPCH
 pSUeimBzfflwwDfncXw==
X-Proofpoint-ORIG-GUID: 8T_krSQ4IZQgbtLfhr6_lKFwzqkrWXVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170103
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
	TAGGED_FROM(0.00)[bounces-93156-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,sonymobile.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.4.176:email];
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
X-Rspamd-Queue-Id: E3FD514BFB6
X-Rspamd-Action: no action

On 2/9/26 2:23 PM, Rakesh Kota wrote:
> Add the Power On (PON) peripheral with power key and reset input
> support for the PMM8654AU PMIC on Monaco platforms.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> index e990d7367719beaa9e0cea87d9c183ae18c3ebc8..182c2339bb11af40275050a36c4688227e89497a 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> @@ -13,6 +13,26 @@ pmm8620au_0: pmic@0 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		pmm8654au_0_pon: pon@1200 {
> +			compatible = "qcom,pmm8654au-pon", "qcom,pmk8350-pon";
> +			reg = <0x1200>, <0x800>;
> +			reg-names = "hlos", "pbs";
> +
> +			pmm8654au_0_pon_pwrkey: pwrkey {
> +				compatible = "qcom,pmm8654au-pwrkey", "qcom,pmk8350-pwrkey";
> +				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
> +				linux,code = <KEY_POWER>;
> +				debounce = <15625>;
> +			};
> +
> +			pmm8654au_0_pon_resin: resin {
> +				compatible = "qcom,pmm8654au-resin", "qcom,pmk8350-resin";
> +				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
> +				linux,code = <KEY_VOLUMEDOWN>;
> +				debounce = <15625>;

FWIW we tend to disable RESIN by default, as it's not as ubiquitous as
the power key and only assign the keycode in board DT, since it may
commonly be reused for either of the volume keys (or something else
entirely)

Konrad

