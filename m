Return-Path: <linux-arm-msm+bounces-107906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCEfMmUXB2qQrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:53:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3DD54FF54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7849B3154BCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC0D47ECFF;
	Fri, 15 May 2026 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYTSawVv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XFTww+Zh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414AC47DFA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848030; cv=none; b=UUqJknfQSeUUNW3rDV4WGMWUXntcpf/UuByasR0wgXuT3bsCyJoRK8qoMPXBvCaFkwhLYX7FXCCl7acuq2H3rogPGEplMTDpdXFPrHy0CgNDT5qqzwQ0ivFG4khMuwwLRg8rTaVvqr2XWnNlocGSuSpQSvrSzjWFsxAMXiJMybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848030; c=relaxed/simple;
	bh=OqwsAITcYpQz/wSqoeywZPQG18Vmp5n67YNxhye2MQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PuI2/MYynsYNVdxiCeNKwxfQqFzYoURz1xRLpIk/Ta4SOSSAn/UoAdQDfSUEYzzAXIrwbPWlXclzhwsorv6efpKeQNK18xZfO4XxsPsPIP5f9BWajC86fi/oHpFQrSfU3/4/WoHzaEmMPzEtOqzNTbLA0vWHcV1oOqubLb5pkh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYTSawVv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFTww+Zh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FArv4M3671801
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PwUtDhTfzwCwRc1ghZb7/Ai7zYeJOhR4rLibL31qz70=; b=CYTSawVvqP2Vf0Z4
	y+thgS6QrXkcUlFvb5JLKccreitO4FzzZg8p3VGinCPwJSoCyBpxazAWzf9Ee7Pz
	eetSA6FTD3MEgCU5VACLWutVGfPWgxvFXr1690hTyxSs0Q0uxAaoAgC8hwKli3ui
	OkJluF7LBjeCxly2TltkMZMGZ3MdUhItBkNM8i/FIrCSERaxECx6fDDVjxiTiQLl
	Zw5SSMgZsZaYFk0LiQIbsB6za8GiCgTkzqJAhR//Stuhk8wKUgPmg+HvRIzneYs0
	wimzpRRtW/jPO8wzVbJI3hq2v0LOk4EGmCTZPGVCBt90p8Ik0XquDnJhx94m6XOs
	tyQ0Jw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s39an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:27:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c829586e894so3260390a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778848028; x=1779452828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PwUtDhTfzwCwRc1ghZb7/Ai7zYeJOhR4rLibL31qz70=;
        b=XFTww+Zh9ySCDlsoZaTG9YlzljK1kL5p8WX+Fv0DjiLzPss55FmxVWP+WyAk/meM9G
         NHlLVqIbEAYt3C3L51V5Hd3NKFivWgVIFkzRXiSpsgW80GQYWCYZyR6cRm0nnXMijZmT
         9JGmZidA4Iwp5LhsxgMMf3XruOCRbu+jHHxjdC1yYyVWWEPpDiBSheRJD40w6tZuKujh
         PgT2lPD3txSB5uJvJQ4nP7QLno624IBq1KxwohFE8BreAmTB1EAJiFzLPU3Zp2tb1C82
         kDa0v3sFCaS8TXFzrr+gBqzqNh0Bb9O9C/Thmj7uSXWrTMGWEzbolPyObOyhRRc/ZUE6
         xb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848028; x=1779452828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PwUtDhTfzwCwRc1ghZb7/Ai7zYeJOhR4rLibL31qz70=;
        b=jM2gVwlKA83mPab2buOn+0wLdwPOL84vzAZmv0k/7s7H1WrUoSVDGnxWWWO7sGbKhN
         lrLVvVcQpkz6E4uuq4fUaR1M3qsHw9/iCBJ+vVByy0gpRRxfES9tuaJGMa5KVgFYSxtt
         JwqoKzMtQELwY8UV4S7+QothkAkkxgNHuJzwZWGR8dhpG8LgT5LoL3AcxPHlx1bqq9DA
         e+4sOutNVWFADN38FGusTUJgnXCwT7XzN5i0UcbmnJQYOdeoKYYK2GNL/pg6mi5XLz+z
         vRvetQ/FfPPOJr0U/s45bb3Vai0Il9tq0jZqK6yhGfHjyAY1n7mpqB4PdT1agBSQ04x1
         vW7A==
X-Gm-Message-State: AOJu0YxLFKPTOWCwQXSjhX4+gKgt0LhjBPHUIukoohs7RD5ApmA90dU5
	fxsvH5bnT+AYIZpV3pTnpI+UNnHmcfF+RRU//nbc80t6S5KO+j5Jy2UaBPXL6YrPJWa4nFXyauM
	ElEIHmScKdDMuZf+sWW/ts0k/PL1Yd91TtHmTzxf4Xhy5biKpAh7D+Vu5ESol/F4Wx64jUkCnmp
	Ze
X-Gm-Gg: Acq92OH6pZPYpESE+y2btWST/Gq464kzX/1LECNhEA+9aX2BPbobQkXiyFKzLq9zg0T
	dmlr3dAb5t1xbCSrxGhg18J3pNRCNvdzKOiEKpWQ6kAbp1ymcegpYI88KUGliehborvrUxy6Crw
	j1RxydC1cdLr++k1sDQ2M7xw5V1TZOjDH/vUMuYapsJ7TQ//K/xNFFSngIcwoYNgSQWbsEXBsYO
	RxzUCB4rr+B4roniYh71Jl7gKoIg0TB4G9fkjIZrj9R3YqqmRx2MhzQZx/lMG7eAdmSNiw2JDvq
	++YtWrmuXLYtra24kU5FgHwt2h/ojJAdMShm8ollx8ff4XgnlWXFAoJi0enI/O25yN+pUvTn5xd
	aD0Kmcek2KKefo17eDJh1ViFh6lRWHRqBg4WGJghNN86r2bCsSI/iZsNnxpbmlvJbHytiTUhwfD
	M/C9W3an8BSWjZoS16x7pepAarVNT5Uv+t4bcZoFo9
X-Received: by 2002:a05:6a20:7491:b0:39b:f026:6f8d with SMTP id adf61e73a8af0-3b22edb93damr4340165637.43.1778848027738;
        Fri, 15 May 2026 05:27:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:7491:b0:39b:f026:6f8d with SMTP id adf61e73a8af0-3b22edb93damr4340127637.43.1778848027241;
        Fri, 15 May 2026 05:27:07 -0700 (PDT)
Received: from [10.190.200.212] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb121ccasm5188482a12.29.2026.05.15.05.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:27:06 -0700 (PDT)
Message-ID: <d5ecede4-a5fb-4721-ab5e-53950ee5f822@oss.qualcomm.com>
Date: Fri, 15 May 2026 17:57:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: dma: qcom,gpi: Document the Eliza GPI DMA
 engine
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260515-eliza-gpi-dma-v2-1-1255b43d5ca9@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-gpi-dma-v2-1-1255b43d5ca9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyNiBTYWx0ZWRfXw2+kK35ZqZdV
 fcwHE0Af8LkAUvuJZK9MF8op9zxpt0y5d4KWYdNTq4XDr0St7RB4LXazrd1J2S956fMICM/FM6r
 6cK6eNryMlRZ65r6rY4Di6bJIs4I6R+54LhFnPUp77FQzSdRFMLHeO+U2ZWAaBl6Qqc6XM2rgon
 CzHWjDxG2JBEr6fRpNt9Blomeey7feNqLNjb7Dnsz4d4w4MYmeLIyN4aqmqHRPqvHoGk8H7xjh5
 FNGoVaFgPcf4o08QLrSpmu4zJphCxMpJwJRcTE3A49HVAfpML3h4rds/gsMZItlTY99yuJ550xT
 veA6ihVPYgvB5RrVX0AZUxAmFYZJKu5kB8+NVjEgwM9RaGHv7tDdCakxtMnE0UgjWfXO6pe3xIa
 p/YEKiybpaeoDTTGYJgnGA1EogYf+IJR2fwB59oS/fkqd0z7XAM5eVqxOfaboYXEBIx/NajWX08
 1+L32zPAcw0kDxmVp7A==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a07111c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=JINMlsxC23q2cYMMw6sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 2MEQCld0Uo7kgk49XfoywjjKbKuIjsPf
X-Proofpoint-ORIG-GUID: 2MEQCld0Uo7kgk49XfoywjjKbKuIjsPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150126
X-Rspamd-Queue-Id: 1F3DD54FF54
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107906-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/2026 5:09 PM, Abel Vesa wrote:
> Document the GPI DMA engine found on the Eliza SoC.
> 
> It is fully compatible with the GPI DMA engine found on SM6350,
> thus using qcom,sm6350-gpi-dma as fallback compatible.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v2:
> - Re-worded the commit message to mention the compatibility with SM6350.
> - Picked up Krzysztof's A-b tag.
> - Link to v1: https://patch.msgid.link/20260513-eliza-gpi-dma-v1-1-d8e37f026c36@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index fde1df035ad1..d40b0a8dc9e8 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -24,6 +24,7 @@ properties:
>            - qcom,sm6350-gpi-dma
>        - items:
>            - enum:
> +              - qcom,eliza-gpi-dma
>                - qcom,glymur-gpi-dma
>                - qcom,kaanapali-gpi-dma
>                - qcom,milos-gpi-dma
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260513-eliza-gpi-dma-6b5341271f09
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> 

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>


