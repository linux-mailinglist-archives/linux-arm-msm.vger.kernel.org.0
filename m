Return-Path: <linux-arm-msm+bounces-113958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VKRhBooBOWo0lQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:34:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9890A6AE452
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:34:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OtUjeRPR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bn8wHpyM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113958-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113958-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 11C4C300A483
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3B639BFF8;
	Mon, 22 Jun 2026 09:34:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF6E39A4A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 09:33:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120840; cv=none; b=GJ46Z/18tz+kccoAMR3L2D/bwGpkJNNubWdkjQ3tfg9tWgvvNKZze3KqlkeuMpHLtWIndUenxh4DGroW4udtjTJgXC07Cqcvq78mrNOY/9V+zZJ4k4ExRJYdUC1UdNgFG9gVkhI1Sc9FQfGl8P94PebmKyPNYEwm0GN0iBPJNro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120840; c=relaxed/simple;
	bh=0iGkx5cwZg7ESD/ve9ZgPq335l/pOYBudqpoC72Vk8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoZII2vHCqxggakYZTYDoVcpeCx39AQ9hEC97VvAuckRxXA+ml2bnlTBvKXWuymJR1zu+lST2bY+/6xv5yv5Z1AWq2IysnVZh5K4qSc9fvvSU/+wxbTjpCFPwSMij+P4jVCgjW4q5RsNuDf7EjBsrnjbV8nnybz6rCtYXVwQf2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtUjeRPR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bn8wHpyM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59H0n3800695
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 09:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bYutGgsfO2AN1trsSrxGaYnXS03MJi3F08rSkRm1PWk=; b=OtUjeRPR8VNetq7W
	YmycshRN3TdLLy+vKtg7/eoRbgn7FzhbshagB8geZRZcwCHeGoKa2iWqDv0BKl7c
	31EdLyTCjMnks4xCf6Y65Z03aN8Oqp6uXOGbdzVJYsN7gNbuH2+i5cLF/+zsF4cl
	7XJw7I2dbS0hIz7poR7KxABLtWO1dEWW+qsFi+F3qsxmoMkXPEcZ0LTBxnwCv/Iv
	A5haOm/a9I6hoqgxTithxBSWknn5Mm6pwIG+dM7FRmzvET5+f5HD940vuwbzi/51
	hCZGzqet65hekVjYVlZ1QLHu12gT/6Le9WXMWFmTjCk2lRoHPTOfY82SF80vgEVz
	lNB0wQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k5prh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 09:33:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51968526a68so10894911cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 02:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782120837; x=1782725637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bYutGgsfO2AN1trsSrxGaYnXS03MJi3F08rSkRm1PWk=;
        b=bn8wHpyM7ZZeNIKOqMCh5h2vIQnMayGmcPTyCCv02QtCoc6HZdwLyp5QdrJPQK3ueY
         PweteTzRHUYNBIOZzdyAcMv4jL7FoQ1H/iCFeqlPe1b4FJXYnuRlI+HuDH/526iHdlJM
         clxsn2VORGM4QKEyr8D/FDDZbL4R5QjJzoMGfzdG377VPMfPiEBZzfuJTs33lpYv6wul
         hVed696laXm1vlbAt0ne7fqrBQwTP/cairBCpKMXJCF58GsHcIPpetZXAfozsWidH9FW
         o1HZSbf7ENRNlXW/s5NsfHALpppGP0PkCdw2OtR6UBlJhctnOW0610xFfq8FfkgnQaY+
         eRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782120837; x=1782725637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYutGgsfO2AN1trsSrxGaYnXS03MJi3F08rSkRm1PWk=;
        b=iDrTNKOJ4XxTIeLOYNXk5/Y4UbDGI+PbLWVuVez3ViiupDVkfck9dOmvtsfDt3iqBA
         ZBKbxTUuzblBoCMhmuuwDY6VcdY1nIheIOdPXOv5YW2scfz/fy3+VGD7rrb9L6JSShBZ
         5obFxDOyT5nYnjmWMH5uANOHuuWkoypctBdaWIGD+nW/SWySLhErw3ndcGQ1DOLWHm36
         pSbVWKa4npqWhzJ3WbDOQCkvxF8AG99P0IFVSmdaXXEaibK/y/uzoNJPBeav0LxTp8QC
         COwRyNsEMrF7aLHf1N5q69ko0wcq9b3HP/97vq0GuZaXj4jxrRSprgyB6NR2ho/Wb054
         zNTQ==
X-Gm-Message-State: AOJu0YzOYYu0CxySUJvgGCfaGptiLgUlW6ctRKgboHqBL3eVannPmad2
	fBO+221iiRYAAE7jt5uDWfvJKTrWB63YDZzdKsvRXrCfNbLEjVORlnOlRZtEIDDEAqTjPbGC7mh
	D7Rf+ilQN7XHXwBWn+dBis0wR5jKILI9DZzhmDJbwmiQVj/LrotXLuoCJzLmnIkz/Jzlx
X-Gm-Gg: AfdE7ckKb9Wn7Wknamd6VfMiPOtYhQfkCSJzU8+5vPQJo128JkHR2pnBtKfOEbRraC/
	ndTm/FuQo6FnocriD6WdQj/gbCp6sOib12CTbn5ELSK/RamaN4baXO4k6dbeULk2xTFIe3wR7Nb
	t+gi5YEgO5/gRYC4eEUbodl1knrXz6cj6axkfG9/WOXcrp1ebYAM2BCn+rOq+kFVOgMAizwMt7X
	vM9pLZocZC9Xw89JxjUJR0g3j4yQ0vsIMBDykn/5QZQjMczELQLzkocRRnNCUUSeCPSNIC+alUn
	HBFuFnGkPnuAKuIkIqPjyu8OieGS7PnC/Sw2Ba7tKsFY+Ij1LJabV+oq1l/oDu1g6fqzlWmNbHu
	UbAdV+Uqt63ot5GpTw+mtAkT/sQE1ItrLhME=
X-Received: by 2002:a05:620a:27d5:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9208d5f227fmr1213621285a.7.1782120837092;
        Mon, 22 Jun 2026 02:33:57 -0700 (PDT)
X-Received: by 2002:a05:620a:27d5:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9208d5f227fmr1213618385a.7.1782120836583;
        Mon, 22 Jun 2026 02:33:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e48ddsm333515466b.50.2026.06.22.02.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 02:33:55 -0700 (PDT)
Message-ID: <32948426-7148-424e-91be-0a313aa8e0d3@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 11:33:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
 <20260620-glymur-send-v1-2-fc4a2cfd107c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260620-glymur-send-v1-2-fc4a2cfd107c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W71nxzL7g7pz2hRfGPwEvJnNHtPmGwfz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5NCBTYWx0ZWRfXxQXTiU9u3x27
 FSlMhrhwr3CkuGXgjhaqsXJaSlcaYopAdITwMul7zKA31jBPE+Fd+8pP7JIpl4DhdQsLZdi/mKz
 OfAbuqr4B8723+QOEIW0jukuR24vOWA=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a390186 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=cH6R9-kdAAAA:8 a=2HuRI5RJ3cZe6tb9nYkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5NCBTYWx0ZWRfXxht8ZusgpUMe
 UrM4C1z3e+5dQut0ToC1iMK3X+0RcCJHQoO6w1NWHiwUEd/G9H/hNS06e/X8CR/Cy7D9DuB8n+U
 bKkDx52Rp/wLOkkUVKDQLXhMoahkg2eXDJ4ry3TRPwFzfjU/RAJM0byV22yTM1Y3B5oJUOq+v18
 OtF0npuaF9y7yw6o8mFYKqCJRsY4HEHaqmVKq0B9n70iH0GoNksYRCDjUJOj8ZRDTd+IGcXv57k
 CDHs3RNcqpw+nTMfsnu/ep/rm4tCtkPYK7e8FcP0OG0CmhTVtFO3puQU1sMjkgIguNvjr+CTSYY
 f55Hj4rIdRud3IDJFpJedA9H6+34aom9AyGB42fZsMqRU20O2MF28Sw+AN+vfmawwmflK3fLv7C
 yiFSPRsdKjjZUUnPFpxRrv3cxog1bjnS5sBioIwPG1QZckyYx8AJjYKIUmEw+j7781blFXJkJJh
 lryrY3zvpml+XUPw6yA==
X-Proofpoint-ORIG-GUID: W71nxzL7g7pz2hRfGPwEvJnNHtPmGwfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113958-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:jason.pettit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9890A6AE452

On 6/21/26 6:50 AM, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> 
>   - internal eDP panel (samsung,atna33xc20)
>   - 2x USB Type-C with DisplayPort alt-mode and USB
>   - chassis HDMI output
>   - chassis USB-A host port (usb_mp multiport controller)
>   - internal eUSB2 host with the Elan fingerprint reader
>   - NVMe SSD on PCIe5
>   - Wi-Fi and Bluetooth
>   - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>   - Adreno GPU and GMU (Freedreno GL on Mesa)
>   - audio playback and capture

[...]

> +		/* Left side display-adjacent port */
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_0_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		/* Left side user-adjacent port */

"left/right side port?"

https://support.hp.com/pl-pl/document/ish_14499364-14499440-16

[...]

> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pmh0101-rpmh-regulators";
> +		qcom,pmic-id = "B_E0";
> +
> +		vreg_l1b_e0_1p8: ldo1 {

I find these voltage suffixes not very useful (although you're free to
keep them if you prefer)

[...]

> +&i2c0 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	keyboard@3a {
> +		compatible = "hid-over-i2c";
> +		reg = <0x3a>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&kybd_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +
> +	touchpad@2c {
> +		compatible = "hid-over-i2c";
> +		reg = <0x2c>;

Let's sort these nodes by address (i.e. touchpad@2c < keyboard@3a)

Konrad

