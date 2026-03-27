Return-Path: <linux-arm-msm+bounces-100241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFrJITJUxmkkIwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:56:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 007E73420FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CC1D3037C27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C5B3DCD86;
	Fri, 27 Mar 2026 09:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbpdgKcB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2bhHUbZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEE841C72
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605215; cv=none; b=hNQ8AEJa3CqtVcGxGV/Gseqf9UanAalGUtS6QhIksd+TVG+VQbZ/db5jbI9ACZYP/7U0UduL3W4f4hYfUkW2UaIbrAPIUrNQYT76wfo0UVwTaZL4A4EmG2bnm7LRSrdPLdKKaesDBcvLkq5XzaeLABmQfbaaDcktl/OnbMekdco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605215; c=relaxed/simple;
	bh=w9yGN9eOdO/zZzCn0k+SkHWxKOFhuqlmn8DxCGQDCSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AuN8BLkBwfEOA7yiPpAJsOgbz6B9U9C2Gc20pL7CYmsM/npqlxIwn/uMFEHwP3PXv5G+L9r4IsR/h/SDQCFHC50aW3R7xvTnDAV5oe/vaK6LtKdQbQNhKhR/6csKZEBFB9awxCTO3fLMu6bKdA+OKBQg9zhocC2bF37sbhFlVZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbpdgKcB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j2bhHUbZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w3gw1860225
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/4gT/2rWXHww0QKQkK3XZUIoiyOOi23za8HLH2oOac=; b=bbpdgKcBPdpNuwSV
	qtGd6seI0rhngb1lywnccB0bJsPkm8RwrI2WuOm/oSqq0wZWfN7LOshp0HAVphac
	orgsKZT/m4lu8qG0NcFpI/f9RogXk0ZeFTs6x/3h7btUWQv/mDcddCCgOevd+9Lk
	WortiBgc70EgLSVwpdzLxHOdlliv/O4mPdNchyhCOyIQ90Elp0bLIzgZ/F6CnaAJ
	pTVFHl4NCPcF0AWBoQMqox+Y8iBVLX56g7d/Vdb9jSuM6lXwlIl2sBNyvaawKYvx
	3y5uiZ5HUqqDLw2+wojwjzx1t5P8jScbPjwhCBrOhc1WqPot/dJPHCGab4YqvnYP
	QPY2Jw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv2fwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:53:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cbeb95521so5539096d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774605211; x=1775210011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/4gT/2rWXHww0QKQkK3XZUIoiyOOi23za8HLH2oOac=;
        b=j2bhHUbZVNA9U0IsTG/K1/BaVneRtPChKWIxe8eMeX+FgAonUUuRJUg0obN0moaEkg
         AarmdS2NZ9jtL3KLEXDwXAH6RM3U/sfP3t6QhON4Nl0nq3lAMAWpVIpn/O2GzhgPXRLl
         TlQlAniURW0iyZxnfeF9dK7I9Ss5w8/kUr4mXqkrcVKoJRuuwZ6v1NzqT1hBc4nJ0kf/
         oBN7R+KfTWaTVX9n/hYMQpCV4gI9Fhh7sAaFp36QBdI2Rms/EGPyyr2sPLAcpRjdaFP6
         /ujbn6l+UsyahqHkJQY1acPidI7d/SB3CvZBXG3SVoXuZdbhiL+yY2Xb3HzrWax5dTfw
         jIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774605211; x=1775210011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/4gT/2rWXHww0QKQkK3XZUIoiyOOi23za8HLH2oOac=;
        b=kxr/UppTdsNrWdiV/6FuSvo8+EwGPoUYOU3JLaHexBek7J1d8QUG/connNoW5mEG62
         NcqX4EFnT29vUh8BmZGag0ygNafIcvsg5Bfr2xwINg2vFUddEqzI9GGr0BKStl6MoujK
         Q/msoUth+i+JBI3O4ZLtlKSU8ALUcXF4FVNGrd0EdzteXyb69J0mowc3GBHPHMc39Mtn
         Lp7jFlJSjDSZs1czIsaoZO2zTvM/vP8UXw71L38JPI1YySAXeStskYS5HHnloXYiejsJ
         +QUEj2fQNeVZ/A8UUtg1OytpJ8O1Pvggu+XGsmgfLbs27OP55s6jNbWpN4mOpOgNqYXq
         bvYA==
X-Forwarded-Encrypted: i=1; AJvYcCUx83N4eIy3gR51ta3qigQ5U/M6rqGHOvbZ+DSe5v1gd9SFDngI7OihYg7qdRGpUPTPHfJ4p4m0T/nlL+Lr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6QpQQkcd/YXZWj33OKKyHiqkopjhmSMSJCXX6qzfmTJ34XKpD
	oTQvOXxIfFDzhtYsgy7w9J5YqZFmXW2Mr6PS8snpwfYb2sz04Wqbad/VQQobtx6FBD88vCR3Z75
	jNDZrIEHOs2wTCrxhqlMpwS3N9IBAKhHUvKyckilGpA2am2y613u8mhtb17vRPLbp2FJx
X-Gm-Gg: ATEYQzzBgQ6/OFh/u2oTbJOGz5gdm0sfXv1DlmBVoyLjKrmBX8PCHOpo6uyl9uEJSOA
	xyLejVyFUrNOdM0sTDeVCe4CW2QbnmvtjGg1tvIxSAVDD1e00Jv0N1npGaGLfzANyQQIqpeLUQ5
	/0Rcyr9Sghtg42n5LYapiQIw2pZWVasffioMZFw5qRqGnKLC2oiC0Og34VfIv3KX+vrUvbQpkBz
	eH5TGA85OMGPxeCsvc04DypgE3swnIGfE4dQVaMfbxpY5DwWEUZKvEZaKWBXUiGRTp99kLiQ4Ps
	L3iEm68mj05p5Ry21iQRh7Rai/lZEC37K42suitiKOo/5mWaDeegsvmrgrha8ABOyFQMgtz6Uc6
	qccnJeKAGH8T5svYo+3OS+UoNmwurU5AoPNXJ+9a1s3nkAWyJQzpwDiA/LmlzL8lxf7b7Q8dFPh
	FPAO0=
X-Received: by 2002:a05:6214:5191:b0:89a:595c:b805 with SMTP id 6a1803df08f44-89ce8e664e1mr15408936d6.6.1774605210946;
        Fri, 27 Mar 2026 02:53:30 -0700 (PDT)
X-Received: by 2002:a05:6214:5191:b0:89a:595c:b805 with SMTP id 6a1803df08f44-89ce8e664e1mr15408846d6.6.1774605210547;
        Fri, 27 Mar 2026 02:53:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20267436sm212160766b.26.2026.03.27.02.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:53:29 -0700 (PDT)
Message-ID: <bb03901e-5054-44cf-a150-6c7d5ee0f78a@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:53:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
 <20260326-knp-soccp-dt-v1-2-a60c2ae36e9b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-knp-soccp-dt-v1-2-a60c2ae36e9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c6539b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PpLJpvi--JZafMB94bwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: yX5WmPTOKi2uU9_L6qz0KQ5r3Q6ia7LG
X-Proofpoint-GUID: yX5WmPTOKi2uU9_L6qz0KQ5r3Q6ia7LG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MiBTYWx0ZWRfX/VkIgwy+S7Am
 6FMGvlCMENOFXy7N80gZeT4XiBzYNqOESglzbstCKb9IH7mxIMUK0YFq7KMrjruq8/x5h0MqzZl
 QZyomEerxRsKaWoTDdcOkstCh6H3G8H896hQsgVICDX0D4Sk7glICGqhWjq/JaPfKtZYipbSsjz
 F6ZYbPeThGsUIs1Zzl7h/lsb0EYlSUHPoC/uZmyGjar5YIqZ+0ExKo1ctShIztGxho7mTo9dvUD
 HAWm9mABx3NEnoaRb836ri8aqs90EV1f/CF89CGL8L0jKlnViLA9Ive/BUTmuq3R6+wedduuIgH
 tVYO3B6S/j0bjIDSsMCulvsscc9KOS0wsWaHowcg09SeaKAqR3qAX6Qf8V/ZwZArOtQKPXyvPsP
 KDQ6ujDx0L2JCuuVM2gDUXFOqbSjLvUjfM2fObnbncxV1/71GJk65RJ5UlG9zH9SRYmMSY6848P
 1OZYmMheMTDwdxi8nBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-100241-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 007E73420FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 4:20 AM, Jingyi Wang wrote:
> Add SoCCP node on Kaanapali QRD board.

This is really more of an "add firmware path"

> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> index da0e8f9091c3..6a7eb7f4050a 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> @@ -781,6 +781,11 @@ &remoteproc_cdsp {
>  	status = "okay";
>  };
>  
> +&remoteproc_soccp {
> +	firmware-name = "qcom/kaanapali/soccp.mbn",
> +			"qcom/kaanapali/soccp_dtb.mbn";

Given that this contains battmgr now, can MTP and QRD use the same
firmware?

Konrad

