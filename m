Return-Path: <linux-arm-msm+bounces-97920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHGoEg/lt2mzWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:10:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89916298815
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC533305DD43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FCF225403;
	Mon, 16 Mar 2026 11:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDIKhuKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9+UaOTH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB2526FD93
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659092; cv=none; b=khybpab/aybCDNAA3uG1egIleseqlbnNe8ThSuR9DYmAVn/KDq5vddwxtWLdTGbu2rv0S4IaqMvGhW2EgrH3hDo/qGW9QKaTYIK6MSwTM25dxN9R4m0/Twqm1ZDTNLC7uNOoLVxxG5T719oBcokpj+UNFO5KJ2comd31lH/6HWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659092; c=relaxed/simple;
	bh=esLUPOOWx2BE2RIaFwDSmG6sMCM1hS+EmMydfYN/tsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5zDs+UdTf6znSCahl0+I8bnWL7xhHhTkPfaKnwJM6/9ljufGhH7r99V9ef27UZT9qklrrzy3lyJSSUlBz7ztSix9ci/ifSgDmX+cfhNaVTpSxnmL/Wje2hjQwceBl/l9HFI55ohDLnAX+eKD/iMUASgn135Ke7pnUKkpHI3KYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDIKhuKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9+UaOTH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64eZS1282091
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XllX3Ebz4hppz9fzI1VP/5MLoDsPPNQg3TBzEGzGm8=; b=cDIKhuKbKcmjkPnj
	4BNlBxp8U49u3fT5ASTNQ7cvUI3DMFWh+ZQyg4wgV0bIHzFX4qz5vZ2D+dU3fa6c
	MnHm3RZx/YHLWHwvUL7wyc9rxqSpMae3t8Bgyvx1lOe2VHqRjhIB50l3BviFHZCT
	VlO4ECTTKXfy+d+9TUkLc6Ja0w1a3DrgWjN3cZ61A/5D0c9wLa7Mxw/ArkjAbEzk
	GOXofH9sxZvUonU9iP/MJcQprQb2tUkjsyd9LZPUJD+eR6oMHZmflCr/4TgkQEVU
	8Cs9uGV3dhfMpcw7tpjjyDYnpcXZAHAt9sNI24MqSlMWirJbCZREdUCYztRiudej
	RvR3GA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc58rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:04:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b04db6c138so20351565ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773659088; x=1774263888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7XllX3Ebz4hppz9fzI1VP/5MLoDsPPNQg3TBzEGzGm8=;
        b=P9+UaOTHmskQ/xyDq/9ucmJGG9Stk3G/vMGp+bNWq+v+o55zkuxUngB4+ja4sUg06r
         WMjmIU8wSpw4R9Bj553uf0z+JCdCOx3c4jNfalKbMgQ0Dx/N7MDWkb6PQdCZNT4j/IhZ
         qwG3S3tZzuQMY+9RXQjmtUPyUUk1PWJIkMDbmQmejDy/Hhepj2DyYRI7rQ11BEn5uvUY
         6TH5IZnrDA/YGbWXSVpuvzob2df9C+8sVUELdYSZjln7Ar3sezKtcpHMyAZeJZToelGE
         1zuhSJ4cDqDsL3Ak3xttq2tz3YEUmXSyhjv2Qvu7K9vidWUvN3HSGyK1mdjAiY3HBGMg
         evSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659088; x=1774263888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XllX3Ebz4hppz9fzI1VP/5MLoDsPPNQg3TBzEGzGm8=;
        b=ThUnLMhEIPNYEAc2cqt25fxTyNQfSewhP9fXTIUOg/6I/XiGm+pH/31LAyPHSSCn26
         K/O2vpiayy/uAHbOoyBnRozb5q5qkCX445+bVWr1jz81jJlW+R+UUHzNzBj6EAoToKdc
         RTFbs31r8lJBOaJW5W3E4tvUjB4/k7aBwuZvR7obPnWAk2MbiD+aqQ0ivDyqTlFkUeEr
         CDK7oyvtC774XH9j+WIh4RkPneTDlP8fsANDJzqKeRJtJCBw5ebMhw5U2zKUgCVueIkC
         XTKGm0PTo9mUHRC0VN8qw2hw45oZReQJz9b/3vm7fLSWsBLHVoVZhUlfcjpoNzKGlfSq
         YSAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5Fh1At1EDjPoZ0G1HyR7lelqgN8H6DV0UqCJ8/mLagE4Ryrx98sCp6JWJ/xsA9cmUqOhj1eiab0EBILti@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Z/CHI82H5kXNCRY+ZrSaBvnPxEJ13/S8uT2JbOOureYiDSg9
	+gTfFt6lvN0IZI5YkSHmrIYorp9wU99hOYC3K+yG0DcXu2iJDo+5JdjLvSIydGVlUzLvksDGJVK
	EyQ65qxGn2xd8RRClxCaD8/aMxfiIjQ1YYeeh5qhcdezEOcYY2HftejpQv+YGu4eYDdQr
X-Gm-Gg: ATEYQzzI1uzZ8Jw0TBuaZE5gcDRlxha/RQ2+C23Y/UWFJ2KiOABR/dufwCLIQE1oEYk
	5iTk0zNt5cNVkdd+nm8R4sXy7vuGbMDKdazotxY4pDwLH8TQgx66Rx4qxXS0M2PLZBIa5DattXL
	z4kISDUZZnW3zuz4jTX/Sgb61aHNeVJNVdwWQncamRA75jdc2g3th4r6Nat2f5zojykVaafc165
	jQaGFHhls1vkKkueBLNXRAGjbzcmU+WKsUhBHN+N05hdEGSLGzC/FTMrvaYiyg7e3HS1iewtef5
	ku/we7dOg/m2hIVpk9XdM6VChrdbhGZaW7uSrYCZLxHhDR7PyWgua0965dplezuV/LQS69BtBq3
	c8ny0kquTENyrp4Sm8hgS9bHfp6M2kPSnHxaK+GwMvJLxAWD1Z63e
X-Received: by 2002:a17:902:f60d:b0:2ae:5bee:f0fd with SMTP id d9443c01a7336-2aecac81c51mr139277525ad.51.1773659088518;
        Mon, 16 Mar 2026 04:04:48 -0700 (PDT)
X-Received: by 2002:a17:902:f60d:b0:2ae:5bee:f0fd with SMTP id d9443c01a7336-2aecac81c51mr139277275ad.51.1773659088059;
        Mon, 16 Mar 2026 04:04:48 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee1e3sm112165905ad.44.2026.03.16.04.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:04:47 -0700 (PDT)
Message-ID: <737eae95-1e86-4ee6-abec-5e313a18f078@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:34:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos: Add GX clock controller
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7e3d3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=fneQyfJuBaBqRE5tITMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: hZyK9WvNVboTi0nRVUrurNrLuWBTBi7q
X-Proofpoint-ORIG-GUID: hZyK9WvNVboTi0nRVUrurNrLuWBTBi7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4NCBTYWx0ZWRfX+6vivOGZcy3Y
 CkMWsvTwTc1f3hx2i5ueCrm5EeC3vN/6cjjj3WHNJNUY0mcgbduzvMzXM7nUV/wsUT4KxcQT1Iz
 Bp/DWZHqLLV9cR4XxuRq8IYPd0KZunUZ+9b4TNVbry0trbp5GVEwFX127554zkdSRr1uFS0/cSr
 6IuAJTViDGsQxf1Yv1zP24XrDt5eFh00pC9f36zZ//ZiQj/XEVC5jgScoVxis0MbOwcVyTftNc0
 Q5rekcs33FsxDTlnuDT1m+rmVtedkKViGQb1U8dZbZjwt/cN9b1BJoyPSVAKMvqsxJ44z/WuiKY
 grOVNFTxI//mPCjWHI7d6gYzxToFgVnnGqcT720qD0obXcxdO/qUjKFbWJcC44YWSGyH/nAidHL
 bG2GHLlVPPLj+dawhkCGxj+TVKBZDKZot4ZW1OKx4xuu/hQVZyRgEtpDgJfRUjcSIqQBAF7BVdU
 C0rEvWI1zCR89qRoT8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97920-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,3d64000:email,3d90000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89916298815
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/6/2026 7:18 PM, Luca Weiss wrote:
> Add a node for the GX clock controller, which provides a power domain to
> consumers.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index e1a51d43943f..621f05820826 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -1224,6 +1224,16 @@ lpass_ag_noc: interconnect@3c40000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		gxclkctl: clock-controller@3d64000 {
> +			compatible = "qcom,milos-gxclkctl";
> +			reg = <0x0 0x03d64000 0x0 0x6000>;
> +
> +			power-domains = <&rpmhpd RPMHPD_GFX>,
> +					<&gpucc GPU_CC_CX_GDSC>;
> +
> +			#power-domain-cells = <1>;
> +		};
> +


Reviewed-By: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh

>  		gpucc: clock-controller@3d90000 {
>  			compatible = "qcom,milos-gpucc";
>  			reg = <0x0 0x03d90000 0x0 0x9800>;
> 


